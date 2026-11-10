CLASS zcl_test_alg DEFINITION
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



CLASS ZCL_TEST_ALG IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA lv_json TYPE string.
*    DATA lr_data TYPE REF TO data.
*    FIELD-SYMBOLS:
*      <data>        TYPE data,
*      <results>     TYPE any,
*      <structure>   TYPE any,
*      <table>       TYPE ANY TABLE,
*      <field>       TYPE any,
*      <field_value> TYPE data.
*        DATA t_datfisc TYPE STANDARD TABLE OF zstfi_datfisc.
*        DATA l_dat TYPE zstfi_datfisc.
*        DATA e_messa TYPE zdemessa.
*
*        l_dat-uuid = 'UUID5'.
*        l_dat-bukrs = '1103'.
*        l_dat-belnr = '2400000208'.
*        l_dat-gjahr = '2026'.
*        l_dat-xref1 = 'test2'.
*        APPEND l_dat TO t_datfisc.

*    CALL FUNCTION 'ZFM_DATFISC'
*      EXPORTING
*        t_datfisc = t_datfisc
*      IMPORTING
*        e_messa = e_messa.

*    DATA: tax   TYPE ztt_ztax,
*          langu TYPE sy-langu.
*
*    CALL FUNCTION 'ZVTS_TAX'
*    EXPORTING
*      langu = sy-langu
*      IMPORTING
*      tax = tax.
*
*      if sy-subrc IS INITIAL.
*
*    ENDIF.
*
*    DATA: transp TYPE ztt_tvtyt,
*          langu  TYPE sy-langu.
*
*    CALL FUNCTION 'ZVTS_TRANSP'
*      EXPORTING
*        langu  = sy-langu
*      IMPORTING
*        transp = transp.
*
*    IF sy-subrc IS INITIAL.
*
*    ENDIF.

*    DATA: inco   TYPE ztt_tinct,
*          langu  TYPE sy-langu.
*
*    CALL FUNCTION 'ZVTS_INCOTERMS'
*      EXPORTING
*        langu  = sy-langu
*      IMPORTING
*        inco = inco.
*
*    IF sy-subrc IS INITIAL.
*
*    ENDIF.

*    DATA: et_sector   TYPE ztt_tspat.
*
*    CALL FUNCTION 'YFMSD_SECTORS_GET'
*      IMPORTING
*        et_sectors = et_sector.
*
*    IF sy-subrc IS INITIAL.
*
*    ENDIF.

*    DATA: et_product_catalog   TYPE ytt_stmm_products_e.
*
*    CALL FUNCTION 'ZFMSD_PRODUCT_CATALOG'
*      IMPORTING
*        et_product_catalog = et_product_catalog.
*
*    IF sy-subrc IS INITIAL.
*
*    ENDIF.

*    DATA: et_customers_list  TYPE yttsd_customer_list_e,
*          iv_companycode    TYPE bukrs.
*
*          iv_companycode = '1001'.
*
*    CALL FUNCTION 'YFMSD_CUSTOMERS_COMP_GET'
*      EXPORTING
*         iv_companycode = iv_companycode
*      IMPORTING
*        et_customers_list = et_customers_list.
*
*    IF sy-subrc IS INITIAL.
*
*    ENDIF.

*    DATA: et_journal_list TYPE ztt_zcrp_journal,
*          iv_company      TYPE bukrs,
*          iv_date_from    TYPE datum,
*          iv_date_to      TYPE datum,
*          iv_year         TYPE gjahr,
*          iv_tipo         TYPE koart.
*
*    iv_company = '1001'.
*    iv_date_from = '20250101'.
*    iv_date_to = '20251231'.
*    iv_year = '2025'.
*    iv_tipo = 'K'.
*
*    CALL FUNCTION 'ZFIGLMX_CRP_JOURNAL_LIST'
*      EXPORTING
*        i_company      = iv_company
*        i_date_from    = iv_date_from
*        i_date_to      = iv_date_to
*        i_year         = iv_year
*        i_tipo         = iv_tipo
*      IMPORTING
*        t_journal_list = et_journal_list.
*
*    IF sy-subrc IS INITIAL.
*
*    ENDIF.

*    DATA: vtt_vendor TYPE ztt_zvts_vendor,
*          vendor     TYPE zst_lfa1-lifnr,
*          name       TYPE zst_lfb1-intad.
*
*          vendor = '1000000011'.
*          name = ''.
*
*
*
*        CALL FUNCTION 'ZVTS_SEARCH_VENDOR'
*      IMPORTING
*        vtt_vendor = vtt_vendor
*      CHANGING
*        vendor     = vendor
*        name       = name.
*    DATA tdlnr TYPE STANDARD TABLE OF zst_eina_lifnr.
*    DATA l_dat TYPE zst_eina_lifnr.
*    DATA: lv_tpbez      TYPE text20,
*          lv_tknum      TYPE char10,
*          lv_fknum      TYPE char10,
*          lv_lblni      TYPE char10,
*          lv_signi      TYPE text20,
*          lv_tipo_flete TYPE c,
*          message       TYPE bapi_msg,
*          transp        TYPE ztt_zsd_transp.
*
*    DATA lr_data TYPE REF TO data.
*    FIELD-SYMBOLS:
*      <data>        TYPE data,
*      <results>     TYPE any,
*      <structure>   TYPE any,
*      <table>       TYPE ANY TABLE,
*      <field>       TYPE any,
*      <field_value> TYPE data.
*
*    DATA lv_json TYPE string.
*
*    lv_json = '{    "tpbez": "PRUEBA",    "tknum": "1000",    "fknum": "100000000",    "lblni": "100000000",    "signi": "PRUEBA",    "tipo_flete": "C",    "tdlnr": [        {            "lifnr": "100000"        }    ]}'.
*
*
*    "Convertimos el json a una tabla interna
*    CALL METHOD /ui2/cl_json=>deserialize
*      EXPORTING
*        json         = lv_json
*        pretty_name  = /ui2/cl_json=>pretty_mode-user
*        assoc_arrays = abap_true
*      CHANGING
*        data         = lr_data.
*
*
*    IF lr_data IS BOUND.
*      ASSIGN lr_data->* TO <data>.
*      ASSIGN COMPONENT 'TPBEZ' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_tpbez = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN COMPONENT 'TKNUM' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_tknum = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN lr_data->* TO <data>.
*      ASSIGN COMPONENT 'FKNUM' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_fknum = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN lr_data->* TO <data>.
*      ASSIGN COMPONENT 'LBLNI' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_lblni = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN lr_data->* TO <data>.
*      ASSIGN COMPONENT 'SIGNI' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_signi = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN lr_data->* TO <data>.
*      ASSIGN COMPONENT 'TIPO_FLETE' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_tipo_flete = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN lr_data->* TO <data>.
*      ASSIGN COMPONENT 'TDLNR' OF STRUCTURE <data> TO <results>.
*      IF <results> IS ASSIGNED.
*        ASSIGN <results>->* TO <table>.
*
*        LOOP AT <table> ASSIGNING <structure>.
*          ASSIGN <structure>->* TO <data>.
*
*          ASSIGN COMPONENT 'LIFNR' OF STRUCTURE <data> TO <field>.
*          IF <field> IS ASSIGNED.
*            lr_data = <field>.
*            ASSIGN lr_data->* TO <field_value>.
*            l_dat-lifnr = <field_value>.
*          ENDIF.
*          UNASSIGN: <field>, <field_value>.
*
*          APPEND l_dat TO tdlnr.
*          CLEAR l_dat.
*        ENDLOOP.
*      ENDIF.
*    ENDIF.
*
*    CALL FUNCTION 'ZGET_TRANSP_LIQ'
*      EXPORTING
*        tpbez      = lv_tpbez
*        tknum      = lv_tknum
*        fknum      = lv_fknum
*        lblni      = lv_lblni
*        signi      = lv_signi
*        tipo_flete = lv_tipo_flete
*        tdlnr      = tdlnr
*      IMPORTING
*        message    = message
*        transp     = transp.
*    transp = transp.
*
*    IF sy-subrc IS INITIAL.
*
*    ENDIF.

*    DATA: et_docsdetiva   TYPE ztt_zhfis_detiva,
*          iv_company_code TYPE bukrs,
*          iv_date_from    TYPE budat,
*          iv_date_to      TYPE budat.
*
*    iv_company_code = '1001'.
*    iv_date_from = '20250101'.
*    iv_date_to = '20251231'.
*
*    CALL FUNCTION 'ZHFIS_DETIVA'
*      EXPORTING
*        i_company_code = iv_company_code
*        i_date_from    = iv_date_from
*        i_date_to      = iv_date_to
*      IMPORTING
*        e_docsdetiva = et_docsdetiva.
*
*    IF sy-subrc IS INITIAL.
*
*    ENDIF.

*    DATA lr_data TYPE REF TO data.
*    FIELD-SYMBOLS:
*      <data>        TYPE data,
*      <data2>       TYPE data,
*      <results>     TYPE any,
*      <structure>   TYPE any,
*      <table>       TYPE ANY TABLE,
*      <field>       TYPE any,
*      <field_value> TYPE data.
*
*    DATA: lv_quotation TYPE ebeln,
*          lv_langu     TYPE sy-langu,
*          lv_currency  TYPE waers,
*          lv_reference TYPE text12,
*          lv_incoterm  TYPE char3,
*          lv_incoterm2 TYPE zinco2,
*          lv_comments  TYPE char255,
*          lv_ssouser   TYPE char20,
*          detail       TYPE ztt_zvts_rfq_upd,
*          ls_detail    LIKE LINE OF detail,
*          lv_message   TYPE char255.
*
*    "Obtenemos el json
*    DATA lv_json TYPE string.
*
*    lv_json = '{"quotation":"4500228072","langu":"ES","currency":"","detail":[{"item":"00010",}]}'.
*
*    "Convertimos el json a una tabla interna
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
*      ASSIGN COMPONENT 'QUOTATION' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_quotation = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN COMPONENT 'LANGU' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_langu = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN COMPONENT 'CURRENCY' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_currency = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN COMPONENT 'REFERENCE' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_reference = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN COMPONENT 'INCOTERM' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_incoterm = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN COMPONENT 'INCOTERM2' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_incoterm2 = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN COMPONENT 'COMMENTS' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_incoterm2 = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN COMPONENT 'SSOUSER' OF STRUCTURE <data> TO <field>.
*      IF <field> IS ASSIGNED.
*        lr_data = <field>.
*        ASSIGN lr_data->* TO <field_value>.
*        lv_incoterm2 = <field_value>.
*      ENDIF.
*      UNASSIGN: <field>, <field_value>.
*
*      ASSIGN COMPONENT 'DETAIL' OF STRUCTURE <data> TO <results>.
*      ASSIGN <results>->* TO <table>.
*
*      LOOP AT <table> ASSIGNING <structure>.
*        ASSIGN <structure>->* TO <data>.
*
*        ASSIGN COMPONENT 'ITEM' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_detail-item = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'ITEM_CAT' OF STRUCTURE  <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_detail-item_cat = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'PRICE' OF STRUCTURE  <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_detail-price = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'DEL_DATE' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_detail-del_date = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'ITEM_CAT' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_detail-item_cat = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'DEL_DAYS' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_detail-del_days = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'COMMENTS' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_detail-comments = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'PACKNO' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_detail-packno = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'ICMS' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_detail-icms = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'RICMS' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_detail-ricms = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'ICMSBR' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_detail-icmsbr = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'STICMS' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_detail-sticms = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'STI' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_detail-sti = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'IPI' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_detail-ipi = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'J_1BNBM' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_detail-j_1bnbm = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'J_2BNBM' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_detail-j_2bnbm = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'IVA' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          ls_detail-iva = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*        IF ls_detail IS NOT INITIAL.
*          APPEND ls_detail TO detail.
*          CLEAR ls_detail.
*        ENDIF.
*      ENDLOOP.
*     UNASSIGN: <results>, <table>,  <structure>.
*
*    ENDIF.
*
**    lv_vendor = '1000000003'.
**    lv_quota  = '4500228072'.
**    lv_langu  = 'S'.
*
*     CALL FUNCTION 'ZVTS_RFQ_SEND'
*      EXPORTING
*        quotation = lv_quotation
*        langu     = lv_langu
*        currency  = lv_currency
*        reference = lv_reference
*        incoterm  = lv_incoterm
*        incoterm2 = lv_incoterm2
*        comments  = lv_comments
*        ssouser   = lv_ssouser
*        detail    = detail
*      IMPORTING
*        message   = lv_message.
*
*    IF sy-subrc IS INITIAL.
*
*    ENDIF.

*    DATA: i_company             TYPE bukrs,
*          i_doc_number          TYPE belnr_d,
*          i_year                TYPE gjahr,
*          i_tipo                TYPE koart,
*          t_journal_doc_rel     TYPE ztt_zcrp_journal_doc_rel,
*          t_journal_doc_rel_imp TYPE ztt_zcrp_journal_doc_rel_imp,
*          e_journal_detail      TYPE zst_zcrp_journal_detail.
*
**          i_company    = '1103'.
**          i_doc_number = '5300581187'.
**          i_year       = '2025'.
**          i_tipo       = 'S'.
*
*    i_company    = '1001'.
*    i_doc_number = '1900000001'.
*    i_year       = '2025'.
*    i_tipo       = 'S'.
*
*    CALL FUNCTION 'ZFIGLMX_CRP_JOURNAL_DETAIL'
*      EXPORTING
*        i_company             = i_company
*        i_doc_number          = i_doc_number
*        i_year                = i_year
*        i_tipo                = i_tipo
*      IMPORTING
*        t_journal_doc_rel     = t_journal_doc_rel
*        t_journal_doc_rel_imp = t_journal_doc_rel_imp
*        e_journal_detail      = e_journal_detail.
*
*    IF sy-subrc IS INITIAL.
*
*    ENDIF.

DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS:
      <data>        TYPE data,
      <data2>       TYPE data,
      <results>     TYPE any,
      <structure>   TYPE any,
      <table>       TYPE ANY TABLE,
      <field>       TYPE any,
      <field_value> TYPE data.

    DATA: lv_invoice    TYPE char10,
          lv_year       TYPE gjahr,
          lv_invoice_fi TYPE char10,
          lv_year_fi    TYPE gjahr,
          lv_folio      TYPE char10,
          lv_error_flag TYPE char1,
          it_message    TYPE ztt_message,
          it_invoice    TYPE ztt_invoice,
          wa_invoice    LIKE LINE OF it_invoice,
          wa_hst        TYPE zhst,
          it_hst        TYPE STANDARD TABLE OF zhst,
          lv_message    TYPE char255.

          "Obtenemos el json
    DATA lv_json TYPE string.

    lv_error_flag = 'X'.

    lv_json = '{"hst":[{"lblni":"123456789","rebel":"123456789"}],"invoice":[{"id":"","nofact":"","doctyp":"","ebeln":"","mjahr":"","rfc_emisor":"","cocode":"","fefact":"","febase":"","waers":"","lifnr":"","taxcode":""}]}'.

   "Convertimos el json a una tabla interna
    CALL METHOD /ui2/cl_json=>deserialize
      EXPORTING
        json         = lv_json
        pretty_name  = /ui2/cl_json=>pretty_mode-user
        assoc_arrays = abap_true
      CHANGING
        data         = lr_data.
    IF lr_data IS BOUND.
      ASSIGN lr_data->* TO <data>.

      ASSIGN COMPONENT 'HST' OF STRUCTURE <data> TO <results>.
      ASSIGN <results>->* TO <table>.

      LOOP AT <table> ASSIGNING <structure>.
        ASSIGN <structure>->* TO <data>.

        ASSIGN COMPONENT 'LBLNI' OF STRUCTURE <data> TO <field>.
        IF <field> IS ASSIGNED.
          lr_data = <field>.
          ASSIGN lr_data->* TO <field_value>.
          wa_hst-lblni = <field_value>.
        ENDIF.
        UNASSIGN: <field>, <field_value>.

        ASSIGN COMPONENT 'REBEL' OF STRUCTURE  <data> TO <field>.
        IF <field> IS ASSIGNED.
          lr_data = <field>.
          ASSIGN lr_data->* TO <field_value>.
          wa_hst-rebel = <field_value>.
        ENDIF.
        UNASSIGN: <field>, <field_value>.

        IF wa_hst IS NOT INITIAL.
          APPEND wa_hst TO it_hst.
        ENDIF.
      ENDLOOP.
      UNASSIGN: <results>, <table>,  <structure>, <data>.

*      ASSIGN COMPONENT 'INVOICE' OF STRUCTURE <data> TO <results>.
*      ASSIGN <results>->* TO <table>.
*
*      LOOP AT <table> ASSIGNING <structure>.
*        ASSIGN <structure>->* TO <data>.
*
*        ASSIGN COMPONENT 'ID' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-id = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'NOFACT' OF STRUCTURE  <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-nofact = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'DOCTYP' OF STRUCTURE  <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-doctyp = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'EBELN' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-ebeln = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'MJAHR' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-mjahr = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'RFC_EMISOR' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-rfc_emisor = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'COCODE' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-cocode = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'FEFACT' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-fefact = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'FEBASE' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-febase = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'WAERS' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-waers = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'LIFNR' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-lifnr = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'TAXCODE' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-taxcode = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'IMPBRT' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-impbrt = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'IMPIVA' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-impiva = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'IMPNET' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-impnet = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'USER' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-user = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'RT_SUBJCT' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-rt_subjct = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'IMP_RET' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-imp_ret = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'IMP_BASE' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-imp_base = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'GLACCT' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-glacct = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'COST' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-cost = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'VIA' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-via = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'UUID' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-uuid = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.

*        ASSIGN COMPONENT 'RT_6' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-rt_6 = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'REBEL' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-rebel = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'IND_IMP' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-ind_imp = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'TRANSP_EXT' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-transp_ext = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'EXTI2' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-exti2 = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'DR' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-dr = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'BASE_ISR_DR' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-base_isr_dr = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'BASE_IVA_DR' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-base_iva_dr = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'IMP_ISR_DR' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-imp_isr_dr = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'IMP_IVA_DR' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          wa_invoice-imp_iva_dr = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.

*        IF wa_invoice IS NOT INITIAL.
*          APPEND wa_invoice TO it_invoice.
*          CLEAR wa_invoice.
*        ENDIF.
*      ENDLOOP.
*      UNASSIGN: <results>, <table>,  <structure>.
    ENDIF.

    wa_invoice-id = '1'.
    APPEND wa_invoice TO it_invoice.
          CLEAR wa_invoice.

    CALL FUNCTION 'ZVERIFICA_FACTURA'
      EXPORTING
        i_invoice    = it_invoice
        i_hst        = wa_hst
      IMPORTING
        l_invoice    = lv_invoice
        l_year       = lv_year
        l_invoice_fi = lv_invoice_fi
        l_year_fi    = lv_year_fi
        l_folio      = lv_folio
        error_flag   = lv_error_flag
        e_message    = it_message.

    IF sy-subrc IS INITIAL.

    ENDIF.

  ENDMETHOD.
ENDCLASS.
