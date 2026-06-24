/* checksum : bcd80d295c1d8caa923ac7541453d6e5 */
@cds.external               : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported: 'true'
@sap.supported.formats      : 'atom json xlsx'
service solped_create {
  @cds.external        : true
  @cds.persistence.skip: true
  @sap.content.version : '1'
  @sap.label           : 'Notas de posición'
  entity A_PurchaseReqnItemText {
        @sap.display.format: 'UpperCase'
        @sap.label         : 'Solicitud de pedido'
        @sap.quickinfo     : 'Número de la solicitud de pedido'
    key PurchaseRequisition     : String(10) not null;

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Pos.solicitud pedido'
        @sap.quickinfo     : 'Número de posición de la solicitud de pedido'
    key PurchaseRequisitionItem : String(5) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'ID texto'
        @sap.quickinfo     : 'ID de texto'
    key DocumentText            : String(4) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Objeto texto'
        @sap.quickinfo     : 'Textos: Objeto de aplicación'
    key TechnicalObjectType     : String(10) not null;

        @sap.label: 'Clave de idioma'
    key Language                : String(2) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Nombre de texto'
        @sap.quickinfo     : 'Nombre'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ArchObjectNumber        : String(70);

        @sap.label         : 'Txt.explicativo'
        @sap.quickinfo     : 'Texto explicativo'
        NoteDescription         : String;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Fijación'
        @sap.quickinfo     : 'Indicador de fijación para textos'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        FixedIndicator          : String(1);
  };

  @cds.external        : true
  @cds.persistence.skip: true
  @sap.deletable       : 'false'
  @sap.content.version : '1'
  @sap.label           : 'Solicitud de pedido'
  entity A_PurchaseRequisitionHeader {
        @sap.display.format: 'UpperCase'
        @sap.label         : 'Solicitud de pedido'
        @sap.quickinfo     : 'Número de solicitud de pedido'
    key PurchaseRequisition     : String(10) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Clase documento'
        @sap.quickinfo     : 'Clase de documento de la solicitud de pedido'
        PurchaseRequisitionType : String(4);

        @sap.label         : 'Texto breve'
        @sap.sortable      : 'false'
        @sap.filterable    : 'false'
        PurReqnDescription      : String(40);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Casilla de selección'
        @sap.heading       : ''
        SourceDetermination     : Boolean;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Variable booleana (X=verdadero, -=falso, space=descon.)'
        @sap.heading       : ''
        PurReqnDoOnlyValidation : Boolean;
        to_PurchaseReqnItem     : Composition of many A_PurchaseRequisitionItem {};
  };

  @cds.external        : true
  @cds.persistence.skip: true
  @sap.deletable       : 'false'
  @sap.content.version : '1'
  @sap.label           : 'Posición'
  entity A_PurchaseRequisitionItem {
        @sap.display.format: 'UpperCase'
        @sap.label         : 'Solicitud de pedido'
        @sap.quickinfo     : 'Número de solicitud de pedido'
    key PurchaseRequisition            : String(10) not null;

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Pos.sol.pedido'
        @sap.quickinfo     : 'Número de posición de la solicitud de pedido'
    key PurchaseRequisitionItem        : String(5) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Pedido'
        @sap.quickinfo     : 'Número de pedido'
        PurchasingDocument             : String(10);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Posición de pedido'
        @sap.quickinfo     : 'Número de la posición de pedido'
        PurchasingDocumentItem         : String(5);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Stat.trat.'
        @sap.quickinfo     : 'Status tratamiento solicitud pedido'
        PurReqnReleaseStatus           : String(2);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Clase documento'
        @sap.quickinfo     : 'Clase de documento de la solicitud de pedido'
        PurchaseRequisitionType        : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Indicador de control'
        @sap.quickinfo     : 'Indicador de control para clase de documento de compras'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        PurchasingDocumentSubtype      : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Tipo de posición'
        @sap.quickinfo     : 'Tipo de posición del documento de compras'
        PurchasingDocumentItemCategory : String(1);

        @sap.label: 'Texto breve'
        PurchaseRequisitionItemText    : String(40);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Tipo de imputación'
        AccountAssignmentCategory      : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Material'
        @sap.quickinfo     : 'Número de material'
        Material                       : String(40);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Grupo de artículos'
        MaterialGroup                  : String(9);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Tipo doc.compras'
        @sap.quickinfo     : 'Tipo de documento de compras'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        PurchasingDocumentCategory     : String(1);

        @sap.unit          : 'BaseUnit'
        @sap.label         : 'Cantidad solicitada'
        @sap.quickinfo     : 'Cantidad solicitud de pedido'
        RequestedQuantity              : Decimal(13, 3);

        @sap.label         : 'Unidad de medida'
        @sap.quickinfo     : 'Unidad de medida de solicitud pedido'
        @sap.semantics     : 'unit-of-measure'
        BaseUnit                       : String(3);

        @sap.unit          : 'PurReqnItemCurrency'
        @sap.label         : 'Precio de valoración'
        @sap.quickinfo     : 'Precio en la solicitud de pedido'
        PurchaseRequisitionPrice       : Decimal(12, 3);

        @sap.unit          : 'BaseUnit'
        @sap.label         : 'Cantidad base'
        PurReqnPriceQuantity           : Decimal(5, 0);

        @sap.label         : 'Tmpo.tratamiento EM'
        @sap.quickinfo     : 'Tiempo de tratamiento para la entrada de mercancía en días'
        MaterialGoodsReceiptDuration   : Decimal(3, 0);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Indicador liberación'
        @sap.quickinfo     : 'Indicador de liberación'
        ReleaseCode                    : String(1);

        @sap.display.format: 'Date'
        @sap.label         : 'Fecha de liberación'
        @sap.quickinfo     : 'Fecha de liberación de la solicitud de pedido'
        PurchaseRequisitionReleaseDate : Date;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Organización compras'
        @sap.quickinfo     : 'Organización de compras'
        PurchasingOrganization         : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Grupo de compras'
        PurchasingGroup                : String(3);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Centro'
        Plant                          : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Sociedad'
        @sap.quickinfo     : 'Sociedad de sistema externo'
        CompanyCode                    : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Asignado'
        @sap.quickinfo     : 'Fuente de aprovisionamiento asignada'
        SourceOfSupplyIsAssigned       : Boolean;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Centro suministrador'
        @sap.quickinfo     : 'Centro suministrador en el pedido de transporte'
        SupplyingPlant                 : String(4);

        @sap.unit          : 'BaseUnit'
        @sap.label         : 'Cantidad pedida'
        @sap.quickinfo     : 'Cantidad de pedido de la solicitud de pedido'
        OrderedQuantity                : Decimal(13, 3);

        @sap.display.format: 'Date'
        @sap.label         : 'Fecha de entrega'
        @sap.quickinfo     : 'Fecha de entrega de posición'
        DeliveryDate                   : Date;

        @sap.display.format: 'Date'
        @sap.label         : 'Fecha de solicitud'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        CreationDate                   : Date;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Status tratamiento'
        @sap.quickinfo     : 'Status de tratamiento de la solicitud de pedido'
        ProcessingStatus               : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Est.proces.externo'
        @sap.quickinfo     : 'Estado de procesamiento externo'
        ExternalApprovalStatus         : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Reg.info de compras'
        @sap.quickinfo     : 'Número del registro info de compras'
        PurchasingInfoRecord           : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Proveedor deseado'
        Supplier                       : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Indicador de borrado'
        @sap.quickinfo     : 'Indicador de borrado en el documento de compras'
        IsDeleted                      : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Proveedor fijo'
        FixedSupplier                  : String(10);

        @sap.label         : 'Solicitante'
        @sap.quickinfo     : 'Nombre del solicitante'
        RequisitionerName              : String(12);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Creada por'
        @sap.quickinfo     : 'Nombre del responsable que ha añadido el objeto'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        CreatedByUser                  : String(12);

        @sap.display.format: 'Date'
        @sap.label         : 'Fecha de solicitud'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        PurReqCreationDate             : Date;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Dirección'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        DeliveryAddressID              : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Dirección'
        @sap.quickinfo     : 'Nº dirección manual en posición de documento de compras'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ManualDeliveryAddressID        : String(10);

        @sap.label         : 'Moneda'
        @sap.quickinfo     : 'Clave de moneda'
        @sap.semantics     : 'currency-code'
        PurReqnItemCurrency            : String(5);

        @sap.label         : 'Plazo entrega prev.'
        @sap.quickinfo     : 'Plazo de entrega previsto en días'
        MaterialPlannedDeliveryDurn    : Decimal(3, 0);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Tipo de fe.entrega'
        @sap.quickinfo     : 'Tipo de fecha de la fecha de entrega'
        DelivDateCategory              : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Ind.distribución'
        @sap.quickinfo     : 'Indicador de distribución en la imputación múltiple'
        MultipleAcctAssgmtDistribution : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Almacén'
        StorageLocation                : String(4);

        @sap.label: 'Solicitante'
        PurReqnSSPRequestor            : String(60);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Creado por'
        @sap.quickinfo     : 'Autor de solicitud'
        PurReqnSSPAuthor               : String(12);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Contrato marco'
        @sap.quickinfo     : 'Número del contrato superior'
        PurchaseContract               : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Tipo doc.compras'
        @sap.quickinfo     : 'Tipo de documento de compras'
        PurReqnSourceOfSupplyType      : String(1);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Pos.contrato sup.'
        @sap.quickinfo     : 'Número de posición del contrato superior'
        PurchaseContractItem           : String(5);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Consumo'
        @sap.quickinfo     : 'Contabilización de consumo'
        ConsumptionPosting             : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Indicador creación'
        @sap.quickinfo     : 'Indicador de creación (SolP/Repartos)'
        PurReqnOrigin                  : String(1);

        @sap.label         : 'ID servicio Web'
        @sap.quickinfo     : 'Clave técnica de servicio Web (por ejemplo, un catálogo)'
        PurReqnSSPCatalog              : String(20);

        @sap.label         : 'Posición de catálogo'
        @sap.quickinfo     : 'ID de posición de catálogo'
        PurReqnSSPCatalogItem          : String(40);

        @sap.label         : 'Clv.pos.catálogo'
        @sap.quickinfo     : 'Clave de posición de catálogo'
        PurReqnSSPCrossCatalogItem     : Integer;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Indicador de bloqueo'
        @sap.quickinfo     : 'Solicitud de pedido bloqueada'
        IsPurReqnBlocked               : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Dirección'
        @sap.quickinfo     : 'Número dirección de la entrega'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ItemDeliveryAddressID          : String(10);

        @sap.label: 'Clave de idioma'
        Language                       : String(2);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Concluida'
        @sap.quickinfo     : 'Solicitud de pedido concluida'
        IsClosed                       : Boolean;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Relevante p.liber.'
        @sap.quickinfo     : 'Liberación incompleta'
        ReleaseIsNotCompleted          : Boolean;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Proveedor Servicios'
        @sap.quickinfo     : 'Proveedor de servicios'
        ServicePerformer               : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Gpo.tipos producto'
        @sap.quickinfo     : 'Grupo de tipos de producto'
        ProductType                    : String(2);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Estado liberación'
        PurchaseRequisitionStatus      : String(8);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Estrateg.liberación'
        @sap.quickinfo     : 'Estrategia de liberación en solicitud pedido'
        ReleaseStrategy                : String(2);

        @sap.display.format: 'Date'
        @sap.label         : 'Fecha de inicio'
        @sap.quickinfo     : 'Fecha de inicio para el período de prestación'
        PerformancePeriodStartDate     : Date;

        @sap.display.format: 'Date'
        @sap.label         : 'Fecha de fin'
        @sap.quickinfo     : 'Fecha de fin para el período de prestación'
        PerformancePeriodEndDate       : Date;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Precio de pedido'
        @sap.quickinfo     : 'Transferir precio SolPed en pedido'
        PurchaseOrderPriceType         : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Nº mater.proveedor'
        @sap.quickinfo     : 'Número de material utilizado por el proveedor'
        SupplierMaterialNumber         : String(35);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Lote'
        @sap.quickinfo     : 'Número de lote'
        Batch                          : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Estado de revisión'
        MaterialRevisionLevel          : String(2);

        @sap.label         : 'Tmpo.mín.durac.rest.'
        @sap.quickinfo     : 'Tiempo mínimo de duración restante'
        MinRemainingShelfLife          : Decimal(4, 0);

        @sap.unit : 'PurReqnItemCurrency'
        ItemNetAmount                  : Decimal(16, 3);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Entrada mercancías'
        @sap.quickinfo     : 'Indicador de entrada de mercancías'
        GoodsReceiptIsExpected         : Boolean;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Recepción facturas'
        @sap.quickinfo     : 'Indicador de recepción de factura'
        InvoiceIsExpected              : Boolean;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'EM no valorada'
        @sap.quickinfo     : 'Entrada de mercancías no valorada'
        GoodsReceiptIsNonValuated      : Boolean;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Número de necesidad'
        RequirementTracking            : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Planif.necesidades'
        @sap.quickinfo     : 'Planificador de necesidades'
        MRPController                  : String(3);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Indicador fijación'
        @sap.quickinfo     : 'Solicitud de pedido está fijada'
        PurchaseRequisitionIsFixed     : Boolean;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Dirección'
        @sap.quickinfo     : 'Nº dirección manual en posición de documento de compras'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        AddressID                      : String(10);

        @odata.Type        : 'Edm.DateTimeOffset'
        @odata.Precision   : 7
        @sap.label         : 'Cronomarcador'
        @sap.quickinfo     : 'Cronomarcador UTC en forma expl.(AAAAMMDDhhmmssmmmuuun)'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        LastChangeDateTime             : Timestamp;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Documento externo'
        @sap.quickinfo     : 'Número de documento de documento externo'
        PurReqnExternalReference       : String(35);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Pos.externa'
        @sap.quickinfo     : 'Número de posición de documento externo'
        PurReqnItemExternalReference   : String(10);

        @sap.label         : 'ID sistema externo'
        @sap.quickinfo     : 'ID de sistema externo'
        PurReqnExternalSystemId        : String(60);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Tipo sistema externo'
        @sap.quickinfo     : 'Tipo de sistema externo'
        PurReqnExternalSystemType      : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Tipo doc.externo'
        @sap.quickinfo     : 'Tipo de documento externo'
        PurReqnTypeExternalReference   : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Status tratamiento'
        @sap.quickinfo     : 'Status de tratamiento'
        PurReqnProcessingType          : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Cronomarcador'
        @sap.heading       : ''
        PurReqnProcessingDateTime      : String(14);

        @sap.label: 'Sistema conectado'
        ProcmtHubBackendBusSyst        : String(60);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'ID de SC del autor'
        @sap.quickinfo     : 'ID de socio comercial del autor'
        SSPAuthorExternalBPIdnNumber   : String(60);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'ID usuario solicit.'
        @sap.quickinfo     : 'ID de usuario solicitante'
        SSPReqrUserId                  : String(12);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Segmento de stock'
        StockSegment                   : String(40);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Segmento necesidad'
        RequirementSegment             : String(40);
        BillingAddressAdHoc            : String(100);
        to_PurchaseReqn                : Association to A_PurchaseRequisitionHeader {};
        to_PurchaseReqnAcctAssgmt      : Composition of many A_PurReqnAcctAssgmt {};
        to_PurchaseReqnDeliveryAddress : Composition of A_PurReqAddDelivery {};
        to_PurchaseReqnItemText        : Composition of many A_PurchaseReqnItemText {};
  };

  @cds.external        : true
  @cds.persistence.skip: true
  @sap.creatable       : 'false'
  @sap.deletable       : 'false'
  @sap.content.version : '1'
  @sap.label           : 'Dirección de entrega'
  entity A_PurReqAddDelivery {
        @sap.display.format: 'UpperCase'
        @sap.label         : 'Solicitud de pedido'
        @sap.quickinfo     : 'Número de solicitud de pedido'
    key PurchaseRequisition        : String(10) not null;

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Pos.sol.pedido'
        @sap.quickinfo     : 'Número de posición de la solicitud de pedido'
    key PurchaseRequisitionItem    : String(5) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Dirección'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        AddressID                  : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Centro'
        Plant                      : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Clase de dirección'
        @sap.quickinfo     : 'Solicitud de pedido - clase de dirección'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        AddressType                : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Dirección'
        @sap.quickinfo     : 'Nº dirección manual en posición de documento de compras'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ManualDeliveryAddressID    : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Dirección'
        @sap.quickinfo     : 'Número dirección de la entrega'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ItemDeliveryAddressID      : String(10);

        @sap.label         : 'c/o'
        @sap.quickinfo     : 'Nombre c/o'
        CareOfName                 : String(40);

        @sap.label: 'Calle 5'
        AdditionalStreetSuffixName : String(40);

        @sap.label: 'Clave de idioma'
        CorrespondenceLanguage     : String(2);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Forma comunicación'
        @sap.quickinfo     : 'Forma de comunicación (clave) (Business Address Services)'
        PrfrdCommMediumType        : String(3);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Apartado'
        POBox                      : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Apartado sin nº'
        @sap.quickinfo     : 'Indicador: Datos del apartado del correos sin número'
        POBoxIsWithoutNumber       : Boolean;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'CP apartado'
        @sap.quickinfo     : 'Código postal del apartado'
        POBoxPostalCode            : String(10);

        @sap.label         : 'Estación ap.correos'
        @sap.quickinfo     : 'Estación de apartado de correos (PO Box Lobby)'
        POBoxLobbyName             : String(40);

        @sap.label         : 'Población apartado'
        @sap.quickinfo     : 'Población del apartado'
        POBoxDeviatingCityName     : String(40);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Región del apartado'
        @sap.quickinfo     : 'Región del apartado (estado federal, land, provincia, etc.)'
        POBoxDeviatingRegion       : String(3);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'País rel.apartado'
        @sap.quickinfo     : 'País relativo al apartado de correos'
        POBoxDeviatingCountry      : String(3);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Cl.serv.entrega'
        @sap.quickinfo     : 'Clase del servicio de entrega'
        DeliveryServiceTypeCode    : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Número serv.entrega'
        @sap.quickinfo     : 'Número del servicio de entrega'
        DeliveryServiceNumber      : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Huso horario'
        @sap.quickinfo     : 'Huso horario de la dirección'
        AddressTimeZone            : String(6);

        @sap.label         : 'Nombre completo'
        @sap.quickinfo     : 'Nombre completo de parte (int.cial., un.org., direc.doc.)'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        FullName                   : String(80);

        @sap.label: 'Población'
        CityName                   : String(40);

        @sap.label: 'Distrito'
        District                   : String(40);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Nº de población'
        @sap.quickinfo     : 'Codificación de población para fichero de población y calle'
        CityCode                   : String(12);

        @sap.label         : 'Residencia alt.'
        @sap.quickinfo     : 'Lugar de residencia (diferente de población cód.postal)'
        HomeCityName               : String(40);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Código postal'
        @sap.quickinfo     : 'Código postal de la población'
        PostalCode                 : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Cód.postal empresa'
        @sap.quickinfo     : 'Código postal de la empresa (en caso de clientes import.)'
        CompanyPostalCode          : String(10);

        @sap.label: 'Calle'
        StreetName                 : String(60);

        @sap.label: 'Calle 2'
        StreetPrefixName           : String(40);

        @sap.label: 'Calle 3'
        AdditionalStreetPrefixName : String(40);

        @sap.label: 'Calle 4'
        StreetSuffixName           : String(40);

        @sap.label: 'Nº (edificio)'
        HouseNumber                : String(10);

        @sap.label         : 'Apéndice'
        @sap.quickinfo     : 'Suplemento al número de casa'
        HouseNumberSupplementText  : String(10);

        @sap.label         : 'Sigla del edificio'
        @sap.quickinfo     : 'Edificio (número o sigla)'
        Building                   : String(20);

        @sap.label         : 'Piso'
        @sap.quickinfo     : 'Planta del edificio'
        Floor                      : String(10);

        @sap.label         : 'Número de sala'
        @sap.quickinfo     : 'Número de un piso, un apartamento o una sala'
        RoomNumber                 : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Clave de país'
        Country                    : String(3);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Región'
        @sap.quickinfo     : 'Región (estado, provincia, distrito)'
        Region                     : String(3);

        @sap.label         : 'Distrito'
        @sap.quickinfo     : 'Distrito (US: County)'
        County                     : String(40);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Tratamiento'
        @sap.quickinfo     : 'Clave de tratamiento'
        FormOfAddress              : String(4);

        @sap.label         : 'Nombre'
        @sap.quickinfo     : 'Nombre 1'
        BusinessPartnerName1       : String(40);

        @sap.label: 'Nombre 2'
        BusinessPartnerName2       : String(40);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Versión dirección'
        @sap.quickinfo     : 'Indicadores de versión para direcciones internacionales'
        Nation                     : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Teléfono'
        @sap.quickinfo     : 'Primer número teléfono: Prefijo + número'
        PhoneNumber                : String(30);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Fax'
        @sap.quickinfo     : 'Primer nº de fax: Prefijo + conexión'
        FaxNumber                  : String(30);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Concepto búsqueda 1'
        @sap.quickinfo     : 'Concepto de búsqueda 1'
        SearchTerm1                : String(20);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Calle'
        @sap.quickinfo     : 'Nombre de la calle en mayúsculas para ayuda para búsqueda'
        StreetSearch               : String(25);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Población'
        @sap.quickinfo     : 'Nombre del lugar en mayúsculas para ayuda p.búsqueda'
        CitySearch                 : String(25);

        @sap.label: 'Nombre 3'
        BusinessPartnerName3       : String(40);

        @sap.label: 'Nombre 4'
        BusinessPartnerName4       : String(40);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Domicilio fiscal'
        TaxJurisdiction            : String(15);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Zona de transporte'
        @sap.quickinfo     : 'Zona de transporte donde se efectúan las entregas'
        TransportZone              : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Número de persona'
        Person                     : String(10);
  };

  @cds.external        : true
  @cds.persistence.skip: true
  @sap.deletable       : 'false'
  @sap.content.version : '1'
  @sap.label           : 'Asignac.cuentas'
  entity A_PurReqnAcctAssgmt {
        @sap.display.format: 'UpperCase'
        @sap.label         : 'Solicitud de pedido'
        @sap.quickinfo     : 'Número de la solicitud de pedido'
    key PurchaseRequisition            : String(10) not null;

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Pos.solicitud pedido'
        @sap.quickinfo     : 'Número de posición de la solicitud de pedido'
    key PurchaseRequisitionItem        : String(5) not null;

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Nº actual imputación'
        @sap.quickinfo     : 'Número actual para segmento imputación solicitud pedido'
    key PurchaseReqnAcctAssgmtNumber   : String(2) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Centro de coste'
        CostCenter                     : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Activo fijo'
        @sap.quickinfo     : 'Número principal de activo fijo'
        MasterFixedAsset               : String(12);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Grafo'
        @sap.quickinfo     : 'Número de grafo para imputación'
        ProjectNetwork                 : String(12);

        @sap.label         : 'Unidad de medida'
        @sap.quickinfo     : 'Unidad de medida de solicitud pedido'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        @sap.semantics     : 'unit-of-measure'
        BaseUnit                       : String(3);

        @sap.unit          : 'BaseUnit'
        @sap.label         : 'Cantidad solicitada'
        @sap.quickinfo     : 'Cantidad solicitud de pedido'
        Quantity                       : Decimal(13, 3);

        @sap.label         : 'Distribución (%)'
        @sap.quickinfo     : 'Porcentaje de distribución en la imputación múltiple'
        MultipleAcctAssgmtDistrPercent : Decimal(3, 1);

        @sap.label         : 'Moneda'
        @sap.quickinfo     : 'Clave de moneda'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        @sap.semantics     : 'currency-code'
        PurReqnItemCurrency            : String(5);

        @sap.unit          : 'PurReqnItemCurrency'
        @sap.label         : 'Valor neto de pedido'
        @sap.quickinfo     : 'Valor neto de pedido en moneda de pedido'
        PurReqnNetAmount               : Decimal(14, 3);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Indicador de borrado'
        @sap.quickinfo     : 'Indicador de borrado en el documento de compras'
        IsDeleted                      : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Cuenta de mayor'
        @sap.quickinfo     : 'Número de la cuenta de mayor'
        CostElement                    : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Cuenta de mayor'
        @sap.quickinfo     : 'Número de la cuenta de mayor'
        GLAccount                      : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'División'
        BusinessArea                   : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Documento comercial'
        @sap.quickinfo     : 'Número de documento comercial'
        SDDocument                     : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Documento comercial'
        @sap.quickinfo     : 'Número de documento comercial'
        SalesOrder                     : String(10);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Posición'
        @sap.quickinfo     : 'Posición documento ventas'
        SalesDocumentItem              : String(6);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Posición'
        @sap.quickinfo     : 'Posición documento ventas'
        SalesOrderItem                 : String(6);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Nº de reparto'
        ScheduleLine                   : String(4);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Nº de reparto'
        SalesOrderScheduleLine         : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Subnúmero'
        @sap.quickinfo     : 'Subnúmero de activo fijo'
        FixedAsset                     : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Orden'
        @sap.quickinfo     : 'Número de orden'
        ProcessOrder                   : String(12);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Orden'
        @sap.quickinfo     : 'Número de orden'
        OrderID                        : String(12);

        @sap.label         : 'Puesto descarga'
        @sap.quickinfo     : 'Puesto de descarga'
        UnloadingPointName             : String(25);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Sociedad CO'
        ControllingArea                : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Objeto de coste'
        CostObject                     : String(12);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Número de objeto PA'
        @sap.quickinfo     : 'Número para objetos PA (CO-PA)'
        ProfitabilitySegment           : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Centro de beneficio'
        ProfitCenter                   : String(10);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Nº hoja ruta oper.'
        @sap.quickinfo     : 'Nº hoja ruta de operaciones en orden'
        ProjectNetworkInternalID       : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'PosPre'
        @sap.quickinfo     : 'Posición presupuestaria'
        CommitmentItem                 : String(24);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Centro gestor'
        FundsCenter                    : String(16);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Fondos'
        Fund                           : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Área funcional'
        FunctionalArea                 : String(16);

        @sap.display.format: 'Date'
        @sap.label         : 'Creado el'
        @sap.quickinfo     : 'Fecha de creación del registro'
        CreationDate                   : Date;

        @sap.label         : 'Dest.mercancía'
        @sap.quickinfo     : 'Destinatario de mercancías'
        GoodsRecipientName             : String(12);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Clave BI'
        @sap.quickinfo     : 'Clave interna para objeto inmueble'
        RealEstateObject               : String(40);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Contador'
        @sap.quickinfo     : 'Contador interno'
        NetworkActivityInternalID      : String(8);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Interlocutor'
        @sap.quickinfo     : 'Nº de cliente del interlocutor'
        PartnerAccountNumber           : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Tipo de coste'
        JointVentureRecoveryCode       : String(2);

        @sap.display.format: 'Date'
        @sap.label         : 'Fecha de referencia'
        @sap.quickinfo     : 'Fecha de referencia para la liquidación'
        SettlementReferenceDate        : Date;

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Nº hoja ruta oper.'
        @sap.quickinfo     : 'Nº hoja ruta de operaciones en orden'
        OrderInternalID                : String(10);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Contador'
        @sap.quickinfo     : 'Contador general de la orden'
        OrderIntBillOfOperationsItem   : String(8);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Doc.presupuestario'
        @sap.quickinfo     : 'Número de documento presupuestario'
        EarmarkedFundsDocument         : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Clase de actividad'
        CostCtrActivityType            : String(6);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Proceso empresarial'
        BusinessProcess                : String(12);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Subvención'
        GrantID                        : String(20);

        @sap.display.format: 'Date'
        ValidityDate                   : Date;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Plan de cuentas'
        ChartOfAccounts                : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Elemento PEP'
        @sap.quickinfo     : 'Elemento del plan de estructura de proyecto (elemento PEP)'
        WBSElement                     : String(24);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Clase documento'
        @sap.quickinfo     : 'Clase de documento de la solicitud de pedido'
        PurchaseRequisitionType        : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Centro'
        Plant                          : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Organización compras'
        @sap.quickinfo     : 'Organización de compras'
        PurchasingOrganization         : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Grupo de compras'
        PurchasingGroup                : String(3);
  };

  @cds.external: true
  type ValidationMessages {
    @sap.label     : 'Clase de mensaje'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    Type      : String(1) not null;

    @sap.label     : 'Clase de mensaje'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    Id        : String(20) not null;

    @sap.label     : 'Número de mensaje'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    Number    : String(3) not null;

    @sap.label     : 'Texto del mensaje'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    Message   : String(220) not null;

    @sap.label     : 'Número de log'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    LogNo     : String(20) not null;

    @sap.label     : 'Nº mensaje'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    LogMsgNo  : String(6) not null;

    @sap.label     : 'Variable del mensaje'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    MessageV1 : String(50) not null;

    @sap.label     : 'Variable del mensaje'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    MessageV2 : String(50) not null;

    @sap.label     : 'Variable del mensaje'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    MessageV3 : String(50) not null;

    @sap.label     : 'Variable del mensaje'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    MessageV4 : String(50) not null;

    @sap.label     : 'Nombre de parámetro'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    Parameter : String(32) not null;

    @sap.label     : 'Línea de parámetros'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    Row       : Integer not null;

    @sap.label     : 'Nombre de campo'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    Field     : String(30) not null;

    @sap.label     : 'Sistema lógico'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    System    : String(10) not null;
  };

  @cds.external: true
  type Messages {
    @sap.label     : 'Clase de mensaje'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    Type      : String(1) not null;

    @sap.label     : 'Clase de mensaje'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    Id        : String(20) not null;

    @sap.label     : 'Número de mensaje'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    Number    : String(3) not null;

    @sap.label     : 'Texto del mensaje'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    Message   : String(220) not null;

    @sap.label     : 'Número de log'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    LogNo     : String(20) not null;

    @sap.label     : 'Nº mensaje'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    LogMsgNo  : String(6) not null;

    @sap.label     : 'Variable del mensaje'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    MessageV1 : String(50) not null;

    @sap.label     : 'Variable del mensaje'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    MessageV2 : String(50) not null;

    @sap.label     : 'Variable del mensaje'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    MessageV3 : String(50) not null;

    @sap.label     : 'Variable del mensaje'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    MessageV4 : String(50) not null;

    @sap.label     : 'Nombre de parámetro'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    Parameter : String(32) not null;

    @sap.label     : 'Línea de parámetros'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    Row       : Integer not null;

    @sap.label     : 'Nombre de campo'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    Field     : String(30) not null;

    @sap.label     : 'Sistema lógico'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable  : 'false'
    @sap.filterable: 'false'
    System    : String(10) not null;
  };

  @cds.external: true
  function Validate(PurchaseRequisition: String)                  returns many ValidationMessages;

  @cds.external: true
  action   DiscardFromPurchasing(PurchaseRequisition: String,
                                 PurchaseRequisitionItem: String) returns many Messages;

  @cds.external: true
  action   EnableForPurchasing(PurchaseRequisition: String,
                               PurchaseRequisitionItem: String)   returns many Messages;
};
