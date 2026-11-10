FUNCTION zfiglmx_crp_journal_detail.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(I_COMPANY) TYPE  BUKRS
*"     VALUE(I_DOC_NUMBER) TYPE  BELNR_D
*"     VALUE(I_YEAR) TYPE  GJAHR
*"     VALUE(I_TIPO) TYPE  KOART
*"  EXPORTING
*"     VALUE(T_JOURNAL_DOC_REL) TYPE  ZTT_ZCRP_JOURNAL_DOC_REL
*"     VALUE(T_JOURNAL_DOC_REL_IMP) TYPE  ZTT_ZCRP_JOURNAL_DOC_REL_IMP
*"     VALUE(E_JOURNAL_DETAIL) TYPE  ZST_ZCRP_JOURNAL_DETAIL
*"----------------------------------------------------------------------


  TYPES:

    BEGIN OF ty_bseg,
      bukrs TYPE zst_bseg-bukrs,
      belnr TYPE zst_bseg-belnr,
      gjahr TYPE zst_bseg-gjahr,
      buzei TYPE zst_bseg-buzei,
      koart TYPE zst_bseg-koart,
      shkzg TYPE zst_bseg-shkzg,
      mwskz TYPE zst_bseg-mwskz,
      dmbtr TYPE zst_bseg-dmbtr,
      wrbtr TYPE zst_bseg-wrbtr,
      sgtxt TYPE zst_bseg-sgtxt,
      hkont TYPE zst_bseg-hkont,
      kunnr TYPE zst_bseg-kunnr,
      lifnr TYPE zst_bseg-lifnr,
      empfb TYPE zst_bseg-empfb,
      fwbas TYPE zst_bseg-fwbas,
      qsskz TYPE zst_bseg-qsskz,
    END OF ty_bseg,

    BEGIN OF ty_comp,
      bldat       TYPE zst_bkpf-bldat,
      bukrs       TYPE zst_bseg-bukrs,
      belnr       TYPE zst_bseg-belnr,
      gjahr       TYPE zst_bseg-gjahr,
      buzei       TYPE zst_bseg-buzei,
      bktxt       TYPE zst_bkpf-bktxt,
      amount      TYPE zst_bse_clr-wrbtr,
      wrbtr       TYPE zst_bse_clr-wrbtr,
      diffw       TYPE zst_bse_clr-diffw,
      dmbtr       TYPE zst_bse_clr-dmbtr,
      amount_mldr TYPE zst_bse_clr-dmbtr,
    END OF ty_comp,

    BEGIN OF ty_email,
      smtp_addr TYPE zad_smtpadr,
    END OF ty_email.

  DATA: lt_bseg     TYPE TABLE OF ty_bseg,
        lt_bseg_rel TYPE TABLE OF ty_bseg.

  DATA: ls_bkpf            LIKE zst_bkpf,
        ls_bkpf_rel        LIKE zst_bkpf,
        ls_bseg            TYPE ty_bseg,
        ls_bseg_temp       TYPE ty_bseg,
        ls_bseg_rel        TYPE ty_bseg,
        ls_skb1            TYPE zst_skb1,
        ls_t012            TYPE zst_t012,
        ls_bnka            TYPE zst_bnka,
        ls_t012k           TYPE zst_t012k,
        ls_kna1            TYPE zst_kna1,
        ls_lfa1            TYPE zst_lfa1,
        ls_reguh           TYPE zst_reguh,
        ls_t001            TYPE zes_t001,
        ls_adrc            TYPE zst_adrc,
        ls_t042z           TYPE zst_t042z,
        ls_knvk            TYPE zst_knvk,
        lt_knvk            TYPE TABLE OF zst_knvk,
        ls_ytasd_fact_uuid TYPE ytasd_fact_uuid,
        ls_yvalida_fi      TYPE yvalida_fi,
        lt_but051          TYPE TABLE OF zst_but051,
        ls_but051          TYPE zst_but051.

  DATA: lv_bktxt     TYPE zst_bkpf-bktxt,
        lv_date_from TYPE sy-datum,
        lv_date_to   TYPE sy-datum,
        lv_intad     TYPE intad.

  DATA: lt_comp         TYPE TABLE OF zst_bse_clr,
        lt_comp_b       TYPE TABLE OF zst_bse_clr,
        ls_comp         TYPE zst_bse_clr,
        ls_comp_b       TYPE zst_bse_clr,
        lt_with_item    TYPE TABLE OF zst_with_item,
        ls_with_item    TYPE zst_with_item,
        lv_koart        TYPE zst_bseg-koart,
        lv_rebzg        TYPE zst_bseg-rebzg,
        lv_rebzj        TYPE zst_bseg-rebzj,
        lv_rebzz        TYPE zst_bseg-rebzz,
        lv_doc          TYPE belnr_d,
        lv_year         TYPE gjahr,
        lv_item         TYPE buzei,
        lv_shkzg_a      TYPE shkzg,
        lv_shkzg_b      TYPE shkzg,
        lv_tdline       TYPE ztdline,
        lv_name1_email  TYPE zst_knvk-name1,
        lt_comp_pp      TYPE TABLE OF zst_bse_clr,  "pago parcial
        ls_comp_pp      TYPE zst_bse_clr,
        ls_bkpf_pp      LIKE ls_bkpf,
        lv_num_parc(3)  TYPE n,
        ls_tcambio      TYPE zes_bapi1093_0,
        lv_rate_type    TYPE zst_bapi1093_1-rate_type,
        lv_moneda_banco TYPE zst_skb1-waers,
        lv_amount_ml    TYPE wrbtr,
        lv_vbeln        TYPE vbeln,
        lv_ZUONR_d      TYPE dzuonr,
        lv_hkont        TYPE hkont,
        lv_fecha(10)    TYPE c,
        lv_vendor       TYPE lifnr,
        lt_email        TYPE TABLE OF ty_email,
        ls_email        TYPE ty_email.

  DATA: lt_comp_n1 TYPE TABLE OF ty_comp,
        ls_comp_n1 TYPE          ty_comp.

  DATA : lt_txtl TYPE TABLE OF zst_tline,
         ls_txtl TYPE zst_tline.

  DATA : tdobject TYPE zst_thead-tdobject  VALUE 'BELEG',
         tdname   TYPE zst_thead-tdname.

  DATA: lt_stxh TYPE TABLE OF zst_stxh,
        ls_stxh TYPE zst_stxh.

  DATA:  ls_crp_journal_doc_rel  TYPE zst_zcrp_journal_doc_rel.

  DATA: lv_amount          TYPE zst_bse_clr-wrbtr,
        lv_amount_b        TYPE zst_bse_clr-wrbtr,
        lv_amount_ant      TYPE zst_bse_clr-wrbtr,
        lv_amount_mldr     TYPE zst_bse_clr-dmbtr,
        lv_amount_mldr_b   TYPE zst_bse_clr-dmbtr,
        lv_amount_mldr_ant TYPE zst_bse_clr-dmbtr,
        lv_bktxt2          TYPE zst_bkpf-bktxt,
        lv_total_fact      TYPE zst_bseg-wrbtr,
        lv_por_pago        TYPE zst_bseg-wrbtr.

  DATA: lt_journal_doc_rel TYPE TABLE OF zst_zcrp_journal_doc_rel,
        ls_journal_doc_rel TYPE zst_zcrp_journal_doc_rel,
        ls_doc_rel_imp     TYPE zst_zcrp_journal_doc_rel_imp.

  DATA: lt_cuentas_imp TYPE TABLE OF zst_zcrp_cuentas_imp,
        ls_cuentas_imp TYPE zst_zcrp_cuentas_imp,
        lr_range_racct TYPE zvtt_fagl_range_racct,
        ls_range_racct TYPE zst_fagl_range_racct,
        lt_rel_imp     TYPE TABLE OF zst_zcrp_journal_doc_rel_imp,
        ls_rel_imp     TYPE zst_zcrp_journal_doc_rel_imp.

  DATA: lv_tasa       TYPE p DECIMALS 6,
        lv_imp_base   TYPE zst_bse_clr-wrbtr,
        lv_tipocambio TYPE zkursf,
        lv_par1(25)   TYPE c,
        lv_par2(25)   TYPE c,
        lv_total_imp  TYPE zst_bse_clr-wrbtr.

  DATA: ls_vbrk            TYPE zst_vbrk,
        ls_/AIF/T_MVMApval TYPE zst_AIF_T_MVMApval,
        ls_edocument       TYPE zst_edocument,
        ls_EDOMXINVOICE    TYPE zst_edomxinvoice,
        ls_dfkkbptaxnum    TYPE zst_dfkkbptaxnum.

  DATA: lv_bldat_dummy TYPE bldat,
        lv_rebzz_dummy TYPE zst_bseg-rebzz.

  CONSTANTS:
        c_numeric_characters(11) TYPE c VALUE '1234567890 '.

* Cambio 2.0
* Seleccion de cuentas de mayor impuestos
*  SELECT * INTO TABLE lt_cuentas_imp
*           FROM zcrp_cuentas_imp.
  zcl_qry_zfiglmx_journal_detail=>detail_zcrp_cuentas_imp( EXPORTING i_operacion = 'READ' IMPORTING lt_cuentas_imp = lt_cuentas_imp ).
  LOOP AT lt_cuentas_imp INTO ls_cuentas_imp.
    ls_range_racct-sign   = 'I'.
    ls_range_racct-option = 'EQ'.
    ls_range_racct-low    = ls_cuentas_imp-cuenta.
    APPEND ls_range_racct TO lr_range_racct.
  ENDLOOP.

*  SELECT SINGLE * INTO ls_bkpf
*                 FROM bkpf
*                WHERE bukrs EQ i_company
*                  AND belnr EQ i_doc_number
*                  AND gjahr EQ i_year.
  zcl_qry_zfiglmx_journal_detail=>detail_bkpf( EXPORTING i_operacion = 'READ' i_company = i_company i_doc_number = i_doc_number
  i_year = i_year IMPORTING ls_bkpf = ls_bkpf ).
*
*  SELECT bukrs belnr gjahr buzei koart shkzg mwskz dmbtr wrbtr sgtxt hkont
*         kunnr lifnr
*        FROM bseg INTO TABLE lt_bseg
*                       WHERE bukrs = ls_bkpf-bukrs
*                         AND belnr = ls_bkpf-belnr
*                         AND gjahr = ls_bkpf-gjahr.
  zcl_qry_zfiglmx_journal_detail=>detail_bseg( EXPORTING i_operacion = 'READ' ls_bkpf = ls_bkpf IMPORTING lt_bseg = lt_bseg ).
*  MOVE: ls_bkpf-bukrs     TO e_journal_detail-company,
*        ls_bkpf-belnr     TO e_journal_detail-doc_number,
*        ls_bkpf-gjahr     TO e_journal_detail-year,
*        ls_bkpf-blart     TO e_journal_detail-doc_type,
*        ls_bkpf-bldat     TO e_journal_detail-doc_date,
*        ls_bkpf-budat     TO e_journal_detail-pstng_date,
*        ls_bkpf-waers     TO e_journal_detail-currency,
*        ls_bkpf-kursf     TO e_journal_detail-exchange_rate.
  e_journal_detail-company       = ls_bkpf-bukrs.
  e_journal_detail-doc_number    = ls_bkpf-belnr.
  e_journal_detail-year          = ls_bkpf-gjahr.
  e_journal_detail-doc_type      = ls_bkpf-blart.
  e_journal_detail-doc_date      = ls_bkpf-bldat.
  e_journal_detail-pstng_date    = ls_bkpf-budat.
  e_journal_detail-currency      = ls_bkpf-waers.
  e_journal_detail-exchange_rate = ls_bkpf-kursf.

  IF ls_bkpf-xreversal EQ 2.
*    MOVE: ls_bkpf-stblg  TO e_journal_detail-reverse_doc,
*          ls_bkpf-stjah  TO e_journal_detail-reverse_year.
    e_journal_detail-reverse_doc  = ls_bkpf-stblg.
    e_journal_detail-reverse_year = ls_bkpf-stjah.
  ENDIF.

  READ TABLE lt_bseg INTO ls_bseg_temp WITH KEY koart = i_tipo.

**-------------------- "Clientes
  IF i_tipo EQ 'D'.
**   -------Forma de pago
    lv_bktxt = ls_bkpf-bktxt.
    TRANSLATE lv_bktxt TO UPPER CASE.

    IF lv_bktxt(2) CO '0123456789'.
      e_journal_detail-pymt_form = lv_bktxt(2).
    ENDIF.

*   Se toma en el campo de texto de cabecera si hay un ID de pago Relacionado
    SPLIT lv_bktxt AT '-' INTO:  lv_par1 lv_par2.

    CONDENSE lv_par2 NO-GAPS.
    IF lv_par2 CO '0123456789'.
      e_journal_detail-idpagporel = lv_par2.
    ENDIF.

*   ----------
*    MOVE ls_bseg_temp-kunnr TO e_journal_detail-cust_ven_id.   "No. Id Cliente
    e_journal_detail-cust_ven_id = ls_bseg_temp-kunnr.
*    SELECT SINGLE * INTO ls_kna1
*            FROM kna1
*           WHERE kunnr = ls_bseg_temp-kunnr.
    zcl_qry_zfiglmx_journal_detail=>detail_kna1( EXPORTING i_operacion = 'READ' lv_kunnr = ls_bseg_temp-kunnr IMPORTING ls_kna1 = ls_kna1 ).
*    IF sy-subrc EQ 0.
    IF ls_kna1 IS NOT INITIAL.
      CONCATENATE ls_kna1-name1 ls_kna1-name2 ls_kna1-name3
             INTO e_journal_detail-cust_ven_name SEPARATED BY space.    "Nombre
*      MOVE: ls_kna1-land1 TO e_journal_detail-cust_ven_ctry,            "Pais
*            ls_kna1-pstlz TO e_journal_detail-cust_ven_cp.              "CP Cliente - v 2.0
      e_journal_detail-cust_ven_ctry = ls_kna1-land1.
      e_journal_detail-cust_ven_cp   = ls_kna1-pstlz.
      IF ls_kna1-stcd1 CO c_numeric_characters.
*        MOVE ls_kna1-stcd1 TO e_journal_detail-recpt_id_tri.          "Recpt Número de Registro ID Tributario
        e_journal_detail-recpt_id_tri = ls_kna1-stcd1.
      ELSEIF ls_kna1-stcd2 CO c_numeric_characters.
*        MOVE ls_kna1-stcd2 TO e_journal_detail-recpt_id_tri.
        e_journal_detail-recpt_id_tri = ls_kna1-stcd2.
      ELSEIF ls_kna1-stcd3 CO c_numeric_characters.
*        MOVE ls_kna1-stcd3 TO e_journal_detail-recpt_id_tri.
        e_journal_detail-recpt_id_tri = ls_kna1-stcd3.
      ELSEIF ls_kna1-stcd4 CO c_numeric_characters.
*        MOVE ls_kna1-stcd4 TO e_journal_detail-recpt_id_tri.
        e_journal_detail-recpt_id_tri = ls_kna1-stcd4.
      ENDIF.

*  Se busca el Regimen Fiscal
      CLEAR ls_/AIF/T_MVMApval.
*      SELECT SINGLE * INTO ls_/AIF/T_MVMApval
*             FROM /AIF/T_MVMApval
*            WHERE ns EQ '/EDOMX'
*              AND vmapname EQ 'RECEIVER_TAX_REGIME'
*              AND int_value EQ ls_bseg_temp-kunnr.
      zcl_qry_zfiglmx_journal_detail=>detail_/aif/t_mvmapval( EXPORTING i_operacion = 'READ' lv_int_value = ls_bseg_temp-kunnr
      IMPORTING ls_/aif/t_mvmapval = ls_/aif/t_mvmapval ).
*      IF sy-subrc EQ 0.
      IF ls_/aif/t_mvmapval IS NOT INITIAL.
        e_journal_detail-cust_ven_rf = ls_/AIF/T_MVMApval-ext_value.
      ENDIF.

* Se busca el RFC del Cliente
      CLEAR ls_dfkkbptaxnum.
*      SELECT SINGLE * INTO ls_dfkkbptaxnum
*             FROM dfkkbptaxnum
*            WHERE partner EQ ls_bseg_temp-kunnr.
      zcl_qry_zfiglmx_journal_detail=>detail_dfkkbptaxnum( EXPORTING i_operacion = 'READ' lv_partner = ls_bseg_temp-kunnr
      IMPORTING ls_dfkkbptaxnum = ls_dfkkbptaxnum ).
*      IF sy-subrc EQ 0.
      IF ls_dfkkbptaxnum IS NOT INITIAL.
        e_journal_detail-cust_ven_rfc = ls_dfkkbptaxnum-taxnum.
        IF e_journal_detail-cust_ven_rfc IS INITIAL.
          e_journal_detail-cust_ven_rfc = ls_dfkkbptaxnum-taxnumxl.
        ENDIF.
      ENDIF.
*
*      SELECT * INTO TABLE lt_but051
*                     FROM but051
*                    WHERE partner1 EQ ls_kna1-kunnr
*                      AND pafkt EQ '0005'.
      zcl_qry_zfiglmx_journal_detail=>detail_but051( EXPORTING i_operacion = 'READ' lv_partner = ls_kna1-kunnr
        IMPORTING lt_but051 = lt_but051 ).
      LOOP AT lt_but051 INTO ls_but051.
        IF e_journal_detail-cust_ven_email IS INITIAL.
          e_journal_detail-cust_ven_email = ls_but051-smtp_address.
        ELSE.
          CONCATENATE e_journal_detail-cust_ven_email ls_but051-smtp_address INTO e_journal_detail-cust_ven_email SEPARATED BY ';'.
          CONDENSE e_journal_detail-cust_ven_email NO-GAPS.
        ENDIF.
      ENDLOOP.
*
*      SELECT SINGLE sort2 INTO e_journal_detail-vendor_type                "Tipo de Proveedor
*       FROM adrc
*      WHERE addrnumber EQ ls_kna1-adrnr
*        AND date_to    EQ '99991231'.
      zcl_qry_zfiglmx_journal_detail=>detail_adrc( EXPORTING i_operacion = 'READ' lv_adrnr = ls_kna1-adrnr
      IMPORTING lv_vendor_type = e_journal_detail-vendor_type ).
    ENDIF.
*
*    SELECT SINGLE adrnr INTO ls_t001-adrnr
*              FROM t001
*             WHERE bukrs EQ ls_bkpf-bukrs.
    zcl_qry_zfiglmx_journal_detail=>detail_t001( EXPORTING i_operacion = 'READ' lv_bukrs = ls_bkpf-bukrs IMPORTING lv_adrnr = ls_t001-adrnr ).
*    IF sy-subrc EQ 0.
    IF ls_t001-adrnr IS NOT INITIAL.
      CLEAR ls_adrc.
*      SELECT SINGLE * INTO ls_adrc
*             FROM adrc
*            WHERE addrnumber EQ ls_t001-adrnr
*              AND date_to    EQ '99991231'.
      zcl_qry_zfiglmx_journal_detail=>detail_adrc2( EXPORTING i_operacion = 'READ' lv_adrnr = ls_t001-adrnr IMPORTING ls_adrc = ls_adrc ).
*      IF sy-subrc EQ 0.
      IF ls_adrc IS NOT INITIAL.
        e_journal_detail-postal_code = ls_adrc-post_code1.
*        MOVE ls_adrc-post_code1 TO e_journal_detail-postal_code.          "Lugar de Expedición
        CONCATENATE ls_adrc-name1 ls_adrc-name2
               INTO e_journal_detail-emisor_name SEPARATED BY space.      "Nombre Emisor
      ENDIF.
    ENDIF.

    IF e_journal_detail-cust_ven_ctry NE 'MX'.
*      MOVE e_journal_detail-postal_code TO e_journal_detail-cust_ven_cp.
      e_journal_detail-cust_ven_cp = e_journal_detail-postal_code.
    ENDIF.
*
*    SELECT SINGLE paval INTO e_journal_detail-emisor_rfc                     "Emisor RFC
*              FROM t001z
*             WHERE bukrs EQ ls_bkpf-bukrs
*               AND party EQ 'MX_RFC'.
    zcl_qry_zfiglmx_journal_detail=>detail_t001z( EXPORTING i_operacion = 'READ' lv_bukrs = ls_bkpf-bukrs
    IMPORTING lv_paval = e_journal_detail-emisor_rfc ).

    CLEAR lv_tdline.
    PERFORM read_text USING   'CP01'      "No. Operación
                              ls_bkpf
                     CHANGING lv_tdline.
*    MOVE lv_tdline TO e_journal_detail-num_operacion.
    e_journal_detail-num_operacion = lv_tdline.

    CLEAR lv_tdline.
    PERFORM read_text USING   'CP02'      "RFC Emisor Cuenta Ordenante
                              ls_bkpf
                     CHANGING lv_tdline.
*    MOVE lv_tdline TO e_journal_detail-bank_rfc_org.
    e_journal_detail-bank_rfc_org = lv_tdline.

    CLEAR lv_tdline.
    PERFORM read_text USING   'CP03'      "Nombre Banco Ordenante Ext
                              ls_bkpf
                     CHANGING lv_tdline.
*    MOVE lv_tdline TO e_journal_detail-nom_banco_ext.
    e_journal_detail-nom_banco_ext = lv_tdline.

    CLEAR lv_tdline.
    PERFORM read_text USING   'CP04'      "Cuenta Ordenante Origen
                              ls_bkpf
                     CHANGING lv_tdline.
*    MOVE lv_tdline TO e_journal_detail-bank_acct_org.
    e_journal_detail-bank_acct_org = lv_tdline.

    CLEAR lv_tdline.
    PERFORM read_text USING   'CP05'      "Tipo Cadena Pago
                              ls_bkpf
                     CHANGING lv_tdline.
*    MOVE lv_tdline TO e_journal_detail-tipo_cadpago.
    e_journal_detail-tipo_cadpago = lv_tdline.

    CLEAR lv_tdline.
    PERFORM read_text USING   'CP06'      "Certificado de Pago
                              ls_bkpf
                     CHANGING lv_tdline.
*    MOVE lv_tdline TO e_journal_detail-cert_pago.
    e_journal_detail-cert_pago = lv_tdline.

    CLEAR lv_tdline.
    PERFORM read_text USING   'CP07'      "Cadena de Pago
                              ls_bkpf
                     CHANGING lv_tdline.
*    MOVE lv_tdline TO e_journal_detail-cad_pago.
    e_journal_detail-cad_pago = lv_tdline.

    CLEAR lv_tdline.
    PERFORM read_text USING   'CP08'      "Sello de Pago
                              ls_bkpf
                     CHANGING lv_tdline.
*    MOVE lv_tdline TO e_journal_detail-sello_pago.
    e_journal_detail-sello_pago = lv_tdline.
  ENDIF.
*
**-------------------- "Proveedores
  IF i_tipo EQ 'K'.
    CLEAR: lv_date_from, lv_date_to, ls_reguh, ls_bnka, lv_intad.
    lv_date_from(4) = i_year.
    lv_date_from+4(4) = '0101'.
    lv_date_to(4) = i_year.
    lv_date_to+4(4) = '1231'.
*    SELECT SINGLE * INTO ls_reguh
*           FROM  reguh
*          WHERE ( laufd GE lv_date_from AND
*                  laufd LE lv_date_to )
*            AND xvorl EQ space
*            AND zbukr EQ ls_bkpf-bukrs
*            AND vblnr EQ ls_bkpf-belnr.
    zcl_qry_zfiglmx_journal_detail=>detail_reguh( EXPORTING i_operacion = 'READ' ls_bkpf = ls_bkpf lv_date_from = lv_date_from
    lv_date_to = lv_date_to IMPORTING ls_reguh = ls_reguh ).
*    IF sy-subrc EQ 0.
    IF ls_reguh IS NOT INITIAL.
*      SELECT SINGLE * INTO ls_bnka
*                      FROM bnka
*                     WHERE banks EQ ls_reguh-zbnks
*                       AND bankl EQ ls_reguh-zbnky.
      zcl_qry_zfiglmx_journal_detail=>detail_bnka( EXPORTING i_operacion = 'READ' ls_reguh = ls_reguh IMPORTING ls_bnka = ls_bnka ).
*      IF sy-subrc EQ 0.
      IF ls_bnka IS NOT INITIAL.
*        MOVE ls_bnka-brnch TO e_journal_detail-bank_rfc_dest.
        e_journal_detail-bank_rfc_dest = ls_bnka-brnch.           "RFC Banco Destino
      ENDIF.
*      MOVE: ls_reguh-zbnkn TO e_journal_detail-bank_acct_dest.              "Cuenta Destino
      e_journal_detail-bank_acct_dest = ls_reguh-zbnkn.
*      SELECT SINGLE * INTO ls_t042z
*                      FROM t042z
*                     WHERE land1 EQ 'MX'
*                       AND zlsch EQ ls_reguh-rzawe.
      zcl_qry_zfiglmx_journal_detail=>detail_t042z( EXPORTING i_operacion = 'READ' lv_rzawe = ls_reguh-rzawe IMPORTING ls_t042z = ls_t042z ).
*      IF sy-subrc EQ 0.
      IF ls_t042z IS NOT INITIAL.
*        MOVE ls_t042z-text1(2) TO e_journal_detail-pymt_form.               "Forma de Pago
        e_journal_detail-pymt_form = ls_t042z-text1(2).
      ENDIF.
    ENDIF.
**   Determina si es un Agente Aduanal
    DATA: lv_bktxt3 TYPE bktxt.
    lv_bktxt3 = ls_bkpf-bktxt(4).
*    SELECT SINGLE * INTO ls_crp_aa
*              FROM zfiglmx_crp_aa
*             WHERE aa_id EQ ls_bkpf-bktxt(4).
    zcl_qry_zfiglmx_journal_detail=>detail_zfiglmx_crp_aa( EXPORTING i_operacion = 'READ' lv_bktxt = lv_bktxt3 IMPORTING ls_crp_aa = ls_crp_aa ).
*    IF sy-subrc EQ 0.
    IF ls_crp_aa IS NOT INITIAL.
      e_journal_detail-vendor_type = 'AGENTE'.
      e_journal_detail-pymt_form   = '03'.
      e_journal_detail-amount      = ls_bseg_temp-wrbtr.
    ENDIF.

    IF e_journal_detail-pymt_form IS INITIAL.
      lv_bktxt = ls_bkpf-bktxt.
      TRANSLATE lv_bktxt TO UPPER CASE..

      IF lv_bktxt(2) CO '0123456789'.
        e_journal_detail-pymt_form = lv_bktxt(2).
      ENDIF.
    ENDIF.
*    MOVE ls_bseg_temp-lifnr TO e_journal_detail-cust_ven_id.            "No. Id Proveedor
    e_journal_detail-cust_ven_id = ls_bseg_temp-lifnr.

    IF e_journal_detail-vendor_type = 'AGENTE'.
      lv_vendor = ls_crp_aa-lifnr.
    ELSE.
      lv_vendor = ls_bseg_temp-lifnr.
    ENDIF.

*    SELECT SINGLE * INTO ls_lfa1
*            FROM lfa1
*           WHERE lifnr = ls_bseg_temp-lifnr.
    zcl_qry_zfiglmx_journal_detail=>detail_lfa1( EXPORTING i_operacion = 'READ' lv_lifnr = ls_bseg_temp-lifnr IMPORTING ls_lfa1 = ls_lfa1 ).
*    IF sy-subrc EQ 0.
    IF ls_lfa1 IS NOT INITIAL.
      CONCATENATE ls_lfa1-name1 ls_lfa1-name2
             INTO e_journal_detail-cust_ven_name SEPARATED BY space.       "Nombre
*      MOVE: ls_lfa1-land1 TO e_journal_detail-cust_ven_ctry,               "Pais
*            ls_lfa1-stcd1 TO e_journal_detail-cust_ven_rfc,                "RFC
*            ls_kna1-pstlz TO e_journal_detail-cust_ven_cp,              "CP Cliente - v 2.0
*            ls_kna1-katr6 TO e_journal_detail-cust_ven_rf.          "Regimen Fiscal Cleinte - 2.0
      e_journal_detail-cust_ven_ctry = ls_lfa1-land1.
      e_journal_detail-cust_ven_rfc  = ls_lfa1-stcd1.
      e_journal_detail-cust_ven_cp   = ls_kna1-pstlz.
      e_journal_detail-cust_ven_rf   = ls_kna1-katr6.

      CLEAR: lt_but051[].
*      SELECT * INTO TABLE lt_but051
*                     FROM but051
*                    WHERE partner1 EQ lv_vendor
*                      AND abtnr EQ ls_bkpf-bukrs
*                      AND pafkt EQ '0011'.
      zcl_qry_zfiglmx_journal_detail=>detail_but051v2( EXPORTING i_operacion = 'READ' lv_partner = lv_vendor lv_abtnr = ls_bkpf-bukrs
      IMPORTING lt_but051 = lt_but051 ).
      LOOP AT lt_but051 INTO ls_but051.
        IF e_journal_detail-cust_ven_email IS INITIAL.
          e_journal_detail-cust_ven_email = ls_but051-smtp_address.
        ELSE.
          CONCATENATE e_journal_detail-cust_ven_email ls_but051-smtp_address INTO e_journal_detail-cust_ven_email SEPARATED BY ';'.
          CONDENSE e_journal_detail-cust_ven_email NO-GAPS.
        ENDIF.
      ENDLOOP.

      IF e_journal_detail-vendor_type IS INITIAL.
*        SELECT SINGLE sort2 INTO e_journal_detail-vendor_type                "Tipo de Proveedor
*               FROM adrc
*              WHERE addrnumber EQ ls_lfa1-adrnr
*                AND date_to    EQ '99991231'.
        zcl_qry_zfiglmx_journal_detail=>detail_adrc( EXPORTING i_operacion = 'READ' lv_adrnr = ls_lfa1-adrnr
        IMPORTING lv_vendor_type = e_journal_detail-vendor_type ).
      ENDIF.
      IF ls_bseg_temp-lifnr CP '7*'.
        e_journal_detail-vendor_type = 'EMPLEADO'.
      ENDIF.
    ENDIF.

    CLEAR: lv_vendor.
    IF e_journal_detail-vendor_type = 'AGENTE'.
      CLEAR: ls_lfa1.
      lv_vendor = ls_crp_aa-lifnr.
*      MOVE lv_vendor TO e_journal_detail-factor_id.            "No. Id AGENTE
      e_journal_detail-factor_id = lv_vendor.
*      SELECT SINGLE * INTO ls_lfa1
*              FROM lfa1
*             WHERE lifnr = lv_vendor.
      zcl_qry_zfiglmx_journal_detail=>detail_lfa1( EXPORTING i_operacion = 'READ' lv_lifnr = lv_vendor IMPORTING ls_lfa1 = ls_lfa1 ).
*      IF sy-subrc EQ 0.
      IF ls_lfa1 IS NOT INITIAL.
        CONCATENATE ls_lfa1-name1 ls_lfa1-name2
               INTO e_journal_detail-factor_name SEPARATED BY space.       "Nombre
*        MOVE: ls_lfa1-land1 TO e_journal_detail-factor_ctry,               "Pais
*              ls_lfa1-stcd1 TO e_journal_detail-factor_rfc.                "RFC
        e_journal_detail-factor_ctry = ls_lfa1-land1.
        e_journal_detail-factor_rfc  = ls_lfa1-stcd1.
*        SELECT SINGLE * INTO ls_knvk
*                        FROM knvk
*                       WHERE lifnr EQ ls_lfa1-lifnr
*                         AND abtnr EQ ls_bkpf-bukrs
*                         AND pafkt EQ 11.
        zcl_qry_zfiglmx_journal_detail=>detail_knvk( EXPORTING i_operacion = 'READ' lv_lifnr = ls_lfa1-lifnr lv_abtnr = ls_bkpf-bukrs
        IMPORTING ls_knvk = ls_knvk ).
        IF ls_knvk-prsnr IS NOT INITIAL.
*          SELECT SINGLE smtp_addr INTO e_journal_detail-factor_email         "E-mail
*                          FROM adr6
*                         WHERE persnumber EQ ls_knvk-prsnr.
          zcl_qry_zfiglmx_journal_detail=>detail_adr6( EXPORTING i_operacion = 'READ' lv_prsnr = ls_knvk-prsnr
          IMPORTING lv_smtp = e_journal_detail-factor_email ).
        ENDIF.
      ENDIF.
    ENDIF.
  ENDIF.

  CLEAR: lv_amount_ml, lv_moneda_banco.
  LOOP AT lt_bseg INTO ls_bseg.
    CLEAR: ls_skb1, ls_t012k, ls_t012, ls_bnka.
*    SELECT SINGLE * INTO ls_skb1
*                    FROM skb1
*                   WHERE bukrs EQ ls_bseg-bukrs
*                     AND saknr EQ ls_bseg-hkont
*                     AND hbkid NE space
*                     AND hktid NE space.
    zcl_qry_zfiglmx_journal_detail=>detail_skb1( EXPORTING i_operacion = 'READ' lv_bukrs = ls_bseg-bukrs lv_saknr = ls_bseg-hkont
    IMPORTING ls_skb1 = ls_skb1 ).
*    IF sy-subrc EQ 0.
    IF ls_skb1 IS NOT INITIAL.
      lv_moneda_banco = ls_skb1-waers.
*      SELECT SINGLE * INTO ls_t012k
*                      FROM t012k
*                     WHERE bukrs EQ ls_bseg-bukrs
*                       AND hbkid EQ ls_skb1-hbkid
*                       AND hb EQ ls_skb1-hktid.
      zcl_qry_zfiglmx_journal_detail=>detail_t012k( EXPORTING i_operacion = 'READ' lv_bukrs = ls_bseg-bukrs lv_hbkid = ls_skb1-hbkid
      lv_hktid = ls_skb1-hktid IMPORTING ls_t012k = ls_t012k ).
*      IF sy-subrc EQ 0.
      IF ls_t012k IS NOT INITIAL.
*        SELECT SINGLE * INTO ls_t012
*                     FROM t012
*                    WHERE bukrs EQ ls_bseg-bukrs
*                      AND hbkid EQ ls_skb1-hbkid.
        zcl_qry_zfiglmx_journal_detail=>detail_t012( EXPORTING i_operacion = 'READ' lv_bukrs = ls_bseg-bukrs lv_hbkid = ls_skb1-hbkid
        IMPORTING ls_t012 = ls_t012 ).
*        IF sy-subrc EQ 0.
        IF ls_t012 IS NOT INITIAL.
*          SELECT SINGLE * INTO ls_bnka
*                          FROM bnka
*                         WHERE banks EQ ls_t012-banks
*                           AND bankl EQ ls_t012-bankl.
          zcl_qry_zfiglmx_journal_detail=>detail_bnka2( EXPORTING i_operacion = 'READ' ls_t012 = ls_t012 IMPORTING ls_bnka = ls_bnka ).
        ENDIF.
      ENDIF.
*
**     -------------------- "Clientes
      IF i_tipo EQ 'D'.
        IF ls_bseg-shkzg EQ 'S'.
          e_journal_detail-amount = e_journal_detail-amount + ls_bseg-wrbtr.   "Importe pago
          lv_amount_ml = lv_amount_ml + ls_bseg-dmbtr.                         "Importe pago ML
        ENDIF.
        IF ls_t012-stcd1 IS NOT INITIAL.
*          MOVE ls_t012-stcd1 TO e_journal_detail-bank_rfc_dest.              "RFC banco Destino
          e_journal_detail-bank_rfc_dest = ls_t012-stcd1.
        ENDIF.
        IF ls_t012k-bankn IS NOT INITIAL.
*          MOVE ls_t012k-bankn TO e_journal_detail-bank_acct_dest.             "Cuenta Destino
          e_journal_detail-bank_acct_dest = ls_t012k-bankn.
        ENDIF.
      ENDIF.
*
**     -------------------- "Proveedores
      IF i_tipo EQ 'K'.
        IF ls_bseg-shkzg EQ 'H'.
          e_journal_detail-amount = e_journal_detail-amount + ls_bseg-wrbtr.  "Importe pago
          lv_amount_ml = lv_amount_ml + ls_bseg-dmbtr.                        "Importe pago ML
        ENDIF.
*        MOVE ls_bnka-brnch TO  e_journal_detail-bank_rfc_org.              "RFC banco Origen
        e_journal_detail-bank_rfc_org = ls_bnka-brnch.
        IF ls_t012k-bankn IS NOT INITIAL.
*          MOVE ls_t012k-bankn TO e_journal_detail-bank_acct_org.              "Cuenta Origen
          e_journal_detail-bank_acct_org = ls_t012k-bankn.
        ENDIF.
      ENDIF.
    ELSE.
**     Comisiones Bancarias y Ajustes Manuales
*      SELECT SINGLE hkont INTO lv_hkont
*              FROM zcrp_account
*             WHERE hkont  EQ ls_bseg-hkont.
      zcl_qry_zfiglmx_journal_detail=>detail_zcrp_account( EXPORTING i_operacion = 'READ' lv_hkont = ls_bseg-hkont IMPORTING v_hkont = lv_hkont ).
*      IF sy-subrc EQ 0.
      IF lv_hkont IS NOT INITIAL.
        IF i_tipo EQ 'D'.  "Clientes
          IF ls_bseg-shkzg EQ 'S'.
            e_journal_detail-amount =  e_journal_detail-amount + ls_bseg-wrbtr.  "Importe pago
            lv_amount_ml = lv_amount_ml + ls_bseg-dmbtr.                         "Importe pago ML
          ENDIF.
          IF ls_bseg-shkzg EQ 'H'.
            e_journal_detail-amount =  e_journal_detail-amount - ls_bseg-wrbtr.  "Importe pago
            lv_amount_ml = lv_amount_ml - ls_bseg-dmbtr.                         "Importe pago ML
          ENDIF.
        ENDIF.
        IF i_tipo EQ 'K'.  "Proveedores
          IF ls_bseg-shkzg EQ 'S'.
            e_journal_detail-amount =  e_journal_detail-amount - ls_bseg-wrbtr.  "Importe pago
            lv_amount_ml = lv_amount_ml - ls_bseg-dmbtr.                         "Importe pago ML
          ENDIF.
          IF ls_bseg-shkzg EQ 'H'.
            e_journal_detail-amount =  e_journal_detail-amount + ls_bseg-wrbtr.  "Importe pago
            lv_amount_ml = lv_amount_ml + ls_bseg-dmbtr.                         "Importe pago ML
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDLOOP.
*
**************************************************************+
* DOCS RELACIONADOS
  CLEAR: lt_comp, ls_comp, lt_comp_b[], ls_comp_b, lv_shkzg_a, lv_shkzg_b.
  IF i_tipo EQ 'D'.
    lv_shkzg_a = 'S'.
    lv_shkzg_b = 'H'.
  ENDIF.
  IF i_tipo EQ 'K'.
    lv_shkzg_a = 'H'.
    lv_shkzg_b = 'S'.
  ENDIF.

*  SELECT * INTO TABLE lt_comp
*         FROM bse_clr
*        WHERE bukrs_clr EQ i_company
*          AND belnr_clr EQ i_doc_number
*          AND gjahr_clr EQ i_year
*          AND koart     EQ i_tipo
*          AND shkzg     EQ lv_shkzg_a.
  zcl_qry_zfiglmx_journal_detail=>detail_bse_clr( EXPORTING i_operacion = 'READ' lv_bukrs = i_company lv_belnr = i_doc_number lv_gjahr = i_year
  lv_koart = i_tipo lv_shkzg = lv_shkzg_a IMPORTING lt_bse_clr = lt_comp ).
*  SELECT * INTO TABLE lt_comp_b
*         FROM bse_clr
*        WHERE bukrs_clr EQ i_company
*          AND belnr_clr EQ i_doc_number
*          AND gjahr_clr EQ i_year
*          AND koart     EQ i_tipo
*          AND shkzg     EQ lv_shkzg_b.
  zcl_qry_zfiglmx_journal_detail=>detail_bse_clr( EXPORTING i_operacion = 'READ' lv_bukrs = i_company lv_belnr = i_doc_number lv_gjahr = i_year
  lv_koart = i_tipo lv_shkzg = lv_shkzg_b IMPORTING lt_bse_clr = lt_comp_b ).
*
  LOOP AT lt_comp INTO ls_comp.
    CLEAR: ls_comp_n1.
*    SELECT SINGLE bktxt bldat INTO (ls_comp_n1-bktxt, ls_comp_n1-bldat)
*                   FROM bkpf
*                  WHERE bukrs EQ ls_comp-bukrs
*                    AND belnr EQ ls_comp-belnr
*                    AND gjahr EQ ls_comp-gjahr.
    zcl_qry_zfiglmx_journal_detail=>detail_bkpf2( EXPORTING i_operacion = 'READ' i_year = ls_comp-gjahr i_doc_number = ls_comp-belnr i_company = ls_comp-bukrs
    IMPORTING lv_bktxt = ls_comp_n1-bktxt lv_bldat = ls_comp_n1-bldat ).
*    MOVE:
*       ls_comp-bukrs  TO ls_comp_n1-bukrs,
*       ls_comp-belnr  TO ls_comp_n1-belnr,
*       ls_comp-gjahr  TO ls_comp_n1-gjahr,
*       ls_comp-buzei  TO ls_comp_n1-buzei,
*       ls_comp-wrbtr  TO ls_comp_n1-wrbtr,
*       ls_comp-diffw  TO ls_comp_n1-diffw,
*       ls_comp-dmbtr  TO ls_comp_n1-dmbtr.
    ls_comp_n1-bukrs = ls_comp-bukrs.
    ls_comp_n1-belnr = ls_comp-belnr.
    ls_comp_n1-gjahr = ls_comp-gjahr.
    ls_comp_n1-buzei = ls_comp-buzei.
    ls_comp_n1-wrbtr = ls_comp-wrbtr.
    ls_comp_n1-diffw = ls_comp-diffw.
    ls_comp_n1-dmbtr = ls_comp-dmbtr.
    ls_comp_n1-amount      = ls_comp-wrbtr - abs( ls_comp-diffw ).
    ls_comp_n1-amount_mldr = ls_comp-dmbtr - abs( ls_comp-difhw ).
    APPEND  ls_comp_n1 TO lt_comp_n1.
  ENDLOOP.

  SORT lt_comp_n1 BY bldat ASCENDING bukrs belnr gjahr buzei ASCENDING.

  LOOP AT lt_comp_n1 INTO ls_comp_n1.
    lv_amount     = ls_comp_n1-amount.
    lv_amount_ant = ls_comp_n1-wrbtr.

    lv_amount_mldr     = ls_comp_n1-amount_mldr.
    lv_amount_mldr_ant = ls_comp_n1-dmbtr.

    LOOP AT lt_comp_b INTO ls_comp_b.
*             Se busca Ref de factura.
      CLEAR: lv_bktxt2, lv_amount_b, lv_amount_mldr_b.
*      SELECT SINGLE bktxt INTO lv_bktxt2
*                     FROM bkpf
*                    WHERE bukrs EQ ls_comp_b-bukrs
*                      AND belnr EQ ls_comp_b-belnr
*                      AND gjahr EQ ls_comp_b-gjahr.
      zcl_qry_zfiglmx_journal_detail=>detail_bkpf2( EXPORTING i_operacion = 'READ' i_company = ls_comp_b-bukrs i_doc_number = ls_comp_b-belnr
          i_year = ls_comp_b-gjahr IMPORTING lv_bktxt = lv_bktxt2 lv_bldat = lv_bldat_dummy ).
      IF ls_comp_n1-bktxt EQ lv_bktxt2 AND
         ls_comp_n1-bktxt IS NOT INITIAL AND lv_bktxt2 IS NOT INITIAL AND ls_comp_b-wrbtr GT 0.

        CLEAR lt_with_item[].
*       Se buscan retenciones para Notas de Credito
*    SELECT * INTO TABLE lt_with_item
*             FROM with_item
*            WHERE bukrs EQ ls_comp_b-bukrs
*              AND belnr EQ ls_comp_b-belnr
*              AND gjahr EQ ls_comp_b-gjahr.
        zcl_qry_zfiglmx_journal_detail=>detail_with_item( EXPORTING i_operacion = 'READ' lv_bukrs = ls_comp_b-bukrs lv_belnr = ls_comp_b-belnr
        lv_gjahr = ls_comp_b-gjahr IMPORTING lt_with = lt_with_item ).
*       las retenciones como estan gurdadas como negativo se restan al total
        LOOP AT lt_with_item INTO ls_with_item.
          IF i_tipo EQ 'K'.
            ls_comp_b-wrbtr = ls_comp_b-wrbtr - ls_with_item-wt_qbshb.
            ls_comp_b-dmbtr = ls_comp_b-dmbtr - ls_with_item-wt_qsshh.
          ENDIF.
          IF i_tipo EQ 'D'.
            ls_comp_b-wrbtr = ls_comp_b-wrbtr + ls_with_item-wt_qbshb.
            ls_comp_b-dmbtr = ls_comp_b-dmbtr + ls_with_item-wt_qsshh.
          ENDIF.
        ENDLOOP.

        lv_amount_b   = ls_comp_b-wrbtr - lv_amount.
        lv_amount     = lv_amount     - ls_comp_b-wrbtr.
        lv_amount_ant = lv_amount_ant - ls_comp_b-wrbtr.

        lv_amount_mldr_b   = ls_comp_b-dmbtr - lv_amount_mldr.
        lv_amount_mldr     = lv_amount_mldr     - ls_comp_b-dmbtr.
        lv_amount_mldr_ant = lv_amount_mldr_ant - ls_comp_b-dmbtr.

        IF lv_amount LE 0.
          lv_amount = 0.
        ENDIF.

        IF lv_amount_ant LE 0.
          lv_amount_ant = 0.
        ENDIF.

        IF lv_amount_b LE 0.
          lv_amount_b = 0.
        ENDIF.

        IF lv_amount_mldr LE 0.
          lv_amount_mldr = 0.
        ENDIF.

        IF lv_amount_mldr_ant LE 0.
          lv_amount_mldr_ant = 0.
        ENDIF.

        IF lv_amount_mldr_b LE 0.
          lv_amount_mldr_b = 0.
        ENDIF.

        ls_comp_b-wrbtr   = lv_amount_b.
        ls_comp_b-dmbtr   = lv_amount_mldr_b.
        MODIFY lt_comp_b  FROM ls_comp_b.
      ENDIF.
    ENDLOOP.
    ls_comp_n1-amount = lv_amount.
    ls_comp_n1-wrbtr  = lv_amount_ant.

    ls_comp_n1-amount_mldr = lv_amount_mldr.
    ls_comp_n1-dmbtr       = lv_amount_mldr_ant.
    MODIFY lt_comp_n1 FROM ls_comp_n1.
  ENDLOOP.

  LOOP AT lt_comp_n1 INTO ls_comp_n1.
    IF ls_comp_n1-amount EQ 0.
      DELETE lt_comp_n1.
    ENDIF.
  ENDLOOP.

  LOOP AT lt_comp INTO ls_comp.

    CLEAR: lv_rebzg, lv_rebzj, lv_doc, lv_year, lv_item, ls_crp_journal_doc_rel, ls_bkpf_rel, lt_with_item[], ls_with_item.

    READ TABLE lt_comp_n1 INTO ls_comp_n1 WITH KEY bukrs = ls_comp-bukrs
                                                   belnr = ls_comp-belnr
                                                   gjahr = ls_comp-gjahr
                                                   buzei = ls_comp-buzei.
    IF sy-subrc EQ 0.
**     Se busca Ref de factura.
*      SELECT SINGLE rebzg rebzj rebzz FROM bseg INTO (lv_rebzg, lv_rebzj, lv_rebzz)
*                         WHERE bukrs = ls_comp-bukrs
*                           AND belnr = ls_comp-belnr
*                           AND gjahr = ls_comp-gjahr
*                           AND buzei = ls_comp-buzei.
      zcl_qry_zfiglmx_journal_detail=>detail_bseg2( EXPORTING i_operacion = 'READ' ls_comp = ls_comp IMPORTING lv_rebzg = lv_rebzg
      lv_rebzj = lv_rebzj lv_rebzz = lv_rebzz ).
      CLEAR ls_stxh.

      IF lv_rebzg IS INITIAL.
        lv_doc  = ls_comp-belnr.
        lv_year = ls_comp-gjahr.
        lv_item = ls_comp-buzei.
      ELSE.
        lv_doc  = lv_rebzg.
        lv_year = lv_rebzj.
        lv_item = lv_rebzz.
      ENDIF.

      ls_crp_journal_doc_rel-amount = ls_comp_n1-amount.

      LOOP AT lt_comp_b INTO ls_comp_b.
*             Se busca Ref de factura.
        CLEAR: lv_rebzg, lv_rebzj.
*        SELECT SINGLE rebzg rebzj FROM bseg INTO (lv_rebzg, lv_rebzj)
*                           WHERE bukrs = ls_comp_b-bukrs
*                             AND belnr = ls_comp_b-belnr
*                             AND gjahr = ls_comp_b-gjahr
*                             AND buzei = ls_comp_b-buzei.
        zcl_qry_zfiglmx_journal_detail=>detail_bseg2( EXPORTING i_operacion = 'READ' ls_comp = ls_comp IMPORTING lv_rebzg = lv_rebzg
        lv_rebzj = lv_rebzj lv_rebzz = lv_rebzz_dummy ).
        IF lv_rebzg EQ lv_doc.
          ls_crp_journal_doc_rel-amount = ls_crp_journal_doc_rel-amount - ls_comp_b-wrbtr.
        ENDIF.
      ENDLOOP.

      ls_crp_journal_doc_rel-amount_ant = ls_comp_n1-wrbtr.

*  Se buscan retenciones
*      SELECT * INTO TABLE lt_with_item
*               FROM with_item
*              WHERE bukrs EQ i_company
*                AND belnr EQ lv_doc
*                AND gjahr EQ lv_year.
      zcl_qry_zfiglmx_journal_detail=>detail_with_item( EXPORTING i_operacion = 'READ' lv_bukrs = i_company lv_belnr = lv_doc
          lv_gjahr = lv_year IMPORTING lt_with = lt_with_item ).
** las retenciones como estan gurdadas como negativo se restan al total
      LOOP AT lt_with_item INTO ls_with_item.
        IF i_tipo EQ 'K'.
          ls_crp_journal_doc_rel-amount     = ls_crp_journal_doc_rel-amount + ls_with_item-wt_qbshb.
          ls_crp_journal_doc_rel-amount_ant = ls_crp_journal_doc_rel-amount_ant + ls_with_item-wt_qbshb.
        ENDIF.
        IF i_tipo EQ 'D'.
          ls_crp_journal_doc_rel-amount     = ls_crp_journal_doc_rel-amount - ls_with_item-wt_qbshb.
          ls_crp_journal_doc_rel-amount_ant = ls_crp_journal_doc_rel-amount_ant - ls_with_item-wt_qbshb.
        ENDIF.
      ENDLOOP.
*
*      SELECT SINGLE * INTO ls_bkpf_rel
*                      FROM bkpf
*                     WHERE bukrs EQ i_company
*                       AND belnr EQ lv_doc
*                       AND gjahr EQ lv_year.
      zcl_qry_zfiglmx_journal_detail=>detail_bkpf( EXPORTING i_operacion = 'READ' i_company = i_company i_doc_number = lv_doc
        i_year = lv_year IMPORTING ls_bkpf = ls_bkpf_rel ).
      ls_crp_journal_doc_rel-company        = ls_bkpf_rel-bukrs.
      ls_crp_journal_doc_rel-doc_number     = ls_bkpf_rel-belnr.
      ls_crp_journal_doc_rel-year           = ls_bkpf_rel-gjahr.
      ls_crp_journal_doc_rel-folio          = ls_bkpf_rel-xblnr.
      ls_crp_journal_doc_rel-currency       = ls_bkpf_rel-waers. " Currency
      ls_crp_journal_doc_rel-exchange_rate  = abs( ls_bkpf-kursf ).    " Exchange Rate
      ls_crp_journal_doc_rel-amount_ins    = abs( ls_comp_n1-diffw ).

*   Calculo de pagos parciales
      CLEAR: lt_comp_pp[], lv_num_parc.
*      SELECT * INTO TABLE lt_comp_pp
*             FROM bse_clr
*            WHERE bukrs EQ ls_bkpf_rel-bukrs
*              AND belnr EQ ls_bkpf_rel-belnr
*              AND gjahr EQ ls_bkpf_rel-gjahr
*              AND buzei EQ lv_item.
      zcl_qry_zfiglmx_journal_detail=>detail_bse_clr2( EXPORTING i_operacion = 'READ' lv_bukrs = ls_bkpf_rel-bukrs lv_belnr = ls_bkpf_rel-belnr
      lv_gjahr = ls_bkpf_rel-gjahr lv_buzei = lv_item IMPORTING lt_bse_clr = lt_comp_pp ).
      LOOP AT lt_comp_pp INTO ls_comp_pp.
*        SELECT SINGLE * INTO ls_bkpf_pp
*                       FROM bkpf
*                      WHERE bukrs EQ ls_comp_pp-bukrs_clr
*                        AND belnr EQ ls_comp_pp-belnr_clr
*                        AND gjahr EQ ls_comp_pp-gjahr_clr
*                        AND stblg EQ space                  "Este activo (No anulado)
*                        AND cpudt LE ls_bkpf-cpudt.          "Menor a Fecha registro Doc. pago
        zcl_qry_zfiglmx_journal_detail=>detail_bkpf3( EXPORTING i_operacion = 'READ' i_company = ls_comp_pp-bukrs_clr i_doc_number = ls_comp_pp-belnr_clr
          i_year = ls_comp_pp-gjahr_clr i_cpudt = ls_bkpf-cpudt IMPORTING ls_bkpf = ls_bkpf_pp ).
*        IF sy-subrc EQ 0.
        IF ls_bkpf_pp IS NOT INITIAL.
          IF ls_bkpf_pp-cpudt EQ ls_bkpf-cpudt.             "Valida que sean del mismo dia.
            IF ls_bkpf_pp-cputm LT ls_bkpf-cputm.           "Menor a Hora registro Doc. pago
              ls_crp_journal_doc_rel-amount_ant = ls_crp_journal_doc_rel-amount_ant - ( ls_comp_pp-wrbtr -  abs( ls_comp_pp-diffw ) ).
              ls_crp_journal_doc_rel-amount_ins = ls_crp_journal_doc_rel-amount_ins - ( ls_comp_pp-wrbtr -  abs( ls_comp_pp-diffw ) ).
              lv_num_parc = lv_num_parc + 1.
            ELSE.
*             borra los doc. cuando NO cumple con los criterios anteriores
              DELETE TABLE lt_comp_pp FROM ls_comp_pp.
            ENDIF.
          ELSE.
            ls_crp_journal_doc_rel-amount_ant = ls_crp_journal_doc_rel-amount_ant - ( ls_comp_pp-wrbtr -  abs( ls_comp_pp-diffw ) ).
            ls_crp_journal_doc_rel-amount_ins = ls_crp_journal_doc_rel-amount_ins - ( ls_comp_pp-wrbtr -  abs( ls_comp_pp-diffw ) ).
            lv_num_parc = lv_num_parc + 1.
          ENDIF.
        ELSE.
*         borra los doc. cuando NO cumple con los criterios anteriores
          DELETE TABLE lt_comp_pp FROM ls_comp_pp.
        ENDIF.
      ENDLOOP.

      IF ls_crp_journal_doc_rel-amount_ins LT 0.
        ls_crp_journal_doc_rel-amount_ins = 0.
      ENDIF.

      IF ls_crp_journal_doc_rel-amount_ant LT 0.
        ls_crp_journal_doc_rel-amount_ant = ls_crp_journal_doc_rel-amount.
      ENDIF.

      lv_num_parc = lv_num_parc + 1.
*      WRITE lv_num_parc TO ls_crp_journal_doc_rel-numparcialidad NO-ZERO.
      CONDENSE ls_crp_journal_doc_rel-numparcialidad NO-GAPS.

      IF  lv_moneda_banco EQ 'MXN' AND ls_crp_journal_doc_rel-currency NE 'MXN'.
        e_journal_detail-exchange_rate = 0.
        e_journal_detail-currency      = lv_moneda_banco.   "Moneda cuanta bancaria
        e_journal_detail-amount        = lv_amount_ml.      "Importe Moneda local.
      ENDIF.

      IF e_journal_detail-currency EQ 'USD' AND ls_crp_journal_doc_rel-currency EQ 'MXN'.
        ls_crp_journal_doc_rel-exchange_rate    = 1.
        ls_crp_journal_doc_rel-amount           = ls_comp_n1-dmbtr.
        ls_crp_journal_doc_rel-amount_ant       = ls_comp_n1-dmbtr.
        ls_crp_journal_doc_rel-amount_ins       = 0.
      ENDIF.

      IF e_journal_detail-currency EQ ls_crp_journal_doc_rel-currency.
        ls_crp_journal_doc_rel-exchange_rate    = 1.
      ENDIF.

      IF i_tipo EQ 'D'.
        CLEAR: lv_ZUONR_d, lv_vbeln, lv_fecha, ls_vbrk, ls_edocument, ls_EDOMXINVOICE.
*        SELECT SINGLE zuonr vbeln INTO (lv_ZUONR_d, lv_vbeln)
*                            FROM bseg
*                           WHERE bukrs EQ ls_bkpf_rel-bukrs
*                             AND belnr EQ ls_bkpf_rel-belnr
*                             AND gjahr EQ ls_bkpf_rel-gjahr
*                             AND buzei EQ lv_item.
        zcl_qry_zfiglmx_journal_detail=>detail_bseg3( EXPORTING i_operacion = 'READ' ls_bkpf = ls_bkpf_rel lv_item = lv_item
        IMPORTING lv_zuonr = lv_zuonr_d lv_vbeln = lv_vbeln ).
*        SELECT SINGLE * INTO ls_vbrk
*                        FROM vbrk
*                       WHERE vbeln EQ   lv_vbeln.
        zcl_qry_zfiglmx_journal_detail=>detail_vbrk( EXPORTING i_operacion = 'READ' lv_vbeln = lv_vbeln IMPORTING ls_vbrk = ls_vbrk ).
*        IF sy-subrc EQ 0.
        IF ls_vbrk IS NOT INITIAL.
*  Se buca el UUID de la tabla EDOMXINVOICE
*          SELECT SINGLE * INTO ls_edocument
*                   FROM edocument
*                  WHERE source_type EQ 'SD_INVOICE'
*                    AND source_key EQ lv_vbeln.
          zcl_qry_zfiglmx_journal_detail=>detail_edocument( EXPORTING i_operacion = 'READ' lv_vbeln = lv_vbeln IMPORTING ls_edocumen = ls_edocument ).
*          IF sy-subrc EQ 0.
          IF ls_edocument IS NOT INITIAL.
*            SELECT SINGLE * INTO ls_EDOMXINVOICE
*                  FROM edomxinvoice
*                 WHERE edoc_guid EQ ls_edocument-edoc_guid.
            zcl_qry_zfiglmx_journal_detail=>detail_edomxinvoice( EXPORTING i_operacion = 'READ' lv_edoc_guid = ls_edocument-edoc_guid
            IMPORTING ls_edomxinv = ls_edomxinvoice ).
            IF sy-subrc EQ 0.
              ls_crp_journal_doc_rel-uuid = ls_EDOMXINVOICE-uuid.
            ENDIF.
          ENDIF.

*  Se busca el Metodo de Pago
          CLEAR ls_/AIF/T_MVMApval.
*          SELECT SINGLE * INTO ls_/AIF/T_MVMApval
*                 FROM /AIF/T_MVMApval
*                WHERE ns EQ '/EDOMX'
*                  AND vmapname EQ 'CFDI_PAYMETHOD'
*                  AND int_value EQ ls_vbrk-zterm.
          zcl_qry_zfiglmx_journal_detail=>detail_/aif/t_mvmapval2( EXPORTING i_operacion = 'READ' lv_int_value = ls_vbrk-zterm
          IMPORTING ls_/aif/t_mvmapval = ls_/aif/t_mvmapval ).
          IF sy-subrc EQ 0.
            ls_crp_journal_doc_rel-pymt_meth = ls_/AIF/T_MVMApval-ext_value.
          ENDIF.
*
**  Se busca el Forma de pago
          CLEAR ls_/AIF/T_MVMApval.
*          SELECT SINGLE * INTO ls_/AIF/T_MVMApval
*                 FROM /AIF/T_MVMApval
*                WHERE ns EQ '/EDOMX'
*                  AND vmapname EQ 'CFDI_PAYMNT_MEANS'
*                  AND int_value EQ ls_vbrk-zlsch.
          zcl_qry_zfiglmx_journal_detail=>detail_/aif/t_mvmapval3( EXPORTING i_operacion = 'READ' lv_int_value = ls_vbrk-zlsch
          IMPORTING ls_/aif/t_mvmapval = ls_/aif/t_mvmapval ).
          IF sy-subrc EQ 0.
            ls_crp_journal_doc_rel-pymt_form = ls_/AIF/T_MVMApval-ext_value.
          ENDIF.
        ENDIF.
*
        IF ls_crp_journal_doc_rel-uuid IS INITIAL AND ls_bkpf_rel-gjahr < '2025'.
          CONCATENATE '%' ls_bkpf_rel-gjahr INTO lv_fecha.
          CONDENSE lv_fecha NO-GAPS.
          lv_vbeln = lv_ZUONR_d.
*          SELECT SINGLE * INTO ls_ytasd_fact_uuid
*                          FROM ytasd_fact_uuid
*                         WHERE vbeln EQ   lv_vbeln
*                           AND bukrs EQ   ls_bkpf_rel-bukrs
*                           AND fecha LIKE lv_fecha.
          zcl_qry_zfiglmx_journal_detail=>detail_ytasd_fact_uuid( EXPORTING i_operacion = 'READ' lv_bukrs = ls_bkpf_rel-bukrs
          lv_fecha = lv_fecha lv_vbeln = lv_vbeln IMPORTING ls_fac_uuid = ls_ytasd_fact_uuid ).
*          IF sy-subrc EQ 0.
          IF ls_ytasd_fact_uuid IS INITIAL.
            ls_crp_journal_doc_rel-uuid      = ls_ytasd_fact_uuid-uuid_fac.
            ls_crp_journal_doc_rel-pymt_form = ls_ytasd_fact_uuid-zpago.
            ls_crp_journal_doc_rel-pymt_meth = ls_ytasd_fact_uuid-metpago.
          ELSE.
*            SELECT SINGLE * INTO ls_yvalida_fi
*                            FROM yvalida_fi
*                               WHERE bukrs EQ ls_bkpf_rel-bukrs
*                                 AND belnr EQ ls_bkpf_rel-belnr
*                                 AND gjahr EQ ls_bkpf_rel-gjahr.
            zcl_qry_zfiglmx_journal_detail=>detail_yvalida_fi( EXPORTING i_operacion = 'READ' lv_bukrs = ls_bkpf_rel-bukrs
            lv_belnr = ls_bkpf_rel-belnr lv_gjahr = ls_bkpf_rel-gjahr IMPORTING ls_yvalida = ls_yvalida_fi ).
            IF ls_yvalida_fi IS NOT INITIAL.
*    IF sy-subrc EQ 0.
              ls_crp_journal_doc_rel-uuid      = ls_yvalida_fi-zuuid.
              ls_crp_journal_doc_rel-pymt_form = ls_yvalida_fi-zpago.
              ls_crp_journal_doc_rel-pymt_meth = ls_yvalida_fi-zmpag.
            ENDIF.
          ENDIF.
        ENDIF.
*
      ELSE.
        CLEAR lv_tdline.
        PERFORM read_text USING   'ZUUI'      "Sello de Pago
                                  ls_bkpf_rel
                         CHANGING lv_tdline.
*        MOVE lv_tdline TO ls_crp_journal_doc_rel-uuid.
        ls_crp_journal_doc_rel-uuid = lv_tdline.

        CLEAR lv_tdline.
        PERFORM read_text USING   'ZFOP'      "Forma de Pago
                                  ls_bkpf_rel
                         CHANGING lv_tdline.
*        MOVE lv_tdline TO ls_crp_journal_doc_rel-pymt_form.
        ls_crp_journal_doc_rel-pymt_form = lv_tdline.

        CLEAR lv_tdline.
        PERFORM read_text USING   'ZMEP'      "metodo de Pago
                                  ls_bkpf_rel
                         CHANGING lv_tdline.
*        MOVE lv_tdline TO ls_crp_journal_doc_rel-pymt_meth.
        ls_crp_journal_doc_rel-pymt_meth = lv_tdline.
      ENDIF.

      READ TABLE lt_journal_doc_rel INTO ls_journal_doc_rel
              WITH KEY uuid = ls_crp_journal_doc_rel-uuid.
      IF sy-subrc EQ 0 AND ls_crp_journal_doc_rel-uuid IS NOT INITIAL.
        ls_journal_doc_rel-amount     = ls_journal_doc_rel-amount + ls_crp_journal_doc_rel-amount.
        ls_journal_doc_rel-amount_ant = ls_journal_doc_rel-amount_ant + ls_crp_journal_doc_rel-amount_ant.
        ls_journal_doc_rel-amount_ins = ls_journal_doc_rel-amount_ins + ls_crp_journal_doc_rel-amount_ins.
        MODIFY TABLE lt_journal_doc_rel FROM ls_journal_doc_rel.
      ELSE.
        APPEND ls_crp_journal_doc_rel TO lt_journal_doc_rel.
      ENDIF.

*     Cambios 2.0

      CLEAR: lv_tipocambio, lt_with_item[], lt_bseg_rel, lv_total_fact.

      IF e_journal_detail-currency NE 'MXN' AND ls_crp_journal_doc_rel-currency NE 'MXN'.
        lv_tipocambio = e_journal_detail-exchange_rate.
      ELSE.
        lv_tipocambio = ls_crp_journal_doc_rel-exchange_rate.
      ENDIF.

*      SELECT SINGLE wrbtr FROM bseg INTO (lv_total_fact)
*                         WHERE bukrs = i_company
*                           AND belnr = lv_doc
*                           AND gjahr = lv_year
*                           AND buzei = lv_item.
      zcl_qry_zfiglmx_journal_detail=>detail_bseg4( EXPORTING i_operacion = 'READ' i_company = i_company i_doc_number = lv_doc
      i_year = lv_year i_item = lv_item IMPORTING lv_total = lv_total_fact ).

**     se buscan retenciones
*      SELECT * INTO TABLE lt_with_item
*                FROM with_item
*               WHERE bukrs EQ ls_bkpf_rel-bukrs
*                 AND belnr EQ ls_bkpf_rel-belnr
*                 AND gjahr EQ ls_bkpf_rel-gjahr.
      zcl_qry_zfiglmx_journal_detail=>detail_with_item( EXPORTING i_operacion = 'READ' lv_bukrs = ls_bkpf_rel-bukrs lv_belnr = ls_bkpf_rel-belnr
      lv_gjahr = ls_bkpf_rel-gjahr IMPORTING lt_with = lt_with_item ).

* las retenciones como estan gurdadas como negativo se restan al total
      LOOP AT lt_with_item INTO ls_with_item.
        IF i_tipo EQ 'K'.
          lv_total_fact     = lv_total_fact + ls_with_item-wt_qbshb.
        ENDIF.
        IF i_tipo EQ 'D'.
          lv_total_fact     = lv_total_fact - ls_with_item-wt_qbshb.
        ENDIF.
      ENDLOOP.
*
*      SELECT bukrs belnr gjahr buzei koart shkzg mwskz dmbtr wrbtr sgtxt hkont
*             kunnr lifnr empfb fwbas qsskz
*            FROM bseg INTO TABLE lt_bseg_rel
*                           WHERE bukrs = ls_bkpf_rel-bukrs
*                             AND belnr = ls_bkpf_rel-belnr
*                             AND gjahr = ls_bkpf_rel-gjahr
*                             AND hkont IN lr_range_racct.
      zcl_qry_zfiglmx_journal_detail=>detail_bseg5( EXPORTING i_operacion = 'READ' ls_bkpf = ls_bkpf_rel lt_racct = lr_range_racct
      IMPORTING lt_bseg = lt_bseg_rel ).
      LOOP AT lt_bseg_rel INTO ls_bseg_rel.
        CLEAR: ls_doc_rel_imp,ls_rel_imp, lv_por_pago, lv_tasa, ls_cuentas_imp.
        READ TABLE lt_cuentas_imp INTO ls_cuentas_imp WITH KEY cuenta      = ls_bseg_rel-hkont
                                                               ind_iva_sap = ls_bseg_rel-mwskz.
        IF sy-subrc EQ 0.
          IF ls_bseg_rel-fwbas IS NOT INITIAL.
            lv_imp_base = ls_bseg_rel-fwbas.
          ENDIF.
        ELSE.
        ENDIF.

        IF  ls_cuentas_imp IS NOT INITIAL.
          lv_por_pago = ( ls_crp_journal_doc_rel-amount / lv_total_fact ) * 100.
          lv_tasa = ls_cuentas_imp-tasa / 100.
          ls_doc_rel_imp-importedr    =  ls_bseg_rel-wrbtr * ( lv_por_pago / 100 ).
          IF lv_imp_base IS NOT INITIAL.
            lv_imp_base = lv_imp_base * ( lv_por_pago / 100 ).
          ELSE.
            IF lv_tasa = 0.
              lv_imp_base = ls_doc_rel_imp-importedr.
            ELSE.
              lv_imp_base = ls_doc_rel_imp-importedr / lv_tasa.
            ENDIF.
          ENDIF.
          ls_doc_rel_imp-basedr       =  lv_imp_base.
          ls_doc_rel_imp-tasaocuotadr =  lv_tasa.
          ls_doc_rel_imp-impuestodr   =  ls_cuentas_imp-tax_code.
          ls_doc_rel_imp-tipofactordr =  ls_cuentas_imp-factor_type.
          ls_doc_rel_imp-uuid         =  ls_crp_journal_doc_rel-uuid.
          IF lv_tasa = 0.
            ls_doc_rel_imp-importedr = 0.
          ENDIF.

          CASE ls_cuentas_imp-clastasa.
*  Impuestos Trasladados
            WHEN 'IVA16'.
              e_journal_detail-tbaseiva16     = e_journal_detail-tbaseiva16 + ( ls_doc_rel_imp-basedr * lv_tipocambio ).
              e_journal_detail-timpuestoiva16 = e_journal_detail-timpuestoiva16 + ( ls_doc_rel_imp-importedr * lv_tipocambio ).
              ls_doc_rel_imp-tipoimpuesto = 'T'.
            WHEN 'IVA8'.
              e_journal_detail-tbaseiva8      = e_journal_detail-tbaseiva8 + ( ls_doc_rel_imp-basedr  * lv_tipocambio ).
              e_journal_detail-timpuestoiva8  = e_journal_detail-timpuestoiva8 + ( ls_doc_rel_imp-importedr  * lv_tipocambio ).
              ls_doc_rel_imp-tipoimpuesto = 'T'.
            WHEN 'IVA0'.
              e_journal_detail-tbaseiva0      = e_journal_detail-tbaseiva0     + ( ls_doc_rel_imp-basedr * lv_tipocambio ).
              e_journal_detail-timpuestoiva0  = e_journal_detail-timpuestoiva0 + ( ls_doc_rel_imp-importedr * lv_tipocambio ).
              ls_doc_rel_imp-tipoimpuesto = 'T'.
            WHEN 'EXENTO'.
              e_journal_detail-tbaseivaexento = e_journal_detail-tbaseivaexento + ( ls_doc_rel_imp-basedr * lv_tipocambio ).
              ls_doc_rel_imp-tipoimpuesto = 'T'.
            WHEN 'RETIVA'.
* Impuestos Retenidos
              e_journal_detail-tretiva =  e_journal_detail-tretiva + ( ls_doc_rel_imp-importedr * lv_tipocambio ).
              ls_doc_rel_imp-tipoimpuesto = 'R'.
            WHEN 'RETISR'.
              e_journal_detail-tretisr =  e_journal_detail-tretisr + ( ls_doc_rel_imp-importedr * lv_tipocambio ).
              ls_doc_rel_imp-tipoimpuesto = 'R'.
            WHEN 'RETIEPS'.
              e_journal_detail-tretieps =  e_journal_detail-tretieps + ( ls_doc_rel_imp-importedr * lv_tipocambio ).
              ls_doc_rel_imp-tipoimpuesto = 'R'.
          ENDCASE.

          READ TABLE lt_rel_imp INTO ls_rel_imp WITH KEY uuid = ls_doc_rel_imp-uuid
                                                         impuestodr = ls_doc_rel_imp-impuestodr
                                                         tipofactordr = ls_doc_rel_imp-tipofactordr
                                                         tasaocuotadr = ls_doc_rel_imp-tasaocuotadr
                                                         tipoimpuesto = ls_doc_rel_imp-tipoimpuesto.
          IF sy-subrc EQ 0.
            ls_rel_imp-basedr    = ls_rel_imp-basedr + ls_doc_rel_imp-basedr.
            ls_rel_imp-importedr = ls_rel_imp-importedr + ls_doc_rel_imp-importedr.
            MODIFY TABLE lt_rel_imp FROM ls_rel_imp.
          ELSE.
            APPEND ls_doc_rel_imp TO lt_rel_imp.
          ENDIF.
        ENDIF.
      ENDLOOP.

* Añade Retenciones
      LOOP AT lt_with_item INTO ls_with_item.
        CLEAR: ls_doc_rel_imp,ls_rel_imp, lv_por_pago, lv_tasa, ls_cuentas_imp.
        READ TABLE lt_cuentas_imp INTO ls_cuentas_imp
                          WITH KEY witht     = ls_with_item-witht
                                   wt_withcd = ls_with_item-wt_withcd.
        IF sy-subrc EQ 0 AND ls_with_item-wt_qbshb IS NOT INITIAL AND ls_with_item-wt_qsshb IS NOT INITIAL.
          ls_with_item-wt_qbshb = abs( ls_with_item-wt_qbshb ).
          ls_with_item-wt_qsshb = abs( ls_with_item-wt_qsshb ).
          lv_por_pago = ( ls_crp_journal_doc_rel-amount / lv_total_fact ) * 100.
          lv_tasa = ls_cuentas_imp-tasa / 100.
          ls_doc_rel_imp-importedr    =  ls_with_item-wt_qbshb * ( lv_por_pago / 100 ).
          lv_imp_base = ls_with_item-wt_qsshb * ( lv_por_pago / 100 ).
          ls_doc_rel_imp-basedr       =  lv_imp_base.
          ls_doc_rel_imp-tasaocuotadr =  lv_tasa.
          ls_doc_rel_imp-impuestodr   =  ls_cuentas_imp-tax_code.
          ls_doc_rel_imp-tipofactordr =  ls_cuentas_imp-factor_type.
          ls_doc_rel_imp-uuid         =  ls_crp_journal_doc_rel-uuid.

          CASE ls_cuentas_imp-clastasa.
            WHEN 'RETIVA'.
* Impuestos Retenidos
              e_journal_detail-tretiva =  e_journal_detail-tretiva + ( ls_doc_rel_imp-importedr * lv_tipocambio ).
              ls_doc_rel_imp-tipoimpuesto = 'R'.
            WHEN 'RETISR'.
              e_journal_detail-tretisr =  e_journal_detail-tretisr + ( ls_doc_rel_imp-importedr * lv_tipocambio ).
              ls_doc_rel_imp-tipoimpuesto = 'R'.
            WHEN 'RETIEPS'.
              e_journal_detail-tretieps =  e_journal_detail-tretieps + ( ls_doc_rel_imp-importedr * lv_tipocambio ).
              ls_doc_rel_imp-tipoimpuesto = 'R'.
          ENDCASE.

          READ TABLE lt_rel_imp INTO ls_rel_imp WITH KEY uuid = ls_doc_rel_imp-uuid
                                                         impuestodr = ls_doc_rel_imp-impuestodr
                                                         tipofactordr = ls_doc_rel_imp-tipofactordr
                                                         tasaocuotadr = ls_doc_rel_imp-tasaocuotadr
                                                         tipoimpuesto = ls_doc_rel_imp-tipoimpuesto.
          IF sy-subrc EQ 0.
            ls_rel_imp-basedr    = ls_rel_imp-basedr + ls_doc_rel_imp-basedr.
            ls_rel_imp-importedr = ls_rel_imp-importedr + ls_doc_rel_imp-importedr.
            MODIFY TABLE lt_rel_imp FROM ls_rel_imp.
          ELSE.
            APPEND ls_doc_rel_imp TO lt_rel_imp.
          ENDIF.
        ENDIF.
      ENDLOOP.
    ENDIF.
  ENDLOOP.

  t_journal_doc_rel[] = lt_journal_doc_rel[].

  IF e_journal_detail-vendor_type = 'AGENTE'.
    CLEAR:  ls_crp_journal_doc_rel, t_journal_doc_rel[], lt_journal_doc_rel[].

    ls_crp_journal_doc_rel-company        = ls_bkpf-bukrs.
    ls_crp_journal_doc_rel-doc_number     = ls_bkpf-belnr.
    ls_crp_journal_doc_rel-year           = ls_bkpf-gjahr.
    ls_crp_journal_doc_rel-folio          = ls_bkpf-xblnr.
    ls_crp_journal_doc_rel-currency       = ls_bkpf-waers. " Currency
    ls_crp_journal_doc_rel-exchange_rate  = abs( ls_bkpf-kursf ).    " Exchange Rate
    ls_crp_journal_doc_rel-amount         = ls_bseg_temp-wrbtr.
    ls_crp_journal_doc_rel-amount_ant     = ls_bseg_temp-wrbtr.
    ls_crp_journal_doc_rel-amount_ins     = 0.
    ls_crp_journal_doc_rel-numparcialidad = 1.

    CLEAR lv_tdline.
    PERFORM read_text USING   'ZUUI'      "Sello de Pago
                              ls_bkpf
                     CHANGING lv_tdline.
    ls_crp_journal_doc_rel-uuid = lv_tdline.
*    MOVE lv_tdline TO ls_crp_journal_doc_rel-uuid.

    CLEAR lv_tdline.
    PERFORM read_text USING   'ZFOP'      "Forma de Pago
                              ls_bkpf
                     CHANGING lv_tdline.
    ls_crp_journal_doc_rel-pymt_form = lv_tdline.
*    MOVE lv_tdline TO ls_crp_journal_doc_rel-pymt_form.

    CLEAR lv_tdline.
    PERFORM read_text USING   'ZMEP'      "metodo de Pago
                              ls_bkpf
                     CHANGING lv_tdline.
    ls_crp_journal_doc_rel-pymt_meth = lv_tdline.
*    MOVE lv_tdline TO ls_crp_journal_doc_rel-pymt_meth.
    APPEND ls_crp_journal_doc_rel TO  t_journal_doc_rel.

    CLEAR: lv_tipocambio, lt_with_item[], lt_bseg_rel, lv_total_fact.

    IF e_journal_detail-currency NE 'MXN' AND ls_crp_journal_doc_rel-currency NE 'MXN'.
      lv_tipocambio = e_journal_detail-exchange_rate.
    ELSE.
      lv_tipocambio = ls_crp_journal_doc_rel-exchange_rate.
    ENDIF.
*
*    SELECT SINGLE wrbtr FROM bseg INTO (lv_total_fact)
*                       WHERE bukrs = ls_bkpf-bukrs
*                         AND belnr = ls_bkpf-belnr
*                         AND gjahr = ls_bkpf-gjahr
*                         AND koart = 'K'.
    zcl_qry_zfiglmx_journal_detail=>detail_bseg6( EXPORTING i_operacion = 'READ' i_company = ls_bkpf-bukrs i_doc_number = ls_bkpf-belnr
    i_year = ls_bkpf-gjahr IMPORTING lv_total = lv_total_fact ).
*     se buscan retenciones
*    SELECT * INTO TABLE lt_with_item
*              FROM with_item
*             WHERE bukrs EQ ls_bkpf-bukrs
*               AND belnr EQ ls_bkpf-belnr
*               AND gjahr EQ ls_bkpf-belnr.
    zcl_qry_zfiglmx_journal_detail=>detail_with_item( EXPORTING i_operacion = 'READ' lv_bukrs = ls_bkpf-bukrs lv_belnr = ls_bkpf-belnr
    lv_gjahr = ls_bkpf-gjahr IMPORTING lt_with = lt_with_item ).

* las retenciones como estan gurdadas como negativo se restan al total
    LOOP AT lt_with_item INTO ls_with_item.
      IF i_tipo EQ 'K'.
        lv_total_fact     = lv_total_fact + ls_with_item-wt_qbshb.
      ENDIF.
      IF i_tipo EQ 'D'.
        lv_total_fact     = lv_total_fact - ls_with_item-wt_qbshb.
      ENDIF.
    ENDLOOP.
*
*    SELECT bukrs belnr gjahr buzei koart shkzg mwskz dmbtr wrbtr sgtxt hkont
*           kunnr lifnr empfb fwbas qsskz
*          FROM bseg INTO TABLE lt_bseg_rel
*                         WHERE bukrs = ls_bkpf-bukrs
*                           AND belnr = ls_bkpf-belnr
*                           AND gjahr = ls_bkpf-gjahr
*                           AND hkont IN lr_range_racct.
    zcl_qry_zfiglmx_journal_detail=>detail_bseg5( EXPORTING i_operacion = 'READ' ls_bkpf = ls_bkpf lt_racct = lr_range_racct
          IMPORTING lt_bseg = lt_bseg_rel ).
    LOOP AT lt_bseg_rel INTO ls_bseg_rel.

      CLEAR: ls_doc_rel_imp,ls_rel_imp, lv_por_pago, lv_tasa, ls_cuentas_imp.
      READ TABLE lt_cuentas_imp INTO ls_cuentas_imp WITH KEY cuenta      = ls_bseg_rel-hkont
                                                             ind_iva_sap = ls_bseg_rel-mwskz.
      IF sy-subrc EQ 0.
        IF ls_bseg_rel-fwbas IS NOT INITIAL.
          lv_imp_base = ls_bseg_rel-fwbas.
        ENDIF.
      ELSE.
      ENDIF.

      IF  ls_cuentas_imp IS NOT INITIAL.
        lv_por_pago = ( ls_crp_journal_doc_rel-amount / lv_total_fact ) * 100.
        lv_tasa = ls_cuentas_imp-tasa / 100.
        ls_doc_rel_imp-importedr    =  ls_bseg_rel-wrbtr * ( lv_por_pago / 100 ).
        IF lv_imp_base IS NOT INITIAL.
          lv_imp_base = lv_imp_base * ( lv_por_pago / 100 ).
        ELSE.
          IF lv_tasa = 0.
            lv_imp_base = ls_doc_rel_imp-importedr.
          ELSE.
            lv_imp_base = ls_doc_rel_imp-importedr / lv_tasa.
          ENDIF.
        ENDIF.
        ls_doc_rel_imp-basedr       =  lv_imp_base.
        ls_doc_rel_imp-tasaocuotadr =  lv_tasa.
        ls_doc_rel_imp-impuestodr   =  ls_cuentas_imp-tax_code.
        ls_doc_rel_imp-tipofactordr =  ls_cuentas_imp-factor_type.
        ls_doc_rel_imp-uuid         =  ls_crp_journal_doc_rel-uuid.
        IF lv_tasa = 0.
          ls_doc_rel_imp-importedr = 0.
        ENDIF.

        CASE ls_cuentas_imp-clastasa.
*  Impuestos Trasladados
          WHEN 'IVA16'.
            e_journal_detail-tbaseiva16     = e_journal_detail-tbaseiva16 + ( ls_doc_rel_imp-basedr * lv_tipocambio ).
            e_journal_detail-timpuestoiva16 = e_journal_detail-timpuestoiva16 + ( ls_doc_rel_imp-importedr * lv_tipocambio ).
            ls_doc_rel_imp-tipoimpuesto = 'T'.
          WHEN 'IVA8'.
            e_journal_detail-tbaseiva8      = e_journal_detail-tbaseiva8 + ( ls_doc_rel_imp-basedr  * lv_tipocambio ).
            e_journal_detail-timpuestoiva8  = e_journal_detail-timpuestoiva8 + ( ls_doc_rel_imp-importedr  * lv_tipocambio ).
            ls_doc_rel_imp-tipoimpuesto = 'T'.
          WHEN 'IVA0'.
            e_journal_detail-tbaseiva0      = e_journal_detail-tbaseiva0     + ( ls_doc_rel_imp-basedr * lv_tipocambio ).
            e_journal_detail-timpuestoiva0  = e_journal_detail-timpuestoiva0 + ( ls_doc_rel_imp-importedr * lv_tipocambio ).
            ls_doc_rel_imp-tipoimpuesto = 'T'.
          WHEN 'EXENTO'.
            e_journal_detail-tbaseivaexento = e_journal_detail-tbaseivaexento + ( ls_doc_rel_imp-basedr * lv_tipocambio ).
            ls_doc_rel_imp-tipoimpuesto = 'T'.
          WHEN 'RETIVA'.
* Impuestos Retenidos
            e_journal_detail-tretiva =  e_journal_detail-tretiva + ( ls_doc_rel_imp-importedr * lv_tipocambio ).
            ls_doc_rel_imp-tipoimpuesto = 'R'.
          WHEN 'RETISR'.
            e_journal_detail-tretisr =  e_journal_detail-tretisr + ( ls_doc_rel_imp-importedr * lv_tipocambio ).
            ls_doc_rel_imp-tipoimpuesto = 'R'.
          WHEN 'RETIEPS'.
            e_journal_detail-tretieps =  e_journal_detail-tretieps + ( ls_doc_rel_imp-importedr * lv_tipocambio ).
            ls_doc_rel_imp-tipoimpuesto = 'R'.
        ENDCASE.

* Se añadio tipoimpuesto  para separar cuano hay retenciones
        READ TABLE lt_rel_imp INTO ls_rel_imp WITH KEY uuid         = ls_doc_rel_imp-uuid
                                                       impuestodr   = ls_doc_rel_imp-impuestodr
                                                       tipofactordr = ls_doc_rel_imp-tipofactordr
                                                       tasaocuotadr = ls_doc_rel_imp-tasaocuotadr
                                                       tipoimpuesto = ls_doc_rel_imp-tipoimpuesto.
        IF sy-subrc EQ 0.
          ls_rel_imp-basedr    = ls_rel_imp-basedr + ls_doc_rel_imp-basedr.
          ls_rel_imp-importedr = ls_rel_imp-importedr + ls_doc_rel_imp-importedr.
          MODIFY TABLE lt_rel_imp FROM ls_rel_imp.
        ELSE.
          APPEND ls_doc_rel_imp TO lt_rel_imp.
        ENDIF.
      ENDIF.
    ENDLOOP.

*     Añade Retenciones
    LOOP AT lt_with_item INTO ls_with_item.
      CLEAR: ls_doc_rel_imp,ls_rel_imp, lv_por_pago, lv_tasa, ls_cuentas_imp.
      READ TABLE lt_cuentas_imp INTO ls_cuentas_imp
                        WITH KEY witht     = ls_with_item-witht
                                 wt_withcd = ls_with_item-wt_withcd.
      IF sy-subrc EQ 0 AND ls_with_item-wt_qbshb IS NOT INITIAL AND ls_with_item-wt_qsshb IS NOT INITIAL.
        ls_with_item-wt_qbshb = abs( ls_with_item-wt_qbshb ).
        ls_with_item-wt_qsshb = abs( ls_with_item-wt_qsshb ).
        lv_por_pago = ( ls_crp_journal_doc_rel-amount / lv_total_fact ) * 100.
        lv_tasa = ls_cuentas_imp-tasa / 100.
        ls_doc_rel_imp-importedr    =  ls_with_item-wt_qbshb * ( lv_por_pago / 100 ).
        lv_imp_base = ls_with_item-wt_qsshb * ( lv_por_pago / 100 ).
        ls_doc_rel_imp-basedr       =  lv_imp_base.
        ls_doc_rel_imp-tasaocuotadr =  lv_tasa.
        ls_doc_rel_imp-impuestodr   =  ls_cuentas_imp-tax_code.
        ls_doc_rel_imp-tipofactordr =  ls_cuentas_imp-factor_type.
        ls_doc_rel_imp-uuid         =  ls_crp_journal_doc_rel-uuid.

        CASE ls_cuentas_imp-clastasa.
          WHEN 'RETIVA'.
* Impuestos Retenidos
            e_journal_detail-tretiva =  e_journal_detail-tretiva + ( ls_doc_rel_imp-importedr * lv_tipocambio ).
            ls_doc_rel_imp-tipoimpuesto = 'R'.
          WHEN 'RETISR'.
            e_journal_detail-tretisr =  e_journal_detail-tretisr + ( ls_doc_rel_imp-importedr * lv_tipocambio ).
            ls_doc_rel_imp-tipoimpuesto = 'R'.
          WHEN 'RETIEPS'.
            e_journal_detail-tretieps =  e_journal_detail-tretieps + ( ls_doc_rel_imp-importedr * lv_tipocambio ).
            ls_doc_rel_imp-tipoimpuesto = 'R'.
        ENDCASE.

* Se añadio tipoimpuesto  para separar cuano hay retenciones
        READ TABLE lt_rel_imp INTO ls_rel_imp WITH KEY uuid         = ls_doc_rel_imp-uuid
                                                       impuestodr   = ls_doc_rel_imp-impuestodr
                                                       tipofactordr = ls_doc_rel_imp-tipofactordr
                                                       tasaocuotadr = ls_doc_rel_imp-tasaocuotadr
                                                       tipoimpuesto = ls_doc_rel_imp-tipoimpuesto.
        IF sy-subrc EQ 0.
          ls_rel_imp-basedr    = ls_rel_imp-basedr + ls_doc_rel_imp-basedr.
          ls_rel_imp-importedr = ls_rel_imp-importedr + ls_doc_rel_imp-importedr.
          MODIFY TABLE lt_rel_imp FROM ls_rel_imp.
        ELSE.
          APPEND ls_doc_rel_imp TO lt_rel_imp.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.

*     Se valida los importes de impuestos vs total factura
  IF i_tipo EQ 'D'.  "Solo Clientes

    READ TABLE lt_rel_imp INTO ls_rel_imp WITH KEY tipoimpuesto = 'R'.
*       Realiza el recalculo de impuestos si no hay retenciones
    IF sy-subrc NE 0.
      CLEAR: e_journal_detail-tbaseiva16, e_journal_detail-timpuestoiva16, e_journal_detail-tbaseiva8,
            e_journal_detail-timpuestoiva8, e_journal_detail-tbaseiva0, e_journal_detail-timpuestoiva0.
      LOOP AT t_journal_doc_rel INTO ls_crp_journal_doc_rel.
        LOOP AT lt_rel_imp INTO ls_rel_imp WHERE uuid         = ls_crp_journal_doc_rel-uuid
                                             AND tipoimpuesto = 'T'.

          CLEAR: lv_total_imp, lv_tasa.
          lv_total_imp = ls_rel_imp-basedr + ls_rel_imp-importedr.
          IF lv_total_imp <> ls_crp_journal_doc_rel-amount.
            lv_tasa = ls_rel_imp-tasaocuotadr + 1.
            ls_rel_imp-basedr    = ls_crp_journal_doc_rel-amount / lv_tasa.
            ls_rel_imp-importedr = ls_rel_imp-basedr * ls_rel_imp-tasaocuotadr.
            MODIFY TABLE lt_rel_imp FROM ls_rel_imp.
          ENDIF.
          IF ls_rel_imp-tasaocuotadr = '0.160000'.
            e_journal_detail-tbaseiva16     = e_journal_detail-tbaseiva16 + ( ls_rel_imp-basedr * lv_tipocambio ).
            e_journal_detail-timpuestoiva16 = e_journal_detail-timpuestoiva16 + ( ls_rel_imp-importedr * lv_tipocambio ).
          ELSEIF ls_rel_imp-tasaocuotadr = '0.080000'.
            e_journal_detail-tbaseiva8      = e_journal_detail-tbaseiva8 + ( ls_rel_imp-basedr  * lv_tipocambio ).
            e_journal_detail-timpuestoiva8  = e_journal_detail-timpuestoiva8 + ( ls_rel_imp-importedr  * lv_tipocambio ).
          ELSEIF ls_rel_imp-tasaocuotadr = '0.000000'.
            e_journal_detail-tbaseiva0      = e_journal_detail-tbaseiva0     + ( ls_rel_imp-basedr * lv_tipocambio ).
            e_journal_detail-timpuestoiva0  = e_journal_detail-timpuestoiva0 + ( ls_rel_imp-importedr * lv_tipocambio ).
          ENDIF.
        ENDLOOP.
      ENDLOOP.
    ENDIF.
  ENDIF.

  IF e_journal_detail-currency NE 'MXN'.
    e_journal_detail-montototalpagos = e_journal_detail-amount * e_journal_detail-exchange_rate.
  ELSE.
    e_journal_detail-montototalpagos = e_journal_detail-amount.
  ENDIF.

  t_journal_doc_rel_imp[] = lt_rel_imp[].
ENDFUNCTION.
