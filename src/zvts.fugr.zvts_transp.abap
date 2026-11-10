FUNCTION zvts_transp.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(LANGU) TYPE  SY-LANGU OPTIONAL
*"  EXPORTING
*"     VALUE(TRANSP) TYPE  ZTT_TVTYT
*"----------------------------------------------------------------------
*clear TRANSP. refresh TRANSP.
  CLEAR transp.

*select * from TVTY
*where VELTP eq 'A'.
*  select single *
*  from TVTYT
*  where spras eq LANGU
*  and   TRATY eq TVTY-TRATY.
*  check sy-subrc eq 0.
*    move-corresponding TVTYT to TRANSP.
*    append TRANSP.
*
*endselect.
  zcl_qry_zvts_transp=>zvts_transp( EXPORTING i_operacion = 'READ' i_langu = langu IMPORTING transp = transp ).

ENDFUNCTION.
