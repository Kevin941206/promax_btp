FUNCTION-POOL zfact_elec.                   "MESSAGE-ID ..

*Tables: ekkn, essr, eskl, eskn, ekko, ekpo, ekbe, ekbz, lfa1, lfb1, bkpf, VTTK, KONV,
* ZINV_SPOOL, mkpf, esll, vttp, vtts, vfkp, likp, mseg, LFBW, T023T, skb1, RBKP, T001,
* TVKNT, adrc, VBFA, T006, BUT000.

DATA: t_vfkp   TYPE ztt_vfkp,
      st_vfkp  TYPE zst_vfkp,
      t_vtts   TYPE ztt_vtts,
      st_vtts  TYPE zst_vtts,
      t_tvknt  TYPE ztt_tvknt,
      st_tvknt TYPE zst_tvknt,
      t_adrc   TYPE ztt_adrc,
      st_adrc  TYPE zst_adrc,
      t_vttk   TYPE ztt_vttk,
      st_vttk  TYPE zst_vttk.

DATA: BEGIN OF bidat.
        INCLUDE STRUCTURE zst_bdcdata.
DATA: END OF bidat.

DATA: BEGIN OF messtab.
        INCLUDE STRUCTURE zst_bdcmsgcoll.
DATA: END OF messtab.

DATA: BEGIN OF d,
        mov(2),
        cuenta(10),
        moneda(3),
        cenco(10),
        iva(2),
        mes01(13),
        mn001(13),
        texto(60),
      END OF d.

DATA:BEGIN OF d_aux.
       INCLUDE STRUCTURE d.
DATA:END OF d_aux.
*************** tabla para cambio de centro de costo
DATA: BEGIN OF cencost,
        actual(4),
        nuevo(4),
      END OF cencost.
************ tabla para cambio de cuentas
DATA: BEGIN OF cuenta,
        actual(10),
        nuevo(10),
      END OF cuenta.

DATA: BEGIN OF t_ekbe,
        ebeln  LIKE zes_ekbe-ebeln,
        ebelp  LIKE zes_ekbe-ebelp,
        gjahr  LIKE zes_ekbe-gjahr,
        belnr  LIKE zes_ekbe-belnr,
        buzei  LIKE zes_ekbe-buzei,
        xblnr  LIKE zes_ekbe-xblnr,
        bwart  LIKE zes_ekbe-bwart,
        menge  LIKE zes_ekbe-menge,
        budat  LIKE zes_ekbe-budat,
        wrbtr  LIKE zes_ekbe-wrbtr,
        waers  LIKE zes_ekbe-waers,
        lfgja  LIKE zes_ekbe-gjahr,
        lfbnr  LIKE zes_ekbe-belnr,                         "MRM 090304
        lfpos  LIKE zes_ekbe-lfpos,
        dmbtr  LIKE zes_ekbe-dmbtr,                         "MRM 090304
        packno LIKE zes_ekbe-packno,
        introw LIKE zes_ekbe-introw,
      END   OF t_ekbe.

FIELD-SYMBOLS: <f>, <g>.
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
      l_text           LIKE zst_bseg-sgtxt,
      l_banco(5),
      l_tknum          LIKE zst_vttk-tknum,
      l_lifnr          LIKE ZST_lfa1-lifnr,
      l_ebeln          LIKE zekpo-ebeln,
      l_ebelp          LIKE zekpo-ebelp,
      l_wrbtr          LIKE zes_ekbe-wrbtr,
      m_31(1),
      bankid(5),
      peraux(2)        TYPE n, anoaux(2) TYPE n, dias(2) TYPE n,
      campo(11)        TYPE c, hoy(6), cant1(13), cant2(13), mov1(2), mov2(2).
DATA: importe TYPE p DECIMALS 4,
      f_enc   TYPE i VALUE 0.
DATA: period(2) TYPE n,
      meses     TYPE i VALUE 1,
      w_band(1) TYPE c.
DATA: error       TYPE i VALUE 0,
      suma        LIKE zst_bseg-wrbtr,
      l_suma(15),
      cargo       LIKE zst_bseg-wrbtr,
      cen_aux(10) TYPE c,
      l_waers     LIKE zekko-waers,
      Transp(1),
      totalcfdi   TYPE wrbtr.

*RANGES: R_EM for EKBE-BWART, R_SM for EKBE-BWART.

*  INCLUDE LSVIMDAT                                . "general data decl.
INCLUDE lzfact_elecf00                          . "view rel. data dcl.
