CLASS zcl_http_serv_zvts_rfq_detail DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_ZVTS_RFQ_DETAIL IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA l_dat TYPE zst_eina_lifnr.
    DATA: lv_vendor    TYPE elifn,
          lv_quota     TYPE ebeln,
          lv_langu     TYPE sy-langu,
          lv_rfq_date  TYPE datum,
          lv_val_start TYPE datum,
          lv_val_end   TYPE datum,
          lv_deadline  TYPE datum,
          lv_terms     TYPE char30,
          lv_curr      TYPE waers,
          lv_rate      TYPE zkursf,
          inco         TYPE char3,
          inco2        TYPE zinco2,
          doc_type     TYPE char20,
          our_ref      TYPE text12,
          your_ref     TYPE text12,
          pur_grp      TYPE ekgrp,
          desc         TYPE zchar1000,
          pur_name     TYPE eknam,
          pur_org      TYPE ekorg,
          plant_addr   TYPE zstring128,
          phone        TYPE char12,
          fax          TYPE telfx,
          email        TYPE char255,
          status       TYPE char255,
          message      TYPE char255,
          lv_matnr     TYPE c LENGTH 18.

    DATA: rfq_detail TYPE ztt_zvts_rfq_detail,
          ls_out     TYPE zst_rfq_detail_out.
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
      ASSIGN COMPONENT 'VENDOR' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_vendor = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'QUOTATION' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_quota = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'LANGU' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_langu = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.
    ENDIF.

    CALL FUNCTION 'ZVTS_RFQ_DETAIL'
      EXPORTING
        vendor     = lv_vendor
        quotation  = lv_quota
        langu      = lv_langu
      IMPORTING
        rfq_date   = ls_out-rfq_date
        val_start  = ls_out-val_start
        val_end    = ls_out-val_end
        deadline   = ls_out-deadline
        terms      = ls_out-terms
        curr       = ls_out-curr
        rate       = ls_out-rate
        inco       = ls_out-inco
        inco2      = ls_out-inco2
        doc_type   = ls_out-doc_type
        our_ref    = ls_out-our_ref
        your_ref   = ls_out-your_ref
        pur_grp    = ls_out-pur_grp
        desc       = ls_out-desc
        pur_name   = ls_out-pur_name
        pur_org    = ls_out-pur_org
        plant_addr = ls_out-plant_addr
        phone      = ls_out-phone
        fax        = ls_out-fax
        email      = ls_out-email
        status     = ls_out-status
        message    = ls_out-message
        rfq_detail = ls_out-rfq_detail-item.

*    LOOP AT ls_out-rfq_detail-item ASSIGNING FIELD-SYMBOL(<fs_item>).
*      lv_matnr = |{ <fs_item>-material ALPHA = IN }|.
*      <fs_item>-material = lv_matnr.
*    ENDLOOP.

*    ls_mappings-abap = 'ITEM'.
*    ls_mappings-json = 'item'.
*    INSERT ls_mappings INTO TABLE lt_mappings.

    "Convertimos el resultado en json
    DATA(lv_json1) = /ui2/cl_json=>serialize(
            data        = ls_out
            pretty_name = /ui2/cl_json=>pretty_mode-none  " Optional: camelCase keys
            compress    = abap_false                            " Pretty print
            name_mappings = lt_mappings
          ).

    DATA(lv_lines) = lines( ls_out-rfq_detail-item ).
    IF lv_lines = 1.
      SPLIT lv_json1 AT 'RFQ_DETAIL' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      REPLACE ALL OCCURRENCES OF ']' IN lv_aux4 WITH space.
      CONCATENATE lv_aux1 'RFQ_DETAIL' lv_aux3 lv_aux4 INTO lv_json1.
    ELSEIF lv_lines = 0.
      SPLIT lv_json1 AT 'RFQ_DETAIL":' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '{"ITEM":[]}' INTO lv_aux3 lv_aux4.
      CONCATENATE lv_aux1 'RFQ_DETAIL":' '""' lv_aux3 lv_aux4 INTO lv_json1.
    ENDIF.

    REPLACE ALL OCCURRENCES OF '"VAL_START":""' IN lv_json1 WITH '"VAL_START":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"VAL_END":""' IN lv_json1 WITH '"VAL_END":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"DEL_DATE":""' IN lv_json1 WITH '"DEL_DATE":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"DEADLINE":""' IN lv_json1 WITH '"DEADLINE":"0000-00-00"'.

    REPLACE ALL OCCURRENCES OF '"ITEM":{' IN lv_json1 WITH '"item":{'.
    REPLACE ALL OCCURRENCES OF '"ITEM":[' IN lv_json1 WITH '"item":['.

    response->set_text( lv_json1 ).

  ENDMETHOD.
ENDCLASS.
