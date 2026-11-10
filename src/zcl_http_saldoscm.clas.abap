CLASS zcl_http_saldoscm DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SALDOSCM IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    "------------------------------------------------------------
    " Declaración de referencias dinámicas y field-symbols
    "------------------------------------------------------------
    DATA lr_data TYPE REF TO data.

    FIELD-SYMBOLS:
      <data>        TYPE data,   " Estructura raíz deserializada del JSON
      <data2>       TYPE data,   " Estructura para cada registro de ACCOUNT
      <field>       TYPE any,    " Componente dinámico
      <field_value> TYPE data,   " Valor dinámico del componente
      <table>       TYPE any,    " Para mapear tablas del JSON
      <line>        TYPE any.    " Para mapear cada registro de una tabla JSON

    "------------------------------------------------------------
    " Declaración de variables finales donde guardaremos los datos
    "------------------------------------------------------------
    DATA:
      bukrs      TYPE bukrs,
      year       TYPE gjahr,
      period     TYPE zrpmax,
      account    TYPE ztthfis_racct,   " Tabla interna final
      ls_account TYPE zhfis_racct,     " Línea de la tabla ACCOUNT
      saldos     TYPE ztt_saldoscm,    " Resultado de la función
      ls_out     TYPE zst_saldoscm_out,
      ls_in TYPE zst_saldoscm_in.
    DATA: lt_mappings TYPE /ui2/cl_json=>name_mappings,
          ls_mappings LIKE LINE OF lt_mappings.

    "------------------------------------------------------------
    " Obtener el JSON recibido en el request
    "------------------------------------------------------------
    DATA(lv_json) = request->get_text( ).

    "------------------------------------------------------------
    " Deserializar JSON a estructura dinámica ABAP
    "------------------------------------------------------------
    CALL METHOD /ui2/cl_json=>deserialize
      EXPORTING
        json         = lv_json
        pretty_name  = /ui2/cl_json=>pretty_mode-user   " Mantiene nombres tal cual vienen
        assoc_arrays = abap_true                        " Maneja arrays como tablas
      CHANGING
        data         = ls_in.

    "------------------------------------------------------------
    " Llamada a la función Z para calcular saldos contables
    "------------------------------------------------------------
    CALL FUNCTION 'ZHFIS_SALDOSCM'
      EXPORTING
        i_company_code = ls_in-i_company_code
        i_year         = ls_in-i_year
        i_period       = ls_in-i_period
        i_account      = ls_in-i_account-item
      IMPORTING
        e_saldoscm     = saldos.

    ls_out-i_account-item = ls_in-i_account-item.
    ls_out-e_saldoscm-item = saldos.

    ls_mappings-abap = 'ITEM'.
    ls_mappings-json = 'item'.
    INSERT ls_mappings INTO TABLE lt_mappings.

    "------------------------------------------------------------
    " Convertir el resultado en JSON para la respuesta REST
    "------------------------------------------------------------
    lv_json = /ui2/cl_json=>serialize(
                data        = ls_out
                pretty_name = /ui2/cl_json=>pretty_mode-none
                compress    = abap_false
                name_mappings = lt_mappings
              ).

    DATA(lv_lines) = lines( ls_out-i_account-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'I_ACCOUNT' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      SPLIT lv_aux4 AT ']' INTO DATA(lv_aux5) DATA(lv_aux6).
      CONCATENATE lv_aux1 'I_ACCOUNT' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ELSEIF lv_lines = 0.
      SPLIT lv_json AT 'I_ACCOUNT":' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '{"item":[]}' INTO lv_aux3 lv_aux4.
      CONCATENATE lv_aux1 'I_ACCOUNT":' '""' lv_aux3 lv_aux4 INTO lv_json.
    ENDIF.
    lv_lines = lines( ls_out-e_saldoscm-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'E_SALDOSCM' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '[' INTO lv_aux3 lv_aux4.
      SPLIT lv_aux4 AT ']' INTO lv_aux5 lv_aux6.
      CONCATENATE lv_aux1 'E_SALDOSCM' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ELSEIF lv_lines = 0.
      SPLIT lv_json AT 'E_SALDOSCM":' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '{"item":[]}' INTO lv_aux3 lv_aux4.
      CONCATENATE lv_aux1 'E_SALDOSCM":' '""' lv_aux3 lv_aux4 INTO lv_json.
    ENDIF.

    "------------------------------------------------------------
    " Enviar la respuesta final al cliente
    "------------------------------------------------------------
    response->set_text( lv_json ).

  ENDMETHOD.
ENDCLASS.
