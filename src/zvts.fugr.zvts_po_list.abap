FUNCTION zvts_po_list.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(VENDOR) TYPE  ELIFN OPTIONAL
*"     VALUE(COMPANY) TYPE  BUKRS OPTIONAL
*"     VALUE(PO) TYPE  EBELN OPTIONAL
*"     VALUE(START_DATE) TYPE  ERDAT OPTIONAL
*"     VALUE(END_DATE) TYPE  ERDAT OPTIONAL
*"     VALUE(STATUS) TYPE  CHAR1 OPTIONAL
*"     VALUE(LANGU) TYPE  SY-LANGU OPTIONAL
*"     VALUE(RECORDS) TYPE  SY-TABIX OPTIONAL
*"  EXPORTING
*"     VALUE(MESSAGE) TYPE  CHAR255
*"     REFERENCE(PO_LIST) TYPE  ZVTS_TT_PO_LIST
*"----------------------------------------------------------------------
  DATA: ls_list  LIKE LINE OF po_list,
        lv_menge TYPE menge_d,
        lv_wemng TYPE weemg.

  l_rec = records.
  p_lan = langu.
  CLEAR: prov.

  IF vendor CA 'ABCDEFGHIJKLMNOPQRSTVWXYZ'.
    prov  = vendor.
  ELSE.
    provc = vendor.
    prov  = provc.
  ENDIF.

* Parámetros de selección
*  PERFORM prepara_parametros USING company
*                                   po
*                                   start_date
*                                   end_date.

* SELECT ebeln lifnr aedat kdatb kdate ernam ekgrp waers wkurs ihran
*        ihrez unsez inco1 inco2 zterm zbd1t zbd2t zbd3t zbd1p zbd2p
*        angdt ernam bsart bukrs
* INTO CORRESPONDING FIELDS OF TABLE t_ekko
* FROM ekko
* WHERE lifnr EQ prov
* AND ebeln IN r_ebeln
* AND bukrs IN r_bukrs
* AND bedat IN r_aedat
* AND bstyp EQ 'F'
* AND ( frgke EQ 'D' or frgke EQ 'E' or frgke EQ 'F' or frgke EQ space )
* AND loekz eq space
* AND procstat eq '05'.
  zcl_qry_po_list=>ekko( EXPORTING i_operacion = 'READ'
                                   i_lifnr = prov
                                   i_company = company
                                   i_po = po
                                   i_start = start_date
                                   i_end = end_date
                         IMPORTING et_pedidos_cab = t_ekko ).

  IF NOT t_ekko[] IS INITIAL.
    CLEAR: t_pedidos.
* SELECT ebeln ebelp matnr menge meins netpr netwr peinh bprme txz01
*        werks mwskz pstyp bukrs knttp emlif mtart banfn bnfpo
*        bstyp xersy packno bstae matkl insmk
* INTO CORRESPONDING FIELDS OF TABLE t_pedidos
* FROM  ekpo  FOR ALL ENTRIES IN t_ekko
* WHERE ebeln EQ t_ekko-ebeln
* AND   elikz EQ space
**and erekz eq space
* AND loekz EQ space.
    zcl_qry_po_list=>ekpo( EXPORTING i_operacion = 'READ'
                                     it_pedidos_cab = t_ekko
                           IMPORTING et_pedidos = t_pedidos ).

    SORT t_pedidos BY ebeln ebelp.

    LOOP AT t_ekko INTO DATA(ls_ekko).
      LOOP AT t_pedidos INTO DATA(ls_pedidos) WHERE ebeln = ls_ekko-ebeln.
*- Valida si ya tiene entrada completa de mercancia
        CLEAR: c_ent, c_sal, dif.
        PERFORM edas_salidas USING ls_pedidos.
        IF ls_pedidos-pstyp NE '9'.
          dif = c_ent - c_sal.
          dif = ls_pedidos-menge - dif.
        ELSE.
*  suma todas las hojas de entrada vs las lineas de servicios
          CLEAR: ent_menge, ped_menge.
          LOOP AT t_ekbe_ent INTO ls_ekbe_ent.
*            AT LAST.
*              SUM.
*              MOVE t_ekbe_ent-menge TO ent_menge.
*            ENDAT.
            ent_menge = ent_menge + ls_ekbe_ent-menge.
          ENDLOOP.
          LOOP AT t_ekbe_ped INTO ls_ekbe_ped.
*            AT LAST.
*              SUM.
*              MOVE t_ekbe_ped-menge TO ped_menge.
*            ENDAT.
            ped_menge = ped_menge + ls_ekbe_ped-menge.
          ENDLOOP.
          dif = ped_menge - ent_menge.
        ENDIF.
        CHECK dif > 0.

        ls_list-po_number = ls_pedidos-ebeln.
        ls_list-item      = ls_pedidos-ebelp.
        ls_list-ers       = ls_pedidos-xersy.
        ls_list-material  = ls_pedidos-matnr.
        ls_list-text      = ls_pedidos-txz01.
        ls_list-quantity  = ls_pedidos-menge.
        ls_list-unit      = ls_pedidos-meins.
        ls_list-price     = ls_pedidos-netpr.
        ls_list-curr      = ls_ekko-waers.
        ls_list-per       = ls_pedidos-peinh.
        ls_list-opu       = ls_pedidos-bprme.

*   LONG_TEXT
        CLEAR: ls_pedidos-ablad, ls_pedidos-wempf.
*  SELECT ablad wempf INTO (t_pedidos-ablad, t_pedidos-wempf)
*  FROM ekkn WHERE ebeln EQ t_pedidos-ebeln AND
*                  ebelp EQ t_pedidos-ebelp.
*  ENDSELECT.
        zcl_qry_po_list=>ekkn( EXPORTING i_operacion = 'READ'
                                         i_ebeln = ls_pedidos-ebeln
                                         i_ebelp = ls_pedidos-ebelp
                               IMPORTING e_ablad = ls_pedidos-ablad
                                         e_wempf = ls_pedidos-wempf ).
        ls_list-unl_point = ls_pedidos-ablad.

        CLEAR: lv_menge, lv_wemng, ls_pedidos-uzeit,ls_pedidos-eindt.
*  SELECT uzeit eindt menge wemng
*  INTO (t_pedidos-uzeit,t_pedidos-eindt, eket-menge, eket-wemng)
*  FROM eket
*  WHERE ebeln EQ t_pedidos-ebeln
*  AND   ebelp EQ t_pedidos-ebelp.
*  ENDSELECT.
        zcl_qry_po_list=>eket( EXPORTING i_operacion = 'READ'
                                              i_ebeln = ls_pedidos-ebeln
                                              i_ebelp = ls_pedidos-ebelp
                                    IMPORTING e_uzeit = ls_pedidos-uzeit
                                              e_eindt = ls_pedidos-eindt
                                              e_menge = lv_menge
                                              e_wemng = lv_wemng ).

        ls_list-del_date = ls_pedidos-eindt.
        ls_list-time     = ls_pedidos-uzeit.
        ls_list-pend_qty  = lv_menge - lv_wemng.

*- Verifica si tiene confirmaciones
        PERFORM check_status USING ls_pedidos-ebeln ls_pedidos-ebelp ls_list-status ls_pedidos-menge.

        IF status EQ 'S' AND ( ls_list-status EQ '0' OR ls_list-status EQ '50' ).
          APPEND ls_list TO po_list.
        ELSEIF status EQ 'C' AND ( ls_list-status EQ '50' OR ls_list-status EQ '100' ).
          APPEND ls_list TO po_list.
        ELSEIF status EQ 'T'.
          APPEND ls_list TO po_list.
        ENDIF.
      ENDLOOP.
    ENDLOOP.
  ELSE.
    message = 'No Existe Información'.
  ENDIF.

ENDFUNCTION.
