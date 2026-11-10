CLASS zcl_http_serv_gr_list DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_GR_LIST IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS: <data>        TYPE data,
                   <field>       TYPE any,
                   <field_value> TYPE data.

    DATA: vendor     TYPE elifn,
          company    TYPE bukrs,
          wo_grs     TYPE zchar01,
          w_grs      TYPE zchar01,
          w_irs      TYPE zchar01,
          w_pay      TYPE zchar01,
          po_snumber TYPE ebeln,
          po_enumber TYPE ebeln,
          po_sdate   TYPE erdat,
          po_edate   TYPE erdat,
          grs_sdate  TYPE erdat,
          grs_edate  TYPE erdat,
          irs_sdate  TYPE erdat,
          irs_edate  TYPE erdat,
          pay_sdate  TYPE erdat,
          pay_edate  TYPE erdat,
          records    TYPE zint4.

    DATA: it_grs_list TYPE ztt_vts_grs_list,
          ls_out      TYPE zst_gr_list_out.
    DATA: lt_mappings TYPE /ui2/cl_json=>name_mappings,
          ls_mappings LIKE LINE OF lt_mappings.

*    DATA: list         TYPE ztt_vts_po_detail,
*          lv_po_number TYPE ebeln,
*          lv_langu     TYPE sy-langu.

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

      ASSIGN COMPONENT 'WO_GRS' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          wo_grs = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'W_GRS' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          w_grs = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'W_IRS' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          w_irs  = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'W_PAY' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          w_pay = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'PO_SNUMBER' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          po_snumber = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'PO_ENUMBER' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          po_enumber = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'PO_SDATE' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          po_sdate = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'PO_EDATE' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          po_edate = <field_value>.
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
          grs_edate = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'IRS_SDATE' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          irs_sdate = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'IRS_EDATE' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          irs_edate = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'PAY_SDATE' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          pay_sdate = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'PAY_EDATE' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          pay_edate = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'RECORDS' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          records = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

    ENDIF.

    IF vendor IS NOT INITIAL.

      CLEAR: it_grs_list.

      CALL FUNCTION 'ZVTS_GR_LIST'
        EXPORTING
          vendor     = vendor
          company    = company
          wo_grs     = wo_grs
          w_grs      = w_grs
          w_irs      = w_irs
          w_pay      = w_pay
          po_snumber = po_snumber
          po_enumber = po_enumber
          po_sdate   = po_sdate
          po_edate   = po_edate
          grs_sdate  = grs_sdate
          grs_edate  = grs_edate
          irs_sdate  = irs_sdate
          irs_edate  = irs_edate
          pay_sdate  = pay_sdate
          pay_edate  = pay_edate
          records    = records
        IMPORTING
          grs_list   = ls_out-grs_list-item.

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

      DATA(lv_lines) = lines( ls_out-grs_list-item ).
      IF lv_lines = 1.
        SPLIT lv_json AT 'GRS_LIST' INTO DATA(lv_aux1) DATA(lv_aux2).
        SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
        REPLACE ALL OCCURRENCES OF ']' IN lv_aux4 WITH space.
        CONCATENATE lv_aux1 'GRS_LIST' lv_aux3 lv_aux4 INTO lv_json.
      ELSEIF lv_lines = 0.
        SPLIT lv_json AT 'GRS_LIST":' INTO lv_aux1 lv_aux2.
        SPLIT lv_aux2 AT '{"item":[]}' INTO lv_aux3 lv_aux4.
        CONCATENATE lv_aux1 'GRS_LIST":' '""' lv_aux3 lv_aux4 INTO lv_json.
      ENDIF.

      REPLACE ALL OCCURRENCES OF '"POST_DATE":""' IN lv_json WITH '"POST_DATE":"0000-00-00"'.
      REPLACE ALL OCCURRENCES OF '"POST_DATE2":""' IN lv_json WITH '"POST_DATE2":"0000-00-00"'.
      REPLACE ALL OCCURRENCES OF '"CLEAR_DATE":""' IN lv_json WITH '"CLEAR_DATE":"0000-00-00"'.

      response->set_text( lv_json ).

    ENDIF.

  ENDMETHOD.
ENDCLASS.
