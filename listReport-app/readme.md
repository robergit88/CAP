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


## 🗺️ CAP List Report — Hoja de Ruta


Paso | Nombre | Qué hacemos
--|-------|-------------
1 | Inicializar proyecto CAP | cds init + estructura de carpetas
2 | Generar modelo de datos | Script que lee XML y genera schema.cds
3 | Servicio OData | Exponer entidad con service.cds
4 | Datos de prueba | CSV mock para desarrollo local
5 | Arrancar y verificar OData | Probar endpoint en navegador
6 | Frontend — HTML+JS | Página con filtros y tabla
7 | Conectar frontend al OData |Fetch con filtros dinámicos
8 | Revisión y ajustes finales | Todo junto funcionando


## 2 Generar modelo de datos

`cds import C:\Users\0021038\Desktop\ZI_EXT0040_ENT_CONTADORES_CDS.xml --as cds`

Resultado: Modelo importado

![servicio](./img/img1_srv.png)