CLASS zcl_http_rfq_delete DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_RFQ_DELETE IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS: <data>        TYPE data,
                   <field>       TYPE any,
                   <data2>       TYPE data,
                   <table>       TYPE any,     "Aquí quedará la tabla del JSON
                   <field_value> TYPE data,
                   <line>        TYPE any.     "Aquí quedará cada registro de la tabla

    DATA: rfq_del  TYPE ztt_rfq,
          rfq_mssg TYPE ztt_tline,

          ls_del   TYPE zes_rfq,
          ls_mssg  TYPE zes_tline,
          mensaje  TYPE ztdline,
          ls_in    TYPE zst_rfq_delete_out,
          ls_out   TYPE zst_rfq_delete_out.
    DATA: lt_mappings TYPE /ui2/cl_json=>name_mappings,
          ls_mappings LIKE LINE OF lt_mappings.

    DATA(lv_json) = request->get_text( ).

    " Convertimos el JSON
    CALL METHOD /ui2/cl_json=>deserialize
      EXPORTING
        json         = lv_json
        pretty_name  = /ui2/cl_json=>pretty_mode-user
        assoc_arrays = abap_true
      CHANGING
        data         = ls_in.

    " Llamada a la función Z
    CALL FUNCTION 'ZVTS_RFQ_DELETE'
      EXPORTING
        rfq_del  = ls_in-rfq_del-item
      IMPORTING
        rfq_mssg = rfq_mssg.

    ls_out-rfq_del-item = ls_in-rfq_del-item.
    ls_out-rfq_mssg-item = rfq_mssg.

*    ls_mappings-abap = 'ITEM'.
*    ls_mappings-json = 'item'.
*    INSERT ls_mappings INTO TABLE lt_mappings.

    " Convertimos el resultado a JSON
    lv_json = /ui2/cl_json=>serialize(
                data        = ls_out
                pretty_name = /ui2/cl_json=>pretty_mode-none
                compress    = abap_false
                name_mappings = lt_mappings
              ).

    DATA(lv_lines) = lines( ls_out-rfq_del-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'RFQ_DEL' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      SPLIT lv_aux4 AT ']' INTO DATA(lv_aux5) DATA(lv_aux6).
      CONCATENATE lv_aux1 'RFQ_DEL' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ENDIF.
    lv_lines = lines( ls_out-rfq_mssg-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'RFQ_MSSG' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '[' INTO lv_aux3 lv_aux4.
      SPLIT lv_aux4 AT ']' INTO lv_aux5 lv_aux6.
      CONCATENATE lv_aux1 'RFQ_MSSG' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ELSEIF lv_lines = 0.
      SPLIT lv_json AT 'RFQ_MSSG":' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '{"ITEM":[]}' INTO lv_aux3 lv_aux4.
      CONCATENATE lv_aux1 'RFQ_MSSG":' '""' lv_aux3 lv_aux4 INTO lv_json.
    ENDIF.

    REPLACE ALL OCCURRENCES OF '"ITEM":{' IN lv_json WITH '"item":{'.
    REPLACE ALL OCCURRENCES OF '"ITEM":[' IN lv_json WITH '"item":['.

    response->set_text( lv_json ).

  ENDMETHOD.
ENDCLASS.
