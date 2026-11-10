CLASS zcl_http_serv_carga_dir DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_CARGA_DIR IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA lr_data  TYPE REF TO data.
    DATA lr_data2 TYPE REF TO data.
    FIELD-SYMBOLS: <data>        TYPE data,
                   <field>       TYPE any,
                   <results>     TYPE any,
                   <structure>   TYPE any,
                   <table>       TYPE ANY TABLE,
                   <field_value> TYPE data.

    DATA: fecha      TYPE bldat,
          sociedad   TYPE bukrs,
          tipodoc    TYPE blart,
          monto      TYPE wrbtr,
          cuenta     TYPE lifnr,
          referencia TYPE zchar16,
          uid        TYPE zchar50,
          id_boveda  TYPE zchar25,
          via        TYPE zchar01,
          planta     TYPE dzuonr,
          rfc        TYPE stcd1,
          document   TYPE ebeln,
          base_ret   TYPE wrbtr,
          imp_ret    TYPE wrbtr,
          cargos     TYPE ztt_carga_dir,
          docto      TYPE belnr_d,
          ejer_fis   TYPE gjahr,
          message    TYPE char100.

    DATA: it_cargos TYPE ztt_carga_dir,
          wa_cargos LIKE LINE OF it_cargos,
          ls_in     TYPE zst_carga_dir_in,
          ls_out    TYPE zst_carga_dir_out.
    DATA: lt_mappings TYPE /ui2/cl_json=>name_mappings,
          ls_mappings LIKE LINE OF lt_mappings.

    DATA(lv_json) = request->get_text( ).
    DATA(lv_json2) = request->get_text( ).
    DATA(lv_json3) = request->get_text( ).

    CALL METHOD /ui2/cl_json=>deserialize
      EXPORTING
        json         = lv_json
        pretty_name  = /ui2/cl_json=>pretty_mode-user
        assoc_arrays = abap_true
      CHANGING
        data         = ls_in.

    CALL FUNCTION 'ZCARGA_DIR'
      EXPORTING
        fecha      = ls_in-fecha
        sociedad   = ls_in-sociedad
        tipodoc    = ls_in-tipodoc
        monto      = ls_in-monto
        cuenta     = ls_in-cuenta
        referencia = ls_in-referencia
        uid        = ls_in-uid
        id_boveda  = ls_in-id_boveda
        via        = ls_in-via
        planta     = ls_in-planta
        rfc        = ls_in-rfc
        document   = ls_in-document
        base_ret   = ls_in-base_ret
        imp_ret    = ls_in-imp_ret
        cargos     = ls_in-cargos-item
      IMPORTING
        docto      = ls_out-docto
        ejer_fis   = ls_out-ejer_fis
        message    = ls_out-message
        cargos     = ls_out-cargos-item.

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

    DATA(lv_lines) = lines( ls_out-cargos-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'CARGOS' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      REPLACE ALL OCCURRENCES OF ']' IN lv_aux4 WITH space.
      CONCATENATE lv_aux1 'CARGOS' lv_aux3 lv_aux4 INTO lv_json.
    ELSEIF lv_lines = 0.
      SPLIT lv_json AT 'CARGOS":' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '{"item":[]}' INTO lv_aux3 lv_aux4.
      CONCATENATE lv_aux1 'CARGOS":' '""' lv_aux3 lv_aux4 INTO lv_json.
    ENDIF.

    response->set_text( lv_json ).

*    ENDIF.

  ENDMETHOD.
ENDCLASS.
