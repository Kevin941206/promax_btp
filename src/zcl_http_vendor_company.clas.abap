CLASS zcl_http_vendor_company DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_VENDOR_COMPANY IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.


    "------------------------------------------------------------
    " Declaración de variables y field-symbols dinámicos
    "------------------------------------------------------------
    DATA lr_data TYPE REF TO data.

    FIELD-SYMBOLS:
      <data>        TYPE data,   " Estructura completa del JSON
      <field>       TYPE any,    " Campo genérico para acceder dinámicamente
      <field_value> TYPE data.   " Valor del campo dinámico

    " Variables donde guardaremos los valores obtenidos del JSON
    DATA:
      tax      TYPE ztt_ztax,
      lv_langu TYPE sy-langu,
      lv_lifnr TYPE lifnr,
      company  TYPE ztt_lfb1,
      ls_out   TYPE zst_vendor_company_out.
    DATA: lt_mappings TYPE /ui2/cl_json=>name_mappings,
          ls_mappings LIKE LINE OF lt_mappings.

    " Obtención del JSON del request
    DATA(lv_json) = request->get_text( ).

    "------------------------------------------------------------
    " Deserialización del JSON a una estructura dinámica
    "------------------------------------------------------------
    CALL METHOD /ui2/cl_json=>deserialize
      EXPORTING
        json         = lv_json
        pretty_name  = /ui2/cl_json=>pretty_mode-user  " Mantiene nombres del JSON
        assoc_arrays = abap_true                      " Arrays como tablas
      CHANGING
        data         = lr_data.

    "------------------------------------------------------------
    " Extraer el campo LIFNR del JSON (dinámicamente)
    "------------------------------------------------------------
    IF lr_data IS BOUND.
      ASSIGN lr_data->* TO <data>.

      " Buscar el componente 'LIFNR' dentro de la estructura deserializada
      ASSIGN COMPONENT 'VENDOR' OF STRUCTURE <data> TO <field>.

      IF <field> IS ASSIGNED.
        " Recuperar el valor interno del campo encontrado
        lr_data = <field>.
        ASSIGN lr_data->* TO <field_value>.
        IF <field_value> IS ASSIGNED.
          lv_lifnr = <field_value>.
        ENDIF.
      ENDIF.

      UNASSIGN: <field>, <field_value>.
    ENDIF.

    "------------------------------------------------------------
    " Llamar a función Z para obtener la compañía del proveedor
    "------------------------------------------------------------
    CALL FUNCTION 'ZVTS_VENDOR_COMPANY'
      EXPORTING
        vendor  = lv_lifnr
      IMPORTING
        message = ls_out-message
        company = ls_out-company-item.

    "------------------------------------------------------------
    " Convertir el resultado en JSON (respuesta)
    "------------------------------------------------------------
    ls_mappings-abap = 'ITEM'.
    ls_mappings-json = 'item'.
    INSERT ls_mappings INTO TABLE lt_mappings.

    lv_json = /ui2/cl_json=>serialize(
                data        = ls_out
                pretty_name = /ui2/cl_json=>pretty_mode-none  " Claves en camelCase
                compress    = abap_false                            " Formato legible
                name_mappings = lt_mappings
              ).

    DATA(lv_lines) = lines( ls_out-company-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'COMPANY' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      REPLACE ALL OCCURRENCES OF ']' IN lv_aux4 WITH space.
      CONCATENATE lv_aux1 'COMPANY' lv_aux3 lv_aux4 INTO lv_json.
    ELSEIF lv_lines = 0.
      SPLIT lv_json AT 'COMPANY":' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '{"item":[]}' INTO lv_aux3 lv_aux4.
      CONCATENATE lv_aux1 'COMPANY":' '""' lv_aux3 lv_aux4 INTO lv_json.
    ENDIF.

    " Enviar el JSON como respuesta del servicio
    response->set_text( lv_json ).

  ENDMETHOD.
ENDCLASS.
