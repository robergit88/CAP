// srv/service.cds
using ZI_EXT0040_ENT_CONTADORES_CDS as external from '../srv/external/ZI_EXT0040_ENT_CONTADORES_CDS';

service ContadoresService {
    @readonly
    entity Contadores as projection on external.ZI_EXT0040_ENT_CONTADORES;
}
