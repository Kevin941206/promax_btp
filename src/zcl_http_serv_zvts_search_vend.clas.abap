CLASS zcl_http_serv_zvts_search_vend DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_ZVTS_SEARCH_VEND IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.
    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS: <data>        TYPE data,
                   <field>       TYPE any,
                   <field_value> TYPE data.

    DATA: vtt_vendor TYPE ztt_zvts_vendor,
          lv_vendor  TYPE zst_lfa1-lifnr,
          lv_name    TYPE zst_lfb1-intad,
          ls_out     TYPE zst_search_vendor_out2.
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
      ASSIGN COMPONENT 'VENDOR' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_vendor = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'NAME' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_name = <field_value>.
        ENDIF.
      ENDIF.
    ENDIF.

    CALL FUNCTION 'ZVTS_SEARCH_VENDOR'
      IMPORTING
        vtt_vendor = ls_out-vts_vendor-item
      CHANGING
        name       = lv_name
        vendor     = lv_vendor.

    ls_out-name = lv_name.
    ls_out-vendor = lv_vendor.

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

    DATA(lv_lines) = lines( ls_out-vts_vendor-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'VTS_VENDOR' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      SPLIT lv_aux4 AT ']' INTO DATA(lv_aux5) DATA(lv_aux6).
      CONCATENATE lv_aux1 'VTS_VENDOR' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ELSEIF lv_lines = 0.
      SPLIT lv_json AT 'VTS_VENDOR":' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '{"item":[]}' INTO lv_aux3 lv_aux4.
      CONCATENATE lv_aux1 'VTS_VENDOR":' '""' lv_aux3 lv_aux4 INTO lv_json.
    ENDIF.

    response->set_text( lv_json ).

  ENDMETHOD.
ENDCLASS.
