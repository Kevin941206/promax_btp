CLASS zcl_http_serv_acc_document_pos DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HTTP_SERV_ACC_DOCUMENT_POS IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS:
      <data>        TYPE data,
      <results>     TYPE any,
      <structure>   TYPE any,
      <table>       TYPE ANY TABLE,
      <field>       TYPE any,
      <field_value> TYPE data.

    DATA: ls_header            TYPE zst_bapiache09,
          ls_customercpd       TYPE zst_bapiacpa09,
          ls_contractheader    TYPE zst_bapiaccahd,
          lt_accountgl         TYPE ztt_bapiacgl09,
          lt_accountreceivable TYPE ztt_bapiacar09,
          lt_accountpayable    TYPE ztt_bapiacap09,
          lt_accounttax        TYPE ztt_bapiactx09,
          lt_currencyamount    TYPE ztt_bapiaccr09,
          lt_criteria          TYPE ztt_bapiackec9,
          lt_valuefield        TYPE ztt_bapiackev9,
          lt_extension1        TYPE ztt_bapiacextc,
          lt_paymentcard       TYPE ztt_bapiacpc09,
          lt_contractitem      TYPE ztt_bapiaccait,
          lt_extension2        TYPE bapiparextab,
          lt_realestate        TYPE ztt_bapiacre09,
          lt_accountwt         TYPE ztt_bapiacwt09,
          lt_return            TYPE ztt_bapiret2,
          lv_objtype           TYPE zst_bapiache09-obj_type,
          lv_objsys            TYPE zst_bapiache09-obj_sys,
          lv_objkey            TYPE zst_bapiache09-obj_key,
          ls_data              TYPE zst_acc_document_post,
          ls_data_out          TYPE zst_acc_document_post_out.

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

    CALL FUNCTION 'ZFM_ACC_DOCUMENT_POST'
      EXPORTING
        documentheader    = ls_data-documentheader
        customercpd       = ls_data-customercpd
        contractheader    = ls_data-contractheader
        accountgl         = ls_data-accountgl-item
        accountreceivable = ls_data-accountreceivable-item
        accountpayable    = ls_data-accountpayable-item
        accounttax        = ls_data-accounttax-item
        currencyamount    = ls_data-currencyamount-item
        criteria          = ls_data-criteria-item
        valuefield        = ls_data-valuefield-item
        extension1        = ls_data-extension1-item
        paymentcard       = ls_data-paymentcard-item
        contractitem      = ls_data-contractitem-item
        extension2        = ls_data-extension2-item
        realestate        = ls_data-realestate-item
        accountwt         = ls_data-accountwt-item
      IMPORTING
        obj_type          = lv_objtype
        obj_sys           = lv_objsys
        obj_key           = lv_objkey
        return            = lt_return.

    MOVE-CORRESPONDING ls_data TO ls_data_out.
    ls_data_out-return = lt_return.
    ls_data_out-obj_type = lv_objtype.
    ls_data_out-obj_sys = lv_objsys.
    ls_data_out-obj_key = lv_objkey.


    "Convertimos el resultado en json
    lv_json = /ui2/cl_json=>serialize(
             data        = ls_data_out
             pretty_name = /ui2/cl_json=>pretty_mode-camel_case  " Optional: camelCase keys
             compress    = abap_false                            " Pretty print
           ).

    response->set_text( lv_json ).

  ENDMETHOD.
ENDCLASS.
