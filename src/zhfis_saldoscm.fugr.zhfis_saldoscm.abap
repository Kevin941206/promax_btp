FUNCTION zhfis_saldoscm.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(I_COMPANY_CODE) TYPE  BUKRS
*"     VALUE(I_YEAR) TYPE  GJAHR
*"     VALUE(I_PERIOD) TYPE  ZRPMAX
*"     VALUE(I_ACCOUNT) TYPE  ZTTHFIS_RACCT
*"  EXPORTING
*"     VALUE(E_SALDOSCM) TYPE  ZTT_SALDOSCM
*"----------------------------------------------------------------------
  "--------------------------------------------------------------------
  " Field-symbols para asignación dinámica
  "--------------------------------------------------------------------
  FIELD-SYMBOLS:
    <s>,
    <h>.

  "--------------------------------------------------------------------
  " Estructuras y tablas de trabajo
  "--------------------------------------------------------------------
  DATA:
    lt_saldoscm TYPE TABLE OF zhfis_saldoscm,
    ls_saldoscm TYPE zhfis_saldoscm,

    lt_faglflext TYPE ztt_faglflext,
    ls_faglflext TYPE zes_faglflext,

    ls_account     TYPE zracct,
    lr_range_racct TYPE zfagl_range_t_racct,
    ls_range_racct TYPE zfagl_range_racct,

    lt_t001 TYPE TABLE OF zt001,
    ls_t001 TYPE zt001,

    lt_companycode_tab TYPE ztt_t001,
    ls_companycode_tab TYPE zes_t001.

  "--------------------------------------------------------------------
  " Variables auxiliares
  "--------------------------------------------------------------------
  DATA:
    lv_tslxx  TYPE ztslxx,
    lv_hslxx  TYPE ztslxx,
    lv_period TYPE zrpmax,

    monat TYPE zmonat,

    fieldtsl(14)  TYPE c,
    fieldtsl2(14) TYPE c,
    fieldhsl(14)  TYPE c,
    fieldhsl2(14) TYPE c.

  "--------------------------------------------------------------------
  " Extracción de sociedades (T001)
  "--------------------------------------------------------------------
  zcl_qry_faglflext=>get_t001(
    EXPORTING
      i_operacion = 'READ LIST'
    IMPORTING
      et_companys = lt_companycode_tab
  ).

  LOOP AT lt_companycode_tab INTO ls_companycode_tab.
    ls_t001-bukrs = ls_companycode_tab-bukrs.
    ls_t001-butxt = ls_companycode_tab-butxt.
    ls_t001-ktopl = ls_companycode_tab-ktopl.
    APPEND ls_t001 TO lt_t001.
  ENDLOOP.

  "--------------------------------------------------------------------
  " Ajuste del período (dic → período 16)
  "--------------------------------------------------------------------
  IF i_period EQ 12.
    lv_period = 16.
  ELSE.
    lv_period = i_period.
  ENDIF.

  "--------------------------------------------------------------------
  " Construcción del rango de cuentas contables
  "--------------------------------------------------------------------
  LOOP AT i_account INTO ls_account.
    CLEAR ls_range_racct.
    ls_range_racct-sign   = 'I'.
    ls_range_racct-option = 'EQ'.
    ls_range_racct-low    = ls_account.
    APPEND ls_range_racct TO lr_range_racct.
  ENDLOOP.

  "--------------------------------------------------------------------
  " Extracción de saldos de FAGLFLEXT
  "--------------------------------------------------------------------
  zcl_qry_faglflext=>get_faglflext(
    EXPORTING
      i_operacion = 'READ LIST'
      rldnr       = '0L'
      rrcty       = '0'
      rvers       = '001'
      rbukrs      = i_company_code
      racct       = lr_range_racct
      ryear       = i_year
    IMPORTING
      lt_faglflext = lt_faglflext
  ).

  "--------------------------------------------------------------------
  " Definición de campos dinámicos
  "--------------------------------------------------------------------
  fieldtsl  = 'LS_FAGLFLEXT-TSLxx'.
  fieldtsl2 = 'LS_FAGLFLEXT-TSLVT'.
  fieldhsl  = 'LS_FAGLFLEXT-HSLxx'.
  fieldhsl2 = 'LS_FAGLFLEXT-HSLVT'.

  ASSIGN (fieldtsl2) TO <s>.
  ASSIGN (fieldhsl2) TO <h>.

  "--------------------------------------------------------------------
  " Variables para acumulación dinámica
  "--------------------------------------------------------------------
  DATA:
    ls_faglflext0vary  LIKE zes_faglflext-tsl01,
    ls_faglflext0vary2 LIKE zes_faglflext-hsl01.

  "--------------------------------------------------------------------
  " Procesamiento de saldos
  "--------------------------------------------------------------------
  LOOP AT lt_faglflext INTO ls_faglflext.

    CLEAR: ls_saldoscm, ls_t001.

    " Datos base
    ls_saldoscm-bukrs = ls_faglflext-rbukrs.
    ls_saldoscm-racct = ls_faglflext-racct.
    ls_saldoscm-ryear = ls_faglflext-ryear.
    ls_saldoscm-rtcur = 'MXN'.

    " Saldo inicial
    ls_saldoscm-saldoml =
      ls_saldoscm-saldoml + ls_faglflext-hslvt.

    " Obtener plan de cuentas
    READ TABLE lt_t001 INTO ls_t001
      WITH KEY bukrs = ls_saldoscm-bukrs
      BINARY SEARCH.

    "----------------------------------------------------------------
    " Extracción del texto de la cuenta (SKAT)
    "----------------------------------------------------------------
    zcl_qry_faglflext=>get_skat(
      EXPORTING
        i_operacion = 'READ'
        spras       = 'S'
        ktopl       = ls_t001-ktopl
        saknr       = ls_saldoscm-racct
      IMPORTING
        e_txt50     = ls_saldoscm-txt50
    ).

    "----------------------------------------------------------------
    " Acumulación de saldos por período
    "----------------------------------------------------------------
    DO lv_period TIMES
      VARYING ls_faglflext0vary2
      FROM ls_faglflext-hsl01
      NEXT ls_faglflext-hsl02.

      ls_saldoscm-saldoml =
        ls_saldoscm-saldoml + ls_faglflext0vary2.
    ENDDO.

    " Consolidación de resultados
    COLLECT ls_saldoscm INTO e_saldoscm.

  ENDLOOP.

ENDFUNCTION.
