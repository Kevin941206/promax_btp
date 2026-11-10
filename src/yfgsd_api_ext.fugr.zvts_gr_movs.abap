FUNCTION zvts_gr_movs.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(VENDOR) TYPE  ELIFN
*"     VALUE(COMPANY) TYPE  BUKRS OPTIONAL
*"     VALUE(PO_NUMBER) TYPE  EBELN OPTIONAL
*"     VALUE(GRS_SDATE) TYPE  EBELN OPTIONAL
*"     VALUE(GRS_EDATE) TYPE  EBELN OPTIONAL
*"     VALUE(LANGUAGE) TYPE  SY-LANGU OPTIONAL
*"  EXPORTING
*"     VALUE(MESSAGE) TYPE  ZCHAR255
*"     VALUE(GRS_MOVS) TYPE  ZTT_GRS_MOVS
*"----------------------------------------------------------------------
"*"Interfase local
"  IMPORTING
"     VALUE(VENDOR) TYPE  ELIFN
"     VALUE(COMPANY) TYPE  BUKRS OPTIONAL
"     VALUE(PO_NUMBER) TYPE  EBELN OPTIONAL
"     VALUE(GRS_SDATE) TYPE  CHAR10 OPTIONAL
"     VALUE(GRS_EDATE) TYPE  CHAR10 OPTIONAL
"     VALUE(LANGUAGE) TYPE  SY-LANGU OPTIONAL
"  EXPORTING
"     VALUE(MESSAGE) TYPE  CHAR255
"  TABLES
"      GRS_MOVS STRUCTURE  ZVTS_GRS_MOVS

  TYPES: begin of ty_edas,
    ebeln  like zes_ekbe-ebeln,
    ebelp  like zes_ekbe-ebelp,
    belnr  like zes_ekbe-belnr,
    buzei  like zes_ekbe-buzei,
    budat  like zes_ekbe-budat,
    menge  like zes_ekbe-menge,
    wrbtr  like zes_ekbe-wrbtr,
    waers  like zes_ekbe-waers,
    bwart  like zes_ekbe-bwart,
    gjahr  like zes_ekbe-gjahr,
    lfbnr  like zes_ekbe-lfbnr,
    maktx  like zes_makt-maktx,
    xblnr  like zekko-telf1,      "mkpf-xblnr,
    frbnr  like zekko-telf1,      "mkpf-frbnr,
    menge2 like zes_ekbe-menge,
    wrbtr2 like zes_ekbe-wrbtr,
    meins  like zekpo-meins,
    status like zes_ekbe-vgabe,
    end of ty_edas.

  data: t_cant TYPE ty_edas-menge,
        t_prec TYPE ty_edas-wrbtr.

  data: corte TYPE zchar05.

  DATA: t_edas  TYPE STANDARD TABLE OF ty_edas,
        wa_edas LIKE LINE OF t_edas.

  DATA: p_budat1 like zes_ekbe-budat,
        p_budat2 like p_budat1.

  DATA: v_days TYPE i.

  DATA: p_ebeln   TYPE RANGE OF ebeln,
        ls_ebeln  LIKE LINE OF  p_ebeln,
        p_bukrs   TYPE RANGE OF bukrs,
        ls_bukrs  LIKE LINE OF  p_bukrs,
        p_budat   TYPE RANGE OF budat,
        ls_budat  LIKE LINE OF  p_budat.

  DATA: p_tot(1).

*  DATA: it_ekko   TYPE ztt_ekko.

  DATA: it_mkpf TYPE ztt_mkpf,
        wa_mkpf LIKE LINE OF it_mkpf.

  DATA: it_rbkp TYPE ztt_rbkp,
        wa_rbkp LIKE LINE OF it_rbkp.

  DATA: t_edas2  TYPE STANDARD TABLE OF ty_edas,
        wa_edas2 LIKE LINE OF t_edas2.

  DATA: it_grs_movs TYPE ztt_grs_movs,
        wa_grs_movs LIKE LINE OF it_grs_movs.

  CLEAR: t_edas, wa_edas,  v_days.

*  perform valida_fechas2 using PO_NUMBER GRS_SDATE GRS_EDATE message language.

  CLEAR: p_budat1, p_budat2, message.

  IF NOT grs_sdate IS INITIAL.
*    PERFORM val_fec USING: grs_sdate p_budat1.
    CONCATENATE grs_sdate+6(4) grs_sdate+3(2) grs_sdate(2) INTO p_budat1.
  ENDIF.

  IF NOT grs_edate IS INITIAL.
 "   PERFORM val_fec USING: grs_edate p_budat2.
    CONCATENATE grs_edate+6(4) grs_edate+3(2) grs_edate(2) INTO p_budat2.
  ENDIF.

  IF grs_sdate IS INITIAL AND grs_edate IS INITIAL AND
     po_number IS INITIAL.
    IF language = 'S'.
      message = 'Favor de capturar fecha de busqueda o Pedido'.
    ELSEIF language = 'L'.
      message = 'Prosze wprowadzic date wejscia lub Dok. Zakup.'.
    ELSE.
      message = 'Please enter a Entry Date or Purchase Document'.
    ENDIF.
  ENDIF.

*  perform llena_rango using COMPANY PO_NUMBER GRS_SDATE GRS_EDATE message language.

  CLEAR: p_ebeln, p_bukrs.
  CLEAR: ls_ebeln, ls_bukrs.

  ls_ebeln-sign = 'I'.
* --- Rango x numero de pedido
  IF NOT po_number IS INITIAL.
    ls_ebeln-option = 'EQ'.
    ls_ebeln-low = po_number.
    APPEND ls_ebeln TO p_ebeln.
  ENDIF.

** --- Rango x fecha de Entrada
  CLEAR: p_budat, ls_budat.
  ls_budat-sign = 'I'.
  IF NOT grs_sdate IS INITIAL AND NOT grs_edate IS INITIAL.
    ls_budat-option = 'BT'.
    ls_budat-low    = p_budat1.
    ls_budat-high    = p_budat2.
    APPEND ls_budat TO p_budat.
  ENDIF.

  IF NOT grs_sdate IS INITIAL AND grs_edate IS INITIAL.
    ls_budat-option = 'EQ'.
    ls_budat-low    = p_budat1.
    APPEND ls_budat TO p_budat.
  ENDIF.

  IF grs_sdate IS INITIAL AND NOT grs_edate IS INITIAL.
    ls_budat-option = 'EQ'.
    ls_budat-low    = p_budat2.
    APPEND ls_budat TO p_budat.
  ENDIF.

  v_days = p_budat2 - p_budat1.
  IF v_days > 93.
    IF language EQ 'S'.
      message = 'Solo es posible la busqueda para un periodo de 3 meses'.
    ELSEIF language EQ 'L'.
      message = 'Wyszukiwanie mozna dokonac tylko dla 3 miesiecy'.
    ELSE.
      message = 'Search is possible only for 3 months '.
    ENDIF.
  ENDIF.

  IF NOT company IS INITIAL.
    ls_bukrs-sign   = 'I'.
    ls_bukrs-option = 'EQ' .
    ls_bukrs-low    = company.
    APPEND ls_bukrs TO p_bukrs.
  ENDIF.

  check message is initial.

  if p_tot = 'P'.
    corte = 'EBELN'.
  else.
    corte = 'EBELP'.
  endif.

  DATA: prov(10),
        provc(10) TYPE n.

  DATA: t_ekpo_ekko   TYPE ztt_gr_detail_pagos,
        wa_ekpo_ekko  LIKE LINE OF t_ekpo_ekko.

  DATA: it_ekbe     TYPE ztt_ekbe,
        wa_ekbe     LIKE LINE OF it_ekbe,
        t_ekbes     TYPE STANDARD TABLE OF ty_edas,
        wa_ekbes    LIKE LINE OF t_ekbes.

  DATA: t_ekko3   TYPE ztt_gr_detail_pagos,
        wa_ekko3  LIKE LINE OF t_ekpo_ekko.

  DATA: it_ekpo    TYPE ztt_ekpo,
        wa_ekpo   LIKE LINE OF it_ekpo.

  DATA: idx LIKE sy-tabix.

  clear prov.
  if vendor ca 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
    prov  = vendor.
  else.
    provc = vendor.
    prov  = provc.
  endif.

  IF NOT p_ebeln[] IS INITIAL.

*    select ebeln into ekko-ebeln from ekko
*      where ebeln in p_ebeln
*        and bukrs in p_bukrs
*        and lifnr eq prov.
*    endselect.

    " Solo tabla EKKO
*   zcl_ekko=>ekko_get( EXPORTING i_operacion = 'READ' et_ebeln = p_ebeln et_bukrs = p_bukrs p_lifnr = prov IMPORTING et_ekko = it_ekko ).

    CLEAR: t_ekpo_ekko.
    zcl_ekpo_ekko=>ekpo_ekko_get( EXPORTING i_operacion = 'READ' i_po_number = po_number IMPORTING et_ekpo_ekko = t_ekpo_ekko ).

    CHECK t_ekpo_ekko IS NOT INITIAL.

    CLEAR: t_ekbes.
    LOOP AT t_ekpo_ekko INTO wa_ekpo_ekko.

      CLEAR: it_ekbe.
      zcl_ekbe_gr_detail=>ekbe_get( EXPORTING i_operacion = 'READ'
                                    i_ebeln     = wa_ekpo_ekko-ebeln
                                    i_ebelp     = wa_ekpo_ekko-ebelp
                                    et_budat    = p_budat
                                    i_vgabe     = '1'
                                    IMPORTING et_ekbe = it_ekbe ).

      IF it_ekbe IS NOT INITIAL. "AND wa_ekpo_ekko-lifnr EQ prov. " // Ajuste relocalizado 1. ( wa_ekpo_ekko-lifnr )

        LOOP AT it_ekbe ASSIGNING FIELD-SYMBOL(<fs_ekbe>).
          <fs_ekbe>-maktx = wa_ekpo_ekko-txz01.
        ENDLOOP.
        LOOP AT it_ekbe INTO wa_ekbe.
          MOVE-CORRESPONDING wa_ekbe TO wa_ekbes.
          APPEND wa_ekbes TO t_ekbes.
        ENDLOOP.

      ENDIF.

    ENDLOOP.

*    select ebeln ebelp meins into table t_pedido
*    from ekpo
*    where ebeln in p_ebeln.
*
*    check sy-subrc eq 0.
*
*    select ebeln ebelp belnr buzei budat menge wrbtr waers bwart gjahr lfbnr
*      into table t_ekbes
*       from ekbe for all entries in t_pedido
*       where ebeln eq t_pedido-ebeln
*        and  ebelp eq t_pedido-ebelp
*        and  budat in p_budat
*        and  vgabe eq '1'.

  ELSEIF not p_budat is initial.
*    select ebeln ebelp belnr buzei budat menge wrbtr waers bwart gjahr lfbnr
*      into table t_ekbes
*       from ekbe
*       where vgabe eq '1'
*         and budat in p_budat.

    CLEAR: it_ekbe.
    zcl_ekbe_gr_detail=>ekbe_get( EXPORTING i_operacion = 'READ'
*                                    i_ebeln     = ''
*                                    i_ebelp     = ''
                                    et_budat    = p_budat
                                    i_vgabe     = '1'
                                    IMPORTING et_ekbe = it_ekbe ).

  ENDIF.

  check t_ekbes[] is not initial.

  CLEAR: t_ekko3, wa_ekbes, wa_ekko3.

*    select ebeln lifnr into table t_ekko3
*       from ekko for all entries in t_ekbes
*       where ebeln eq t_ekbes-ebeln.

* delete t_ekko3 where lifnr ne prov. " // Ajuste relocalizado 1.

  MOVE-CORRESPONDING t_ekbes TO t_ekko3.

  LOOP AT t_ekbes INTO wa_ekbes.

    read table t_ekko3 with key ebeln = wa_ekbes-ebeln INTO wa_ekko3.
    check sy-subrc eq 0.
    idx = sy-tabix.

"--Tomar los mov. 102 como negativos

    IF wa_ekbes-bwart EQ '102' OR wa_ekbes-bwart EQ '122'.
      wa_ekbes-menge = wa_ekbes-menge * -1.
      wa_ekbes-wrbtr = wa_ekbes-wrbtr * -1.
    ENDIF.

"--Texto de material
    CASE wa_ekbes-bwart.
      WHEN '102'.
        wa_ekbes-maktx = 'I N T E R N A L  A D J U S T M E N T'.
      WHEN '122'.
        wa_ekbes-maktx = 'R E J E C T E D  M A T E R I A L'.
      WHEN OTHERS.
*        select single txz01 from ekpo into t_ekbes-maktx
*                                     where ebeln eq t_ekbes-ebeln and
*                                            ebelp eq t_ekbes-ebelp.
        IF wa_ekko3-txz01 IS NOT INITIAL.
*          clear t_ekbes-maktx.
          wa_ekbes-maktx = wa_ekko3-txz01.
        ENDIF.
    ENDCASE.

    CLEAR: wa_edas.

"   Obtiene Doc. Ref
*    select single * from mkpf where mblnr = @wa_ekbes-belnr and
*                                    mjahr = @wa_ekbes-gjahr.

    CLEAR: it_mkpf, wa_mkpf.
    zcl_mkpf=>mkpf_get( EXPORTING i_operacion = 'READ'
                                  i_mblnr     = wa_ekbes-belnr
                                  i_mjahr     = wa_ekbes-gjahr
                        IMPORTING et_mkpf = it_mkpf ).

    IF it_mkpf IS NOT INITIAL.
      READ TABLE it_mkpf INDEX 1 INTO wa_mkpf.
      wa_ekbes-frbnr = wa_mkpf-xblnr.  "t_ekbe-xblnr.
    ENDIF.

    MODIFY t_ekbes FROM wa_ekbes.
    MOVE-CORRESPONDING wa_ekbes to wa_edas.
**-  si es Hoja de Entrada de Servicios                         " PENDIENTE TABLA ESSR SIN INFORMACION
*    select single * from essr where lblni eq t_ekbes-lfbnr.
*    if sy-subrc eq 0.
*      t_edas-lfbnr = essr-lblni.
*    else.
**-    Hoja de Serv.
*      clear t_edas-lfbnr.
*    endif.                                                     " PENDIENTE TABLA ESSR SIN INFORMACION FIN
*
**-  Si ya fué facturado (estatus y factura)
*    select single * from ekbe
*    where ebeln eq t_ekbes-ebeln and
*          ebelp eq t_ekbes-ebelp and
*          vgabe eq '2'           and
*          gjahr eq t_ekbes-gjahr and
*          lfbnr eq t_ekbes-lfbnr.

    CLEAR: it_ekbe, wa_ekbe.
    zcl_ekbe_gr_detail=>ekbe_get2( EXPORTING i_operacion = 'READ'
                                            i_ebeln     = wa_ekbes-ebeln
                                            i_ebelp     = wa_ekbes-ebelp
                                            i_vgabe     = '2'
                                            i_gjahr     = wa_ekbes-gjahr
                                            i_lfbnr     = wa_ekbes-lfbnr
                                  IMPORTING et_ekbe     = it_ekbe ).

    IF it_ekbe IS NOT INITIAL.

      READ TABLE it_ekbe INDEX 1 INTO wa_ekbe.
*       select single * from RBKP
*         where BELNR eq  ekbe-belnr
*         and   GJAHR eq  ekbe-gjahr.

      CLEAR: wa_rbkp, it_rbkp.
      zcl_rbkp=>rbkp_get( EXPORTING i_operacion  = 'READ'
                                    i_belnr      = wa_ekbe-belnr
                                    i_gjahr      = wa_ekbe-gjahr
                          IMPORTING et_rbkp      = it_rbkp ).

      IF it_rbkp IS NOT INITIAL.
*-        Factura

        READ TABLE it_rbkp INDEX 1 INTO wa_rbkp.
         wa_edas-xblnr = wa_rbkp-xblnr.
         wa_edas-status = 'X'.
      ENDIF.

    ELSE.
       wa_edas-status = ' '.
    ENDIF.

    wa_edas-menge2 = wa_ekbes-menge.
    wa_edas-wrbtr2 = wa_ekbes-wrbtr.

    CLEAR: it_ekpo, wa_ekpo, wa_edas-meins.

*    select single meins into t_edas-meins
*      from ekpo where ebeln = t_ekbes-ebeln
*              and   ebelp = t_ekbes-ebelp.

    zcl_ekpo=>ekpo_get2( EXPORTING i_operacion  = 'READ'
                                  i_ebeln       = wa_ekbes-ebeln
                                  i_ebelp       = wa_ekbes-ebelp
                        IMPORTING et_ekpo       = it_ekpo ).
    READ TABLE it_ekpo INTO DATA(ls_ekpo) INDEX 1.
    wa_edas-meins = ls_ekpo-meins.
    IF wa_edas-meins EQ 'ST'.
      wa_edas-meins = 'PZA'.
    ENDIF.

    APPEND wa_edas TO t_edas.

  ENDLOOP.

  CLEAR: t_cant, t_prec, t_edas2.
  CLEAR: wa_edas2.

  SORT t_edas by ebeln ebelp.

  CLEAR: grs_movs.
  LOOP AT t_edas INTO wa_edas.
    CLEAR: wa_grs_movs.
    wa_grs_movs-po_number   = wa_edas-ebeln.
    wa_grs_movs-item        = wa_edas-ebelp.
    wa_grs_movs-invoice     = wa_edas-xblnr.
*    wa_grs_movs-note        = wa_edas-frbnr.
    wa_grs_movs-note        = wa_edas-xblnr.
    wa_grs_movs-reference   = wa_edas-belnr.
    wa_grs_movs-date        = wa_edas-budat.
    wa_grs_movs-quantity    = wa_edas-menge2.
    wa_grs_movs-um          = wa_edas-meins.
    wa_grs_movs-net_price   = wa_edas-wrbtr2.
    wa_grs_movs-currency    = wa_edas-waers.
    wa_grs_movs-description = wa_edas-maktx.
    wa_grs_movs-serv_entry  = wa_edas-lfbnr.
    wa_grs_movs-status      = wa_edas-status.
    APPEND wa_grs_movs TO grs_movs.

  ENDLOOP.

ENDFUNCTION.
