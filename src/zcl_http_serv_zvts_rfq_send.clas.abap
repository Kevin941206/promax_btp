CLASS zcl_http_serv_zvts_rfq_send DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_ZVTS_RFQ_SEND IMPLEMENTATION.


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

    DATA: lv_quotation TYPE ebeln,
          lv_langu     TYPE sy-langu,
          lv_currency  TYPE waers,
          lv_reference TYPE text12,
          lv_incoterm  TYPE char3,
          lv_incoterm2 TYPE zinco2,
          lv_comments  TYPE char255,
          lv_ssouser   TYPE char20,
          detail       TYPE ztt_zvts_rfq_upd,
          ls_detail    LIKE LINE OF detail,
          lv_message   TYPE char255,
          ls_in        TYPE zst_rfq_send_in,
          ls_out       TYPE zst_rfq_send_out.
    DATA: lt_mappings TYPE /ui2/cl_json=>name_mappings,
          ls_mappings LIKE LINE OF lt_mappings.
*    lv_vbeln        TYPE vbeln_va,
*          lv_invoice      TYPE zvbeln_vf,
*          lv_name1        TYPE name1_gp,
*          lv_name2        TYPE name2_gp,
*          lv_begin_date   TYPE erdat,
*          lv_end_date     TYPE erdat,
*          lt_bukrs        TYPE ztt_ebpp_bukrs,
*          ls_bukrs        LIKE LINE OF lt_bukrs,
*          lt_sold_to      TYPE ztt_wkunnr,
*          ls_sold_to      LIKE LINE OF lt_sold_to,
*          lt_ship_to      TYPE ztt_wkunnr,
*          ls_ship_to      LIKE LINE OF lt_ship_to,
*          lt_sales_orders TYPE yttsd_salesorder_list_e,
*          lt_invoices     TYPE yttsd_invoices_list_t,
*          lv_from         TYPE char10,
*          lv_to           TYPE char10.

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

    CALL FUNCTION 'ZVTS_RFQ_SEND'
      EXPORTING
        quotation = ls_in-quotation
        langu     = ls_in-langu
        currency  = ls_in-currency
        reference = ls_in-reference
        incoterm  = ls_in-incoterm
        incoterm2 = ls_in-incoterm2
        comments  = ls_in-comments
        ssouser   = ls_in-ssouser
        detail    = ls_in-detail-item
      IMPORTING
        message   = lv_message.

    ls_out-message = lv_message.
    ls_out-detail-item = ls_in-detail-item.

*    ls_mappings-abap = 'ITEM'.
*    ls_mappings-json = 'item'.
*    INSERT ls_mappings INTO TABLE lt_mappings.

    "Convertimos el resultado en json
    lv_json = /ui2/cl_json=>serialize(
             data        = ls_out
             pretty_name = /ui2/cl_json=>pretty_mode-none  " Optional: camelCase keys
             compress    = abap_false                            " Pretty print
             name_mappings = lt_mappings
           ).

    DATA(lv_lines) = lines( ls_out-detail-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'DETAIL' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      REPLACE ALL OCCURRENCES OF ']' IN lv_aux4 WITH space.
      CONCATENATE lv_aux1 'DETAIL' lv_aux3 lv_aux4 INTO lv_json.
    ELSEIF lv_lines = 0.
      SPLIT lv_json AT 'DETAIL":' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '{"ITEM":[]}' INTO lv_aux3 lv_aux4.
      CONCATENATE lv_aux1 'DETAIL":' '""' lv_aux3 lv_aux4 INTO lv_json.
    ENDIF.

    REPLACE ALL OCCURRENCES OF '"DEL_DATE":""' IN lv_json WITH '"DEL_DATE":"0000-00-00"'.

    REPLACE ALL OCCURRENCES OF '"ITEM":{' IN lv_json WITH '"item":{'.
    REPLACE ALL OCCURRENCES OF '"ITEM":[' IN lv_json WITH '"item":['.

    response->set_text( lv_json ).

  ENDMETHOD.
ENDCLASS.
