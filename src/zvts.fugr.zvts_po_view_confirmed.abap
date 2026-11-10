FUNCTION zvts_po_view_confirmed.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(VENDOR) TYPE  ELIFN
*"     VALUE(COMPANY) TYPE  BUKRS OPTIONAL
*"     VALUE(PO_NUMBER) TYPE  EBELN OPTIONAL
*"     VALUE(PO_ITEM) TYPE  EBELP OPTIONAL
*"     VALUE(LANGUAGE) TYPE  SPRAS OPTIONAL
*"  EXPORTING
*"     VALUE(MESSAGE) TYPE  CHAR255
*"     REFERENCE(PO_CONFIRMED) TYPE  ZVTS_TT_PO_CONFIRMED
*"----------------------------------------------------------------------
*DATA: BEGIN OF TH_EKKO OCCURS 0,
*          EBELN LIKE EKKO-EBELN,
*        END   OF TH_EKKO.
  DATA: th_ekko TYPE STANDARD TABLE OF zst_pedidos_cab,
        ls_ekko LIKE LINE OF th_ekko.
  TYPES: BEGIN OF Ty_PEDIDOS,
           ebeln LIKE zekpo-ebeln,
           ebelp LIKE zekpo-ebelp,
           matnr LIKE zekpo-matnr,
           txz01 LIKE zekpo-txz01,
           menge LIKE zekpo-menge,
           meins LIKE zekpo-meins,
           netpr TYPE p DECIMALS 3,
           peinh LIKE zekpo-peinh,
           bprme LIKE zekpo-bprme,
           eindt TYPE eindt,
           uzeit TYPE uzeit,
           traty TYPE char4,
           vtext TYPE vtext,
           traid TYPE char20,
           waers LIKE zekko-waers,
           verkf LIKE zekko-verkf,
           werks LIKE zekpo-werks,
           kdmat TYPE char35,
         END OF Ty_PEDIDOS.

  DATA: td_pedidos TYPE STANDARD TABLE OF ty_pedidos,
        ls_ped     LIKE LINE OF td_pedidos.

  TYPES: BEGIN OF ty_conf,
           vbeln LIKE zst_ekes-vbeln,
           vbelp LIKE zst_ekes-vbelp.
           INCLUDE STRUCTURE ls_ped.
  TYPES: END OF ty_conf.

  DATA: t_conf       TYPE STANDARD TABLE OF ty_conf,
        ls_conf      LIKE LINE OF t_conf,
        lt_ekes      TYPE STANDARD TABLE OF zst_ekes,
        ls_ekes      LIKE LINE OF lt_ekes,
        ls_confirmed LIKE LINE OF po_confirmed.

  DATA:prov(10), provc(10) TYPE n.
  CLEAR prov.

  IF vendor CA 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
    prov = vendor.
  ELSE.
    provc = vendor.
    prov = provc.
  ENDIF.

  p_lan = language.


*    if PO_NUMBER is initial.
*     select ebeln into table th_ekko
*     from ekko
*     where lifnr eq prov
*     and   bukrs eq COMPANY
*     and   bstyp eq 'F'.
*    else.
*     select ebeln into table th_ekko
*     from ekko
*     where lifnr eq prov
*     and   bukrs eq COMPANY
*     and   ebeln eq PO_NUMBER
*     and   bstyp eq 'F'.
*    endif.
  zcl_qry_po_view_confirmed=>ekko( EXPORTING i_operacion = 'READ'
                                             i_lifnr = prov
                                             i_bukrs = company
                                             i_ebeln = po_number
                                   IMPORTING et_ekko = th_ekko ).

*  CHECK sy-subrc EQ 0.
  CHECK th_ekko IS NOT INITIAL.
  SORT th_ekko BY ebeln.
*     select ebeln ebelp matnr menge meins netpr NETWR peinh bprme txz01 werks
*     into table t_pedidos
*     from ekpo for all entries in th_ekko
*     where ebeln eq th_ekko-ebeln
*     and   ebelp eq PO_ITEM
*     and   elikz eq space
*     and   loekz eq space
*     and   bstyp eq 'F'.
  zcl_qry_po_view_confirmed=>ekpo( EXPORTING i_operacion = 'READ'
                                             i_po_item = po_item
                                             it_pedidos_cab = th_ekko
                                   IMPORTING et_pedidos = t_pedidos ).
  LOOP AT t_pedidos INTO DATA(ls_pedidos).
    MOVE-CORRESPONDING ls_pedidos TO ls_ped.

*      select uzeit eindt into (td_pedidos-uzeit,td_pedidos-eindt)
*          from eket
*          where ebeln eq t_pedidos-ebeln
*            and ebelp eq t_pedidos-ebelp.
*      endselect.
    zcl_qry_po_list=>eket( EXPORTING i_operacion = 'READ'
                                     i_ebeln = ls_pedidos-ebeln
                                     i_ebelp = ls_pedidos-ebelp
                           IMPORTING e_uzeit = ls_ped-uzeit
                                     e_eindt = ls_ped-eindt ).
    IF sy-subrc EQ 0.
*        select waers into (td_pedidos-waers)
*        from ekko
*        where ebeln eq td_pedidos-ebeln.
*        endselect.
      READ TABLE th_ekko INTO ls_ekko WITH KEY ebeln = ls_ped-ebeln.
      ls_ped-waers = ls_ekko-waers.
      APPEND ls_ped TO td_pedidos.
      CLEAR ls_ped.
    ENDIF.
  ENDLOOP.

  SORT td_pedidos BY ebeln ebelp.

  CLEAR: t_conf, ls_conf.
  LOOP AT td_pedidos INTO ls_ped.
*    SELECT * FROM ekes
*    WHERE ebeln = td_pedidos-ebeln
*    AND ebelp = td_pedidos-ebelp.
    zcl_qry_po_view_confirmed=>ekes( EXPORTING i_operacion = 'READ'
                                               i_ebeln = ls_ped-ebeln
                                               i_ebelp = ls_ped-ebelp
                                     IMPORTING et_ekes = lt_ekes ).
    LOOP AT lt_ekes INTO ls_ekes.
      CHECK NOT ls_ekes-menge IS INITIAL.
      ls_conf-ebeln = ls_ped-ebeln.
      ls_conf-ebelp = ls_ped-ebelp.
      ls_conf-matnr = ls_ped-matnr.
      ls_conf-txz01 = ls_ped-txz01.
      ls_conf-meins = ls_ped-meins.
      ls_conf-netpr = ls_ped-netpr.
      ls_conf-peinh = ls_ped-peinh.
      ls_conf-bprme = ls_ped-bprme.
      ls_conf-waers = ls_ped-waers.
      ls_conf-werks = ls_ped-werks.
      ls_conf-vbeln = ls_ekes-vbeln.
      ls_conf-vbelp = ls_ekes-vbelp.
      ls_conf-menge = ls_ekes-menge.
      ls_conf-eindt = ls_ekes-eindt.
      ls_conf-uzeit = ls_ekes-uzeit.
      ls_conf-verkf = ls_ekes-xblnr.
      APPEND ls_conf TO t_conf.
      CLEAR ls_conf.
    ENDLOOP.

*    ENDSELECT.
  ENDLOOP.

  LOOP AT t_conf INTO ls_conf.
*      select * from likp where vbeln = t_conf-vbeln.
*      endselect.
*      if sy-subrc eq 0.
*         move likp-traty to t_conf-traty.
*         move likp-traid to t_conf-traid.
*      endif.
    zcl_qry_po_view_confirmed=>likp( EXPORTING i_operacion = 'READ'
                                               i_vbeln = ls_conf-vbeln
                                     IMPORTING e_traty = ls_conf-traty
                                               e_traid = ls_conf-traid ).
*      select vtext into tvtyt-vtext from tvtyt
*      where traty eq t_conf-traty
*      and   spras eq p_lan.
*      endselect.
*      if sy-subrc eq 0.
*         move tvtyt-vtext to t_conf-vtext.
*      endif.
    zcl_qry_po_view_confirmed=>tvtyt( EXPORTING i_operacion = 'READ'
                                               i_traty = ls_conf-traty
                                               i_spras = p_lan
                                     IMPORTING e_vtext = ls_conf-vtext ).
*      select * from lips
*      where vbeln = t_conf-vbeln
*      and   posnr = t_conf-vbelp.
*      endselect.
*      if sy-subrc eq 0.
*         move lips-kdmat to t_conf-kdmat.
*      endif.
    zcl_qry_po_view_confirmed=>lips( EXPORTING i_operacion = 'READ'
                                            i_vbeln = ls_conf-vbeln
                                            i_vbelp = ls_conf-vbelp
                                  IMPORTING e_kdmat = ls_conf-kdmat ).
    MODIFY t_conf FROM ls_conf INDEX sy-tabix.
  ENDLOOP.

  SORT t_conf BY vbeln vbelp.

  IF t_conf[] IS INITIAL.
    message = 'No Existe Información'.
  ELSE.
    CLEAR: po_confirmed, ls_confirmed.
    LOOP AT t_conf INTO ls_conf.
      ls_confirmed-delivery    = ls_conf-vbeln.
      ls_confirmed-deliv_item  = ls_conf-vbelp.
      ls_confirmed-po_number   = ls_conf-ebeln.
      ls_confirmed-po_item     = ls_conf-ebelp.
      ls_confirmed-material    = ls_conf-matnr.
      ls_confirmed-description = ls_conf-txz01.
      ls_confirmed-qantity     = ls_conf-menge.
      ls_confirmed-um          = ls_conf-meins.
      ls_confirmed-price       = ls_conf-netpr.
      ls_confirmed-price_unit  = ls_conf-peinh.
      ls_confirmed-order_price = ls_conf-bprme.
      ls_confirmed-deliv_date  = ls_conf-eindt.
      ls_confirmed-deliv_time  = ls_conf-uzeit.
      ls_confirmed-means       = ls_conf-traty.
      ls_confirmed-means_desc  = ls_conf-vtext.
      ls_confirmed-means_id    = ls_conf-traid.
      ls_confirmed-currency    = ls_conf-waers.
      ls_confirmed-salesperson = ls_conf-verkf.
      ls_confirmed-plant       = ls_conf-werks.
      ls_confirmed-deliv_days  = ls_conf-kdmat.
      APPEND ls_confirmed TO po_confirmed.

    ENDLOOP.
  ENDIF.

ENDFUNCTION.
