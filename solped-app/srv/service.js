const cds = require('@sap/cds');
const axios = require('axios');

const BASE_URL = process.env.SAP_BASE_URL;
const SAP_CLIENT = process.env.SAP_CLIENT;
const SAP_PASS = process.env.SAP_PASS;
const SAP_USER = process.env.SAP_USER;

// Log temporal para verificar variables
console.log('BASE_URL:', BASE_URL);
console.log('SAP_CLIENT:', SAP_CLIENT);
console.log('SAP_USER:', SAP_USER);
console.log('SAP_PASS:', SAP_PASS ? '***' : 'VACÍO');

// Cabeceras comunes Basic Auth
const authHeader = {
    auth: {
        username: SAP_USER,
        password: SAP_PASS
    },
    headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'sap-client': SAP_CLIENT,
        'sap-language': 'es'
    }
};

// ─── Obtener CSRF Token (obligatorio para POST en APIs SAP OData) ───
async function getCsrfToken(url) {

    const response = await axios.get(url, {...authHeader, headers: { ...authHeader.headers, 'X-CSRF-Token': 'Fetch' } } );

    const token = response.headers['x-csrf-token'];

    return {
        token: token,
        cookies: response.headers['set-cookie']
    };
}


module.exports = cds.service.impl(async function (srv) {

    // ─────────────────────────────────────────────────────────────
    // ACCIÓN PRINCIPAL: Crear SOLPED + Adjuntar ficheros en serie
    // ─────────────────────────────────────────────────────────────
    srv.on('crearSolpedConAdjuntos', async (req) => {
        const {
            PurchaseRequisitionType,
            PurReqnDescription,
            PurReqnDoOnlyValidation,
            PurchaseRequisitionItemText,
            Material,
            MaterialGroup,
            RequestedQuantity,
            BaseUnit,
            Plant,
            SupplyingPlant,
            DeliveryDate,
            PurchasingGroup,
            PurchasingOrganization,
            RequisitionerName,
            PurchaseRequisitionPrice,
            AccountAssignmentCategory,
            PurReqnItemCurrency,
            adjuntos
        } = req.data;

        try {

            // ── PASO 1: Obtener CSRF Token para API1 ── 
            const api1BaseUrl = `${BASE_URL}/sap/opu/odata/sap/zapi_purchasereq_process_srv`;

            console.log('api1BaseUrl:', api1BaseUrl); 

            const { token: csrfToken1, cookies: cookies1 } = await getCsrfToken(`${api1BaseUrl}/?$format=xml`);

            console.log('esperando el response...');
    
            console.log('Token obtenido:', csrfToken1);
            
            // ── PASO 2: Crear la SOLPED (API 1) ──
            const solpedPayload = {
                PurchaseRequisitionType,
                PurReqnDescription,
                PurReqnDoOnlyValidation,
                to_PurchaseReqnItem: [
                    {
                        PurchaseRequisitionItemText,
                        AccountAssignmentCategory,
                        MaterialGroup,
                        Material,
                        RequestedQuantity: RequestedQuantity.toString(),
                        BaseUnit,
                        Plant,
                        SupplyingPlant,
                        DeliveryDate: DeliveryDate? `/Date(${new Date(DeliveryDate).getTime()})/`: null,
                        PurchasingGroup,
                        PurchasingOrganization,
                        RequisitionerName,
                        PurchaseRequisitionPrice,
                        PurReqnItemCurrency,
                        to_PurchaseReqnAcctAssgmt: [ { } ]
                    }
                ]
            };
            console.log('solpedPayload:', solpedPayload);
            
            const api1Response = await axios.post(`${api1BaseUrl}/A_PurchaseRequisitionHeader`,
                solpedPayload,
                {
                    ...authHeader,
                    headers: {
                        ...authHeader.headers,
                        'x-csrf-token': csrfToken1,
                        'Cookie': cookies1 ? cookies1.join(';') : ''
                    }
                }
            );

            // ── PASO 3: Obtener el ID de la SOLPED creada ──
            const purchaseRequisition = api1Response.data?.d?.PurchaseRequisition;

            if (!purchaseRequisition) {
                return req.error(500, 'No se obtuvo el ID de la SOLPED de la API 1');
            }

            console.log(`✅ SOLPED creada: ${purchaseRequisition}`);

            // ── PASO 4: Adjuntar ficheros si los hay (API 2) ──
            if (adjuntos && adjuntos.length > 0) {

                const api2BaseUrl = `${BASE_URL}/sap/opu/odata/sap/ZMM_API_SOLPED_ATTACH_SRV`;
                const { token: csrfToken2, cookies: cookies2 } = await getCsrfToken(`${api2BaseUrl}/ZA_SOLPED_HEADER`);

                for (const adjunto of adjuntos) {
                    const attachPayload = {
                        SolicitudId: purchaseRequisition,
                        to_Attachments: [
                            {
                                SolicitudId: purchaseRequisition,
                                MimeType: adjunto.MimeType,
                                FileName: adjunto.FileName,
                                ContentBase64: adjunto.ContentBase64
                            }
                        ]
                    };

                    await axios.post(`${api2BaseUrl}/ZA_SOLPED_HEADER`,
                        attachPayload,
                        {
                            ...authHeader,
                            headers: {
                                ...authHeader.headers,
                                'x-csrf-token': csrfToken2,
                                'Cookie': cookies2 ? cookies2.join(';') : ''
                            }
                        }
                    );

                    console.log(`✅ Fichero adjuntado: ${adjunto.FileName}`);
                }
            }

            // ── PASO 5: Devolver respuesta al cliente ──
            return {
                PurchaseRequisition: purchaseRequisition,
                status: 'OK',
                mensaje: `SOLPED ${purchaseRequisition} creada correctamente con ${adjuntos?.length ?? 0} adjunto(s)`
            };

        } catch (err) {
            console.error('❌ Error:', err.response?.data || err.message);
            return req.error(500, err.response?.data?.error?.message?.value || err.message);
        }
    });

});