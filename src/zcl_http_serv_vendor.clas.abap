CLASS zcl_http_serv_vendor DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_VENDOR IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS:
      <data>        TYPE data,
      <results>     TYPE any,
      <structure>   TYPE any,
      <table>       TYPE ANY TABLE,
      <field>       TYPE any,
      <field_value> TYPE data.

    DATA: lt_load_vendor TYPE ztt_load_vendor,
          ls_load_vendor TYPE zload_vendor,
          lv_vendor      TYPE lifnr,
          lv_message     TYPE char256,
          ls_in          TYPE zst_vendor_in,
          ls_out         TYPE zst_vendor_out.
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

    IF ls_in IS NOT INITIAL.
      CALL FUNCTION 'ZVTS_VENDOR'
        EXPORTING
          load_vendor = ls_in-load_vendor-item
        IMPORTING
          vendor      = lv_vendor
          message     = lv_message.
    ENDIF.

    ls_out-message = lv_message.
    ls_out-vendor = lv_vendor.
    ls_out-load_vendor-item = ls_in-load_vendor-item.

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

    DATA(lv_lines) = lines( ls_out-load_vendor-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'LOAD_VENDOR' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      REPLACE ALL OCCURRENCES OF ']' IN lv_aux4 WITH space.
      CONCATENATE lv_aux1 'LOAD_VENDOR' lv_aux3 lv_aux4 INTO lv_json.
    ELSEIF lv_lines = 0.
      SPLIT lv_json AT 'LOAD_VENDOR":' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '{"item":[]}' INTO lv_aux3 lv_aux4.
      CONCATENATE lv_aux1 'LOAD_VENDOR":' '""' lv_aux3 lv_aux4 INTO lv_json.
    ENDIF.

    response->set_text( lv_json ).

  ENDMETHOD.
ENDCLASS.
