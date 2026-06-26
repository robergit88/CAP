sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/m/MessageToast"
], function (Controller, JSONModel, MessageToast) {
    "use strict";

    return Controller.extend("app.controller.List", {

        // Se ejecuta al cargar la vista
        onInit: function () {
            // Modelo local para guardar los resultados y el mensaje de info
            const oModel = new JSONModel({ items: [], info: "Introduce filtros y pulsa Buscar" })
            this.getView().setModel(oModel)
        },

        // Botón Buscar
        onBuscar: async function () {
            const oView  = this.getView()
            const oModel = oView.getModel()

            // 1. Recoger valores de los filtros
            const filtros = []
            const vbeln = oView.byId("vbeln").getValue().trim()
            const matnr = oView.byId("matnr").getValue().trim()
            const werks = oView.byId("werks").getValue().trim()
            const lgort = oView.byId("lgort").getValue().trim()

            if (vbeln) filtros.push(`vbeln eq '${vbeln}'`)
            if (matnr) filtros.push(`matnr eq '${matnr}'`)
            if (werks) filtros.push(`werks eq '${werks}'`)
            if (lgort) filtros.push(`lgort eq '${lgort}'`)

            // 2. Construir URL OData
            let url = "/odata/v4/contadores/Contadores?$top=20"
            if (filtros.length > 0) {
                url += "&$filter=" + encodeURIComponent(filtros.join(" and "))
            }

            // 3. Llamar al OData
            oModel.setProperty("/info", "⏳ Cargando...")
            oModel.setProperty("/items", [])

            try {
                const res  = await fetch(url)
                const data = await res.json()

                if (data.error) {
                    MessageToast.show("Error: " + data.error.message)
                    return
                }

                // 4. Actualizar modelo con los resultados
                oModel.setProperty("/items", data.value)
                oModel.setProperty("/info", `${data.value.length} registro(s) encontrado(s)`)

            } catch (err) {
                MessageToast.show("Error de conexión: " + err.message)
            }
        },

        // Botón Limpiar
        onLimpiar: function () {
            const oView = this.getView()
            oView.byId("vbeln").setValue("")
            oView.byId("matnr").setValue("")
            oView.byId("werks").setValue("")
            oView.byId("lgort").setValue("")
            oView.getModel().setProperty("/items", [])
            oView.getModel().setProperty("/info", "Introduce filtros y pulsa Buscar")
        }

    })
})