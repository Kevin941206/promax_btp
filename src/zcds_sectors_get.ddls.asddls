@EndUserText.label: 'Recupera sectores'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_SECTORS_GET as select from zsectors_table
{
    key spras, 
    key spart,
        vtext
}
