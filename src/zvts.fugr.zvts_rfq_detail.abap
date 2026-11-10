FUNCTION zvts_rfq_detail.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(VENDOR) TYPE  ELIFN
*"     VALUE(QUOTATION) TYPE  EBELN OPTIONAL
*"     VALUE(LANGU) TYPE  SY-LANGU OPTIONAL
*"  EXPORTING
*"     VALUE(RFQ_DATE) TYPE  DATUM
*"     VALUE(VAL_START) TYPE  DATUM
*"     VALUE(VAL_END) TYPE  DATUM
*"     VALUE(DEADLINE) TYPE  DATUM
*"     VALUE(TERMS) TYPE  CHAR30
*"     VALUE(CURR) TYPE  WAERS
*"     VALUE(RATE) TYPE  ZKURSF
*"     VALUE(INCO) TYPE  CHAR3
*"     VALUE(INCO2) TYPE  ZINCO2
*"     VALUE(DOC_TYPE) TYPE  CHAR20
*"     VALUE(OUR_REF) TYPE  TEXT12
*"     VALUE(YOUR_REF) TYPE  TEXT12
*"     VALUE(PUR_GRP) TYPE  EKGRP
*"     VALUE(DESC) TYPE  ZCHAR1000
*"     VALUE(PUR_NAME) TYPE  EKNAM
*"     VALUE(PUR_ORG) TYPE  EKORG
*"     VALUE(PLANT_ADDR) TYPE  ZSTRING128
*"     VALUE(PHONE) TYPE  CHAR12
*"     VALUE(FAX) TYPE  TELFX
*"     VALUE(EMAIL) TYPE  CHAR255
*"     VALUE(STATUS) TYPE  CHAR255
*"     VALUE(MESSAGE) TYPE  CHAR255
*"     VALUE(RFQ_DETAIL) TYPE  ZTT_ZVTS_RFQ_DETAIL
*"----------------------------------------------------------------------
  DATA:st_t024       TYPE zst_t024,
       st_t001w      TYPE zst_t001w,
       st_rfq_detail TYPE zst_zvts_rfq_detail.

  p_lan = langu.

  CLEAR: prov.

  IF vendor CA 'ABCDEFGHIJKLMNOPQRSTVWXYZ'.
    prov  = vendor.
  ELSE.
    provc = vendor.
    prov  = provc.
  ENDIF.

*- Obtiene Encabezado
  CLEAR t_ekko.
*  SELECT ebeln lifnr aedat kdatb kdate ernam waers wkurs ihran
*           zterm zbd1t zbd2t zbd3t zbd1p zbd2p
*         angdt bsart bukrs inco1 inco2 ihrez ekgrp ekorg
*  INTO CORRESPONDING FIELDS OF TABLE t_ekko
*  FROM ekko
*  WHERE ebeln EQ quotation.
  zcl_qry_rfq_detail=>ekko( EXPORTING i_operacion = 'READ' i_quotation = quotation IMPORTING t_ekko = t_ekko ).

  IF t_ekko IS NOT INITIAL.
*  CHECK sy-subrc EQ 0.
    READ TABLE t_ekko INDEX 1 INTO ls_ekko.

*  rfq_date  = t_ekko-aedat.
*  val_start = t_ekko-kdatb.
*  val_end   = t_ekko-kdate.
*  deadline  = t_ekko-angdt.
*  curr      = t_ekko-waers.
*  rate      = t_ekko-wkurs.
*  inco      = t_ekko-inco1.
*  inco2     = t_ekko-inco2.
*  our_ref   = t_ekko-unsez.
*  your_ref  = t_ekko-ihrez.
*  pur_grp   = t_ekko-ekgrp.
*  pur_org   = t_ekko-ekorg.

    rfq_date  = ls_ekko-aedat.
    val_start = ls_ekko-kdatb.
    val_end   = ls_ekko-kdate.
    deadline  = ls_ekko-angdt.
    curr      = ls_ekko-waers.
    rate      = ls_ekko-wkurs.
    inco      = ls_ekko-inco1.
    inco2     = ls_ekko-inco2.
    our_ref   = ls_ekko-unsez.
    your_ref  = ls_ekko-ihrez.
    pur_grp   = ls_ekko-ekgrp.
    pur_org   = ls_ekko-ekorg.

    IF ls_ekko-waers IS INITIAL.
*    SELECT SINGLE waers INTO curr FROM lfm1
*    WHERE lifnr EQ t_ekko-lifnr
*    AND   ekorg EQ t_ekko-ekorg.
      zcl_qry_rfq_detail=>lfm1( EXPORTING i_operacion = 'READ' ls_ekko = ls_ekko i_inco = inco i_terms = terms
      IMPORTING curr = curr ).
      IF sy-subrc NE 0.
        CLEAR curr.
      ENDIF.
    ENDIF.
  ENDIF.
*- Terminos de pago
  terms     = ls_ekko-zterm.

  IF terms IS INITIAL OR inco IS INITIAL.
*    SELECT SINGLE zterm INTO terms FROM lfm1
*    WHERE lifnr EQ prov
*    AND   ekorg EQ t_ekko-ekorg.
    zcl_qry_rfq_detail=>lfm1( EXPORTING i_operacion = 'READ' ls_ekko = ls_ekko i_prov = prov i_inco = inco i_terms = terms
          IMPORTING inco = inco terms = terms ).
  ENDIF.
*
*  IF inco IS INITIAL.
*    SELECT SINGLE inco1 INTO inco FROM lfm1
*    WHERE lifnr EQ prov
*    AND   ekorg EQ t_ekko-ekorg.
*  ENDIF.

  CLEAR st_t024.
*  SELECT SINGLE eknam ektel telfx smtp_addr
*  INTO (t024-eknam, t024-ektel, t024-telfx, t024-smtp_addr)
*  FROM t024 WHERE ekgrp EQ t_ekko-ekgrp.
  zcl_qry_rfq_detail=>t024( EXPORTING i_operacion = 'READ' ls_ekko = ls_ekko IMPORTING st_t024 = st_t024 ).
  pur_name  = st_t024-eknam.
  phone     = st_t024-ektel.
  fax       = st_t024-telfx.
  email     = st_t024-smtp_addr.

  IF sy-datum > ls_ekko-angdt.
    status = 'V'.
  ELSE.
    status = 'A'.
  ENDIF.
*DESC = 'Ok'.
  PERFORM get_header_text USING quotation langu desc.

  CLEAR t_ekpo.
*  SELECT ebeln ebelp matnr txz01 ktmng netpr agmem
*         peinh bprme pstyp packno werks meins adrn2 bednr idnlf
*         plifz mwskz agdat
*  INTO TABLE t_ekpo FROM  ekpo FOR ALL ENTRIES IN t_ekko
*  WHERE ebeln EQ t_ekko-ebeln
*  AND   loekz EQ space.
  zcl_qry_rfq_detail=>ekpo( EXPORTING i_operacion = 'READ' it_ekko = t_ekko IMPORTING et_ekpo = t_ekpo ).

  IF t_ekpo IS NOT INITIAL.
*  CHECK sy-subrc EQ 0.
    SORT t_ekpo BY ebelp.
    READ TABLE t_ekpo INDEX 1 INTO ls_ekpo2.
    DATA lv_t001W TYPE c.
*  SELECT SINGLE * FROM t001w WHERE werks EQ t_ekpo-werks.
    zcl_qry_rfq_detail=>t001w( EXPORTING i_operacion = 'READ' st_ekpo = ls_ekpo2 IMPORTING st_t001w = st_t001w ).
*  IF sy-subrc EQ 0.
    IF st_t001w IS NOT INITIAL.
      CLEAR plant_addr.
      CONCATENATE st_t001w-name1 st_t001w-stras st_t001w-pstlz st_t001w-ort01
      INTO plant_addr SEPARATED BY space.
    ENDIF.
  ENDIF.
  CLEAR rfq_detail.
  LOOP AT t_ekpo INTO ls_ekpo2.

*- Valida si ya tiene Pedido colocado la pos de la oferta
*    SELECT k~banfn k~bnfpo b~ebeln b~ebelp b~statu INTO (eket-banfn, eket-bnfpo, eban-ebeln, eban-ebelp, eban-statu)
*    FROM   eket AS k INNER JOIN eban AS b
*    ON     k~banfn = b~banfn
*    AND    k~bnfpo = b~bnfpo
*    WHERE  k~ebeln EQ t_ekpo-ebeln
*    AND    k~ebelp EQ t_ekpo-ebelp
*    AND    b~ebeln EQ space.
*    ENDSELECT.
    zcl_qry_rfq_detail=>eket_eban( EXPORTING i_operacion = 'READ' st_ekpo = ls_ekpo2 IMPORTING t_eban = t_eban t_eket = t_eket ).

    LOOP AT t_eban INTO ls_eban.
      LOOP AT t_eket INTO ls_eket.
        IF NOT ls_eket-banfn IS INITIAL AND ls_eban-statu EQ 'B'.
          CONTINUE.
        ENDIF.
      ENDLOOP.
    ENDLOOP.

**  check sy-subrc eq 0.
*
*    SELECT SINGLE ptext INTO doc_type
*    FROM t163y
*    WHERE spras EQ langu
*    AND   pstyp EQ t_ekpo-pstyp.
    zcl_qry_rfq_detail=>t163y( EXPORTING i_operacion = 'READ' st_ekpo = ls_ekpo2 i_langu = langu IMPORTING doc_type = doc_type ).

    st_rfq_detail-item = ls_ekpo2-ebelp.
    st_rfq_detail-material = ls_ekpo2-matnr.
    st_rfq_detail-text = ls_ekpo2-txz01.
    st_rfq_detail-quantity = ls_ekpo2-ktmng.
    st_rfq_detail-price = ls_ekpo2-netpr.
    st_rfq_detail-comment = ls_ekpo2-agmem.
    st_rfq_detail-per = ls_ekpo2-peinh.
    st_rfq_detail-opu = ls_ekpo2-bprme.
    st_rfq_detail-packno = ls_ekpo2-packno.
    st_rfq_detail-plant = ls_ekpo2-werks.
    st_rfq_detail-unit = ls_ekpo2-meins.
    st_rfq_detail-trck_no = ls_ekpo2-bednr.
    st_rfq_detail-del_days = ls_ekpo2-plifz.
    st_rfq_detail-iva = ls_ekpo2-mwskz.
*
*    MOVE: t_ekpo-ebelp  TO rfq_detail-item,
*          t_ekpo-matnr  TO rfq_detail-material,
*          t_ekpo-txz01  TO rfq_detail-text,
*          t_ekpo-ktmng  TO rfq_detail-quantity,
*          t_ekpo-netpr  TO rfq_detail-price,
*          t_ekpo-agmem  TO rfq_detail-comment,
*          t_ekpo-peinh  TO rfq_detail-per,
*          t_ekpo-bprme  TO rfq_detail-opu,
*          t_ekpo-packno TO rfq_detail-packno,
*          t_ekpo-werks  TO rfq_detail-plant,
*          t_ekpo-meins  TO rfq_detail-unit,
**        t_ekpo-adrn2  to RFQ_DETAIL-,
*          t_ekpo-bednr  TO rfq_detail-trck_no,
*          t_ekpo-plifz  TO rfq_detail-del_days,
**        t_ekpo-J_1BMATUSE to RFQ_DETAIL-USAGE_MAT,
**        t_ekpo-J_1BNBM    to RFQ_DETAIL-NCM_CODE,
**        t_ekpo-J_1BMATORG to RFQ_DETAIL-ORIG_MAT,
*          t_ekpo-mwskz      TO rfq_detail-iva.

    IF NOT  ls_ekpo2-agdat IS INITIAL.
*      MOVE t_ekpo-agdat TO rfq_detail-deadline.
      st_rfq_detail-deadline = ls_ekpo2-agdat.
    ELSE.
*      MOVE t_ekko-angdt TO rfq_detail-deadline.
      st_rfq_detail-deadline = ls_ekko-angdt.
    ENDIF.

    IF ls_ekpo2-pstyp = '9'.
      st_rfq_detail-item_cat = 'D'.
    ENDIF.

    CLEAR ls_eket.
*    SELECT SINGLE eindt INTO eket-eindt
*    FROM eket WHERE ebeln EQ t_ekpo-ebeln
*              AND   ebelp EQ t_ekpo-ebelp.
    zcl_qry_rfq_detail=>eket( EXPORTING i_operacion = 'READ' st_ekpo = ls_ekpo2 IMPORTING st_eket = ls_eket ).
*    MOVE eket-eindt TO rfq_detail-del_date.
    st_rfq_detail-del_date = ls_eket-eindt.

    DATA lv_matnr TYPE c LENGTH 18.
    lv_matnr = |{ ls_ekpo2-matnr ALPHA = IN }|.

    PERFORM get_item_text USING quotation ls_ekpo2-ebelp lv_matnr langu st_rfq_detail-long_text.
*    REPLACE ALL OCCURRENCES OF '"' IN st_rfq_detail-long_text WITH space.

    APPEND st_rfq_detail TO rfq_detail.

**- Inserta Lineas de servicio
    CHECK ls_ekpo2-pstyp = '9'.

    CLEAR t_esll.

    CLEAR: ls_esll-packno, ls_esll-sub_packno.
*    SELECT packno sub_packno INTO (esll-packno, esll-sub_packno)
*    FROM esll
*    WHERE packno EQ t_ekpo-packno.
*    ENDSELECT.
    zcl_qry_rfq_detail=>esll( EXPORTING i_operacion = 'READ' st_ekpo = ls_ekpo2 st_esll = ls_esll IMPORTING t_esll = t_esll t_esll2 = t_esll2 ).
*    IF sy-subrc EQ 0.
*      MOVE: esll-packno     TO t_esll-packno,
*            esll-sub_packno TO t_esll-sub_packno.
*      APPEND t_esll.
*
    READ TABLE t_esll INDEX 1 INTO ls_esll.
    IF sy-subrc EQ 0.
      CLEAR t_esll2.
      LOOP AT t_esll INTO ls_esll.
*        CLEAR esll.
*        SELECT packno introw extrow ktext1 menge tbtwr meins
*        INTO CORRESPONDING FIELDS OF t_esll2
*        FROM esll
*        WHERE packno EQ t_esll-sub_packno.
        zcl_qry_rfq_detail=>esll( EXPORTING i_operacion = 'READ' st_ekpo = ls_ekpo2 st_esll = ls_esll IMPORTING t_esll2 = t_esll2 ).
        LOOP AT t_esll2 INTO ls_esll2.
          ls_esll2-key = ls_esll-packno.
          PERFORM unidad_medida USING ls_esll2-meins.
          APPEND ls_esll2 TO t_esll2.
*        ENDSELECT.
        ENDLOOP.
      ENDLOOP.
*
      LOOP AT t_esll2 INTO ls_esll2.
        CLEAR st_rfq_detail.
*        MOVE: t_esll2-extrow TO rfq_detail-item,
*              t_esll2-ktext1 TO rfq_detail-text,
*              t_esll2-menge  TO rfq_detail-quantity,
*              t_esll2-tbtwr  TO rfq_detail-price,
*              '9'            TO rfq_detail-item_cat,
*              t_ekpo-werks   TO rfq_detail-plant,
*              t_esll2-meins  TO rfq_detail-unit,
*              t_ekpo-packno  TO rfq_detail-packno,
*              t_ekpo-bednr   TO rfq_detail-trck_no,
*              t_ekpo-idnlf   TO rfq_detail-del_days,
*              t_ekpo-peinh   TO rfq_detail-per,
*              t_ekpo-bprme   TO rfq_detail-opu.
        st_rfq_detail-item = ls_esll2-extrow.
        st_rfq_detail-text = ls_esll2-ktext1.
        st_rfq_detail-quantity = ls_esll2-menge.
        st_rfq_detail-price = ls_esll2-tbtwr.
        st_rfq_detail-item_cat = '9'.
        st_rfq_detail-plant = ls_ekpo2-werks.
        st_rfq_detail-unit = ls_esll2-meins.
        st_rfq_detail-packno = ls_ekpo2-packno.
        st_rfq_detail-trck_no = ls_ekpo2-bednr.
        st_rfq_detail-del_days = ls_ekpo2-idnlf.
        st_rfq_detail-per = ls_ekpo2-peinh.
        st_rfq_detail-opu = ls_ekpo2-bprme.

*- Texto de la linea de servicio
        CLEAR: nom, st_rfq_detail-long_text.
        CONCATENATE ls_esll2-packno ls_esll2-introw INTO nom.
        CONDENSE nom.
        len = 'S'.
        id  = 'LLTX'.
        obj = 'ESLL'.

        PERFORM search_text USING id nom len obj.
        IF sy-subrc NE 0.
          len = 'E'.
          PERFORM search_text USING id nom len obj.
        ENDIF.
        LOOP AT t_texto2 INTO st_texto2.
          CONCATENATE st_rfq_detail-long_text st_texto2-tdline INTO st_rfq_detail-long_text SEPARATED BY space.
        ENDLOOP.
*        REPLACE ALL OCCURRENCES OF '"' IN st_rfq_detail-long_text WITH space.

        APPEND st_rfq_detail TO rfq_detail.
      ENDLOOP.
    ENDIF.
  ENDLOOP.

ENDFUNCTION.
