CLASS zcl_http_serv_companycode DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_COMPANYCODE IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA: lv_json TYPE string,
          lt_comp TYPE ztt_bapi0002_1,
          ls_out TYPE zst_companycode_list_get_out,
          ls_item LIKE LINE OF ls_out-et_companycode_list-item,
          lt_comp_list TYPE ztt_bapi0002_1.
    DATA: lt_mappings TYPE /ui2/cl_json=>name_mappings,
          ls_mappings LIKE LINE OF lt_mappings.

    CALL FUNCTION 'YFMSD_COMPANYCODE_LIST_GET'
      IMPORTING
        et_companycode_list = lt_comp_list.

    LOOP AT lt_comp_list INTO DATA(ls_comp_list).
      MOVE-CORRESPONDING ls_comp_list TO ls_item.
      APPEND ls_item TO ls_out-et_companycode_list-item.
      CLEAR ls_item.
    ENDLOOP.

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

      response->set_text( lv_json ).

  ENDMETHOD.
ENDCLASS.
