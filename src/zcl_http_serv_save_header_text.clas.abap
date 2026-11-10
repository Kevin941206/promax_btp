CLASS zcl_http_serv_save_header_text DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_SAVE_HEADER_TEXT IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS: <data>        TYPE data,
                   <field>       TYPE any,
                   <field_value> TYPE data.

    DATA: iv_refdoc    TYPE vbeln,
          iv_bukrs     TYPE bukrs,
          iv_gjahr     TYPE gjahr,
          iv_awtyp     TYPE awtyp,
          iv_uuid      TYPE zuuid2,
          iv_rfc       TYPE zrfc,
          iv_importe   TYPE zimporte_xml,
          iv_pymt_form TYPE zchar20,
          iv_pymt_meth TYPE zchar20,
          lv_message   TYPE zchar255.

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
      ASSIGN COMPONENT 'IV_REFDOC' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          iv_refdoc  = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.
      ASSIGN COMPONENT 'IV_BUKRS' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          iv_bukrs  = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'IV_GJAHR' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          iv_gjahr = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'IV_AWTYP' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          iv_awtyp = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'IV_UUID' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          iv_uuid = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'IV_RFC' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          iv_rfc = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'IV_IMPORTE' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          iv_importe = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'IV_PYMT_FORM' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          iv_pymt_form = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

      ASSIGN COMPONENT 'IV_PYMT_METH ' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          iv_pymt_meth = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.

    ENDIF.


    IF iv_refdoc IS NOT INITIAL.

      CALL FUNCTION 'ZIDMX_DI_SAVE_HEADER_TEXT'
        EXPORTING
          iv_refdoc    = iv_refdoc
          iv_bukrs     = iv_bukrs
          iv_gjahr     = iv_gjahr
          iv_awtyp     = iv_awtyp
          iv_uuid      = iv_uuid
          iv_rfc       = iv_rfc
          iv_importe   = iv_importe
          iv_pymt_form = iv_pymt_form
          iv_pymt_meth = iv_pymt_meth
        IMPORTING
          message      = lv_message.


      "Convertimos el resultado en json
      lv_json = /ui2/cl_json=>serialize(
               data        = lv_message " ztt_grs_detail
               pretty_name = /ui2/cl_json=>pretty_mode-camel_case  " Optional: camelCase keys
               compress    = abap_false                            " Pretty print
               ).

      response->set_text( lv_json ).

    ENDIF.


  ENDMETHOD.
ENDCLASS.
