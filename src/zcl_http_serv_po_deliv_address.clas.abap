CLASS zcl_http_serv_po_deliv_address DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_PO_DELIV_ADDRESS IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS: <data>        TYPE data,
                   <field>       TYPE any,
                   <field_value> TYPE data.
    DATA: lv_lifnr TYPE lifnr,
          lv_ebeln TYPE ebeln,
          lv_ebelp TYPE ebelp,
          lv_langu TYPE sy-langu,
          ls_out   TYPE zst_po_deliv_address_out.

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
          lv_lifnr = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.
      ASSIGN COMPONENT 'PO_NUMBER' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_ebeln = <field_value>.
        ENDIF.
      ENDIF.
      UNASSIGN: <field>, <field_value>.
      ASSIGN COMPONENT 'PO_ITEM' OF STRUCTURE <data> TO <field>.
      IF <field> IS ASSIGNED.
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_ebelp = <field_value>.
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

    CALL FUNCTION 'ZVTS_PO_DELIV_ADDRESS'
      EXPORTING
        vendor       = lv_lifnr
        po_number    = lv_ebeln
        po_item      = lv_ebelp
        langu        = lv_langu
      IMPORTING
        material     = ls_out-material
        description  = ls_out-description
        purchaser    = ls_out-purchaser
        pur_name     = ls_out-pur_name
        d_name1      = ls_out-d_name1
        d_name2      = ls_out-d_name2
        d_street     = ls_out-d_street
        d_post_code1 = ls_out-d_post_code1
        d_city1      = ls_out-d_city1
        d_country    = ls_out-d_country
        d_region     = ls_out-d_region
        d_tel_number = ls_out-d_tel_number
        d_fax_number = ls_out-d_fax_number
        delivery_to  = ls_out-delivery_to
        i_name1      = ls_out-i_name1
        i_city       = ls_out-i_city
        i_street     = ls_out-i_street
        i_district   = ls_out-i_district
        i_tel_number = ls_out-i_tel_number
        i_post_code  = ls_out-i_post_code
        i_name2      = ls_out-i_name2
        mail         = ls_out-mail.

    "Convertimos el resultado en json
    lv_json = /ui2/cl_json=>serialize(
             data        = ls_out
             pretty_name = /ui2/cl_json=>pretty_mode-none  " Optional: camelCase keys
             compress    = abap_false                            " Pretty print
           ).

    response->set_text( lv_json ).

  ENDMETHOD.
ENDCLASS.
