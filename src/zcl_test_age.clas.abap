CLASS zcl_test_age DEFINITION
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



CLASS ZCL_TEST_AGE IMPLEMENTATION.


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
*          data COMPANY TYPE ZTT_LFB1.
*
*
*          vendor = '7000000002'.
*          name = ''.
*
*
*
*      CALL FUNCTION 'ZVTS_VENDOR_COMPANY'
*      expORTING
*        vendor =     vendor
*      importing
*        company     = company.
*
*    IF sy-subrc IS INITIAL.
*
*    ENDIF.

*data: bukrs      type bukrs,
*      year       type gjahr,
*      period     type zrpmax,
*      account    TYPE ztthfis_racct,
*      ls_account type ZHFIS_RACCT,
*      saldos     type ztt_saldoscm.
*
*
*    IF sy-subrc IS INITIAL.
*      bukrs = '1001'.
*      year = '2025'.
*      ls_account-racct = '0041000000'.
*      append ls_account to account.
*      period = '12'.
*    ENDIF.
*
*      CALL FUNCTION 'ZHFIS_SALDOSCM'
*      expORTING
*        i_company_code =     bukrs
*        i_year         =     year
*        i_period       =     period
*        i_account      =     account
*      importing
*        e_saldoscm     = saldos.
*
*    IF sy-subrc IS INITIAL.
*
*    ENDIF.
*
DATA:
    user type uname,
    name1 type char30,
    NAME2 TYPE CHAR30,
    email type zemail,
   message type char100.


   USER = 'CAEQUIHUA'.



      CALL FUNCTION 'ZVTS_SEARCH_USER'
      expORTING
        USER    =     USER
      importing
        NAME1   = NAME1
        NAME2   = NAME2
        EMAIL   = EMAIL
        MESSAGE = MESSAGE.

    IF sy-subrc IS INITIAL.

    ENDIF.


*DATA:
*    user type uname,
*    name1 type char30,
*    NAME2 TYPE CHAR30,
*    email type zemail,
*   message type char100.
*
*
**   USER = 'CAEQUIHUA'.
*
*DATA: EBELN TYPE EBELN,
*      COMENTARIOS TYPE CHAR255,
*      langu type langu,
*      message type char255.
*
*      EBELN = '4500225571'.
*
*
*      CALL FUNCTION 'ZVTS_COMMENTS'
*      expORTING
*        EBELN       = EBELN
*        COMENTARIOS = COMENTARIOS
*        LANGU       = LANGU
*      importing
*        MESSAGE     = MESSAGE.
*
*    IF sy-subrc IS INITIAL.
*
*    ENDIF.

********data:
********    RFQ_DEL  TYPE ZTT_RFQ,
********    RFQ_MSSG TYPE ZTT_TLINE,
********
********  LS_DEL  TYPE ZES_RFQ,
********  LS_MSSG TYPE ZES_TLINE,
********  MENSAJE TYPE ztdline.
********
********  LS_DEL-purch_doc = '4500225571'.
********  LS_DEL-item      = '01'.
********  appEND LS_DEL to RFQ_DEL.
********
******** CALL FUNCTION 'ZVTS_RFQ_DELETE'
******** EXPORTING
********    RFQ_DEL = RFQ_DEL
********  IMPORTING
********    RFQ_MSSG = RFQ_MSSG
********.
********
********    IF sy-subrc IS INITIAL.
********
********    ENDIF.


  ENDMETHOD.
ENDCLASS.
