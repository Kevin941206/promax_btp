FUNCTION zfiglmx_crp_journal_list.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(I_COMPANY) TYPE  BUKRS
*"     VALUE(I_DATE_FROM) TYPE  DATUM
*"     VALUE(I_DATE_TO) TYPE  DATUM
*"     VALUE(I_YEAR) TYPE  GJAHR
*"     VALUE(I_TIPO) TYPE  KOART
*"  EXPORTING
*"     VALUE(T_JOURNAL_LIST) TYPE  ZTT_ZCRP_JOURNAL
*"----------------------------------------------------------------------
  DATA: st_journal_list TYPE zcrp_journal.
  DATA: lv_banco(1) TYPE c.

  CLEAR: lt_fi_hd[], lt_fi_hd_tmp[].

*  SELECT bukrs belnr gjahr bktxt INTO (ls_fi_hd-bukrs, ls_fi_hd-belnr, ls_fi_hd-gjahr, ls_fi_hd-bktxt)
*         FROM bkpf
*        WHERE bukrs EQ i_company
**          AND gjahr EQ i_year
*          AND cpudt GE i_date_from
*          AND cpudt LE i_date_to.
  zcl_qry_zfiglmx_crp_journal=>journal_list_bkpf( EXPORTING i_operacion = 'READ' i_company = i_company i_date_from = i_date_from
  i_date_to = i_date_to i_year = i_year IMPORTING lt_fi_hd = lt_fi_hd ).
  LOOP AT lt_fi_hd INTO ls_fi_hd.

    CLEAR ls_fi_item.
    zcl_qry_zfiglmx_crp_journal=>journal_list_bseg2( EXPORTING i_operacion = 'READ' ls_fi_hd = ls_fi_hd i_tipo = i_tipo
    IMPORTING es_fi_item = ls_fi_item ).
    IF ls_fi_item IS INITIAL.
      DELETE lt_fi_hd WHERE belnr = ls_fi_hd-belnr AND bukrs = ls_fi_hd-bukrs AND gjahr = ls_fi_hd-gjahr.
    ENDIF.
  ENDLOOP.

*    SELECT SINGLE bukrs belnr gjahr INTO (ls_fi_item-bukrs, ls_fi_item-belnr, ls_fi_item-gjahr)
*          FROM bseg
*        WHERE bukrs EQ ls_fi_hd-bukrs
*          AND belnr EQ ls_fi_hd-belnr
*          AND gjahr EQ ls_fi_hd-gjahr
*          AND koart EQ i_tipo.
*    IF sy-subrc EQ 0.
*      APPEND ls_fi_hd TO lt_fi_hd.
*    ENDIF.
*  ENDSELECT.
*
  LOOP AT lt_fi_hd INTO ls_fi_hd.
*
    CLEAR lt_fi_item[].
*    SELECT bukrs belnr gjahr buzei buzid augbl koart shkzg mwskz dmbtr wrbtr
*           sgtxt xcpdd hkont kunnr lifnr xzahl zlsch rebzg stceg vptnr
*    FROM bseg INTO TABLE lt_fi_item
*                   WHERE bukrs = ls_fi_hd-bukrs
*                     AND belnr = ls_fi_hd-belnr
*                     AND gjahr = ls_fi_hd-gjahr
*                     AND koart = 'S'.
    zcl_qry_zfiglmx_crp_journal=>journal_list_bseg( EXPORTING i_operacion = 'READ' ls_fi_hd = ls_fi_hd i_tipo = 'S'
    IMPORTING lt_fi_item = lt_fi_item ).
    IF lt_fi_item IS NOT INITIAL.
      CLEAR lv_banco.
      LOOP AT lt_fi_item INTO ls_fi_item.
*        SELECT SINGLE * INTO ls_skb1
*                        FROM skb1
*                       WHERE bukrs EQ ls_fi_item-bukrs
*                         AND saknr EQ ls_fi_item-hkont
*                         AND hbkid NE space
*                         AND hktid NE space.
        CLEAR ls_skb1.
        zcl_qry_zfiglmx_crp_journal=>journal_list_skb1( EXPORTING i_operacion = 'READ' ls_fi_item  = ls_fi_item IMPORTING ls_skb1 = ls_skb1 ).
        IF ls_skb1 IS NOT INITIAL.
          lv_banco = 'X'.
          EXIT.
        ENDIF.
      ENDLOOP.
      IF lv_banco = 'X'.
        APPEND ls_fi_hd TO lt_fi_hd_tmp.
      ELSE.
        IF i_tipo EQ 'K'.
*          SELECT SINGLE * INTO ls_crp_aa
*                    FROM zfiglmx_crp_aa
*                   WHERE aa_id EQ ls_fi_hd-bktxt(4).
          zcl_qry_zfiglmx_crp_journal=>journal_list_crp_aa( EXPORTING i_operacion = 'READ' ls_fi_hd = ls_fi_hd IMPORTING ls_crp_aa = ls_crp_aa ).
          IF ls_crp_aa IS NOT INITIAL.
            APPEND ls_fi_hd TO lt_fi_hd_tmp.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDLOOP.
*
  LOOP AT lt_fi_hd_tmp INTO ls_fi_hd.
    st_journal_list-company    = ls_fi_hd-bukrs.
    st_journal_list-doc_number = ls_fi_hd-belnr.
    st_journal_list-year       = ls_fi_hd-gjahr.
    APPEND st_journal_list TO t_journal_list    .
*      t_journal_list[] = lt_fi_hd_tmp[].
  ENDLOOP.

ENDFUNCTION.
