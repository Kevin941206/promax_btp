CLASS zcl_http_serv_zverifica_factur DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_ZVERIFICA_FACTUR IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.
    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS:
      <data>        TYPE data,
      <data2>       TYPE data,
      <results>     TYPE any,
      <structure>   TYPE any,
      <table>       TYPE ANY TABLE,
      <field>       TYPE any,
      <field_value> TYPE data.

    DATA: lv_invoice    TYPE char10,
          lv_year       TYPE gjahr,
          lv_invoice_fi TYPE char10,
          lv_year_fi    TYPE gjahr,
          lv_folio      TYPE char10,
          lv_error_flag TYPE char1,
          it_message    TYPE ztt_message,
          it_invoice    TYPE ztt_invoice,
          wa_invoice    LIKE LINE OF it_invoice,
          wa_hst        TYPE zhst,
          it_hst        TYPE STANDARD TABLE OF zhst,
          lv_message    TYPE char255,
          ls_in TYPE zst_verifica_factura_in,
          ls_out        TYPE zst_verifica_factura_out.
    DATA: lt_mappings TYPE /ui2/cl_json=>name_mappings,
          ls_mappings LIKE LINE OF lt_mappings.

    "Obtenemos el json
    DATA(lv_json) = request->get_text( ).

    "Convertimos el json a una tabla interna
    CALL METHOD /ui2/cl_json=>deserialize
      EXPORTING
        json         = lv_json
        pretty_name  = /ui2/cl_json=>pretty_mode-user
        assoc_arrays = abap_true
      CHANGING
        data         = ls_in.

    CALL FUNCTION 'ZVERIFICA_FACTURA'
      EXPORTING
        i_invoice    = ls_in-i_invoice-item
        i_hst        = wa_hst
      IMPORTING
        l_invoice    = lv_invoice
        l_year       = lv_year
        l_invoice_fi = lv_invoice_fi
        l_year_fi    = lv_year_fi
        l_folio      = lv_folio
        error_flag   = lv_error_flag
        e_message    = it_message.

    ls_out-l_invoice = lv_invoice.
    ls_out-l_year = lv_year.
    ls_out-l_invoice_fi = lv_invoice_fi.
    ls_out-l_year_fi = lv_year_fi.
    ls_out-l_folio = lv_folio.
    ls_out-error_flag = lv_error_flag.
    ls_out-i_invoice-item = ls_in-i_invoice-item.
    ls_out-e_message-item = it_message.

    ls_mappings-abap = 'ITEM'.
    ls_mappings-json = 'item'.
    INSERT ls_mappings INTO TABLE lt_mappings.

    "Convertimos el resultado en json
    lv_json = /ui2/cl_json=>serialize(
             data        = ls_out
             pretty_name = /ui2/cl_json=>pretty_mode-none  " Optional: camelCase keys
             compress    = abap_false                            " Pretty print
             name_mappings = lt_mappings
           ).

    DATA(lv_lines) = lines( ls_out-i_invoice-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'I_INVOICE' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      SPLIT lv_aux4 AT ']' INTO DATA(lv_aux5) DATA(lv_aux6).
      CONCATENATE lv_aux1 'I_INVOICE' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ENDIF.
    DATA(lv_lines2) = lines( ls_out-i_hst-item ).
    IF lv_lines2 = 1.
      SPLIT lv_json AT 'I_HST' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '[' INTO lv_aux3 lv_aux4.
      SPLIT lv_aux4 AT ']' INTO lv_aux5 lv_aux6.
      CONCATENATE lv_aux1 'I_HST' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ENDIF.
    DATA(lv_lines3) = lines( ls_out-e_message-item ).
    IF lv_lines3 = 1.
      SPLIT lv_json AT 'E_MESSAGE' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '[' INTO lv_aux3 lv_aux4.
      SPLIT lv_aux4 AT ']' INTO lv_aux5 lv_aux6.
      CONCATENATE lv_aux1 'E_MESSAGE' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ENDIF.

    REPLACE ALL OCCURRENCES OF '"FEFACT":""' IN lv_json WITH '"FEFACT":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"FEBASE":""' IN lv_json WITH '"FEBASE":"0000-00-00"'.

    REPLACE ALL OCCURRENCES OF '{"item":[]}' IN lv_json WITH '""'.

    response->set_text( lv_json ).

  ENDMETHOD.
ENDCLASS.
