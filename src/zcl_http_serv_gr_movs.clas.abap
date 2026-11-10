CLASS zcl_http_serv_gr_movs DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_GR_MOVS IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS: <data>        TYPE data,
                   <field>       TYPE any,
                   <field_value> TYPE data.

    DATA: vendor    TYPE elifn,
          company   TYPE bukrs,
          po_number TYPE ebeln,
          grs_sdate TYPE ebeln,
          grs_edate TYPE ebeln,
          language  TYPE sy-langu,
          message   TYPE zchar255,
          grs_movs  TYPE ztt_grs_movs,
          ls_out    TYPE zst_gr_movs_out.
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
        vendor = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.
      ASSIGN COMPONENT 'COMPANY' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
        company = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'PO_NUMBER' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
        po_number = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'GRS_SDATE' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
        grs_sdate = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'GRS_EDATE' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
        grs_edate  = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'LANGUAGE' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          language = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

    ENDIF.

    IF vendor IS NOT INITIAL.

      CLEAR: grs_movs.

      CALL FUNCTION 'ZVTS_GR_MOVS'
        EXPORTING
          vendor    = vendor
          company   = company
          po_number = po_number
          grs_sdate = grs_sdate
          grs_edate = grs_edate
          language  = language
        IMPORTING
          message   = ls_out-message
          grs_movs  = ls_out-grs_movs-item.

*      ls_mappings-abap = 'ITEM'.
*      ls_mappings-json = 'item'.
*      INSERT ls_mappings INTO TABLE lt_mappings.

      "Convertimos el resultado en json
      lv_json = /ui2/cl_json=>serialize(
               data        = ls_out
               pretty_name = /ui2/cl_json=>pretty_mode-none  " Optional: camelCase keys
               compress    = abap_false                            " Pretty print
               name_mappings = lt_mappings
               ).

      DATA(lv_lines) = lines( ls_out-grs_movs-item ).
      IF lv_lines = 1.
        SPLIT lv_json AT 'GRS_MOVS' INTO DATA(lv_aux1) DATA(lv_aux2).
        SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
        REPLACE ALL OCCURRENCES OF ']' IN lv_aux4 WITH space.
        CONCATENATE lv_aux1 'GRS_MOVS' lv_aux3 lv_aux4 INTO lv_json.
      ELSEIF lv_lines = 0.
        SPLIT lv_json AT 'GRS_MOVS":' INTO lv_aux1 lv_aux2.
        SPLIT lv_aux2 AT '{"item":[]}' INTO lv_aux3 lv_aux4.
        CONCATENATE lv_aux1 'GRS_MOVS":' '""' lv_aux3 lv_aux4 INTO lv_json.
      ENDIF.

      REPLACE ALL OCCURRENCES OF '"DATE":""' IN lv_json WITH '"DATE":"0000-00-00"'.

      REPLACE ALL OCCURRENCES OF '"ITEM":{' IN lv_json WITH '"item":{'.
      REPLACE ALL OCCURRENCES OF '"ITEM":[' IN lv_json WITH '"item":['.

      response->set_text( lv_json ).

    ENDIF.

  ENDMETHOD.
ENDCLASS.
