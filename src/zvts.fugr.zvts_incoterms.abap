FUNCTION zvts_incoterms.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(LANGU) TYPE  SY-LANGU
*"  EXPORTING
*"     VALUE(INCO) TYPE  ZTT_TINCT
*"----------------------------------------------------------------------
*refresh Inco. clear Inco.
  CLEAR inco.
*
*select * into table INCO from Tinct where spras eq langu.
  zcl_qry_operations_to_s4hana=>incoterms_tinct( EXPORTING i_operacion = 'READ' i_langu = langu IMPORTING inco = inco ).

ENDFUNCTION.
