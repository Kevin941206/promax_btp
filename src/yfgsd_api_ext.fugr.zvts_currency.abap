FUNCTION zvts_currency.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(LANGU) TYPE  SY-LANGU
*"  EXPORTING
*"     VALUE(CURRENCY) TYPE  ZTT_TCURT
*"----------------------------------------------------------------------
  " You can use the template 'functionModuleParameter' to add here the signature!
  .

*Refresh currency. Clear Currency.
*
*select * into table currency from TCURT where spras eq langu and ( waers eq 'MXN' or waers eq 'USD' ).
*
*select *  appending table currency from TCURT where spras eq langu.
  DATA: lt_tcurt TYPE ztt_tcurt,
        ls_tcurt TYPE zes_tcurt,
        z_langu  TYPE c LENGTH 2.

  zcl_tcurt=>currency_get( EXPORTING i_operacion = 'READ' i_spras = langu IMPORTING currency_get = currency ).

  zcl_tcurt=>currency_get2( EXPORTING i_operacion = 'READ' i_spras = langu IMPORTING currency_get = lt_tcurt ).
  APPEND LINES OF lt_tcurt TO currency.

ENDFUNCTION.
