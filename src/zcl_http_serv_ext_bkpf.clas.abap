CLASS zcl_http_serv_ext_bkpf DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_EXT_BKPF IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.
    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS: <data>        TYPE data,
                   <field>       TYPE any,
                   <field_value> TYPE data.
    DATA: lv_bukrs    TYPE bukrs,
          lv_blart    TYPE blart,
          lv_fech_ini TYPE datum,
          lv_fech_fin TYPE datum,
          lv_usnam    TYPE usnam,
          lt_result   TYPE zfi_tt_allx_bkpf,
          ls_out      TYPE zst_extractor_bkpf_out.
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
      ASSIGN COMPONENT 'BUKRS' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
        lv_bukrs = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.
      ASSIGN COMPONENT 'BLART' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
        lv_blart = <field_value>.
        ENDIF.
      ENDIF.
      ASSIGN COMPONENT 'FECH_INI' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
        lv_fech_ini = <field_value>.
        ENDIF.
      ENDIF.
      ASSIGN COMPONENT 'FECH_FIN' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
        lv_fech_fin = <field_value>.
        ENDIF.
      ENDIF.
      ASSIGN COMPONENT 'USNAM' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
        lv_usnam = <field_value>.
        ENDIF.
      ENDIF.
    ENDIF.

    CALL FUNCTION 'ZALL_EXTRACTOR_BKPF'
      EXPORTING
        bukrs      = lv_bukrs
        blart      = lv_blart
        fech_ini   = lv_fech_ini
        fech_fin   = lv_fech_fin
        usnam      = lv_usnam
      IMPORTING
        tab_result = ls_out-tab_result-item.

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

    DATA(lv_lines) = lines( ls_out-tab_result-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'TAB_RESULT' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      REPLACE ALL OCCURRENCES OF ']' IN lv_aux4 WITH space.
      CONCATENATE lv_aux1 'TAB_RESULT' lv_aux3 lv_aux4 INTO lv_json.
    ELSEIF lv_lines = 0.
      SPLIT lv_json AT 'TAB_RESULT":' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '{"item":[]}' INTO lv_aux3 lv_aux4.
      CONCATENATE lv_aux1 'TAB_RESULT":' '""' lv_aux3 lv_aux4 INTO lv_json.
    ENDIF.

    REPLACE ALL OCCURRENCES OF '"BLDAT":""' IN lv_json WITH '"BLDAT":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"BUDAT":""' IN lv_json WITH '"BUDAT":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"CPUDT":""' IN lv_json WITH '"CPUDT":"0000-00-00"'.

    response->set_text( lv_json ).

  ENDMETHOD.
ENDCLASS.
