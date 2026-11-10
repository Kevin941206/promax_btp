CLASS zcl_datfisc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    "METHODS ZDATFISC IMPORTING t_datfisc TYPE zttfi_datfisc
    "                EXPORTING e_messa TYPE zdemessa.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DATFISC IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lv_json TYPE string.
    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS:
      <data>        TYPE data,
      <data2>       TYPE data,
      <results>     TYPE any,
      <structure>   TYPE any,
      <table>       TYPE ANY TABLE,
      <field>       TYPE any,
      <field_value> TYPE data.
    DATA t_datfisc TYPE STANDARD TABLE OF zstfi_datfisc.
    DATA l_dat TYPE zstfi_datfisc.
    DATA e_messa TYPE zdemessa.
    DATA lt_comp TYPE ztt_bapi0002_1.
    DATA lt_fam TYPE yttmm_merchgroup_e.
    DATA: lt_ystsd_salesorder_detail_e TYPE ystsd_salesorder_detail_e,
          lt_ystsd_totales_s           TYPE ystsd_totales_s,
          lt_yttsd_contacts_s          TYPE yttsd_contacts_s,
          lt_yttsd_positions_s         TYPE yttsd_positions_s,
          lt_yttsd_dates_s             TYPE yttsd_dates_s,
          lt_yttsd_invoices_s          TYPE yttsd_invoices_s.
    DATA lt_vbfa TYPE ztt_vbfa.
    DATA list TYPE ztt_vts_po_detail.
    DATA po_list TYPE zvts_tt_po_list.
    DATA: lv_message   TYPE char255,
          po_confirmed TYPE zvts_tt_po_confirmed.
    DATA ls_out TYPE zst_po_deliv_address_out.
    DATA: lv_code       TYPE char1,
          lv_vendor     TYPE lifnr,
          lv_company    TYPE bukrs,
          lv_period     TYPE char1,
          lv_start_date TYPE sy-datum,
          lv_end_date   TYPE sy-datum,
          lv_langu      TYPE sy-langu,
          payment_p     TYPE zvts_tt_payment_p,
          payment_s     TYPE zvts_tt_payment_s,
          lv_from       TYPE char10,
          lv_to         TYPE char10.
    DATA: it_account      TYPE ztthfis_racct,
          ls_account      LIKE LINE OF it_account,
          et_docsingresos TYPE ztthfis_docsingresos.
    DATA: lt_bukrs       TYPE ztt_ebpp_bukrs,
          ls_bukrs       LIKE LINE OF lt_bukrs,
          lt_sales_order TYPE yttsd_salesorder_list_e.
    DATA: lv_vbeln        TYPE vbeln_va,
          lv_invoice      TYPE zvbeln_vf,
          lv_name1        TYPE name1_gp,
          lv_name2        TYPE name2_gp,
          lv_begin_date   TYPE erdat,
          lt_sold_to      TYPE ztt_wkunnr,
          ls_sold_to      LIKE LINE OF lt_sold_to,
          lt_ship_to      TYPE ztt_wkunnr,
          ls_ship_to      LIKE LINE OF lt_ship_to,
          lt_sales_orders TYPE yttsd_salesorder_list_e,
          lt_invoices     TYPE yttsd_invoices_list_t.

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
          lt_extension2        TYPE bapiparex, "bapiparextab,
          lt_realestate        TYPE zst_bapiacre09,
          lt_accountwt         TYPE zst_bapiacwt09,
          lt_return            TYPE ztt_bapiret2.

    DATA: ls_customer TYPE zsales_customer,
          ls_document TYPE zsales_document,
          lv_doctype  TYPE zvbtypl,
          ls_return   TYPE bapiret1,
          t_detail    TYPE ztt_sales_data,
          t_shipment  TYPE ztt_transp_data.
    DATA: lv_credt  TYPE datum,
          lv_bukrs  TYPE bukrs,
          lv_lifnr  TYPE lifnr,
          lv_impor  TYPE zdeimpor,
          lv_vendt  TYPE datum,
          lv_refer  TYPE zxblnr1,
          lv_texto  TYPE bktxt,
          lv_idedi  TYPE zdeidedi,
          lv_belnr  TYPE belnr_d,
          lv_credt2 TYPE datum,
          lv_vendt2 TYPE datum,
          lv_idedi2 TYPE zdeidedi.
    DATA lt_lines TYPE TABLE OF zst_tline.

*          DATA: ls_dest TYPE zbtp_t_destino.
*          ls_dest-destino = 'QS4WD200'.
*          ls_dest-descripcion = 'Calidad'.
*          MODIFY zbtp_t_destino FROM @ls_dest.
    DATA: ls_bank        TYPE zbapibus1006_bankdetail,
          ls_tax         TYPE zbapibus1006tax_common,
          ls_centraldata TYPE zbapibus1006002_central,
          ls_data        TYPE zbapibus1006_central,
          ls_datax       TYPE zbapibus1006_central_x,
          ls_soodk       TYPE zst_soodk,
          ls_phio        TYPE zskwf_io.
    DATA: ls_load TYPE zload_vendor.
    DATA lv_pdf TYPE xstring.
    DATA: it_messages TYPE TABLE OF bapiret2,
          it_item     TYPE TABLE OF zst_bapimepoitem,
          it_itemx    TYPE TABLE OF zst_bapimepoitemx.
    DATA: lt_komdlgn TYPE TABLE OF zst_komdlgn.
    DATA lt_prop    TYPE TABLE OF zst_wuebs.
    DATA: lt_vbsk TYPE TABLE OF zst_vbsk,
          ls_vbsk LIKE LINE OF lt_vbsk.
    DATA: t_headerdata TYPE zst_bapi_incinv_create_header,
          it_itemdata  TYPE ztt_bapi_incinv_create_item,
          it_accounting   TYPE ztt_bapi_incinv_create_account,
          it_glaccount TYPE ztt_bapi_incinv_create_gl_acco,
          it_withtax   TYPE ztt_bapi_incinv_create_withtax.

*    zcl_bapi_incominginvoice_crea=>bapi_incominginvoice_create( EXPORTING i_header = t_headerdata
*                                                                            it_item = it_itemdata
*                                                                            it_account = it_accounting
*                                                                            it_glaccount = it_glaccount
*                                                                            it_withtax = it_withtax ).

*  zcl_bapi_exchangerate_getdet=>bapi_exchangerate_getdetail( EXPORTING i_rate_type = 'M'
*                                                                           i_from_curr = 'USD'
*                                                                           i_to_currncy = 'MXN'
*                                                                           i_date = '20260109' ).

*  zcl_gn_delivery_create=>gn_delivery_create( EXPORTING i_vbsk = ls_vbsk
*                                                        it_komdlgn = lt_komdlgn
*                                              IMPORTING et_vbfs = DATA(lt_vbfs)
*                                                        et_vbls = DATA(lt_vbls) ).

*  zcl_number_get_next=>number_get_next( EXPORTING i_smart = 'C'
*                                                  i_object = 'RV_SAMMG'
*                                        IMPORTING e_number = DATA(lv_num) ).

*  zcl_message_text_build=>message_text_build( EXPORTING i_msgid = 'ZFI'
*                                                i_msgno = '000'
*                                                i_msgv1 = 'LA'
*                                                i_msgv2 = 'Prueba'
*                                                i_msgv3 = 'es'
*                                                i_msgv4 = 'correcta'
*                                      IMPORTING e_mensaje = DATA(lv_m) ).

*   zcl_me_confirmation_via_edi=>me_confirmation_via_edi( EXPORTING it_komdlgn = lt_komdlgn
*                                                        IMPORTING et_errores = lt_prop ).

*   zcl_bapi_po_change=>bapi_po_change( EXPORTING i_ebeln = '0000000002'
*                                                    it_item = it_item
*                                                    it_itemx = it_itemx
*                                          IMPORTING et_return = it_messages ).

*   CALL FUNCTION 'ZVTS_PO_PDF'
*     EXPORTING
*       doc_number = '0000000002'
*     IMPORTING
*       pdf_xstring = lv_pdf.
*DATA ls_o TYPE zst_search_vendor_out.
*DATA ls2 LIKE LINE OF ls_o-vts_vendor.
*ls2-item-lifnr = 1.
*APPEND ls2 TO ls_o-vts_vendor.
*ls2-item-lifnr = 2.
*APPEND ls2 TO ls_o-vts_vendor.
*   lv_json = /ui2/cl_json=>serialize(
*               data        = ls_o
*               pretty_name = /ui2/cl_json=>pretty_mode-none  " Optional: camelCase keys
*               compress    = abap_false                            " Pretty print
*             ).
*   zcl_maintain_cbapi=>maintain_bapi( ls_load ).

*    zcl_convert_string=>string_to_base64( 'Hola mundo' ).

*   zcl_skwf_phio_content_access=>get_content( i_phio = ls_phio ).

*    zcl_so_object_get_content=>get_content( i_soodk = ls_soodk ).
*   zcl_bapi_bupa_create_from_data=>bupa_central_change( EXPORTING i_partner = '1000000000'
*                                                                i_data = ls_data
*                                                                i_datax = ls_datax ).
*    zcl_bapi_bupa_create_from_data=>bapi_bupa_role_add( EXPORTING i_partner = '1000000000'
*                                                                i_role = 'FLVN00' ).
*   zcl_bapi_bupa_create_from_data=>bapi_bupr_contp_create( EXPORTING i_partner = '1000000000'
*                                                                i_contactperson = '1000000000'
*                                                                i_validfrom = sy-datum
*                                                                i_validto = '99991231'
*                                                                i_default = 'X'
*                                                                i_centraldata = ls_centraldata ).
*   zcl_bapi_bupa_create_from_data=>bapi_bupa_tax_add( EXPORTING i_partner = '1000000000'
*                                                                i_taxtype = 'MX1'
*                                                                i_taxnumber = '10' ).
*   zcl_bapi_bupa_create_from_data=>bapi_bupa_tax_common_change( EXPORTING i_partner = '1000000000'
*                                                                       i_tax_common = ls_tax ).
*   zcl_bapi_bupa_create_from_data=>bapi_bupa_bankdetail_add( EXPORTING i_partner = '1000000000'
*                                                                       i_id = '0001'
*                                                                       i_bankdetail = ls_bank ).
*  zcl_bapi_bupa_create_from_data=>bapi_bupa_create_from_data(  ).

*    APPEND INITIAL LINE TO lt_lines ASSIGNING FIELD-SYMBOL(<fs_lines>).
*    <fs_lines>-tdline = 'Prueba test test'.
*
*    zcl_textos=>create_text( i_id = 'ST'
*                           i_name = 'ZSDCLIENTE3'
*                           i_object = 'TEXT'
*                           i_spras = 'S'
*                           it_lines = lt_lines ).
*    zcl_textos=>save_text( i_id = 'ST'
*                           i_name = 'ZSDCLIENTE'
*                           i_object = 'TEXT'
*                           i_spras = 'S'
*                           i_save = abap_true
*                           it_lines = lt_lines ).

*zcl_textos=>read_text( i_id = 'ST'
*                       i_name = 'ZSDCLIENTE'
*                       i_object = 'TEXT'
*                       i_spras = 'S' ).

*    CALL FUNCTION 'ZFM_COMPENF_47'
*      EXPORTING
*        i_credt  = lv_credt
*        i_bukrs  = lv_bukrs
*        i_lifnr  = lv_lifnr
*        i_impor  = lv_impor
*        i_vendt  = lv_vendt
*        i_refer  = lv_refer
*        i_texto  = lv_texto
*        i_idedi  = lv_idedi
*      IMPORTING
*        e_belnr  = lv_belnr
*        e_credt  = lv_credt2
*        e_vendt  = lv_vendt2
*        e_idedi  = lv_idedi2
*        t_return = lt_return.


*    CALL FUNCTION 'ZSALES_DOCUMENT_INFO'
*      EXPORTING
*        i_document = '0000000001'
*      IMPORTING
*        e_customer = ls_customer
*        e_document = ls_document
*        e_doctype  = lv_doctype
*        e_return   = ls_return
*        t_detail   = t_detail
*        t_shipment = t_shipment.


*    CALL FUNCTION 'ZFM_ACC_DOCUMENT_POST'
*      EXPORTING
*        documentheader = ls_header
*        currencyamount = lt_currencyamount
*      IMPORTING
*        return         = lt_return.

*    lv_json = '{"iv_sales_order": "0000000002","iv_invoice": "","iv_name1": "","iv_name2": "","iv_begin_date": "01.01.2020","iv_end_date": "31.12.2025","it_bukrs":[{"bukrs": "1105"}], "it_sold_to": [{"kunnr": ""}],"it_ship_to": [{"kunnr": ""}]}'.
*
*    CALL METHOD /ui2/cl_json=>deserialize
*      EXPORTING
*        json         = lv_json
*        pretty_name  = /ui2/cl_json=>pretty_mode-user
*        assoc_arrays = abap_true
*      CHANGING
*        data         = lr_data.
*    IF lr_data IS BOUND.
*      ASSIGN lr_data->* TO <data>.
*
*      ASSIGN COMPONENT 'IV_SALES_ORDER' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_vbeln = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN COMPONENT 'IV_INVOICE' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_invoice = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN COMPONENT 'IV_NAME1' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_name1 = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN COMPONENT 'IV_NAME2' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_name2 = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN COMPONENT 'IV_BEGIN_DATE' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_from = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN COMPONENT 'IV_END_DATE' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_to = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN COMPONENT 'IT_BUKRS' OF STRUCTURE <data> TO <results>.
*      ASSIGN <results>->* TO <table>.
*
*      LOOP AT <table> ASSIGNING <structure>.
*        ASSIGN <structure>->* TO <data2>.
*
*        ASSIGN COMPONENT 'BUKRS' OF STRUCTURE <data2> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_bukrs-bukrs = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        APPEND ls_bukrs TO lt_bukrs.
*        CLEAR ls_bukrs.
*      ENDLOOP.
*      UNASSIGN: <results>, <table>, <data2>, <structure>.
*
*      ASSIGN COMPONENT 'IT_SOLD_TO' OF STRUCTURE <data> TO <results>.
*      ASSIGN <results>->* TO <table>.
*
*      LOOP AT <table> ASSIGNING <structure>.
*        ASSIGN <structure>->* TO <data2>.
*
*        ASSIGN COMPONENT 'KUNNR' OF STRUCTURE <data2> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_sold_to-kunnr = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        APPEND ls_sold_to TO lt_sold_to.
*        CLEAR ls_sold_to.
*      ENDLOOP.
*      UNASSIGN: <results>, <table>, <data2>, <structure>.
*
*      ASSIGN COMPONENT 'IT_SHIP_TO' OF STRUCTURE <data> TO <results>.
*      ASSIGN <results>->* TO <table>.
*
*      LOOP AT <table> ASSIGNING <structure>.
*        ASSIGN <structure>->* TO <data2>.
*
*        ASSIGN COMPONENT 'KUNNR' OF STRUCTURE <data2> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_ship_to-kunnr = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        APPEND ls_ship_to TO lt_ship_to.
*        CLEAR ls_ship_to.
*      ENDLOOP.
*      UNASSIGN: <results>, <table>, <data2>, <structure>.
*
*    ENDIF.
*
*    CALL FUNCTION 'YFMSD_SALESORDER_LIST'
*      EXPORTING
*        iv_sales_order = '0000000002'
*        iv_begin_date = '20200101'
*        iv_end_date = '20251231'
*        it_bukrs = lt_bukrs
*      IMPORTING
*        et_sales_orders = lt_sales_order.

*     lv_json = '{"i_company_code": "1001","i_date_from": "01.01.2020","i_date_to": "31.12.2025", "i_account": [{"racct": "0010300001"}]}'.
*     CALL METHOD /ui2/cl_json=>deserialize
*      EXPORTING
*        json         = lv_json
*        pretty_name  = /ui2/cl_json=>pretty_mode-user
*        assoc_arrays = abap_true
*      CHANGING
*        data         = lr_data.
*    IF lr_data IS BOUND.
*      ASSIGN lr_data->* TO <data>.
*
*      ASSIGN COMPONENT 'I_COMPANY_CODE' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_company = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN COMPONENT 'I_DATE_FROM' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_from = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN COMPONENT 'I_DATE_TO' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_to = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN COMPONENT 'I_ACCOUNT' OF STRUCTURE <data> TO <results>.
*      ASSIGN <results>->* TO <table>.
*
*      LOOP AT <table> ASSIGNING <structure>.
*        ASSIGN <structure>->* TO <data>.
*
*        ASSIGN COMPONENT 'RACCT' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_account-racct = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        APPEND ls_account TO it_account.
*        CLEAR ls_account.
*      ENDLOOP.
*    ENDIF.
*
*    lv_start_date = lv_from+6(4) && lv_from+3(2) && lv_from(2).
*    lv_end_date = lv_to+6(4) && lv_to+3(2) && lv_to(2).
*
*    CALL FUNCTION 'ZHFIS_INGRESOS'
*      EXPORTING
*        i_company_code = lv_company
*        i_date_from = lv_start_date
*        i_date_to = lv_end_date
*        i_account = it_account
*      IMPORTING
*        e_docsingresos = et_docsingresos.

*    lv_json = '{"code": "P","vendor" : "7000000002","company" : "1001","period" : "","start_date": "","end_date" : "",    "langu" : ""}'.
*
*    "Convertimos el json
*    CALL METHOD /ui2/cl_json=>deserialize
*      EXPORTING
*        json         = lv_json
*        pretty_name  = /ui2/cl_json=>pretty_mode-user
*        assoc_arrays = abap_true
*      CHANGING
*        data         = lr_data.
*    IF lr_data IS BOUND.
*      ASSIGN lr_data->* TO <data>.
*      ASSIGN COMPONENT 'CODE' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_code = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*      ASSIGN COMPONENT 'VENDOR' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_vendor = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*      ASSIGN COMPONENT 'COMPANY' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_company = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*      ASSIGN COMPONENT 'PERIOD' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_period = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*      ASSIGN COMPONENT 'START_DATE' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_start_date = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*      ASSIGN COMPONENT 'END_DATE' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_end_date = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*      ASSIGN COMPONENT 'LANGU' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_langu = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*    ENDIF.

*    CALL FUNCTION 'ZVTS_PAYMENT'
*      EXPORTING
*        code       = lv_code
*        vendor     = lv_vendor
*        company    = lv_company
*        period     = lv_period
*        start_date = lv_start_date
*        end_date   = lv_end_date
*        langu      = lv_langu
*      IMPORTING
*        payment_p  = payment_p
*        payment_s  = payment_s.

*    CALL FUNCTION 'ZVTS_PO_DELIV_ADDRESS'
*      EXPORTING
*        vendor       = '7000000002'
*        po_number    = '4500000000'
*        po_item      = '0010'
*        langu        = 'S'
*      IMPORTING
*        material     = ls_out-material
*        description  = ls_out-description
*        purchaser    = ls_out-purchaser
*        pur_name     = ls_out-pur_name
*        d_name1      = ls_out-d_name1
*        d_name2      = ls_out-d_name2
*        d_street     = ls_out-d_street
*        d_post_code1 = ls_out-d_post_code1
*        d_city1      = ls_out-d_city1
*        d_country    = ls_out-d_country
*        d_region     = ls_out-d_region
*        d_tel_number = ls_out-d_tel_number
*        d_fax_number = ls_out-d_fax_number
*        delivery_to  = ls_out-delivery_to
*        i_name1      = ls_out-i_name1
*        i_city       = ls_out-i_city
*        i_street     = ls_out-i_street
*        i_district   = ls_out-i_district
*        i_tel_number = ls_out-i_tel_number
*        i_post_code  = ls_out-i_post_code
*        i_name2      = ls_out-i_name2
*        mail         = ls_out-mail.

*    CALL FUNCTION 'ZVTS_PO_VIEW_CONFIRMED'
*      EXPORTING
*        vendor       = '7000000002'
*        company      = '1101'
*        po_number    = ''
*        po_item      = '0010'
*        language     = 'S'
*      IMPORTING
*        message      = lv_message
*        po_confirmed = po_confirmed.

*    CALL FUNCTION 'ZVTS_PO_LIST'
*      EXPORTING
*        vendor = '7000000002'
*        status = 'S'
*      IMPORTING
*        po_list = po_list.

*    CALL FUNCTION 'ZVTS_PO_DETAIL'
*      EXPORTING
*        po_number = '4500000000'
*        langu     = 'S'
*      IMPORTING
*        list      = list.

*    zcl_qry_operations_to_s4hana=>order_flow( EXPORTING i_operacion = 'READ'
*                                                        i_vblen = '0000000002'
*                                              IMPORTING et_vbfa = lt_vbfa ).

*    CALL FUNCTION '<YFMSD_SALESORDER_DETAILS'
*      EXPORTING
*        iv_sales_order         = '0000000002'
*      IMPORTING
*        es_sales_order_details = lt_ystsd_salesorder_detail_e
*        es_totales             = lt_ystsd_totales_s
*        et_contacts            = lt_yttsd_contacts_s
*        et_positions           = lt_yttsd_positions_s
*        et_dates               = lt_yttsd_dates_s
*        et_invoices   >         = lt_yttsd_invoices_s.


*        CALL FUNCTION 'YFMSD_COMPANYCODE_LIST_GET'
*          IMPORTING et_companycode_list =  lt_comp.

*        zcl_qry_operations_to_s4hana=>vttk_lfa1( i_operacion = 'READ' ).

*        l_dat-uuid = 'UUID7'.
*        l_dat-bukrs = '1103'.
*        l_dat-belnr = '2400000208'.
*        l_dat-gjahr = '2026'.
*        l_dat-xref1 = 'test2'.
*        APPEND l_dat TO t_datfisc.
*
*    CALL FUNCTION 'ZFM_DATFISC'
*      EXPORTING
*        t_datfisc = t_datfisc
*      IMPORTING
*        e_messa = e_messa.

*    TRY.
*        DATA(lo_rfc_dest) = cl_rfc_destination_provider=>create_by_cloud_destination(
*                               i_name = |RFC_QS4| ).
*
*        DATA(lv_rfc_dest) = lo_rfc_dest->get_destination_name( ).
*
**        l_dat-bukrs = '1103'.
**        l_dat-belnr = '2400000208'.
**        l_dat-gjahr = '2025'.
**        l_dat-xref1 = 'test2'.
**        APPEND l_dat TO t_datfisc.
*
    lv_json = '{"t_datfisc": [{"bukrs": "1103","belnr": "2400000208","gjahr": 2025,"xref1": "test3","forpa": "","metpa": "","impor": 0,"rfc": "","uuid": "UUID10"}]}'.

    CALL METHOD /ui2/cl_json=>deserialize
      EXPORTING
        json         = lv_json
        pretty_name  = /ui2/cl_json=>pretty_mode-user
        assoc_arrays = abap_true
      CHANGING
        data         = lr_data.

    IF lr_data IS BOUND.
      ASSIGN lr_data->* TO <data>.
      ASSIGN COMPONENT 'T_DATFISC' OF STRUCTURE <data> TO <results>.
      ASSIGN <results>->* TO <table>.

      LOOP AT <table> ASSIGNING <structure>.
        ASSIGN <structure>->* TO <data>.

        ASSIGN COMPONENT 'BUKRS' OF STRUCTURE <data> TO <field>.
        IF <field> IS ASSIGNED.
          lr_data = <field>.
          ASSIGN lr_data->* TO <field_value>.
          l_dat-bukrs = <field_value>.
        ENDIF.
        UNASSIGN: <field>, <field_value>.

        ASSIGN COMPONENT 'BELNR' OF STRUCTURE <data> TO <field>.
        IF <field> IS ASSIGNED.
          lr_data = <field>.
          ASSIGN lr_data->* TO <field_value>.
          l_dat-belnr = <field_value>.
        ENDIF.
        UNASSIGN: <field>, <field_value>.

        ASSIGN COMPONENT 'GJAHR' OF STRUCTURE <data> TO <field>.
        IF <field> IS ASSIGNED.
          lr_data = <field>.
          ASSIGN lr_data->* TO <field_value>.
          l_dat-gjahr = <field_value>.
        ENDIF.
        UNASSIGN: <field>, <field_value>.

        ASSIGN COMPONENT 'XREF1' OF STRUCTURE <data> TO <field>.
        IF <field> IS ASSIGNED.
          lr_data = <field>.
          ASSIGN lr_data->* TO <field_value>.
          l_dat-xref1 = <field_value>.
        ENDIF.
        UNASSIGN: <field>, <field_value>.

        ASSIGN COMPONENT 'UUID' OF STRUCTURE <data> TO <field>.
        IF <field> IS ASSIGNED.
          lr_data = <field>.
          ASSIGN lr_data->* TO <field_value>.
          l_dat-uuid = <field_value>.
        ENDIF.
        UNASSIGN: <field>, <field_value>.

        APPEND l_dat TO t_datfisc.
        CLEAR l_dat.
      ENDLOOP.
    ENDIF.
*
**        lv_json = /ui2/cl_json=>serialize(
**                 data        = e_messa "t_datfisc
**                 pretty_name = /ui2/cl_json=>pretty_mode-camel_case  " Optional: camelCase keys
**                 compress    = abap_false                            " Pretty print
**               ).
*
*    CALL FUNCTION 'ZFM_DATFISC'
*      EXPORTING
*        t_datfisc = t_datfisc
*      IMPORTING
*        e_messa   = e_messa.
*
*        CASE sy-subrc.
*          WHEN 0.
*            out->write( e_messa ).
*          WHEN 1.
*            out->write( |EXCEPTION SYSTEM_FAILURE |  ).
*          WHEN 2.
*            out->write( |EXCEPTION COMMUNICATION_FAILURE | ).
*          WHEN 3.
*            out->write( |EXCEPTION OTHERS| ).
*        ENDCASE.
*
*      CATCH cx_root INTO DATA(lx_root).
*        out->write( lx_root->get_text( ) ).
*
*    ENDTRY.
*
*    DATA(lv_response) = '{ e_messa: "' && e_messa && '" }'.

  ENDMETHOD.
ENDCLASS.
