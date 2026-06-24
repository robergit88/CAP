/* checksum : b7923f4c0ef316b4f5cbf896e88319de */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service solped_attach {
  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.content.version : '1'
  @sap.label : 'Document Attach for Solicitudes Pedido (ME53N)'
  entity ZA_SOLPED_ATTACH {
    @sap.display.format : 'UpperCase'
    @sap.label : 'Solicitud de pedido'
    @sap.quickinfo : 'Número de la solicitud de pedido'
    key SolicitudId : String(10) not null;
    @sap.label : 'ID doc.archivo'
    @sap.quickinfo : 'SAP ArchiveLink: ID del documento de archivo'
    key Sapadokid : String(40) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Repository conten.'
    @sap.quickinfo : 'Lugar archivo p.documentos físicos'
    key Saparcid : String(30) not null;
    @sap.label : 'Texto'
    @sap.quickinfo : 'Texto de longitud 10'
    key PartId : String(10) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Ident.objeto SAP'
    @sap.quickinfo : 'SAp ArchiveLink: ID de objeto (identificador de objeto)'
    ObjectId : String(50);
    @sap.display.format : 'UpperCase'
    @sap.label : 'SAP ArchiveLink: Info pool/Estrategia de archivo'
    @sap.heading : ''
    MimeType : String(128);
    @sap.label : 'Nombre de anexo'
    FileName : String;
    @sap.label : 'Símbolo Base64'
    @sap.quickinfo : 'Símbolo codificado con Base64'
    ContentBase64 : String;
    to_HEADER : Association to ZA_SOLPED_HEADER {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.content.version : '1'
  @sap.label : 'Document Attach for Solicitudes Pedido - Padre (ME53N)'
  entity ZA_SOLPED_HEADER {
    @sap.display.format : 'UpperCase'
    @sap.label : 'Solicitud de pedido'
    @sap.quickinfo : 'Número de la solicitud de pedido'
    key SolicitudId : String(10) not null;
    @sap.label : 'ID doc.archivo'
    @sap.quickinfo : 'SAP ArchiveLink: ID del documento de archivo'
    key Sapadokid : String(40) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Repository conten.'
    @sap.quickinfo : 'Lugar archivo p.documentos físicos'
    key Saparcid : String(30) not null;
    to_Attachments : Composition of many ZA_SOLPED_ATTACH {  };
  };
};

