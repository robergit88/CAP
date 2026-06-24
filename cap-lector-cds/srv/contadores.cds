service ContadoresService {
    @readonly
    entity Contadores {
        key vbeln : String(10);
        key posnr : String(6);
            matnr : String(18);
            werks : String(4);
    }
}
