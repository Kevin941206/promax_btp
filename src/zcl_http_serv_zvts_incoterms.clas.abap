CLASS zcl_http_serv_zvts_incoterms DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_ZVTS_INCOTERMS IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    TYPES: BEGIN OF ty_langu,
             langu TYPE sy-langu,
           END OF ty_langu.


    DATA: langu    TYPE sy-langu,
          lr_data  TYPE REF TO data,
          inco     TYPE ztt_tinct,
          st_langu TYPE ty_langu,
          prueba   TYPE char20,
          ls_out   TYPE zst_incoterms_out.
    DATA: lt_mappings TYPE /ui2/cl_json=>name_mappings,
          ls_mappings LIKE LINE OF lt_mappings.
    FIELD-SYMBOLS:
      <data>    TYPE data,
      <results> TYPE any.

    "Obtenemos el json
    DATA(lv_json) = request->get_text( ).

    "Convertimos el json a una tabla interna
    CALL METHOD /ui2/cl_json=>deserialize
      EXPORTING
        json         = lv_json
        pretty_name  = /ui2/cl_json=>pretty_mode-user
        assoc_arrays = abap_true
      CHANGING
        data         = st_langu.

*    IF lr_data IS BOUND.
*      ASSIGN lr_data->* TO <data>.
*      ASSIGN COMPONENT 'LANGU' OF STRUCTURE <data> TO <results>.
*    ENDIF.

    IF st_langu-langu IS NOT INITIAL.
      CALL FUNCTION 'ZVTS_INCOTERMS'
        EXPORTING
          langu = st_langu-langu
        IMPORTING
          inco  = ls_out-inco-item.

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

      DATA(lv_lines) = lines( ls_out-inco-item ).
      IF lv_lines = 1.
        SPLIT lv_json AT 'INCO' INTO DATA(lv_aux1) DATA(lv_aux2).
        SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
        REPLACE ALL OCCURRENCES OF ']' IN lv_aux4 WITH space.
        CONCATENATE lv_aux1 'INCO' lv_aux3 lv_aux4 INTO lv_json.
      ELSEIF lv_lines = 0.
        SPLIT lv_json AT 'INCO":' INTO lv_aux1 lv_aux2.
        SPLIT lv_aux2 AT '{"item":[]}' INTO lv_aux3 lv_aux4.
        CONCATENATE lv_aux1 'INCO":' '""' lv_aux3 lv_aux4 INTO lv_json.
      ENDIF.

      response->set_text( lv_json ).

    ENDIF.

  ENDMETHOD.
ENDCLASS.
