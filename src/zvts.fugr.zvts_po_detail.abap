FUNCTION zvts_po_detail.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(PO_NUMBER) TYPE  EBELN
*"     VALUE(LANGU) TYPE  SY-LANGU OPTIONAL
*"  EXPORTING
*"     VALUE(MESSAGE) TYPE  TEXT50
*"     VALUE(LIST) TYPE  ZTT_VTS_PO_DETAIL
*"----------------------------------------------------------------------
  DATA ls_list LIKE LINE OF list.
  p_lan = langu.

*SELECT ebeln ebelp matnr menge meins netpr netwr peinh bprme txz01
*       werks mwskz pstyp bukrs knttp emlif mtart banfn bnfpo
*       bstyp xersy packno bstae matkl insmk
*INTO CORRESPONDING FIELDS OF TABLE t_pedidos
*FROM ekpo
*WHERE ebeln EQ PO_NUMBER
*AND   elikz EQ space
**     and erekz eq space
*AND   loekz EQ space.
  zcl_qry_po_detail=>ekpo( EXPORTING i_operacion = 'READ'
                                     i_ebeln = po_number
                           IMPORTING et_pedidos = t_pedidos ).

  LOOP AT t_pedidos INTO DATA(ls_pedidos).
    CLEAR: c_ent, c_sal.
    PERFORM edas_salidas USING ls_pedidos.
    IF ls_pedidos-pstyp NE '9'.
      dif = c_ent - c_sal.
      dif = ls_pedidos-menge - dif.
    ELSE.
      CLEAR: ent_menge, ped_menge.
      LOOP AT t_ekbe_ent INTO ls_ekbe_ent.
*          AT LAST.
*            SUM.
*            MOVE ls_ekbe_ent-menge TO ent_menge.
*          ENDAT.
        ent_menge = ent_menge + ls_ekbe_ent-menge.
      ENDLOOP.
      LOOP AT t_ekbe_ped INTO ls_ekbe_ped.
*        AT LAST.
*          SUM.
*          MOVE ls_ekbe_ped-menge TO ped_menge.
*        ENDAT.
        ped_menge = ped_menge + ls_ekbe_ped-menge.
      ENDLOOP.
      dif = ped_menge - ent_menge.
    ENDIF.
    IF dif > 0.  "ge
      SHIFT ls_pedidos-matnr LEFT  DELETING LEADING '0'.
      MOVE-CORRESPONDING ls_pedidos TO ls_pedidos2.

      IF ls_pedidos2-pstyp NE '9'.
        IF dif NE ls_pedidos-menge.
          ls_pedidos2-ent = 'X'.
        ELSE.
          ls_pedidos2-ent = ' '.
        ENDIF.
      ELSE.
        IF dif NE ped_menge.
          ls_pedidos2-ent = 'X'.
        ELSE.
          ls_pedidos2-ent = ' '.
        ENDIF.
      ENDIF.
*        SELECT waers ernam ekorg ekgrp
*           INTO (t_pedidos2-waers, t_pedidos2-ernam, t_pedidos2-ekorg,
*                   t_pedidos2-ekgrp)
*              FROM ekko
*              WHERE ebeln EQ t_pedidos2-ebeln.
*        ENDSELECT.
      zcl_qry_po_detail=>ekko( EXPORTING i_operacion = 'READ'
                                         i_ebeln = ls_pedidos2-ebeln
                                IMPORTING es_ekko = gs_ekko ).
      ls_pedidos2-waers = gs_ekko-waers.
      ls_pedidos2-ernam = gs_ekko-ernam.
      ls_pedidos2-ekorg = gs_ekko-ekorg.
      ls_pedidos2-ekgrp = gs_ekko-ekgrp.
      APPEND ls_pedidos2 TO t_pedidos2.
*       lineas de servicios
      IF ls_pedidos2-pstyp EQ '9'.
        l_ebelp = ls_pedidos2-ebelp.
*            CLEAR: esll-packno, esll-sub_packno. "t_pedidos2-ebeln.
*            SELECT packno sub_packno
*            INTO (esll-packno, esll-sub_packno)
*            FROM esll
*            WHERE packno EQ ls_pedidos2-packno.
*            ENDSELECT.
        CLEAR gt_esll.
        zcl_qry_po_detail=>esll( EXPORTING i_operacion = 'READ'
                                           i_packno = ls_pedidos2-packno
                                 IMPORTING et_esll = gt_esll ).
        LOOP AT gt_esll INTO gs_esll.
          DATA(lv_packno) = gs_esll-packno.
          DATA(lv_sub_packno) = gs_esll-sub_packno.
        ENDLOOP.
        IF sy-subrc EQ 0.
*              SELECT packno extrow introw menge
*                     meins  ktext1 peinh  tbtwr
*              INTO (ls_pedidos2-packno, esll-extrow, ls_pedidos2-introw,
*                    ls_pedidos2-menge,  ls_pedidos2-meins,
*                    ls_pedidos2-txz01,  ls_pedidos2-peinh,
*                    ls_pedidos2-netpr)
*              FROM esll
*              WHERE packno EQ esll-sub_packno.
*                pos = esll-extrow.
*                ls_pedidos2-packno = ESLL-PACKNO.
*                ls_pedidos2-ebelp = pos.
*                ls_pedidos2-serv = 'D'.
*                ls_pedidos2-line = 'D'.
*                PERFORM unidad_medida USING ls_pedidos2-meins.
*                SELECT ebeln INTO ekes-ebeln
*                FROM ekes WHERE ebeln = ls_pedidos2-ebeln
*                          AND   ebelp = l_ebelp.
*                ENDSELECT.
*                IF sy-subrc EQ 0.
*                  MOVE 'X' TO ls_pedidos2-tiene_conf.
*                ENDIF.
*                APPEND ls_pedidos2 TO t_pedidos2.
*
*              ENDSELECT.
          CLEAR gt_esll.
          zcl_qry_po_detail=>esll( EXPORTING i_operacion = 'READ'
                                             i_packno = lv_sub_packno
                                   IMPORTING et_esll = gt_esll ).
          LOOP AT gt_esll INTO gs_esll.
            ls_pedidos2-packno = gs_esll-packno.
            DATA(lv_extrow) = gs_esll-extrow.
            ls_pedidos2-introw = gs_esll-introw.
            ls_pedidos2-menge = gs_esll-menge.
            ls_pedidos2-meins = gs_esll-meins.
            ls_pedidos2-txz01 = gs_esll-ktext1.
            ls_pedidos2-peinh = gs_esll-peinh.
            ls_pedidos2-netpr = gs_esll-tbtwr.
            pos = lv_extrow.
            ls_pedidos2-packno = lv_packno.
            ls_pedidos2-ebelp = pos.
            ls_pedidos2-serv = 'D'.
            ls_pedidos2-line = 'D'.
            PERFORM unidad_medida USING ls_pedidos2-meins.
            CLEAR gt_ekes.
            zcl_qry_po_detail=>ekes( EXPORTING i_operacion = 'READ'
                                               i_ebeln = ls_pedidos2-ebeln
                                               i_ebelp = ls_pedidos2-ebelp
                                     IMPORTING et_ekes = gt_ekes ).
            READ TABLE gt_ekes INTO gs_ekes WITH KEY ebeln = ls_pedidos2-ebeln
                                                     ebelp = ls_pedidos2-ebelp.
            IF sy-subrc EQ 0.
              ls_pedidos2-tiene_conf = 'X'.
            ENDIF.
            APPEND ls_pedidos2 TO t_pedidos2.
          ENDLOOP.
        ENDIF.
      ENDIF.
      CLEAR ls_pedidos2.
    ENDIF.
  ENDLOOP.

  t_pedidos3[] = t_pedidos2[].
  DATA: cont      TYPE i VALUE 1,
        cant_conf LIKE zst_ekes-menge,
        cant_pend LIKE zst_ekes-menge.

  LOOP AT t_pedidos3 INTO ls_pedidos3.

    CHECK ls_pedidos3-serv NE 'D'.
    CLEAR: cant_conf, cant_pend.
*    SELECT menge
*    INTO ekes-menge
*    FROM ekes
*    WHERE ebeln EQ ls_pedidos3-ebeln
*    AND   ebelp EQ ls_pedidos3-ebelp.
*      ADD ekes-menge TO cant_conf.
*    ENDSELECT.
    CLEAR gt_ekes.
    zcl_qry_po_detail=>ekes( EXPORTING i_operacion = 'READ'
                                       i_ebeln = ls_pedidos3-ebeln
                                       i_ebelp = ls_pedidos3-ebelp
                             IMPORTING et_ekes = gt_ekes ).
    LOOP AT gt_ekes INTO gs_ekes.
      ADD gs_ekes-menge TO cant_conf.
    ENDLOOP.
*-
    cant_pend = ls_pedidos3-menge - cant_conf.

    CHECK cant_pend NE 0.

*    IF t_pedidos3-traty EQ space. t_pedidos3-traty = 'CMON'. ENDIF.

    ls_list-po_item = ls_pedidos3-ebelp.
    ls_list-material = ls_pedidos3-matnr.
    ls_list-text = ls_pedidos3-txz01.
    ls_list-quantity = ls_pedidos3-menge.
    ls_list-unit = ls_pedidos3-meins.
    ls_list-price = ls_pedidos3-netpr.
    ls_list-curr = ls_pedidos3-waers.
    ls_list-deliv_date = ls_pedidos3-eindt.
    ls_list-time = ls_pedidos3-uzeit.
    ls_list-tran_type = ls_pedidos3-traty.
    ls_list-id_trans = ls_pedidos3-traid.
    ls_list-id_deliv = ls_pedidos3-verkf.
    ls_list-pen_qant = cant_pend.
    ls_list-type = ls_pedidos3-serv.
    ls_list-packno = ls_pedidos3-packno.
    APPEND ls_list TO list.

*- lineas de servicio
    CHECK NOT ls_pedidos3-packno IS INITIAL.
    LOOP AT t_pedidos2 INTO ls_pedidos2 WHERE packno EQ ls_pedidos3-packno
                       AND   serv   EQ 'D'.
      ls_list-po_item = ls_pedidos2-ebelp.
      ls_list-material = ls_pedidos2-matnr.
      ls_list-text = ls_pedidos2-txz01.
      ls_list-quantity = ls_pedidos2-menge.
      ls_list-unit = ls_pedidos2-meins.
      ls_list-price = ls_pedidos2-netpr.
      ls_list-curr = ls_pedidos2-waers.
      ls_list-deliv_date = ls_pedidos2-eindt.
      ls_list-time = ls_pedidos2-uzeit.
      ls_list-tran_type = ls_pedidos2-traty.
      ls_list-id_trans = ls_pedidos2-traid.
      ls_list-id_deliv = ls_pedidos2-verkf.
      ls_list-pen_qant = cant_pend.
      ls_list-type = ls_pedidos2-serv.
      ls_list-packno = ls_pedidos2-packno.
      APPEND ls_list TO list.
    ENDLOOP.

  ENDLOOP.

ENDFUNCTION.
