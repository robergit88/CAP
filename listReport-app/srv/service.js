const cds = require('@sap/cds')
const axios = require('axios')
const fs = require('fs')
const path = require('path')

// Leer credenciales desde default-env.json
const defaultEnv = JSON.parse(
  fs.readFileSync(path.join(__dirname, '..', 'default-env.json'), 'utf8')
)

const creds = defaultEnv.requires.ZI_EXT0040_ENT_CONTADORES_CDS.credentials

module.exports = cds.service.impl(async function (srv) {

  srv.on('READ', 'Contadores', async (req) => {
    try {

      console.log('=== Llamando SAP ===')

      // query string original del navegador
      const query = req._.req.query  

      const response = await axios.get(
        `${creds.url}/ZI_EXT0040_ENT_CONTADORES`,
        {
          params: {
          ...query,
          'sap-client': creds.headers['sap-client'],
          '$format': 'json'        
          },
          auth: {
            username: creds.username,
            password: creds.password
          }
        }
      )

      console.log('=== Resultado ===', JSON.stringify(response.data).substring(0, 300))

      return response.data.d.results

    } catch (err) {
      console.log('=== ERROR ===', err.message)
      throw err
    }
  })

})