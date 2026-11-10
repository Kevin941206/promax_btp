*&---------------------------------------------------------------------*
*&      Form  DELETE_BP
*&---------------------------------------------------------------------*
FORM delete_bp USING lc_partner.

  DATA: lc_results TYPE STANDARD TABLE OF zst_bapiret2.
  DATA: ls_data    TYPE  zbapibus1006_central.
  DATA: ls_datax   TYPE  zbapibus1006_central_x.
  DATA: lt_return  TYPE  STANDARD TABLE OF zst_bapiret2.

  CLEAR lt_return.
  ls_data-centralarchivingflag = 'X'.
  ls_datax-centralarchivingflag = 'X'.

*  CALL FUNCTION 'BUPA_CENTRAL_CHANGE'
*    EXPORTING
*      iv_partner = lc_partner
*      is_data    = ls_data
*      is_data_x  = ls_datax
*    TABLES
*      et_return  = lt_return.
  zcl_bapi_bupa_create_from_data=>bupa_central_change( EXPORTING i_partner = '1000000000'
                                                                 i_data = ls_data
                                                                 i_datax = ls_datax
                                                       IMPORTING et_return = lt_return ).
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

*       Save status changes
*  CALL FUNCTION 'CRM_STATUS_UPDATE_ON_COMMIT'.

*  CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
*    EXPORTING
*      wait = 'X'.

*  CALL FUNCTION 'CRM_STATUS_BUFFER_REFRESH'.


ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  EDAS_SALIDAS
*&---------------------------------------------------------------------*
FORM edas_salidas USING p_pedidos TYPE zst_pedidos.
  IF p_pedidos-pstyp NE '9'.
* Suma Entradas
*    SELECT menge INTO ekbe-menge FROM ekbe
*    WHERE ebeln EQ p_pedidos-ebeln
*      AND ebelp EQ p_pedidos-ebelp
*      AND bewtp EQ 'E'
*      AND bwart IN ('101', '103', '105', '911', '913').
*      ADD ekbe-menge TO c_ent.
*    ENDSELECT.
    CLEAR gt_ekbe.
    zcl_qry_po_detail=>ekbe( EXPORTING i_operacion = 'READ'
                                       i_ebeln = p_pedidos-ebeln
                                       i_ebelp = p_pedidos-ebelp
                                       i_sel = '1'
                             IMPORTING et_ekbe = gt_ekbe ).
    LOOP AT gt_ekbe INTO gs_ekbe.
      ADD gs_ekbe-menge TO c_ent.
    ENDLOOP.
* Suma Salidas
*    SELECT menge INTO (ekbe-menge) FROM ekbe
*    WHERE ebeln EQ p_pedidos-ebeln
*      AND ebelp EQ p_pedidos-ebelp
*      AND bewtp EQ 'E'
*      AND bwart IN ('102', '104', '106').
*      ADD ekbe-menge TO c_sal.
*    ENDSELECT.
    CLEAR gt_ekbe.
    zcl_qry_po_detail=>ekbe( EXPORTING i_operacion = 'READ'
                                       i_ebeln = p_pedidos-ebeln
                                       i_ebelp = p_pedidos-ebelp
                                       i_sel = '2'
                             IMPORTING et_ekbe = gt_ekbe ).
    LOOP AT gt_ekbe INTO gs_ekbe.
      ADD gs_ekbe-menge TO c_sal.
    ENDLOOP.
  ELSE.
*- Lineas de servicios.
    CLEAR: t_ekbe_ent, t_ekbe_ped. CLEAR: t_ekbe_ent, t_ekbe_ped.
*    SELECT lfbnr bwart INTO (ekbe-lfbnr, ekbe-bwart) FROM ekbe
*    WHERE ebeln EQ p_pedidos-ebeln
*    AND   ebelp EQ p_pedidos-ebelp
*    AND   bewtp EQ 'E'
*    AND   bwart IN ('101', '103', '105', '911', '913').
**-  hojas de entrada
*
*      SELECT SINGLE packno INTO essr-packno FROM essr
*      WHERE lblni EQ ekbe-lfbnr
*      AND   loekz EQ space.
*      CHECK sy-subrc EQ 0.
*      SELECT sub_packno INTO esll-sub_packno FROM esll
*      WHERE  packno EQ essr-packno.
*
*        SELECT menge pln_packno pln_introw
*        INTO (t_ekbe_ent-menge, t_ekbe_ent-packno, t_ekbe_ent-introw)
*        FROM esll
*        WHERE  packno EQ esll-sub_packno.
*          APPEND t_ekbe_ent.
*        ENDSELECT. "Esll
*
*      ENDSELECT. "Esll
*    ENDSELECT. "Ekbe
    CLEAR gt_ekbe.
    zcl_qry_po_detail=>ekbe( EXPORTING i_operacion = 'READ'
                                       i_ebeln = p_pedidos-ebeln
                                       i_ebelp = p_pedidos-ebelp
                                       i_sel = '1'
                             IMPORTING et_ekbe = gt_ekbe ).
    LOOP AT gt_ekbe INTO gs_ekbe WHERE ebeln EQ p_pedidos-ebeln
                                   AND ebelp EQ p_pedidos-ebelp
                                   AND bewtp EQ 'E'
                                   AND ( bwart = '101' OR bwart = '103' OR bwart = '105' OR bwart = '911' OR bwart = '913' ).
      zcl_qry_po_detail=>essr( EXPORTING i_operacion = 'READ'
                                         i_lfbnr = gs_ekbe-lfbnr
                               IMPORTING et_essr = gt_essr ).
      READ TABLE gt_essr INTO gs_essr WITH KEY lblni = gs_ekbe-lfbnr
                                               loekz = space.
      IF sy-subrc = 0.
        CLEAR gt_esll.
        zcl_qry_po_detail=>esll( EXPORTING i_operacion = 'READ'
                                           i_packno = gs_essr-packno
                                 IMPORTING et_esll = gt_esll ).
        LOOP AT gt_esll INTO gs_esll.
          zcl_qry_po_detail=>esll( EXPORTING i_operacion = 'READ'
                                             i_packno = gs_esll-sub_packno
                                   IMPORTING et_esll = DATA(lt_esll_aux) ).
          LOOP AT lt_esll_aux INTO DATA(ls_esll).
            ls_ekbe_ent-menge = ls_esll-menge.
            ls_ekbe_ent-packno = ls_esll-pln_packno.
            ls_ekbe_ent-introw = ls_esll-pln_introw.
            APPEND ls_ekbe_ent TO t_ekbe_ent.
            CLEAR ls_ekbe_ent.
          ENDLOOP.
        ENDLOOP.
      ENDIF.
    ENDLOOP.

*    CHECK sy-subrc EQ 0.
*    CLEAR: esll-packno, esll-sub_packno.
*    SELECT SINGLE packno sub_packno
*    INTO (esll-packno, esll-sub_packno)
*    FROM esll
*    WHERE packno EQ p_pedidos-packno.
*    CHECK sy-subrc EQ 0.
*    SELECT packno introw menge
*    INTO (t_ekbe_ped-packno, t_ekbe_ped-introw,
*          t_ekbe_ped-menge)
*    FROM esll WHERE packno EQ esll-sub_packno.
*      APPEND t_ekbe_ped.
*    ENDSELECT.
    CLEAR gt_esll.
    zcl_qry_po_detail=>esll( EXPORTING i_operacion = 'READ'
                                       i_packno = p_pedidos-packno
                             IMPORTING et_esll = gt_esll ).
    READ TABLE gt_esll INTO gs_esll WITH KEY packno = p_pedidos-packno.
    IF sy-subrc = 0.
      CLEAR lt_esll_aux.
      zcl_qry_po_detail=>esll( EXPORTING i_operacion = 'READ'
                                         i_packno = gs_esll-sub_packno
                               IMPORTING et_esll = lt_esll_aux ).
      LOOP AT lt_esll_aux INTO ls_esll.
        ls_ekbe_ped-menge = ls_esll-menge.
        ls_ekbe_ped-packno = ls_esll-pln_packno.
        ls_ekbe_ped-introw = ls_esll-pln_introw.
        APPEND ls_ekbe_ped TO t_ekbe_ped.
        CLEAR ls_ekbe_ped.
      ENDLOOP.
    ENDIF.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  UNIDAD_MEDIDA
*&---------------------------------------------------------------------*
FORM unidad_medida  USING    l_meins.
*  SELECT SINGLE mseh3 INTO l_meins
*  FROM t006a
*  WHERE spras EQ p_lan
*  AND   msehi EQ l_meins.
  zcl_qry_po_detail=>t006a( EXPORTING i_operacion = 'READ'
                                      i_spras = p_lan
                                      i_msehi = l_meins
                            IMPORTING e_mseh3 = l_meins ).
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  PREPARA_PARAMETROS
*&---------------------------------------------------------------------*
FORM prepara_parametros  USING    p_company
                                  p_doc
                                  p_start_date
                                  p_end_date.
  CLEAR date.
  CLEAR r_bukrs. CLEAR ls_bukrs.
* --- Rango x Sociedad
  IF NOT p_company IS INITIAL.
    ls_bukrs-sign = 'I'.
    ls_bukrs-option = 'EQ'.
    ls_bukrs-low = p_company.
    APPEND ls_bukrs TO r_bukrs.
  ENDIF.

  CLEAR r_ebeln. CLEAR ls_ebeln.
* --- Rango x doc
  IF NOT p_doc IS INITIAL.
    n_ebeln = p_doc.
    ls_ebeln-sign = 'I'.
    ls_ebeln-option = 'EQ'.
    ls_ebeln-low = n_ebeln.
    APPEND ls_ebeln TO r_ebeln.
  ENDIF.

  CLEAR r_aedat. CLEAR ls_aedat.
* --- Rango x fecha
  IF NOT p_start_date IS INITIAL AND NOT p_end_date IS INITIAL.
    ls_aedat-sign = 'I'.
    ls_aedat-option = 'BT'.
    ls_aedat-low = p_start_date.
    ls_aedat-high = p_end_date.
    APPEND ls_aedat TO r_aedat.
  ELSEIF NOT p_start_date IS INITIAL AND p_end_date IS INITIAL.
    ls_aedat-sign = 'I'.
    ls_aedat-option = 'EQ'.
    ls_aedat-low = p_start_date.
    APPEND ls_aedat TO r_aedat.
    date = 'X'.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  CHECK_STATUS
*&---------------------------------------------------------------------*
FORM check_status  USING    ebeln ebelp status menge.
  DATA:  tot_cant TYPE menge_d.

*  SELECT ebeln menge INTO (ekes-ebeln, ekes-menge)
*  FROM ekes
*  WHERE ebeln = ebeln
*  AND   ebelp = ebelp.
*    ADD ekes-menge TO tot_cant.
*  ENDSELECT.
  CLEAR gt_ekes.
  zcl_qry_po_detail=>ekes( EXPORTING i_operacion = 'READ'
                                     i_ebeln = ebeln
                                     i_ebelp = ebelp
                           IMPORTING et_ekes = gt_ekes ).
  LOOP AT gt_ekes INTO gs_ekes WHERE ebeln = ebeln
                                 AND ebelp = ebelp.
    ADD gs_ekes-menge TO tot_cant.
  ENDLOOP.
  IF sy-subrc NE 0.
    status = '0'.
  ELSE.
    IF tot_cant < menge.
      status = '50'.
    ELSE.
      status = '100'.
    ENDIF.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SELECCIONA_ENCABEZADO
*&---------------------------------------------------------------------*
FORM selecciona_encabezado USING status company quotation star_date end_date vendor.

  CLEAR: t_ekko, ls_ekko.

* Selecciona las RFQ's Fiori
  CLEAR: f_ebeln.

*  SELECT requestforquotation INTO arfqbidder-requestforquotation
*  FROM arfqbidder WHERE supplier EQ prov.
*    f_ebeln-low = arfqbidder-requestforquotation.
*    MOVE 'I'      TO f_ebeln-sign.
*    MOVE 'EQ'     TO f_ebeln-option.
*    APPEND f_ebeln.
*  ENDSELECT.
  zcl_qry_rfq_list=>arfqbidder( EXPORTING i_operacion = 'READ'
                                          i_prov = prov
                                IMPORTING et_arfqbidder = DATA(lt_arfqbidder) ).

  IF NOT lt_arfqbidder IS INITIAL.
*    SELECT ebeln lifnr aedat kdatb kdate ernam ekorg ekgrp waers wkurs ihran
*           ihrez unsez inco1 inco2 zterm zbd1t zbd2t zbd3t zbd1p zbd2p
*           angdt bsart bukrs
*    INTO CORRESPONDING FIELDS OF TABLE t_ekko
*    FROM ekko
*    WHERE ebeln IN f_ebeln
*    AND aedat IN r_aedat
*    AND bukrs IN r_bukrs
*    AND bstyp EQ 'R'.
    zcl_qry_rfq_list=>ekko( EXPORTING i_operacion = 'READ'
                                      i_bukrs = company
                                      i_start = star_date
                                      i_end = end_date
                                      it_arfqbidder = lt_arfqbidder
                            IMPORTING et_pedidos_cab = t_ekko ).
  ENDIF.

*  SELECT ebeln lifnr aedat kdatb kdate ernam ekorg ekgrp waers wkurs ihran
*         ihrez unsez inco1 inco2 zterm zbd1t zbd2t zbd3t zbd1p zbd2p
*         angdt bsart bukrs
*  APPENDING CORRESPONDING FIELDS OF TABLE t_ekko
*  FROM ekko
*  WHERE lifnr EQ prov
*  AND ebeln IN r_ebeln
*  AND aedat IN r_aedat
*  AND bukrs IN r_bukrs
*  AND bstyp EQ 'A'
** AND bsart EQ 'AN'
*  ORDER BY aedat DESCENDING.
  zcl_qry_rfq_list=>ekko2( EXPORTING i_operacion = 'READ'
                                     i_bukrs = company
                                     i_start = star_date
                                     i_end = end_date
                                     i_ebeln = quotation
                                     i_lifnr = vendor
                           IMPORTING et_pedidos_cab = DATA(t_ekko2) ).
  APPEND LINES OF t_ekko2 TO t_ekko.
  SORT t_ekko BY aedat DESCENDING.

  LOOP AT t_ekko INTO ls_ekko WHERE waers EQ space.
*    SELECT SINGLE * FROM lfm1
*    WHERE lifnr EQ t_ekko-lifnr
*    AND   ekorg EQ t_ekko-ekorg.
    zcl_qry_rfq_list=>lfm1( EXPORTING i_operacion = 'READ'
                                     i_lifnr = ls_ekko-lifnr
                                     i_ekorg = ls_ekko-ekorg
                           IMPORTING e_waers = DATA(lv_waers) ).
    CHECK sy-subrc EQ 0.
*    MOVE lfm1-waers TO t_ekko-waers.
    ls_ekko-waers = lv_waers.
    MODIFY t_ekko FROM ls_ekko.
  ENDLOOP.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SELECCIONA_DETALLE
*&---------------------------------------------------------------------*
FORM selecciona_detalle  USING   status quotation.
  DATA: cont LIKE sy-tabix.
  CLEAR: ls_ekpo2, t_ekpo.
  IF t_ekko[] IS INITIAL.
    l_message = 'No se encontró información'.
  ELSE.

    cont = 1.
*- Todas
*    IF status = 'T'.
*      SELECT ebeln ebelp matnr txz01 ktmng netpr agmem
*             peinh bprme pstyp packno werks meins adrn2 bednr idnlf
*             plifz mwskz agdat
*       INTO t_ekpo
*       FROM  ekpo FOR ALL ENTRIES IN t_ekko
*       WHERE ebeln EQ t_ekko-ebeln
*       AND   loekz EQ space.
*        IF NOT r_ebeln IS INITIAL.
*          APPEND t_ekpo.
*        ELSEIF cont <= l_rec AND date EQ space.
*          APPEND t_ekpo.
*        ELSEIF date NE space.
*          APPEND t_ekpo.
*        ELSE.
*          EXIT.
*        ENDIF.
*        ADD 1 TO cont.
*      ENDSELECT.
*    ENDIF.

*- Vencidas
*    IF status = 'V'.
*      SELECT ebeln ebelp matnr txz01 ktmng netpr agmem
*             peinh bprme pstyp packno werks meins adrn2 bednr idnlf
*             plifz mwskz agdat
*       INTO t_ekpo
*       FROM  ekpo FOR ALL ENTRIES IN t_ekko
*       WHERE ebeln EQ t_ekko-ebeln
*       AND   loekz EQ space
*       AND   agdat < sy-datum.
*        IF NOT r_ebeln IS INITIAL.
*          APPEND t_ekpo.
*        ELSEIF cont <= l_rec AND date EQ space.
*          APPEND t_ekpo.
*        ELSEIF date NE space.
*          APPEND t_ekpo.
*        ELSE.
*          EXIT.
*        ENDIF.
*        ADD 1 TO cont.
*      ENDSELECT.
*    ENDIF.

*- sin cotización
*    IF status = 'S'.
*      SELECT ebeln ebelp matnr txz01 ktmng netpr agmem
*             peinh bprme pstyp packno werks meins adrn2 bednr idnlf
*             plifz mwskz agdat
*      INTO  t_ekpo
*      FROM ekpo FOR ALL ENTRIES IN t_ekko
*      WHERE ebeln EQ t_ekko-ebeln
*      AND netpr EQ 0
*      AND loekz EQ space
*      AND agdat >= sy-datum.
*        IF NOT r_ebeln IS INITIAL.
*          APPEND t_ekpo.
*        ELSEIF cont <= l_rec AND date EQ space.
*          APPEND t_ekpo.
*        ELSEIF date NE space.
*          APPEND t_ekpo.
*        ELSE.
*          EXIT.
*        ENDIF.
*        ADD 1 TO cont.
*      ENDSELECT.
*    ENDIF.

*- con cotización
*    IF status = 'C'.
*      SELECT ebeln ebelp matnr txz01 ktmng netpr agmem
*             peinh bprme pstyp packno werks meins adrn2 bednr idnlf
*             plifz mwskz agdat
*      INTO t_ekpo
*      FROM ekpo
*      FOR ALL ENTRIES IN t_ekko
*      WHERE ebeln EQ t_ekko-ebeln
*      AND netpr NE 0
*      AND loekz EQ space
*      AND agdat >= sy-datum.
*        IF NOT r_ebeln IS INITIAL.
*          APPEND t_ekpo.
*        ELSEIF cont <= l_rec AND date EQ space.
*          APPEND t_ekpo.
*        ELSEIF date NE space.
*          APPEND t_ekpo.
*        ELSE. .
*          EXIT.
*        ENDIF.
*        ADD 1 TO cont.
*      ENDSELECT.
*    ENDIF.
    zcl_qry_rfq_list=>ekpo( EXPORTING i_operacion = 'READ'
                                      it_ekko = t_ekko
                                      i_status = status
                            IMPORTING et_ekpo = DATA(t_ekpo_aux) ).
    LOOP AT t_ekpo_aux INTO DATA(ls_ekpo_aux).
      IF NOT quotation IS INITIAL.
        APPEND ls_ekpo_aux TO t_ekpo.
      ELSEIF cont <= l_rec AND date EQ space.
        APPEND ls_ekpo_aux TO t_ekpo.
      ELSEIF date NE space.
        APPEND ls_ekpo_aux TO t_ekpo.
      ELSE.
        EXIT.
      ENDIF.
      ADD 1 TO cont.
    ENDLOOP.

    SORT t_ekpo BY ebeln ebelp.

*-  Lineas de servicio
    PERFORM obtiene_lineas_de_servicio.

    PERFORM llena_tabla.

* lineas de servicios
    PERFORM inserta.

*  Verificar si se va a mostrar algun anexo y localizarlo
*  perform attachment.

  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  OBTIENE_LINEAS_DE_SERVICIO
*&---------------------------------------------------------------------*
FORM obtiene_lineas_de_servicio .

  CLEAR: gt_esll, gs_esll.
  LOOP AT t_ekpo INTO ls_ekpo2 WHERE pstyp = '9'.
*    CLEAR: esll-packno, esll-sub_packno.
*    SELECT packno sub_packno INTO (esll-packno, esll-sub_packno)
*    FROM esll
*    WHERE packno EQ ls_ekpo2-packno.
*    ENDSELECT.
    CLEAR gt_esll.
    zcl_qry_po_detail=>esll( EXPORTING i_operacion = 'READ'
                                       i_packno = ls_ekpo2-packno
                             IMPORTING et_esll = gt_esll ).
    READ TABLE gt_esll INTO gs_esll WITH KEY packno = ls_ekpo2-packno.
    IF sy-subrc EQ 0.
      ls_esll-packno = gs_esll-packno.
      ls_esll-sub_packno = gs_esll-sub_packno.
      APPEND ls_esll TO t_esll.
    ENDIF.
  ENDLOOP.
  READ TABLE t_esll INTO ls_esll INDEX 1.
  IF sy-subrc EQ 0.
    CLEAR: t_esll2, ls_esll2.
    LOOP AT t_esll INTO ls_esll.
*      CLEAR esll.
*      SELECT packno introw extrow ktext1 menge tbtwr meins
*      INTO CORRESPONDING FIELDS OF t_esll2
*      FROM esll
*      WHERE packno EQ t_esll-sub_packno.
*        MOVE: t_esll-packno TO t_esll2-key.
*        PERFORM unidad_medida USING t_esll2-meins.
*        APPEND t_esll2.
*      ENDSELECT.
      zcl_qry_po_detail=>esll( EXPORTING i_operacion = 'READ'
                                         i_packno = ls_esll-sub_packno
                               IMPORTING et_esll = DATA(lt_esll_aux) ).
      LOOP AT lt_esll_aux INTO gs_esll.
        MOVE-CORRESPONDING gs_esll TO ls_esll2.
        ls_esll2-key = ls_esll-packno.
        PERFORM unidad_medida USING ls_esll2-meins.
        APPEND ls_esll2 TO t_esll2.
      ENDLOOP.
    ENDLOOP.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  LLENA_TABLA
*&---------------------------------------------------------------------*
FORM llena_tabla .
  DATA: v_hoy LIKE sy-datum.
  v_hoy = sy-datum.

  CLEAR: t_oferta, ls_oferta.
  LOOP AT t_ekpo INTO ls_ekpo2.
    ls_ekpo2-matnr = ls_ekpo2-matnr.
    SHIFT ls_ekpo2-matnr LEFT DELETING LEADING '0'.
*
    PERFORM status_ofta USING ls_ekpo2-agmem.
*
    MOVE-CORRESPONDING ls_ekpo2 TO ls_oferta.
    PERFORM unidad_medida USING ls_oferta-meins.

*- verifica anexos
    AT NEW ebeln.
      PERFORM attach USING ls_oferta-ebeln ls_oferta-ebelp ls_oferta-atch ls_oferta-banfn.
    ENDAT.

    ls_oferta-agtxt = gv_agtxt.
*- dias de entrega
*    t_oferta-bednr = t_ekpo-IDNLF.

    READ TABLE t_ekko INTO ls_ekko WITH KEY ebeln = ls_ekpo2-ebeln.
*    IF sy-subrc EQ 0.
    IF v_hoy > ls_ekpo2-agdat. "t_ekko-angdt." Quot.Deadl.
      ls_oferta-stat = 'V'.
    ELSE.
      ls_oferta-stat = 'A'.
    ENDIF.
    MOVE-CORRESPONDING ls_ekko TO ls_oferta.
    IF NOT ls_ekpo2-agdat IS INITIAL.
      ls_oferta-angdt = ls_ekpo2-agdat.
    ENDIF.
*    ENDIF.
*
*    PERFORM busca_comprador.
*
    PERFORM put_pstyp USING ls_ekpo2-pstyp ls_oferta-pstyp ls_oferta-xbsart.
*
*    PERFORM agrega_direccion.
*
    PERFORM fecha_entrega USING ls_oferta-eindt ls_oferta-ebeln ls_oferta-ebelp.

*  valida el estatus de la requisición
*    CLEAR eket.
*    SELECT SINGLE banfn bnfpo INTO (eket-banfn, eket-bnfpo)
*    FROM eket
*    WHERE ebeln EQ t_ekpo-ebeln
*    AND   ebelp EQ t_ekpo-ebelp.
    zcl_qry_rfq_list=>eket( EXPORTING i_operacion = 'READ'
                                    i_ebeln = ls_ekpo2-ebeln
                                    i_ebelp = ls_ekpo2-ebelp
                          IMPORTING e_banfn = DATA(lv_banfn)
                                    e_bnfpo = DATA(lv_bnfpo)  ).
    IF NOT lv_banfn IS INITIAL.
*-     verifica si la oferta ya fue colocada
*      SELECT SINGLE statu ebeln INTO (eban-statu, eban-ebeln)
*      FROM eban
*      WHERE banfn EQ eket-banfn
*      AND   bnfpo EQ eket-bnfpo.
      zcl_qry_rfq_list=>eban( EXPORTING i_operacion = 'READ'
                                    i_banfn = lv_banfn
                                    i_bnfpo = lv_bnfpo
                          IMPORTING e_statu = DATA(lv_statu)  ).
      IF lv_statu NE 'B'.
*        if EBAN-EBELN is initial.
        APPEND ls_oferta TO t_oferta.
      ENDIF.
    ELSE.
      APPEND ls_oferta TO t_oferta.
    ENDIF.

  ENDLOOP.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  STATUS_OFTA
*&---------------------------------------------------------------------*
FORM status_ofta USING p_agmem.
  CLEAR gv_agtxt.
*  SELECT agtxt INTO (tmamt-agtxt)
*   FROM tmamt
*    WHERE agmem EQ t_ekpo-agmem.
*  ENDSELECT.
  zcl_qry_rfq_list=>tmamt( EXPORTING i_operacion = 'READ'
                                     i_agmem = p_agmem
                           IMPORTING e_agtxt = gv_agtxt  ).

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  ATTACH
*&---------------------------------------------------------------------*
*      Verifica si tiene attachments la Oferta
*----------------------------------------------------------------------*
*      --> P_OFERTA  Oferta
*      <-- P_ATCH    Flag (X = tiene anexos)
*----------------------------------------------------------------------*
FORM attach  USING  p_oferta p_pos p_atch p_req.
  CLEAR  p_atch.

* 06.2022 Cambia la extracción de los anexos en ofertas, se extrae
*         de la requisición y no de la oferta

*  SELECT SINGLE banfn INTO eket-banfn FROM eket
*    WHERE ebeln EQ p_oferta
*    AND   ebelp EQ p_pos.
  zcl_qry_rfq_list=>eket( EXPORTING i_operacion = 'READ'
                                    i_ebeln = p_oferta
                                    i_ebelp = p_pos
                          IMPORTING e_banfn = DATA(lv_banfn)  ).
  IF NOT lv_banfn IS INITIAL.
    p_req = lv_banfn.
*    SELECT instid_b INTO srgbtbrel-instid_b
*    FROM srgbtbrel
*    WHERE reltype EQ 'ATTA'
*    AND   instid_a EQ eket-banfn.
*      MOVE 'X' TO p_atch.
*    ENDSELECT.
    zcl_qry_rfq_list=>srgbtbrel( EXPORTING i_operacion = 'READ'
                                    i_reltype = 'ATTA'
                                    i_banfn = lv_banfn
                          IMPORTING e_atch = p_atch  ).
  ENDIF.
* 06.2022

*- Lee los nombres de los archivos
*select INSTID_B into SRGBTBREL-INSTID_B
*from SRGBTBREL
*where RELTYPE eq 'ATTA'
*and   INSTID_A eq P_OFERTA.
*   move 'X' to P_ATCH.
*endselect.

ENDFORM.                    " ATTACH
*&---------------------------------------------------------------------*
*&      Form  PUT_PSTYP
*&---------------------------------------------------------------------*
FORM put_pstyp  USING   input output text.
  CLEAR: output, text.
*  SELECT SINGLE epstp ptext
*  INTO (output, text)
*  FROM t163y
*  WHERE spras EQ p_lan
*  AND   pstyp EQ input.

  zcl_qry_rfq_list=>t163y( EXPORTING i_operacion = 'READ'
                                     i_spras = p_lan
                                     i_pstyp = input
                           IMPORTING e_epstp = output
                                     e_ptext = text  ).

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  FECHA_ENTREGA
*&---------------------------------------------------------------------*
FORM fecha_entrega USING p_eindt p_ebeln p_ebelp.
*  CLEAR t_oferta-eindt.

*  SELECT eindt INTO t_oferta-eindt
*  FROM eket
*  WHERE ebeln EQ t_oferta-ebeln
*  AND   ebelp EQ t_oferta-ebelp.
*  ENDSELECT.

  zcl_qry_rfq_list=>eket( EXPORTING i_operacion = 'READ'
                                    i_ebeln = p_ebeln
                                    i_ebelp = p_ebelp
                          IMPORTING e_eindt = p_eindt ).

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  INSERTA
*&---------------------------------------------------------------------*
FORM inserta .
  DATA: ind     LIKE sy-tabix, jj LIKE sy-tabix, stat(1), idnlf LIKE zekpo-idnlf.

  LOOP AT t_oferta INTO ls_oferta WHERE ebeln <> space AND packno <> space.
    ind = sy-tabix.
    jj   = ind + 1.
    stat = ls_oferta-stat.
    idnlf = ls_oferta-idnlf.
    LOOP AT t_esll2 INTO ls_esll2 WHERE key = ls_oferta-packno.
      CLEAR ls_oferta.
      ls_oferta-bprme = ls_esll2-meins.
      ls_oferta-meins = ls_esll2-meins.
      ls_oferta-ebelp = ls_esll2-extrow.
      ls_oferta-txz01 = ls_esll2-ktext1.
      ls_oferta-ktmng = ls_esll2-menge.
      ls_oferta-packno = ls_esll2-key.
      ls_oferta-netpr = ls_esll2-tbtwr.
      ls_oferta-pstyp = '9'.
      ls_oferta-stat = stat.
      ls_oferta-idnlf = idnlf.
*           idnlf          TO t_oferta-bednr.
      INSERT ls_oferta INTO t_oferta INDEX jj.
      jj = jj + 1.
      CLEAR ls_esll2.
    ENDLOOP.
  ENDLOOP.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  LLENA_RANGOS
*&---------------------------------------------------------------------*
FORM llena_rangos  USING    p_bukrs
                            v_fec
                            fec_ini
                            fec_fin.
* --- Llenda Sociedades
  CLEAR: r_bukrs, ls_bukrs.
  IF p_bukrs IS NOT INITIAL.
    ls_bukrs-sign   = 'I'.
    ls_bukrs-option = 'EQ'.
    ls_bukrs-low    =  p_bukrs.
    APPEND ls_bukrs TO r_bukrs.
  ENDIF.

  CLEAR: sbudat, pgjahr.
  ls_sbudat-sign   = 'I'.
  ls_sbudat-option = 'BT'.
  IF fec_ini IS INITIAL AND fec_fin IS INITIAL.
* toma en cuenta el periodo
    CASE v_fec.
      WHEN '1'.  " 1 mes
        fec_ent1 = sy-datum - 31.
      WHEN '2'.  " 3 meses
        fec_ent1 = sy-datum - 93.
      WHEN '3'.  " 6 meses
        fec_ent1 = sy-datum - 186.
    ENDCASE.
    fec_ent2 = sy-datum.
    ls_sbudat-low    = fec_ent1.
    ls_sbudat-high   = fec_ent2.
    APPEND ls_sbudat TO sbudat.

    IF fec_ent1(4) EQ fec_ent2(4).
*- si son los primeros 6 meses del año
      IF fec_ent1+4(2) <= 6.
        ls_pgjahr-sign   = 'I'.
        ls_pgjahr-option = 'BT'.
        ls_pgjahr-low  = fec_ent1(4) - 1.
        ls_pgjahr-high = fec_ent2(4).
        APPEND ls_pgjahr TO pgjahr.
      ELSE.
        ls_pgjahr-sign   = 'I'.
        ls_pgjahr-option = 'EQ'.
        ls_pgjahr-low    = fec_ent1(4).
        APPEND ls_pgjahr TO pgjahr.
      ENDIF.
    ELSE.
      ls_pgjahr-sign   = 'I'.
      ls_pgjahr-option = 'BT'.
      ls_pgjahr-low  = fec_ent1(4).
      ls_pgjahr-high = fec_ent2(4).
      APPEND ls_pgjahr TO pgjahr.
    ENDIF.


  ELSE.
* toma en cuenta los parametros
    ls_sbudat-low    = fec_ini.
    ls_sbudat-high   = fec_fin.
    APPEND ls_sbudat TO sbudat.

    IF fec_ini(4) EQ fec_fin(4).
*-   si son los primeros 6 meses del año
      IF fec_ini+4(2) <= 6.
        ls_pgjahr-sign   = 'I'.
        ls_pgjahr-option = 'BT'.
        ls_pgjahr-low  = fec_ini(4) - 1.
        ls_pgjahr-high = fec_ini(4).
        APPEND ls_pgjahr TO pgjahr.
      ELSE.
        ls_pgjahr-sign   = 'I'.
        ls_pgjahr-option = 'EQ'.
        ls_pgjahr-low    = fec_ini(4).
        APPEND ls_pgjahr TO pgjahr.
      ENDIF.

    ELSE.
      ls_pgjahr-sign   = 'I'.
      ls_pgjahr-option = 'BT'.
      ls_pgjahr-low  = fec_ini(4).
      ls_pgjahr-high = fec_fin(4).
      APPEND ls_pgjahr TO pgjahr.
    ENDIF.

  ENDIF.
* --- Llena Tipo de Documento.

*  sbsart-sign   = 'I'.
*  SBSART-OPTION = 'EQ'.
*  sbsart-low    = 'NB'.
*  append sbsart.

* --- Llena Clase de Documento
  ls_sblart-sign   = 'I'.
  ls_sblart-option = 'EQ'.
  ls_sblart-low    = 'KT'. APPEND ls_sblart TO sblart.
  ls_sblart-low    = 'KA'. APPEND ls_sblart TO sblart.
  ls_sblart-low    = 'KC'. APPEND ls_sblart TO sblart.
  ls_sblart-low    = 'KS'. APPEND ls_sblart TO sblart.
  ls_sblart-low    = 'KB'. APPEND ls_sblart TO sblart.
  ls_sblart-low    = 'KZ'. APPEND ls_sblart TO sblart.
  ls_sblart-low    = 'ZC'. APPEND ls_sblart TO sblart.
  ls_sblart-low    = 'ZU'. APPEND ls_sblart TO sblart.
  ls_sblart-low    = 'ZT'. APPEND ls_sblart TO sblart.
  ls_sblart-low    = 'ZP'. APPEND ls_sblart TO sblart.
  ls_sblart-low    = 'AB'. APPEND ls_sblart TO sblart.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  GET_INFO_P
*&---------------------------------------------------------------------*
FORM get_info_p  USING    v_user v_bukrs v_fec fec_ini fec_fin p_lan.

  PERFORM select_bsik USING v_bukrs fec_ini fec_fin v_fec.

  PERFORM prepara_arch_3 USING p_lan.    " Archivo de In Procces Payment

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SELECT_BSIK
*&---------------------------------------------------------------------*
FORM select_bsik USING p_bukrs p_fecha_ini p_fecha_fin p_period.
  CLEAR: tbsik, ls_bsik.
  DATA: gjahr TYPE gjahr.


*  SELECT bukrs lifnr zuonr belnr xblnr wrbtr waers shkzg zfbdt
*         zbd1t gjahr buzei ebelp ebeln zekkn sgtxt zlspr bldat
*         FROM bsik APPENDING CORRESPONDING FIELDS OF TABLE tbsik WHERE
*                                  lifnr EQ prov AND
*                                   bukrs IN r_bukrs AND
*                                   budat IN sbudat  AND
*                                ( ( umsks = 'A' AND umskz = 'F' ) OR
*                                  ( umsks = ' ' AND umskz = ' ' ) ).
  zcl_qry_payment=>bsik( EXPORTING i_operacion = 'READ'
                                   i_bukrs = p_bukrs
                                   i_lifnr = prov
                                   i_start = p_fecha_ini
                                   i_end = p_fecha_fin
                                   i_period = p_period
                         IMPORTING et_bsik = tbsik ).

  CLEAR: p_belnr, ls_belnr.
  ls_belnr-sign   = 'I'.
  ls_belnr-option = 'EQ'.
*

  CLEAR idx.
  SORT tbsik BY belnr.
  LOOP AT tbsik INTO ls_bsik.
    idx = sy-tabix.
    gjahr = ls_bsik-gjahr.
    AT END OF belnr.
      ls_belnr-low = ls_bsik-belnr.
      ls_belnr-gjahr = gjahr.
      APPEND ls_belnr TO p_belnr.
    ENDAT.

    ls_bsik-fecha = ls_bsik-zfbdt + ls_bsik-zbd1t.

    IF ls_bsik-shkzg = 'S'.
      ls_bsik-wrbtr = ls_bsik-wrbtr * ( -1 ).
    ENDIF.

    MODIFY tbsik FROM ls_bsik INDEX idx.

  ENDLOOP.

* referencia de doc contable
  LOOP AT p_belnr INTO ls_belnr.
*    SELECT awkey gjahr INTO  (bkpf-awkey, bkpf-gjahr) FROM bkpf
*         WHERE bukrs IN r_bukrs
*         AND   belnr EQ p_belnr-low
*         AND   gjahr EQ p_belnr-gjahr.
    zcl_qry_payment=>bkpf( EXPORTING i_operacion = 'READ'
                                   i_bukrs = p_bukrs
                                   i_belnr = ls_belnr-low
                                   i_gjahr = ls_belnr-gjahr
                         IMPORTING et_bkpf = DATA(lt_bkpf) ).
    LOOP AT lt_bkpf INTO DATA(ls_bkpf).
      ls_ekbe1-belnr = ls_bkpf-awkey(10).

*      SELECT menge INTO t_ekbe1-menge FROM ekbe
*      WHERE belnr EQ t_ekbe1-belnr   "IN p_belnr.
*      AND   gjahr EQ bkpf-gjahr.
      zcl_qry_payment=>ekbe( EXPORTING i_operacion = 'READ'
                                   i_belnr = ls_belnr-low
                                   i_gjahr = ls_belnr-gjahr
                         IMPORTING et_ekbe = DATA(lt_ekbe) ).
      LOOP AT lt_ekbe INTO DATA(ls_ekbe).
        ls_ekbe1-belnr = ls_belnr-low.
        ls_ekbe1-menge = ls_ekbe-menge.
        APPEND ls_ekbe1 TO t_ekbe1.
      ENDLOOP.
*      ENDSELECT.
*- si no lo encuentra deja la cantidad en cero, esto porque fue creado
*- con la transaccion MR01 y es de consignación
*- En este caso dejar mostrar el importe aún cuando la cantidad sea 0.
*    check sy-subrc ne 0.
*    delete tbsik where belnr = p_belnr-low.
*    ENDSELECT.
    ENDLOOP.
  ENDLOOP.
  CLEAR idx.
  LOOP AT t_ekbe1 INTO ls_ekbe1.
    AT END OF belnr.
*      SUM.

      READ TABLE tbsik INTO ls_bsik WITH KEY belnr = ls_ekbe1-belnr.
      idx = sy-tabix.
      CHECK sy-subrc = 0.
      LOOP AT t_ekbe1 INTO DATA(ls_ekbe2) WHERE belnr = ls_ekbe1-belnr.
        ls_bsik-menge = ls_bsik-menge + ls_ekbe2-menge.
      ENDLOOP.
      MODIFY tbsik FROM ls_bsik INDEX idx.
    ENDAT.
  ENDLOOP.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  PREPARA_ARCH_3
*&---------------------------------------------------------------------*
FORM prepara_arch_3  USING    p_lan.
  DATA: tot_mxp   LIKE zst_bsik_payment-wrbtr, tot_usd LIKE zst_bsik_payment-wrbtr, moneda(5).

  CLEAR: tot_mxp, tot_usd, tarch3, ls_tarch3.

  SORT tbsik BY lifnr ASCENDING fecha DESCENDING.
  LOOP AT tbsik INTO ls_bsik.
    MOVE-CORRESPONDING ls_bsik TO ls_tarch3.
*    WRITE tbsik-wrbtr TO tarch3-wrbtr.
*    perform BUSCA_BLOQUEO using tbsik-ZLSPR tarch3-TEXTL P_LAN.
*    PERFORM BUSCA_PLANTA USING TBSIK-BUKRS TARCH3-BUTXT.
    PERFORM busca_orden_compra USING ls_bsik-bukrs ls_bsik-belnr
                                     ls_bsik-gjahr ls_tarch3-ebeln
                                     ls_tarch3-menge.

    APPEND ls_tarch3 TO tarch3.
  ENDLOOP.

*- ordena por estatus
*  sort tarch3 by TEXTL belnr.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  BUSCA_ORDEN_COMPRA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM busca_orden_compra  USING  p_bukrs p_belnr p_gjahr p_ebeln p_menge.

  DATA: l_awkey LIKE zes_bkpf-awkey, l_belnr LIKE zes_ekbe-belnr.
  DATA: l_menge LIKE zes_ekbe-menge, cant LIKE l_menge,
        l_ebeln LIKE zes_ekbe-ebeln.

*  SELECT awkey INTO l_awkey FROM bkpf WHERE bukrs EQ p_bukrs
*                                        AND belnr EQ p_belnr
*                                        AND gjahr EQ p_gjahr.
*  ENDSELECT.

  CLEAR: p_ebeln, p_menge, l_ebeln, l_menge, cant.
*- asegura el número de pedido que le corresponde al doc. extrae la cant
*  SELECT ebeln menge INTO (l_ebeln, l_menge)
*  FROM bseg
*  WHERE bukrs EQ p_bukrs
*  AND   belnr EQ p_belnr
*  AND   gjahr EQ p_gjahr
*  AND   buzid EQ 'W'.
*    p_ebeln = l_ebeln.
*    p_menge = l_menge.
*  ENDSELECT.
  DATA lv_gjahr TYPE gjahr.
  lv_gjahr = p_gjahr.
  zcl_qry_payment=>bseg( EXPORTING i_operacion = 'READ'
                                   i_belnr = p_belnr
                                   i_gjahr = lv_gjahr
                                   i_bukrs = p_bukrs
                         IMPORTING e_ebeln = p_ebeln
                                   e_menge = p_menge ).

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  LIST_INFO_P
*&---------------------------------------------------------------------*
FORM list_info_p  USING p_lan lista TYPE zvts_tt_payment_p.
  CLEAR lista.
  DATA ls_lista LIKE LINE OF lista.
* Tabla
  LOOP AT tarch3 INTO ls_tarch3.
    CLEAR ls_lista.

    ls_lista-doc_number = ls_tarch3-belnr.
    ls_lista-reference  = ls_tarch3-xblnr.
    ls_lista-price      = ls_tarch3-wrbtr.
    ls_lista-curr       = ls_tarch3-waers.
    ls_lista-disc_days  = ls_tarch3-zbd1t.
    ls_lista-due_date   = ls_tarch3-fecha. "Fecha Vencimiento
    ls_lista-pay_date   = ls_tarch3-bldat.  "Fecha  Docto
    ls_lista-po         = ls_tarch3-ebeln.
    ls_lista-bp         = ls_tarch3-zlspr.
    APPEND ls_lista TO lista.
  ENDLOOP.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  GET_INFO_S
*&---------------------------------------------------------------------*
FORM get_info_s  USING  v_user v_bukrs v_fec fec_ini fec_fin p_lan.

  PERFORM select_bsak USING v_bukrs fec_ini fec_fin v_fec.

  PERFORM prepara_arch_4 USING p_lan fec_ini fec_fin v_fec.    " Archivo de Payment Sumary

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SELECT_BSAK
*&---------------------------------------------------------------------*
FORM select_bsak USING p_bukrs p_fecha_ini p_fecha_fin p_period.
  READ TABLE sbudat INTO ls_sbudat INDEX 1.
  fec1  = ls_sbudat-low.
  fec2  = ls_sbudat-high.
*
*  SELECT lifnr bukrs augdt augbl belnr gjahr buzei budat shkzg wrbtr dmbtr waers
*     xblnr zuonr sgtxt zlspr bldat zfbdt
*     FROM bsak APPENDING CORRESPONDING FIELDS OF TABLE tbsak WHERE
*                            lifnr EQ prov          AND
*                            budat IN sbudat        AND
**                              budat ge fec1          and
**                              budat le fec2          and
*                            bukrs IN r_bukrs        AND
*                            blart IN sblart         AND
*                            umsks NE 'A'            AND  "Anulación Anticipo
*                            umskz NE 'A'.
  zcl_qry_payment=>bsak( EXPORTING i_operacion = 'READ'
                                   i_bukrs = p_bukrs
                                   i_lifnr = prov
                                   i_start = p_fecha_ini
                                   i_end = p_fecha_fin
                                   i_period = p_period
                         IMPORTING et_bsak = tbsak ).
*                              xzahl eq 'X'           and
**-Se bloquea para ver todos los pagos del proveedor
**                             xragl NE 'X'.          " AND
**--------------------------------------------------
*                                SHKZG EQ 'S'.
  CLEAR idx.
  LOOP AT tbsak INTO ls_bsak.
    IF ls_bsak-belnr EQ ls_bsak-augbl.
      idx = sy-tabix.
*      SELECT  kursf stblg
*      INTO (p_kursf, bkpf-stblg)
*      FROM bkpf WHERE bukrs = tbsak-bukrs
*                AND   belnr = tbsak-belnr         "AND
*                AND   gjahr = tbsak-gjahr.
**                              BLART IN SBLART.
*      ENDSELECT.
      zcl_qry_payment=>bkpf2( EXPORTING i_operacion = 'READ'
                                   i_bukrs = ls_bsak-bukrs
                                   i_belnr = ls_bsak-belnr
                                   i_gjahr = ls_bsak-gjahr
                         IMPORTING e_kursf = p_kursf
                                   e_stblg = DATA(lv_stblg) ).
      ls_bsak-kursf = p_kursf.
      MODIFY tbsak FROM ls_bsak INDEX idx.
      IF NOT lv_stblg IS INITIAL.
        DELETE tbsak INDEX idx.
      ENDIF.
    ELSE.
      DELETE tbsak INDEX idx.
    ENDIF.
  ENDLOOP.

*- selecciona anticipos
*  SELECT lifnr augdt augbl belnr gjahr buzei budat shkzg wrbtr waers xblnr zlspr bldat zfbdt
*     FROM bsak APPENDING CORRESPONDING FIELDS OF TABLE tbsak2 WHERE
*                            lifnr EQ prov          AND
*                            umsks EQ 'A'           AND
*                            umskz EQ 'F'           AND
*                            budat GE fec1          AND
*                            budat LE fec2          AND
*                            bukrs IN r_bukrs       AND
*                            xanet EQ 'X'.
**                                XZAHL EQ 'X'           AND
**                                XRAGL NE 'X'.
  zcl_qry_payment=>bsak2( EXPORTING i_operacion = 'READ'
                                   i_bukrs = p_bukrs
                                   i_lifnr = prov
                                   i_start = p_fecha_ini
                                   i_end = p_fecha_fin
                                   i_period = p_period
                         IMPORTING et_bsak = tbsak2 ).
  SORT tbsak BY augbl.
  LOOP AT tbsak2 INTO ls_bsak2.
    READ TABLE tbsak INTO ls_bsak WITH KEY augbl = ls_bsak2-augbl BINARY SEARCH.
    IF sy-subrc EQ 0.
*     Dado que los anticipos son negativos para la empresa, pero positivos
*     para el proveedor se decidio mutiplicar por "-1" cuando son antici
*     pos y son 'H', ya al momento de generar el archivo se esta mutltip
*     cando por '-1' para que se genere correctamente.
      IF ls_bsak2-shkzg = 'H'.
        ls_bsak2-wrbtr = ls_bsak2-wrbtr * ( -1 ).
      ENDIF.
*
      MOVE-CORRESPONDING ls_bsak2 TO ls_bsak.
      APPEND ls_bsak TO tbsak.
    ENDIF.
  ENDLOOP.
  CLEAR tbsak2.

*  LOOP AT tbsak.
*    SELECT SINGLE ktokk INTO lfa1-ktokk
*                        FROM lfa1 WHERE lifnr = tbsak-lifnr.
*    IF sy-subrc EQ 0 AND lfa1-ktokk = 'MPI'.
*      MOVE ' 1.00000' TO tbsak-kursf.
*      MODIFY tbsak.
*    ENDIF.
*  ENDLOOP.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  PREPARA_ARCH_4
*&---------------------------------------------------------------------*
FORM prepara_arch_4  USING    p_lan p_fecha_ini p_fecha_fin p_period.
  SORT tbsak BY lifnr ASCENDING budat DESCENDING.
  LOOP AT tbsak INTO ls_bsak.
    IF ls_bsak-shkzg = 'H'.
      ls_bsak-wrbtr = ls_bsak-wrbtr * ( -1 ).
    ENDIF.
    MOVE-CORRESPONDING ls_bsak TO ls_tarch4_2.
*    move space to tarch4_1-buzei.
    COLLECT ls_tarch4_2 INTO tarch4_2.
*    APPEND TARCH4.
  ENDLOOP.
*
  LOOP AT tarch4_2 INTO ls_tarch4_2.
    READ TABLE tbsak INTO ls_bsak WITH KEY augbl = ls_tarch4_2-augbl.
    IF sy-subrc EQ 0.
      MOVE-CORRESPONDING ls_bsak TO ls_tarch4.
*      move space to tarch4-buzei.
      ls_tarch4-wrbtr = ls_tarch4_2-wrbtr.
      ls_tarch4-bldat = ls_bsak-augdt.
      PERFORM busca_planta USING ls_tarch4-bukrs ls_tarch4-butxt.
      APPEND ls_tarch4 TO tarch4.
    ENDIF.
  ENDLOOP.


  CLEAR: tbsak2, p_belnr, ls_ekbe1.
  CLEAR: tbsak2, p_belnr, t_ekbe1.

  ls_belnr-sign   = 'I'.
  ls_belnr-option = 'EQ'.

  READ TABLE sbudat INTO ls_sbudat INDEX 1.
  fec1  = ls_sbudat-low.
  fec2  = ls_sbudat-high.
*
  LOOP AT tbsak INTO ls_bsak.
*  LOOP AT TARCH4.
    CLEAR ls_bsak2.
*    SELECT lifnr bukrs augdt augbl belnr gjahr buzei budat shkzg wrbtr dmbtr waers
*           xblnr ebeln ebelp zekkn zuonr sgtxt zlspr bldat zfbdt
*        FROM bsak APPENDING CORRESPONDING FIELDS OF TABLE tbsak2
*                         WHERE bukrs EQ tbsak-bukrs  AND
*                              lifnr EQ prov          AND
*                              augbl EQ tbsak-augbl   AND
*                              gjahr  IN pgjahr        "en el caso de brinco de año
*                               ORDER BY xblnr.
**-- se bloquea validar oper. pago
***-                           xzahl NE 'X'           AND
***-                           xragl NE 'X'.       "    AND
***--------------------------------------------------------
**                                SHKZG EQ 'H'.              DLR04.12.00
    zcl_qry_payment=>bsak3( EXPORTING i_operacion = 'READ'
                                   i_bukrs = ls_bsak-bukrs
                                   i_lifnr = prov
                                   i_start = p_fecha_ini
                                   i_end = p_fecha_fin
                                   i_period = p_period
                                   i_augbl = ls_bsak-augbl
                         IMPORTING et_bsak = tbsak2 ).
    LOOP AT tbsak2 INTO ls_bsak2 WHERE belnr EQ ls_bsak-augbl.
      DELETE tbsak2 INDEX sy-tabix.
    ENDLOOP.

  ENDLOOP.

*- valida si encontro detalle
  LOOP AT tarch4 INTO ls_tarch4.
    DATA(lv_tabix) = sy-tabix.
    LOOP AT tbsak2 INTO ls_bsak2 WHERE bukrs = ls_tarch4-bukrs AND
                         lifnr = prov         AND
                         augbl = ls_tarch4-augbl.
    ENDLOOP.
    CHECK sy-subrc NE 0.
    DELETE tarch4 INDEX lv_tabix. "FROM ls_tarch4.
  ENDLOOP.
*-

  CLEAR ls_bsak.
  CLEAR tbsak.

  tbsak[] = tbsak2[].

  SORT tbsak BY belnr.
  LOOP AT tbsak INTO ls_bsak.
    idx = sy-tabix.
    CLEAR p_kursf.
*    SELECT kursf INTO p_kursf FROM bkpf WHERE
*                              bukrs = tbsak-bukrs AND
*                              belnr = tbsak-belnr AND
**                             GJAHR = TBSAK-GJAHR AND
*                              gjahr IN pgjahr     AND
*                              blart IN sblart.            "DLR04.12.00
*      MOVE p_kursf TO tbsak-kursf.
*    ENDSELECT.
    zcl_qry_payment=>bkpf3( EXPORTING i_operacion = 'READ'
                                   i_bukrs = ls_bsak-bukrs
                                   i_belnr = ls_bsak-belnr
                         IMPORTING e_kursf = p_kursf ).
    ls_bsak-kursf = p_kursf.
**    SELECT belnr SUM( menge ) INTO (tbsak-belnr, tbsak-menge) FROM ekbe
**                                    WHERE belnr = tbsak-belnr
**                                    GROUP by belnr.
**    ENDSELECT.
*
**    SELECT SINGLE ktokk INTO lfa1-ktokk
**                        FROM lfa1 WHERE lifnr = tbsak-lifnr.
**    IF sy-subrc EQ 0 AND lfa1-ktokk = 'MPI'.
**      MOVE ' 1.00000' TO tbsak-kursf.
***       modify tbsak.
**    ENDIF.

    MODIFY tbsak FROM ls_bsak INDEX idx.

*    MOVE tbsak-belnr TO p_belnr-low.
*    APPEND p_belnr.
  ENDLOOP.

  SORT tbsak BY lifnr ASCENDING budat DESCENDING.
  LOOP AT tbsak INTO ls_bsak.
*    TBSAK-WRBTR = TBSAK-WRBTR / 10.
    IF ls_bsak-shkzg = 'S'.
      ls_bsak-wrbtr = ls_bsak-wrbtr * ( -1 ).
    ENDIF.
    MOVE-CORRESPONDING ls_bsak TO ls_c_tarch5.
*- fecha de compensación
    ls_c_tarch5-bldat = ls_bsak-augdt.
    APPEND ls_c_tarch5 TO c_tarch5.
  ENDLOOP.
*
  SORT c_tarch5 BY lifnr augbl ASCENDING budat DESCENDING.
  LOOP AT c_tarch5 INTO ls_c_tarch5.
    MOVE-CORRESPONDING ls_c_tarch5 TO ls_tarch5.
    IF ls_c_tarch5-augbl NE ls_c_tarch5-belnr.
      PERFORM busca_orden_compra USING ls_c_tarch5-bukrs ls_c_tarch5-belnr
                                       ls_c_tarch5-gjahr ls_tarch5-ebeln
                                       ls_tarch5-menge.
    ENDIF.
    APPEND ls_tarch5 TO tarch5.
  ENDLOOP.

  SORT tarch5 BY lifnr augbl.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  BUSCA_PLANTA
*&---------------------------------------------------------------------*
FORM busca_planta  USING   p_bukrs p_butxt.

*  SELECT butxt INTO p_butxt FROM t001 WHERE bukrs EQ p_bukrs.
*  ENDSELECT.
  zcl_qry_payment=>t001( EXPORTING i_operacion = 'READ'
                                   i_bukrs = p_bukrs
                         IMPORTING e_butxt = p_butxt ).

  IF sy-subrc NE 0.
    CLEAR p_butxt.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  LIST_INFO_S
*&---------------------------------------------------------------------*
FORM list_info_s  USING  lista TYPE zvts_tt_payment_s p_lan company.
  DATA:  first, cuenta(10) TYPE c VALUE '001010%', ml.
  DATA ls_lista LIKE LINE OF lista.
  CLEAR lista.

*  SELECT SINGLE waers INTO t001-waers
*    FROM t001
*    WHERE bukrs EQ company.
  zcl_qry_payment=>t001( EXPORTING i_operacion = 'READ'
                                   i_bukrs = company
                         IMPORTING e_waers = DATA(lv_waers) ).

*concatenate cuenta '%' into cuenta.
  LOOP AT tarch4 INTO ls_tarch4.
    CLEAR ls_lista.

*- Cabecera

*- obtiene el monto en la moneda Local
*    SELECT hkont dmbtr wrbtr INTO (bseg-hkont, bseg-dmbtr, bseg-wrbtr)
*    FROM bseg
*    WHERE bukrs EQ tarch4-bukrs
*    AND   belnr EQ tarch4-belnr
*    AND   gjahr EQ tarch4-gjahr
*    AND   hkont LIKE cuenta.
    zcl_qry_payment=>bseg2( EXPORTING i_operacion = 'READ'
                                   i_belnr = ls_tarch4-belnr
                                   i_gjahr = ls_tarch4-gjahr
                                   i_bukrs = ls_tarch4-bukrs
                         IMPORTING e_hkont = DATA(lv_hkont)
                                   e_dmbtr = DATA(lv_dmbtr)
                                   e_wrbtr = DATA(lv_wrbtr) ).
    ls_lista-price_ml = lv_dmbtr.
*      SELECT SINGLE txt20 INTO skat-txt20
*      FROM skat
*      WHERE spras EQ 'S'
*      AND   ktopl EQ  'PCGP'
*      AND   saknr EQ bseg-hkont.
    zcl_qry_payment=>skat( EXPORTING i_operacion = 'READ'
                                 i_saknr = lv_hkont
                       IMPORTING e_txt20 = DATA(lv_txt20) ).
    IF sy-subrc EQ 0 AND lv_txt20 CS 'MN'.
      ml = 'X'.
    ELSE.
      CLEAR ml.
    ENDIF.
*    ENDSELECT.

*    SELECT SINGLE kursf INTO bkpf-kursf
*    FROM  bkpf
*    WHERE bukrs EQ tarch4-bukrs
*    AND   belnr EQ tarch4-belnr
*    AND   gjahr EQ tarch4-gjahr.
    zcl_qry_payment=>bkpf2( EXPORTING i_operacion = 'READ'
                                   i_bukrs = ls_tarch4-bukrs
                                   i_belnr = ls_tarch4-belnr
                                   i_gjahr = ls_tarch4-gjahr
                         IMPORTING e_kursf = DATA(lv_kursf) ).

*    SELECT SINGLE bankl INTO lfbk-bankl FROM lfbk
*    WHERE lifnr EQ tarch4-lifnr
*    AND banks EQ 'MX'.
    zcl_qry_payment=>lfbk( EXPORTING i_operacion = 'READ'
                                 i_lifnr = ls_tarch4-lifnr
                       IMPORTING e_bankl = DATA(lv_bankl) ).
    IF sy-subrc EQ 0.
*      SELECT SINGLE banka INTO bnka-banka FROM bnka
*      WHERE  banks EQ 'MX'
*      AND    bankl EQ  lfbk-bankl.
      zcl_qry_payment=>bnka( EXPORTING i_operacion = 'READ'
                                 i_bankl = lv_bankl
                       IMPORTING e_banka = DATA(lv_banka) ).
      ls_lista-bank       = lv_banka.
    ENDIF.

    ls_lista-doc_number = ls_tarch4-augbl.
    ls_lista-item       = ls_tarch4-buzei.
    ls_lista-price      = ls_tarch4-wrbtr.
    ls_lista-curr       = ls_tarch4-waers.

    IF ml NE space.
      ls_lista-curr_p  = 'MXN'.
    ELSE.
      ls_lista-curr_p  = ls_tarch4-waers.
    ENDIF.

    ls_lista-ex_rate    = lv_kursf.
    ls_lista-curr_ml    = lv_waers.
    ls_lista-reference  = ls_tarch4-xblnr.
    ls_lista-post_date  = ls_tarch4-bldat. "TARCH4-zfbdt + TARCH4-zbd1t. "Fecha pago
    ls_lista-bp         = ls_tarch4-zlspr.

    APPEND ls_lista TO lista.

    CLEAR first.

* Detalle
    LOOP AT tarch5 INTO ls_tarch5 WHERE augbl = ls_tarch4-augbl.
      IF first EQ space.
        ls_lista-flag = 'X'.
        APPEND ls_lista TO lista.
        first = 'X'.
      ENDIF.
      CLEAR ls_lista.

      ls_lista-reference = ls_tarch5-xblnr.
      ls_lista-post_date = ls_tarch5-bldat. "Fecha del docto compensación
      ls_lista-price     = ls_tarch5-wrbtr.
      ls_lista-curr      = ls_tarch5-waers.
      ls_lista-assigment = ls_tarch5-zuonr.
      ls_lista-po        = ls_tarch5-ebeln.
      ls_lista-bp        = ls_tarch5-zlspr.

      APPEND ls_lista TO lista.

    ENDLOOP.
  ENDLOOP.
ENDFORM.

FORM mask_qty  USING   p_qty.
  DATA lv_dcpfm TYPE c.
*  SELECT SINGLE * FROM usr01 WHERE bname = sy-uname.
*  zcl_qry_rfq_send=>usr01( EXPORTING i_operacion = 'READ' IMPORTING lv_dcpfm = lv_dcpfm ).
*
*  IF sy-subrc EQ 0.
*    CASE lv_dcpfm.
*      WHEN 'Y'.
*        REPLACE ',' WITH ' ' INTO p_qty.
*        REPLACE '.' WITH ',' INTO p_qty.
*      WHEN 'X'.
*      WHEN space.
*        REPLACE ',' WITH '.' INTO p_qty.
*        REPLACE '.' WITH ',' INTO p_qty.
*    ENDCASE.
*  ENDIF.

ENDFORM.

FORM dynpro  USING  dynbegin name value.
  IF dynbegin = 'X'.
    CLEAR: bdc_str.
    bdc_str-program = name.
    bdc_str-dynpro = value.
    bdc_str-dynbegin = 'X'.
    APPEND bdc_str TO bdc_tab.
  ELSE.
    CLEAR: bdc_str.
    bdc_str-fnam = name.
    bdc_str-fval = value.
    APPEND bdc_str TO bdc_tab.
  ENDIF.

ENDFORM.

FORM edit_error  USING  mensaje.

*  CALL FUNCTION 'MESSAGE_TEXT_BUILD'
*    EXPORTING
*      msgid               = sy-msgid
*      msgnr               = sy-msgno
*      msgv1               = sy-msgv1
*      msgv2               = sy-msgv2
*      msgv3               = sy-msgv3
*      msgv4               = sy-msgv4
*    IMPORTING
*      message_text_output = ls_error-message
*    EXCEPTIONS
*      OTHERS              = 1.

  mensaje = ls_error-message.
*  MOVE ls_error-message TO mensaje.
ENDFORM.

FORM save_text_rfq.
  DATA: txt_add      TYPE sy-tabix, x_sub_packno TYPE ty_esll-sub_packno.

  IF NOT header IS INITIAL.
*/ Texto de cabecera /*
    IF NOT h_comments IS INITIAL.
      CLEAR   t_textod.

      CLEAR theader.
      PERFORM clear_symbol USING h_comments.

*- Agrega el texto adicional en Supplement
      theader-tdobject = 'EKKO'.
      theader-tdname   =  v_pedido1.
*-                     A17
      theader-tdid     = 'A01' .
      theader-tdspras  =  p_lan.

*/ busca texto anterior
*  perform search_text2 using 'A17' theader-tdname p_lan 'EKKO'.
      PERFORM search_text2 USING 'A01' theader-tdname p_lan 'EKKO'.

      PERFORM add_sign USING ssouser1.

      txt_add = strlen( h_comments ).

      IF txt_add > 132.
        ofs = 0.
        DO.
          CLEAR st_textod-tdline.
          st_textod-tdline = h_comments+ofs(132).
          APPEND st_textod TO t_textod.
          ofs = ofs + 132.
          CHECK ofs > txt_add.
          EXIT.
        ENDDO.
      ELSE.
        st_textod-tdline = h_comments.
        APPEND st_textod TO t_textod.
      ENDIF.

*      st_textod-tdline  = h_comments(132).
*      st_textod-tdline  = h_comments+132(123).
*      APPEND st_textod TO t_textod.

*/ Guarda texto de cabecera /*
      PERFORM save_text_add USING theader.

      IF sy-subrc EQ 0.
*        COMMIT WORK.
*-     lo guarda en los 2 idiomas también
*       if p_lan = 'S'. theader-tdspras = 'E'.
*       else.           theader-tdspras = 'S'.
*       endif.
*
*       perform save_text_add using theader.

      ENDIF.
    ENDIF.
    CLEAR header.
  ENDIF.
*/ Detalle

* Lineas de servicios
  IF ls_oferta-pstyp = 'D'.
    CLEAR t_textod.
*    SELECT SINGLE sub_packno INTO x_sub_packno FROM esll
*    WHERE  packno EQ t_oferta-packno.
    zcl_qry_rfq_send=>esll( EXPORTING i_operacion = 'READ' ls_oferta = ls_oferta IMPORTING sub_packno = x_sub_packno ).

*- Agrega el texto adicional
    LOOP AT t_esll2 INTO ls_esll2 WHERE packno EQ ls_oferta-packno.
      IF NOT ls_esll2-comments IS INITIAL.
*        SELECT SINGLE introw INTO esll-introw FROM esll
*        WHERE packno EQ x_sub_packno
*        AND   extrow EQ t_esll2-extrow.
        zcl_qry_rfq_send=>esll2( EXPORTING i_operacion = 'READ' ls_esll = ls_esll2 sub_packno = x_sub_packno IMPORTING lv_introw = ls_esll2-introw ).

        PERFORM clear_symbol USING ls_esll2-comments.

        CLEAR nom.
        CONCATENATE x_sub_packno ls_esll2-introw INTO nom.
        CONDENSE nom.
        len = 'S'.
        id  = 'LLTX'.
        obj = 'ESLL'.

        PERFORM search_text2 USING id nom len obj.
        IF sy-subrc NE 0.
          len = 'E'.
          PERFORM search_text2 USING id nom len obj.
        ENDIF.

        PERFORM add_sign USING ssouser1.

        txt_add = strlen( ls_esll2-comments ).

        IF txt_add > 132.
          ofs = 0.
          DO.
            CLEAR st_textod-tdline.
            st_textod-tdline = ls_esll2-comments+ofs(132).
*            MOVE t_esll2-comments+ofs(132) TO t_textod-tdline.
            APPEND st_textod TO t_textod.
            ofs = ofs + 132.
            CHECK ofs > txt_add.
            EXIT.
          ENDDO.
        ELSE.
          st_textod-tdline = ls_esll2-comments.
*          MOVE t_esll2-comments TO t_textod-tdline.
          APPEND st_textod TO t_textod.
        ENDIF.

        theader-tdobject = obj.
        theader-tdname   = nom.
        theader-tdid     = id.
        theader-tdspras  = len.

*/     Guarda texto de la linea de servicio /*
        PERFORM save_text_add USING theader.

        IF sy-subrc EQ 0.
*          COMMIT WORK.

          theader-tdobject = obj.
          theader-tdname   = nom.
          theader-tdid     = id.

          IF len = 'S'.
            theader-tdspras = 'E'.
          ELSE.
            theader-tdspras = 'S'.
          ENDIF.

          PERFORM save_text_add USING theader.
        ENDIF.

      ENDIF.
    ENDLOOP.

*/ Texto de la posicion de servicios */
    IF NOT ls_oferta-comments IS INITIAL.

      PERFORM clear_symbol USING ls_oferta-comments.

*- Agrega el texto adicional en Desc. para Compras

      CLEAR theader.
      IF ls_oferta-matnr IS INITIAL.
        theader-tdid = 'A01'.
      ELSE.
        theader-tdid = 'A03'.
      ENDIF.


      CONCATENATE ls_oferta-ebeln ls_oferta-ebelp INTO theader-tdname .
      theader-tdspras  =  p_lan.
      theader-tdobject = 'EKPO'.

      PERFORM search_text2 USING theader-tdid theader-tdname p_lan 'EKPO'.

      PERFORM add_sign USING ssouser1.

      txt_add = strlen( ls_oferta-comments ).

      IF txt_add > 132.
        ofs = 0.
        DO.
          CLEAR st_textod-tdline.
          st_textod-tdline = ls_oferta-comments+ofs(132).
          APPEND st_textod TO t_textod.
          ofs = ofs + 132.
          CHECK ofs > txt_add.
          EXIT.
        ENDDO.
      ELSE.
        st_textod-tdline = ls_oferta-comments.
        APPEND st_textod TO t_textod.
      ENDIF.

*/  Guarda texto de posicion de servicios */
      PERFORM save_text_add USING theader.

      IF sy-subrc EQ 0.
*        COMMIT WORK.

        IF p_lan = 'S'.
          theader-tdspras = 'E'.
        ELSE.
          theader-tdspras = 'S'.
        ENDIF.

        PERFORM save_text_add USING theader.

      ENDIF.

    ENDIF.

*--- Normales
  ELSE.
    CLEAR: t_textod, st_textod.

    IF NOT ls_oferta-comments IS INITIAL.

      PERFORM clear_symbol USING ls_oferta-comments.

*- Agrega el texto adicional en Desc. para Compras

      CLEAR theader.
      IF ls_oferta-matnr IS INITIAL.
        theader-tdid = 'A01'.
      ELSE.
        theader-tdid = 'A03'.
      ENDIF.


      CONCATENATE ls_oferta-ebeln ls_oferta-ebelp INTO theader-tdname .
      theader-tdspras  =  p_lan.
      theader-tdobject = 'EKPO'.

      PERFORM search_text2 USING theader-tdid theader-tdname p_lan 'EKPO'.

      PERFORM add_sign USING ssouser1.

      txt_add = strlen( ls_oferta-comments ).

      IF txt_add > 132.
        ofs = 0.
        DO.
          CLEAR st_textod-tdline.
          st_textod-tdline = ls_oferta-comments+ofs(132).
*          MOVE t_oferta-comments+ofs(132) TO t_textod-tdline.
          APPEND st_textod TO t_textod.
          ofs = ofs + 132.
          CHECK ofs > txt_add.
          EXIT.
        ENDDO.
      ELSE.
        st_textod-tdline = ls_oferta-comments.
*        MOVE t_oferta-comments TO t_textod-tdline.
        APPEND st_textod TO t_textod.
      ENDIF.

*/  Guarda texto de posicion */
      PERFORM save_text_add USING theader.

      IF sy-subrc EQ 0.
        COMMIT WORK.


      ENDIF.

    ENDIF.
  ENDIF.

ENDFORM.

FORM save_text_add  USING theader STRUCTURE zst_thead.

  zcl_textos=>save_text( EXPORTING i_id = theader-tdid
                                   i_name = theader-tdname
                                   i_object = theader-tdobject
                                   i_spras = theader-tdspras
                                   i_save = abap_true
                                   it_lines = t_textod
                         IMPORTING e_subrc = DATA(lv_subrc) ).

*  CALL FUNCTION 'SAVE_TEXT'
*    EXPORTING
*      header          = theader
*      savemode_direct = 'X'
*    TABLES
*      lines           = t_textod
*    EXCEPTIONS
*      OTHERS          = 5.

ENDFORM.

FORM search_text2  USING   t_id nomb lan obje.
  CLEAR t_textod.
  zcl_textos=>read_text( EXPORTING i_id = t_id
                                   i_name = nomb
                                   i_object = obje
                                   i_spras = lan
                         IMPORTING e_subrc = DATA(lv_subrc)
                                   et_lines = t_textod ).
*  CALL FUNCTION 'READ_TEXT'
*    EXPORTING
*      id                      = t_id
*      language                = lan
*      name                    = nomb
*      object                  = obje
*    TABLES
*      lines                   = t_textod
*    EXCEPTIONS
*      id                      = 1
*      language                = 2
*      name                    = 3
*      not_found               = 4
*      object                  = 5
*      reference_check         = 6
*      wrong_access_to_archive = 7
*      OTHERS                  = 8.

ENDFORM.

FORM clear_symbol  USING   text.
  DO.
    REPLACE '§' WITH '"' INTO text.
    CHECK sy-subrc NE 0.
    EXIT.
  ENDDO.

ENDFORM.

FORM add_sign  USING   sign.
  CLEAR t_textod.
  st_textod-tdline = sign.
*  MOVE sign TO st_textod-tdline.

  CONCATENATE st_textod-tdline '-' sy-datum+6(2) '.'
                                   sy-datum+4(2) '.'
                                   sy-datum(4) '-'
                                   sy-uzeit(2) ':'
                                   sy-uzeit+2(2) ':'
                                   sy-uzeit+4(2)
                 INTO st_textod-tdline.
  APPEND st_textod TO t_textod.
  CLEAR st_textod.

ENDFORM.

FORM concatena .
  DATA: i(2) TYPE n.
  CLEAR i.
  i = ls_oferta-ebelp+2(2).
  CONCATENATE  'RM06E-TCSELFLAG' '(' i ')' INTO posicion.
  CONCATENATE  'RM06E-ANMNG' '(' i ')' INTO cantidad.
  CONCATENATE  'EKPO-NETPR' '(' i ')' INTO precio.
  CONCATENATE  'RM06E-EEIND' '(' i ')' INTO fecha_ent.
  CONCATENATE  'EKPO-PEINH' '(' i ')' INTO peinh.

ENDFORM.

FORM fecha.
  v_fecha1 = ls_oferta-eindt.

  CLEAR fecha.
  IF ls_oferta-eindt IS NOT INITIAL.
    fecha = ls_oferta-eindt+6(2) && '.' && ls_oferta-eindt+4(2) && '.' && ls_oferta-eindt(4).
  ENDIF.
*  CALL FUNCTION 'CONVERT_DATE_TO_EXTERNAL'
*    EXPORTING
*      date_internal            = ls_oferta-eindt
*    IMPORTING
*      date_external            = fecha
*    EXCEPTIONS
*      date_internal_is_invalid = 1
*      OTHERS                   = 2.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  GET_HEADER_TEXT
*&---------------------------------------------------------------------*
FORM get_header_text  USING   rfq langu  p_text.

  obj = 'EKKO'.
  nom =  rfq.
  len =  langu. "'S'.
  id  = 'A01'.

  PERFORM search_text USING id nom len obj.

  CHECK sy-subrc EQ 0.
  CLEAR p_text.
  LOOP AT t_texto2 INTO st_texto2.
    CONCATENATE p_text st_texto2-tdline INTO p_text SEPARATED BY space.
  ENDLOOP.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  SEARCH_TEXT
*&---------------------------------------------------------------------*
FORM search_text  USING    p_id
                           p_nom
                           p_len
                           p_obj.
  CLEAR: t_texto2, st_texto2.

  zcl_textos=>read_text( EXPORTING i_id = p_id
                                   i_name = p_nom
                                   i_object = p_obj
                                   i_spras = p_len
                         IMPORTING e_subrc = DATA(lv_subrc)
                                   et_lines = t_texto2 ).

*  CALL FUNCTION 'READ_TEXT'
*    EXPORTING
*      id                      = p_id
*      language                = p_len
*      name                    = p_nom
*      object                  = p_obj
*    TABLES
*      lines                   = t_texto2
*    EXCEPTIONS
*      id                      = 1
*      language                = 2
*      name                    = 3
*      not_found               = 4
*      object                  = 5
*      reference_check         = 6
*      wrong_access_to_archive = 7
*      OTHERS                  = 8.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  GET_ITEM_TEXT
*&---------------------------------------------------------------------*
FORM get_item_text  USING    p_ebeln
                             p_ebelp
                             p_matnr
                             p_langu
                             p_long_text.
  CLEAR: t_texto2, st_texto2.
  obj = 'EKPO'.
  IF p_matnr IS INITIAL.
    id = 'A01'.
  ELSE.
    id = 'A03'.
  ENDIF.

  CONCATENATE p_ebeln p_ebelp INTO nom.
  len =  p_langu. "'S'.

  PERFORM search_text USING id nom len obj.

* textos heredados de la requisicion
  IF t_texto2 IS INITIAL.
*    CLEAR eket.
*    SELECT SINGLE banfn bnfpo INTO (eket-banfn, eket-bnfpo)
*    FROM eket WHERE ebeln = p_ebeln
*              AND   ebelp = p_ebelp.
    zcl_qry_rfq_list=>eket( EXPORTING i_operacion = 'READ'
                                    i_ebeln = ls_ekpo2-ebeln
                                    i_ebelp = ls_ekpo2-ebelp
                          IMPORTING e_banfn = DATA(lv_banfn)
                                    e_bnfpo = DATA(lv_bnfpo)  ).
    IF sy-subrc EQ 0 AND lv_banfn NE space.
      id = 'B04'.
      len = p_langu.
      CONCATENATE lv_banfn lv_bnfpo INTO nom.
      obj = 'EBAN'.
      PERFORM search_text USING id nom len obj.

      IF t_texto2 IS INITIAL AND NOT p_matnr IS INITIAL.
*-      Obtiene texto del maestro del material
        id = 'BEST'.
        obj = 'MATERIAL'.
        nom =  p_matnr.
        PERFORM search_text USING id nom len obj.
      ENDIF.
    ELSEIF  lv_banfn EQ space AND NOT p_matnr IS INITIAL.
*-      Obtiene texto del maestro del material
      id = 'BEST'.
      obj = 'MATERIAL'.
      nom =  p_matnr.
      PERFORM search_text USING id nom len obj.
    ENDIF.
  ENDIF.

  CLEAR p_long_text.
  LOOP AT t_texto2 INTO st_texto2.
    CONCATENATE p_long_text st_texto2-tdline INTO p_long_text SEPARATED BY space.
  ENDLOOP.

ENDFORM.
