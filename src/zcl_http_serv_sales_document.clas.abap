CLASS zcl_http_serv_sales_document DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_SALES_DOCUMENT IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS: <data>        TYPE data,
                   <field>       TYPE any,
                   <field_value> TYPE data.

    DATA: lv_document TYPE vbeln,
          ls_customer TYPE zsales_customer,
          ls_document TYPE zsales_document,
          lv_doctype  TYPE zvbtypl,
          ls_return   TYPE bapiret1,
          t_detail    TYPE ztt_sales_data,
          t_shipment  TYPE ztt_transp_data,
          ls_out      TYPE zst_document_info_out.
    DATA: lt_mappings TYPE /ui2/cl_json=>name_mappings,
          ls_mappings LIKE LINE OF lt_mappings.

    DATA(lv_json) = request->get_text( ).

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
      ASSIGN COMPONENT 'I_DOCUMENT' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_document = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.
    ENDIF.

    CALL FUNCTION 'ZSALES_DOCUMENT_INFO'
      EXPORTING
        i_document = lv_document
      IMPORTING
        e_customer = ls_out-e_customer
        e_document = ls_out-e_document
        e_doctype  = ls_out-e_doctype
        e_return   = ls_out-e_return
        t_detail   = ls_out-t_detail-item
        t_shipment = ls_out-t_shipment-item.

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

    DATA(lv_lines) = lines( ls_out-t_detail-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'T_DETAIL' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      SPLIT lv_aux4 AT ']' INTO DATA(lv_aux5) DATA(lv_aux6).
      CONCATENATE lv_aux1 'T_DETAIL' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ENDIF.
    lv_lines = lines( ls_out-t_shipment-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'T_SHIPMENT' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '[' INTO lv_aux3 lv_aux4.
      SPLIT lv_aux4 AT ']' INTO lv_aux5 lv_aux6.
      CONCATENATE lv_aux1 'T_SHIPMENT' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ENDIF.

    response->set_text( lv_json ).

  ENDMETHOD.
ENDCLASS.
