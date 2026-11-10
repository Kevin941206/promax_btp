CLASS zcl_http_serv_payment DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_PAYMENT IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS: <data>        TYPE data,
                   <field>       TYPE any,
                   <field_value> TYPE data.

    DATA: lv_code       TYPE char1,
          lv_vendor     TYPE lifnr,
          lv_company    TYPE bukrs,
          lv_period     TYPE char1,
          lv_start_date TYPE sy-datum,
          lv_end_date   TYPE sy-datum,
          lv_langu      TYPE sy-langu,
          payment_p     TYPE zvts_tt_payment_p,
          payment_s     TYPE zvts_tt_payment_s,
          ls_in         TYPE zst_payment_in,
          ls_out        TYPE zst_payment_out.
    DATA: lt_mappings TYPE /ui2/cl_json=>name_mappings,
          ls_mappings LIKE LINE OF lt_mappings.

    DATA(lv_json) = request->get_text( ).

    "Convertimos el json
    CALL METHOD /ui2/cl_json=>deserialize
      EXPORTING
        json         = lv_json
        pretty_name  = /ui2/cl_json=>pretty_mode-user
        assoc_arrays = abap_true
      CHANGING
        data         = ls_in.

    CALL FUNCTION 'ZVTS_PAYMENT'
      EXPORTING
        code       = ls_in-code
        vendor     = ls_in-vendor
        company    = ls_in-company
        period     = ls_in-period
        start_date = ls_in-start_date
        end_date   = ls_in-end_date
        langu      = ls_in-langu
      IMPORTING
        payment_p  = ls_out-payment_p-item
        payment_s  = ls_out-payment_s-item.

*    ls_mappings-abap = 'ITEM'.
*    ls_mappings-json = 'item'.
*    INSERT ls_mappings INTO TABLE lt_mappings.

    "Convertimos el resultado en json
    lv_json = /ui2/cl_json=>serialize(
             data        = ls_out
             pretty_name = /ui2/cl_json=>pretty_mode-none  " Optional: camelCase keys
             compress    = abap_false                            " Pretty print
             name_mappings = lt_mappings

           ).

    DATA(lv_lines) = lines( ls_out-payment_p-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'PAYMENT_P' INTO DATA(lv_aux1) DATA(lv_aux2).
      SPLIT lv_aux2 AT '[' INTO DATA(lv_aux3) DATA(lv_aux4).
      SPLIT lv_aux4 AT ']' INTO DATA(lv_aux5) DATA(lv_aux6).
      CONCATENATE lv_aux1 'PAYMENT_P' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ELSEIF lv_lines = 0.
      SPLIT lv_json AT 'PAYMENT_P' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '},' INTO lv_aux3 lv_aux4.
      REPLACE ALL OCCURRENCES OF '"ITEM":[]' IN lv_aux3 WITH space.
      CONCATENATE lv_aux1 'PAYMENT_P' lv_aux3 '},' lv_aux4 INTO lv_json.
      REPLACE ALL OCCURRENCES OF '{}' IN lv_json WITH '""'.
    ENDIF.
    lv_lines = lines( ls_out-payment_s-item ).
    IF lv_lines = 1.
      SPLIT lv_json AT 'PAYMENT_S' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '[' INTO lv_aux3 lv_aux4.
      SPLIT lv_aux4 AT ']' INTO lv_aux5 lv_aux6.
      CONCATENATE lv_aux1 'PAYMENT_S' lv_aux3 lv_aux5 lv_aux6 INTO lv_json.
    ELSEIF lv_lines = 0.
      SPLIT lv_json AT 'PAYMENT_S' INTO lv_aux1 lv_aux2.
      SPLIT lv_aux2 AT '},' INTO lv_aux3 lv_aux4.
      REPLACE ALL OCCURRENCES OF '"ITEM":[]' IN lv_aux3 WITH space.
      CONCATENATE lv_aux1 'PAYMENT_S' lv_aux3 '},' lv_aux4 INTO lv_json.
      REPLACE ALL OCCURRENCES OF '{}' IN lv_json WITH '""'.
    ENDIF.

    REPLACE ALL OCCURRENCES OF '"DUE_DATE":""' IN lv_json WITH '"DUE_DATE":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"PAY_DATE":""' IN lv_json WITH '"PAY_DATE":"0000-00-00"'.
    REPLACE ALL OCCURRENCES OF '"POST_DATE":""' IN lv_json WITH '"POST_DATE":"0000-00-00"'.

    REPLACE ALL OCCURRENCES OF '"ITEM":{' IN lv_json WITH '"item":{'.
    REPLACE ALL OCCURRENCES OF '"ITEM":[' IN lv_json WITH '"item":['.

    response->set_text( lv_json ).

  ENDMETHOD.
ENDCLASS.
