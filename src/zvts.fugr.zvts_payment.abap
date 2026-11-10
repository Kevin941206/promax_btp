FUNCTION zvts_payment.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(CODE) TYPE  CHAR1
*"     VALUE(VENDOR) TYPE  ZST_LFA1-LIFNR
*"     VALUE(COMPANY) TYPE  ZT001-BUKRS OPTIONAL
*"     VALUE(PERIOD) TYPE  CHAR1 OPTIONAL
*"     VALUE(START_DATE) TYPE  SY-DATUM OPTIONAL
*"     VALUE(END_DATE) TYPE  SY-DATUM OPTIONAL
*"     VALUE(LANGU) TYPE  SY-LANGU OPTIONAL
*"  EXPORTING
*"     REFERENCE(PAYMENT_P) TYPE  ZVTS_TT_PAYMENT_P
*"     REFERENCE(PAYMENT_S) TYPE  ZVTS_TT_PAYMENT_S
*"----------------------------------------------------------------------
  PERFORM llena_rangos USING company period start_date end_date.

  CLEAR prov.
  IF vendor CA 'ABCDEFGHIJKLMNOPQRSTVWXYZ'.
    prov  = vendor.
  ELSE.
    provc = vendor.
    prov  = provc.
  ENDIF.


  CASE code.
    WHEN 'P'. " Pendiente de Pago
      PERFORM get_info_p USING vendor company period start_date end_date langu.
      PERFORM list_info_p USING p_lan payment_p.
    WHEN 'S'. "Pagado
      PERFORM get_info_s USING vendor company period start_date end_date langu.
      PERFORM list_info_s USING payment_s p_lan company.
  ENDCASE.


ENDFUNCTION.
