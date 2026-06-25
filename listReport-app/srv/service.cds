service ContadoresService {
    @readonly
    entity Contadores {
        key vbeln : String(10);
        key posnr : String(6);
            matnr : String(40);
            werks : String(4);
            lgort : String(4);
            charg : String(10);
            erdat : Date;
            lfimg : Decimal(13, 3);
            equnr : String(18);
            sernr : String(18);
            lifnr : String(10);
            prctr : String(10);
    }
}
