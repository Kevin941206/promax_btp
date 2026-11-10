CLASS zcl_http_serv_ingresos DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_INGRESOS IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS:
      <data>        TYPE data,
      <results>     TYPE any,
      <structure>   TYPE any,
      <table>       TYPE ANY TABLE,
      <field>       TYPE any,
      <field_value> TYPE data.

    DATA: lv_bukrs        TYPE bukrs,
          lv_from         TYPE char10,
          lv_date_from    TYPE datum,
          lv_to           TYPE char10,
          lv_date_to      TYPE datum,
          it_account      TYPE ztthfis_racct,
          ls_account      LIKE LINE OF it_account,
          et_docsingresos TYPE ztthfis_docsingresos,
          ls_in           TYPE zst_ingresos_in,
          ls_out          TYPE zst_ingresos_out.
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

*    lv_date_from = lv_from+6(4) && lv_from+3(2) && lv_from(2).
*    lv_date_to = lv_to+6(4) && lv_to+3(2) && lv_to(2).

    CALL FUNCTION 'ZHFIS_INGRESOS'
      EXPORTING
        i_company_code = ls_in-i_company_code
        i_date_from    = ls_in-i_date_from
        i_date_to      = ls_in-i_date_to
        i_account      = ls_in-i_account-item
      IMPORTING
        e_docsingresos = et_docsingresos.

    ls_out-i_account-item = ls_in-i_account-item.
    ls_out-e_docsingresos-item = et_docsingresos.

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

    DATA(lv_lines) = lines( ls_out-i_account-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'I_ACCOUNT' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      SPLIT lv_aux4 AT ']' INTO DATA(lv_aux5) DATA(lv_aux6).
      CONCATENATE lv_aux1 'I_ACCOUNT' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ELSEIF lv_lines = 0.
      SPLIT lv_json AT 'I_ACCOUNT":' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '{"item":[]}' INTO lv_aux3 lv_aux4.
      CONCATENATE lv_aux1 'I_ACCOUNT":' '""' lv_aux3 lv_aux4 INTO lv_json.
    ENDIF.
    lv_lines = lines( ls_out-e_docsingresos-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'E_DOCSINGRESOS' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '[' INTO lv_aux3 lv_aux4.
      SPLIT lv_aux4 AT ']' INTO lv_aux5 lv_aux6.
      CONCATENATE lv_aux1 'E_DOCSINGRESOS' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ELSEIF lv_lines = 0.
      SPLIT lv_json AT 'E_DOCSINGRESOS":' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '{"item":[]}' INTO lv_aux3 lv_aux4.
      CONCATENATE lv_aux1 'E_DOCSINGRESOS":' '""' lv_aux3 lv_aux4 INTO lv_json.
    ENDIF.

    REPLACE ALL OCCURRENCES OF '"BUDAT":""' IN lv_json WITH '"BUDAT":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"BLDAT":""' IN lv_json WITH '"BLDAT":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"CPUDT":""' IN lv_json WITH '"CPUDT":"0000-00-00"'.

    response->set_text( lv_json ).

  ENDMETHOD.
ENDCLASS.
