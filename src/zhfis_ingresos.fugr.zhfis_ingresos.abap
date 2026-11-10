FUNCTION zhfis_ingresos.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(I_COMPANY_CODE) TYPE  BUKRS
*"     VALUE(I_DATE_FROM) TYPE  BUDAT DEFAULT SY-DATUM
*"     VALUE(I_DATE_TO) TYPE  BUDAT DEFAULT SY-DATUM
*"     REFERENCE(I_ACCOUNT) TYPE  ZTTHFIS_RACCT
*"  EXPORTING
*"     REFERENCE(E_DOCSINGRESOS) TYPE  ZTTHFIS_DOCSINGRESOS
*"----------------------------------------------------------------------
  TYPES: BEGIN OF ty_bseg,
           bukrs TYPE bukrs,
           belnr TYPE belnr_d,
           gjahr TYPE gjahr,
           buzei TYPE buzei,
           hkont TYPE hkont,
           wrbtr TYPE wrbtr,
           dmbtr TYPE dmbtr,
           shkzg TYPE shkzg,
         END OF ty_bseg.

  DATA: lt_docsingresos TYPE TABLE OF zhfis_docsingresos,
        ls_docsingresos TYPE zhfis_docsingresos,
        lt_bkpf         TYPE TABLE OF zst_bkpf,
        ls_bkpf         TYPE zst_bkpf,
        lt_bseg         TYPE TABLE OF zst_bseg, "ty_bseg,
        ls_bseg         TYPE zst_bseg, "ty_bseg,
        lv_tdline       TYPE ztdline,
        ls_bkpf_anulado TYPE zst_bkpf,
        lt_t001         TYPE TABLE OF zes_t001,
        ls_t001         TYPE          zes_t001.

  DATA: ls_account     TYPE zracct,
        lr_range_racct TYPE zfagl_range_t_racct,
        ls_range_racct TYPE zfagl_range_racct,
        lv_index       TYPE sy-tabix.

  DATA: lv_anulado_vbeln TYPE zvbeln_vf.

*  SELECT * INTO TABLE lt_t001
*           FROM t001.
  zcl_qry_ingresos=>t001( EXPORTING i_operacion = 'READ'
                          IMPORTING et_t001 = lt_t001 ).

**  SELECT * INTO TABLE lt_ctasing
**           FROM zhfis_ctasing.

  LOOP AT i_account INTO ls_account.
    ls_range_racct-sign   = 'I'.
    ls_range_racct-option = 'EQ'.
    ls_range_racct-low    = ls_account.
    APPEND ls_range_racct TO lr_range_racct.
  ENDLOOP.

*  LOOP AT lt_ctasing INTO ls_ctasing.
*    MOVE: 'I'              TO  lr_hkont-sign,
*          'EQ'             TO  lr_hkont-option,
*          ls_ctasing-hkont TO  lr_hkont-low.
*    APPEND lr_hkont TO tr_hkont.
*  ENDLOOP.

  IF lr_range_racct[] IS NOT INITIAL.
*    SELECT * INTO TABLE lt_bkpf
*             FROM bkpf
*            WHERE bukrs  EQ i_company_code
*              AND budat  GE i_date_from
*              AND budat  LE i_date_to.
    zcl_qry_ingresos=>bkpf( EXPORTING i_operacion = 'READ'
                                      i_bukrs = i_company_code
                                      i_start = i_date_from
                                      i_end = i_date_to
                            IMPORTING et_bkpf = lt_bkpf ).
  ENDIF.

  SORT lt_bkpf BY bukrs belnr gjahr ASCENDING.

  IF lt_bkpf[] IS NOT INITIAL.
*    SELECT bukrs belnr gjahr buzei hkont wrbtr dmbtr shkzg INTO TABLE lt_bseg
*             FROM bseg
*           FOR ALL ENTRIES IN lt_bkpf
*          WHERE bukrs  EQ lt_bkpf-bukrs
*            AND belnr  EQ lt_bkpf-belnr
*            AND gjahr  EQ lt_bkpf-gjahr
**          AND hkont  IN tr_hkont.
*            AND hkont  IN lr_range_racct.
    zcl_qry_ingresos=>bseg( EXPORTING i_operacion = 'READ'
                                      it_bkpf = lt_bkpf
                                      it_account = i_account
                            IMPORTING et_bseg = lt_bseg ).
  ENDIF.


  SORT lt_bseg BY bukrs belnr gjahr buzei ASCENDING.
  LOOP AT lt_bkpf INTO ls_bkpf.
    READ TABLE lt_bseg INTO ls_bseg WITH KEY bukrs = ls_bkpf-bukrs
                                             belnr = ls_bkpf-belnr
                                             gjahr = ls_bkpf-gjahr
                                             BINARY SEARCH.
    IF sy-subrc NE 0.
      DELETE TABLE lt_bkpf FROM ls_bkpf.
    ENDIF.
  ENDLOOP.

  LOOP AT lt_bkpf INTO ls_bkpf.

    CLEAR: lv_index.
    READ TABLE lt_bseg INTO ls_bseg WITH KEY bukrs = ls_bkpf-bukrs
                                             belnr = ls_bkpf-belnr
                                             gjahr = ls_bkpf-gjahr
                                             BINARY SEARCH.

    lv_index = sy-tabix.
    IF sy-subrc EQ 0.
*    IF lt_bseg[] IS NOT INITIAL.
      CLEAR: ls_docsingresos, ls_t001.

      MOVE-CORRESPONDING ls_bkpf TO ls_docsingresos.
*      READ TABLE lt_bseg INTO ls_bseg INDEX 1.
      ls_docsingresos-hkont = ls_bseg-hkont.

      READ TABLE lt_t001 INTO ls_t001 WITH KEY bukrs = ls_bkpf-bukrs BINARY SEARCH.

*      SELECT SINGLE txt50 INTO ls_docsingresos-txt50
*                      FROM skat
*                     WHERE spras EQ 'S'
*                       AND ktopl EQ ls_t001-ktopl     " 'CAIN'
*                       AND saknr EQ ls_docsingresos-hkont.
      zcl_qry_ingresos=>skat( EXPORTING i_operacion = 'READ'
                                      i_ktopl = ls_t001-ktopl
                                      i_saknr = ls_docsingresos-hkont
                            IMPORTING e_txt50 = ls_docsingresos-txt50 ).

*      SELECT SINGLE vbeln INTO ls_docsingresos-vbeln
*               FROM bseg
*              WHERE bukrs EQ  ls_bkpf-bukrs
*                AND belnr EQ  ls_bkpf-belnr
*                AND gjahr EQ  ls_bkpf-gjahr
*                AND koart EQ 'D'.
      zcl_qry_ingresos=>bseg2( EXPORTING i_operacion = 'READ'
                                         i_bukrs = ls_bkpf-bukrs
                                         i_belnr = ls_bkpf-belnr
                                         i_gjahr = ls_bkpf-gjahr
                               IMPORTING e_vbeln = ls_docsingresos-vbeln ).

      LOOP AT lt_bseg INTO ls_bseg  FROM lv_index.
        IF ls_bseg-bukrs = ls_bkpf-bukrs AND
           ls_bseg-belnr = ls_bkpf-belnr AND
           ls_bseg-gjahr = ls_bkpf-gjahr.
          IF ls_bseg-shkzg EQ 'S'.
            ls_bseg-wrbtr = ls_bseg-wrbtr * -1.
            ls_bseg-dmbtr = ls_bseg-dmbtr * -1.
          ENDIF.
          ls_docsingresos-wrbtr = ls_docsingresos-wrbtr + ls_bseg-wrbtr.
          ls_docsingresos-dmbtr = ls_docsingresos-dmbtr + ls_bseg-dmbtr.
        ELSE.
          EXIT.
        ENDIF.
      ENDLOOP.

*     Se valida que el Doc. sea de anulación y se busca el Doc. anulado para obtener el UUID
      IF ls_bkpf-xreversal EQ '2'.
        CLEAR: ls_bkpf_anulado.
*        SELECT SINGLE * INTO ls_bkpf_anulado
*          FROM bkpf
*         WHERE bukrs  EQ i_company_code
*           AND belnr  EQ ls_bkpf-stblg
*           AND gjahr  EQ ls_bkpf-stjah.
        zcl_qry_ingresos=>bkpf2( EXPORTING i_operacion = 'READ'
                                         i_bukrs = i_company_code
                                         i_belnr = ls_bkpf-stblg
                                         i_gjahr = ls_bkpf-stjah
                               IMPORTING es_bkpf = ls_bkpf_anulado ).
        IF sy-subrc EQ 0.

*          SELECT SINGLE vbeln INTO lv_anulado_vbeln
*                   FROM bseg
*                  WHERE bukrs EQ  ls_bkpf_anulado-bukrs
*                    AND belnr EQ  ls_bkpf_anulado-belnr
*                    AND gjahr EQ  ls_bkpf_anulado-gjahr
*                    AND koart EQ 'D'.
          zcl_qry_ingresos=>bseg2( EXPORTING i_operacion = 'READ'
                                         i_bukrs = ls_bkpf_anulado-bukrs
                                         i_belnr = ls_bkpf_anulado-belnr
                                         i_gjahr = ls_bkpf_anulado-gjahr
                               IMPORTING e_vbeln = lv_anulado_vbeln ).

*          SELECT SINGLE uuid_fac INTO ls_docsingresos-uuid
*              FROM ztasd_fact_uuid
*             WHERE bukrs EQ i_company_code
*               AND vbeln EQ lv_anulado_vbeln.
          zcl_qry_ingresos=>ztasd_fact_uuid( EXPORTING i_operacion = 'READ'
                                         i_bukrs = i_company_code
                                         i_vbeln = lv_anulado_vbeln
                               IMPORTING e_uuid = ls_docsingresos-uuid ).

          IF ls_docsingresos-uuid IS INITIAL.
*            SELECT SINGLE zuuid INTO ls_docsingresos-uuid
*                FROM zvalida_fi
*               WHERE bukrs EQ ls_bkpf_anulado-bukrs
*                 AND belnr EQ ls_bkpf_anulado-belnr
*                 AND gjahr EQ ls_bkpf_anulado-gjahr.
            zcl_qry_ingresos=>zvalida_fi( EXPORTING i_operacion = 'READ'
                                         i_bukrs = ls_bkpf_anulado-bukrs
                                         i_belnr = ls_bkpf_anulado-belnr
                                         i_gjahr = ls_bkpf_anulado-gjahr
                               IMPORTING e_uuid = ls_docsingresos-uuid ).

          ENDIF.
          IF ls_docsingresos-uuid IS INITIAL.
            CLEAR lv_tdline.
            PERFORM read_text USING   'ZUUI'      "UUID
                                      ls_bkpf_anulado
                             CHANGING lv_tdline.
            ls_docsingresos-uuid = lv_tdline.
          ENDIF.
        ENDIF.

      ELSE.
*       Si es un Doc. normal se obtiene le UUID directamente.

*        SELECT SINGLE uuid_fac INTO ls_docsingresos-uuid
*            FROM ztasd_fact_uuid
*           WHERE bukrs EQ i_company_code
*             AND vbeln EQ ls_docsingresos-vbeln.
        zcl_qry_ingresos=>ztasd_fact_uuid( EXPORTING i_operacion = 'READ'
                                         i_bukrs = i_company_code
                                         i_vbeln = ls_docsingresos-vbeln
                               IMPORTING e_uuid = ls_docsingresos-uuid ).
        IF ls_docsingresos-uuid IS INITIAL.
*          SELECT SINGLE zuuid INTO ls_docsingresos-uuid
*              FROM zvalida_fi
*             WHERE bukrs EQ ls_bkpf-bukrs
*               AND belnr EQ ls_bkpf-belnr
*               AND gjahr EQ ls_bkpf-gjahr.
          zcl_qry_ingresos=>zvalida_fi( EXPORTING i_operacion = 'READ'
                                         i_bukrs = ls_bkpf-bukrs
                                         i_belnr = ls_bkpf-belnr
                                         i_gjahr = ls_bkpf-gjahr
                               IMPORTING e_uuid = ls_docsingresos-uuid ).

        ENDIF.
        IF ls_docsingresos-uuid IS INITIAL.
          CLEAR lv_tdline.
          PERFORM read_text USING   'ZUUI'      "UUID
                                    ls_bkpf
                           CHANGING lv_tdline.
          ls_docsingresos-uuid = lv_tdline.
        ENDIF.
      ENDIF.

      IF ls_docsingresos-wrbtr IS NOT INITIAL OR ls_docsingresos-dmbtr IS NOT  INITIAL.
        APPEND ls_docsingresos TO lt_docsingresos.
      ENDIF.
    ENDIF.
  ENDLOOP.

  e_docsingresos[] = lt_docsingresos[].
ENDFUNCTION.
