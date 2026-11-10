CLASS zcl_http_gr_detail DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_GR_DETAIL IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA: po_number TYPE ebeln.
    DATA: ztt_grs_detail TYPE ztt_grs_detail.
    DATA lr_data TYPE REF TO data.
    DATA: ls_input TYPE zspo_number,
          ls_out   TYPE zst_gr_detail_out.
    DATA: lt_mappings TYPE /ui2/cl_json=>name_mappings,
          ls_mappings LIKE LINE OF lt_mappings.

    "Obtenemos el json
    DATA(lv_json) = request->get_text( ).
    CLEAR: po_number.

    "Convertimos el json a una estructura interna
    CALL METHOD /ui2/cl_json=>deserialize
      EXPORTING
        json         = lv_json
        pretty_name  = /ui2/cl_json=>pretty_mode-user
        assoc_arrays = abap_true
      CHANGING
        data         = ls_input.

    po_number = ls_input-po_number.

    IF po_number IS NOT INITIAL.

      CALL FUNCTION 'ZVTS_GR_DETAIL'
        EXPORTING
          po_number  = po_number
        IMPORTING
          grs_detail = ls_out-grs_detail-item.

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

      DATA(lv_lines) = lines( ls_out-grs_detail-item ).
      IF lv_lines = 1.
        SPLIT lv_json AT 'GRS_DETAIL' INTO DATA(lv_aux1) DATA(lv_aux2).
        SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
        REPLACE ALL OCCURRENCES OF ']' IN lv_aux4 WITH space.
        CONCATENATE lv_aux1 'GRS_DETAIL' lv_aux3 lv_aux4 INTO lv_json.
      ELSEIF lv_lines = 0.
        SPLIT lv_json AT 'GRS_DETAIL":' INTO lv_aux1 lv_aux2.
        SPLIT lv_aux2 AT '{"item":[]}' INTO lv_aux3 lv_aux4.
        CONCATENATE lv_aux1 'GRS_DETAIL":' '""' lv_aux3 lv_aux4 INTO lv_json.
      ENDIF.

      REPLACE ALL OCCURRENCES OF '"GRS_DATE":""' IN lv_json WITH '"GRS_DATE":"0000-00-00"'.
      REPLACE ALL OCCURRENCES OF '"IRS_DATE":""' IN lv_json WITH '"IRS_DATE":"0000-00-00"'.

      response->set_text( lv_json ).

    ENDIF.

  ENDMETHOD.
ENDCLASS.
