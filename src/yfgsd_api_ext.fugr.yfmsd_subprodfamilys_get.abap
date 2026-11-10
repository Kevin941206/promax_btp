FUNCTION yfmsd_subprodfamilys_get.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  EXPORTING
*"     VALUE(ET_PROD_SUBFAMILIES) TYPE  YTTSD_PRODFAM_T
*"----------------------------------------------------------------------
** Recupera las subfamilias actuales de producto
*  SELECT *
*    FROM YTSD_PRODFAM_T
*    INTO TABLE @ET_PROD_SUBFAMILIES.

  zcl_qry_operations_to_s4hana=>zprodfam_t( EXPORTING i_operacion = 'READ' IMPORTING et_prod_subfamilies = et_prod_subfamilies ).

ENDFUNCTION.
