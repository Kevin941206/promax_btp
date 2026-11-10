CLASS zcl_http_serv_po_send_conf DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_PO_SEND_CONF IMPLEMENTATION.


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

    DATA: lv_ebeln  TYPE ebeln,
          lv_langu  TYPE spras,
          lt_detail TYPE zvts_tt_po_confirm,
          ls_detail LIKE LINE OF lt_detail,
          lv_msg    TYPE char255,
          ls_in     TYPE zst_po_send_conf_in,
          ls_out    TYPE zst_po_send_conf_out.
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

    CALL FUNCTION 'ZVTS_PO_SEND_CONF'
      EXPORTING
        po_number = ls_in-po_number
        language  = ls_in-language
        detail    = ls_in-detail-item
      IMPORTING
        message   = lv_msg.

    ls_out-message = lv_msg.
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

    REPLACE ALL OCCURRENCES OF '"DELIV_DATE":""' IN lv_json WITH '"DELIV_DATE":"0000-00-00"'.

    REPLACE ALL OCCURRENCES OF '"ITEM":{' IN lv_json WITH '"item":{'.
    REPLACE ALL OCCURRENCES OF '"ITEM":[' IN lv_json WITH '"item":['.

    response->set_text( lv_json ).

  ENDMETHOD.
ENDCLASS.
