FUNCTION zvts_tax.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(LANGU) TYPE  SY-LANGU OPTIONAL
*"  EXPORTING
*"     VALUE(TAX) TYPE  ZTT_ZTAX
*"----------------------------------------------------------------------

*select MWSKZ TEXT1 into (T007S-MWSKZ, T007S-TEXT1)
*from T007S
*where SPRAS eq LANGU
*and   KALSM eq 'TAXMX'.
* check T007S-MWSKZ eq 'V0' or T007S-MWSKZ eq 'V4'.
*   move: T007S-MWSKZ to TAX-INDTAX,
*         T007S-TEXT1 to TAX-TEXT.
*   append TAX.
*
*endselect.

  zcl_qry_zvts_tax=>ztax_t007s( EXPORTING i_operacion = 'READ' i_langu = langu IMPORTING tax = tax ).


ENDFUNCTION.
