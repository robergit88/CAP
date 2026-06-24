using {solped_create as API1} from './external/solped_create';
using {solped_attach as API2} from './external/solped_attach';

service SolpedService {

    // ─── Acción principal: crea la SOLPED y adjunta ficheros en serie ───

    action crearSolpedConAdjuntos(
                                  // Cabecera de la SOLPED
                                  PurchaseRequisitionType: String(4),
                                  PurReqnDescription: String(40),
                                  PurReqnDoOnlyValidation: Boolean,

                                  // Posición de la SOLPED
                                  PurchaseRequisitionItemText: String(40),
                                  Material: String(40),
                                  MaterialGroup: String(9),
                                  RequestedQuantity: Decimal(13, 3),
                                  BaseUnit: String(3),
                                  Plant: String(4),
                                  SupplyingPlant: String(4),
                                  DeliveryDate: Date,
                                  PurchasingGroup: String(3),
                                  PurchasingOrganization: String(4),
                                  PurchaseRequisitionPrice: Decimal(12, 3),
                                  RequisitionerName: String(12),
                                  AccountAssignmentCategory: String(1),
                                  PurReqnItemCurrency: String(5),

                                  // Imputación contable
                                  CostCenter: String(10),
                                  GLAccount: String(10),
                                  WBSElement: String(24),

                                  // Adjuntos (array de ficheros)
                                  adjuntos: array of {
        FileName            : String(255);
        MimeType            : String(128);
        ContentBase64       : String;
    }

    )  returns {
        PurchaseRequisition : String(10); // ID SOLPED creada
        status              : String(20); // OK / ERROR
        mensaje             : String(255);
    };

    // ─── Acción auxiliar: solo adjuntar ficheros a una SOLPED existente ───

    action adjuntarFicheros(PurchaseRequisition: String(10),
                            adjuntos: array of {
        FileName      : String(255);
        MimeType      : String(128);
        ContentBase64 : String;
    }) returns {
        status        : String(20);
        mensaje       : String(255);
    };

}
