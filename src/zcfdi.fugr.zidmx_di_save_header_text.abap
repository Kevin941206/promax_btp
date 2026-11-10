FUNCTION zidmx_di_save_header_text.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_REFDOC) TYPE  VBELN
*"     VALUE(IV_BUKRS) TYPE  BUKRS
*"     VALUE(IV_GJAHR) TYPE  GJAHR OPTIONAL
*"     VALUE(IV_AWTYP) TYPE  AWTYP
*"     VALUE(IV_UUID) TYPE  ZUUID2
*"     VALUE(IV_RFC) TYPE  ZRFC
*"     VALUE(IV_IMPORTE) TYPE  ZIMPORTE_XML
*"     VALUE(IV_PYMT_FORM) TYPE  ZCHAR20 OPTIONAL
*"     VALUE(IV_PYMT_METH) TYPE  ZCHAR20 OPTIONAL
*"  EXPORTING
*"     VALUE(MESSAGE) TYPE  ZCHAR255
*"----------------------------------------------------------------------
*      TABLES: rbkp.
  DATA : lv_tdname    TYPE zchar70. "tdobname.
  DATA : ls_thead     TYPE zes_thead.
  DATA : v_cont      TYPE sy-tabix,
         v_cont_h    TYPE sy-tabix,
         v_cont_2    TYPE sy-tabix,
         v_cont_lang TYPE sy-tabix.
  DATA : lv_tdid_uuid TYPE zchar04.
  DATA : lv_tdid_rfc  TYPE zchar04.
  DATA : lv_tdid_imp  TYPE zchar04.
  DATA : lv_tdid_pymt_form  TYPE zchar04.
  DATA : lv_tdid_pymt_meth  TYPE zchar04.
  DATA : lt_lines TYPE STANDARD TABLE OF zes_tline,
         wa_lines LIKE LINE OF lt_lines.

  DATA : lv_awkey      TYPE awkey,
         lv_belnr_miro TYPE zchar10,
         lv_gjahr_miro TYPE gjahr.

  DATA: iv_bukrs_sd  TYPE bukrs,
        iv_refdoc_sd TYPE vbeln,
        iv_gjahr_sd  TYPE gjahr.

  DATA: it_bkpf TYPE ztt_lt_fi_hd,
        wa_bkpf LIKE LINE OF it_bkpf.

  DATA: lv_awkey2       TYPE awkey.
  DATA: it_t001 TYPE ztt_t001,
        wa_t001 LIKE LINE OF it_t001.

  CLEAR: it_bkpf, wa_bkpf, lv_awkey2, it_t001, wa_t001.

  CLEAR: lv_tdname, ls_thead.
  CLEAR: iv_bukrs_sd, iv_refdoc_sd, iv_gjahr_sd.

  IF iv_awtyp = 'VBRK'.
    lv_tdname = iv_refdoc.
  ELSEIF iv_awtyp = 'BKPF'.
    lv_tdname(4)    = iv_bukrs.
    lv_tdname+4(10) = iv_refdoc.
    lv_tdname+14(4) = iv_gjahr.
  ELSEIF iv_awtyp = 'VBBK'.   " Comercial SD VF03
    lv_tdname = iv_refdoc.

*      SELECT SINGLE bukrs belnr gjahr INTO (iv_bukrs_sd, iv_refdoc_sd, iv_gjahr_sd)
*               FROM bkpf
*              WHERE awtyp EQ 'VBRK'
*                AND awkey EQ iv_refdoc.

    lv_awkey2 = iv_refdoc.
    CONDENSE lv_awkey2.
    CLEAR: it_bkpf.
    zcl_bkpf=>get_bkpf( EXPORTING i_operacion  = 'READ'
                                  i_awtyp      = 'VBRK'
                                  i_awkey      = lv_awkey2
                        IMPORTING lt_bkpf      = it_bkpf ).

    IF it_bkpf IS NOT INITIAL.

      READ TABLE it_bkpf INDEX 1 INTO wa_bkpf.
      iv_bukrs_sd  = wa_bkpf-bukrs.
      iv_refdoc_sd = wa_bkpf-belnr.
      iv_gjahr_sd  = wa_bkpf-gjahr.

    ENDIF.


  ELSEIF iv_awtyp = 'BELEG'. "Textos para Contabilidad FB03
    lv_tdname(4)    = iv_bukrs.
    lv_tdname+4(10) = iv_refdoc.
    lv_tdname+14(4) = iv_gjahr.

  ENDIF.

  lv_tdid_uuid = 'ZUUI'.
  lv_tdid_rfc  = 'ZURF'.
  lv_tdid_imp  = 'ZUIM'.
  lv_tdid_pymt_form  = 'ZFOP'.
  lv_tdid_pymt_meth  = 'ZMEP'.

  ls_thead-tdlinesize = '132' .
*      SELECT SINGLE spras INTO ls_thead-tdspras FROM t001
*        WHERE bukrs = iv_bukrs.


  zcl_t001=>t001_get( EXPORTING i_operacion = 'READ'
                                i_bukrs     = iv_bukrs
                      IMPORTING et_t001     = it_t001 ).

  IF it_t001 IS NOT INITIAL.

    READ TABLE it_t001 INDEX 1 INTO wa_t001.
    ls_thead-tdspras = wa_t001-spras.

  ENDIF.

  IF iv_refdoc_sd IS NOT INITIAL.
    v_cont_h = 2.
  ELSE.
    v_cont_h = 1.
  ENDIF.

  v_cont_2 = 0.
  DO v_cont_h TIMES.

    v_cont_2 = v_cont_2 + 1.
    IF v_cont_2 = 2.

      CLEAR: iv_awtyp, lv_tdname.

      iv_awtyp   = 'BELEG'.
      lv_tdname(4)    = iv_bukrs_sd.
      lv_tdname+4(10) = iv_refdoc_sd.
      lv_tdname+14(4) = iv_gjahr_sd.

    ENDIF.

    v_cont = 0.
    DO 5 TIMES.
      v_cont = v_cont + 1.
      ls_thead-tdobject   =  iv_awtyp.
      ls_thead-tdname     =  lv_tdname.
      ls_thead-mandt      =  sy-mandt.

      IF ls_thead-tdspras IS INITIAL.
        ls_thead-tdspras = sy-langu.
      ENDIF.
      IF v_cont = 1.
        ls_thead-tdid       =  lv_tdid_uuid.
        CLEAR: lt_lines.
        CLEAR: wa_lines-tdline.
        wa_lines-tdformat = '*'.
        wa_lines-tdline   = iv_uuid.
        APPEND wa_lines TO lt_lines.
      ELSEIF v_cont = 2.
        ls_thead-tdid       =  lv_tdid_rfc.
        CLEAR: lt_lines.
        CLEAR: wa_lines-tdline.
        wa_lines-tdformat = '*'.
        wa_lines-tdline   = iv_rfc.
        APPEND wa_lines TO lt_lines.
      ELSEIF v_cont = 3.
        ls_thead-tdid       =  lv_tdid_imp.
        CLEAR: lt_lines.
        CLEAR: wa_lines-tdline.
        wa_lines-tdformat = '*'.
        wa_lines-tdline   = iv_importe.
        CONDENSE wa_lines-tdline NO-GAPS.
        APPEND wa_lines TO lt_lines.
      ELSEIF v_cont = 4  AND iv_pymt_form IS NOT INITIAL.
        ls_thead-tdid       =  lv_tdid_pymt_form.
        CLEAR: lt_lines.
        CLEAR: wa_lines-tdline.
        wa_lines-tdformat = '*'.
        wa_lines-tdline = iv_pymt_form.
        APPEND wa_lines TO lt_lines.
      ELSEIF v_cont = 5 AND iv_pymt_meth IS NOT INITIAL.
        ls_thead-tdid       =  lv_tdid_pymt_meth.
        CLEAR: lt_lines.
        CLEAR: wa_lines-tdline.
        wa_lines-tdformat = '*'.
        wa_lines-tdline   = iv_pymt_meth.
        APPEND wa_lines TO lt_lines.
      ENDIF.

      v_cont_lang = 0.
      DO 2 TIMES.
        v_cont_lang = v_cont_lang + 1.
        IF v_cont_lang = 1.
          ls_thead-tdspras = 'S'.
        ELSEIF v_cont_lang = 2.
          ls_thead-tdspras = 'E'.
        ENDIF.

*          CALL FUNCTION 'CREATE_TEXT'
*            EXPORTING
*              fid       = ls_thead-tdid
*              flanguage = ls_thead-tdspras
*              fname     = ls_thead-tdname
*              fobject   = ls_thead-tdobject
*            TABLES
*              flines    = lt_lines
*            EXCEPTIONS
*              no_init   = 1
*              no_save   = 2
*              OTHERS    = 3.
        zcl_textos=>create_text( i_id = ls_thead-tdid
                                 i_name = ls_thead-tdname
                                 i_object = ls_thead-tdobject
                                 i_spras = ls_thead-tdspras
                                 it_lines = lt_lines ).
*          CALL FUNCTION 'SAVE_TEXT'
*            EXPORTING
*              header          = ls_thead
*              savemode_direct = 'X'
*            TABLES
*              lines           = lt_lines
*            EXCEPTIONS
*              id              = 1
*              language        = 2
*              name            = 3
*              object          = 4
*              OTHERS          = 5.
            zcl_textos=>save_text( i_id = ls_thead-tdid
                                   i_name = ls_thead-tdname
                                   i_object = ls_thead-tdobject
                                   i_spras = ls_thead-tdspras
                                   i_save = abap_true
                                   it_lines = lt_lines ).
        IF sy-subrc <> 0.
          MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                  WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
                  RAISING error.

        ELSE.
          message = 'Done!'.
        ENDIF.
      ENDDO.

    ENDDO.
  ENDDO.

ENDFUNCTION.
