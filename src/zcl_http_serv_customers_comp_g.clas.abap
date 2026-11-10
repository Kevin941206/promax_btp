CLASS zcl_http_serv_customers_comp_g DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_CUSTOMERS_COMP_G IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.
    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS: <data>        TYPE data,
                   <field>       TYPE any,
                   <field_value> TYPE data.

    DATA: et_customers_list TYPE yttsd_customer_list_e,
          lv_company        TYPE bukrs,
          ls_out            TYPE zst_customers_comp_get_out.
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
      ASSIGN COMPONENT 'COMPANY' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
        lv_company = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.


    ENDIF.

    CALL FUNCTION 'YFMSD_CUSTOMERS_COMP_GET'
      EXPORTING
        iv_companycode    = lv_company
      IMPORTING
        et_customers_list = ls_out-et_customers_list-item.

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

    DATA(lv_lines) = lines( ls_out-et_customers_list-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'ET_CUSTOMERS_LIST' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      REPLACE ALL OCCURRENCES OF ']' IN lv_aux4 WITH space.
      CONCATENATE lv_aux1 'ET_CUSTOMERS_LIST' lv_aux3 lv_aux4 INTO lv_json.
    ENDIF.

    response->set_text( lv_json ).

  ENDMETHOD.
ENDCLASS.
