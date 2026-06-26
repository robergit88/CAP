sap.ui.define([
    "sap/ui/core/UIComponent"
], function (UIComponent) {
    "use strict";

    return UIComponent.extend("app.Component", {

        // Lee automáticamente el manifest.json
        metadata: {
            manifest: "json"
        },

        init: function () {
            // Llama al init del padre — obligatorio
            UIComponent.prototype.init.apply(this, arguments);

            // Inicializa el router definido en el manifest
            this.getRouter().initialize();
        }

    });
});