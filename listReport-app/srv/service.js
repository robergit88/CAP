const cds = require('@sap/cds')

module.exports = cds.service.impl(async function (srv) {

  srv.on('READ', 'Contadores', async (req) => {
    try {
      
      const external = await cds.connect.to('ZI_EXT0040_ENT_CONTADORES_CDS')

      console.log('=== Conectado ===')

      const result = await external.get(
        '/ZI_EXT0040_ENT_CONTADORES?$top=5&sap-client=500'
      )
      console.log('=== Resultado ===', JSON.stringify(result).substring(0, 300))
      return result

    } catch (err) {
      console.log('=== ERROR ===', err.message)
      throw err
    }
  })

})