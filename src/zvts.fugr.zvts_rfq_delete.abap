FUNCTION zvts_rfq_delete.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(RFQ_DEL) TYPE  ZTT_RFQ
*"  EXPORTING
*"     VALUE(RFQ_MSSG) TYPE  ZTT_TLINE
*"----------------------------------------------------------------------
  DATA: ls_del  TYPE zes_rfq,
        ls_mssg TYPE zes_tline,
        mensaje TYPE ztdline.

  DATA ls_params TYPE zst_ctu_params.

  CLEAR: rfq_mssg.

  LOOP AT rfq_del INTO ls_del.
    CLEAR: bdc_tab.

    disp_mode ='N'.
    PERFORM dynpro USING:
         'X'   'SAPMM06E'      '0305',
         ' '   'RM06E-ANFNR'   ls_del-purch_doc,
         ' '   'BDC_OKCODE'    '/00'.

    PERFORM dynpro USING:
         'X'   'SAPMM06E'      '0301',
         ' '   'BDC_OKCODE'    '=AB'.  "Énvía al resumen ENF 27Jul2024

    PERFORM dynpro USING:
           'X'   'SAPMM06E'      '0323',
           ' '   'RM06E-EBELP'   ls_del-item,
           ' '   'BDC_OKCODE'    '/00',

           'X'   'SAPMM06E'             '0323',
           ' '   'RM06E-TCSELFLAG(01)'  'X',
           ' '   'BDC_OKCODE'           'DL',

           'X'   'SAPMM06E'             '0323',
           ' '   'BDC_OKCODE'           '=BU'.

*    CALL TRANSACTION 'ME47' USING  bdc_tab MODE disp_mode
*       UPDATE 'S' MESSAGES INTO messtab.

    ls_params-dismode = 'N'.
    ls_params-updmode = 'S'.
    zcl_call_transaction=>call_transaction( EXPORTING i_tcode = 'ME47'
                                                      is_params = ls_params
                                                      it_bdcdata = bdc_tab
                                            IMPORTING et_messtab = messtab ).
    READ TABLE messtab INTO DATA(ls_messtab) WITH KEY msgtyp = 'E'.
    IF sy-subrc = 0.
      CLEAR mensaje.
      PERFORM edit_error USING mensaje.
      ls_mssg-tdline = ls_messtab-msgv1. "mensaje.
      APPEND ls_mssg TO rfq_mssg.
    ELSE.
      CONCATENATE 'Oferta Rechazada:' ls_del-purch_doc ls_del-item INTO ls_mssg-tdline SEPARATED BY space.
*      ls_mssg-tdformat = 'TY'.
      APPEND ls_mssg TO rfq_mssg.
    ENDIF.

  ENDLOOP.


ENDFUNCTION.
