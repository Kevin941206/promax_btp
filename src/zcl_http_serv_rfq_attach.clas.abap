CLASS zcl_http_serv_rfq_attach DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_RFQ_ATTACH IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS: <data>        TYPE data,
                   <field>       TYPE any,
                   <field_value> TYPE data.

    DATA: quotation TYPE ebeln,
          attach    TYPE zvtt_attach,
          ls_out    TYPE zst_rfq_attach_out.
    DATA: lt_mappings TYPE /ui2/cl_json=>name_mappings,
          ls_mappings LIKE LINE OF lt_mappings,
          lv_quotation TYPE ebeln.

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
      ASSIGN COMPONENT 'QUOTATION' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          quotation  = <field_value>.
          lv_quotation = |{ quotation ALPHA = IN }|.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.
    ENDIF.

    CALL FUNCTION 'ZVTS_RFQ_ATTACH'
      EXPORTING
        quotation = lv_quotation
      IMPORTING
        attach    = ls_out-attach-item.

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
    READ TABLE ls_out-attach-item INTO DATA(ls_attch_item) INDEX 1.
    DATA(lv_lines) = lines( ls_attch_item-type_asc ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'TYPE_ASC' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      SPLIT lv_aux4 AT ']' INTO DATA(lv_aux5) DATA(lv_aux6).
      CONCATENATE lv_aux1 'TYPE_ASC' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ELSEIF lv_lines = 0.
*      SPLIT lv_json AT 'TYPE_ASC":' INTO lv_aux1 lv_aux2.
*      SPLIT lv_aux2 AT '[]' INTO lv_aux3 lv_aux4.
*      CONCATENATE lv_aux1 'TYPE_ASC":' '""' lv_aux3 lv_aux4 INTO lv_json.
      REPLACE ALL OCCURRENCES OF '"TYPE_ASC":[]' IN lv_json WITH '"TYPE_ASC":""'.
    ENDIF.

    lv_lines = lines( ls_out-attach-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'ATTACH' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '[' INTO lv_aux3 lv_aux4.
      SPLIT lv_aux4 AT ']' INTO lv_aux5 lv_aux6.
      CONCATENATE lv_aux1 'ATTACH' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ELSEIF lv_lines = 0.
      SPLIT lv_json AT 'ATTACH":' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '{"item":[]}' INTO lv_aux3 lv_aux4.
      CONCATENATE lv_aux1 'ATTACH":' '""' lv_aux3 lv_aux4 INTO lv_json.
    ENDIF.

    response->set_text( lv_json ).

  ENDMETHOD.
ENDCLASS.
