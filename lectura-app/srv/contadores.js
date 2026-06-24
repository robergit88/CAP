
const cds = require('@sap/cds')

module.exports = cds.service.impl(async function () {

    const external = await cds.connect.to('CONTADORES')

    this.on('READ', 'Contadores', async (req) => {

        const result = await external.send({
            method: 'GET',
            path: "/ZI_EXT0040_ENT_CONTADORES?$filter=vbeln eq '180000000'&$select=vbeln,posnr,matnr,werks"
        })

        console.log('=== DATOS CONTADORES ===')
        result.forEach(row => {
            console.log(`Entrega: ${row.vbeln} | Pos: ${row.posnr} | Material: ${row.matnr} | Centro: ${row.werks}`)
        })

        return result
    })
})