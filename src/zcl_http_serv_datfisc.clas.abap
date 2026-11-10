CLASS zcl_http_serv_datfisc DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_DATFISC IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA t_datfisc TYPE STANDARD TABLE OF zstfi_datfisc.
    DATA: l_dat TYPE zstfi_datfisc,
          ls_data TYPE zst_datfisc.
    DATA e_messa TYPE zdemessa.
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
        data         = ls_data.
*    IF lr_data IS BOUND.
*      ASSIGN lr_data->* TO <data>.
*      ASSIGN COMPONENT 'T_DATFISC' OF STRUCTURE <data> TO <results>.
*      ASSIGN <results>->* TO <table>.
*
*      LOOP AT <table> ASSIGNING <structure>.
*        ASSIGN <structure>->* TO <data>.
*
*        ASSIGN COMPONENT 'BUKRS' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          l_dat-bukrs = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'BELNR' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          l_dat-belnr = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'GJAHR' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          l_dat-gjahr = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'XREF1' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          l_dat-xref1 = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'FORPA' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          l_dat-forpa = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'METPA' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          l_dat-metpa = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'IMPOR' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          l_dat-impor = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'RFC' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          l_dat-rfc = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'UUID' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          l_dat-uuid = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        APPEND l_dat TO t_datfisc.
*        CLEAR l_dat.
*      ENDLOOP.
*    ENDIF.

*    IF t_datfisc IS NOT INITIAL.
    IF ls_data-t_datfisc-item IS NOT INITIAL.
      CALL FUNCTION 'ZFM_DATFISC'
        EXPORTING
          t_datfisc = ls_data-t_datfisc-item
        IMPORTING
          e_messa   = e_messa.

      "Convertimos el resultado en json
      lv_json = /ui2/cl_json=>serialize(
               data        = e_messa
               pretty_name = /ui2/cl_json=>pretty_mode-camel_case  " Optional: camelCase keys
               compress    = abap_false                            " Pretty print
             ).

      response->set_text( lv_json ).

    ENDIF.

  ENDMETHOD.
ENDCLASS.
