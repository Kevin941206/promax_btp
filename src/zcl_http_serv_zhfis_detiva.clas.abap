CLASS zcl_http_serv_zhfis_detiva DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_ZHFIS_DETIVA IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.
    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS: <data>        TYPE data,
                   <field>       TYPE any,
                   <field_value> TYPE data.

    DATA: et_docsdetiva   TYPE ztt_zhfis_detiva,
          lv_company_code TYPE bukrs,
          lv_date_from    TYPE budat,
          lv_date_to      TYPE budat,
          ls_out          TYPE zst_detiva_out.
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
      ASSIGN COMPONENT 'I_COMPANY_CODE' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_company_code = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'I_DATE_FROM' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_date_from = <field_value>.
        ENDIF.
      ENDIF.

      ASSIGN COMPONENT 'I_DATE_TO' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_date_to = <field_value>.
        ENDIF.
      ENDIF.
    ENDIF.

    CALL FUNCTION 'ZHFIS_DETIVA'
      EXPORTING
        i_company_code = lv_company_code
        i_date_from    = lv_date_from
        i_date_to      = lv_date_to
      IMPORTING
        e_docsdetiva   = ls_out-e_docsdetiva-item.

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

    DATA(lv_lines) = lines( ls_out-e_docsdetiva-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'E_DOCSDETIVA' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      REPLACE ALL OCCURRENCES OF ']' IN lv_aux4 WITH space.
      CONCATENATE lv_aux1 'E_DOCSDETIVA' lv_aux3 lv_aux4 INTO lv_json.
    ELSEIF lv_lines = 0.
      SPLIT lv_json AT 'E_DOCSDETIVA":' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '{"item":[]}' INTO lv_aux3 lv_aux4.
      CONCATENATE lv_aux1 'E_DOCSDETIVA":' '""' lv_aux3 lv_aux4 INTO lv_json.
    ENDIF.

    REPLACE ALL OCCURRENCES OF '"BUDAT":""' IN lv_json WITH '"BUDAT":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"BLDAT":""' IN lv_json WITH '"BLDAT":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"CPUDT":""' IN lv_json WITH '"CPUDT":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"FECHA_PAGO":""' IN lv_json WITH '"FECHA_PAGO":"0000-00-00"'.

    response->set_text( lv_json ).

  ENDMETHOD.
ENDCLASS.
