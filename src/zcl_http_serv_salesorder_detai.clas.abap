CLASS zcl_http_serv_salesorder_detai DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_SALESORDER_DETAI IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS: <data>        TYPE data,
                   <field>       TYPE any,
                   <field_value> TYPE data.

    DATA: lv_sales_rder                TYPE vbeln,
          ls_ystsd_salesorder_detail_e TYPE ystsd_salesorder_detail_e,
          ls_ystsd_totales_s           TYPE ystsd_totales_s,
          lt_yttsd_contacts_s          TYPE yttsd_contacts_s,
          lt_yttsd_positions_s         TYPE yttsd_positions_s,
          lt_yttsd_dates_s             TYPE yttsd_dates_s,
          lt_yttsd_invoices_s          TYPE yttsd_invoices_s,
          ls_out                       TYPE zst_salesorder_details_out.
    DATA: lt_mappings TYPE /ui2/cl_json=>name_mappings,
          ls_mappings LIKE LINE OF lt_mappings.

    "Obtenemos el json
    DATA(lv_json) = request->get_text( )."{"iv_sales_order": "0000000002"}

    "Convertimos el json
    CALL METHOD /ui2/cl_json=>deserialize
      EXPORTING
        json         = lv_json
        pretty_name  = /ui2/cl_json=>pretty_mode-user
        assoc_arrays = abap_true
      CHANGING
        data         = lr_data.
    IF lr_data IS BOUND.
      ASSIGN lr_data->* TO <data>.
      ASSIGN COMPONENT 'IV_SALES_ORDER' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_sales_rder = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.
    ENDIF.

    CALL FUNCTION 'YFMSD_SALESORDER_DETAILS'
      EXPORTING
        iv_sales_order         = lv_sales_rder
      IMPORTING
        es_sales_order_details = ls_ystsd_salesorder_detail_e
        es_totales             = ls_ystsd_totales_s
        et_contacts            = lt_yttsd_contacts_s
        et_positions           = lt_yttsd_positions_s
        et_dates               = lt_yttsd_dates_s
        et_invoices            = lt_yttsd_invoices_s.

    ls_out-es_sales_order_details = ls_ystsd_salesorder_detail_e.
    ls_out-es_totales = ls_ystsd_totales_s.
    ls_out-et_contacts-item = lt_yttsd_contacts_s.
    ls_out-et_positions-item = lt_yttsd_positions_s.
    ls_out-et_dates-item = lt_yttsd_dates_s.
    ls_out-et_invoices-item = lt_yttsd_invoices_s.

    ls_mappings-abap = 'ITEM'.
    ls_mappings-json = 'item'.
    INSERT ls_mappings INTO TABLE lt_mappings.

    "Convertimos el resultado en json
    DATA(lv_json2) = /ui2/cl_json=>serialize(
             data        = ls_out
             pretty_name = /ui2/cl_json=>pretty_mode-none  " Optional: camelCase keys
             compress    = abap_false                            " Pretty print
             name_mappings = lt_mappings
           ).

    DATA(lv_lines) = lines( lt_yttsd_contacts_s ).
    IF lv_lines = 1.
      SPLIT lv_json2 AT 'ET_CONTACTS' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      SPLIT lv_aux4 AT ']' INTO DATA(lv_aux5) DATA(lv_aux6).
      CONCATENATE lv_aux1 'ET_CONTACTS' lv_aux3 lv_aux5 lv_aux5 INTO lv_json2.
    ENDIF.
    DATA(lv_lines2) = lines( lt_yttsd_positions_s ).
    IF lv_lines2 = 1.
      SPLIT lv_json2 AT 'ET_POSITIONS' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '[' INTO lv_aux3 lv_aux4.
      SPLIT lv_aux4 AT ']' INTO lv_aux5 lv_aux6.
      CONCATENATE lv_aux1 'ET_POSITIONS' lv_aux3 lv_aux5 lv_aux6 INTO lv_json2.
    ENDIF.
    DATA(lv_lines3) = lines( lt_yttsd_dates_s ).
    IF lv_lines3 = 1.
      SPLIT lv_json2 AT 'ET_DATES' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '[' INTO lv_aux3 lv_aux4.
      SPLIT lv_aux4 AT ']' INTO lv_aux5 lv_aux6.
      CONCATENATE lv_aux1 'ET_DATES' lv_aux3 lv_aux5 lv_aux6 INTO lv_json2.
    ENDIF.
    DATA(lv_lines4) = lines( lt_yttsd_invoices_s ).
    IF lv_lines4 = 1.
      SPLIT lv_json2 AT 'ET_INVOICES' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '[' INTO lv_aux3 lv_aux4.
      SPLIT lv_aux4 AT ']' INTO lv_aux5 lv_aux6.
      CONCATENATE lv_aux1 'ET_INVOICES' lv_aux3 lv_aux5 lv_aux6 INTO lv_json2.
    ENDIF.

    REPLACE ALL OCCURRENCES OF '"DOC_DATE":""' IN lv_json WITH '"DOC_DATE":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"REQ_DATE_H":""' IN lv_json WITH '"REQ_DATE_H":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"DATE_PLAN_DEL":""' IN lv_json WITH '"DATE_PLAN_DEL":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"DATE_PLAN_DIS":""' IN lv_json WITH '"DATE_PLAN_DEL":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"ERDAT":""' IN lv_json WITH '"ERDAT":"0000-00-00"'.

    response->set_text( lv_json2 ).

  ENDMETHOD.
ENDCLASS.
