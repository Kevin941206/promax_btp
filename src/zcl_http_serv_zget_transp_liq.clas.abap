CLASS zcl_http_serv_zget_transp_liq DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_ZGET_TRANSP_LIQ IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.
    DATA tdlnr TYPE STANDARD TABLE OF zst_eina_lifnr.
    DATA l_dat TYPE zst_eina_lifnr.
    DATA: lv_tpbez      TYPE text20,
          lv_tknum      TYPE char10,
          lv_fknum      TYPE char10,
          lv_lblni      TYPE char10,
          lv_signi      TYPE text20,
          lv_tipo_flete TYPE c,
          message       TYPE bapi_msg,
          transp        TYPE ztt_zsd_transp,
          ls_out        TYPE zst_transp_liq_out.
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
      ASSIGN COMPONENT 'TPBEZ' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_tpbez = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'TKNUM' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_tknum = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'FKNUM' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_fknum = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'LBLNI' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_lblni = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'SIGNI' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_signi = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'TIPO_FLETE' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_tipo_flete = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'TDLNR' OF STRUCTURE <data> TO <results>.
      IF <results> IS ASSIGNED.
        ASSIGN <results>->* TO <table>.
        LOOP AT <table> ASSIGNING <structure>.
          ASSIGN <structure>->* TO <data>.
          IF <data> IS ASSIGNED.
            ASSIGN COMPONENT 'LIFNR' OF STRUCTURE <data> TO <field>.
            IF <field> IS ASSIGNED.
              lr_data = <field>.
              ASSIGN lr_data->* TO <field_value>.
              IF <field_value> IS ASSIGNED.
                l_dat-lifnr = <field_value>.
              ENDIF.
            ENDIF.
            UNASSIGN: <field>, <field_value>.
          ENDIF.
          APPEND l_dat TO tdlnr.
          CLEAR l_dat.
        ENDLOOP.
      ENDIF.
    ENDIF.

    CALL FUNCTION 'ZGET_TRANSP_LIQ'
      EXPORTING
        tpbez      = lv_tpbez
        tknum      = lv_tknum
        fknum      = lv_fknum
        lblni      = lv_lblni
        signi      = lv_signi
        tipo_flete = lv_tipo_flete
        tdlnr      = tdlnr
      IMPORTING
        message    = message
        transp     = transp.

    ls_out-tdlnr-item = tdlnr.
    ls_out-transp-item = transp.
    ls_out-message = message.

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

    DATA(lv_lines) = lines( ls_out-tdlnr-item ).
    IF lv_lines = 1.
      SPLIT lv_json1 AT 'TDLNR' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      SPLIT lv_aux4 AT ']' INTO DATA(lv_aux5) DATA(lv_aux6).
      CONCATENATE lv_aux1 'TDLNR' lv_aux3 lv_aux5 lv_aux6 INTO lv_json1.
    ELSEIF lv_lines = 0.
      SPLIT lv_json1 AT 'TDLNR":' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '{"item":[]}' INTO lv_aux3 lv_aux4.
      CONCATENATE lv_aux1 'TDLNR":' '""' lv_aux3 lv_aux4 INTO lv_json1.
    ENDIF.
    lv_lines = lines( ls_out-transp-item ).
    IF lv_lines = 1.
      SPLIT lv_json1 AT 'TRANSP' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '[' INTO lv_aux3 lv_aux4.
      SPLIT lv_aux4 AT ']' INTO lv_aux5 lv_aux6.
      CONCATENATE lv_aux1 'TRANSP' lv_aux3 lv_aux5 lv_aux6 INTO lv_json1.
    ELSEIF lv_lines = 0.
      SPLIT lv_json1 AT 'TRANSP":' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '{"item":[]}' INTO lv_aux3 lv_aux4.
      CONCATENATE lv_aux1 'TRANSP":' '""' lv_aux3 lv_aux4 INTO lv_json1.
    ENDIF.

    response->set_text( lv_json1 ).

  ENDMETHOD.
ENDCLASS.
