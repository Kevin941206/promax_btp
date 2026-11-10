FUNCTION zvts_po_send_conf.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(PO_NUMBER) TYPE  EBELN
*"     VALUE(LANGUAGE) TYPE  SPRAS OPTIONAL
*"     REFERENCE(DETAIL) TYPE  ZVTS_TT_PO_CONFIRM
*"  EXPORTING
*"     VALUE(MESSAGE) TYPE  CHAR255
*"----------------------------------------------------------------------
  DATA: ls_messages  LIKE LINE OF it_messages,
        ls_item      LIKE LINE OF it_item,
        ls_itemx     LIKE LINE OF it_itemx,
        ls_pedidos33 LIKE LINE OF t_pedidos33,
        ls_bdc_tab   LIKE LINE OF bdc_tab.

  CLEAR: message, flag_err.
  t_detail[] = detail[].

  p_lan = language.

*  SELECT SINGLE * FROM ekko WHERE ebeln EQ po_number.
  zcl_qry_po_send_conf=>ekko( EXPORTING i_ebeln = po_number
                              IMPORTING e_ekko = DATA(ls_ekko) ).

  LOOP AT t_detail INTO DATA(ls_detail).
    CLEAR flag_err.
*  check flag_err is initial.
*- Valida cant. a confirmar vs cant. pendiente
    IF ls_detail-quantity > ls_detail-pen_qant.
      IF p_lan = 'S'.
        message = 'La cant. es mayor a lo pendiente de Confirmar'.
      ELSE.
        message = 'The quantity is greater than the open quantity'.
      ENDIF.
      flag_err = 1.
      EXIT.
    ENDIF.

*-  Verifica cve. ctrl. conf.
*    SELECT bstae kzabs INTO (ekpo-bstae,ekpo-kzabs) FROM ekpo
*     WHERE ebeln EQ po_number
*       AND ebelp EQ t_detail-item.
**       AND ( bstae EQ space OR bstae NE '0004' ).
**       AND kzabs EQ space.
*    ENDSELECT.
    zcl_qry_po_send_conf=>ekpo( EXPORTING i_ebeln = po_number
                                          i_ebelp = ls_detail-item
                              IMPORTING e_bstae = DATA(lv_bstae)
                                        e_kzabs = DATA(lv_kzabs) ).
    IF lv_bstae EQ space OR lv_kzabs EQ space.

*- valida que no tenga entrada de mercancia
*      SELECT SINGLE * FROM ekbe
*      WHERE ebeln EQ po_number
*      AND   ebelp EQ t_detail-item
*      AND   vgabe EQ '1'.
      zcl_qry_po_send_conf=>ekbe( EXPORTING i_ebeln = po_number
                                            i_ebelp = ls_detail-item
                                  IMPORTING e_subrc = DATA(lv_subrc) ).
      IF lv_subrc EQ 0.
        CONCATENATE 'Pos:' ls_detail-item 'ya tiene entrada de mercancia, no se puede confirmar'
        INTO message SEPARATED BY space.
        flag_err = 1.
        EXIT.
      ENDIF.

*      SELECT SINGLE * FROM ekpo
*      WHERE ebeln EQ po_number
*      AND   ebelp EQ t_detail-item.

*- Actualiza cve de control de confirmación
      CLEAR: it_messages[],
             it_item[],
             it_itemx[],
             ls_messages,
             ls_item,
             ls_itemx.

      ls_item-po_item    = ls_detail-item.
      ls_itemx-po_item   = ls_detail-item.

      IF lv_kzabs EQ space.
        ls_item-ackn_reqd  = 'X'.       " Indicador de obligación de confirmación de pedido
        ls_itemx-ackn_reqd = 'X'.
      ENDIF.

      IF lv_bstae EQ space.
        ls_item-conf_ctrl  = '0004'. " Clave de control de confirmaciones
        ls_itemx-conf_ctrl = 'X'.
      ENDIF.

      APPEND ls_item TO it_item.
      APPEND ls_itemx TO it_itemx.
*-
*      CALL FUNCTION 'BAPI_PO_CHANGE'
*        EXPORTING
*          purchaseorder = po_number
*        TABLES
*          return        = it_messages
*          poitem        = it_item
*          poitemx       = it_itemx
*        EXCEPTIONS
*          OTHERS        = 4.
      zcl_bapi_po_change=>bapi_po_change( EXPORTING i_ebeln = po_number
                                                    it_item = it_item
                                                    it_itemx = it_itemx
                                          IMPORTING et_return = it_messages ).
      IF sy-subrc EQ 0.
        READ TABLE it_messages INTO ls_messages WITH KEY type = 'E'.
        IF sy-subrc EQ 0.
          message = ls_messages-message.
          flag_err = 1.
          EXIT.
        ELSE.
*          CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
*            EXPORTING
*              wait = 'X'.
        ENDIF.
      ELSE.
        LOOP AT it_messages INTO ls_messages WHERE type = 'E'.
          message = ls_messages-message.
          flag_err = 1.
          EXIT.
        ENDLOOP.
*        CALL FUNCTION 'BAPI_TRANSACTION_ROLLBACK'.
      ENDIF.

    ENDIF.  " Valida cve. ctrl. conf.

    CHECK flag_err IS INITIAL.
    CLEAR: bdc_tab, t_pedidos33, ls_pedidos33, ls_bdc_tab.

    ls_pedidos33-ebeln = po_number.
    ls_pedidos33-ebelp = ls_detail-item.
    ls_pedidos33-menge = ls_detail-quantity.
    ls_pedidos33-eindt = ls_detail-deliv_date.
    ls_pedidos33-uzeit = ls_detail-time.
    ls_pedidos33-traty = ls_detail-tran_type. "Medio transp.
    ls_pedidos33-traid = ls_detail-id_trans. "Id.Medio Transp
    ls_pedidos33-cant_pend = ls_detail-pen_qant.
    APPEND ls_pedidos33 TO t_pedidos33.

    PERFORM Confirma USING message.

    IF NOT flag_err IS INITIAL.
      EXIT.
    ENDIF.

  ENDLOOP.

ENDFUNCTION.

FORM Confirma USING mensaje.
*** Local Variables
  DATA: lt_vbsk TYPE TABLE OF zst_vbsk,
        ls_vbsk LIKE LINE OF lt_vbsk.
  DATA: lt_komdlgn TYPE TABLE OF zst_komdlgn,
        ls_komdlgn LIKE LINE OF lt_komdlgn.
  DATA: lt_vbfs TYPE TABLE OF zst_vbfs,
        ls_vbfs LIKE LINE OF lt_vbfs.
  DATA: lt_vbls TYPE TABLE OF zst_vbls,
        ls_vbls LIKE LINE OF lt_vbls.
  DATA lf_h_ind   LIKE sy-tabix.       "Hilfsfeld Index
  DATA lf_v_vbeln TYPE vbeln.     "From delivery Number
  DATA lf_b_vbeln TYPE vbeln.     "To delivery Number
  DATA lt_prop    TYPE TABLE OF zst_wuebs.
*  DATA return     LIKE bapireturn OCCURS 0 WITH HEADER LINE.
  DATA ef_delivery TYPE vbeln.
  DATA: rem(20).
  CLEAR rem.
  DATA ls_pedidos33 LIKE LINE OF t_pedidos33.

**** Loading the lt_komdlgn
  READ TABLE t_pedidos33 INTO ls_pedidos33 INDEX 1.
  ls_komdlgn-lifex = ls_pedidos33-verkf.
  ls_komdlgn-verur = ls_pedidos33-verkf.
  ls_komdlgn-lfuhr = ls_pedidos33-uzeit.
  ls_komdlgn-traty = ls_pedidos33-traty.
  ls_komdlgn-traid = ls_pedidos33-traid.


  CHECK ls_pedidos33-line EQ space.
*- coloca temporalmente la fecha de entrega del pedido
*  SELECT SINGLE eindt INTO eket-eindt
*  FROM  eket
*  WHERE ebeln EQ t_pedidos33-ebeln
*  AND   ebelp EQ t_pedidos33-ebelp.
  zcl_qry_po_send_conf=>eket( EXPORTING i_ebeln = ls_pedidos33-ebeln
                                        i_ebelp = ls_pedidos33-ebelp
                              IMPORTING e_eindt = DATA(lv_eindt) ).

*  SELECT SINGLE matnr bpumz bpumn meins INTO (ekpo-matnr, ekpo-bpumz, ekpo-bpumn, ekpo-meins)
*  FROM ekpo
*  WHERE ebeln EQ t_pedidos33-ebeln
*  AND   ebelp EQ t_pedidos33-ebelp.
  zcl_qry_po_send_conf=>ekpo2( EXPORTING i_ebeln = ls_pedidos33-ebeln
                                         i_ebelp = ls_pedidos33-ebelp
                               IMPORTING e_matnr = DATA(lv_matnr)
                                         e_bpumn = DATA(lv_bpumn)
                                         e_bpumz = DATA(lv_bpumz)
                                         e_meins = DATA(lv_meins) ).

  ls_komdlgn-lfdat = lv_eindt.
  ls_komdlgn-matnr = lv_matnr.
  ls_komdlgn-ematn = lv_matnr.
  ls_komdlgn-lfimg = ls_pedidos33-menge.
  ls_komdlgn-vgbel = ls_pedidos33-ebeln.
  ls_komdlgn-vgpos = ls_pedidos33-ebelp.

  ls_komdlgn-meins = lv_meins.
  ls_komdlgn-vrkme = lv_meins.

  ls_komdlgn-umvkz = lv_bpumz.
  ls_komdlgn-umvkn = lv_bpumn.


  IF ls_komdlgn-umvkz IS INITIAL.
    ls_komdlgn-umvkz = 1.
  ENDIF.

  IF ls_komdlgn-umvkn IS INITIAL.
    ls_komdlgn-umvkn = 1.
  ENDIF.

  APPEND ls_komdlgn TO lt_komdlgn.


*** Code from IDOC_INPUT_DESADV1
*** Not Available in 3.1
*  CALL FUNCTION 'ME_CONFIRMATION_VIA_EDI'
*    TABLES
*      t_kom  = lt_komdlgn
*      errors = lt_prop
*    EXCEPTIONS
*      OTHERS = 1.
  zcl_me_confirmation_via_edi=>me_confirmation_via_edi( EXPORTING it_komdlgn = lt_komdlgn
                                                        IMPORTING et_errores = lt_prop ).

*- Ocurrió un error
  IF NOT lt_prop[] IS INITIAL.
    LOOP AT lt_prop INTO DATA(ls_prop).

*      CALL FUNCTION 'MESSAGE_TEXT_BUILD'
*        EXPORTING
*          msgid               = ls_prop-msgid
*          msgnr               = ls_prop-msgno
*          msgv1               = ls_prop-msgv1
*          msgv2               = ls_prop-msgv2
*          msgv3               = ls_prop-msgv3
*          msgv4               = ls_prop-msgv4
*        IMPORTING
*          message_text_output = mensaje
*        EXCEPTIONS
*          OTHERS              = 1.
      zcl_message_text_build=>message_text_build( EXPORTING i_msgid = ls_prop-msgid
                                                            i_msgno = ls_prop-msgno
                                                            i_msgv1 = ls_prop-msgv1
                                                            i_msgv2 = ls_prop-msgv2
                                                            i_msgv3 = ls_prop-msgv3
                                                            i_msgv4 = ls_prop-msgv4
                                                  IMPORTING e_mensaje = mensaje ).
      flag_err = 1.
    ENDLOOP.
  ENDIF.

  CHECK flag_err IS INITIAL.

*- Corrige fecha de entrega
  LOOP AT lt_komdlgn INTO ls_komdlgn.
    READ TABLE t_pedidos33 INTO ls_pedidos33 WITH KEY ebeln = ls_komdlgn-vgbel
                                                      ebelp = ls_komdlgn-vgpos.
*-  coloca fecha capturada
    ls_komdlgn-lfdat = ls_pedidos33-eindt.
    ls_komdlgn-vrkme = ls_komdlgn-meins.

*   set default parameter
    ls_komdlgn-vgtyp = 'V'.
    ls_komdlgn-kzazu = 'X'.
    IF ls_komdlgn-lfart IS INITIAL.
      ls_komdlgn-lfart = 'EL'.
    ENDIF.

    IF ls_komdlgn-umvkz IS INITIAL.
      ls_komdlgn-umvkz = 1.
    ENDIF.

    IF ls_komdlgn-umvkn IS INITIAL.
      ls_komdlgn-umvkn = 1.
    ENDIF.

*    LT_KOMDLGN-VRKME = ekpo-meins.   "t_pedidos33-meins.
*    LT_KOMDLGN-LGMNG = t_pedidos33-menge.

*-  Se reactiva
    ls_komdlgn-meins = lv_meins.   "t_pedidos33-meins.
    ls_komdlgn-umvkz = lv_bpumz.
    ls_komdlgn-umvkn = lv_bpumn.

    MODIFY lt_komdlgn FROM ls_komdlgn.
  ENDLOOP.

***** Create
*  DATA: nrnr LIKE inri-nrrangenr.

* Sammelgangsnummer vergeben
*  ls_vbsk-mandt = sy-mandt.
  ls_vbsk-ernam = sy-uname.
  ls_vbsk-erdat = sy-datum.
  ls_vbsk-uzeit = sy-uzeit.
  ls_vbsk-smart = 'L'.

*  SELECT SINGLE * FROM tvsa WHERE smart = ls_vbsk-smart.
*  IF sy-subrc <> 0.
**** Error Handling To be Done
**   Meldung ins Protokoll
*  ENDIF.
*
*  nrnr = tvsa-numki.
*  CALL FUNCTION 'NUMBER_GET_NEXT'
*    EXPORTING
*      nr_range_nr = nrnr
*      object      = 'RV_SAMMG'
*    IMPORTING
*      number      = ls_vbsk-sammg
*    EXCEPTIONS
*      OTHERS      = 1.
  zcl_number_get_next=>number_get_next( EXPORTING i_smart = ls_vbsk-smart
                                                  i_object = 'RV_SAMMG'
                                        IMPORTING e_number = ls_vbsk-sammg ).
  IF sy-subrc <> 0.
*** Error Hadling TBD
*   Meldung ins Protokoll
  ENDIF.

**** Call Core Function GN_DELIVERY_CREATE.
*  CALL FUNCTION 'GN_DELIVERY_CREATE'
*    EXPORTING
*      vbsk_i   = ls_vbsk
*    IMPORTING
*      vbsk_e   = ls_vbsk
*    TABLES
*      xkomdlgn = lt_komdlgn
*      xvbfs    = lt_vbfs
*      xvbls    = lt_vbls
*    EXCEPTIONS
*      OTHERS   = 1.
  zcl_gn_delivery_create=>gn_delivery_create( EXPORTING i_vbsk = ls_vbsk
                                                        it_komdlgn = lt_komdlgn
                                              IMPORTING et_vbfs = lt_vbfs
                                                        et_vbls = lt_vbls ).
*** Error Handling
  IF sy-subrc NE 0.
    ROLLBACK WORK.
    IF p_lan EQ 'S'.
      mensaje = 'Ha ocurrido un Error.'.
    ELSE.
      mensaje = 'An Error has occurred.'.
    ENDIF.
    flag_err = 1.
  ELSE.

    IF ls_vbsk-ernum EQ 0 AND
       ls_vbsk-vbnum GT 0.
*      DESCRIBE TABLE lt_vbls LINES lf_h_ind.
      SELECT COUNT(*) FROM @lt_vbls AS vbls INTO @lf_h_ind.
      READ TABLE lt_vbls INTO ls_vbls INDEX 1.
      lf_v_vbeln = ls_vbls-vbeln_lif.
      READ TABLE lt_vbls INTO ls_vbls INDEX lf_h_ind.
      lf_b_vbeln = ls_vbls-vbeln_lif.
      CLEAR lf_h_ind.

      ef_delivery = lf_v_vbeln.

      IF p_lan EQ 'S'.
        mensaje = 'Confirmación realizada:'.
      ELSE.
        mensaje = 'Done confirmation:'.
      ENDIF.

      CONCATENATE mensaje ef_delivery INTO mensaje.

    ELSE.
      READ TABLE lt_vbls INTO ls_vbls INDEX 1.
      lf_v_vbeln = ls_vbls-vbeln_lif.
      IF NOT lf_v_vbeln IS INITIAL.
        ef_delivery = lf_v_vbeln.

        IF p_lan EQ 'S'.
          mensaje = 'Confirmación realizada:'.
        ELSE.
          mensaje = 'Done confirmation:'.
        ENDIF.
        CONCATENATE mensaje ef_delivery INTO mensaje.
      ELSE.
        READ TABLE lt_vbfs INTO ls_vbfs WITH KEY msgty = 'E'.
        CHECK sy-subrc EQ 0.
*        CALL FUNCTION 'MESSAGE_TEXT_BUILD'
*          EXPORTING
*            msgid               = ls_vbfs-msgid
*            msgnr               = ls_vbfs-msgno
*            msgv1               = ls_vbfs-msgv1
*            msgv2               = ls_vbfs-msgv2
*            msgv3               = ls_vbfs-msgv3
*            msgv4               = ls_vbfs-msgv4
*          IMPORTING
*            message_text_output = mensaje
*          EXCEPTIONS
*            OTHERS              = 1.
        zcl_message_text_build=>message_text_build( EXPORTING i_msgid = ls_vbfs-msgid
                                                              i_msgno = ls_vbfs-msgno
                                                              i_msgv1 = ls_vbfs-msgv1
                                                              i_msgv2 = ls_vbfs-msgv2
                                                              i_msgv3 = ls_vbfs-msgv3
                                                              i_msgv4 = ls_vbfs-msgv4
                                                    IMPORTING e_mensaje = mensaje ).
        flag_err = 1.
      ENDIF.

    ENDIF.
  ENDIF.

ENDFORM.                    " Confirma
