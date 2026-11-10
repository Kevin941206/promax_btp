CLASS zcl_http_serv_salesorder_list DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_SALESORDER_LIST IMPLEMENTATION.


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

    DATA: lv_vbeln        TYPE vbeln_va,
          lv_invoice      TYPE zvbeln_vf,
          lv_name1        TYPE name1_gp,
          lv_name2        TYPE name2_gp,
          lv_begin_date   TYPE erdat,
          lv_end_date     TYPE erdat,
          lt_bukrs        TYPE ztt_ebpp_bukrs,
          ls_bukrs        LIKE LINE OF lt_bukrs,
          lt_sold_to      TYPE ztt_wkunnr,
          ls_sold_to      LIKE LINE OF lt_sold_to,
          lt_ship_to      TYPE ztt_wkunnr,
          ls_ship_to      LIKE LINE OF lt_ship_to,
          lt_sales_orders TYPE yttsd_salesorder_list_e,
          lt_invoices     TYPE yttsd_invoices_list_t,
          lv_from         TYPE char10,
          lv_to           TYPE char10,
          ls_in TYPE zst_salesorder_list_in,
          ls_out TYPE zst_salesorder_list_out.
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

*    lv_begin_date = lv_from+6(4) && lv_from+3(2) && lv_from(2).
*    lv_end_date = lv_to+6(4) && lv_to+3(2) && lv_to(2).

    CALL FUNCTION 'YFMSD_SALESORDER_LIST'
      EXPORTING
        iv_sales_order  = ls_in-iv_sales_order
        iv_invoice      = ls_in-iv_invoice
        iv_name1        = ls_in-iv_name1
        iv_name2        = ls_in-iv_name2
        iv_begin_date   = ls_in-iv_begin_date
        iv_end_date     = ls_in-iv_end_date
        it_bukrs        = ls_in-it_bukrs-item
        it_sold_to      = ls_in-it_sold_to-item
        it_ship_to      = ls_in-it_ship_to-item
      IMPORTING
        et_sales_orders = lt_sales_orders
        et_invoices     = lt_invoices.

    ls_out-it_bukrs-item = ls_in-it_bukrs-item.
    ls_out-it_sold_to-item = ls_in-it_sold_to-item.
    ls_out-it_ship_to-item = ls_in-it_ship_to-item.
    ls_out-et_sales_orders-item = lt_sales_orders.
    ls_out-et_invoices-item = lt_invoices.

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

    DATA(lv_lines) = lines( ls_out-it_bukrs-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'IT_BUKRS' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      SPLIT lv_aux4 AT ']' INTO DATA(lv_aux5) DATA(lv_aux6).
      CONCATENATE lv_aux1 'IT_BUKRS' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ENDIF.
    lv_lines = lines( ls_out-it_sold_to-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'IT_SOLD_TO' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '[' INTO lv_aux3 lv_aux4.
      SPLIT lv_aux4 AT ']' INTO lv_aux5 lv_aux6.
      CONCATENATE lv_aux1 'IT_SOLD_TO' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ENDIF.
    lv_lines = lines( ls_out-it_ship_to-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'IT_SHIP_TO' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '[' INTO lv_aux3 lv_aux4.
      SPLIT lv_aux4 AT ']' INTO lv_aux5 lv_aux6.
      CONCATENATE lv_aux1 'IT_SHIP_TO' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ENDIF.
    lv_lines = lines( ls_out-et_sales_orders-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'ET_SALES_ORDERS' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '[' INTO lv_aux3 lv_aux4.
      SPLIT lv_aux4 AT ']' INTO lv_aux5 lv_aux6.
      CONCATENATE lv_aux1 'ET_SALES_ORDERS' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ENDIF.
    lv_lines = lines( ls_out-et_invoices-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'ET_INVOICES' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '[' INTO lv_aux3 lv_aux4.
      SPLIT lv_aux4 AT ']' INTO lv_aux5 lv_aux6.
      CONCATENATE lv_aux1 'ET_INVOICES' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ENDIF.

    REPLACE ALL OCCURRENCES OF '"ERDAT":""' IN lv_json WITH '"ERDAT":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"FKDAT":""' IN lv_json WITH '"FKDAT":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"NETDT":""' IN lv_json WITH '"NETDT":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"ZFBDT":""' IN lv_json WITH '"ZFBDT":"0000-00-00"'.

    response->set_text( lv_json ).

  ENDMETHOD.
ENDCLASS.
