FUNCTION zvts_rfq_send.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(QUOTATION) TYPE  EBELN
*"     VALUE(LANGU) TYPE  SY-LANGU OPTIONAL
*"     VALUE(CURRENCY) TYPE  WAERS OPTIONAL
*"     VALUE(REFERENCE) TYPE  TEXT12 OPTIONAL
*"     VALUE(INCOTERM) TYPE  CHAR3 OPTIONAL
*"     VALUE(INCOTERM2) TYPE  ZINCO2 OPTIONAL
*"     VALUE(COMMENTS) TYPE  CHAR255 OPTIONAL
*"     VALUE(SSOUSER) TYPE  CHAR20 OPTIONAL
*"     VALUE(DETAIL) TYPE  ZTT_ZVTS_RFQ_UPD
*"  EXPORTING
*"     VALUE(MESSAGE) TYPE  CHAR255
*"----------------------------------------------------------------------
  DATA ls_params TYPE zst_ctu_params.

  DATA: pos(10) TYPE n.
  disp_mode = 'N'.
  CLEAR message.
  gtos_asoc = ' '.
  p_lan = langu.
  ssouser1 = ssouser.
*  REFRESH: t_oferta, t_esll2.
  CLEAR: t_oferta, t_esll2.
  DATA: st_detail TYPE zst_zvts_rfq_upd.

  DATA: it_ekko  TYPE ztt_ekko,
        wa_ekko  LIKE LINE OF it_ekko,
        wa_lfm1  TYPE zst_lfm1,
        it_konv  TYPE ztt_konv,
        wa_konv  LIKE LINE OF it_konv,
        it_ekpo  TYPE ztt_ekpo,
        wa_ekpo  LIKE LINE OF it_ekpo,
        it_cdhdr TYPE ztt_cdhdr,
        it_a016  TYPE ztt_a016,
        wa_a016  LIKE LINE OF it_a016,
        it_log   TYPE ztt_zvts_log,
        wa_log   LIKE LINE OF it_log.

  LOOP AT detail INTO st_detail.
    IF st_detail-item_cat NE '9'.
      ls_oferta-ebeln  = quotation.
      ls_oferta-ebelp  = st_detail-item.
      ls_oferta-netpr  = st_detail-price.
      ls_oferta-eindt  = st_detail-del_date.
      ls_oferta-plifz  = st_detail-del_days.
      ls_oferta-pstyp  = st_detail-item_cat.
      ls_oferta-packno = st_detail-packno.
      ls_oferta-comments = st_detail-comments.
      ls_oferta-mwskz    = st_detail-iva.
      APPEND ls_oferta TO t_oferta.
    ELSE.
      ls_esll2-packno = st_detail-packno.
      ls_esll2-extrow = st_detail-item.
      ls_esll2-tbtwr  = st_detail-price.
      ls_esll2-comments = st_detail-comments.
      APPEND ls_esll2 TO t_esll2.
    ENDIF.
  ENDLOOP.

  waers = currency.
  h_comments = comments.

  LOOP AT t_oferta INTO ls_oferta.
    CLEAR bdc_tab.
    CLEAR: v_precio, v_pedido1.

*    SELECT SINGLE * FROM ekko WHERE ebeln EQ quotation.
    zcl_qry_rfq_send=>ekko( EXPORTING i_operacion = 'READ' i_quotation = quotation v_pedido1 = v_pedido1 IMPORTING st_ekko = wa_ekko ).
** Si la moneda esta en blanco (Oferta nueva)
    IF wa_ekko-waers IS INITIAL.
*     SELECT waers INTO lfm1-waers
*     FROM lfm1
*     WHERE lifnr EQ ekko-lifnr
*     AND   ekorg EQ ekko-ekorg.
*     ENDSELECT.
      zcl_qry_rfq_send=>lfm1( EXPORTING i_operacion = 'READ' st_ekko = wa_ekko IMPORTING st_lfm1 = wa_lfm1 ).
      IF wa_lfm1-waers IS NOT INITIAL.
        wa_ekko-waers = wa_lfm1-waers.
      ENDIF.
    ENDIF.

    IF ls_oferta-pstyp EQ space OR ls_oferta-pstyp EQ 'D'.
      v_pedido1   = ls_oferta-ebeln.
      v_posicion1 = ls_oferta-ebelp.
      v_eindt     = ls_oferta-eindt.

      v_precio   = ls_oferta-netpr.
      v_pstyp    = ls_oferta-pstyp.
      v_precio1   = v_precio.

      AT FIRST.
        header = 'X'.
      ENDAT.

*- valida formato
      PERFORM mask_qty USING v_precio.
*--
      CLEAR: wa_lfm1.
*      SELECT SINGLE kalsk waers INTO (lfm1-kalsk,lfm1-waers)
*      FROM lfm1
*      WHERE lifnr EQ ekko-lifnr
*      AND   ekorg EQ ekko-ekorg.
      zcl_qry_rfq_send=>lfm1( EXPORTING i_operacion = 'READ' st_ekko = wa_ekko IMPORTING st_lfm1 = wa_lfm1 ).
      IF waers EQ space.
        waers = wa_lfm1-waers.
      ENDIF.
*-    Obtiene condiciones de pago
*      CLEAR konv.
*      SELECT COUNT( * )  FROM konv
*      INTO l_count
*      WHERE knumv EQ ekko-knumv
*      AND   kposn EQ '000000'.
      zcl_qry_rfq_send=>konv( EXPORTING i_operacion = 'READ' st_ekko = wa_ekko IMPORTING it_konv = it_konv l_count = l_count ).
    ENDIF.

    IF ls_oferta-pstyp EQ space OR
       ls_oferta-pstyp EQ 'L'   OR  "NE '9'.
       ls_oferta-pstyp EQ 'K'.
**--
      PERFORM dynpro USING:
              'X'   'SAPMM06E'      '0305',
              ' '   'RM06E-ANFNR'   ls_oferta-ebeln,
              ' '   'BDC_OKCODE'    '/00'.
*
**-  Si no se habia cotizado
      CLEAR wa_ekpo.
*      SELECT SINGLE netpr INTO ekpo-netpr FROM ekpo
*      WHERE ebeln EQ t_oferta-ebeln
*       AND  netpr NE 0.
      zcl_qry_rfq_send=>ekpo( EXPORTING i_operacion = 'READ' ls_oferta = ls_oferta IMPORTING st_ekpo = wa_ekpo ).
*
**- Gtos Asociados

*
      PERFORM dynpro USING:
              'X'   'SAPMM06E'      '0301',
              ' '   'EKKO-WAERS'    waers,
              ' '   'MMPUR_INCOTERMS_QUOTE-INCO1'    incoterm,
              ' '   'MMPUR_INCOTERMS_QUOTE-INCO2_L'    incoterm2,
              ' '   'EKKO-IHREZ'    reference,
              ' '   'BDC_OKCODE'    '=AB'.
*
      IF ( wa_ekko-waers NE waers AND NOT wa_ekpo-netpr IS INITIAL ) OR
         ( wa_ekko-waers NE waers AND wa_ekko-statu EQ 'A' ).
        PERFORM dynpro USING:
                'X'   'SAPLSPO2'      '0300',
                ' '   'BDC_OKCODE'    '=OPT2'.
*
      ELSEIF wa_ekko-waers NE waers.
**-      Si ya tuvo cualquier otro cambio
*        SELECT * FROM cdhdr WHERE objectclas EQ 'EINKBELEG'
*                            AND   objectid   EQ t_oferta-ebeln
*                            AND   tcode      EQ 'ME47'.
*        ENDSELECT.
        zcl_qry_rfq_send=>cdhdr( EXPORTING i_operacion = 'READ' ls_oferta = ls_oferta IMPORTING it_cdhdr = it_cdhdr ).
        IF it_cdhdr IS NOT INITIAL.
          PERFORM dynpro USING:
                   'X'   'SAPLSPO2'      '0300',
                   ' '   'BDC_OKCODE'    '=OPT2'.
        ENDIF.
      ENDIF.
*
      PERFORM concatena.
      READ TABLE it_ekpo WITH KEY ebeln = ls_oferta-ebeln
                                  ebelp = ls_oferta-ebelp INTO wa_ekpo.
      PERFORM fecha.

      PERFORM dynpro USING:
              'X'   'SAPMM06E'            '0323',
              ' '   'BDC_CURSOR'          'RM06E-EBELP',
              ' '   'RM06E-EBELP'          ls_oferta-ebelp,
              ' '   'BDC_OKCODE'           '/00'.
      .
      PERFORM dynpro USING:
              'X'   'SAPMM06E'             '0323',
              ' '   'RM06E-TCSELFLAG(01)'  'X',
              ' '   'RM06E-EEIND(01)'      fecha,
              ' '   'BDC_OKCODE'           '=KO'.

*- Valida si se recotiza.
      IF NOT wa_ekpo-netpr IS INITIAL.
*- valida la condición
*        SELECT SINGLE knumh INTO a016-knumh FROM a016
*        WHERE evrtn EQ t_oferta-ebeln AND evrtp EQ t_oferta-ebelp.
        zcl_qry_rfq_send=>knumh( EXPORTING i_operacion = 'READ' ls_oferta = ls_oferta IMPORTING wa_a016 = wa_a016 ).
        IF wa_a016 IS NOT INITIAL.
          PERFORM dynpro USING:
               'X'   'SAPLV14A'             '0102',
               ' '   'BDC_CURSOR'           'VAKE-DATAB(01)',
               ' '   'BDC_OKCODE'           'PICK'.
        ENDIF.
      ENDIF.

      IF wa_ekko-bsart EQ 'ZTE'.
        PERFORM dynpro USING:
               'X'   'SAPLV69A'             '9000',
               ' '   'KOMV-KBETR(01)'       v_precio.

      ELSE.
        PERFORM dynpro USING:
*               'X'   'SAPMV13A'             '0201',
                'X'   'SAPMV13A'             '1016',
                ' '   'KONP-KBETR(01)'       v_precio,
                ' '   'BDC_OKCODE'           '/EBAC'.

      ENDIF.

*--8 ago
      PERFORM dynpro USING:

                'X'   'SAPMM06E'             '0323',
                ' '   'RM06E-TCSELFLAG(01)'  'X',
                ' '   'BDC_OKCODE'           '=DETA',

                'X'   'SAPMM06E'             '0311',
                ' '   'BDC_OKCODE'           'DETZ',

                'X'   'SAPMM06E'             '0112',
                ' '   'EKPO-PLIFZ'            ls_oferta-plifz,
                ' '   'BDC_OKCODE'           '=BACK',
*--8 ago
                'X'   'SAPMM06E'             '0323',
                ' '   'RM06E-EBELP'          ls_oferta-ebelp,
                ' '   'BDC_OKCODE'           '=BU'.


*      CALL TRANSACTION 'ME47' USING  bdc_tab MODE disp_mode
*         UPDATE 'S' MESSAGES INTO messtab.
      ls_params-dismode = 'N'.
      ls_params-updmode = 'S'.
      zcl_call_transaction=>call_transaction( EXPORTING i_tcode = 'ME47'
                                                        is_params = ls_params
                                                        it_bdcdata = bdc_tab
                                              IMPORTING et_messtab = messtab ).
      READ TABLE messtab INTO DATA(ls_messtab) WITH KEY msgtyp = 'E'.
      IF sy-subrc NE 0.
*
*--     salva textos
        PERFORM save_text_rfq.
        IF p_lan EQ 'S'.
*          MOVE 'Petición Actualizada.' TO message.
          message = 'Petición Actualizada.'.
        ELSE.
*          MOVE 'RFQ Updated.' TO message.
          message = 'RFQ Updated.'.
        ENDIF.
      ELSE.
        PERFORM edit_error USING message.
        CLEAR wa_log.
        wa_log-company = wa_ekko-bukrs.
        wa_log-vendor = prov.
        wa_log-trans = 'ZTRCK1'.
        wa_log-purchase_doc = ls_oferta-ebeln.
        wa_log-item_doc = ls_oferta-ebelp.
        wa_log-rec_date = sy-datum.
        wa_log-time = sy-uzeit.
        wa_log-type = ls_messtab-msgtyp.
        wa_log-msgid = ls_messtab-msgid.
        wa_log-msgnr = ls_messtab-msgnr.
        wa_log-message = ls_messtab-msgv1. "message.
        wa_log-del_date = ls_oferta-eindt.
        wa_log-del_days = ls_oferta-idnlf.
*        wa_log-price = v_precio.
        wa_log-username = sy-uname.
        wa_log-sysid = sy-sysid.

*        MOVE: ekko-bukrs     TO zvts_log-company,
*              prov           TO zvts_log-vendor,
*              'ZTRCK1'       TO zvts_log-trans,
*              t_oferta-ebeln TO zvts_log-purchase_doc,
*              t_oferta-ebelp TO zvts_log-item_doc,
*              sy-datum       TO zvts_log-rec_date,
*              sy-uzeit       TO zvts_log-time,
*              sy-msgty       TO zvts_log-type,
*              sy-msgid       TO zvts_log-msgid,
*              sy-msgno       TO zvts_log-msgnr,
*              message        TO zvts_log-message,
*              t_oferta-eindt TO zvts_log-del_date,
*              t_oferta-idnlf TO zvts_log-del_days,
*              v_precio       TO zvts_log-price,
*              sy-uname       TO zvts_log-username,
*              sy-sysid       TO zvts_log-sysid.
*
        numinset = 1.
        LOOP AT messtab INTO st_messtab.
          wa_log-numinset = numinset.
          numinset = numinset + 1.
          wa_log-dyname  = st_messtab-dyname.
          wa_log-dynumb  = st_messtab-dynumb.
          wa_log-fldname = st_messtab-fldname.
*          MOVE: messtab-dyname  TO zvts_log-dyname,
*                messtab-dynumb  TO zvts_log-dynumb,
*                messtab-fldname TO zvts_log-fldname.
*          MODIFY zvts_log.
          zcl_qry_rfq_send=>zvts_log( EXPORTING i_operacion = 'CREATE' wa_log = wa_log ).
        ENDLOOP.
*
      ENDIF.
**----------------------------------------------------------------*
**-    Linea de Servicios
**----------------------------------------------------------------*
    ELSEIF ls_oferta-pstyp EQ 'D'.
*
      ls_oferta-eindt = v_eindt.
      PERFORM fecha.

      PERFORM dynpro USING:
              'X'   'SAPMM06E'             '0305',
              ' '   'RM06E-ANFNR'          v_pedido1, "t_oferta-ebeln,
              ' '   'BDC_OKCODE'           '/00'.

      PERFORM dynpro USING:
              'X'   'SAPMM06E'      '0301',
              ' '   'BDC_OKCODE'    '=AB'.  "Énvía al resumen ENF 27Jul2024

      PERFORM dynpro USING:
              'X'   'SAPMM06E'             '0323',
              ' '   'RM06E-EBELP'          v_posicion1,
              ' '   'BDC_OKCODE'           '/00',

              'X'   'SAPMM06E'             '0323',
              ' '   'RM06E-TCSELFLAG(01)'  'X',
              ' '   'RM06E-EEIND(01)'      fecha,
              ' '   'BDC_OKCODE'           '=DETA',

              'X'   'SAPMM06E'             '0311',
              ' '   'EKPO-MWSKZ'            ls_oferta-mwskz,
              ' '   'BDC_OKCODE'           'DETZ',

              'X'   'SAPMM06E'             '0112',
              ' '   'EKPO-PLIFZ'            ls_oferta-plifz,
              ' '   'BDC_OKCODE'           '=BACK'.

      PERFORM dynpro USING:
              'X'   'SAPMM06E'             '0323',
              ' '   'RM06E-EBELP'          v_posicion1,
              ' '   'BDC_OKCODE'           '/00',
              'X'   'SAPMM06E'             '0323',
              ' '   'RM06E-TCSELFLAG(01)'  'X',
              ' '   'BDC_OKCODE'           '=DIEN'.
*
      LOOP AT t_esll2 INTO ls_esll2 WHERE packno   = ls_oferta-packno .
        CLEAR: v_precio2.

        v_precio2   = ls_esll2-tbtwr.
        PERFORM mask_qty USING v_precio2.
        pos = ls_esll2-extrow.
        SHIFT pos LEFT DELETING LEADING '0'.
        PERFORM dynpro USING:
                'X'   'SAPLMLSP'          '0201', "201
                ' '   'RM11P-NEW_ROW'     pos, "t_esll2-extrow+7(3),
                ' '   'BDC_OKCODE'        '/00',

                'X'   'SAPLMLSP'          '0201', "0200
                ' '   'ESLL-TBTWR(01)'    v_precio2.
      ENDLOOP.

      PERFORM dynpro USING:
              'X'   'SAPLMLSP'      '0201', "0200
              ' '   'BDC_OKCODE'    'ESB',  "'=SAV'.

              'X'   'SAPMM06E'      '0323',
              ' '   'BDC_OKCODE'    '=KOPF',

              'X'   'SAPMM06E'      '0301',
              ' '   'BDC_OKCODE'     'BU',
              ' '   'EKKO-WAERS'     waers,
              ' '   'MMPUR_INCOTERMS_QUOTE-INCO1'    incoterm,
              ' '   'MMPUR_INCOTERMS_QUOTE-INCO2_L'  incoterm2,
              ' '   'EKKO-IHREZ'    reference.

**-      la oferta se mantiene en el campo V_PEDIDO1
*      SELECT SINGLE waers INTO ekko-waers FROM ekko
*      WHERE ebeln EQ v_pedido1. "t_oferta-ebeln.
      zcl_qry_rfq_send=>ekko( EXPORTING i_operacion = 'READ' i_quotation = quotation v_pedido1 = v_pedido1 IMPORTING st_ekko = wa_ekko ).
*
      IF wa_ekko-waers NE waers.
**-      Si ya tuvo cualquier otro cambio
        PERFORM dynpro USING:
                 'X'   'SAPLSPO2'      '0300',
                 ' '   'BDC_OKCODE'    '=OPT2'.
      ENDIF.

      PERFORM dynpro USING:
              'X'   'SAPMM06E'            '0301'.

*      CALL TRANSACTION 'ME47' USING  bdc_tab MODE disp_mode
*         UPDATE 'S' MESSAGES INTO messtab.
      ls_params-dismode = 'N'.
      ls_params-updmode = 'S'.
      zcl_call_transaction=>call_transaction( EXPORTING i_tcode = 'ME47'
                                                        is_params = ls_params
                                                        it_bdcdata = bdc_tab
                                              IMPORTING et_messtab = messtab ).
      READ TABLE messtab INTO ls_messtab WITH KEY msgtyp = 'E'.
      IF sy-subrc NE 0.
**--     salva textos
        PERFORM save_text_rfq.
        IF p_lan EQ 'S'.
*          MOVE 'Petición Actualizada.' TO message.
          message = 'Petición Actualizada.'.
        ELSE.
*          MOVE 'RFQ Updated.' TO message.
          message = 'RFQ Updated.'.
        ENDIF.
      ELSE.
        PERFORM edit_error USING message.
        CLEAR wa_log.
        wa_log-company = wa_ekko-bukrs.
        wa_log-vendor = prov.
        wa_log-trans = 'ZTRCK1'.
        wa_log-purchase_doc = v_pedido1.
        wa_log-item_doc = v_posicion1.
        wa_log-rec_date = sy-datum.
        wa_log-time = sy-uzeit.
        wa_log-type = ls_messtab-msgtyp.
        wa_log-msgid = ls_messtab-msgid.
        wa_log-msgnr = ls_messtab-msgnr.
        wa_log-message = ls_messtab-msgv1. "message.
        wa_log-del_date = ls_oferta-eindt.
        wa_log-del_days = ls_oferta-idnlf.
        wa_log-price = v_precio2.
        wa_log-username = sy-uname.
        wa_log-sysid = sy-sysid.
*        MOVE: ekko-bukrs     TO zvts_log-company,
*              prov           TO zvts_log-vendor,
*              'ZTRCK1'       TO zvts_log-trans,
*              v_pedido1      TO zvts_log-purchase_doc,
*              v_posicion1    TO zvts_log-item_doc,
*              sy-datum       TO zvts_log-rec_date,
*              sy-uzeit       TO zvts_log-time,
*              sy-msgty       TO zvts_log-type,
*              sy-msgid       TO zvts_log-msgid,
*              sy-msgno       TO zvts_log-msgnr,
*              message       TO zvts_log-message,
*              t_oferta-eindt TO zvts_log-del_date,
*              t_oferta-idnlf TO zvts_log-del_days,
*              v_precio2      TO zvts_log-price,
*              sy-uname       TO zvts_log-username,
*              sy-sysid       TO zvts_log-sysid.
*
        numinset = 1.
        LOOP AT messtab INTO st_messtab.
          wa_log-numinset = numinset.
          numinset = numinset + 1.
          wa_log-dyname  = st_messtab-dyname.
          wa_log-dynumb  = st_messtab-dynumb.
          wa_log-fldname = st_messtab-fldname.
*          MOVE: messtab-dyname  TO zvts_log-dyname,
*                messtab-dynumb  TO zvts_log-dynumb,
*                messtab-fldname TO zvts_log-fldname.
*          MODIFY zvts_log.
          zcl_qry_rfq_send=>zvts_log( EXPORTING i_operacion = 'CREATE' wa_log = wa_log ).
        ENDLOOP.
      ENDIF.
    ENDIF.
  ENDLOOP.
ENDFUNCTION.
