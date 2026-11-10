FUNCTION zvts_payment_terms.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(LANGU) TYPE  SY-LANGU
*"  EXPORTING
*"     VALUE(TERMS) TYPE  ZTT_IOBJ_ZTERM_DESC
*"----------------------------------------------------------------------
  CLEAR terms.

*select * from T052U where spras eq langu.
*move: T052U-zterm to Terms-zterm,
*      T052U-text1 to Terms-text1.
*append Terms.
*endselect.

  zcl_qry_zvts_payment_terms=>t052u_terms( EXPORTING i_operacion = 'READ' i_langu = langu IMPORTING terms = terms ).

ENDFUNCTION.
