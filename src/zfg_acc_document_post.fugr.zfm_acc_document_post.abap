FUNCTION zfm_acc_document_post.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(DOCUMENTHEADER) LIKE  ZST_BAPIACHE09 STRUCTURE
*"        ZST_BAPIACHE09
*"     VALUE(CUSTOMERCPD) LIKE  ZST_BAPIACPA09 STRUCTURE
*"        ZST_BAPIACPA09 OPTIONAL
*"     VALUE(CONTRACTHEADER) LIKE  ZST_BAPIACCAHD STRUCTURE
*"        ZST_BAPIACCAHD OPTIONAL
*"     REFERENCE(ACCOUNTGL) TYPE  ZTT_BAPIACGL09 OPTIONAL
*"     REFERENCE(ACCOUNTRECEIVABLE) TYPE  ZTT_BAPIACAR09 OPTIONAL
*"     REFERENCE(ACCOUNTPAYABLE) TYPE  ZTT_BAPIACAP09 OPTIONAL
*"     REFERENCE(ACCOUNTTAX) TYPE  ZTT_BAPIACTX09 OPTIONAL
*"     REFERENCE(CURRENCYAMOUNT) TYPE  ZTT_BAPIACCR09
*"     REFERENCE(CRITERIA) TYPE  ZTT_BAPIACKEC9 OPTIONAL
*"     REFERENCE(VALUEFIELD) TYPE  ZTT_BAPIACKEV9 OPTIONAL
*"     REFERENCE(EXTENSION1) TYPE  ZTT_BAPIACEXTC OPTIONAL
*"     REFERENCE(PAYMENTCARD) TYPE  ZTT_BAPIACPC09 OPTIONAL
*"     REFERENCE(CONTRACTITEM) TYPE  ZTT_BAPIACCAIT OPTIONAL
*"     REFERENCE(EXTENSION2) TYPE  BAPIPAREXTAB OPTIONAL
*"     REFERENCE(REALESTATE) TYPE  ZTT_BAPIACRE09 OPTIONAL
*"     REFERENCE(ACCOUNTWT) TYPE  ZTT_BAPIACWT09 OPTIONAL
*"  EXPORTING
*"     VALUE(OBJ_TYPE) LIKE  ZST_BAPIACHE09-OBJ_TYPE
*"     VALUE(OBJ_KEY) LIKE  ZST_BAPIACHE09-OBJ_KEY
*"     VALUE(OBJ_SYS) LIKE  ZST_BAPIACHE09-OBJ_SYS
*"     REFERENCE(RETURN) TYPE  ZTT_BAPIRET2
*"----------------------------------------------------------------------
  DATA(lt_accountgl) = accountgl.
  DATA(lt_accountwt) = accountwt.


  IF documentheader-ref_doc_no+00(02) EQ 'GD' AND
   documentheader-doc_type EQ 'AV'.
    RETURN.
  ENDIF.
  DATA: lv_monto_total    TYPE zbapiwt_bs,
        lv_monto_ret      TYPE zbapiwt_bs,
        lv_monto_iva      TYPE zbapiwt_bs,
        lv_diff           TYPE i,
        ls_currency       TYPE zst_bapiaccr09,
        lw_bkpf           TYPE zes_bkpf,
        lw_accountpayable TYPE zst_bapiacap09,
        lw_bseg           TYPE zst_bseg,
        lw_t000           TYPE zst_t000,
        lw_return         LIKE LINE OF return.

  CONSTANTS: c_budat_xxxx1231 TYPE c LENGTH 30 VALUE 'ZFI_AJUSTE_FECHA_31DIC'.
  TYPES: lty_budat TYPE RANGE OF budat.

  DATA: lr_budat        TYPE lty_budat.
  DATA: lr_budat_unconv TYPE RANGE OF char40. "efg_tab_ranges.
  DATA: ls_budat_unconv LIKE LINE OF lr_budat_unconv.
  DATA: lv_error        TYPE xfeld.

  FIELD-SYMBOLS: <lfs_budat_unconv_line> LIKE LINE OF lr_budat_unconv, "TYPE LINE OF efg_tab_ranges,
                 <lfs_budat_line>        TYPE LINE OF lty_budat,
                 <lfs_return_line>       LIKE LINE OF return.
  FIELD-SYMBOLS <lfs_accountgl_line> LIKE LINE OF accountgl.

  IF documentheader-ref_doc_no IS NOT INITIAL.

    zcl_acc_document_post=>bkpf( EXPORTING i_operacion = 'READ'
                                           i_bukrs = documentheader-comp_code
                                           i_gjahr = documentheader-fisc_year
                                           i_xblnr = documentheader-ref_doc_no
                                           i_blart = documentheader-doc_type
                                 IMPORTING es_bkpf = lw_bkpf ).
    IF sy-subrc = 0.

      zcl_acc_document_post=>bseg( EXPORTING i_operacion = 'READ'
                                             i_bukrs = lw_bkpf-bukrs
                                             i_gjahr = lw_bkpf-gjahr
                                             i_belnr = lw_bkpf-belnr
                                   IMPORTING es_bseg = lw_bseg ).
      IF sy-subrc = 0.

        READ TABLE accountpayable
        INTO lw_accountpayable
        WITH KEY vendor_no = lw_bseg-lifnr.
        IF sy-subrc = 0.
          CLEAR lw_return.

          obj_type = 'BKPFF'.
          obj_key  = '$'.

          lw_return-type       = 'E'.
          lw_return-id         = 'F5A'.
          lw_return-number     = '291'.
          lw_return-message_v1 = lw_bkpf-belnr.

          INSERT lw_return INTO return INDEX 1.

          RETURN.
        ENDIF.

      ENDIF.
    ENDIF.

  ENDIF.

  FIELD-SYMBOLS:
         <lfs_accountwt_line>  TYPE zst_bapiacwt09.
  CLEAR: lv_monto_total, lv_monto_ret, lv_monto_iva.

  LOOP AT currencyamount INTO ls_currency.
    IF ls_currency-itemno_acc = 99.
      lv_monto_total = abs( ls_currency-amt_doccur ).
    ELSE.
      lv_diff = ls_currency-itemno_acc MOD 4.
      IF  lv_diff <> 0.
        lv_monto_ret = lv_monto_ret + ls_currency-amt_doccur.
      ELSE.
        lv_monto_iva = lv_monto_iva + ls_currency-amt_doccur.
      ENDIF.
    ENDIF.
  ENDLOOP.
  UNASSIGN <lfs_accountwt_line>.
  READ TABLE lt_accountwt ASSIGNING   <lfs_accountwt_line>
        WITH  KEY   itemno_acc = '99'
                    wt_type = '01'.
  IF sy-subrc = 0 AND <lfs_accountwt_line> IS ASSIGNED.
    <lfs_accountwt_line>-bas_amt_lc = lv_monto_ret.
    <lfs_accountwt_line>-bas_amt_tc = lv_monto_ret.
    <lfs_accountwt_line>-bas_amt_l3 = lv_monto_ret.
  ENDIF.
  UNASSIGN <lfs_accountwt_line>.
  READ TABLE lt_accountwt ASSIGNING   <lfs_accountwt_line>
        WITH  KEY itemno_acc = '99'
                  wt_type = '05'.
  IF sy-subrc = 0 AND <lfs_accountwt_line> IS ASSIGNED.
    <lfs_accountwt_line>-bas_amt_lc = lv_monto_iva.
    <lfs_accountwt_line>-bas_amt_tc = lv_monto_iva.
    <lfs_accountwt_line>-bas_amt_l3 = lv_monto_iva.
  ENDIF.

  DATA: li_indxtx   TYPE STANDARD TABLE OF sy-tabix,
        li_indxcr   TYPE STANDARD TABLE OF sy-tabix,
        lv_indxtx   TYPE sy-tabix,
        lv_indxcr   TYPE sy-tabix,
        lv_doccur   TYPE zbapiwt_bs, "bapiwrbtr,
        lv_base     TYPE zbapiwt_bs, "bapifwbas,
        lv_tax_code TYPE mwskz.

  FIELD-SYMBOLS:
        <lfs_currency_line> TYPE zst_bapiaccr09.

  IF ( documentheader-comp_code EQ '1001' OR
       documentheader-comp_code EQ '1002' ) AND
     ( documentheader-doc_type EQ 'CV' OR
       documentheader-doc_type EQ 'FE' ).

    CLEAR: lv_indxcr, ls_currency, lv_doccur,
           lv_base, lv_tax_code, li_indxtx,
           li_indxcr.

    IF documentheader-doc_date+00(04) < documentheader-pstng_date+00(04).

      CLEAR: lr_budat_unconv[],
             lr_budat[].

      zcl_acc_document_post=>tvarvc( EXPORTING i_operacion = 'READ'
                                               i_name = c_budat_xxxx1231
                                     IMPORTING et_tvarvc = DATA(lt_tvarvc) ).
      LOOP AT lt_tvarvc INTO DATA(ls_tvarvc).
        ls_budat_unconv-sign = ls_tvarvc-sign.
        ls_budat_unconv-option = ls_tvarvc-opti.
        ls_budat_unconv-low = ls_tvarvc-low.
        ls_budat_unconv-high = ls_tvarvc-high.
        APPEND ls_budat_unconv TO lr_budat_unconv.
      ENDLOOP.

      LOOP AT lr_budat_unconv ASSIGNING <lfs_budat_unconv_line>.

        APPEND INITIAL LINE TO lr_budat ASSIGNING <lfs_budat_line>.

        PERFORM f_convert_date_to_internal CHANGING <lfs_budat_unconv_line>-low
                                                    lv_error.

        IF lv_error EQ 'X'.
          EXIT.
        ENDIF.

        PERFORM f_convert_date_to_internal CHANGING <lfs_budat_unconv_line>-high
                                                    lv_error.

        IF lv_error EQ 'X'.
          EXIT.
        ENDIF.

        <lfs_budat_line>-sign = <lfs_budat_unconv_line>-sign.
        <lfs_budat_line>-option = <lfs_budat_unconv_line>-option.
        <lfs_budat_line>-low = <lfs_budat_unconv_line>-low.
        <lfs_budat_line>-high = <lfs_budat_unconv_line>-high.

      ENDLOOP.

      IF lv_error IS INITIAL.

        IF documentheader-pstng_date IN lr_budat.
          CONCATENATE documentheader-doc_date+00(04) '1231' INTO documentheader-pstng_date.
          documentheader-fisc_year = documentheader-doc_date+00(04).
          documentheader-fis_period = '12'.

          LOOP AT lt_accountgl ASSIGNING <lfs_accountgl_line>
                                WHERE fis_period IS NOT INITIAL
                                  AND fisc_year IS NOT INITIAL
                                  AND pstng_date IS NOT INITIAL.

            <lfs_accountgl_line>-fis_period = documentheader-fis_period.
            <lfs_accountgl_line>-fisc_year  = documentheader-fisc_year.
            <lfs_accountgl_line>-pstng_date = documentheader-pstng_date.

          ENDLOOP.

        ENDIF.

      ENDIF.

    ENDIF.

    IF documentheader-doc_type EQ 'CV'.
      lv_tax_code = 'X4'.
    ELSE.
      lv_tax_code = 'V4'.
    ENDIF.

    LOOP AT accounttax INTO DATA(ls_accounttax) WHERE tax_code EQ lv_tax_code.
      lv_indxtx = sy-tabix.
      READ TABLE currencyamount INTO ls_currency
           WITH KEY itemno_acc = ls_accounttax-itemno_acc.
      IF sy-subrc EQ 0.
        lv_indxcr = sy-tabix.
        lv_doccur = lv_doccur + ls_currency-amt_doccur.
        lv_base = lv_base + ls_currency-amt_base.
        APPEND lv_indxcr TO li_indxcr.
        APPEND lv_indxtx TO li_indxtx.
        CLEAR: lv_indxcr, lv_indxtx.
      ENDIF.
    ENDLOOP.
    IF lines( li_indxcr ) > 1.
      READ TABLE li_indxcr INDEX 1 INTO lv_indxcr.
      READ TABLE currencyamount INDEX lv_indxcr
            ASSIGNING <lfs_currency_line>.
      IF sy-subrc = 0 AND
        <lfs_currency_line> IS ASSIGNED.
        <lfs_currency_line>-amt_doccur = lv_doccur.
        <lfs_currency_line>-amt_base = lv_base.
      ENDIF.
      DELETE li_indxcr INDEX 1.
      SORT li_indxcr DESCENDING.
      DATA(lt_currencyamount) = currencyamount[].
      LOOP AT li_indxcr INTO lv_indxcr.
        DELETE lt_currencyamount[] INDEX lv_indxcr.
      ENDLOOP.
      DELETE li_indxtx INDEX 1.
      SORT li_indxtx DESCENDING.
      DATA(lt_accounttax) = accounttax[].
      LOOP AT li_indxtx INTO lv_indxtx.
        DELETE lt_accounttax[] INDEX lv_indxtx.
      ENDLOOP.
    ENDIF.
  ENDIF.

   zcl_acc_document_post=>call_je_post( EXPORTING documentheader = documentheader
                                                  customercpd = customercpd
                                                  contractheader = contractheader
                                                  accountgl = lt_accountgl
                                                  accountreceivable = accountreceivable
                                                  accountpayable = accountpayable
                                                  accounttax = accounttax
                                                  currencyamount = currencyamount
                                                  criteria = criteria
                                                  valuefield = valuefield
                                                  extension1 = extension1
                                                  paymentcard = paymentcard
                                                  contractitem = contractitem
                                                  extension2 = extension2
                                                  realestate = realestate
                                                  accountwt = lt_accountwt
                                        IMPORTING obj_key = obj_key
                                                  obj_sys = obj_sys
                                                  obj_type = obj_type
                                                  return = return ).

ENDFUNCTION.


FORM f_convert_date_to_internal  CHANGING p_budat TYPE char40
                                          p_error TYPE xfeld.

  CLEAR: p_error.



ENDFORM.                    " F_CONVERT_DATE_TO_INTERNAL
