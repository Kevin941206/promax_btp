FUNCTION yfmsd_sectors_get.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  EXPORTING
*"     VALUE(ET_SECTORS) TYPE  ZTT_TSPAT
*"----------------------------------------------------------------------
** Recupera sectores (con textos en español o inglés)
*  SELECT *
*    INTO TABLE ET_SECTORS
*    FROM TSPAT
*    WHERE SPRAS = GC_SPANISH
*    OR SPRAS = GC_ENGLISH.

zcl_qry_operations_to_s4hana=>tspat( EXPORTING i_operacion = 'READ' IMPORTING et_sectors = et_sectors ).

ENDFUNCTION.
