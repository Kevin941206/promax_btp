FUNCTION ZCARGA_DIR.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(FECHA) TYPE  BLDAT OPTIONAL
*"     VALUE(SOCIEDAD) TYPE  BUKRS OPTIONAL
*"     VALUE(TIPODOC) TYPE  BLART OPTIONAL
*"     VALUE(MONTO) TYPE  WRBTR OPTIONAL
*"     VALUE(CUENTA) TYPE  LIFNR OPTIONAL
*"     VALUE(REFERENCIA) TYPE  ZCHAR16 OPTIONAL
*"     VALUE(UID) TYPE  ZCHAR50 OPTIONAL
*"     VALUE(ID_BOVEDA) TYPE  ZCHAR25 OPTIONAL
*"     VALUE(VIA) TYPE  ZCHAR01 OPTIONAL
*"     VALUE(PLANTA) TYPE  DZUONR OPTIONAL
*"     VALUE(RFC) TYPE  STCD1 OPTIONAL
*"     VALUE(DOCUMENT) TYPE  EBELN
*"     VALUE(BASE_RET) TYPE  WRBTR OPTIONAL
*"     VALUE(IMP_RET) TYPE  WRBTR OPTIONAL
*"     VALUE(CARGOS) TYPE  ZTT_CARGA_DIR OPTIONAL
*"  EXPORTING
*"     VALUE(DOCTO) TYPE  BELNR_D
*"     VALUE(EJER_FIS) TYPE  GJAHR
*"     VALUE(MESSAGE) TYPE  CHAR100
*"     VALUE(CARGOS) TYPE  ZTT_CARGA_DIR
*"----------------------------------------------------------------------
  TYPES: BEGIN OF ty_D,
           mov(2),
           cuenta(10),
           moneda(3),
           cenco(10),
           iva(2),
           mes01(13),
           mn001(13),
           texto(60),
         END OF ty_D.

  DATA: hoy(6)      TYPE c.

  DATA: d_aux  TYPE STANDARD TABLE OF ty_d,
        wa_aux LIKE LINE OF d_aux.

  DATA: rc               TYPE i,
        l_fecha(10)      TYPE c,
        l_sociedad(4),
        l_tipodoc(2),
        l_cuenta(10)     TYPE n,
        l_referencia(16),
        l_boveda(25),
        l_uid(50),
        l_via(1),
        l_werks(18),
        l_ret(15),
        l_base(15),
        l_nofact(16),
        l_docto(10),
        l_ind(1),
        l_mov(2),
        l_message(100),
        l_banco(5).

  DATA: l_text  TYPE sgtxt,
        l_tknum TYPE zchar10.

  DATA: suma      TYPE wrbtr,
        Transp(1),
        l_ebeln   TYPE ebeln,
        l_ebelp   TYPE ebelp.

  DATA:
    r_em  TYPE RANGE OF bwart,
    wa_em LIKE LINE OF r_em,
    r_sm  TYPE RANGE OF bwart,
    wa_sm LIKE LINE OF r_sm.

  DATA: it_vttk TYPE ztt_vttk,
        wa_vttk LIKE LINE OF it_vttk.

  DATA: l_lifnr LIKE zst_lfa1-lifnr,
        st_vttk TYPE zst_vttk,
        it_vfkp TYPE ztt_vfkp,
        wa_vfkp LIKE LINE OF it_vfkp.

  DATA: it_ekko TYPE ztt_ekko,
        wa_ekko LIKE LINE OF it_ekko,
        it_ekpo TYPE ztt_ekpo,
        wa_ekpo LIKE LINE OF it_ekpo.

  DATA: wa_lfa1 TYPE zst_lfa1.

  DATA: it_carga_dir TYPE ztt_carga_dir,
        wa_carga_dir LIKE LINE OF it_carga_dir.

  DATA: cargo       LIKE zst_bseg-wrbtr,
        l_suma(15),
        totalcfdi   TYPE wrbtr,
        m_31(1),
        w_band(1)   TYPE c,
        cen_aux(10) TYPE c.

  DATA: disp_mode(1) TYPE c.

  TYPES: BEGIN OF ty_bidat,
           program  TYPE    zchar40,
           dynpro   TYPE    gjahr,
           dynbegin TYPE    zchar01,
           fnam     TYPE    zchar132,
           fval     TYPE    zchar132,
         END OF ty_bidat.

  DATA: bidat    TYPE STANDARD TABLE OF ty_bidat,
        wa_bidat LIKE LINE OF bidat.

  DATA: it_lfbw TYPE ztt_lfbw,
        wa_lfbw LIKE LINE OF it_lfbw.

  TYPES: BEGIN OF ty_messtab,
           tcode   TYPE    zchar20,
           dyname  TYPE    zchar40,
           dynumb  TYPE    zchar04,
           msgtyp  TYPE    zchar01,
           msgspra TYPE    zlang01,
           msgid   TYPE    zchar20,
           msgnr   TYPE    zchar03,
           msgv1   TYPE    zchar100,
           msgv2   TYPE    zchar100,
           msgv3   TYPE    zchar100,
           msgv4   TYPE    zchar100,
           env     TYPE    zchar04,
           fldname TYPE    zchar132,
         END OF ty_messtab.

  DATA: messtab    TYPE STANDARD TABLE OF ty_messtab,
        wa_messtab LIKE LINE OF messtab.

  DATA: period(2) TYPE n,
        campo(11) TYPE c.

  FIELD-SYMBOLS: <f>, <g>.

  DATA: cant1(13), cant2(13), mov1(2), mov2(2).
  DATA: importe TYPE p DECIMALS 4.

  DATA: it_skb1 TYPE ztt_skb1,
        wa_skb1 LIKE LINE OF it_skb1.

  DATA ls_params TYPE zst_ctu_params.

  CLEAR: d_aux.
  CLEAR: wa_aux, wa_carga_dir, cargo, l_suma, wa_bidat, bidat.

  CONCATENATE sy-datum+6(2) sy-datum+4(2) sy-datum+2(2) INTO hoy.

  CONCATENATE fecha+6(2) fecha+4(2) fecha+2(2) INTO l_fecha.

  l_sociedad   = sociedad.
  l_tipodoc    = tipodoc.
  l_referencia = referencia.
  l_uid        = uid.
  l_boveda     = id_boveda.
  l_via        = via.
  l_werks      = planta.
  l_base       = base_ret.
  l_ret        = imp_ret.
  l_tknum      = document.

  CLEAR: suma, transp, l_ebeln, l_ebelp.

  CLEAR: r_em, r_sm, wa_em, wa_sm..
*    - Entradas
  wa_em-sign   = 'I'.
  wa_em-option = 'EQ'.
  wa_em-low    = '101'.
  APPEND wa_em TO r_em.
  wa_em-low    = '103'.
  APPEND wa_em TO r_em.
  wa_em-low    = '105'.
  APPEND wa_em TO r_em.
  wa_em-low    = '911'.
  APPEND wa_em TO r_em.
  wa_em-low    = '913'.
  APPEND wa_em TO r_em.
  wa_em-low    = '123'.
  APPEND wa_em TO r_em.
*    - Salidas
  wa_sm-sign   = 'I'.
  wa_sm-option = 'EQ'.
  wa_sm-low    = '102'.
  APPEND wa_sm TO r_sm.
  wa_sm-low    = '104'.
  APPEND wa_sm TO r_sm.
  wa_sm-low    = '106'.
  APPEND wa_sm TO r_sm.
  wa_sm-low    = '122'.
  APPEND wa_sm TO r_sm.
  wa_sm-low    = '912'.
  APPEND wa_sm TO r_sm.
  wa_sm-low    = '924'.
  APPEND wa_sm TO r_sm.
  wa_sm-low    = '925'.
  APPEND wa_sm TO r_sm.


**    - Valida RFC del acreedor
**    - Verifica si es un No. transporte
*      SELECT SINGLE * FROM VTTK
*      WHERE TKNUM EQ L_TKNUM.

  CLEAR: it_vttk, wa_vttk.
  zcl_vttk_2=>vttk_get( EXPORTING i_operacion = 'READ' i_tknum = l_tknum IMPORTING et_vttk = it_vttk ).
  IF it_vttk IS NOT INITIAL.
    READ TABLE it_vttk INDEX 1 INTO wa_vttk.
    l_lifnr = wa_vttk-tdlnr.
**    -   Busca la OC referente al No. Transp.
*         SELECT single * FROM vfkp
*            WHERE rebel EQ L_TKNUM
*            and   ebeln ne space.

    CLEAR: st_vttk, it_vfkp.
    st_vttk-tknum = wa_vttk-tknum.
    zcl_qry_zget_transp_liq=>vfkp( EXPORTING i_operacion = 'READ' st_vttk = st_vttk IMPORTING t_vfkp = it_vfkp ).

    IF it_vfkp IS NOT INITIAL.

      READ TABLE it_vfkp INDEX 1 INTO wa_vfkp.
      l_ebeln = wa_vfkp-ebeln.
      l_ebelp = wa_vfkp-ebelp.
*            select single * from ekpo where ebeln eq l_ebeln.
    ENDIF.
  ELSE.
**    -  es una OC
*     select single * from ekko where ebeln eq DOCUMENT.

    CLEAR: it_ekko, wa_ekko.
    zcl_ekko_gr_list=>ekko_get3( EXPORTING i_operacion  = 'READ'
                                  i_ebeln      = document
                        IMPORTING et_ekKo      = it_ekKo ).

    IF it_ekko IS NOT INITIAL.
      READ TABLE it_ekko INDEX 1 INTO wa_ekko.
      l_lifnr = wa_ekko-lifnr.
*        select single * from ekpo WHERE ebeln EQ DOCUMENT.

      CLEAR: it_ekpo, wa_ekpo.
      zcl_ekpo=>ekpo_get3( EXPORTING i_operacion  = 'READ'
                                  i_ebeln      = document
                        IMPORTING et_ekpo      = it_ekpo ).
      READ TABLE it_ekpo INDEX 1 INTO wa_ekpo.
      l_ebeln = wa_ekpo-ebeln.
      l_ebelp = wa_ekpo-ebelp.
    ELSE.
      message = 'Documento no existe'.
      EXIT.
    ENDIF.

  ENDIF.

*    select single * from lfa1 where lifnr eq l_lifnr.
  CLEAR: wa_lfa1.
  zcl_lfa=>lfa1( EXPORTING i_operacion = 'READ' i_lifnr = l_lifnr IMPORTING et_lfa1 = wa_lfa1 ).

  IF wa_lfa1-stcd1 NE rfc.
    message = 'RFC del proveedor no coincide con XML'.
    EXIT.
  ENDIF.

*    - Valida Que tenga retenciones el CFDI
  IF imp_ret IS INITIAL.
    message = 'Para verificacion de facturas de transportistas debe declararse la retencion.'.
    EXIT.
  ENDIF.


  LOOP AT cargos INTO wa_carga_dir.
    MOVE-CORRESPONDING wa_carga_dir TO wa_AUX.
    wa_aux-mes01 = wa_aux-mn001 = wa_carga_dir-importe.
    APPEND wa_aux TO d_aux.

    CONDENSE wa_carga_dir-importe NO-GAPS.
    IF wa_carga_dir-importe(1) EQ '-'.
      SHIFT wa_carga_dir-importe LEFT.
      cargo = wa_carga_dir-importe.
      suma  = suma - cargo.
    ELSE.
      cargo = wa_carga_dir-importe.
      suma  = suma + cargo.
    ENDIF.

    AT LAST.
*        MOVE CUENTA TO D_AUX-CUENTA.
      wa_aux-cuenta = l_lifnr.
      wa_carga_dir-importe = suma .
      CONCATENATE '-'  wa_carga_dir-importe INTO wa_carga_dir-importe.
      CONDENSE wa_carga_dir-importe NO-GAPS.
      wa_aux-mes01 = wa_aux-mn001 = wa_carga_dir-importe.
      APPEND wa_aux TO d_aux.
    ENDAT.
  ENDLOOP.

  l_suma = suma.
  CONDENSE L_suma.

*   - Valida el importe total
  CLEAR: totalcfdi.
  totalcfdi = monto + imp_ret.
  IF suma NE totalcfdi.
    message = 'Total Factura difiere del Total XML.'.
    EXIT.
  ENDIF.

  CLEAR m_31.
  LOOP AT d_aux INTO wa_aux.
    AT LAST.
      m_31 = 'X'.
    ENDAT.

    IF wa_aux-cuenta IS INITIAL.
*       PERFORM CIERRA_DOC. # 1
*       PERFORM NDYNPRO USING 'SAPMF05A'   '0302'.
      CLEAR: wa_bidat.
      wa_bidat-program  = 'SAPMF05A'.
      wa_bidat-dynpro   = '0302'.
      wa_bidat-dynbegin = 'X'.
      APPEND wa_bidat TO bidat.

*       PERFORM CAMPO   USING 'BSEG-WRBTR'  L_SUMA.
      CLEAR: wa_bidat.
      wa_bidat-fnam   =  'BSEG-WRBTR'.
      wa_bidat-fval   =  l_suma.
      APPEND wa_bidat TO bidat.

*       PERFORM CAMPO   USING 'BSEG-ZFBDT'  HOY.     "Fecha Base
      CLEAR: wa_bidat.
      wa_bidat-fnam   =  'BSEG-ZFBDT'.
      wa_bidat-fval   =  hoy.
      APPEND wa_bidat TO bidat.

*       PERFORM CAMPO   USING 'BSEG-ZLSCH'  L_VIA.   "Vía de Pago
      CLEAR: wa_bidat.
      wa_bidat-fnam   =  'BSEG-ZLSCH'.
      wa_bidat-fval   =  l_via.
      APPEND wa_bidat TO bidat.

*       PERFORM CAMPO   USING 'BSEG-ZUONR'  L_WERKS. "Asignacion
      CLEAR: wa_bidat.
      wa_bidat-fnam   =  'BSEG-ZUONR'.
      wa_bidat-fval   =  l_werks.
      APPEND wa_bidat TO bidat.

*       PERFORM CAMPO   USING 'BSEG-SGTXT'  L_UID.   "Texto
      CLEAR: wa_bidat.
      wa_bidat-fnam   =  'BSEG-SGTXT'.
      wa_bidat-fval   =  l_uid.
      APPEND wa_bidat TO bidat.

      READ TABLE d_aux INDEX 1 INTO wa_aux.

      "**- Banco Propio
*       PERFORM CAMPO   USING 'bdc_okcode' 'AB'. "Overview
      CLEAR: wa_bidat.
      wa_bidat-fnam   =  'bdc_okcode'.
      wa_bidat-fval   =  'AB'.
      APPEND wa_bidat TO bidat.

**-     Retenciones
*       select single * from lfbw where lifnr eq l_lifnr
*         and bukrs eq L_SOCIEDAD.

      CLEAR: it_lfbw, wa_lfbw.
      zcl_lfbw=>lfbw_get( EXPORTING i_operacion = 'READ' i_lifnr = l_lifnr i_bukrs = l_sociedad IMPORTING et_lfbw = it_lfbw ).
      IF it_lfbw IS NOT INITIAL.
        READ TABLE it_lfbw INDEX 1 INTO wa_lfbw.
        IF wa_lfbw-wt_subjct NE space.

*           PERFORM NDYNPRO USING 'SAPLFWTD'   '0100'.
          CLEAR wa_bidat.
          wa_bidat-program  = 'SAPLFWTD'.
          wa_bidat-dynpro   = '0100'.
          wa_bidat-dynbegin = 'X'.
          APPEND wa_bidat TO bidat.

*           PERFORM CAMPO   USING 'WITH_DIALG-WT_BASE(01)'   L_BASE.
          CLEAR: wa_bidat.
          wa_bidat-fnam   =  'WITH_DIALG-WT_BASE(01)'.
          wa_bidat-fval   =  l_base.
          APPEND wa_bidat TO bidat.

*           PERFORM CAMPO   USING 'WITH_DIALG-WT_AMOUNT(01)' L_RET.
          CLEAR: wa_bidat.
          wa_bidat-fnam   =  'WITH_DIALG-WT_AMOUNT(01)'.
          wa_bidat-fval   =  l_ret.
          APPEND wa_bidat TO bidat.

*           PERFORM CAMPO   USING 'bdc_okcode' 'GO'.
          CLEAR: wa_bidat.
          wa_bidat-fnam   =  'bdc_okcode'.
          wa_bidat-fval   =  'GO'.
          APPEND wa_bidat TO bidat.

        ENDIF.
      ENDIF.
*
**-
*       PERFORM NDYNPRO USING 'SAPMF05A'   '0700'.
      CLEAR wa_bidat.
      wa_bidat-program  = 'SAPMF05A'.
      wa_bidat-dynpro   = '0700'.
      wa_bidat-dynbegin = 'X'.
      APPEND wa_bidat TO bidat.

*       PERFORM CAMPO   USING 'bdc_okcode' 'BU'.        " SALVAR
      CLEAR: wa_bidat.
      wa_bidat-fnam   =  'bdc_okcode'.
      wa_bidat-fval   =  'BU'.
      APPEND wa_bidat TO bidat.
*
*       PERFORM POST USING 'F-02'.
      disp_mode = 'N'.
      CLEAR: messtab, wa_messtab.

*        CALL TRANSACTION 'F-02' USING  BIDAT MODE disp_mode
*              UPDATE 'S' MESSAGES INTO messtab.
      ls_params-dismode = 'N'.
      ls_params-updmode = 'S'.
      zcl_call_transaction=>call_transaction( EXPORTING i_tcode = 'F02'
                                                        is_params = ls_params
                                                        it_bdcdata = bidat
                                              IMPORTING et_messtab = messtab ).
      IF NOT messtab IS INITIAL.
        LOOP AT  messtab INTO wa_messtab.
*            CALL FUNCTION 'MESSAGE_TEXT_BUILD'
*              EXPORTING
*                msgid               = wa_messtab-msgid
*                msgnr               = wa_messtab-MSGNR
*                msgv1               = wa_messtab-msgv1
*                msgv2               = wa_messtab-msgv2
*                msgv3               = wa_messtab-msgv3
*                msgv4               = wa_messtab-msgv4
*              IMPORTING
*                message_text_output = l_message
*              EXCEPTIONS
*              OTHERS              = 1.

          CHECK wa_messtab-msgv1 CA '0123456789'.
          l_docto = wa_messtab-msgv1.
        ENDLOOP.
      ENDIF.

      CLEAR: bidat.
      " FIN PERFORM CIERRA_DOC. #1

*****************************************************************************************************************
      CLEAR w_band.
    ELSE.
*        PERFORM LEE_DATOS. # 1
      period = '01'.
      IF wa_aux-moneda NE 'MXN'.
        campo(9) = 'D_AUX-MN0'.
      ELSE.
        campo(9) = 'D_AUX-MES'.
      ENDIF.
      campo+9(2) = period.

      ASSIGN (campo) TO <f>.
      cant1 = <f>.

      IF wa_aux-moneda NE 'MXN'.
        campo(9) = 'D_AUX-MES'.
      ELSE.
        campo(9) = 'D_AUX-MN0'.
      ENDIF.
      campo+9(2) = period.
      ASSIGN (campo) TO <g>.
      cant2 = <g>.

      CONDENSE cant1 NO-GAPS.
      CONDENSE cant2 NO-GAPS.
      IF cant1(1) EQ '-'.
        mov1 = '50'.
        mov2 = '40'.
        cant1+0(1) = ' '.
        cant2+0(1) = ' '.
        IF m_31 = 'X'.
          mov1 = '31'.
        ENDIF.
      ELSE.
        mov1 = '40'.
        mov2 = '50'.
      ENDIF.
      "*** <f> trae el saldo y en su caso <g> trae importe en pesos
      importe = cant1.
      CHECK importe GT 0.
*  FIN PERFORM LEE_DATOS. #1

      IF w_band IS INITIAL.
*          PERFORM ABRE_DOC. # 1
*          PERFORM  NDYNPRO USING 'sapmf05a' '0100'.
        CLEAR: wa_bidat.
        wa_bidat-program  = 'sapmf05a'.
        wa_bidat-dynpro   = '0100'.
        wa_bidat-dynbegin = 'X'.
        APPEND wa_bidat TO bidat.
*          PERFORM CAMPO USING 'bkpf-bldat'  L_FECHA .    "Fecha del Doc
        CLEAR: wa_bidat.
        wa_bidat-fnam   =  'bkpf-bldat'.
        wa_bidat-fval   =  l_fecha.
        APPEND wa_bidat TO bidat.
*          PERFORM CAMPO USING 'bkpf-budat'  HOY.         "Fecha contable
        CLEAR: wa_bidat.
        wa_bidat-fnam   =  'bkpf-budat'.
        wa_bidat-fval   =  hoy.
        APPEND wa_bidat TO bidat.
*          PERFORM CAMPO USING 'bkpf-bukrs'  L_SOCIEDAD.  "Sociedad
        CLEAR: wa_bidat.
        wa_bidat-fnam   =  'bkpf-bukrs'.
        wa_bidat-fval   =  l_sociedad.
        APPEND wa_bidat TO bidat.
*          PERFORM CAMPO USING 'bkpf-blart'  L_TIPODOC.   "Tipo Documento
        CLEAR: wa_bidat.
        wa_bidat-fnam   =  'bkpf-blart'.
        wa_bidat-fval   =  l_tipodoc.
        APPEND wa_bidat TO bidat.
*          PERFORM CAMPO USING 'BKPF-XBLNR'  L_REFERENCIA.
        CLEAR: wa_bidat.
        wa_bidat-fnam   =  'BKPF-XBLNR'.
        wa_bidat-fval   =  l_referencia.
        APPEND wa_bidat TO bidat.
*          PERFORM CAMPO USING 'BKPF-BKTXT'  L_BOVEDA.
        CLEAR: wa_bidat.
        wa_bidat-fnam   =  'BKPF-BKTXT'.
        wa_bidat-fval   =  l_boveda.
        APPEND wa_bidat TO bidat.
*          PERFORM CAMPO USING 'bkpf-waers'  D_AUX-MONEDA.  "moneda.
        CLEAR: wa_bidat.
        wa_bidat-fnam   =  'bkpf-waers'.
        wa_bidat-fval   =  wa_aux-moneda.
        APPEND wa_bidat TO bidat.
*          PERFORM CAMPO USING 'RF05A-NEWBS'  MOV1.         "CLVCT.
        CLEAR: wa_bidat.
        wa_bidat-fnam   =  'RF05A-NEWBS'.
        wa_bidat-fval   =  mov1.
        APPEND wa_bidat TO bidat.
*          PERFORM CAMPO USING 'RF05A-NEWKO'  D_AUX-CUENTA. "CUENTA.
        CLEAR: wa_bidat.
        wa_bidat-fnam   =  'RF05A-NEWKO'.
        wa_bidat-fval   =  wa_aux-cuenta.
        APPEND wa_bidat TO bidat.
*          PERFORM CAMPO USING 'bdc_okcode'  '/0'.          "ENTER
        CLEAR: wa_bidat.
        wa_bidat-fnam   =  'bdc_okcode'.
        wa_bidat-fval   =  '/0'.
        APPEND wa_bidat TO bidat.
*        *&--------------------------------------------------------------------&*
*          PERFORM NDYNPRO USING 'sapmf05a' '0300'.
        CLEAR: wa_bidat.
        wa_bidat-program  = 'sapmf05a'.
        wa_bidat-dynpro   = '0300'.
        wa_bidat-dynbegin = 'X'.
        APPEND wa_bidat TO bidat.
*          PERFORM CAMPO USING 'bseg-wrbtr'  CANT1.        "Importe documento
        CLEAR: wa_bidat.
        wa_bidat-fnam   =  'bseg-wrbtr'.
        wa_bidat-fval   =  cant1.
        APPEND wa_bidat TO bidat.
        IF wa_aux-moneda NE 'MXN'.
*            PERFORM CAMPO USING 'BSEG-DMBTR' CANT2.       " importe MN
          CLEAR: wa_bidat.
          wa_bidat-fnam   =  'BSEG-DMBTR'.
          wa_bidat-fval   =  cant2.
          APPEND wa_bidat TO bidat.
        ENDIF.

*          select single mwskz into skb1-mwskz from SKB1
*            where bukrs eq L_SOCIEDAD and SAKNR eq D_AUX-CUENTA.
        CLEAR: it_skb1, wa_skb1.
        zcl_skb1=>get_skb1( EXPORTING i_operacion = 'READ' i_bukrs = l_sociedad i_saknr = wa_aux-cuenta IMPORTING et_skb1 = it_skb1 ).

        IF it_skb1 IS NOT INITIAL.
          READ TABLE it_skb1 INDEX 1 INTO wa_skb1.

        ENDIF.

        IF wa_aux-iva NE  ' ' AND wa_skb1-mwskz NE space.
*          PERFORM CAMPO USING 'BSEG-MWSKZ' D_AUX-IVA.         "Indicador IVA
          CLEAR: wa_bidat.
          wa_bidat-fnam   =  'BSEG-MWSKZ'.
          wa_bidat-fval   =  wa_aux-iva.
          APPEND wa_bidat TO bidat.
        ENDIF.
*
*        PERFORM CAMPO USING 'BKPF-XMWST' ' '.           "Calcula IVA
        CLEAR: wa_bidat.
        wa_bidat-fnam   =  'BKPF-XMWST'.
        wa_bidat-fval   =  ' '.
        APPEND wa_bidat TO bidat.

*         PERFORM CAMPO USING 'BSEG-SGTXT' D_AUX-TEXTO.      " TEXTO DE POSICION
        CLEAR: wa_bidat.
        wa_bidat-fnam   =  'BSEG-SGTXT'.
        wa_bidat-fval   =  wa_aux-texto.
        APPEND wa_bidat TO bidat.
* FIN PERFORM ABRE_DOC. # 1
        w_band = 'S'.
      ELSE.
*          PERFORM SIG_MOV. # 1
*          PERFORM CAMPO USING 'RF05A-NEWBS'  MOV1.        "CLVCT.
        CLEAR: wa_bidat.
        wa_bidat-fnam   =  'RF05A-NEWBS'.
        wa_bidat-fval   = mov1.
        APPEND wa_bidat TO bidat.
*          PERFORM CAMPO USING 'RF05A-NEWKO'  D_AUX-CUENTA.    "CUENTA.
        CLEAR: wa_bidat.
        wa_bidat-fnam   =  'RF05A-NEWKO'.
        wa_bidat-fval   =  wa_aux-cuenta.
        APPEND wa_bidat TO bidat.
*          PERFORM CAMPO USING 'bdc_okcode'  '/0'.         "ENTER
        CLEAR: wa_bidat.
        wa_bidat-fnam   =  'bdc_okcode'.
        wa_bidat-fval   =  '/0'.
        APPEND wa_bidat TO bidat.
*        *&--------------------------------------------------------------------&*
*
*        *- Entra cuando no sea la cuenta del acreedor
        IF m_31 EQ space AND l_lifnr NE wa_aux-cuenta.
*           PERFORM NDYNPRO USING 'SAPLKACB' '0002'.
          CLEAR: wa_bidat.
          wa_bidat-program  = 'SAPLKACB'.
          wa_bidat-dynpro   = '0002'.
          wa_bidat-dynbegin = 'X'.
          APPEND wa_bidat TO bidat.
*           PERFORM CAMPO USING 'COBL-KOSTL' CEN_AUX.
          CLEAR: wa_bidat.
          wa_bidat-fnam   =  'COBL-KOSTL'.
          wa_bidat-fval   =  cen_aux.
          APPEND wa_bidat TO bidat.
*           PERFORM CAMPO USING 'bdc_okcode'  '/0'.         " ENTER
          CLEAR: wa_bidat.
          wa_bidat-fnam   =  'bdc_okcode'.
          wa_bidat-fval   =  '/0'.
          APPEND wa_bidat TO bidat.
        ENDIF.

        CHECK m_31 EQ space.

*         PERFORM NDYNPRO USING 'sapmf05a' '0312'. "300
        CLEAR: wa_bidat.
        wa_bidat-program  = 'sapmf05a'.
        wa_bidat-dynpro   = '0312'.
        wa_bidat-dynbegin = 'X'.
        APPEND wa_bidat TO bidat.
*          PERFORM CAMPO USING 'BSEG-WRBTR'  CANT1.        "Importe documento
        CLEAR: wa_bidat.
        wa_bidat-fnam   =  'BSEG-WRBTR'.
        wa_bidat-fval   =  cant1.
        APPEND wa_bidat TO bidat.
*          PERFORM CAMPO USING 'BSEG-FWBAS'  L_BASE.        "Base imponible
        CLEAR: wa_bidat.
        wa_bidat-fnam   =  'BSEG-FWBAS'.
        wa_bidat-fval   =  l_base.
        APPEND wa_bidat TO bidat.
*
        IF wa_aux-moneda NE 'MXN'.
*            PERFORM CAMPO USING 'BSEG-DMBTR' CANT2.       " importe MN
          CLEAR: wa_bidat.
          wa_bidat-fnam   =  'BSEG-DMBTR'.
          wa_bidat-fval   =  cant2.
          APPEND wa_bidat TO bidat.
        ENDIF.

*          select single mwskz into skb1-mwskz from SKB1
*            where bukrs eq L_SOCIEDAD and SAKNR eq D_AUX-CUENTA.

        CLEAR: it_skb1, wa_skb1.
        zcl_skb1=>get_skb1( EXPORTING i_operacion = 'READ' i_bukrs = l_sociedad i_saknr = wa_aux-cuenta IMPORTING et_skb1 = it_skb1 ).

        IF it_skb1 IS NOT INITIAL.
          READ TABLE it_skb1 INDEX 1 INTO wa_skb1.
        ENDIF.

        IF wa_aux-iva NE  ' ' AND wa_skb1-mwskz NE space.
*            PERFORM CAMPO USING 'BSEG-MWSKZ' D_AUX-IVA.         "Indicador IVA
          CLEAR: wa_bidat.
          wa_bidat-fnam   =  'BSEG-MWSKZ'.
          wa_bidat-fval   =  wa_aux-iva.
          APPEND wa_bidat TO bidat.
        ENDIF.
*          PERFORM CAMPO USING 'BSEG-SGTXT' D_AUX-TEXTO.      " TEXTO DE POSICION
        CLEAR: wa_bidat.
        wa_bidat-fnam   =  'BSEG-SGTXT'.
        wa_bidat-fval   =  wa_aux-texto.
        APPEND wa_bidat TO bidat.
*  FIN PERFORM SIG_MOV.
      ENDIF.
      cen_aux = wa_aux-cenco.
    ENDIF.
  ENDLOOP.

*   PERFORM CIERRA_DOC. #2
*   PERFORM NDYNPRO USING 'SAPMF05A'   '0302'.
  CLEAR: wa_bidat.
  wa_bidat-program  = 'SAPMF05A'.
  wa_bidat-dynpro   = '0302'.
  wa_bidat-dynbegin = 'X'.
  APPEND wa_bidat TO bidat.

*   PERFORM CAMPO   USING 'BSEG-WRBTR'  L_SUMA.
  CLEAR: wa_bidat.
  wa_bidat-fnam   =  'BSEG-WRBTR'.
  wa_bidat-fval   =  l_suma.
  APPEND wa_bidat TO bidat.

*   PERFORM CAMPO   USING 'BSEG-ZFBDT'  HOY.     "Fecha Base
  CLEAR: wa_bidat.
  wa_bidat-fnam   =  'BSEG-ZFBDT'.
  wa_bidat-fval   =  hoy.
  APPEND wa_bidat TO bidat.

*   PERFORM CAMPO   USING 'BSEG-ZLSCH'  L_VIA.   "Vía de Pago
  CLEAR: wa_bidat.
  wa_bidat-fnam   =  'BSEG-ZLSCH'.
  wa_bidat-fval   =  l_via.
  APPEND wa_bidat TO bidat.

*   PERFORM CAMPO   USING 'BSEG-ZUONR'  L_WERKS. "Asignacion
  CLEAR: wa_bidat.
  wa_bidat-fnam   =  'BSEG-ZUONR'.
  wa_bidat-fval   =  l_werks.
  APPEND wa_bidat TO bidat.

*   PERFORM CAMPO   USING 'BSEG-SGTXT'  L_UID.   "Texto
  CLEAR: wa_bidat.
  wa_bidat-fnam   =  'BSEG-SGTXT'.
  wa_bidat-fval   =  l_uid.
  APPEND wa_bidat TO bidat.

  READ TABLE d_aux INDEX 1 INTO wa_aux.

  "**- Banco Propio
*   PERFORM CAMPO   USING 'bdc_okcode' 'AB'. "Overview
  CLEAR: wa_bidat.
  wa_bidat-fnam   =  'bdc_okcode'.
  wa_bidat-fval   =  'AB'.
  APPEND wa_bidat TO bidat.

*    *-     Retenciones
*   select single * from lfbw where lifnr eq l_lifnr
*     and bukrs eq L_SOCIEDAD.

  CLEAR: it_lfbw, wa_lfbw.
  zcl_lfbw=>lfbw_get( EXPORTING i_operacion = 'READ' i_lifnr = l_lifnr i_bukrs = l_sociedad IMPORTING et_lfbw = it_lfbw ).
  IF it_lfbw IS NOT INITIAL.
    READ TABLE it_lfbw INDEX 1 INTO wa_lfbw.
    IF wa_lfbw-wt_subjct NE space.

*       PERFORM NDYNPRO USING 'SAPLFWTD'   '0100'.
      CLEAR wa_bidat.
      wa_bidat-program  = 'SAPLFWTD'.
      wa_bidat-dynpro   = '0100'.
      wa_bidat-dynbegin = 'X'.
      APPEND wa_bidat TO bidat.

*       PERFORM CAMPO   USING 'WITH_DIALG-WT_BASE(01)'   L_BASE.
      CLEAR: wa_bidat.
      wa_bidat-fnam   =  'WITH_DIALG-WT_BASE(01)'.
      wa_bidat-fval   =  l_base.
      APPEND wa_bidat TO bidat.

*       PERFORM CAMPO   USING 'WITH_DIALG-WT_AMOUNT(01)' L_RET.
      CLEAR: wa_bidat.
      wa_bidat-fnam   =  'WITH_DIALG-WT_AMOUNT(01)'.
      wa_bidat-fval   =  l_ret.
      APPEND wa_bidat TO bidat.

*       PERFORM CAMPO   USING 'bdc_okcode' 'GO'.
      CLEAR: wa_bidat.
      wa_bidat-fnam   =  'bdc_okcode'.
      wa_bidat-fval   =  'GO'.
      APPEND wa_bidat TO bidat.

    ENDIF.
  ENDIF.
*
*    *-
*   PERFORM NDYNPRO USING 'SAPMF05A'   '0700'.
  CLEAR wa_bidat.
  wa_bidat-program  = 'SAPMF05A'.
  wa_bidat-dynpro   = '0700'.
  wa_bidat-dynbegin = 'X'.
  APPEND wa_bidat TO bidat.

*   PERFORM CAMPO   USING 'bdc_okcode' 'BU'.        " SALVAR
  CLEAR: wa_bidat.
  wa_bidat-fnam   =  'bdc_okcode'.
  wa_bidat-fval   =  'BU'.
  APPEND wa_bidat TO bidat.
*
*   PERFORM POST USING 'F-02'.
  disp_mode = 'N'.
  CLEAR: messtab, wa_messtab.

*    CALL TRANSACTION 'F-02' USING  BIDAT MODE disp_mode
*          UPDATE 'S' MESSAGES INTO messtab.
  ls_params-dismode = 'N'.
  ls_params-updmode = 'S'.
  zcl_call_transaction=>call_transaction( EXPORTING i_tcode = 'F02'
                                                    is_params = ls_params
                                                    it_bdcdata = bidat
                                          IMPORTING et_messtab = messtab ).
  IF NOT messtab IS INITIAL.
    LOOP AT  messtab INTO wa_messtab.
*        CALL FUNCTION 'MESSAGE_TEXT_BUILD'
*          EXPORTING
*            msgid               = wa_messtab-msgid
*            msgnr               = wa_messtab-MSGNR
*            msgv1               = wa_messtab-msgv1
*            msgv2               = wa_messtab-msgv2
*            msgv3               = wa_messtab-msgv3
*            msgv4               = wa_messtab-msgv4
*          IMPORTING
*            message_text_output = l_message
*          EXCEPTIONS
*          OTHERS              = 1.

      CHECK wa_messtab-msgv1 CA '0123456789'.
      l_docto = wa_messtab-msgv1.
    ENDLOOP.
  ENDIF.

  CLEAR: bidat.
  " FIN PERFORM CIERRA_DOC. #2

  CHECK NOT l_message IS INITIAL.
  message = l_message.
  docto = l_docto.
  ejer_fis = sy-datum(4).

ENDFUNCTION.

*&---------------------------------------------------------------------*

*FORM LEE_DATOS.
*
*MOVE '01' TO PERIOD.
*  IF D_AUX-MONEDA NE 'MXN'.
*    MOVE 'D_AUX-MN0' TO CAMPO(9).
*  ELSE.
*    MOVE 'D_AUX-MES' TO CAMPO(9).
*  ENDIF.
*  MOVE PERIOD TO CAMPO+9(2).
*
*  ASSIGN (CAMPO) TO <F>.
*  MOVE <F> TO CANT1.
*
*  IF D_AUX-MONEDA NE 'MXN'.
*    MOVE 'D_AUX-MES' TO CAMPO(9).
*  ELSE.
*    MOVE 'D_AUX-MN0' TO CAMPO(9).
*  ENDIF.
*  MOVE PERIOD TO CAMPO+9(2).
*  ASSIGN (CAMPO) TO <G>.
*  MOVE <G> TO CANT2.
*
*  CONDENSE CANT1 NO-GAPS.
*  CONDENSE CANT2 NO-GAPS.
*  IF CANT1(1) EQ '-'.
*    MOVE '50' TO MOV1.
*    MOVE '40' TO MOV2.
*    MOVE ' ' TO CANT1+0(1).
*    MOVE ' ' TO CANT2+0(1).
*    IF m_31 = 'X'.
*      MOVE '31' TO MOV1.
*    ENDIF.
*  ELSE.
*    MOVE '40' TO MOV1.
*    MOVE '50' TO MOV2.
*  ENDIF.
**** <f> trae el saldo y en su caso <g> trae importe en pesos
*  MOVE CANT1 TO IMPORTE.
*  CHECK IMPORTE GT 0.
*
*
*ENDFORM.                               " LEE_DATOS

*&---------------------------------------------------------------------*

*FORM  ABRE_DOC.
*  PERFORM  NDYNPRO USING 'sapmf05a' '0100'.
*  PERFORM CAMPO USING 'bkpf-bldat'  L_FECHA .    "Fecha del Doc
*  PERFORM CAMPO USING 'bkpf-budat'  HOY.         "Fecha contable
*  PERFORM CAMPO USING 'bkpf-bukrs'  L_SOCIEDAD.  "Sociedad
*  PERFORM CAMPO USING 'bkpf-blart'  L_TIPODOC.   "Tipo Documento
*  PERFORM CAMPO USING 'BKPF-XBLNR'  L_REFERENCIA.
*  PERFORM CAMPO USING 'BKPF-BKTXT'  L_BOVEDA.
*  PERFORM CAMPO USING 'bkpf-waers'  D_AUX-MONEDA.  "moneda.
*  PERFORM CAMPO USING 'RF05A-NEWBS'  MOV1.         "CLVCT.
*  PERFORM CAMPO USING 'RF05A-NEWKO'  D_AUX-CUENTA. "CUENTA.
*  PERFORM CAMPO USING 'bdc_okcode'  '/0'.          "ENTER
**&--------------------------------------------------------------------&*
*  PERFORM NDYNPRO USING 'sapmf05a' '0300'.
*  PERFORM CAMPO USING 'bseg-wrbtr'  CANT1.        "Importe documento
*  IF D_AUX-MONEDA NE 'MXN'.
*    PERFORM CAMPO USING 'BSEG-DMBTR' CANT2.       " importe MN
*  ENDIF.
*
*  select single mwskz into skb1-mwskz from SKB1
*    where bukrs eq L_SOCIEDAD and SAKNR eq D_AUX-CUENTA.
*
*  IF D_AUX-IVA NE  ' ' and skb1-mwskz ne space.
*  PERFORM CAMPO USING 'BSEG-MWSKZ' D_AUX-IVA.         "Indicador IVA
*  ENDIF.
*
*  PERFORM CAMPO USING 'BKPF-XMWST' ' '.           "Calcula IVA
*  PERFORM CAMPO USING 'BSEG-SGTXT' D_AUX-TEXTO.      " TEXTO DE POSICION
*ENDFORM.                               " ABRE_DOC

*&---------------------------------------------------------------------*

*FORM SIG_MOV.
*  PERFORM CAMPO USING 'RF05A-NEWBS'  MOV1.        "CLVCT.
*  PERFORM CAMPO USING 'RF05A-NEWKO'  D_AUX-CUENTA.    "CUENTA.
*  PERFORM CAMPO USING 'bdc_okcode'  '/0'.         "ENTER
**&--------------------------------------------------------------------&*
*
**- Entra cuando no sea la cuenta del acreedor
* if m_31 eq space and l_lifnr ne D_AUX-CUENTA.
*   PERFORM NDYNPRO USING 'SAPLKACB' '0002'.
*   PERFORM CAMPO USING 'COBL-KOSTL' CEN_AUX.
*   PERFORM CAMPO USING 'bdc_okcode'  '/0'.         " ENTER
*endif.
*
*   check m_31 eq space.
*
*   PERFORM NDYNPRO USING 'sapmf05a' '0312'. "300
*
**  endif.
*
*  PERFORM CAMPO USING 'BSEG-WRBTR'  CANT1.        "Importe documento
*  PERFORM CAMPO USING 'BSEG-FWBAS'  L_BASE.        "Base imponible
*
*  IF D_AUX-MONEDA NE 'MXN'.
*    PERFORM CAMPO USING 'BSEG-DMBTR' CANT2.       " importe MN
*  ENDIF.
*
*  select single mwskz into skb1-mwskz from SKB1
*    where bukrs eq L_SOCIEDAD and SAKNR eq D_AUX-CUENTA.
*
*  IF D_AUX-IVA NE  ' ' and skb1-mwskz ne space.
*  PERFORM CAMPO USING 'BSEG-MWSKZ' D_AUX-IVA.         "Indicador IVA
*  ENDIF.
*  PERFORM CAMPO USING 'BSEG-SGTXT' D_AUX-TEXTO.      " TEXTO DE POSICION
*ENDFORM.                               " SIG_MOV

*---------------------------------------------------------------------*

*FORM NDYNPRO USING PROG PANT.
*  CLEAR: wa_bidat.
*  wa_bidat-PROGRAM = prog.
*  MOVE PANT TO BIDAT-DYNPRO.
*  MOVE 'X' TO BIDAT-DYNBEGIN.
*  APPEND BIDAT.
*ENDFORM.


*---------------------------------------------------------------------*

*FORM CAMPO USING NCAMP VALOR.
*  CLEAR BIDAT.
*  MOVE NCAMP TO BIDAT-FNAM.
*  MOVE VALOR TO BIDAT-FVAL.
*  APPEND BIDAT.
*ENDFORM.

*---------------------------------------------------------------------*

*FORM POST USING TRANS.
*  data: disp_mode value  'N'.
*  clear: messtab. refresh: messtab.
*
*  CALL TRANSACTION 'F-02' USING  BIDAT MODE disp_mode
*      UPDATE 'S' MESSAGES INTO messtab.
*
*  if not messtab[] is initial.
*   Loop at  messtab.
*     call function 'MESSAGE_TEXT_BUILD'
*          exporting
*              msgid               = messtab-msgid
*              msgnr               = messtab-MSGNR
*              msgv1               = messtab-msgv1
*              msgv2               = messtab-msgv2
*              msgv3               = messtab-msgv3
*              msgv4               = messtab-msgv4
*         importing
*              message_text_output = l_message
*         exceptions
*              others              = 1.
*     check messtab-msgv1 ca '0123456789'.
*     L_DOCTO = messtab-msgv1.
*   endloop.
*  endif.
*
*  REFRESH BIDAT.
*
*ENDFORM.
