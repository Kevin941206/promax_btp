FUNCTION zget_transp_liq.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(TPBEZ) TYPE  TEXT20 OPTIONAL
*"     VALUE(TKNUM) TYPE  CHAR10 OPTIONAL
*"     VALUE(FKNUM) TYPE  CHAR10 OPTIONAL
*"     VALUE(LBLNI) TYPE  CHAR10 OPTIONAL
*"     VALUE(SIGNI) TYPE  TEXT20 OPTIONAL
*"     VALUE(TIPO_FLETE) TYPE  C DEFAULT 'C'
*"     VALUE(TDLNR) TYPE  ZTT_EINA_LIFNR OPTIONAL
*"  EXPORTING
*"     VALUE(MESSAGE) TYPE  BAPI_MSG
*"     VALUE(TRANSP) TYPE  ZTT_ZSD_TRANSP
*"  EXCEPTIONS
*"      ERROR
*"----------------------------------------------------------------------
*ranges: R_TPBEZ for VTTK-TPBEZ,
*        R_TKNUM for VTTK-TKNUM,
*        R_FKNUM for VFKP-FKNUM,
*        R_LBLNI for VFKP-LBLNI,
*        R_TDLNR for VFKP-TDLNR.


  DATA: t_transp       TYPE ztt_ZSD_TRANSP,
        st_transp      TYPE zst_zsd_transp,
        t_vttk         TYPE ztt_vttk,
        st_vttk        TYPE zst_vttk,
        text_el_tab    TYPE ztt_textpool,
        st_text_el_tab TYPE zst_textpool,
        lines          TYPE sy-tabix.

*  READ TEXTPOOL sy-repid INTO text_el_tab LANGUAGE sy-langu. 'Se debe hacer un select a la tabla repotext con where progname = @sy-repid and  langu = @sy-langu and type = 'R'.

  CLEAR: T_transp, t_vttk.

*if not TPBEZ is initial.
*   R_TPBEZ-sign   = 'I'.
*   R_TPBEZ-option = 'EQ'.
*   R_TPBEZ-low    = TPBEZ. append R_TPBEZ.
*endif.
*
*if not TKNUM is initial.
*   R_TKNUM-sign   = 'I'.
*   R_TKNUM-option = 'EQ'.
*   R_TKNUM-low    = TKNUM. append R_TKNUM.
*endif.
*
*if not FKNUM is initial.
*   R_FKNUM-sign   = 'I'.
*   R_FKNUM-option = 'EQ'.
*   R_FKNUM-low    = FKNUM. append R_FKNUM.
*endif.
*
*if not LBLNI is initial.
*   R_LBLNI-sign   = 'I'.
*   R_LBLNI-option = 'EQ'.
*   R_LBLNI-low    = LBLNI. append R_LBLNI.
*endif.
*
*if not TDLNR[] is initial.
*  refresh R_TDLNR. clear R_TDLNR.
*  LOOP AT TDLNR.
*    R_TDLNR-sign   = 'I'.
*    R_TDLNR-option = 'EQ'.
*    R_TDLNR-low    = TDLNR-LIFNR.
*    append R_TDLNR.
*  ENDLOOP.
*
*endif.
*
  IF tipo_flete EQ 'B' AND NOT signi IS INITIAL.
*
* select * into table T_VTTK from VTTK
*   where signi EQ SIGNI.
    zcl_qry_zget_transp_liq=>vttk( EXPORTING i_operacion = 'READ' signi = signi IMPORTING t_vttk = t_vttk ).

    LOOP AT t_vttk INTO st_vttk.
*   select * from VFKP
*     where rebel eq t_vttk-tknum.
      zcl_qry_zget_transp_liq=>vfkp( EXPORTING i_operacion = 'READ' st_vttk = st_vttk IMPORTING t_vfkp = t_vfkp ).

*       move: T_VTTK-tknum to T_transp-tknum,
*             T_VTTK-exti1 to T_transp-exti1,
*             T_VTTK-tpbez to T_transp-tpbez,
*             T_VTTK-text1 to T_transp-text1,
*             T_VTTK-text2 to T_transp-text2,
*             T_VTTK-text3 to T_transp-text3,
*             T_VTTK-text4 to T_transp-text4,
*             T_VTTK-signi to T_transp-signi,
*             VFKP-fknum to T_transp-fknum,
*             VFKP-lblni to T_transp-lblni,
*             VFKP-tdlnr to T_transp-tdlnr,
*             VFKP-tdlnr to T_transp-lifnr,
*             VFKP-netwr to T_transp-netwr,
*             VFKP-waers to T_transp-waers,
*             VFKP-bukrs to T_transp-bukrs.
      st_transp-tknum = st_VTTK-tknum.
      st_transp-exti1 = st_VTTK-exti1.
      st_transp-tpbez = st_VTTK-tpbez.
      st_transp-text1 = st_VTTK-text1.
      st_transp-text2 = st_VTTK-text2.
      st_transp-text3 = st_VTTK-text3.
      st_transp-text4 = st_VTTK-text4.
      st_transp-signi = st_VTTK-signi.

      LOOP AT t_vfkp INTO st_vfkp.
        st_transp-fknum = st_VFKP-fknum.
        st_transp-lblni = st_VFKP-lblni.
        st_transp-tdlnr = st_VFKP-tdlnr.
        st_transp-lifnr = st_VFKP-tdlnr.
        st_transp-netwr = st_VFKP-netwr.
        st_transp-waers = st_VFKP-waers.
        st_transp-bukrs = st_VFKP-bukrs.

        IF st_VFKP-repos IS INITIAL.
          st_VFKP-repos = '000001'.
        ENDIF.
*        select single name1 into T_transp-name from lfa1 where lifnr eq VFKP-tdlnr.
        zcl_qry_zget_transp_liq=>lfa1( EXPORTING i_operacion = 'READ' st_vfkp = st_vfkp IMPORTING st_transp_name = st_transp-name ).
*        select single butxt into T_transp-sociedad from T001 where bukrs eq T_transp-bukrs.
        zcl_qry_zget_transp_liq=>t001( EXPORTING i_operacion = 'READ' st_transp = st_transp IMPORTING st_transp_soc = st_transp-sociedad ).
*        select single abland1 knotz edort01 adrnz into (vtts-abland1, vtts-knotz, vtts-edort01, vtts-adrnz)
*        from VTTS where TKNUM eq VFKP-REBEL
**                  and   TSNUM eq VFKP-REPOS
*                  and   VSART eq '04'.
        zcl_qry_zget_transp_liq=>vtts( EXPORTING i_operacion = 'READ' st_vfkp = st_vfkp IMPORTING st_vtts = st_vtts ).
        IF st_vtts-abland1 IS INITIAL AND st_vtts-knotz IS INITIAL AND st_vtts-edort01 IS INITIAL AND st_vtts-adrnz IS INITIAL.
*        check sy-subrc eq 0.
          IF NOT st_vtts-knotz IS INITIAL.
*             select single bezei into tvknt-bezei from tvknt where spras eq 'S' and knote eq vtts-knotz.
            zcl_qry_zget_transp_liq=>tvknt( EXPORTING i_operacion = 'READ' st_vtts = st_vtts IMPORTING tvknt_bezei = st_tvknt-bezei ).
            CONCATENATE st_vtts-abland1 ',' st_tvknt-bezei INTO st_transp-denom.
          ELSEIF NOT st_vtts-adrnz IS INITIAL.
*            select single name1 city1 post_code1 into (adrc-name1, adrc-city1, adrc-post_code1)
*            from ADRC where addrnumber eq vtts-adrnz.
            zcl_qry_zget_transp_liq=>adcr( EXPORTING i_operacion = 'READ' st_vtts = st_vtts IMPORTING st_adcr = st_adrc ).
            CONCATENATE st_adrc-city1 '/' st_adrc-post_code1 '/' st_adrc-name1 INTO st_transp-denom.
          ELSE.
*             move vtts-edort01 to T_transp-denom.
            st_transp-denom = st_vtts-edort01.
          ENDIF.
        ENDIF.
        APPEND st_transp TO t_transp.
*       append T_transp.
      ENDLOOP.
*   endselect.
      IF T_transp[] IS INITIAL.  " #transporte sin saldo
        message = 'No. Transporte sin saldo'.
      ENDIF.
    ENDLOOP.
  ELSEIF NOT tknum IS INITIAL OR NOT tpbez IS INITIAL.
    CLEAR t_vttk.
* select * into table T_VTTK from VTTK
*   where TKNUM IN R_TKNUM
*   and   TPBEZ IN R_TPBEZ.
    zcl_qry_zget_transp_liq=>vttk2( EXPORTING i_operacion = 'READ' tknum = tknum tpbez = tpbez IMPORTING t_vttk = t_vttk ).
    IF t_vttk IS INITIAL.
      message = 'No. Transporte no existe'.
    ENDIF.
* if sy-subrc ne 0.  " #transporte no existe
*    message = 'No. Transporte no existe'.
* endif.
    LOOP AT t_vttk INTO st_vttk.
*   select * from VFKP
*     where fknum in r_fknum
*       and lblni in r_lblni
*       and rebel eq t_vttk-tknum.
      zcl_qry_zget_transp_liq=>vfkp2( EXPORTING i_operacion = 'READ' fknum = fknum lblni = lblni st_vttk = st_vttk IMPORTING t_vfkp = t_vfkp ).
*       move: T_VTTK-tknum to T_transp-tknum,
*             T_VTTK-exti1 to T_transp-exti1,
*             T_VTTK-tpbez to T_transp-tpbez,
*             T_VTTK-text1 to T_transp-text1,
*             T_VTTK-text2 to T_transp-text2,
*             T_VTTK-text3 to T_transp-text3,
*             T_VTTK-text4 to T_transp-text4,
      st_transp-tknum = st_VTTK-tknum.
      st_transp-exti1 = st_VTTK-exti1.
      st_transp-tpbez = st_VTTK-tpbez.
      st_transp-text1 = st_VTTK-text1.
      st_transp-text2 = st_VTTK-text2.
      st_transp-text3 = st_VTTK-text3.
      st_transp-text4 = st_VTTK-text4.
      st_transp-signi = st_VTTK-signi.
      LOOP AT t_vfkp INTO st_vfkp.
        st_transp-fknum = st_VFKP-fknum.
        st_transp-lblni = st_VFKP-lblni.
        st_transp-tdlnr = st_VFKP-tdlnr.
        st_transp-lifnr = st_VFKP-tdlnr.
        st_transp-netwr = st_VFKP-netwr.
        st_transp-waers = st_VFKP-waers.
        st_transp-bukrs = st_VFKP-bukrs.
*             VFKP-fknum to T_transp-fknum,
*             VFKP-lblni to T_transp-lblni,
*             VFKP-tdlnr to T_transp-tdlnr,
*             VFKP-tdlnr to T_transp-lifnr,
*             VFKP-netwr to T_transp-netwr,
*             VFKP-waers to T_transp-waers,
*             VFKP-bukrs to T_transp-bukrs.
        IF st_VFKP-repos IS INITIAL.
          st_VFKP-repos = '000001'.
        ENDIF.
        zcl_qry_zget_transp_liq=>lfa1( EXPORTING i_operacion = 'READ' st_vfkp = st_vfkp IMPORTING st_transp_name = st_transp-name ).
*        select single name1 into T_transp-name from lfa1 where lifnr eq VFKP-tdlnr.
        zcl_qry_zget_transp_liq=>t001( EXPORTING i_operacion = 'READ' st_transp = st_transp IMPORTING st_transp_soc = st_transp-sociedad ).
*        select single butxt into T_transp-sociedad from T001 where bukrs eq T_transp-bukrs.
        zcl_qry_zget_transp_liq=>vtts( EXPORTING i_operacion = 'READ' st_vfkp = st_vfkp IMPORTING st_vtts = st_vtts ).
*        select single abland1 knotz edort01 adrnz into (vtts-abland1, vtts-knotz, vtts-edort01, vtts-adrnz)
*        from VTTS where TKNUM eq VFKP-REBEL
*                  and   TSNUM eq VFKP-REPOS
*                  and   abland1 ne 'MX'.
        zcl_qry_zget_transp_liq=>vtts2( EXPORTING i_operacion = 'READ' st_vfkp = st_vfkp IMPORTING st_vtts = st_vtts ).
        IF st_vtts IS INITIAL AND tdlnr[] IS NOT INITIAL.
*
*             select single abland1 knotz edort01 adrnz into (vtts-abland1, vtts-knotz, vtts-edort01, vtts-adrnz)
*             from VTTS where TKNUM eq VFKP-REBEL
*                  and   TSNUM eq VFKP-REPOS
*                  and   TDLNR IN R_TDLNR
*                  and   edland1 eq 'US'.
          zcl_qry_zget_transp_liq=>vtts3( EXPORTING i_operacion = 'READ' tdlnr = tdlnr st_vfkp = st_vfkp IMPORTING st_vtts = st_vtts ).
        ENDIF.
        IF st_vtts IS INITIAL.
*          check sy-subrc eq 0.
          IF NOT st_vtts-knotz IS INITIAL.
            zcl_qry_zget_transp_liq=>tvknt( EXPORTING i_operacion = 'READ' st_vtts = st_vtts IMPORTING tvknt_bezei = st_tvknt-bezei ).
*             select single bezei into tvknt-bezei from tvknt where spras eq 'S' and knote eq vtts-knotz.
            CONCATENATE st_vtts-abland1 ',' st_tvknt-bezei INTO st_transp-denom.
          ELSEIF NOT st_vtts-adrnz IS INITIAL.
            zcl_qry_zget_transp_liq=>adcr( EXPORTING i_operacion = 'READ' st_vtts = st_vtts IMPORTING st_adcr = st_adrc ).
*            select single name1 city1 post_code1 into (adrc-name1, adrc-city1, adrc-post_code1)
*            from ADRC where addrnumber eq vtts-adrnz.
            CONCATENATE st_adrc-city1 '/' st_adrc-post_code1 '/' st_adrc-name1 INTO st_transp-denom.
          ELSE.
            st_transp-denom = st_vtts-edort01.
*             move vtts-edort01 to T_transp-denom.
          ENDIF.
        ENDIF.
        APPEND st_transp TO t_transp.
*          append T_transp.
      ENDLOOP.
*   endselect.
      IF t_transp[] IS INITIAL.  " #transporte sin saldo
        message = 'No. Transporte sin saldo'.
      ENDIF.
    ENDLOOP.

  ELSE.
*   select * from VFKP
*     where fknum in r_fknum
*       and lblni in r_lblni
*       and rebel in r_tknum.
    zcl_qry_zget_transp_liq=>vfkp3( EXPORTING i_operacion = 'READ' fknum = fknum lblni = lblni tknum = tknum
    st_vttk = st_vttk IMPORTING t_vfkp = t_vfkp ).
    LOOP AT t_vfkp INTO st_vfkp.
      st_transp-tknum = st_VFKP-rebel.
      st_transp-fknum = st_VFKP-fknum.
      st_transp-lblni = st_VFKP-lblni.
      st_transp-tdlnr = st_VFKP-tdlnr.
      st_transp-lifnr = st_VFKP-tdlnr.
      st_transp-netwr = st_VFKP-netwr.
      st_transp-waers = st_VFKP-waers.
      st_transp-bukrs = st_VFKP-bukrs.
*       move: VFKP-rebel to T_transp-tknum,
*             VFKP-fknum to T_transp-fknum,
*             VFKP-lblni to T_transp-lblni,
*             VFKP-tdlnr to T_transp-tdlnr,
*             VFKP-tdlnr to T_transp-lifnr,
*             VFKP-netwr to T_transp-netwr,
*             VFKP-waers to T_transp-waers,
*             VFKP-bukrs to T_transp-bukrs.
      IF st_VFKP-repos IS INITIAL.
        st_VFKP-repos = '000001'.
      ENDIF.
*       select single tpbez exti1 text1 text2 text3 text4
*       into (T_transp-tpbez, T_transp-exti1, T_transp-text1, T_transp-text2, T_transp-text3, T_transp-text4)
*       from vttk where tknum eq VFKP-rebel.
      zcl_qry_zget_transp_liq=>vttk3( EXPORTING i_operacion = 'READ' st_vfkp = st_vfkp IMPORTING st_transp = DATA(wa_transp) ).
      st_transp-tpbez = wa_transp-tpbez.
      st_transp-exti1 = wa_transp-exti1.
      st_transp-text1 = wa_transp-text1.
      st_transp-text2 = wa_transp-text2.
      st_transp-text3 = wa_transp-text3.
      st_transp-text4 = wa_transp-text4.
*       select single name1 into T_transp-name from lfa1 where lifnr eq VFKP-tdlnr.
      zcl_qry_zget_transp_liq=>lfa1( EXPORTING i_operacion = 'READ' st_vfkp = st_vfkp IMPORTING st_transp_name = st_transp-name ).
*       select single butxt into T_transp-sociedad from T001 where bukrs eq T_transp-bukrs.
      zcl_qry_zget_transp_liq=>t001( EXPORTING i_operacion = 'READ' st_transp = st_transp IMPORTING st_transp_soc = st_transp-sociedad ).
*       select single abland1 knotz edort01 adrnz into (vtts-abland1, vtts-knotz, vtts-edort01, vtts-adrnz)
*       from VTTS where TKNUM   eq VFKP-REBEL
*                 and   TSNUM   eq VFKP-REPOS
*                 and   abland1 ne 'MX'.
      zcl_qry_zget_transp_liq=>vtts2( EXPORTING i_operacion = 'READ' st_vfkp = st_vfkp IMPORTING st_vtts = st_vtts ).
      IF st_vtts IS INITIAL.
*          check sy-subrc eq 0.
        IF NOT st_vtts-knotz IS INITIAL.
*       if not vtts-knotz is initial.
          zcl_qry_zget_transp_liq=>tvknt( EXPORTING i_operacion = 'READ' st_vtts = st_vtts IMPORTING tvknt_bezei = st_tvknt-bezei ).
*          select single bezei into tvknt-bezei from tvknt where spras eq 'S' and knote eq vtts-knotz.
          CONCATENATE st_vtts-abland1 ',' st_tvknt-bezei INTO st_transp-denom.
        ELSEIF NOT st_vtts-adrnz IS INITIAL.
*            select single name1 city1 post_code1 into (adrc-name1, adrc-city1, adrc-post_code1)
*            from ADRC where addrnumber eq vtts-adrnz.
          zcl_qry_zget_transp_liq=>adcr( EXPORTING i_operacion = 'READ' st_vtts = st_vtts IMPORTING st_adcr = st_adrc ).
          CONCATENATE st_adrc-city1 '/' st_adrc-post_code1 '/' st_adrc-name1 INTO st_transp-denom.
*          move vtts-edort01 to T_transp-denom.
          st_transp-denom = st_vtts-edort01.
        ENDIF.
      ENDIF.
      APPEND st_transp TO t_transp.
*       append T_transp.
    ENDLOOP.
*   endselect.
    IF sy-subrc NE 0 OR T_transp[] IS INITIAL.  " #transporte sin saldo
      message = 'No. Transporte sin saldo'.
    ENDIF.
  ENDIF.

  CHECK message IS INITIAL.

  IF NOT T_transp[] IS INITIAL.
    DATA(lv_lines) = lines( t_transp ).
    IF lv_lines > 1.
*      READ TABLE text_el_tab WITH KEY id = 'I' key = 'E20'.
*      MOVE text_el_tab-entry TO message.
    ENDIF.
    transp[] = T_transp[].
  ELSE.
*    READ TABLE text_el_tab WITH KEY id = 'I' key = 'E22'.
*    MOVE text_el_tab-entry TO message.

  ENDIF.
ENDFUNCTION.
