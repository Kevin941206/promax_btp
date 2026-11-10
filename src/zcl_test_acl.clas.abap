CLASS zcl_test_acl DEFINITION
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



CLASS ZCL_TEST_ACL IMPLEMENTATION.


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

*    DATA: it_prodfam_t TYPE yttsd_prodfam_t.
*
*    CALL FUNCTION 'YFMSD_SUBPRODFAMILYS_GET'
*      IMPORTING et_prod_subfamilies = it_prodfam_t.
*
*    if it_prodfam_t IS INITIAL.
*
*    ENDIF.
*
*
*    DATA: IT_PROD_FAMILIES TYPE YTTMM_MERCHGROUP_E.
*    CALL FUNCTION 'YFMSD_PRODFAMILYS_GET'
*      IMPORTING et_prod_families = IT_PROD_FAMILIES.
*
*    if IT_PROD_FAMILIES IS INITIAL.
*
*    ENDIF.


*    DATA: IT_CURRENCY TYPE ZTT_TCURT.
*    CALL FUNCTION 'ZVTS_CURRENCY'
*      EXPORTING LANGU = SY-LANGU
*      IMPORTING CURRENCY = IT_CURRENCY.
*
*    if IT_CURRENCY IS INITIAL.
*
*    ENDIF.


*    DATA: it_ekpo_ekko TYPE ztt_ekpo_ekko.
*    DATA: po_number TYPE ebeln.
*    DATA: ztt_grs_detail TYPE ztt_grs_detail.
*    po_number = '4500225571'.
*
*    CALL FUNCTION 'ZVTS_GR_DETAIL'
*      EXPORTING po_number  = po_number
*      IMPORTING grs_detail = ztt_grs_detail.
*
*    if it_ekpo_ekko IS INITIAL.
*
*    ENDIF.

**********************************************************************
*
*    DATA: p_ebeln   TYPE RANGE OF ebeln,
*          ls_ebeln  LIKE LINE OF  p_ebeln,
*          p_bukrs   TYPE RANGE OF bukrs,
*          ls_bukrs  LIKE LINE OF  p_bukrs.
*
*    DATA: lv_message TYPE zchar255,
*          lv_elifn   TYPE elifn.
*
*          ls_bukrs-sign = 'I'.
*          ls_bukrs-option = 'EQ'.
*          ls_bukrs-low = '1101'.
*          APPEND ls_bukrs TO P_bukrs.
*
*          ls_ebeln-sign = 'I'.
*          ls_ebeln-option = 'EQ'.
*          ls_ebeln-low = '4500225571'.
*          APPEND ls_ebeln TO P_ebeln.
*
*
*    CALL FUNCTION 'ZVTS_GR_MOVS'
*      EXPORTING vendor     = lv_elifn
*                company    = '1101'
*                po_number  = '4500225571'
*                grs_sdate  = '03.10.2025'
*                grs_edate  = '03.12.2025'
*                language   = sy-langu
*      IMPORTING message    = lv_message.
*
*    IF p_bukrs IS INITIAL.
*
*    ENDIF.

**********************************************************************


*    DATA: vendor TYPE elifn,
*          company TYPE bukrs,
*          wo_grs TYPE zchar01,
*          w_grs TYPE zchar01,
*          w_irs TYPE zchar01,
*          w_pay TYPE zchar01,
*          po_snumber TYPE ebeln,
*          po_enumber TYPE ebeln,
*          po_sdate TYPE erdat,
*          po_edate TYPE erdat,
*          grs_sdate TYPE erdat,
*          grs_edate TYPE erdat,
*          irs_sdate TYPE erdat,
*          irs_edate TYPE erdat,
*          pay_sdate TYPE erdat,
*          pay_edate TYPE erdat,
*          records   TYPE zint4.
*
*    DATA: it_grs_list TYPE ztt_vts_grs_list.
*
*    vendor = '7000000002'.
*
*    CALL FUNCTION 'ZVTS_GR_LIST'
*       EXPORTING vendor      = vendor
*                 company     = company
*                 wo_grs      = wo_grs
*                 w_grs       = w_grs
*                 w_irs       = w_irs
*                 w_pay       = w_pay
*                 po_snumber  = po_snumber
*                 po_enumber  = po_enumber
*                 po_sdate    = po_sdate
*                 po_edate    = po_edate
*                 grs_sdate   = grs_sdate
*                 grs_edate   = grs_edate
*                 irs_sdate   = irs_sdate
*                 irs_edate   = irs_edate
*                 pay_sdate   = pay_sdate
*                 pay_edate   = pay_edate
*                 records     = records
*       IMPORTING grs_list    = it_grs_list.
*
*    IF it_grs_list IS INITIAL.
*
*    ENDIF.


**********************************************************************

*DATA: FECHA TYPE BLDAT,
*      SOCIEDAD TYPE BUKRS,
*      TIPODOC TYPE BLART,
*      MONTO TYPE WRBTR,
*      CUENTA TYPE LIFNR,
*      REFERENCIA TYPE ZCHAR16,
*      UID TYPE ZCHAR50,
*      ID_BOVEDA TYPE ZCHAR25,
*      VIA TYPE ZCHAR01,
*      PLANTA TYPE DZUONR,
*      RFC TYPE STCD1,
*      DOCUMENT TYPE EBELN,
*      BASE_RET TYPE WRBTR,
*      IMP_RET TYPE WRBTR,
*      CARGOS TYPE ZTT_CARGA_DIR,
*      CARGOS2 TYPE ZTT_CARGA_DIR,
*      DOCTO TYPE BELNR_D,
*      EJER_FIS TYPE GJAHR,
*      MESSAGE TYPE CHAR100.
*
*
*    document = '0000030691'.
*
*    CALL FUNCTION 'ZCARGA_DIR'
*       EXPORTING FECHA = fecha
*                 SOCIEDAD = sociedad
*                 TIPODOC = tipodoc
*                 MONTO = monto
*                 CUENTA = cuenta
*                 REFERENCIA = referencia
*                 UID = uid
*                 ID_BOVEDA = id_boveda
*                 VIA = via
*                 PLANTA = planta
*                 RFC = rfc
*                 DOCUMENT = document
*                 BASE_RET = base_ret
*                 IMP_RET = imp_ret
*                 CARGOS = cargos
*      IMPORTING  DOCTO = docto
*                 EJER_FIS = ejer_fis
*                 MESSAGE = message.
*
*    IF CARGOS2 IS NOT INITIAL.
*
*    ENDIF.

**********************************************************************

    DATA: quotation TYPE ebeln,
          attach    TYPE zvtt_attach.


    quotation = '4500233291'.


    CALL FUNCTION 'ZVTS_RFQ_ATTACH' EXPORTING quotation = quotation IMPORTING attach = attach.

    IF attach IS NOT INITIAL.

    ENDIF.

  ENDMETHOD.
ENDCLASS.
