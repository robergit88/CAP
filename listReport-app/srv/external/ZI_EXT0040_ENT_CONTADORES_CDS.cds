/* checksum : d2de1c984da4a570bab85356ad19c25e */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZI_EXT0040_ENT_CONTADORES_CDS {
  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.content.version : '1'
  @sap.label : 'DT Entregas de Contadores'
  entity ZI_EXT0040_ENT_CONTADORES {
    @sap.display.format : 'UpperCase'
    @sap.label : 'Entrega'
    key vbeln : String(10) not null;
    @sap.display.format : 'NonNegative'
    @sap.label : 'Posición'
    @sap.quickinfo : 'Posición de entrega'
    key posnr : String(6) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Tipo de posición'
    @sap.quickinfo : 'Tipo de posición de la entrega'
    pstyv : String(4);
    @sap.label : 'Hora'
    @sap.quickinfo : 'Hora de entrada'
    erzet : Time;
    @sap.display.format : 'Date'
    @sap.label : 'Creado el'
    @sap.quickinfo : 'Fecha de creación del registro'
    erdat : Date;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Material'
    @sap.quickinfo : 'Número de material'
    matnr : String(40);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Material introducido'
    matwa : String(40);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Centro'
    werks : String(4);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Almacén'
    lgort : String(4);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Lote'
    @sap.quickinfo : 'Número de lote'
    charg : String(10);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Lote de proveedor'
    @sap.quickinfo : 'Número de lote de proveedor'
    lichn : String(15);
    @sap.label : 'Cantidad entrega'
    @sap.quickinfo : 'Cantidad entregada efectivamente en UMV'
    lfimg : Decimal(13, 3);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Entrega parcial/pos.'
    @sap.quickinfo : 'Entrega parcial a nivel de posición'
    kztlf : String(1);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Ubicación'
    lgpbe : String(10);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Documento modelo'
    @sap.quickinfo : 'Número de documento del documento modelo'
    vgbel : String(10);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Clase de movimiento'
    @sap.quickinfo : 'Clase de movimiento (gestión stocks)'
    bwart : String(3);
    @sap.display.format : 'NonNegative'
    @sap.label : 'Cl.movimiento'
    @sap.quickinfo : 'Cl.movim.gestión almacenes'
    bwlvs : String(3);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Tipo material'
    @sap.quickinfo : 'Tipo de material'
    mtart : String(4);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Clase de valoración'
    bwtar : String(10);
    @sap.display.format : 'NonNegative'
    @sap.label : 'Grupo entrega'
    @sap.quickinfo : 'Grupo de entrega (posiciones se entregan conjuntamente)'
    grkor : String(3);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Stock especial'
    @sap.quickinfo : 'Indicador de stock especial'
    sobkz : String(1);
    @sap.display.format : 'Date'
    @sap.label : 'Modificado el'
    @sap.quickinfo : 'Fecha última modificación'
    aedat : Date;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Sociedad CO'
    kokrs : String(4);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Pedido cliente'
    @sap.quickinfo : 'Número del pedido de cliente'
    kdauf : String(10);
    @sap.label : 'Ctd.números serie'
    @sap.quickinfo : 'Cantidad de números de serie'
    anzsn : Integer;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Perfil número serie'
    @sap.quickinfo : 'Perfil de números de serie'
    serail : String(4);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Clase orden entrega'
    abart : String(1);
    @sap.display.format : 'NonNegative'
    @sap.label : 'Lote parcial'
    @sap.quickinfo : 'Número de lote parcial'
    qtlos : String(6);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Nº objeto cabecera'
    @sap.quickinfo : 'Número de objeto a nivel cabecera'
    objko : String(22);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Tabla asignación'
    @sap.quickinfo : 'Tabla de asignación'
    abeln : String(10);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Nº ped.abierto valor'
    @sap.quickinfo : 'Número de pedido abierto por valor'
    wktnr : String(10);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Difer.stock'
    @sap.quickinfo : 'Diferenciación de stock en sistema de gestión de almacenes'
    bestq : String(1);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Segmento necesidad'
    sgt_rcat : String(40);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Segmento de stock'
    sgt_scat : String(40);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Estad.fact.entr.soc.'
    @sap.quickinfo : 'Estado de factura entre sociedades (posición)'
    fkivp : String(1);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Est.fact.rel.entrega'
    @sap.quickinfo : 'Estado de facturación relacionada con la entrega (posición)'
    fksta : String(1);
    @sap.display.format : 'UpperCase'
    @sap.label : 'PosEntrgNoCompl'
    @sap.quickinfo : 'Posición de entrega entrante aún no concluida (retenida)'
    hdall : Boolean;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Confirm.picking'
    @sap.quickinfo : 'Estado de confirmación de picking/entrada en stock'
    koqua : String(1);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Status de picking'
    @sap.quickinfo : 'Estado de picking/Estado de entrada en stock (posición)'
    kosta : String(1);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Almacén descentral.'
    @sap.quickinfo : 'Gestión de almacenes descentralizada'
    vlstp : String(1);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Estado movim.mcías.'
    @sap.quickinfo : 'Estado de movimiento de mercancías (posición)'
    wbsta : String(1);
    @sap.label : 'Ctd.picking UMP'
    @sap.quickinfo : 'Cantidad de picking/almacenada en UM paralela'
    cwm_pikmg : Decimal(13, 3);
    @sap.label : 'Ctd.a contab.en UMP'
    @sap.quickinfo : 'Cantidad a contabilizar en UMP'
    cwm_ebumg : Decimal(15, 3);
    @sap.display.format : 'UpperCase'
    @sap.label : 'EmbalPosLotAcum'
    @sap.quickinfo : 'Embalar lotes acumulados/posición cl.valoración'
    chhpv : Boolean;
    @sap.display.format : 'UpperCase'
    @sap.label : '¿Consignación?'
    @sap.quickinfo : 'Pedido para la consignación'
    cons_order : String(1);
    @sap.display.format : 'NonNegative'
    @sap.label : 'Posición'
    @sap.quickinfo : 'Posición de entrega'
    fsh_vas_prnt_id : String(6);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Ubicación'
    lgpla : String(10);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Centro de beneficio'
    prctr : String(10);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Centro de coste'
    kostl : String(10);
    @sap.label : 'Punto de recepción'
    empst : String(25);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Almacén receptor'
    @sap.quickinfo : 'Almacén receptor/emisor'
    umlgo : String(4);
    @sap.label : 'Punto carga/descarga'
    @sap.quickinfo : 'Punto de carga/descarga'
    loading_point : String(20);
    @sap.label : 'Lista de objetos'
    @sap.quickinfo : 'Número de la lista de objetos'
    obknr : Integer64;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Entrega'
    lief_nr : String(10);
    @sap.display.format : 'NonNegative'
    @sap.label : 'Posición'
    @sap.quickinfo : 'Posición de entrega'
    posnr_se : String(6);
    @sap.display.format : 'Date'
    @sap.label : 'Fecha'
    datum : Date;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Equipo'
    @sap.quickinfo : 'Número de equipo'
    equnr : String(18);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Número de serie'
    sernr : String(18);
    @sap.display.format : 'Date'
    @sap.label : 'Fecha'
    datum_ob : Date;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Cabecera lista-objet'
    @sap.quickinfo : 'Tabla para los números de serie'
    taser : String(5);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Producto'
    @sap.quickinfo : 'Número de producto'
    product : String(40);
    @sap.display.format : 'NonNegative'
    @sap.label : 'Posición modelo'
    @sap.quickinfo : 'Núm.posición de la posición modelo'
    vgpos : String(6);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Proveedor'
    @sap.quickinfo : 'Número de cuenta del proveedor'
    lifnr : String(10);
  };
};

