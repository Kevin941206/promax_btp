FUNCTION zverifica_factura.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(I_INVOICE) TYPE  ZTT_INVOICE
*"     VALUE(I_HST) TYPE  ZHST
*"  EXPORTING
*"     VALUE(L_INVOICE) TYPE  CHAR10
*"     VALUE(L_YEAR) TYPE  GJAHR
*"     VALUE(L_INVOICE_FI) TYPE  CHAR10
*"     VALUE(L_YEAR_FI) TYPE  GJAHR
*"     VALUE(L_FOLIO) TYPE  CHAR10
*"     VALUE(ERROR_FLAG) TYPE  CHAR1
*"     VALUE(E_MESSAGE) TYPE  ZTT_MESSAGE
*"  EXCEPTIONS
*"      ERROR_DATOS
*"----------------------------------------------------------------------
  DATA: t_headerdata TYPE zst_bapi_incinv_create_header.
  DATA: l_lifnr     TYPE zst_lfa1-lifnr,
        l_lifnr_tmp TYPE zst_lfa1-lifnr,
        l_stcd1     TYPE zst_lfa1-stcd1,
        ls_essr     TYPE zst_essr,
        s_message   TYPE bapiret2.

  DATA: BEGIN OF t_itemdata.
          INCLUDE STRUCTURE zst_bapi_incinv_create_item.
  DATA: END OF t_itemdata.

  DATA: BEGIN OF t_account.
          INCLUDE STRUCTURE zst_bapi_incinv_create_account.
  DATA: END OF t_account.

  DATA: BEGIN OF t_glaccount.
          INCLUDE STRUCTURE  zst_bapi_incinv_create_gl_acco.
  DATA: END OF t_glaccount.
  DATA it_glaccount TYPE STANDARD TABLE OF zst_bapi_incinv_create_gl_acco.

  DATA: BEGIN OF t_return.
          INCLUDE STRUCTURE bapiret2.
  DATA: END OF t_return.

  DATA: BEGIN OF i_return.
          INCLUDE STRUCTURE bapiret2.
  DATA: END OF i_return.

  DATA: BEGIN OF t_withtaxdata.
          INCLUDE STRUCTURE zst_bapi_incinv_create_withtax.
  DATA: END OF t_withtaxdata.

  TYPES: BEGIN OF ty_ekbe,
           ebeln  LIKE zes_ekbe-ebeln,
           ebelp  LIKE zes_ekbe-ebelp,
           zekkn  LIKE zes_ekbe-zekkn,
           gjahr  LIKE zes_ekbe-gjahr,
           belnr  LIKE zes_ekbe-belnr,
           buzei  LIKE zes_ekbe-buzei,
           xblnr  LIKE zes_ekbe-xblnr,
           bwart  LIKE zes_ekbe-bwart,
           menge  LIKE zes_ekbe-menge,
           budat  LIKE zes_ekbe-budat,
           wrbtr  LIKE zes_ekbe-wrbtr,
           waers  LIKE zes_ekbe-waers,
           mwskz  LIKE zes_ekbe-mwskz,
           lfgja  LIKE zes_ekbe-gjahr,
           lfbnr  LIKE zes_ekbe-belnr,                      "MRM 090304
           lfpos  LIKE zes_ekbe-lfpos,
           dmbtr  LIKE zes_ekbe-dmbtr,                      "MRM 090304
           packno LIKE zes_ekbe-packno,
           introw LIKE zes_ekbe-introw,
           werks  LIKE zekpo-werks,
           lgort  LIKE zekpo-lgort,
           knttp  LIKE zekpo-knttp,
         END   OF ty_ekbe.

  TYPES: BEGIN OF ty_verificado,
           ebeln  LIKE zes_ekbe-ebeln,
           ebelp  LIKE zes_ekbe-ebelp,
           zekkn  LIKE zes_ekbe-zekkn,
           gjahr  LIKE zes_ekbe-gjahr,
           belnr  LIKE zes_ekbe-belnr,
           buzei  LIKE zes_ekbe-buzei,
           xblnr  LIKE zes_ekbe-xblnr,
           bwart  LIKE zes_ekbe-bwart,
           menge  LIKE zes_ekbe-menge,
           budat  LIKE zes_ekbe-budat,
           wrbtr  LIKE zes_ekbe-wrbtr,
           waers  LIKE zes_ekbe-waers,
           mwskz  LIKE zes_ekbe-mwskz,
           lfgja  LIKE zes_ekbe-gjahr,
           lfbnr  LIKE zes_ekbe-belnr,                      "MRM 090304
           lfpos  LIKE zes_ekbe-lfpos,
           dmbtr  LIKE zes_ekbe-dmbtr,                      "MRM 090304
           packno LIKE zes_ekbe-packno,
           introw LIKE zes_ekbe-introw,
           werks  LIKE zekpo-werks,
           lgort  LIKE zekpo-lgort,
           knttp  LIKE zekpo-knttp,
           shkzg  LIKE zes_ekbe-shkzg,
         END   OF ty_verificado.

  TYPES: BEGIN OF ty_id,
           sel,
           ebeln LIKE zes_ekbe-ebeln,
           ebelp LIKE zes_ekbe-ebelp,
           matnr LIKE zekpo-matnr,
           xblnr LIKE zes_ekbe-xblnr,
           menge LIKE zes_ekbe-menge,
           meins LIKE zmara-meins,
           txz01 LIKE zekpo-txz01,
           werks LIKE zekpo-werks,
           dmbtr LIKE zes_ekbe-dmbtr,
           waers LIKE zes_ekbe-waers,
           dmbto LIKE zes_ekbe-dmbtr,
           mengo LIKE zekpo-menge,
           cambi,
         END OF ty_id.

  TYPES: BEGIN OF ty_ped,
           ebeln  LIKE zes_ekbe-ebeln,
           ebelp  LIKE zes_ekbe-ebelp,
           xblnr  LIKE zes_ekbe-xblnr,
           menge  LIKE zes_ekbe-menge,
           budat  LIKE zes_ekbe-budat,
           wrbtr  LIKE zes_ekbe-wrbtr,
           waers  LIKE zes_ekbe-waers,
           mwskz  LIKE zes_ekbe-mwskz,
           werks  LIKE zekpo-werks,
           lgort  LIKE zekpo-lgort,
           knttp  LIKE zekpo-knttp,
           lfgja  LIKE zes_ekbe-gjahr,
           lfbnr  LIKE zes_ekbe-belnr,
           lfpos  LIKE zes_ekbe-lfpos,
           packno LIKE zes_ekbe-packno,
           introw LIKE zes_ekbe-introw,
         END   OF ty_ped.

  TYPES: BEGIN OF ty_pedver,
           ebeln LIKE zes_ekbe-ebeln,
           ebelp LIKE zes_ekbe-ebelp,
           wrbtr LIKE zes_ekbe-wrbtr,
           waers LIKE zes_ekbe-waers,
         END  OF ty_pedver.

  TYPES: BEGIN OF ty_ekbe_ant,
           ebeln LIKE zes_ekbe-ebeln,
           ebelp LIKE zes_ekbe-ebelp,
           gjahr LIKE zes_ekbe-gjahr,
           belnr LIKE zes_ekbe-belnr,
           buzei LIKE zes_ekbe-buzei,
           menge LIKE zes_ekbe-menge,
           dmbtr LIKE zes_ekbe-dmbtr,                       "MRM 090304
           wrbtr LIKE zes_ekbe-wrbtr,
           waers LIKE zes_ekbe-waers,
           mwskz LIKE zes_ekbe-mwskz,
         END   OF ty_ekbe_ant.

  DATA: t_ekbe         TYPE STANDARD TABLE OF ty_ekbe,
        s_ekbe         LIKE LINE OF t_ekbe,
        it_ekbe        TYPE ztt_ekbe,
        wa_ekbe        LIKE LINE OF it_ekbe,
        it_id          TYPE STANDARD TABLE OF ty_id,
        it_ped         TYPE STANDARD TABLE OF ty_ped,
        it_pedver      TYPE STANDARD TABLE OF ty_pedver,
        it_ekbe_ant    TYPE STANDARD TABLE OF ty_ekbe_ant,
        it_itemdata    TYPE STANDARD TABLE OF zst_bapi_incinv_create_item,
        it_account     TYPE STANDARD TABLE OF zst_bapi_incinv_create_account,
        it_withtaxdata TYPE STANDARD TABLE OF zst_bapi_incinv_create_withtax,
        it_return      TYPE STANDARD TABLE OF bapiret2,
        s_eskn         TYPE zst_eskn,
        t_eskn         TYPE STANDARD TABLE OF zst_eskn,
        s_ekkn         TYPE zst_ekkn,
        t_ekkn         TYPE STANDARD TABLE OF zst_ekkn,
        s_lfbw         TYPE zes_lfbw,
        t_lfbw         TYPE ztt_lfbw.

  DATA: et_ekbe     TYPE ztt_ekbe,
        et_ekbe_aux TYPE ztt_ekbe,
        ls_ekbe     TYPE zes_ekbe,
        ls_ekbe_aux TYPE zes_ekbe,
        ls_t006     TYPE zst_t006,
        et_esll     TYPE ztt_esll,
        ls_esll     TYPE zst_esll.

  DATA: BEGIN OF t_ekbe2,
          ebeln  LIKE zes_ekbe-ebeln,
          ebelp  LIKE zes_ekbe-ebelp,
          zekkn  LIKE zes_ekbe-zekkn,
          gjahr  LIKE zes_ekbe-gjahr,
          belnr  LIKE zes_ekbe-belnr,
          buzei  LIKE zes_ekbe-buzei,
          xblnr  LIKE zes_ekbe-xblnr,
          bwart  LIKE zes_ekbe-bwart,
          menge  LIKE zes_ekbe-menge,
          budat  LIKE zes_ekbe-budat,
          wrbtr  LIKE zes_ekbe-wrbtr,
          waers  LIKE zes_ekbe-waers,
          mwskz  LIKE zes_ekbe-mwskz,
          lfgja  LIKE zes_ekbe-gjahr,
          lfbnr  LIKE zes_ekbe-belnr,                       "MRM 090304
          lfpos  LIKE zes_ekbe-lfpos,
          dmbtr  LIKE zes_ekbe-dmbtr,                       "MRM 090304
          packno LIKE zes_ekbe-packno,
          introw LIKE zes_ekbe-introw,
          werks  LIKE zekpo-werks,
          lgort  LIKE zekpo-lgort,
          knttp  LIKE zekpo-knttp,
        END   OF t_ekbe2.

  DATA: BEGIN OF t_ekbe_ant,
          ebeln LIKE zes_ekbe-ebeln,
          ebelp LIKE zes_ekbe-ebelp,
          gjahr LIKE zes_ekbe-gjahr,
          belnr LIKE zes_ekbe-belnr,
          buzei LIKE zes_ekbe-buzei,
          menge LIKE zes_ekbe-menge,
          dmbtr LIKE zes_ekbe-dmbtr,                        "MRM 090304
          wrbtr LIKE zes_ekbe-wrbtr,
          waers LIKE zes_ekbe-waers,
          mwskz LIKE zes_ekbe-mwskz,
        END   OF t_ekbe_ant.

  DATA: BEGIN OF t_verificado.
          INCLUDE STRUCTURE t_ekbe2.
  DATA:   shkzg LIKE zes_ekbe-shkzg.
  DATA: END   OF t_verificado.

  DATA: BEGIN OF t_id,
          sel,
          ebeln LIKE zes_ekbe-ebeln,
          ebelp LIKE zes_ekbe-ebelp,
          matnr LIKE zekpo-matnr,
          xblnr LIKE zes_ekbe-xblnr,
          menge LIKE zes_ekbe-menge,
          meins LIKE zmara-meins,
          txz01 LIKE zekpo-txz01,
          werks LIKE zekpo-werks,
          dmbtr LIKE zes_ekbe-dmbtr,
          waers LIKE zes_ekbe-waers,
          dmbto LIKE zes_ekbe-dmbtr,
          mengo LIKE zekpo-menge,
          cambi,
        END OF t_id.

  DATA: BEGIN OF t_ped,
          ebeln  LIKE zes_ekbe-ebeln,
          ebelp  LIKE zes_ekbe-ebelp,
          xblnr  LIKE zes_ekbe-xblnr,
          menge  LIKE zes_ekbe-menge,
          budat  LIKE zes_ekbe-budat,
          wrbtr  LIKE zes_ekbe-wrbtr,
          waers  LIKE zes_ekbe-waers,
          mwskz  LIKE zes_ekbe-mwskz,
          werks  LIKE zekpo-werks,
          lgort  LIKE zekpo-lgort,
          knttp  LIKE zekpo-knttp,
          lfgja  LIKE zes_ekbe-gjahr,
          lfbnr  LIKE zes_ekbe-belnr,
          lfpos  LIKE zes_ekbe-lfpos,
          packno LIKE zes_ekbe-packno,
          introw LIKE zes_ekbe-introw,
        END   OF t_ped.

  DATA: BEGIN OF t_pedver,
          ebeln LIKE zes_ekbe-ebeln,
          ebelp LIKE zes_ekbe-ebelp,
          wrbtr LIKE zes_ekbe-wrbtr,
          waers LIKE zes_ekbe-waers,
        END  OF t_pedver.

  DATA: text_el_tab TYPE ztt_textpool,
        ls_text     TYPE zst_textpool,
        s_return    LIKE bapiret2.

  DATA: v_tot          LIKE zes_ekbe-wrbtr,
        v_subtot       LIKE zes_ekbe-wrbtr,
        v_tabix        LIKE sy-tabix,
        v_ordena(1)    TYPE n,
        v_facped(1)    TYPE c,
        v_awkey        TYPE awkey,
        s_amount       LIKE zes_ekbe-dmbtr,
        verif          LIKE zes_ekbe-wrbtr,
        imp_canc_verif LIKE zes_ekbe-wrbtr,
        imp_verif      LIKE zes_ekbe-wrbtr.

  DATA: st_inv_spool TYPE zinv_spool,
        it_inv_spool TYPE STANDARD TABLE OF zinv_spool,
        st_inv_aux   TYPE zinv_spool,
        v_folio      TYPE zinv_spool-folio,
        v_posinv(4)  TYPE n,
        v_lifnr(10)  TYPE c.

  DATA: e_awtyp TYPE zst_acchd-awtyp,
        e_awref TYPE zst_acchd-awref,
        e_aworg TYPE zst_acchd-aworg.

  DATA: ti_documents  TYPE  ztt_acc_doc,
        it_hst        TYPE STANDARD TABLE OF zhst,
        it_vbfa       TYPE ztt_vbfa,
        wa_vbfa       TYPE zst_vbfa,
        ls_rbkp       TYPE zes_rbkp,
        it_verificado TYPE STANDARD TABLE OF ty_verificado,
        it_ver_aux    TYPE STANDARD TABLE OF ty_verificado,
        wa_ver_aux    TYPE zst_verificado.


  ls_text-id = 'I'.
  ls_text-key = 'E01'.
  ls_text-entry = 'El No. de Pedido & no existe'.
  ls_text-length = '29'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E02'.
  ls_text-entry = 'La sociedad &1 no corresponde la sociedad &2 del pedido &3'.
  ls_text-length = '62'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E03'.
  ls_text-entry = 'El documento no contiene posiciones'.
  ls_text-length = '35'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E04'.
  ls_text-entry = 'La factura ya esta contabilizada'.
  ls_text-length = '34'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E05'.
  ls_text-entry = 'El No. de Remision & no existe'.
  ls_text-length = '30'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E06'.
  ls_text-entry = 'El No. Entrada & no existe'.
  ls_text-length = '26'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E07'.
  ls_text-entry = 'Existen anticipos del pedido &'.
  ls_text-length = '30'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E08'.
  ls_text-entry = 'El No. de Nota de Entrega & no existe en ninguna entrada'.
  ls_text-length = '56'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E09'.
  ls_text-entry = 'Entrada & ya fue verificada'.
  ls_text-length = '27'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E10'.
  ls_text-entry = 'La moneda del pedido es diferente a la moneda de la factura'.
  ls_text-length = '59'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E11'.
  ls_text-entry = 'Entrada & ya fue cancelada con doc &'.
  ls_text-length = '36'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E12'.
  ls_text-entry = 'El RFC &1 del pedido no corresponde al RFC &2 Emisor'.
  ls_text-length = '52'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E13'.
  ls_text-entry = 'El pedido corresponde a imputacion tipo F o K'.
  ls_text-length = '45'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E14'.
  ls_text-entry = 'Tolerancia en diferencia excedida'.
  ls_text-length = '33'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E15'.
  ls_text-entry = 'Existe mas de una coincidencia para el RFC:'.
  ls_text-length = '43'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E16'.
  ls_text-entry = 'Proveedor sin retencion 6% en datos maestros'.
  ls_text-length = '44'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E17'.
  ls_text-entry = 'Pedido de transporte no liberado'.
  ls_text-length = '32'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E18'.
  ls_text-entry = 'No existe relacion Transporte vs Pedido'.
  ls_text-length = '39'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E19'.
  ls_text-entry = 'Flete no liquidado'.
  ls_text-length = '18'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E20'.
  ls_text-entry = 'Existe mas de un Flete'.
  ls_text-length = '22'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E21'.
  ls_text-entry = 'Proveedor de XML difiere del Proveedor del Pedido'.
  ls_text-length = '50'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E22'.
  ls_text-entry = 'No existe etapa de ruta extranjera'.
  ls_text-length = '34'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E23'.
  ls_text-entry = 'No existe relacion Entrega vs Contenedor'.
  ls_text-length = '40'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E24'.
  ls_text-entry = 'Proveedor no tiene configuradas dobles retenciones'.
  ls_text-length = '50'.
  APPEND ls_text TO text_el_tab.

  ls_text-id = 'I'.
  ls_text-key = 'E25'.
  ls_text-entry = 'Escenario doble retencion no configurado'.
  ls_text-length = '40'.
  APPEND ls_text TO text_el_tab.


*
  DATA: t_exch_rate TYPE zes_bapi1093_0.
*
  DATA: packno TYPE packno.

  DATA: ls_invoice TYPE zinvoice.
  LOOP AT i_invoice INTO ls_invoice.

    t_headerdata-invoice_ind   = 'X'.
    t_headerdata-doc_date      = ls_invoice-fefact.   " Fecha docto
    t_headerdata-pstng_date    = sy-datum.            " Fecha contable
    t_headerdata-comp_code     = ls_invoice-cocode.   " Sociedad
    t_headerdata-gross_amount  = ls_invoice-impnet.   " Importe total
    t_headerdata-del_costs_taxc = ls_invoice-taxcode. " IVA
    t_headerdata-currency      = ls_invoice-waers.    " Moneda




    IF NOT ls_invoice-febase IS INITIAL.                    "Fecha base
      t_headerdata-bline_date = ls_invoice-febase.
    ELSE.
      t_headerdata-bline_date = sy-datum.
    ENDIF.

    t_headerdata-calc_tax_ind = 'X'.
    t_headerdata-ref_doc_no  = ls_invoice-nofact.
*
**- Si la moneda es USD toma el tipo de cambio de acuerdo a la fecha de la factura
    IF ls_invoice-waers EQ 'USD'.
*
*      CALL FUNCTION 'BAPI_EXCHANGERATE_GETDETAIL'
*        EXPORTING
*          rate_type        = 'M'
*          from_curr        = 'USD'
*          to_currncy       = 'MXN'
*          date             = I_INVOICE-FEFACT
*        IMPORTING
*          EXCH_RATE        = t_exch_rate.
      zcl_bapi_exchangerate_getdet=>bapi_exchangerate_getdetail( EXPORTING i_rate_type = 'M'
                                                                           i_from_curr = 'USD'
                                                                           i_to_currncy = 'MXN'
                                                                           i_date = ls_invoice-fefact
                                                                 IMPORTING es_exch_rate = t_exch_rate ).

      t_headerdata-exch_rate = t_exch_rate-exch_rate.

    ENDIF.
*
** Por No. de Pedido
    DATA:
      t_ekko TYPE STANDARD TABLE OF zes_ekko,
      s_ekko TYPE zes_ekko.
    IF ls_invoice-doctyp EQ 'P'.
      zcl_verifica_factura=>ekko( EXPORTING i_operacion = 'READ' i_quotation = ls_invoice-ebeln IMPORTING t_ekko = t_ekko ).
      READ TABLE t_ekko INTO s_ekko WITH KEY ebeln = ls_invoice-ebeln
                                             bstyp = 'F'.
      IF sy-subrc NE 0.
        READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E01'.
        s_return-message = ls_text-entry.
        REPLACE '&' IN s_return-message WITH ls_invoice-ebeln.
        s_return-type = 'E'.
        APPEND s_return TO e_message.
        error_flag = 'X'.
        EXIT.

        IF s_ekko-bukrs NE ls_invoice-cocode.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E02'.
          s_return-message = ls_text-entry.
          REPLACE '&1' IN s_return-message WITH ls_invoice-cocode.
          REPLACE '&2' IN s_return-message WITH s_ekko-bukrs.
          REPLACE '&3' IN s_return-message WITH ls_invoice-ebeln.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
          EXIT.
        ENDIF.
      ENDIF.
*
      IF s_ekko-waers NE ls_invoice-waers.
        READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E10'.
        s_return-message = ls_text-entry.
        s_return-type = 'E'.
        APPEND s_return TO e_message.
        error_flag = 'X'.
      ENDIF.
*
*
      DATA v_linfr TYPE lifnr.
      IF s_ekko-bsart EQ 'YUBT'.
        zcl_verifica_factura=>prcd_elements( EXPORTING i_operacion = 'READ' i_knumv = s_ekko-knumv  i_kschl = 'YFLN' i_kherk = 'D'
        IMPORTING e_lifnr = v_linfr ).
        l_lifnr_tmp = v_linfr.

**        RFC del proveedor de la condición
        zcl_verifica_factura=>search_vendor_lfa1( EXPORTING i_operacion = 'READ' prov = l_lifnr_tmp
        IMPORTING E_stcd1 = l_stcd1 ).

        l_lifnr = s_ekko-lifnr.
*
      ELSE.
*
**-      RFC del proveedor del pedido
        zcl_verifica_factura=>search_vendor_lfa1( EXPORTING i_operacion = 'READ' prov = s_ekko-lifnr
        IMPORTING E_stcd1 = l_stcd1 ).

        l_lifnr = s_ekko-lifnr.
*
      ENDIF.
**-      Valida RFC del pedido vs RFC emisor
      IF  l_stcd1 NE ls_invoice-rfc_emisor.
*
        READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E12'.
        s_return-message = ls_text-entry.
        REPLACE '&1' IN s_return-message WITH l_stcd1.
        REPLACE '&2' IN s_return-message WITH ls_invoice-rfc_emisor.
        s_return-type = 'E'.
        APPEND s_return TO e_message.
        error_flag = 'X'.
        EXIT.
      ENDIF.
*
      t_headerdata-currency = s_ekko-waers.
      t_headerdata-alloc_nmbr = s_ekko-ebeln.
*
**-    Numero de proveedor en capo DIFF_INV SIL
      t_headerdata-diff_inv = l_lifnr.

      DATA: E_ekbz   TYPE ztt_ekbz,
            es_ekbz  TYPE zes_ekbz,
            v_tabix2 TYPE sy-tabix.

      IF s_EKKO-bsart EQ 'YUBT'.
        CLEAR t_ekbe.

        zcl_verifica_factura=>ekbz( EXPORTING i_operacion = 'READ'
                                              i_ebeln = ls_invoice-ebeln
                                   IMPORTING E_ekbz = E_ekbz ).

        LOOP AT e_ekbz INTO es_ekbz.
          v_tabix2 = sy-tabix.
          IF es_ekbz <> 'F'.
            DELETE e_ekbz INDEX v_tabix2.
          ELSE.
            MOVE-CORRESPONDING es_ekbz TO s_ekbe.
            IF es_EKbZ-shkzg = 'S'.
              s_ekbe-bwart = '102'.
            ELSE.
              s_ekbe-bwart = '101'.
            ENDIF.
            APPEND s_ekbe TO t_ekbe.
          ENDIF.
        ENDLOOP.

      ELSE.

        zcl_verifica_factura=>ekbe1( EXPORTING i_ebeln = ls_invoice-ebeln
                                     IMPORTING et_ekbe = t_ekbe ).

      ENDIF.

** Por No. de Remisión
    ELSEIF ls_invoice-doctyp EQ 'R'.

      DATA: e_traty TYPE char4,
            e_traid TYPE char20.
      zcl_qry_po_view_confirmed=>likp( EXPORTING i_operacion = 'READ'
                                                   i_vbeln = ls_invoice-ebeln
                                        IMPORTING e_traty = e_traty
                                                  e_traid = e_traid ).
      IF  e_traty IS INITIAL OR  e_traid IS INITIAL.
        READ TABLE text_el_tab INTO ls_text  WITH KEY id = 'I' key = 'E05'.
        s_return-message = ls_text-entry.
        REPLACE '&' IN s_return-message WITH ls_invoice-ebeln.
        s_return-type = 'E'.
        APPEND s_return TO e_message.
        error_flag = 'X'.
        EXIT.
      ENDIF.

      DATA: E_vttp     TYPE zes_vttp.
      zcl_verifica_factura=>vttp( EXPORTING i_operacion = 'READ'
                                  i_ebeln     = ls_invoice-ebeln
                                  IMPORTING
                                           E_vttp = E_vttp
      )
.
      IF E_vttp IS NOT INITIAL.
        DATA: st_vttk TYPE zst_vttk,
              ls_vfkp TYPE zst_vfkp.
        st_vttk-tknum = E_vttp-tknum.
        zcl_verifica_factura=>vfkp( EXPORTING i_operacion = 'READ'
                                    st_vttk     = st_vttk
                                    IMPORTING ls_vfkp = ls_vfkp ).

        IF ls_vfkp IS NOT INITIAL.
          zcl_verifica_factura=>ekko( EXPORTING i_operacion = 'READ' i_quotation = ls_vfkp-ebeln IMPORTING t_ekko = t_ekko ).
          READ TABLE t_ekko INTO s_ekko WITH KEY ebeln = ls_vfkp-ebeln.
*                                                   bstyp = 'F'.
          IF s_ekko-waers NE ls_invoice-waers.
            READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E10'.
            s_return-message = ls_text-entry.
            s_return-type = 'E'.
            APPEND s_return TO e_message.
            error_flag = 'X'.
          ENDIF.

          t_headerdata-currency = s_ekko-waers.
          t_headerdata-alloc_nmbr = s_ekko-ebeln.

**-       del proveedor del pedido
          zcl_verifica_factura=>search_vendor_lfa1( EXPORTING i_operacion = 'READ' prov = s_ekko-lifnr
                                                              IMPORTING E_stcd1 = l_stcd1 ).

          l_lifnr = s_ekko-lifnr.
*
**-      Valida RFC del pedido vs RFC emisor
          IF  l_stcd1 NE ls_invoice-rfc_emisor.       "LFA1-STCD1
*
            READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E12'.
            s_return-message = ls_text-entry.
            REPLACE '&1' IN s_return-message WITH l_stcd1.
            REPLACE '&2' IN s_return-message WITH ls_invoice-rfc_emisor.
            s_return-type = 'E'.
            APPEND s_return TO e_message.
            error_flag = 'X'.
            EXIT.
          ENDIF.
*
          CLEAR t_ekbe.
          zcl_verifica_factura=>ekbe2( EXPORTING i_ebeln = ls_vfkp-ebeln
                                                 i_ebelp = ls_vfkp-ebelp
                                                 i_lblni = ls_vfkp-lblni
                                       IMPORTING et_ekbe = t_ekbe ).

        ENDIF.
      ENDIF.
*
** Por No. Entrada de Material
    ELSEIF ls_invoice-doctyp EQ 'E'.
      CLEAR t_ekbe.

      t_headerdata-bline_date = ls_invoice-fefact.
      t_headerdata-pymt_meth = space.

      DATA et_mkpf   TYPE ztt_mkpf.
      zcl_verifica_factura=>mkpf_get( EXPORTING i_operacion = 'READ'
                                       i_mblnr = ls_invoice-ebeln
                                        i_mjahr =  ls_invoice-mjahr
                                       IMPORTING
                                         et_mkpf = et_mkpf
                                        ).

*
      IF et_mkpf IS INITIAL.
        READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E06'.
        s_return-message = ls_text-entry.
        REPLACE '&' IN s_return-message WITH ls_invoice-ebeln.
        s_return-type = 'E'.
        APPEND s_return TO e_message.
        error_flag = 'X'.
        EXIT.
      ENDIF.

      READ TABLE et_mkpf INTO DATA(ls_mkpf) INDEX 1.
**-    Fecha base = Fecha entrada
      t_headerdata-bline_date = ls_mkpf-bldat.

      DATA: et_mseg TYPE ztt_mseg,
            es_mseg TYPE zes_mseg.
      zcl_verifica_factura=>mseg( EXPORTING
                                           i_operacion = 'READ'
                                           i_mblnr = ls_invoice-ebeln
                                           i_mjahr = ls_invoice-mjahr
                                  IMPORTING
                                           et_mseg = et_mseg
                                           ).

      LOOP AT et_mseg INTO es_mseg.
        zcl_verifica_factura=>ekko( EXPORTING i_operacion = 'READ' i_quotation = es_mseg-ebeln IMPORTING t_ekko = t_ekko ).
        READ TABLE t_ekko INTO s_ekko WITH KEY ebeln = es_mseg-ebeln.

        t_headerdata-currency = s_ekko-waers.
        t_headerdata-alloc_nmbr = s_ekko-ebeln.
*
**-    RFC del proveedor del pedido
        zcl_verifica_factura=>search_vendor_lfa1( EXPORTING i_operacion = 'READ' prov = s_ekko-lifnr
        IMPORTING E_stcd1 = l_stcd1 ).

        l_lifnr = s_ekko-lifnr.

**-    Valida RFC del pedido vs RFC emisor
        IF  l_stcd1 NE ls_invoice-rfc_emisor.
*
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E12'.
          s_return-message = ls_text-entry.
          REPLACE '&1' IN s_return-message WITH l_stcd1.
          REPLACE '&2' IN s_return-message WITH ls_invoice-rfc_emisor.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
          EXIT.
        ENDIF.
*
***- Valida si la fecha actual menos la fecha del doc es mayor a 270 dias coloca J en bloqueo de pago
        DATA: days TYPE sy-tabix.
        days = sy-datum - ls_mkpf-bldat.
        IF days > 270.
          t_headerdata-pmnt_block = 'J'.
        ENDIF.
***-
        IF s_ekko-waers NE ls_invoice-waers.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E10'.
          s_return-message = ls_text-entry.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
        ENDIF.
*
**-      Tipo de posición del Pedido
        DATA: et_ekpo     TYPE ztt_ekpo,
              es_ekpo     TYPE zekpo,
              es_ekpo_aux TYPE zekpo.
        zcl_verifica_factura=>ekpo( EXPORTING
                                       i_operacion = 'READ'
                                       i_ebeln     =   es_mseg-ebeln
                                       IMPORTING
                                       et_ekpo = et_ekpo
                                       ).
        READ TABLE et_ekpo INTO   es_ekpo WITH KEY ebeln  =   es_mseg-ebeln
                                                   ebelp = es_mseg-ebelP.

        DATA: et_T023T TYPE  ztt_t023_t023t,
              es_t023t TYPE zes_t023_t023t.
        zcl_verifica_factura=>t023( EXPORTING
                                   i_operacion = 'READ'
                                   i_matkl = es_ekpo-matkl
                                   IMPORTING
                                     et_T023T = et_T023T
                                      ).
        READ TABLE et_T023T INTO es_t023t INDEX 1.

        t_headerdata-header_txt = es_ekpo-werks.
        t_headerdata-item_text = es_t023t-wgbez.
*
        IF es_ekpo-pstyp EQ '9'.
          zcl_verifica_factura=>ekbe3( EXPORTING i_ebeln = es_mseg-ebeln
                                                 i_ebelp = es_mseg-ebelp
                                                 i_belnr = ls_invoice-ebeln
                                                 i_buzei = es_mseg-zeile
                                       IMPORTING et_ekbe = DATA(t_ekbe_aux) ).
          APPEND LINES OF t_ekbe_aux TO t_ekbe.
*
        ELSE.
          zcl_verifica_factura=>ekbe3( EXPORTING i_ebeln = es_mseg-ebeln
                                                 i_ebelp = es_mseg-ebelp
                                                 i_belnr = ls_invoice-ebeln
                                                 i_buzei = es_mseg-zeile
                                       IMPORTING et_ekbe = t_ekbe_aux ).
          APPEND LINES OF t_ekbe_aux TO t_ekbe.

        ENDIF.
**-      Cancelacion de entrada
        IF es_ekpo-pstyp EQ '9'.
          DATA: v_belnr TYPE text10.
          READ TABLE t_ekbe INTO s_ekbe INDEX 1.

          zcl_verifica_factura=>ekbe4( EXPORTING i_ebeln = es_mseg-ebeln
                                                 i_ebelp = es_mseg-ebelp
                                                 i_buzei = es_mseg-zeile
                                                 i_lfbnr = s_ekbe-lfbnr
                                       IMPORTING e_subrc = DATA(lv_subrc) ).
          IF lv_subrc EQ 0.
            READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E11'.
            s_return-message = ls_text-entry.
            REPLACE '&' IN s_return-message WITH ls_invoice-ebeln.
            REPLACE '&' IN s_return-message WITH v_belnr.
            s_return-type = 'E'.
            APPEND s_return TO e_message.
            error_flag = 'X'.
            EXIT.
          ENDIF.
        ELSE.
          zcl_verifica_factura=>ekbe4( EXPORTING i_ebeln = es_mseg-ebeln
                                                 i_ebelp = es_mseg-ebelp
                                                 i_buzei = es_mseg-zeile
                                                 i_lfbnr = ls_invoice-ebeln
                                       IMPORTING e_subrc = lv_subrc ).
          IF lv_subrc EQ 0.
            READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E11'.
            s_return-message = ls_text-entry.
            REPLACE '&' IN s_return-message WITH ls_invoice-ebeln.
            REPLACE '&' IN s_return-message WITH v_belnr.
            s_return-type =  'E'.
            APPEND s_return TO e_message.
            error_flag = 'X'.
            EXIT.
          ENDIF.
        ENDIF.

      ENDLOOP.

** Por No. de Nota de entrega
    ELSEIF ls_invoice-doctyp EQ 'N'.

      CLEAR t_ekbe.


      zcl_verifica_factura=>ekbe5( EXPORTING i_xblnr = ls_invoice-ebeln
                                             i_gjahr = ls_invoice-fefact(4)
                                   IMPORTING et_ekbe = t_ekbe ).

      IF t_ekbe IS INITIAL.
        READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E07'.
        s_return-message = ls_text-entry.
        REPLACE '&' IN s_return-message WITH ls_invoice-ebeln.
        s_return-type =  'E'.
        APPEND s_return TO e_message.
        error_flag = 'X'.
        EXIT.
      ENDIF.

      LOOP AT t_ekbe INTO s_ekbe.
        zcl_verifica_factura=>ekko( EXPORTING i_operacion = 'READ' i_quotation = s_ekbe-ebeln IMPORTING t_ekko = t_ekko ).
        DELETE t_ekko WHERE bstyp <> 'F' AND lifnr <> ls_invoice-lifnr.
        IF sy-subrc NE 0.
          DELETE t_ekbe.
        ENDIF.
      ENDLOOP.
*
      READ TABLE t_ekko INTO s_ekko INDEX 1.
      t_headerdata-currency = s_ekko-waers.
      t_headerdata-alloc_nmbr = s_ekko-ebeln.
**
**-      RFC del proveedor del pedido
      DATA: lfa1    TYPE zst_lfa1,      " Datos generales del proveedor (LFA1)
            it_lfa1 TYPE ztt_lfa1.
      DATA: es_but000 TYPE zes_but000,
            lfb1      TYPE zst_lfb1.
      "--------------------------------------------------------------------
      " Extracción de datos generales del proveedor (LFA1)
      "--------------------------------------------------------------------
      zcl_verifica_factura=>lfa1(
        EXPORTING
          i_operacion = 'READ'
          i_lifnr     = s_ekko-lifnr
        IMPORTING
          es_lfa1     = lfa1
      ).


**-      Valida RFC del pedido vs RFC emisor
      IF lfa1-stcd1 NE ls_invoice-rfc_emisor.
*
        READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E12'.
        s_return-message = ls_text-entry.
        REPLACE '&1' IN s_return-message WITH lfa1-stcd1.
        REPLACE '&2' IN s_return-message WITH ls_invoice-rfc_emisor.
        s_return-type = 'E'.
        APPEND s_return TO e_message.
        error_flag = 'X'.
        EXIT.
      ENDIF.

      IF s_ekko-waers NE ls_invoice-waers.
        READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E10'.
        s_return-message = ls_text-entry.
        s_return-type = 'E'.
        APPEND s_return TO e_message.
        error_flag = 'X'.
      ENDIF.
*
**-  Por No. Transporte
    ELSEIF ls_invoice-doctyp EQ 'T'.
**-     Accesar a ZSD_TRANSPLIQUIDADOS para extraer el No.Gto de Transporte
*
**-     Valida que coincida el pedido de transporte con el No. Transporte
**      si no existe no esta liberado
*        SELECT single * FROM VTTK
*        WHERE  TKNUM eq i_invoice-rebel
*        AND    TPBEZ eq i_invoice-ebeln.
      zcl_verifica_factura=>vttk( EXPORTING i_operacion = 'READ' is_invoice = ls_invoice IMPORTING it_vttk = t_vttk ).
*        IF sy-subrc NE 0.
      IF t_vttk IS INITIAL.
        READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E18'.
*           MOVE text_el_tab-entry to s_return-message.
        s_return-message = ls_text-entry.
*           MOVE 'E' to s_return-type.
        s_return-type = 'E'.
        APPEND s_return TO e_message.
        error_flag = 'X'.
      ELSE.
        READ TABLE t_vttk INTO st_vttk INDEX 1.
*          move VTTK-TDLNR to L_lifnr.
        L_lifnr = st_vttk-tdlnr.
*          select single stcd1 into l_stcd1 from LFA1 where lifnr eq l_lifnr.
        zcl_verifica_factura=>lfa1v2( EXPORTING i_operacion = 'READ' i_lifnr = l_lifnr IMPORTING lv_stcd = l_stcd1 ).
      ENDIF.
*
**       Valida la Ruta MX
*        select single * from vtts
*        where tknum eq vttk-tknum
*        and   tdlnr eq vttk-tdlnr
*        and   abland1 eq 'MX'.
      zcl_verifica_factura=>vtts( EXPORTING i_operacion = 'READ' st_vttk = st_vttk IMPORTING st_vtts = st_vtts ).
**       Escenario donde el prov sale de USA pero es factura nacional
      IF st_vtts IS INITIAL.
*        if sy-subrc ne 0.
*          select single * from vtts
*          where tknum eq vttk-tknum
*          and   tdlnr eq l_lifnr.
        zcl_verifica_factura=>vtts2( EXPORTING i_operacion = 'READ' st_vttk = st_vttk i_lifnr = l_lifnr IMPORTING st_vtts = st_vtts ).
      ENDIF.
      IF st_vtts IS NOT INITIAL.
*        IF sy-subrc EQ 0.
**        Obtiene el pedido y la moneda
*         SELECT single * FROM vfkp
*         WHERE rebel EQ vtts-tknum
*         and   tdlnr eq vtts-tdlnr
*         and   lblni ne space.
        zcl_verifica_factura=>vfkp2( EXPORTING i_operacion = 'READ' st_vtts = st_vtts IMPORTING ls_vfkp = st_vfkp ).
**       Si el pedido no esta liquidado no se muestra en la vfkp **SIL 22Oct20
        IF st_vfkp IS INITIAL.
*        IF sy-subrc NE 0.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E17'.
*          MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
*          MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
          EXIT.
        ENDIF.
*
*         SELECT SINGLE * FROM ekko
*         WHERE ebeln EQ vfkp-ebeln.
        zcl_verifica_factura=>ekko( EXPORTING i_operacion = 'READ' i_quotation = st_vfkp-ebeln IMPORTING t_ekko = t_ekko ).
        READ TABLE t_ekko INTO s_ekko INDEX 1.
**       Si el pedido no esta liquidado no se muestra en la ekko **SIL 22Oct20
        IF s_ekko IS INITIAL.
*        IF sy-subrc NE 0.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E17'.
*          MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
*          MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
          EXIT.
        ENDIF.
*
**         Moneda
        IF s_ekko-waers NE ls_invoice-waers.
*          if ekko-waers ne I_INVOICE-waers.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E10'.
*            MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
*            MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
        ENDIF.
        t_headerdata-currency   = s_ekko-waers.
        t_headerdata-alloc_nmbr = s_ekko-ebeln.
*          MOVE: ekko-waers TO t_headerdata-currency,
*                ekko-ebeln TO t_headerdata-ALLOC_NMBR.
*
**-      Valida RFC del pedido vs RFC emisor
        IF l_stcd1 NE ls_invoice-rfc_emisor.
*      IF  l_stcd1 NE i_invoice-rfc_emisor.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E12'.
*            MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
          REPLACE '&1' IN s_return-message WITH l_stcd1.
          REPLACE '&2' IN s_return-message WITH ls_invoice-rfc_emisor.
*            MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
          EXIT.
        ENDIF.
*
**-      Cond. Pago
*        move 'F030' to t_headerdata-PMNTTRMS.
        t_headerdata-pmnttrms = 'F030'.

**-      Tipo de posición del Pedido
*        SELECT SINGLE pstyp into ekpo-pstyp
*        FROM ekpo
*        WHERE ebeln EQ vfkp-ebeln
*        AND   ebelp EQ vfkp-ebelp.
        zcl_verifica_factura=>ekpo2( EXPORTING i_operacion = 'READ' lv_ebeln = st_vfkp-ebeln lv_ebelp = st_vfkp-ebelp
        IMPORTING lv_pstyp = es_ekpo-pstyp ).
        IF es_ekpo-pstyp EQ '9'.
          CLEAR t_ekbe.
*         SELECT ebeln ebelp ZEKKN gjahr belnr buzei xblnr bwart menge budat wrbtr waers mwskz
*                lfgja lfbnr lfpos dmbtr packno introw into corresponding fields of t_ekbe
*         FROM ekbe
*         WHERE ebeln EQ vfkp-ebeln
*           AND ebelp EQ vfkp-ebelp
*           AND lfbnr EQ vfkp-lblni
*           AND bewtp = 'E'
*           AND bwart IN ('101', '103', '105', '911', '913', '123', '102',
*                         '104', '106', '122', '924', '925').
          zcl_verifica_factura=>ekbe2( EXPORTING i_ebeln = st_vfkp-ebeln
                                                 i_ebelp = st_vfkp-ebelp
                                                 i_lblni = st_vfkp-lblni
                                           IMPORTING et_ekbe = t_ekbe ).

        ELSE.
*          SELECT ebeln ebelp ZEKKN gjahr belnr buzei xblnr bwart menge budat wrbtr waers mwskz
*                 lfgja lfbnr lfpos dmbtr packno introw appending TABLE t_ekbe
*          FROM ekbe
*          WHERE ebeln EQ vfkp-ebeln
*            AND ebelp EQ vfkp-ebelp
*            AND belnr EQ vfkp-lblni
*            AND bewtp = 'E'
*            AND bwart IN ('101', '103', '105', '911', '913', '123', '102',
*                          '104', '106', '122', '924', '925').

          zcl_verifica_factura=>ekbe2( EXPORTING i_ebeln = st_vfkp-ebeln
                                                 i_ebelp = st_vfkp-ebelp
                                                 i_lblni = st_vfkp-lblni
                                       IMPORTING et_ekbe = t_ekbe_aux ).
          APPEND LINES OF t_ekbe_aux TO t_ekbe.


        ENDIF.
      ELSE.
**-    No concuerda el transporte con la OC
        READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E17'.
*       MOVE text_el_tab-entry to s_return-message.
        s_return-message = ls_text-entry.
*       MOVE 'E' to s_return-type.
        s_return-type = 'E'.
        APPEND s_return TO e_message.
        error_flag = 'X'.
      ENDIF.

*-----> Transportistas Extranjeros: Se recibe una HES o Barcos
*-  Por No. Transporte
    ELSEIF ls_invoice-doctyp EQ 'TE' OR ls_invoice-transp_ext EQ 'B'.
*-     Accesar a ZSD_TRANSPLIQUIDADOS para extraer el No.Gto de Transporte y OC
      CLEAR t_ekbe.

*        move i_invoice-febase TO t_headerdata-pstng_date.  "Fecha Contable
      t_headerdata-pstng_date = ls_invoice-febase.
      IF it_hst[] IS INITIAL.
        LOOP AT i_invoice INTO ls_invoice.
          i_hst-lblni = ls_invoice-ebeln.
          i_hst-rebel = ls_invoice-rebel.
          APPEND i_hst TO it_hst.
        ENDLOOP.
      ENDIF.

      LOOP AT it_hst INTO i_hst.
        LOOP AT i_invoice INTO ls_invoice.
*         SELECT single * FROM vfkp
*         WHERE rebel EQ I_HST-rebel  "#Transp
*         and   tdlnr eq i_invoice-lifnr
*         and   lblni eq I_HST-lblni.
          zcl_verifica_factura=>vfkp3( EXPORTING i_operacion = 'READ' lv_rebel = i_hst-rebel lv_lifnr = ls_invoice-lifnr lv_lblni = i_hst-lblni
          IMPORTING ls_vfkp = ls_vfkp ).
*
**-     Valida que coincida el pedido de transporte con el No. Transporte
**      si no existe no esta liberado
*        SELECT single * FROM VTTK
*        WHERE  TKNUM eq vfkp-rebel.   "i_invoice-rebel. "#Transp
**        AND    TPBEZ eq i_invoice-ebeln.
          zcl_verifica_factura=>vttk2( EXPORTING i_operacion = 'READ' lv_tknum = ls_vfkp-rebel lv_tpbez = ls_invoice-ebeln
          IMPORTING ls_vttk = st_vttk ).
          IF st_vttk IS INITIAL.
*        IF sy-subrc NE 0.
            READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E18'.
*           MOVE text_el_tab-entry to s_return-message.
            s_return-message = ls_text-entry.
*           MOVE 'E' to s_return-type.
            s_return-type = 'E'.
            APPEND s_return TO e_message.
            error_flag = 'X'.
          ENDIF.
*
**       Valida la Ruta diferente de MX para barcos
*        select single * from vtts
*        where tknum eq vttk-tknum
*        and   tdlnr eq i_invoice-lifnr
*        and   edland1 ne 'MX'.
          zcl_verifica_factura=>vtts3( EXPORTING i_operacion = 'READ' st_vttk = st_vttk i_lifnr = ls_invoice-lifnr IMPORTING st_vtts = st_vtts ).
        ENDLOOP.
        IF st_vtts IS INITIAL.
*        IF sy-subrc EQ 0.
**       Lugar de destino de la Etapa del transporte para la descripcion
          IF NOT st_vtts-adrnz IS INITIAL.
*            select single country name1 city1 post_code1 into (adrc-country, adrc-name1, adrc-city1, adrc-post_code1)
*            from ADRC where addrnumber eq vtts-adrnz.
            zcl_verifica_factura=>adrc( EXPORTING i_operacion = 'READ' lv_adrnz = st_vtts-adrnz IMPORTING st_adrc = st_adrc ).
            CONCATENATE st_adrc-country '/' st_adrc-city1 '/' st_adrc-post_code1 '/' st_adrc-name1 INTO t_headerdata-item_text.
          ENDIF.
*
**        Obtiene el pedido y la moneda
*         SELECT single * FROM vfkp
*         WHERE rebel EQ vtts-tknum
*         and   tdlnr eq i_invoice-lifnr
*         and   lblni eq I_HST-lblni.
          zcl_verifica_factura=>vfkp3( EXPORTING i_operacion = 'READ' lv_rebel = st_vtts-tknum lv_lblni = i_hst-lblni
          lv_lifnr = ls_invoice-lifnr IMPORTING ls_vfkp = st_vfkp ).
*       Si el pedido no esta liquidado no se muestra en la vfkp **SIL 22Oct20
          IF st_vfkp IS INITIAL.
*        IF sy-subrc NE 0.
            READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E17'.
*          MOVE text_el_tab-entry to s_return-message.
            s_return-message = ls_text-entry.
*          MOVE 'E' to s_return-type.
            s_return-type = 'E'.
            APPEND s_return TO e_message.
            error_flag = 'X'.
            EXIT.
          ENDIF.
*         SELECT SINGLE * FROM ekko
*         WHERE ebeln EQ vfkp-ebeln.
          zcl_verifica_factura=>ekko( EXPORTING i_operacion = 'READ' i_quotation = st_vfkp-ebeln IMPORTING t_ekko = t_ekko ).
          READ TABLE t_ekko INTO s_ekko INDEX 1.
**       Si el pedido no esta liquidado no se muestra en la ekko **SIL 22Oct20
          IF sy-subrc NE 0.
            READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E17'.
*          MOVE text_el_tab-entry to s_return-message.
            s_return-message = ls_text-entry.
*          MOVE 'E' to s_return-type.
            s_return-type = 'E'.
            APPEND s_return TO e_message.
            error_flag = 'X'.
            EXIT.
          ENDIF.

*         Moneda
          IF s_ekko-waers NE ls_invoice-waers.
            READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E10'.
*            MOVE text_el_tab-entry to s_return-message.
            s_return-message = ls_text-entry.
*            MOVE 'E' to s_return-type.
            s_return-type = 'E'.
            APPEND s_return TO e_message.
            error_flag = 'X'.
          ENDIF.
*          MOVE: ekko-waers TO t_headerdata-currency,
*                ekko-ebeln TO t_headerdata-ALLOC_NMBR.
          t_headerdata-currency   = s_ekko-waers.
          t_headerdata-alloc_nmbr = s_ekko-ebeln.
          IF s_ekko-lifnr NE ls_invoice-lifnr.
            READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E21'.
*             MOVE text_el_tab-entry to s_return-message.
            s_return-message = ls_text-entry.
*             MOVE 'E' to s_return-type.
            s_return-type = 'E'.
            APPEND s_return TO e_message.
            error_flag = 'X'.
          ENDIF.

*-      Cond. Pago
*        move 'F030' to t_headerdata-PMNTTRMS.
          t_headerdata-pmnttrms = 'F030'.

*-      Tipo de posición del Pedido
*        SELECT SINGLE pstyp into ekpo-pstyp
*        FROM ekpo
*        WHERE ebeln EQ vfkp-ebeln
*        AND   ebelp EQ vfkp-ebelp.
          zcl_verifica_factura=>ekpo2( EXPORTING i_operacion = 'READ' lv_ebeln = st_vfkp-ebeln lv_ebelp = st_vfkp-ebelp
          IMPORTING lv_pstyp = es_ekpo-pstyp ).
          IF es_ekpo-pstyp EQ '9'.
*
*         SELECT ebeln ebelp ZEKKN gjahr belnr buzei xblnr bwart menge budat wrbtr waers mwskz
*                lfgja lfbnr lfpos dmbtr packno introw appending TABLE t_ekbe
*         FROM ekbe
*         WHERE ebeln EQ vfkp-ebeln
*           AND ebelp EQ vfkp-ebelp
*           AND lfbnr EQ vfkp-lblni
*           AND bewtp = 'E'
*           AND bwart IN ('101', '103', '105', '911', '913', '123', '102',
*                         '104', '106', '122', '924', '925').
            zcl_verifica_factura=>ekbe2( EXPORTING i_ebeln = st_vfkp-ebeln
                                                 i_ebelp = st_vfkp-ebelp
                                                 i_lblni = st_vfkp-lblni
                                       IMPORTING et_ekbe = t_ekbe_aux ).
            APPEND LINES OF t_ekbe_aux TO t_ekbe.

          ELSE.
*          SELECT ebeln ebelp ZEKKN gjahr belnr buzei xblnr bwart menge budat wrbtr waers mwskz
*                 lfgja lfbnr lfpos dmbtr packno introw appending TABLE t_ekbe
*          FROM ekbe
*          WHERE ebeln EQ vfkp-ebeln
*            AND ebelp EQ vfkp-ebelp
*            AND belnr EQ vfkp-lblni
*            AND bewtp = 'E'
*            AND bwart IN ('101', '103', '105', '911', '913', '123', '102',
*                          '104', '106', '122', '924', '925').
            zcl_verifica_factura=>ekbe2( EXPORTING i_ebeln = st_vfkp-ebeln
                                                 i_ebelp = st_vfkp-ebelp
                                                 i_lblni = st_vfkp-lblni
                                       IMPORTING et_ekbe = t_ekbe_aux ).
            APPEND LINES OF t_ekbe_aux TO t_ekbe.

          ENDIF.
        ELSE.
**-    No existe etapa de Ruta extranjero
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E22'.
*       MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
*       MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
        ENDIF.
      ENDLOOP.

*-    Transportistas con BL (Bill of lading)
    ELSEIF ls_invoice-doctyp EQ 'BL'.
*-     Accesar a ZSD_TRANSPLIQUIDADOS con el #Entrega

*  Toma el num de prov del RFC emisor para traer solo las etapas de ese proveedor
*   select single lifnr into l_lifnr from LFA1 where STCD1 eq i_invoice-RFC_EMISOR.
      zcl_verifica_factura=>lfa1v3( EXPORTING i_operacion = 'READ' i_stcd1 = ls_invoice-rfc_emisor IMPORTING es_lfa1 = lfa1 ).
* Obtener el # transporte con el num entrega + contenedor
*   select vbeln into VBFA-vbeln from VBFA
*   where VBELV eq i_invoice-ebeln
*   and vbtyp_n eq '8'.
      zcl_verifica_factura=>vbfa( EXPORTING i_operacion = 'READ' lv_ebeln = ls_invoice-ebeln IMPORTING it_vbfa = it_vbfa ).
      LOOP AT it_vbfa INTO wa_vbfa.
*     SELECT single TKNUM EXTI1 into (VTTK-TKNUM, VTTK-EXTI1) FROM VTTK
*     WHERE  TKNUM eq VBFA-vbeln
*     and    STTRG eq '7'
*     and    exti1 eq i_invoice-exti2.
        zcl_verifica_factura=>vttk3( EXPORTING i_operacion = 'READ' lv_tknum = wa_vbfa-vbeln lv_exti1 = ls_invoice-exti2
        IMPORTING v_exti1 = st_vttk-exti1 v_tknum = st_vttk-tknum ).
        IF st_vttk-exti1 IS NOT INITIAL AND st_vttk-tknum IS NOT INITIAL.
*     check sy-subrc eq 0.
          EXIT.
        ENDIF.
      ENDLOOP.
*   endselect.
      IF st_vttk-exti1 IS NOT INITIAL AND st_vttk-tknum IS NOT INITIAL.
*   IF sy-subrc NE 0.
        READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E23'.
*      MOVE text_el_tab-entry to s_return-message.
        s_return-message = ls_text-entry.
*      MOVE 'E' to s_return-type.
        s_return-type = 'E'.
        APPEND s_return TO e_message.
        error_flag = 'X'.
      ENDIF.
      CHECK error_flag IS INITIAL.

      CLEAR t_ekbe.
*
*   select * from VFKP
*   where   rebel eq VBFA-vbeln
*     and   tdlnr eq l_lifnr
*     and   lblni ne space.
      zcl_verifica_factura=>vfkp4( EXPORTING i_operacion = 'READ' lv_rebel = wa_vbfa-vbeln lv_lifnr = l_lifnr
      IMPORTING lt_vfkp = t_vfkp ).
      CLEAR t_ekko.
      LOOP AT t_vfkp INTO ls_vfkp.
*         SELECT SINGLE * FROM ekko
*         WHERE ebeln EQ vfkp-ebeln.
        zcl_verifica_factura=>ekko( EXPORTING i_operacion = 'READ' i_quotation = ls_vfkp-ebeln IMPORTING t_ekko = t_ekko ).
        IF t_ekko IS NOT INITIAL.
          READ TABLE t_ekko INTO s_ekko INDEX 1.
        ENDIF.

**       Si el pedido no esta liquidado no se muestra en la ekko **SIL 22Oct20
        IF s_ekko IS INITIAL.
*        IF sy-subrc NE 0.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E17'.
*          MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
*          MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
          EXIT.
        ENDIF.
*
**         Moneda
        IF s_ekko-waers NE ls_invoice-waers.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E10'.
*            MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
*            MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
        ENDIF.
        t_headerdata-currency   = s_ekko-waers.
        t_headerdata-alloc_nmbr = s_ekko-ebeln.
*          MOVE: ekko-waers TO t_headerdata-currency,
*                ekko-ebeln TO t_headerdata-ALLOC_NMBR.

*-      Cond. Pago
        t_headerdata-pmnttrms = 'F030'.
*        move 'F030' to t_headerdata-PMNTTRMS.
*
**-      Tipo de posición del Pedido
        CLEAR es_ekpo-pstyp.
*        SELECT SINGLE pstyp into ekpo-pstyp
*        FROM ekpo
*        WHERE ebeln EQ vfkp-ebeln
*        AND   ebelp EQ vfkp-ebelp.
        zcl_verifica_factura=>ekpo2( EXPORTING i_operacion = 'READ' lv_ebeln = st_vfkp-ebeln lv_ebelp = st_vfkp-ebelp
        IMPORTING lv_pstyp = es_ekpo-pstyp ).
        IF es_ekpo-pstyp EQ '9'.
*        if ekpo-pstyp eq '9'.
*         SELECT ebeln ebelp ZEKKN gjahr belnr buzei xblnr bwart menge budat wrbtr waers mwskz
*                lfgja lfbnr lfpos dmbtr packno introw into corresponding fields of t_ekbe
*         FROM ekbe
*         WHERE ebeln EQ vfkp-ebeln
*           AND ebelp EQ vfkp-ebelp
*           AND lfbnr EQ vfkp-lblni
*           AND bewtp = 'E'
*           AND bwart IN ('101', '103', '105', '911', '913', '123', '102',
*                         '104', '106', '122', '924', '925').
*            append t_ekbe.
*          ENDSELECT.

          zcl_verifica_factura=>ekbe2( EXPORTING i_ebeln = st_vfkp-ebeln
                                                 i_ebelp = st_vfkp-ebelp
                                                 i_lblni = st_vfkp-lblni
                                       IMPORTING et_ekbe = t_ekbe_aux ).
          APPEND LINES OF t_ekbe_aux TO t_ekbe.

        ELSE.
*          SELECT ebeln ebelp ZEKKN gjahr belnr buzei xblnr bwart menge budat wrbtr waers mwskz
*                 lfgja lfbnr lfpos dmbtr packno introw appending TABLE t_ekbe
*          FROM ekbe
*          WHERE ebeln EQ vfkp-ebeln
*            AND ebelp EQ vfkp-ebelp
*            AND belnr EQ vfkp-lblni
*            AND bewtp = 'E'
*            AND bwart IN ('101', '103', '105', '911', '913', '123', '102',
*                          '104', '106', '122', '924', '925').

          zcl_verifica_factura=>ekbe2( EXPORTING i_ebeln = st_vfkp-ebeln
                                                 i_ebelp = st_vfkp-ebelp
                                                 i_lblni = st_vfkp-lblni
                                       IMPORTING et_ekbe = t_ekbe_aux ).
          APPEND LINES OF t_ekbe_aux TO t_ekbe.

        ENDIF.
      ENDLOOP.
*   endselect.
      IF t_vfkp IS INITIAL.
*   IF sy-subrc NE 0.
        READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E17'.
*      MOVE text_el_tab-entry to s_return-message.
        s_return-message = ls_text-entry.
*      MOVE 'E' to s_return-type.
        s_return-type = 'E'.
        APPEND s_return TO e_message.
        error_flag = 'X'.
        EXIT.
      ENDIF.

*BL Maritimo
    ELSEIF ls_invoice-doctyp EQ 'BM'.
*-     Accesar a ZSD_TRANSPLIQUIDADOS con el #Entrega

* Obtener el # transporte
*   select vbeln into VBFA-vbeln from VBFA
*   where VBELV eq i_invoice-ebeln
*   and   vbtyp_n eq '8'.
      zcl_verifica_factura=>vbfa2( EXPORTING i_operacion = 'READ' lv_ebeln = ls_invoice-ebeln IMPORTING it_vbfa = it_vbfa ).
      CLEAR: st_vttk-tknum, st_vttk-exti1.
      LOOP AT it_vbfa INTO wa_vbfa.
*     SELECT single TKNUM EXTI1 into (VTTK-TKNUM, VTTK-EXTI1) FROM VTTK
*     WHERE  TKNUM eq VBFA-vbeln
*     and    STTRG eq '7'
*     and    exti1 eq i_invoice-rebel.
        zcl_verifica_factura=>vttk4( EXPORTING i_operacion = 'READ' lv_tknum = wa_vbfa-vbeln lv_exti1 = ls_invoice-rebel
        IMPORTING v_exti1 = st_vttk-exti1 v_tknum = st_vttk-tknum ).
        IF st_vttk-exti1 IS NOT INITIAL AND st_vttk-tknum IS NOT INITIAL.
*     check sy-subrc eq 0.
          EXIT.
        ENDIF.
      ENDLOOP.
*   endselect.
      IF it_vbfa IS INITIAL.
*   IF sy-subrc NE 0.
        READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E23'.
*      MOVE text_el_tab-entry to s_return-message.
        s_return-message = ls_text-entry.
*      MOVE 'E' to s_return-type.
        s_return-type = 'E'.
        APPEND s_return TO e_message.
        error_flag = 'X'.
      ENDIF.
      CHECK error_flag IS INITIAL.

*   select single lifnr into L_lifnr from LFA1 where STCD1 eq i_invoice-RFC_EMISOR.
      zcl_verifica_factura=>lfa1v3( EXPORTING i_operacion = 'READ' i_stcd1 = ls_invoice-rfc_emisor IMPORTING es_lfa1 = lfa1 ).
*
*   select single * from VFKP where rebel eq VBFA-vbeln
*     and   tdlnr eq l_lifnr
*     and   lblni ne space.
      zcl_verifica_factura=>vfkp4( EXPORTING i_operacion = 'READ' lv_rebel = wa_vbfa-vbeln lv_lifnr = l_lifnr
            IMPORTING lt_vfkp = t_vfkp ).
      READ TABLE t_vfkp INTO ls_vfkp INDEX 1.
**-     Valida si el transporte esta liquidado
*        SELECT single * FROM VTTK
*        WHERE  TKNUM eq vfkp-rebel
*        and    STTRG eq '7'.
      zcl_verifica_factura=>vttk5( EXPORTING i_operacion = 'READ' lv_tknum = ls_vfkp-rebel IMPORTING ls_vttk = st_vttk ).
      IF st_vttk IS INITIAL.
*        IF sy-subrc NE 0.
        READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E19'.
*           MOVE text_el_tab-entry to s_return-message.
        s_return-message = ls_text-entry.
*           MOVE 'E' to s_return-type.
        s_return-type = 'E'.
        APPEND s_return TO e_message.
        error_flag = 'X'.
      ENDIF.

**       Valida la Ruta Maritima
*        select single * from vtts
*        where tknum eq vttk-tknum
*        and   tdlnr eq vttk-tdlnr
*        and   vsart eq '04'.
      zcl_verifica_factura=>vtts4( EXPORTING i_operacion = 'READ' st_vttk = st_vttk IMPORTING st_vtts = st_vtts ).
      IF st_vtts IS NOT INITIAL.
*        IF sy-subrc EQ 0.
**        Obtiene el pedido y la moneda
        zcl_verifica_factura=>vfkp4( EXPORTING i_operacion = 'READ' lv_rebel = st_vtts-tknum lv_lifnr = st_vtts-tdlnr
        IMPORTING lt_vfkp = t_vfkp ).
*         SELECT single * FROM vfkp
*         WHERE rebel EQ vtts-tknum
*         and   tdlnr eq vtts-tdlnr
*         and   lblni ne space.
        READ TABLE t_vfkp INTO st_vfkp INDEX 1.
**       Si el pedido no esta liquidado no se muestra en la vfkp **SIL 22Oct20
        IF st_vfkp IS INITIAL.
*        IF sy-subrc NE 0.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E17'.
*          MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
*          MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
          EXIT.
        ENDIF.
*
*         SELECT SINGLE * FROM ekko
*         WHERE ebeln EQ vfkp-ebeln.
        zcl_verifica_factura=>ekko( EXPORTING i_operacion = 'READ' i_quotation = st_vfkp-ebeln IMPORTING t_ekko = t_ekko ).
        READ TABLE t_ekko INTO s_ekko INDEX 1.
**       Si el pedido no esta liquidado no se muestra en la ekko **SIL 22Oct20
        IF s_ekko IS INITIAL.
*        IF sy-subrc NE 0.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E17'.
*          MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
*          MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
          EXIT.
        ENDIF.
*
**         Moneda
        IF s_ekko-waers NE ls_INVOICE-waers.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E10'.
*            MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
*            MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
        ENDIF.
        t_headerdata-currency   = s_ekko-waers.
        t_headerdata-alloc_nmbr = s_ekko-ebeln.
*          MOVE: ekko-waers TO t_headerdata-currency,
*                ekko-ebeln TO t_headerdata-ALLOC_NMBR.

*-      RFC del proveedor del pedido
*        select single STCD1 into L_STCD1 from LFA1 where lifnr eq ekko-lifnr.
        zcl_verifica_factura=>lfa1v2( EXPORTING i_operacion = 'READ' i_lifnr = s_ekko-lifnr IMPORTING lv_stcd = l_stcd1 ).
*        l_lifnr = ekko-lifnr.

**-      Valida RFC del pedido vs RFC emisor
        IF  l_stcd1 NE ls_invoice-rfc_emisor.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E12'.
*            MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
          REPLACE '&1' IN s_return-message WITH l_stcd1.
          REPLACE '&2' IN s_return-message WITH ls_invoice-rfc_emisor.
*            MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
          EXIT.
        ENDIF.

*-      Cond. Pago
*        move 'F030' to t_headerdata-PMNTTRMS.
        t_headerdata-pmnttrms = 'F030'.
*
**-      Tipo de posición del Pedido
*        SELECT SINGLE pstyp into ekpo-pstyp
*        FROM ekpo
*        WHERE ebeln EQ vfkp-ebeln
*        AND   ebelp EQ vfkp-ebelp.
        zcl_verifica_factura=>ekpo2( EXPORTING i_operacion = 'READ' lv_ebeln = st_vfkp-ebeln lv_ebelp = st_vfkp-ebelp
        IMPORTING lv_pstyp = es_ekpo-pstyp ).

        IF es_ekpo-pstyp EQ '9'.
          CLEAR t_ekbe.
*         SELECT ebeln ebelp ZEKKN gjahr belnr buzei xblnr bwart menge budat wrbtr waers mwskz
*                lfgja lfbnr lfpos dmbtr packno introw into corresponding fields of t_ekbe
*         FROM ekbe
*         WHERE ebeln EQ vfkp-ebeln
*           AND ebelp EQ vfkp-ebelp
*           AND lfbnr EQ vfkp-lblni
*           AND bewtp = 'E'
*           AND bwart IN ('101', '103', '105', '911', '913', '123', '102',
*                         '104', '106', '122', '924', '925').
*            append t_ekbe.
*          ENDSELECT.
          zcl_verifica_factura=>ekbe2( EXPORTING i_ebeln = st_vfkp-ebeln
                                                 i_ebelp = st_vfkp-ebelp
                                                 i_lblni = st_vfkp-lblni
                                       IMPORTING et_ekbe = t_ekbe ).

        ELSE.
*          SELECT ebeln ebelp ZEKKN gjahr belnr buzei xblnr bwart menge budat wrbtr waers mwskz
*                 lfgja lfbnr lfpos dmbtr packno introw appending TABLE t_ekbe
*          FROM ekbe
*          WHERE ebeln EQ vfkp-ebeln
*            AND ebelp EQ vfkp-ebelp
*            AND belnr EQ vfkp-lblni
*            AND bewtp = 'E'
*            AND bwart IN ('101', '103', '105', '911', '913', '123', '102',
*                          '104', '106', '122', '924', '925').
          zcl_verifica_factura=>ekbe2( EXPORTING i_ebeln = st_vfkp-ebeln
                                                 i_ebelp = st_vfkp-ebelp
                                                 i_lblni = st_vfkp-lblni
                                       IMPORTING et_ekbe = t_ekbe_aux ).
          APPEND LINES OF t_ekbe_aux TO t_ekbe.

        ENDIF.
*
      ENDIF.

*- Por Cuenta de Mayor
    ELSEIF ls_invoice-doctyp EQ 'C'.
      DATA: records TYPE sy-tabix.
      DATA: BEGIN OF t_lfa1,
              lifnr LIKE lfa1-lifnr,
            END OF t_lfa1.

*-     Referencia y Texto: Id/número de factura
      CONCATENATE ls_invoice-id '/' ls_invoice-nofact INTO t_headerdata-ref_doc_no.
      CONDENSE t_headerdata-ref_doc_no NO-GAPS.
      t_headerdata-header_txt = t_headerdata-ref_doc_no.

*-     Cond de pago: K052 (15 días).

*-     Asignación  (Centro de Coste)
      t_headerdata-alloc_nmbr = ls_invoice-cost.

*-   si es una HES
      IF NOT ls_invoice-ebeln IS INITIAL.
*        SELECT SINGLE * FROM vfkp
*        WHERE lblni EQ i_invoice-ebeln.
**        and   tdlnr eq i_invoice-lifnr.
        zcl_verifica_factura=>vfkp5( EXPORTING i_operacion = 'READ' lv_lblni = ls_invoice-ebeln lv_lifnr = ls_invoice-lifnr
        IMPORTING ls_vfkp = ls_vfkp ).
        IF ls_vfkp IS NOT INITIAL.
*         if sy-subrc eq 0.
          l_lifnr = ls_vfkp-tdlnr.
        ENDIF.
      ENDIF.
*
*
**-     Obtiene el Emisor fact.
      CLEAR it_lfa1.
*        select lifnr into table t_lfa1 from Lfa1
*        where stcd1 eq I_INVOICE-RFC_EMISOR.
      zcl_verifica_factura=>lfa1v4( EXPORTING i_operacion = 'READ' i_stcd1 = ls_invoice-rfc_emisor IMPORTING it_lfa1 = it_lfa1 ).
      CLEAR records.
      LOOP AT it_lfa1 INTO lfa1.
        ADD 1 TO records.
      ENDLOOP.
      IF records > 1.
*-         Existe mas de una coincidencia del RFC
        READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E15'.
*           MOVE text_el_tab-entry to s_return-message.
        s_return-message = ls_text-entry.
        REPLACE '&' IN s_return-message WITH ls_invoice-rfc_emisor.
*           MOVE 'E' to s_return-type.
        s_return-type = 'E'.
        APPEND s_return TO e_message.
        error_flag = 'X'.
        EXIT.
      ENDIF.

      READ TABLE it_lfa1 INTO lfa1 INDEX 1.
      t_headerdata-diff_inv = t_lfa1-lifnr.

      IF v_lifnr IS NOT INITIAL.
        t_headerdata-diff_inv = l_lifnr.
      ENDIF.

*        select single ZTERM into LFB1-ZTERM from LFB1
*          where lifnr eq t_lfa1-lifnr
*          and bukrs eq I_INVOICE-COCODE.
      zcl_verifica_factura=>lfb1( EXPORTING i_operacion = 'READ' i_lifnr = lfa1-lifnr i_bukrs = ls_invoice-cocode
      IMPORTING lv_zterm = lfb1-zterm ).
      IF lfb1-zterm IS NOT INITIAL.
*        if sy-subrc eq 0.
*-     Cond de pago:
        t_headerdata-pmnttrms = lfb1-zterm.
      ENDIF.

      CLEAR t_glaccount.
*       move:  1                 to t_glaccount-invoice_doc_item,
*              'S'               to t_glaccount-db_cr_ind,
*              I_INVOICE-IMPBRT  to t_glaccount-item_amount,
*              I_INVOICE-COCODE  to t_glaccount-COMP_CODE,
*              I_INVOICE-GLACCT  to t_glaccount-GL_ACCOUNT,
*              I_INVOICE-COST    to t_glaccount-COSTCENTER,
*              I_INVOICE-TAXCODE to t_glaccount-TAX_CODE.
*       append t_glaccount.
      t_glaccount-invoice_doc_item = 1.
      t_glaccount-db_cr_ind        = 'S'.
      t_glaccount-item_amount      = ls_invoice-impbrt.
      t_glaccount-comp_code        = ls_invoice-cocode.
      t_glaccount-gl_account       = ls_invoice-glacct.
      t_glaccount-costcenter       = ls_invoice-cost.
      t_glaccount-tax_code         = ls_invoice-taxcode.
      APPEND t_glaccount TO it_glaccount.

    ENDIF.

** busca anticipos
*    SELECT ebeln ebelp gjahr belnr buzei menge dmbtr wrbtr waers mwskz
*      INTO TABLE t_ekbe_ant
*      FROM ekbe
*     WHERE ebeln EQ ekko-ebeln
*       AND bewtp = 'A'
*       AND bwart EQ space.
    zcl_verifica_factura=>ekbe6( EXPORTING i_ebeln = s_ekko-ebeln
                                 IMPORTING et_ekbe_ant = it_ekbe_ant ).

    READ TABLE it_ekbe_ant INTO DATA(ls_ekbe_ant) INDEX 1.
    IF sy-subrc EQ 0.
      READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E07'.
*      MOVE text_el_tab-entry TO s_return-message.
      s_return-message = ls_text-entry.
      REPLACE '&' IN s_return-message WITH s_ekko-ebeln.
*      MOVE 'E' TO s_return-type.
      s_return-type = 'E'.
      APPEND s_return TO e_message.
      error_flag = 'X'.
      EXIT.
    ENDIF.
*
    IF ls_invoice-doctyp EQ 'N'.
*      SELECT SINGLE NAME_ORG1 INTO BUT000-NAME_ORG1  "lfa1-name1
*                      FROM BUT000                    "lfa1
*                     WHERE partner EQ i_invoice-lifnr.
      zcl_verifica_factura=>but000( EXPORTING i_operacion = 'READ' i_lifnr = ls_invoice-lifnr IMPORTING lv_name = es_but000-name_org1 ).
    ELSE.
*      SELECT SINGLE NAME_ORG1 INTO BUT000-NAME_ORG1  "lfa1-name1
*                      FROM BUT000                    "lfa1
*                     WHERE partner EQ l_lifnr.
      zcl_verifica_factura=>but000( EXPORTING i_operacion = 'READ' i_lifnr = l_lifnr IMPORTING lv_name = es_but000-name_org1 ).
    ENDIF.

*-  Entradas de Mercancia
    LOOP AT t_ekbe INTO s_ekbe.
*      SELECT SINGLE * FROM ekpo
*         WHERE ebeln EQ t_ekbe-ebeln
*           AND ebelp EQ t_ekbe-ebelp
*           AND loekz EQ space.
      zcl_verifica_factura=>ekpo3( EXPORTING i_operacion = 'READ' lv_ebeln = s_ekbe-ebeln lv_ebelp = s_ekbe-ebelp
      IMPORTING es_ekpo = es_ekpo ).
      IF es_ekpo IS INITIAL.
*      IF sy-subrc ne 0.
        DELETE t_ekbe WHERE belnr = s_ekbe-belnr.
      ELSE.
*        MOVE: ekpo-mwskz TO t_ekbe-mwskz,
*              ekpo-lgort TO t_ekbe-lgort,
*              ekpo-werks TO t_ekbe-werks,
*              ekpo-knttp TO t_ekbe-knttp.
        s_ekbe-mwskz = es_ekpo-mwskz.
        s_ekbe-lgort = es_ekpo-lgort.
        s_ekbe-werks = es_ekpo-werks.
        s_ekbe-knttp = es_ekpo-knttp.

*-      EM no Valorada
        IF s_ekbe-wrbtr IS INITIAL.
*-        Si es de servicios
          IF es_ekpo-pstyp EQ '9'.
            CLEAR ls_essr.
*             select single * from essr where lblni eq t_ekbe-lfbnr.
            zcl_verifica_factura=>essr( EXPORTING i_operacion = 'READ' lv_lblni = s_ekbe-lfbnr IMPORTING ls_esrr = ls_essr ).
            s_ekbe-wrbtr = ls_essr-netwr.
            s_ekbe-dmbtr = s_ekbe-wrbtr.
          ELSE.
*-        Si es de material
            s_ekbe-wrbtr = es_ekpo-netpr * s_ekbe-menge.
            s_ekbe-dmbtr = s_ekbe-wrbtr.
          ENDIF.
        ENDIF.
        MODIFY t_ekbe FROM s_ekbe.

*- Busca si ya fué facturada
*  Valida si fué cancelada la Verificación ( Suma el importe de las verif - la suma de las cancelacion de verif.)
        CLEAR: verif, imp_verif, imp_canc_verif.
        IF NOT s_ekbe-lfbnr IS INITIAL.
*          select  * from ekbe
*          where ebeln eq t_ekbe-ebeln and
*                ebelp eq t_ekbe-ebelp and
*                vgabe eq '2'          and
*                lfbnr eq t_ekbe-lfbnr. " en caso de tener referencia
          zcl_verifica_factura=>ekbe7( EXPORTING i_ebeln = s_ekbe-ebeln
                                                 i_ebelp = s_ekbe-ebelp
                                                 i_lfbnr = s_ekbe-lfbnr
                                           IMPORTING et_ekbe = it_ekbe ).
          LOOP AT it_ekbe INTO wa_ekbe.
            IF wa_ekbe-shkzg EQ 'S'.
              ADD wa_ekbe-wrbtr TO imp_verif.
            ELSE.
              ADD wa_ekbe-wrbtr TO imp_canc_verif.
            ENDIF.
          ENDLOOP.
*          endselect.
        ELSE.
*          select  * from ekbe
*          where ebeln eq t_ekbe-ebeln and
*                ebelp eq t_ekbe-ebelp and
*                vgabe eq '2'.

          zcl_verifica_factura=>ekbe7( EXPORTING i_ebeln = s_ekbe-ebeln
                                                 i_ebelp = s_ekbe-ebelp
                                           IMPORTING et_ekbe = it_ekbe ).
*-        Busca si ya fué facturada la entrada
          LOOP AT it_ekbe INTO wa_ekbe.
*              select single * from RBKP
*              where  belnr eq ekbe-belnr
*              and   gjahr eq ekbe-gjahr
*              and   xblnr eq i_invoice-nofact.
            zcl_verifica_factura=>rbkp( EXPORTING i_operacion = 'READ' lv_belnr = wa_ekbe-belnr lv_gjahr = wa_ekbe-gjahr
            lv_xblnr = ls_invoice-nofact IMPORTING ls_rbkp = ls_rbkp ).
            IF ls_rbkp IS NOT INITIAL.
*              check sy-subrc eq 0.
              IF wa_ekbe-shkzg EQ 'S'.
                ADD wa_ekbe-wrbtr TO imp_verif.      "facturada
              ELSE.
                ADD wa_ekbe-wrbtr TO imp_canc_verif. " cancelada
              ENDIF.
            ENDIF.
*          endselect.
          ENDLOOP.
        ENDIF.
*        verif = imp_verif - imp_canc_verif.
        IF verif NE 0.
**-         ya fue facturada
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E09'.
*           MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
          REPLACE '&' IN s_return-message WITH ls_invoice-ebeln.
*           MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
          EXIT.
        ENDIF.
      ENDIF.
    ENDLOOP.
    CHECK error_flag IS INITIAL.

    IF NOT t_ekbe[] IS INITIAL.
      IF ls_invoice-doctyp EQ 'N'.
        LOOP AT t_ekbe INTO s_ekbe.
*      SELECT * INTO CORRESPONDING FIELDS OF t_verificado
*               FROM ekbe FOR ALL ENTRIES IN t_ekbe
*              WHERE ebeln EQ t_ekbe-ebeln
*                AND ebelp EQ t_ekbe-ebelp
*                AND xblnr EQ i_invoice-ebeln
*                AND ( bewtp = 'Q' OR bewtp = 'R' )
*                AND ( shkzg EQ 'S' OR shkzg EQ 'H' ).
          zcl_verifica_factura=>ekbe8( EXPORTING i_ebeln = s_ekbe-ebeln
                                                 i_ebelp = s_ekbe-ebelp
                                                 i_xblnr = ls_invoice-ebeln
                                       IMPORTING et_ekbe = et_ekbe_aux ).
          LOOP AT et_ekbe_aux INTO ls_ekbe_aux.
            MOVE-CORRESPONDING ls_ekbe_aux TO t_verificado.
*        APPEND t_verificado.
            APPEND t_verificado TO it_verificado.
          ENDLOOP.
*      ENDSELECT.
        ENDLOOP.
      ELSE.
      ENDIF.
    ENDIF.

    CLEAR t_ped.
    CLEAR t_id.
    SORT t_ekbe BY ebeln ebelp.
    DATA: l_dmbtr LIKE zes_ekbe-dmbtr.

    LOOP AT t_ekbe INTO s_ekbe.
      AT FIRST.
        CLEAR v_tot.
      ENDAT.

      AT NEW buzei. "ebelp.
        CLEAR v_subtot.
      ENDAT.

      MOVE-CORRESPONDING s_ekbe TO t_id.
      t_id-dmbtr = 0.
      t_id-menge = 0.
      CASE s_ekbe-bwart.
        WHEN '101' OR '103' OR '105' OR '911' OR '913' OR '123' OR '924'.
          IF s_ekbe-bwart EQ '103'.
*             select wrbtr menge into (ekbe-wrbtr, ekbe-menge)
*             from ekbe
*             where ebeln eq t_ekbe-ebeln
*             and   ebelp eq t_ekbe-ebelp
*             and   vgabe eq '1'
*             and   gjahr eq t_ekbe-gjahr
*             and   bwart eq '105'
*             and   lfbnr eq t_ekbe-belnr
*             and   lfpos eq t_ekbe-buzei.
            zcl_verifica_factura=>ekbe9( EXPORTING i_ebeln = s_ekbe-ebeln
                                                   i_ebelp = s_ekbe-ebelp
                                                   i_gjahr = s_ekbe-gjahr
                                                   i_lfbnr = s_ekbe-belnr
                                                   i_lfpos = s_ekbe-lfpos
                                          IMPORTING e_wrbtr = DATA(lv_wrbtr)
                                                    e_menge = DATA(lv_menge) ).
            s_ekbe-wrbtr = lv_wrbtr.
            s_ekbe-menge = lv_menge.
*             endselect.
          ENDIF.
          v_subtot = v_subtot + s_ekbe-wrbtr.
          t_id-dmbtr = s_ekbe-wrbtr.     "Moneda de movimiento
          t_id-menge = s_ekbe-menge.
        WHEN '102' OR '104' OR '106' OR '122' OR '925'.
          v_subtot = v_subtot - s_ekbe-wrbtr.
          t_id-dmbtr = - s_ekbe-wrbtr.   "Moneda de movimiento
          t_id-menge = - s_ekbe-menge.
        WHEN OTHERS.
          IF s_ekko-bsart EQ 'YUBT'.
            v_subtot = v_subtot + s_ekbe-wrbtr.
            t_id-dmbtr = s_ekbe-wrbtr.     "Moneda de movimiento
            t_id-menge = s_ekbe-menge.
          ENDIF.
      ENDCASE.
*
*      MOVE: t_ekbe-xblnr TO t_ped-xblnr,
*            t_ekbe-budat TO t_ped-budat,
*            t_ekbe-waers TO t_ped-waers,
*            t_ekbe-mwskz TO t_ped-mwskz,
*            t_ekbe-lgort TO t_ped-lgort,
*            t_ekbe-werks TO t_ped-werks,
*            t_ekbe-knttp TO t_ped-knttp,
*            t_ekbe-lfgja TO t_ped-lfgja,
*            t_ekbe-lfbnr TO t_ped-lfbnr,
*            t_ekbe-lfpos TO t_ped-lfpos,
*            t_ekbe-lfbnr TO t_ped-lfbnr,
*            t_ekbe-menge TO t_ped-menge,
*            t_ekbe-packno TO t_ped-packno,
*            t_ekbe-introw TO t_ped-introw.
      t_ped-xblnr  = s_ekbe-xblnr.
      t_ped-budat  = s_ekbe-budat.
      t_ped-waers  = s_ekbe-waers.
      t_ped-mwskz  = s_ekbe-mwskz.
      t_ped-lgort  = s_ekbe-lgort.
      t_ped-werks  = s_ekbe-werks.
      t_ped-knttp  = s_ekbe-knttp.
      t_ped-lfgja  = s_ekbe-lfgja.
      t_ped-lfbnr  = s_ekbe-lfbnr.
      t_ped-lfpos  = s_ekbe-lfpos.
      t_ped-lfbnr  = s_ekbe-lfbnr.
      t_ped-menge  = s_ekbe-menge.
      t_ped-packno = s_ekbe-packno.
      t_ped-introw = s_ekbe-introw.
*
*      SELECT SINGLE * FROM ekpo WHERE ebeln = t_ekbe-ebeln AND
*                                      ebelp = t_ekbe-ebelp.
      zcl_verifica_factura=>ekpo4( EXPORTING i_operacion = 'READ' lv_ebeln = s_ekbe-ebeln lv_ebelp = s_ekbe-ebelp
      IMPORTING es_ekpo = es_ekpo ).
      IF t_id-dmbtr NE 0.
        t_id-sel = 'X'.
        t_id-dmbtr = t_id-dmbtr.
        t_id-werks = es_ekpo-werks.
        t_id-txz01 = es_ekpo-txz01.
        t_id-matnr = es_ekpo-matnr.
        t_id-dmbto = t_id-dmbtr.
        t_id-mengo = t_id-menge.
        t_id-meins = es_ekpo-meins.
        COLLECT t_id INTO it_id.
      ENDIF.

      AT END OF buzei. "ebelp.
*        MOVE: t_ekbe-ebeln TO t_ped-ebeln,
*              t_ekbe-ebelp TO t_ped-ebelp,
*              v_subtot     TO t_ped-wrbtr.
        t_ped-ebeln = s_ekbe-ebeln.
        t_ped-ebelp = s_ekbe-ebelp.
        t_ped-wrbtr = v_subtot.

        ADD v_subtot TO v_tot.
        APPEND t_ped TO it_ped.
      ENDAT.

    ENDLOOP.

**- Valida totales

    IF ls_invoice-doctyp EQ 'E'.
      DATA: dif_imp  LIKE zes_ekbe-wrbtr, lim_tol LIKE zes_ekbe-wrbtr VALUE '0.01',
            Tol      LIKE zes_ekbe-wrbtr,
            xporc    TYPE p DECIMALS 4,
            base     LIKE zes_ekbe-wrbtr,
            t_ftaxp  LIKE zst_ftaxp, "occurs 0 with header line.
            it_ftaxp TYPE STANDARD TABLE OF zst_ftaxp.

      Tol = v_tot * lim_tol.

      dif_imp = ls_invoice-impbrt  - v_tot.

*- valor absoluto
      IF dif_imp < 0. dif_imp = dif_imp * -1. ENDIF.


      IF tol > dif_imp.
        t_headerdata-del_costs = dif_imp.
      ELSE.
      ENDIF.

    ENDIF.


*         Entradas Parciales
    CLEAR v_tot.
    SORT it_verificado BY ebeln ebelp.
    LOOP AT it_verificado INTO t_verificado.
      AT NEW ebelp.
        CLEAR v_tot.
      ENDAT.
      IF t_verificado-shkzg EQ 'H'.
        t_verificado-wrbtr = ( t_verificado-wrbtr * -1 ).
      ENDIF.
*           debo eliminar aqui de t_id lo verificado
      v_tot = v_tot + t_verificado-wrbtr.
      AT END OF ebelp.
*        MOVE: t_verificado-ebeln TO t_pedver-ebeln,
*              t_verificado-ebelp TO t_pedver-ebelp,
*              v_tot              TO t_pedver-wrbtr.
        t_pedver-ebeln = t_verificado-ebeln.
        t_pedver-ebelp = t_verificado-ebelp.
        t_pedver-wrbtr = v_tot.
        APPEND t_pedver TO it_pedver.
      ENDAT.
    ENDLOOP.
    LOOP AT it_ped INTO t_ped.
      v_tabix = sy-tabix.
      READ TABLE it_pedver INTO t_pedver WITH KEY ebeln = t_ped-ebeln
                                                  ebelp = t_ped-ebelp.
      IF sy-subrc EQ 0.
        IF t_ped-wrbtr EQ t_pedver-wrbtr.
          DELETE it_ped INDEX v_tabix.
*           Elimina tambien de t_id los pedidos innecesarios
          DELETE it_id WHERE ebeln = t_ped-ebeln
                        AND ebelp = t_ped-ebelp.
        ELSE.
          LOOP AT it_verificado INTO t_verificado WHERE ebeln = t_ped-ebeln
                                 AND ebelp = t_ped-ebelp.
            LOOP AT it_id INTO t_id WHERE ebeln EQ t_verificado-ebeln AND
                               ebelp EQ t_verificado-ebelp.
              IF t_verificado-shkzg EQ 'H'.
                t_id-dmbtr = t_id-dmbtr - t_verificado-wrbtr.
              ELSE.
                t_id-dmbtr = t_id-dmbtr + t_verificado-wrbtr.
              ENDIF.
              MODIFY it_id FROM t_id.
            ENDLOOP.
          ENDLOOP.
          t_ped-wrbtr = ( t_ped-wrbtr - t_pedver-wrbtr ).
          MODIFY it_ped FROM t_ped INDEX v_tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
*        Fin entradas parciales


    CLEAR v_posinv.
    LOOP AT it_ped INTO t_ped.
      READ TABLE i_invoice INTO ls_invoice INDEX 1.
      v_posinv = v_posinv + 1.

      t_itemdata-po_number         = t_ped-ebeln.
      t_itemdata-po_item           = t_ped-ebelp.
      t_itemdata-item_amount       = t_ped-wrbtr.
      t_itemdata-tax_code          = ls_invoice-taxcode.

*      SELECT SINGLE meins INTO t_itemdata-po_unit
*      FROM ekpo
*      WHERE ebeln EQ t_itemdata-po_number
*      AND   ebelp EQ t_itemdata-po_item.
      zcl_verifica_factura=>ekpo4( EXPORTING i_operacion = 'READ' lv_ebeln = t_itemdata-po_number lv_ebelp = t_itemdata-po_item
      IMPORTING es_ekpo = es_ekpo_aux ).
      IF es_ekpo_aux IS NOT INITIAL.
        t_itemdata-po_unit = es_ekpo_aux-meins.
      ENDIF.
*      select single * from T006 where msehi eq t_itemdata-po_unit.
      zcl_verifica_factura=>t006( EXPORTING i_operacion = 'READ' lv_msehi = t_itemdata-po_unit IMPORTING ls_t006 = ls_t006 ).
*      if sy-subrc eq 0.
      IF ls_t006 IS NOT INITIAL.
*         move T006-isocode to t_itemdata-po_unit_iso.
        t_itemdata-po_unit_iso = ls_t006-isocode.
      ELSE.
*        move t_itemdata-po_unit to t_itemdata-po_unit_iso.
        t_itemdata-po_unit_iso = t_itemdata-po_unit.
      ENDIF.

*      MOVE: t_ped-lfbnr TO t_itemdata-ref_doc,
*            t_ped-lfgja TO t_itemdata-ref_doc_year,
*            t_ped-lfpos TO t_itemdata-ref_doc_it,
*            t_ped-menge TO t_itemdata-quantity,
*            v_posinv    TO t_itemdata-invoice_doc_item.
      t_itemdata-ref_doc          = t_ped-lfbnr.
      t_itemdata-ref_doc_year     = t_ped-lfgja.
      t_itemdata-ref_doc_it       = t_ped-lfpos.
      t_itemdata-quantity         = t_ped-menge.
      t_itemdata-invoice_doc_item = v_posinv.
*
      IF es_ekpo-pstyp EQ '9'.
*        MOVE t_ped-lfbnr TO t_itemdata-sheet_no.
        t_itemdata-sheet_no = t_ped-lfbnr.
        IF ls_invoice-rfc_emisor = 'TRO9912139C0'.  " TRANSPORTES ROLESA
          CLEAR packno.
*         select single * from essr where lblni eq t_ped-lfbnr.
          zcl_verifica_factura=>essr( EXPORTING i_operacion = 'READ' lv_lblni = s_ekbe-lfbnr IMPORTING ls_esrr = ls_essr ).
*         select single sub_packno into packno from esll
*         where packno eq essr-packno.
          zcl_verifica_factura=>esll( EXPORTING i_operacion = 'READ' lv_packno = ls_essr-packno IMPORTING ls_esll = ls_esll  ).
          packno = ls_esll-sub_packno.
*         select single * from esll where packno eq packno.
          zcl_verifica_factura=>esll( EXPORTING i_operacion = 'READ' lv_packno = packno IMPORTING ls_esll = ls_esll  ).
          IF ls_esll IS NOT INITIAL.
*         if sy-subrc eq 0.
*           move: esll-extrow to t_itemdata-sheet_item,
*                 esll-meins  to t_itemdata-po_unit.
            t_itemdata-sheet_item = ls_esll-extrow.
            t_itemdata-po_unit    = ls_esll-meins.
            IF t_itemdata-po_unit = 'UP'.
              t_itemdata-po_unit = 'LE'.
            ENDIF.

*           "Obtiene el po_unit_iso 18JUL25 SIL
*           select single * from T006 where msehi eq t_itemdata-po_unit.
            zcl_verifica_factura=>t006( EXPORTING i_operacion = 'READ' lv_msehi = t_itemdata-po_unit IMPORTING ls_t006 = ls_t006 ).
            IF ls_t006 IS INITIAL.
*           if sy-subrc eq 0.
*             move T006-isocode to t_itemdata-po_unit_iso.
              t_itemdata-po_unit_iso = ls_t006-isocode.
            ELSE.
*             move t_itemdata-po_unit to t_itemdata-po_unit_iso.
              t_itemdata-po_unit_iso = t_itemdata-po_unit.
            ENDIF.
          ENDIF.
        ELSE. "El resto de los transportistas remueve la Cantidad, UM SIL 18JUL25
          CLEAR: t_itemdata-quantity, t_itemdata-po_unit, t_itemdata-po_unit_iso.
        ENDIF.
      ENDIF.

      IF ls_invoice-doctyp EQ 'P' AND s_ekko-bsart EQ 'YUBT'.
        READ TABLE t_ekbe INTO s_ekbe INDEX 1.
*         select single stunr zaehk into (EKBZ-stunr , EKBZ-zaehk)
*         from EKBZ
*         where ebeln eq t_ekbe-ebeln
*         and   ebelp eq t_ekbe-ebelp
*         and   belnr eq t_ekbe-belnr.
        zcl_verifica_factura=>ekbz2( EXPORTING i_operacion = 'READ' i_ebeln = s_ekbe-ebeln i_ebelp = s_ekbe-ebelp i_belnr = s_ekbe-belnr
        IMPORTING lv_stunr = es_ekbz-stunr lv_zaehk = es_ekbz-zaehk ).
*         if sy-subrc eq 0.
        IF es_ekbz-stunr IS NOT INITIAL AND es_ekbz-zaehk IS NOT INITIAL.
          t_itemdata-cond_st_no = es_ekbz-stunr.
          t_itemdata-cond_count = es_ekbz-zaehk.
        ENDIF.
      ENDIF.

      APPEND t_itemdata TO it_itemdata.

      IF ls_invoice-ind_imp NE space.
        READ TABLE t_ekbe INTO s_ekbe INDEX 1.
*       move t_ekbe-budat to t_headerdata-pstng_date.
        t_headerdata-pstng_date = s_ekbe-budat.
*       select single txz01 into ekpo-txz01 from ekpo where ebeln eq t_ekbe-ebeln and ebelp eq t_ekbe-ebelp.
        zcl_verifica_factura=>ekpo4( EXPORTING i_operacion = 'READ' lv_ebeln = s_ekbe-ebeln lv_ebelp = s_ekbe-ebelp
        IMPORTING es_ekpo = es_ekpo_aux ).
        IF es_ekpo_aux IS NOT INITIAL.
          es_ekpo-txz01 = es_ekpo_aux-txz01.
        ENDIF.
        CONCATENATE ls_invoice-nofact t_itemdata-po_number es_ekpo-txz01 INTO t_headerdata-item_text  "Descripcion
        SEPARATED BY space.

*- Si la moneda es USD toma el tipo de cambio de acuerdo a la fecha de la entrada
        IF ls_invoice-waers EQ 'USD'.
          CLEAR t_exch_rate.
*         CALL FUNCTION 'BAPI_EXCHANGERATE_GETDETAIL'
*          EXPORTING
*            rate_type        = 'M'
*            from_curr        = 'USD'
*            to_currncy       = 'MXN'
*            date             = t_ekbe-budat
*          IMPORTING
*            EXCH_RATE        = t_exch_rate.
          zcl_bapi_exchangerate_getdet=>bapi_exchangerate_getdetail( EXPORTING i_rate_type = 'M'
                                                                               i_from_curr = 'USD'
                                                                               i_to_currncy = 'MXN'
                                                                               i_date = s_ekbe-budat
                                                                     IMPORTING es_exch_rate = t_exch_rate ).
          t_headerdata-exch_rate = t_exch_rate-exch_rate.

        ENDIF.
      ENDIF.

    ENDLOOP.

    CLEAR t_account.

*   Se busca si tiene asignación contable multiple
    LOOP AT it_itemdata INTO t_itemdata.
*
*      SELECT SINGLE VRTKZ PSTYP into (ekpo-VRTKZ, ekpo-PSTYP)
*        FROM ekpo
*        WHERE ebeln EQ t_itemdata-po_number AND
*              ebelp EQ t_itemdata-po_item.
      zcl_verifica_factura=>ekpo4( EXPORTING i_operacion = 'READ' lv_ebeln = t_itemdata-po_number lv_ebelp = t_itemdata-po_item
      IMPORTING es_ekpo = es_ekpo_aux ).
      IF es_ekpo_aux IS NOT INITIAL.
        es_ekpo-vrtkz = es_ekpo_aux-vrtkz.
        es_ekpo-pstyp = es_ekpo_aux-pstyp.
      ENDIF.
*
**-         Si tiene distribucion contable:
      IF es_ekpo-vrtkz NE space.

      IF es_ekpo-pstyp EQ '9'.
*           Si es de servicios aplica directo MSEG
*-          Se canceló MSEG porque no trae el importe en la moneda del documento
        DATA: zekkn(2) TYPE n.
*-         Split contable para hojas de servicios
*-         se agregó en la seleccion el campo ZEKKN porque se duplican cuando existen 2 Ent. Mcia
*-         para una misma pos.
        LOOP AT t_ekbe INTO s_ekbe WHERE ebeln EQ t_itemdata-po_number
                       AND   ebelp EQ t_itemdata-po_item.
*                 select * from eskn
*                 where packno eq t_ekbe-lfbnr
*                 and   zekkn  eq t_ekbe-zekkn.
          zcl_verifica_factura=>eskn( EXPORTING i_operacion = 'READ' lv_zekkn = s_ekbe-zekkn lv_lfbnr = s_ekbe-lfbnr
          IMPORTING lt_eskn = t_eskn ).
          LOOP AT t_eskn INTO s_eskn.
            zekkn = s_eskn-zekkn.
*
*                 move: t_itemdata-invoice_doc_item to t_account-INVOICE_DOC_ITEM,
*                       zekkn              to t_account-SERIAL_NO,
*                       i_invoice-TAXCODE  to t_account-TAX_CODE,
*                       eskn-netwr         to t_account-ITEM_AMOUNT,
*                       t_itemdata-PO_UNIT to t_account-PO_UNIT,
*                       t_itemdata-po_unit_iso to t_account-po_unit_iso,
*                       eskn-SAKTO         to t_account-GL_ACCOUNT,
*                       eskn-KOSTL         to t_account-COSTCENTER,
*                       eskn-GSBER         to t_account-BUS_AREA,
*                       eskn-KOKRS         to t_account-CO_AREA,
*                       eskn-TXJCD         to t_account-TAXJURCODE,
*                       eskn-VBELN         to t_account-SD_DOC,
*                       eskn-VBELP         to t_account-SDOC_ITEM,
*                       eskn-AUFNR         to t_account-ORDERID,
*                       eskn-ANLN1         to t_account-ASSET_NO,
*                       eskn-ANLN2         to t_account-SUB_NUMBER,
*                       eskn-DABRZ         to t_account-REF_DATE,
*                       eskn-FIPOS         to t_account-CMMT_ITEM,
*                       eskn-FISTL         to t_account-FUNDS_CTR,
*                       eskn-FKBER         to t_account-FUNC_AREA,
*                       eskn-GEBER         to t_account-FUND,
*                       eskn-IMKEY         to t_account-RL_EST_KEY,
*                       eskn-KOKRS         to t_account-CO_AREA,
*                       eskn-KSTRG         to t_account-COSTOBJECT,
*                       eskn-NPLNR         to t_account-NETWORK,
*                       eskn-PAOBJNR       to t_account-PROFIT_SEGM_NO,
*                       eskn-PRCTR         to t_account-PROFIT_CTR,
*                       eskn-PS_PSP_PNR    to t_account-WBS_ELEM,
*                       eskn-GRANT_NBR     to t_account-GRANT_NBR.

            t_account-invoice_doc_item = t_itemdata-invoice_doc_item.
            t_account-serial_no      = zekkn.
            t_account-tax_code       = ls_invoice-taxcode.
            t_account-item_amount    = s_eskn-netwr.
            t_account-po_unit        = t_itemdata-po_unit.
            t_account-po_unit_iso    = t_itemdata-po_unit_iso.
            t_account-gl_account     = s_eskn-sakto.
            t_account-costcenter     = s_eskn-kostl.
            t_account-bus_area       = s_eskn-gsber.
            t_account-co_area        = s_eskn-kokrs.
            t_account-taxjurcode     = s_eskn-txjcd.
            t_account-sd_doc         = s_eskn-vbeln.
            t_account-sdoc_item      = s_eskn-vbelp.
            t_account-orderid        = s_eskn-aufnr.
            t_account-asset_no       = s_eskn-anln1.
            t_account-sub_number     = s_eskn-anln2.
            t_account-ref_date       = s_eskn-dabrz.
            t_account-cmmt_item      = s_eskn-fipos.
            t_account-funds_ctr      = s_eskn-fistl.
            t_account-func_area      = s_eskn-fkber.
            t_account-fund           = s_eskn-geber.
            t_account-rl_est_key     = s_eskn-imkey.
            t_account-co_area        = s_eskn-kokrs.
            t_account-costobject     = s_eskn-kstrg.
            t_account-network        = s_eskn-nplnr.
            t_account-profit_segm_no = s_eskn-paobjnr.
            t_account-profit_ctr     = s_eskn-prctr.
            t_account-wbs_elem       = s_eskn-ps_psp_pnr.
            t_account-grant_nbr      = s_eskn-grant_nbr.

            APPEND t_account TO it_account.
*
*                 endselect.      "MSEG
          ENDLOOP.
        ENDLOOP.  " t_ekbe
*       Si es de material aplica la distribución de EKKN
      ELSE.
*        select * from ekkn
*                where ebeln eq t_itemdata-po_number
*                  and ebelp eq t_itemdata-po_item
*                  and LOEKZ eq space.
        zcl_verifica_factura=>ekkn( EXPORTING i_operacion = 'READ' lv_ebeln = t_itemdata-po_number lv_ebelp = t_itemdata-po_item
        IMPORTING lt_ekkn = t_ekkn ).
        LOOP AT t_ekkn INTO s_ekkn.
          s_amount = t_itemdata-item_amount  * ( s_ekkn-vproz / 100 ).
*
*          move: t_itemdata-INVOICE_DOC_ITEM to t_account-INVOICE_DOC_ITEM,
*                ekkn-ZEKKN         to t_account-SERIAL_NO,
*                i_invoice-TAXCODE  to t_account-TAX_CODE,
*                s_amount           to t_account-ITEM_AMOUNT,
*                ekkn-TXJCD         to t_account-TAXJURCODE,
*                ekkn-MENGE         to t_account-QUANTITY,
*                t_itemdata-PO_UNIT to t_account-PO_UNIT,
*                t_itemdata-po_unit_iso to t_account-po_unit_iso,
*                ekkn-SAKTO         to t_account-GL_ACCOUNT,
*                ekkn-KOSTL         to t_account-COSTCENTER,
*                ekkn-VBELN         to t_account-SD_DOC,
*                ekkn-VBELP         to t_account-SDOC_ITEM,
*                ekkn-ANLN1         to t_account-ASSET_NO,
*                ekkn-ANLN2         to t_account-SUB_NUMBER,
*                ekkn-AUFNR         to t_account-ORDERID,
*                ekkn-DABRZ         to t_account-REF_DATE,
*                ekkn-FIPOS         to t_account-CMMT_ITEM,
*                ekkn-FISTL         to t_account-FUNDS_CTR,
*                ekkn-FKBER         to t_account-FUNC_AREA,
*                ekkn-GEBER         to t_account-FUND,
*                ekkn-GSBER         to t_account-BUS_AREA,
*                ekkn-IMKEY         to t_account-RL_EST_KEY,
*                ekkn-KOKRS         to t_account-CO_AREA,
*                ekkn-KSTRG         to t_account-COSTOBJECT,
*                ekkn-NPLNR         to t_account-NETWORK,
*                ekkn-PAOBJNR       to t_account-PROFIT_SEGM_NO,
*                ekkn-PRCTR         to t_account-PROFIT_CTR,
*                ekkn-PS_PSP_PNR    to t_account-WBS_ELEM,
*                ekkn-GRANT_NBR     to t_account-GRANT_NBR.
          t_account-invoice_doc_item = t_itemdata-invoice_doc_item.
          t_account-serial_no      = s_ekkn-zekkn.
          t_account-tax_code       = ls_invoice-taxcode.
          t_account-item_amount    = s_amount.
          t_account-taxjurcode     = s_ekkn-txjcd.
          t_account-quantity       = s_ekkn-menge.
          t_account-po_unit        = t_itemdata-po_unit.
          t_account-po_unit_iso    = t_itemdata-po_unit_iso.
          t_account-gl_account     = s_ekkn-sakto.
          t_account-costcenter     = s_ekkn-kostl.
          t_account-sd_doc         = s_ekkn-vbeln.
          t_account-sdoc_item      = s_ekkn-vbelp.
          t_account-asset_no       = s_ekkn-anln1.
          t_account-sub_number     = s_ekkn-anln2.
          t_account-orderid        = s_ekkn-aufnr.
          t_account-ref_date       = s_ekkn-dabrz.
          t_account-cmmt_item      = s_ekkn-fipos.
          t_account-funds_ctr      = s_ekkn-fistl.
          t_account-func_area      = s_ekkn-fkber.
          t_account-fund           = s_ekkn-geber.
          t_account-bus_area       = s_ekkn-gsber.
          t_account-rl_est_key     = s_ekkn-imkey.
          t_account-co_area        = s_ekkn-kokrs.
          t_account-costobject     = s_ekkn-kstrg.
          t_account-network        = s_ekkn-nplnr.
          t_account-profit_segm_no = s_ekkn-paobjnr.
          t_account-profit_ctr     = s_ekkn-prctr.
          t_account-wbs_elem       = s_ekkn-ps_psp_pnr.
          t_account-grant_nbr      = s_ekkn-grant_nbr.
*          append t_account.
          APPEND t_account TO it_account.
*        endselect.
        ENDLOOP.
      ENDIF.
      endif.
    ENDLOOP.
*
*
    IF it_itemdata[] IS INITIAL AND ls_invoice-doctyp NE 'C'.
*      select single * from ZINV_SPOOL
*                where NOFACT     eq I_INVOICE-NOFACT
*                  and DOCTYP     eq I_INVOICE-DOCTYP
*                  and EBELN      eq I_INVOICE-EBELN
*                  and INVOICE_MM ne space.
      zcl_verifica_factura=>zinv_spool2( EXPORTING i_operacion = 'READ' lv_nofact = ls_invoice-nofact lv_doctyp = ls_invoice-doctyp
      lv_ebeln = ls_invoice-ebeln IMPORTING ls_zinv = st_inv_spool ).
*      if sy-subrc eq 0.
      IF st_inv_spool-invoice_mm NE space.
        IF st_inv_spool IS NOT INITIAL.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E04'.
*        MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
          REPLACE '&' IN s_return-message WITH ls_invoice-nofact.
*        MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
        ELSE.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E03'.
*        MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
*        MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
        ENDIF.
      ENDIF.
    ENDIF.


*- retenciones
    IF ls_invoice-rt_subjct NE space.
*
*         SELECT * FROM lfbw
*         WHERE lifnr   EQ l_lifnr
*         AND bukrs     EQ t_headerdata-comp_code
*         AND wt_subjct EQ 'X'.
      zcl_verifica_factura=>lfbw( EXPORTING i_operacion = 'READ' i_lifnr = l_lifnr i_bukrs = t_headerdata-comp_code
      IMPORTING lt_lfbw = t_lfbw ).
      LOOP AT t_lfbw INTO s_lfbw.
        CLEAR t_withtaxdata.
*          REFRESH t_withtaxdata.
        t_withtaxdata-split_key   = 1.
        t_withtaxdata-wi_tax_type = s_lfbw-witht.
        t_withtaxdata-wi_tax_code = s_lfbw-wt_withcd.
        t_withtaxdata-wi_tax_base = ls_invoice-imp_base. "i_invoice-IMPBRT.
        IF s_LFBW-wt_withcd EQ '18'.
          t_withtaxdata-wi_tax_amt  = ls_invoice-imp_ret.
        ELSE.
          t_withtaxdata-wi_tax_amt  = ls_invoice-imp_base * '0.04'.
        ENDIF.
        APPEND t_withtaxdata TO it_withtaxdata.
*        ENDSELECT.
      ENDLOOP.
    ENDIF.

*-    Cuando la factura no tiene Retencion y el proveedor tiene el ind 6%
*-     --> Se coloca 0 en las retenciones
    IF ls_invoice-rt_6 EQ space.
*        SELECT * FROM lfbw
*        WHERE lifnr   EQ l_lifnr
*        AND bukrs     EQ t_headerdata-comp_code
*        AND wt_subjct EQ 'X'
*        AND WT_WITHCD eq '18'.
      zcl_verifica_factura=>lfbw( EXPORTING i_operacion = 'READ' i_lifnr = l_lifnr i_bukrs = t_headerdata-comp_code
            IMPORTING lt_lfbw = t_lfbw ).
*        endselect.
*        if sy-subrc eq 0.
      READ TABLE t_lfbw INTO s_lfbw WITH KEY wt_subjct = 'X' wt_withcd = '18'.
      IF sy-subrc EQ 0.
        CLEAR t_withtaxdata.
      ENDIF.
*- Cuando la factura tiene retencion y el dato maestro del proveedor no tiene ind 6%
*-    --> Marca error
    ELSEIF ls_invoice-rt_6 NE space.
*          SELECT * FROM lfbw
*          WHERE lifnr   EQ l_lifnr
*          AND bukrs     EQ t_headerdata-comp_code
*          AND wt_subjct EQ 'X'
*          AND WT_WITHCD eq '18'.
      zcl_verifica_factura=>lfbw( EXPORTING i_operacion = 'READ' i_lifnr = l_lifnr i_bukrs = t_headerdata-comp_code
                  IMPORTING lt_lfbw = t_lfbw ).
*          endselect.
      READ TABLE t_lfbw INTO s_lfbw WITH KEY wt_subjct = 'X' wt_withcd = '18'.
      IF sy-subrc NE 0.
        READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E16'.
*             MOVE text_el_tab-entry to s_return-message.
        s_return-message = ls_text-entry.
*             MOVE 'E' to s_return-type.
        s_return-type = 'E'.
        APPEND s_return TO e_message.
        error_flag = 'X'.
        EXIT.
      ENDIF.
*
    ENDIF.

*      Valida si tiene doble retención
    IF ls_invoice-dr NE space.
*      Servicios Profesionales y/o Arrendamiento IVA Trasladado 16%
      IF ls_invoice-dr EQ 'AS'.
*            SELECT * FROM lfbw
*            WHERE lifnr   EQ l_lifnr
*            AND bukrs     EQ t_headerdata-comp_code
*            AND wt_subjct EQ 'X'
*            AND ( ( WITHT EQ '01' AND WT_WITHCD eq '11' ) or
*                  ( WITHT EQ '02' AND WT_WITHCD eq '07' ) or
*                  ( WITHT EQ '05' AND WT_WITHCD eq '06' ) ).
        zcl_verifica_factura=>lfbw( EXPORTING i_operacion = 'READ' i_lifnr = l_lifnr i_bukrs = t_headerdata-comp_code
                          IMPORTING lt_lfbw = t_lfbw ).
        LOOP AT t_lfbw INTO s_lfbw WHERE wt_subjct EQ 'X' AND ( ( witht EQ '01' AND wt_withcd EQ '11' ) OR
                  ( witht EQ '02' AND wt_withcd EQ '07' ) OR
                  ( witht EQ '05' AND wt_withcd EQ '06' ) ).
          CLEAR t_withtaxdata.
          t_withtaxdata-split_key   = 1.
          t_withtaxdata-wi_tax_type = s_lfbw-witht.
          t_withtaxdata-wi_tax_code = s_lfbw-wt_withcd.
          IF s_lfbw-wt_withcd EQ '11'.
            t_withtaxdata-wi_tax_base = ls_invoice-base_isr_dr.
            t_withtaxdata-wi_tax_amt  = ls_invoice-imp_isr_dr.
          ELSEIF s_lfbw-wt_withcd EQ '07'.
            t_withtaxdata-wi_tax_base = ls_invoice-base_iva_dr.
            t_withtaxdata-wi_tax_amt  = ls_invoice-imp_iva_dr.
          ENDIF.
          APPEND t_withtaxdata TO it_withtaxdata.
*            ENDSELECT.
        ENDLOOP.
        READ TABLE t_lfbw INTO s_lfbw WHERE wt_subjct EQ 'X' AND ( ( witht EQ '01' AND wt_withcd EQ '11' ) OR
                  ( witht EQ '02' AND wt_withcd EQ '07' ) OR
                  ( witht EQ '05' AND wt_withcd EQ '06' ) ).
        IF sy-subrc NE 0.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E24'.
*             MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
*             MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
          EXIT.
        ENDIF.
*         Debe tener 2 retenciones.
*          DESCRIBE TABLE t_withtaxdata.
        CLEAR records.
        LOOP AT it_withtaxdata INTO t_withtaxdata.
          ADD 1 TO records.
        ENDLOOP.
*          if sy-tfill < 2.
        IF records < 2.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E24'.
*             MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
*             MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
          EXIT.
        ENDIF.
**      Servicios Profesionales y/o Arrendamiento IVA Trasladado 8%
      ELSEIF ls_invoice-dr EQ 'AF'.
*            SELECT * FROM lfbw
*            WHERE lifnr   EQ l_lifnr
*            AND bukrs     EQ t_headerdata-comp_code
*            AND wt_subjct EQ 'X'
*            AND ( ( WITHT EQ '01' AND WT_WITHCD eq '11' ) or
*                  ( WITHT EQ '02' AND WT_WITHCD eq '16') ).
        zcl_verifica_factura=>lfbw( EXPORTING i_operacion = 'READ' i_lifnr = l_lifnr i_bukrs = t_headerdata-comp_code
                                  IMPORTING lt_lfbw = t_lfbw ).
        LOOP AT t_lfbw INTO s_lfbw WHERE wt_subjct EQ 'X' AND ( ( witht EQ '01' AND wt_withcd EQ '11' ) OR
                ( witht EQ '02' AND wt_withcd EQ '16' ) ).
          CLEAR t_withtaxdata.
          t_withtaxdata-split_key   = 1.
          t_withtaxdata-wi_tax_type = s_lfbw-witht.
          t_withtaxdata-wi_tax_code = s_lfbw-wt_withcd.
          IF s_lfbw-wt_withcd EQ '11'.
            t_withtaxdata-wi_tax_base = ls_invoice-base_isr_dr.
            t_withtaxdata-wi_tax_amt  = ls_invoice-imp_isr_dr.
          ELSEIF s_lfbw-wt_withcd EQ '16'.
            t_withtaxdata-wi_tax_base = ls_invoice-base_iva_dr.
            t_withtaxdata-wi_tax_amt  = ls_invoice-imp_iva_dr.
          ENDIF.
          APPEND t_withtaxdata TO it_withtaxdata.
*            ENDSELECT.
        ENDLOOP.
        READ TABLE t_lfbw INTO s_lfbw WHERE wt_subjct EQ 'X' AND ( ( witht EQ '01' AND wt_withcd EQ '11' ) OR
                ( witht EQ '02' AND wt_withcd EQ '16' ) ).
        IF sy-subrc NE 0.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E24'.
*             MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
*             MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
          EXIT.
        ENDIF.
*         Debe tener 2 retenciones.
*          DESCRIBE TABLE t_withtaxdata.
        CLEAR records.
        LOOP AT it_withtaxdata INTO t_withtaxdata.
          ADD 1 TO records.
        ENDLOOP.
        IF records < 2.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E24'.
*             MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
*             MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
          EXIT.
        ENDIF.
*        Servicios Profesionales y/o Arrendamiento RESICO
      ELSEIF ls_invoice-dr EQ 'AR'.
*            SELECT * FROM lfbw
*            WHERE lifnr   EQ l_lifnr
*            AND bukrs     EQ t_headerdata-comp_code
*            AND wt_subjct EQ 'X'
*            AND ( ( WITHT EQ '01' AND WT_WITHCD eq '19' ) or
*                  ( WITHT EQ '02' AND WT_WITHCD eq '07') ).
        zcl_verifica_factura=>lfbw( EXPORTING i_operacion = 'READ' i_lifnr = l_lifnr i_bukrs = t_headerdata-comp_code
                                    IMPORTING lt_lfbw = t_lfbw ).
        LOOP AT t_lfbw INTO s_lfbw WHERE wt_subjct EQ 'X' AND ( ( witht EQ '01' AND wt_withcd EQ '19' ) OR
                ( witht EQ '02' AND wt_withcd EQ '07' ) ).
          CLEAR t_withtaxdata.
          t_withtaxdata-split_key   = 1.
          t_withtaxdata-wi_tax_type = s_lfbw-witht.
          t_withtaxdata-wi_tax_code = s_lfbw-wt_withcd.
          IF s_lfbw-wt_withcd EQ '19'.
            t_withtaxdata-wi_tax_base = ls_invoice-base_isr_dr.
            t_withtaxdata-wi_tax_amt  = ls_invoice-imp_isr_dr.
          ELSEIF s_lfbw-wt_withcd EQ '07'.
            t_withtaxdata-wi_tax_base = ls_invoice-base_iva_dr.
            t_withtaxdata-wi_tax_amt  = ls_invoice-imp_iva_dr.
          ENDIF.
          APPEND t_withtaxdata TO it_withtaxdata.
*            ENDSELECT.
        ENDLOOP.
        READ TABLE t_lfbw INTO s_lfbw WHERE wt_subjct EQ 'X' AND ( ( witht EQ '01' AND wt_withcd EQ '19' ) OR
                ( witht EQ '02' AND wt_withcd EQ '07' ) ).
        IF sy-subrc NE 0.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E24'.
*             MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
*             MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
          EXIT.
        ENDIF.
**         Debe tener 2 retenciones..
*          DESCRIBE TABLE t_withtaxdata.
        CLEAR records.
        LOOP AT it_withtaxdata INTO t_withtaxdata.
          ADD 1 TO records.
        ENDLOOP.
*          if sy-tfill < 2.
        IF records < 2.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E24'.
*             MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
*             MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
          EXIT.
        ENDIF.
*        Servicios Profesionales y/o Arrendamiento RESICO IVA Trasladado 8%
      ELSEIF ls_invoice-dr EQ 'SF'.
*            SELECT * FROM lfbw
*            WHERE lifnr   EQ l_lifnr
*            AND bukrs     EQ t_headerdata-comp_code
*            AND wt_subjct EQ 'X'
*            AND ( ( WITHT EQ '01' AND WT_WITHCD eq '19' ) or
*                  ( WITHT EQ '02' AND WT_WITHCD eq '16') ).
        zcl_verifica_factura=>lfbw( EXPORTING i_operacion = 'READ' i_lifnr = l_lifnr i_bukrs = t_headerdata-comp_code
                                            IMPORTING lt_lfbw = t_lfbw ).
        LOOP AT t_lfbw INTO s_lfbw WHERE wt_subjct EQ 'X' AND ( ( witht EQ '01' AND wt_withcd EQ '19' ) OR
                ( witht EQ '02' AND wt_withcd EQ '16' ) ).
          CLEAR t_withtaxdata.
          t_withtaxdata-split_key   = 1.
          t_withtaxdata-wi_tax_type = s_lfbw-witht.
          t_withtaxdata-wi_tax_code = s_lfbw-wt_withcd.
          IF s_lfbw-wt_withcd EQ '19'.
            t_withtaxdata-wi_tax_base = ls_invoice-base_isr_dr.
            t_withtaxdata-wi_tax_amt  = ls_invoice-imp_isr_dr.
          ELSEIF s_lfbw-wt_withcd EQ '16'.
            t_withtaxdata-wi_tax_base = ls_invoice-base_iva_dr.
            t_withtaxdata-wi_tax_amt  = ls_invoice-imp_iva_dr.
          ENDIF.
          APPEND t_withtaxdata TO it_withtaxdata.
*            ENDSELECT.
        ENDLOOP.
        READ TABLE t_lfbw INTO s_lfbw WHERE wt_subjct EQ 'X' AND ( ( witht EQ '01' AND wt_withcd EQ '19' ) OR
                ( witht EQ '02' AND wt_withcd EQ '16' ) ).
        IF sy-subrc NE 0.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E24'.
*             MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
*             MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
          EXIT.
        ENDIF.
*         Debe tener 2 retenciones.
*          DESCRIBE TABLE t_withtaxdata.
        CLEAR records.
        LOOP AT it_withtaxdata INTO t_withtaxdata.
          ADD 1 TO records.
        ENDLOOP.
*          if sy-tfill < 2.
        IF records < 2.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E24'.
*             MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
*             MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
          EXIT.
        ENDIF.
*        RESICO
      ELSEIF ls_invoice-dr EQ 'RC'.
*            SELECT * FROM lfbw
*            WHERE lifnr   EQ l_lifnr
*            AND bukrs     EQ t_headerdata-comp_code
*            AND wt_subjct EQ 'X'
*            AND WITHT     EQ '01'
*            AND WT_WITHCD eq '19'.
        zcl_verifica_factura=>lfbw( EXPORTING i_operacion = 'READ' i_lifnr = l_lifnr i_bukrs = t_headerdata-comp_code
                                                    IMPORTING lt_lfbw = t_lfbw ).
        LOOP AT t_lfbw INTO s_lfbw WHERE wt_subjct EQ 'X' AND  witht EQ '01' AND wt_withcd EQ '19'.
*              CLEAR t_withtaxdata.
*              t_withtaxdata-split_key   = 1.
*              t_withtaxdata-wi_tax_type = lfbw-witht.
*              t_withtaxdata-wi_tax_code = lfbw-wt_withcd.
*              t_withtaxdata-wi_tax_base = i_invoice-BASE_ISR_DR.
*              t_withtaxdata-wi_tax_amt  = i_invoice-IMP_ISR_DR.
*              APPEND t_withtaxdata.
          CLEAR t_withtaxdata.
          t_withtaxdata-split_key   = 1.
          t_withtaxdata-wi_tax_type = s_lfbw-witht.
          t_withtaxdata-wi_tax_code = s_lfbw-wt_withcd.
          t_withtaxdata-wi_tax_base = ls_invoice-base_isr_dr.
          t_withtaxdata-wi_tax_amt  = ls_invoice-imp_isr_dr.
          APPEND t_withtaxdata TO it_withtaxdata.
*            ENDSELECT.
        ENDLOOP.
        READ TABLE t_lfbw INTO s_lfbw WHERE wt_subjct EQ 'X' AND  witht EQ '01' AND wt_withcd EQ '19'.
        IF sy-subrc NE 0.
          READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E24'.
*             MOVE text_el_tab-entry to s_return-message.
          s_return-message = ls_text-entry.
*             MOVE 'E' to s_return-type.
          s_return-type = 'E'.
          APPEND s_return TO e_message.
          error_flag = 'X'.
          EXIT.
        ENDIF.
      ELSE.
        READ TABLE text_el_tab INTO ls_text WITH KEY id = 'I' key = 'E25'.
*             MOVE text_el_tab-entry to s_return-message.
        s_return-message = ls_text-entry.
*             MOVE 'E' to s_return-type.
        s_return-type = 'E'.
        APPEND s_return TO e_message.
        error_flag = 'X'.
        EXIT.
      ENDIF.
    ENDIF.
*-
    CHECK error_flag EQ space.
*
*      CALL FUNCTION 'BAPI_INCOMINGINVOICE_CREATE'
*        EXPORTING
*          HEADERDATA       = t_headerdata
*        IMPORTING
*          INVOICEDOCNUMBER = l_invoice
*          FISCALYEAR       = l_year
*        TABLES
*          ITEMDATA         = t_itemdata
*          ACCOUNTINGDATA   = t_account
*          GLACCOUNTDATA    = t_glaccount
*          WITHTAXDATA      = t_withtaxdata
*          RETURN           = t_return.

    zcl_bapi_incominginvoice_crea=>bapi_incominginvoice_create( EXPORTING i_header = t_headerdata
                                                                          it_item = it_itemdata
                                                                          it_account = it_account
                                                                          it_glaccount = it_glaccount
                                                                          it_withtax = it_withtaxdata
                                                                IMPORTING e_invoice = l_invoice
                                                                          e_year = l_year
                                                                          et_return = it_return ).
    IF sy-subrc <>  0.
    ELSE.
      LOOP AT it_return INTO t_return.
        IF NOT t_return IS INITIAL.
          CLEAR e_message.
          MOVE-CORRESPONDING t_return TO s_message.
          IF t_return-type = 'A' OR t_return-type = 'E'.
            error_flag = 'X'.
          ENDIF.
          APPEND s_message TO e_message.
        ENDIF.
      ENDLOOP.
      IF error_flag = 'X'.
*        ROLLBACK WORK.
      ELSE.
*          CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
*            EXPORTING
*              WAIT   = 'X'
*            IMPORTING
*              RETURN = I_RETURN.
*
        CONCATENATE l_invoice l_year INTO v_awkey.
        CONDENSE v_AWKEY NO-GAPS.
*          select single BELNR GJAHR into (l_invoice_fi, l_year_fi)
*                        from bkpf
*                       where AWKEY eq V_AWKEY
*                         AND AWTYP EQ 'RMRP'
*                         and BLART EQ 'RE'.
        zcl_verifica_factura=>bkpf( EXPORTING i_operacion = 'READ' lv_awkey = v_awkey
                                    IMPORTING lv_belnr = l_invoice_fi lv_gjahr = l_year_fi ).
      ENDIF.
    ENDIF.
  ENDLOOP.
  CHECK error_flag IS INITIAL.

  CLEAR st_inv_spool.
*
*  select single * from ZINV_SPOOL
*                 where NOFACT eq I_INVOICE-NOFACT
*                   and DOCTYP eq I_INVOICE-DOCTYP
*                   and EBELN  eq I_INVOICE-EBELN.
  zcl_verifica_factura=>zinv_spool( EXPORTING i_operacion = 'READ' lv_nofact = ls_invoice-nofact lv_doctyp = ls_invoice-doctyp
        lv_ebeln = ls_invoice-ebeln IMPORTING ls_zinv = st_inv_aux ).
  IF st_inv_aux IS NOT INITIAL.
*  if sy-subrc eq 0.
*    move ZINV_SPOOL-folio to st_INV_SPOOL-folio.
    st_inv_spool-folio = st_inv_aux-folio.
  ELSE.
    CLEAR v_folio.
*    call function 'NUMBER_GET_NEXT'
*      EXPORTING
*        nr_range_nr             = '01'
*        object                  = 'ZVFAC'
*        quantity                = '1'
*      IMPORTING
*        number                  = v_folio
*      EXCEPTIONS
*        interval_not_found      = 1
*        number_range_not_intern = 2
*        object_not_found        = 3
*        quantity_is_0           = 4
*        quantity_is_not_1       = 5
*        interval_overflow       = 6
*        buffer_overflow         = 7
*        others                  = 8.
    zcl_number_get_next=>number_get_next( EXPORTING i_nrrangenr = '01'
                                                    i_object = 'ZVFAC'
                                          IMPORTING e_number = v_folio ).
*    move v_folio to st_INV_SPOOL-folio.
    st_inv_spool-folio = v_folio.
  ENDIF.
*
*  move st_INV_SPOOL-folio to l_folio.
  l_folio = st_inv_spool-folio.
*
*  move-corresponding I_INVOICE to st_INV_SPOOL.
*  move: ekko-lifnr     to st_INV_SPOOL-lifnr,
*        sy-datum       to st_INV_SPOOL-fecha,
*        sy-uzeit       to st_INV_SPOOL-hora,
*        i_invoice-user to st_INV_SPOOL-zuser,
*        L_INVOICE      to st_INV_SPOOL-invoice_mm,
*        l_year         to st_INV_SPOOL-year_mm,
*        l_invoice_fi   to st_INV_SPOOL-invoice_fi,
*        l_year_fi      to st_INV_SPOOL-year_fi,
*        error_flag     to st_INV_SPOOL-error_flag.

  MOVE-CORRESPONDING i_invoice TO it_inv_spool.
  LOOP AT it_inv_spool INTO st_inv_spool.
    st_inv_spool-lifnr      = s_ekko-lifnr.
    st_inv_spool-fecha      = sy-datum.
    st_inv_spool-hora       = sy-uzeit.
    st_inv_spool-zuser      = ls_invoice-user.
    st_inv_spool-invoice_mm = l_invoice.
    st_inv_spool-year_mm    = l_year.
    st_inv_spool-invoice_fi = l_invoice_fi.
    st_inv_spool-year_fi    = l_year_fi.
    st_inv_spool-error_flag = error_flag.

    MODIFY it_inv_spool FROM st_inv_spool
    TRANSPORTING lifnr fecha hora zuser invoice_mm year_mm invoice_fi year_fi error_flag
    WHERE ebeln = st_inv_spool-ebeln.
  ENDLOOP.
  LOOP AT e_message INTO s_message.
    IF NOT s_message IS INITIAL.
      CLEAR st_inv_spool-message.
      IF s_message-type = 'A' OR s_message-type = 'E'.
*        move E_MESSAGE-message to st_INV_SPOOL-message.
        st_INV_SPOOL-message = s_message-message.
        EXIT.
      ENDIF.
    ENDIF.
  ENDLOOP.
*
*  INSERT st_inv_spool INTO it_inv_spool.
ENDFUNCTION.
