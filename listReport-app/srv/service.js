const cds = require('@sap/cds')

module.exports = cds.service.impl(async function (srv) {

  const external = await cds.connect.to('ZI_EXT0040_ENT_CONTADORES_CDS')

  srv.on('READ', 'Contadores', async (req) => {
    return external.run(req.query)
  })

})