CLASS zcl_http_serv_crp_journal_deta DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_CRP_JOURNAL_DETA IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.
    DATA l_dat TYPE zst_eina_lifnr.
    DATA: lv_company    TYPE bukrs,
          lv_doc_number TYPE belnr_d,
          lv_year       TYPE gjahr,
          lv_tipo       TYPE koart.
    DATA: t_journal_doc_rel     TYPE ztt_zcrp_journal_doc_rel,
          t_journal_doc_rel_imp TYPE ztt_zcrp_journal_doc_rel_imp,
          e_journal_detail      TYPE zst_zcrp_journal_detail,
          ls_out                TYPE zst_crp_journal_detail_out.
    DATA: lt_mappings TYPE /ui2/cl_json=>name_mappings,
          ls_mappings LIKE LINE OF lt_mappings.

    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS:
      <data>        TYPE data,
      <results>     TYPE any,
      <structure>   TYPE any,
      <table>       TYPE ANY TABLE,
      <field>       TYPE any,
      <field_value> TYPE data.

    "Obtenemos el json
    DATA(lv_json) = request->get_text( ).

    "Convertimos el json a una tabla interna
    CALL METHOD /ui2/cl_json=>deserialize
      EXPORTING
        json         = lv_json
        pretty_name  = /ui2/cl_json=>pretty_mode-user
        assoc_arrays = abap_true
      CHANGING
        data         = lr_data.

    IF lr_data IS BOUND.
      ASSIGN lr_data->* TO <data>.
      ASSIGN COMPONENT 'I_COMPANY' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_company = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'I_DOC_NUMBER' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_doc_number = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'I_YEAR' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_year = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'I_TIPO' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_tipo = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.
    ENDIF.

    CALL FUNCTION 'ZFIGLMX_CRP_JOURNAL_DETAIL'
      EXPORTING
        i_company             = lv_company
        i_doc_number          = lv_doc_number
        i_year                = lv_year
        i_tipo                = lv_tipo
      IMPORTING
        t_journal_doc_rel     = ls_out-t_journal_doc_rel-item
        t_journal_doc_rel_imp = ls_out-t_journal_doc_rel_imp-item
        e_journal_detail      = ls_out-e_journal_detail.

    ls_mappings-abap = 'ITEM'.
    ls_mappings-json = 'item'.
    INSERT ls_mappings INTO TABLE lt_mappings.

    "Convertimos el resultado en json
    DATA(lv_json1) = /ui2/cl_json=>serialize(
            data        = ls_out
            pretty_name = /ui2/cl_json=>pretty_mode-none  " Optional: camelCase keys
            compress    = abap_false                            " Pretty print
            name_mappings = lt_mappings
          ).

    DATA(lv_lines) = lines( ls_out-t_journal_doc_rel-item ).
    IF lv_lines = 1.
      SPLIT lv_json1 AT 'T_JOURNAL_DOC_REL' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      SPLIT lv_aux4 AT ']' INTO DATA(lv_aux5) DATA(lv_aux6).
      CONCATENATE lv_aux1 'T_JOURNAL_DOC_REL' lv_aux3 lv_aux5 lv_aux6 INTO lv_json1.
    ELSEIF lv_lines = 0.
      SPLIT lv_json1 AT 'T_JOURNAL_DOC_REL":' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '{"item":[]}' INTO lv_aux3 lv_aux4.
      CONCATENATE lv_aux1 'T_JOURNAL_DOC_REL":' '""' lv_aux3 lv_aux4 INTO lv_json1.
    ENDIF.
    lv_lines = lines( ls_out-t_journal_doc_rel_imp-item ).
    IF lv_lines = 1.
      SPLIT lv_json1 AT 'T_JOURNAL_DOC_REL_IMP' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '[' INTO lv_aux3 lv_aux4.
      SPLIT lv_aux4 AT ']' INTO lv_aux5 lv_aux6.
      CONCATENATE lv_aux1 'T_JOURNAL_DOC_REL_IMP' lv_aux3 lv_aux5 lv_aux6 INTO lv_json1.
    ELSEIF lv_lines = 0.
      SPLIT lv_json1 AT 'T_JOURNAL_DOC_REL_IMP":' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '{"item":[]}' INTO lv_aux3 lv_aux4.
      CONCATENATE lv_aux1 'T_JOURNAL_DOC_REL_IMP":' '""' lv_aux3 lv_aux4 INTO lv_json1.
    ENDIF.

    REPLACE ALL OCCURRENCES OF '"DOC_DATE":""' IN lv_json1 WITH '"DOC_DATE":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"PSTNG_DATE":""' IN lv_json1 WITH '"PSTNG_DATE":"0000-00-00"'.

    response->set_text( lv_json1 ).

  ENDMETHOD.
ENDCLASS.
