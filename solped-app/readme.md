# Getting Started

Welcome to your new CAP project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`readme.md` | this getting started guide

## Next Steps

- Open a new terminal and run `cds watch`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start with your domain model, in a CDS file in `db/`

## Learn More

Learn more at <https://cap.cloud.sap>.

## Resumen de instrucciones ejecutadas
### Paso 01 - Prerequisitos
`powershellnode --version`
`npm --version`
`cds --version`
`cf --version`

Paso 02 - Crear proyecto
powershellcds init solped-app
cd solped-app
npm install
npm install axios
code .
Paso 03 - Importar metadata APIs
powershellcds import solped_create.xml --as cds
cds import solped_attach.xml --as cds
Paso 04 - Definir servicio
Creación manual de srv/service.cds con la acción crearSolpedConAdjuntos
Paso 05 - Implementar lógica
Creación manual de srv/service.js con:

Llamada HTTP a API1 (crear SOLPED)
Obtención del PurchaseRequisition
Llamada HTTP a API2 (adjuntar ficheros)

Paso 06 - Configurar entorno
powershellnpm install dotenv  # luego descartado
Creación de default-env.json con variables de entorno y configuración de package.json
Arranque y pruebas
powershellcds watch

Estado actual
FicheroEstadosrv/external/solped_create.cds✅ Generadosrv/external/solped_attach.cds✅ Generadosrv/service.cds✅ Creadosrv/service.js✅ Creadodefault-env.json✅ Creadopackage.json✅ Configurado