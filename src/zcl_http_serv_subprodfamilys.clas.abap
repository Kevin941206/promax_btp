CLASS zcl_http_serv_subprodfamilys DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_SUBPRODFAMILYS IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA: it_prodfam_t TYPE yttsd_prodfam_t,
          ls_out       TYPE zst_subprodfamilys_get_out.
    DATA: lt_mappings TYPE /ui2/cl_json=>name_mappings,
          ls_mappings LIKE LINE OF lt_mappings.

    DATA(lv_json) = request->get_text( ).

    CALL FUNCTION 'YFMSD_SUBPRODFAMILYS_GET'
      IMPORTING
        et_prod_subfamilies = ls_out-et_prod_subfamilies-item.

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

    DATA(lv_lines) = lines( ls_out-et_prod_subfamilies-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'ET_PROD_SUBFAMILIES' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      REPLACE ALL OCCURRENCES OF ']' IN lv_aux4 WITH space.
      CONCATENATE lv_aux1 'ET_PROD_SUBFAMILIES' lv_aux3 lv_aux4 INTO lv_json.
    ENDIF.

    response->set_text( lv_json ).


  ENDMETHOD.
ENDCLASS.
