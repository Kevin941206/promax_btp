FUNCTION yfmsd_salesorder_details.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(IV_SALES_ORDER) TYPE  VBELN_VA
*"  EXPORTING
*"     VALUE(ES_SALES_ORDER_DETAILS) TYPE  YSTSD_SALESORDER_DETAIL_E
*"     VALUE(ES_TOTALES) TYPE  YSTSD_TOTALES_S
*"     VALUE(ET_CONTACTS) TYPE  YTTSD_CONTACTS_S
*"     VALUE(ET_POSITIONS) TYPE  YTTSD_POSITIONS_S
*"     VALUE(ET_DATES) TYPE  YTTSD_DATES_S
*"     VALUE(ET_INVOICES) TYPE  YTTSD_INVOICES_S
*"----------------------------------------------------------------------
* Declaración de variables locales
  DATA: "ls_bapi_view        TYPE order_view,
    "ls_sales_doc        TYPE sales_key,
    "lt_sales_doc        TYPE TABLE OF sales_key,
    lt_status_header    TYPE TABLE OF zst_bapisdhdst, "bapisdhdst,
    ls_status_header    TYPE zst_bapisdhdst, "bapisdhdst,
    lt_order_header     TYPE TABLE OF zst_bapisdhd, "bapisdhd,
    ls_order_header     TYPE zst_bapisdhd, "bapisdhd,
    lt_order_items      TYPE TABLE OF zst_bapisdit, "bapisdit,
    ls_order_items      TYPE zst_bapisdit, "bapisdit,
    lt_order_partner    TYPE TABLE OF zst_bapisdpart, "bapisdpart,
    ls_order_partner    TYPE zst_bapisdpart, "bapisdpart,
    lt_order_address    TYPE TABLE OF zst_bapisdcoad, "bapisdcoad,
    lt_order_cond_item  TYPE TABLE OF zst_bapicondit, "bapicondit,
    ls_order_cond_item  TYPE zst_bapicondit, "bapicondit,
    lt_order_conditions TYPE TABLE OF zst_bapisdcond, "bapisdcond,
    lv_kunnr            TYPE kunnr,
    lt_knvk             TYPE TABLE OF zst_knvk, "knvk,
    ls_knvk             TYPE zst_knvk, "knvk,
    lt_t005t            TYPE TABLE OF zst_t005t, "t005t,
    lt_adrp             TYPE TABLE OF zst_adrp, "adrp,
    ls_adrp             TYPE zst_adrp, "adrp,
    lt_tsabt            TYPE TABLE OF zst_tsabt, "tsabt,
    ls_tsabt            TYPE zst_tsabt, "tsabt,
    lt_tpfkt            TYPE TABLE OF zst_tpfkt, "tpfkt,
    ls_tpfkt            TYPE zst_tpfkt, "tpfkt,
    ls_contacts         TYPE ystsd_contacts_s,
    ls_positions        TYPE ystsd_positions_s,
    lt_tvarvc           TYPE TABLE OF zst_tvarvc, "tvarvc,
    ls_tvarvc           TYPE zst_tvarvc, "tvarvc,
    lr_condtype         TYPE RANGE OF kscha,
    ls_condtype         LIKE LINE OF lr_condtype,
    lt_lips             TYPE TABLE OF zst_lips,
    ls_lips             TYPE zst_lips,
    lt_vbfa             TYPE TABLE OF zst_vbfa,
    ls_vbfa             TYPE zst_vbfa,
    lt_vbrp             TYPE TABLE OF zst_vbrp,
    ls_vbrp             TYPE zst_vbrp,
    lt_vbrk             TYPE TABLE OF zst_vbrk,
    ls_vbrk             TYPE zst_vbrk,
    lt_t052u            TYPE TABLE OF zst_t052u, "t052u,
    ls_t052u            TYPE zst_t052u, "t052u,
    lt_t042z            TYPE TABLE OF zst_t042z, "t042z,
    ls_t042z            TYPE zst_t042z, "t042z,
    ls_dates            TYPE ystsd_dates_s,
    lt_bkpf             TYPE TABLE OF _tt_bkpf,
    ls_bkpf             TYPE _tt_bkpf,
    lt_bkpf_aux         TYPE TABLE OF _tt_bkpf,
    lt_bsid_payed       TYPE TABLE OF zst_bsid_payed,
    ls_bsid_payed       TYPE zst_bsid_payed,
    lt_bsad_payed       TYPE TABLE OF zst_bsid_payed,
    lt_bsid             TYPE TABLE OF zst_bsid, "_tt_bsid,
    ls_bsid             TYPE zst_bsid, "_tt_bsid,
    ls_bsad             TYPE zst_bsid_payed, "bsad,
    ls_bsid_chg         TYPE zst_bsid, "_tt_bsid,
    lt_references       TYPE TABLE OF _tt_references,
    ls_references       TYPE zst_references, "_tt_references,
    ls_invoices         TYPE ystsd_invoices_s,
    lv_index            TYPE sy-tabix.

* Limpia las tablas de salida
  CLEAR: et_contacts,
           et_positions,
           et_dates,
           et_invoices.

** Prepara datos para ejecutar BAPI de detalle
*  LS_BAPI_VIEW-HEADER = 'X'.
*  LS_BAPI_VIEW-ITEM = 'X'.
*  LS_BAPI_VIEW-SDSCHEDULE = 'X'.
*  LS_BAPI_VIEW-BUSINESS = 'X'.
*  LS_BAPI_VIEW-PARTNER = 'X'.
*  LS_BAPI_VIEW-ADDRESS = 'X'.
*  LS_BAPI_VIEW-STATUS_H = 'X'.
*  LS_BAPI_VIEW-STATUS_I = 'X'.
*  LS_BAPI_VIEW-SDCOND = 'X'.
*  LS_BAPI_VIEW-SDCOND_ADD = 'X'.
*  LS_BAPI_VIEW-CONTRACT = 'X'.
*  LS_BAPI_VIEW-TEXT = 'X'.
*  LS_BAPI_VIEW-FLOW = 'X'.
*  LS_BAPI_VIEW-BILLPLAN = 'X'.
*  LS_BAPI_VIEW-CONFIGURE = 'X'.
*  LS_BAPI_VIEW-CREDCARD = 'X'.
*  LS_BAPI_VIEW-INCOMP_LOG = 'X'.
*
*  LS_SALES_DOC-VBELN = IV_SALES_ORDER.
*  INSERT LS_SALES_DOC INTO TABLE LT_SALES_DOC.
*
*  " Ejecuta BAPI para obtener detalles del pedido
*  CALL FUNCTION 'BAPISDORDER_GETDETAILEDLIST'
*    EXPORTING
*      I_BAPI_VIEW             = LS_BAPI_VIEW
*    TABLES
*      SALES_DOCUMENTS         = LT_SALES_DOC
*      ORDER_HEADERS_OUT       = LT_ORDER_HEADER
*      ORDER_ITEMS_OUT         = LT_ORDER_ITEMS
*      ORDER_PARTNERS_OUT      = LT_ORDER_PARTNER
*      ORDER_ADDRESS_OUT       = LT_ORDER_ADDRESS
*      ORDER_STATUSHEADERS_OUT = LT_STATUS_HEADER
*      ORDER_COND_ITEM         = LT_ORDER_COND_ITEM
*      ORDER_CONDITIONS_OUT    = LT_ORDER_CONDITIONS.

  zcl_qry_salesorder_details=>vbak( EXPORTING i_operacion = 'READ'
                                              i_sales_order = iv_sales_order
                                    IMPORTING et_order_header = lt_order_header ).
  zcl_qry_salesorder_details=>vbap( EXPORTING i_operacion = 'READ'
                                              i_sales_order = iv_sales_order
                                    IMPORTING et_order_items = lt_order_items ).
  zcl_qry_salesorder_details=>vbpa( EXPORTING i_operacion = 'READ'
                                              i_sales_order = iv_sales_order
                                    IMPORTING et_order_partner = lt_order_partner ).
  zcl_qry_salesorder_details=>vbuk( EXPORTING i_operacion = 'READ'
                                              i_sales_order = iv_sales_order
                                    IMPORTING et_status_header = lt_status_header ).
  IF lt_order_partner IS NOT INITIAL.
    zcl_qry_salesorder_details=>adrc( EXPORTING i_operacion = 'READ'
                                                it_order_partner = lt_order_partner
                                      IMPORTING et_order_address = lt_order_address ).
  ENDIF.
  IF lt_order_header IS NOT INITIAL.
    zcl_qry_salesorder_details=>konv( EXPORTING i_operacion = 'READ'
                                                it_order_header = lt_order_header
                                      IMPORTING et_order_conditions = lt_order_conditions ).
  ENDIF.

  " Retorna estatus
  CLEAR ls_status_header.
  READ TABLE lt_status_header INTO ls_status_header
    WITH KEY sd_doc = iv_sales_order.
  IF sy-subrc = 0.
    IF ls_status_header-overallrej = gc_tratado_tot.
      es_sales_order_details-status = TEXT-s02.
    ELSE.
      IF ls_status_header-prc_stat_h = gc_tratado_tot.
        es_sales_order_details-status = TEXT-s03.
      ELSE.
        es_sales_order_details-status = TEXT-s01.
      ENDIF.
    ENDIF.
  ENDIF.

  " Recupera el número de pedido de venta, fecha de documento y fecha de entrega
  CLEAR ls_order_header.
  READ TABLE lt_order_header INTO ls_order_header
    WITH KEY doc_number = iv_sales_order.
  IF sy-subrc = 0.
    es_sales_order_details-vbeln = ls_order_header-doc_number.
    es_sales_order_details-doc_date = ls_order_header-doc_date.
    es_sales_order_details-req_date_h = ls_order_header-req_date_h.
  ENDIF.

  " Recupera el centro
  LOOP AT lt_order_items INTO ls_order_items
    WHERE doc_number = iv_sales_order
    AND   plant IS NOT INITIAL.
    es_sales_order_details-plant = ls_order_items-plant.
    EXIT.
  ENDLOOP.

  " Recupera el contacto
  " Encuentra el cliente
  CLEAR ls_order_partner.
  READ TABLE lt_order_partner INTO ls_order_partner
    WITH KEY sd_doc = iv_sales_order
         partn_role = gc_customer_func.
  IF sy-subrc = 0.
    lv_kunnr = ls_order_partner-customer.

    " Recupera contactos asociados
    CLEAR lt_knvk.
*    CALL FUNCTION 'CUSTOMER_CONTACTPS_GET'
*      EXPORTING
*        IV_KUNNR      = LV_KUNNR
*      TABLES
*        ET_KNVK       = LT_KNVK
*      EXCEPTIONS
*        KUNNR_UNKNOWN = 1
*        OTHERS        = 2.

    zcl_qry_salesorder_details=>knvk( EXPORTING i_operacion = 'READ'
                                                i_kunnr = lv_kunnr
                                      IMPORTING et_knvk = lt_knvk ).

    IF sy-subrc = 0 AND lt_knvk[] IS NOT INITIAL.
      " Recupera los datos de dirección asociados a los contactos
*      SELECT PERSNUMBER NAME_TEXT
*        INTO CORRESPONDING FIELDS OF TABLE LT_ADRP
*        FROM ADRP
*        FOR ALL ENTRIES IN LT_KNVK
*        WHERE PERSNUMBER = LT_KNVK-PRSNR
*        AND   DATE_TO   >= SY-DATUM.
      zcl_qry_salesorder_details=>adrp( EXPORTING i_operacion = 'READ'
                                                  it_knvk = lt_knvk
                                        IMPORTING et_adrp = lt_adrp ).

      " Recupera los textos asociados al departamento
*      SELECT *
*        INTO TABLE LT_TSABT
*        FROM TSABT
*        FOR ALL ENTRIES IN LT_KNVK
*        WHERE ABTNR = LT_KNVK-ABTNR
*        AND  ( SPRAS = GC_SPANISH
*        OR     SPRAS = GC_ENGLISH ).
      zcl_qry_salesorder_details=>tsabt( EXPORTING i_operacion = 'READ'
                                                   it_knvk = lt_knvk
                                         IMPORTING et_tsabt = lt_tsabt ).

      " Recupera los textos asociados a la función de contacto
*      SELECT *
*        INTO TABLE LT_TPFKT
*        FROM TPFKT
*        FOR ALL ENTRIES IN LT_KNVK
*        WHERE PAFKT = LT_KNVK-PAFKT
*        AND  ( SPRAS = GC_SPANISH
*        OR     SPRAS = GC_ENGLISH ).
      zcl_qry_salesorder_details=>tpfkt( EXPORTING i_operacion = 'READ'
                                                   it_knvk = lt_knvk
                                         IMPORTING et_tpfkt = lt_tpfkt ).

      " Recupera detalles de los contactos
      LOOP AT lt_knvk INTO ls_knvk .
        CLEAR ls_contacts.
        ls_contacts-parnr = ls_knvk-parnr.
        ls_contacts-kunnr = ls_knvk-kunnr.
        ls_contacts-abtnr = ls_knvk-abtnr.

        " Lee la descripción de departamento (Español)
        CLEAR ls_tsabt.
        READ TABLE lt_tsabt INTO ls_tsabt
          WITH KEY abtnr = ls_knvk-abtnr
                   spras = gc_spanish.
        IF sy-subrc = 0.
          ls_contacts-vtext_es = ls_tsabt-vtext.
        ENDIF.

        " Lee la descripción de departamento (Inglés)
        CLEAR ls_tsabt.
        READ TABLE lt_tsabt INTO ls_tsabt
          WITH KEY abtnr = ls_knvk-abtnr
                   spras = gc_english.
        IF sy-subrc = 0.
          ls_contacts-vtext_en = ls_tsabt-vtext.
        ENDIF.

        ls_contacts-pafkt = ls_knvk-pafkt.

        " Lee la descripción de la función (Español)
        CLEAR ls_tpfkt.
        READ TABLE lt_tpfkt INTO ls_tpfkt
          WITH KEY pafkt = ls_knvk-pafkt
                   spras = gc_spanish.
        IF sy-subrc = 0.
          ls_contacts-fundes_es = ls_tpfkt-vtext.
        ENDIF.

        " Lee la descripción de la función (Inglés)
        CLEAR ls_tpfkt.
        READ TABLE lt_tpfkt INTO ls_tpfkt
          WITH KEY pafkt = ls_knvk-pafkt
                   spras = gc_english.
        IF sy-subrc = 0.
          ls_contacts-fundes_en = ls_tpfkt-vtext.
        ENDIF.

        " Lee el nombre del contacto
        CLEAR ls_adrp.
        READ TABLE lt_adrp INTO ls_adrp
          WITH KEY persnumber = ls_knvk-prsnr.
        IF sy-subrc = 0.
          ls_contacts-name_text = ls_adrp-name_text.
        ENDIF.

        "Inserta el contacto
        INSERT ls_contacts INTO TABLE et_contacts.
      ENDLOOP.
    ENDIF.
  ENDIF.

  " Recupera datos de países
  IF lt_order_address[] IS NOT INITIAL.
*    SELECT *
*      INTO TABLE LT_T005T
*      FROM T005T
*      FOR ALL ENTRIES IN LT_ORDER_ADDRESS
*      WHERE SPRAS = LT_ORDER_ADDRESS-LANGU
*      AND   LAND1 = LT_ORDER_ADDRESS-COUNTRY.
    zcl_qry_salesorder_details=>t005t( EXPORTING i_operacion = 'READ'
                                                 it_address = lt_order_address
                                       IMPORTING et_t005t = lt_t005t ).
    " Elimina datos duplicados
    DELETE ADJACENT DUPLICATES FROM lt_t005t COMPARING ALL FIELDS.
  ENDIF.

  " Recupera datos de solicitante
  PERFORM f_get_partner_data USING lt_order_partner
                                    lt_order_address
                                    lt_t005t
                                    iv_sales_order
                                    gc_customer_func
                           CHANGING es_sales_order_details-name_sol
                                    es_sales_order_details-dir_sol
                                    es_sales_order_details-country_sol.

  " Recupera datos de receptor de mercancía
  PERFORM f_get_partner_data USING lt_order_partner
                                    lt_order_address
                                    lt_t005t
                                    iv_sales_order
                                    gc_ship_func
                           CHANGING es_sales_order_details-name_shipto
                                    es_sales_order_details-dir_shipto
                                    es_sales_order_details-country_shipto.

  " Recupera datos de Bill to
  PERFORM f_get_partner_data USING lt_order_partner
                                    lt_order_address
                                    lt_t005t
                                    iv_sales_order
                                    gc_bill_func
                           CHANGING es_sales_order_details-name_billto
                                    es_sales_order_details-dir_billto
                                    es_sales_order_details-country_billto.

  " Recupera datos de Payer
  PERFORM f_get_partner_data USING lt_order_partner
                                    lt_order_address
                                    lt_t005t
                                    iv_sales_order
                                    gc_payer_func
                           CHANGING es_sales_order_details-name_payer
                                    es_sales_order_details-dir_payer
                                    es_sales_order_details-country_payer.


  " Recupera constante para total precio de posiciones y totales
*  SELECT *
*    INTO TABLE LT_TVARVC
*    FROM TVARVC
*    WHERE NAME =  GC_CONDTYPE_TOTPOS
*    OR NAME = GC_CONDTYPE_TOTSUBTOTAL
*    OR NAME = GC_CONDTYPE_TOTDESC
*    OR NAME = GC_CONDTYPE_TOTIVA
*    OR NAME = GC_CONDTYPE_TOTTOTAL .
  zcl_qry_salesorder_details=>tvarvc( EXPORTING i_operacion = 'READ'
                                      IMPORTING et_tvarvc = lt_tvarvc ).

  IF sy-subrc = 0.
    " Prepara rango de condiciones
    LOOP AT lt_tvarvc INTO ls_tvarvc.
      CLEAR ls_condtype.
      ls_condtype-sign = gc_include.
      ls_condtype-option = gc_equal.
      ls_condtype-low = ls_tvarvc-low.
      APPEND ls_condtype TO lr_condtype.
    ENDLOOP.
  ENDIF.

  " Recupera las posiciones entregadas
*  SELECT *
*    INTO TABLE LT_LIPS
*    FROM LIPS
*    WHERE VGBEL = IV_SALES_ORDER.
  zcl_qry_salesorder_details=>lips( EXPORTING i_operacion = 'READ'
                                              i_vbeln = iv_sales_order
                                    IMPORTING et_lips = lt_lips ).

  " Recupera las posiciones facturadas
*  SELECT *
*    INTO TABLE LT_VBFA
*    FROM VBFA
*    WHERE VBTYP_N = GC_TYPE_REL_M
*    AND   VBELV   = IV_SALES_ORDER.
  zcl_qry_salesorder_details=>vbfa( EXPORTING i_operacion = 'READ'
                                              i_vbeln = iv_sales_order
                                    IMPORTING et_vbfa = lt_vbfa ).
  IF lt_vbfa[] IS NOT INITIAL.
*    SELECT *
*      INTO TABLE LT_VBRP
*      FROM VBRP
*      FOR ALL ENTRIES IN LT_VBFA
*        WHERE VBELN = LT_VBFA-VBELN
*        AND   POSNR = LT_VBFA-POSNN.
    zcl_qry_salesorder_details=>vbrp( EXPORTING i_operacion = 'READ'
                                              it_vbfa = lt_vbfa
                                    IMPORTING et_vbrp = lt_vbrp ).
  ENDIF.

  " Genera las posiciones de salida del pedido
  LOOP AT lt_order_items INTO ls_order_items.
    CLEAR ls_positions.
    MOVE-CORRESPONDING ls_order_items TO ls_positions.

    " Recupera el número de piezas enviadas
    LOOP AT lt_lips INTO ls_lips
      WHERE vgbel = ls_order_items-doc_number
      AND   vgpos = ls_order_items-itm_number.
      ls_positions-send_qty = ls_positions-send_qty + ls_lips-lfimg.
    ENDLOOP.

    " Recuper al número de piezas facturadas
    LOOP AT lt_vbfa INTO ls_vbfa
      WHERE vbelv = ls_order_items-doc_number
      AND   posnv = ls_order_items-itm_number.
      LOOP AT lt_vbrp INTO ls_vbrp
        WHERE vbeln = ls_vbfa-vbeln
        AND   posnr = ls_vbfa-posnn.
        ls_positions-inv_qty = ls_positions-inv_qty + ls_vbrp-fkimg.
      ENDLOOP.
    ENDLOOP.

    " Agrega registro de detalle
    INSERT ls_positions INTO TABLE et_positions.
  ENDLOOP.

  " Llena totales por cabecera
  " Llena subtotal
  PERFORM f_fill_total USING lt_order_conditions
                              lt_tvarvc
                              gc_condtype_totsubtotal
                     CHANGING es_totales-subtotal.

  " Llena descuento
  PERFORM f_fill_total USING lt_order_conditions
                              lt_tvarvc
                              gc_condtype_totdesc
                     CHANGING es_totales-descuento.

  " Llena IVA
  PERFORM f_fill_total USING lt_order_conditions
                              lt_tvarvc
                              gc_condtype_totiva
                     CHANGING es_totales-iva.

  " Llena Total
  "PERFORM f_fill_total TABLES lt_order_conditions
  "                            lt_tvarvc
  "                      USING gc_condtype_tottotal
  "                   CHANGING es_totales-total.
  " Aplica fórmula para cálcular valor total
  es_totales-total = ( es_totales-subtotal + es_totales-iva ) - es_totales-descuento.

  " Llena campo de moneda
  LOOP AT lt_order_items INTO ls_order_items
    WHERE currency IS NOT INITIAL.
    es_totales-currency = ls_order_items-currency.
    EXIT.
  ENDLOOP.

  " Llena fechas de entrega planificada y de embarque
  LOOP AT lt_lips INTO ls_lips.
    CLEAR ls_dates.
    ls_dates-vbeln = ls_lips-vbeln.
    ls_dates-posnr = ls_lips-posnr.
    ls_dates-vgbel = ls_lips-vgbel.
    ls_dates-vgpos = ls_lips-vgpos.
    ls_dates-sku = ls_lips-matnr.
    ls_dates-date_plan_del = ls_order_header-req_date_h.
    ls_dates-date_plan_dis = ls_lips-mbdat.
    ls_dates-charg = ls_lips-charg.
    INSERT ls_dates INTO TABLE et_dates.
  ENDLOOP.

  " Llena datos de las facturas asociadas
  IF lt_vbrp[] IS NOT INITIAL.
    SORT lt_vbrp BY vbeln.
    DELETE ADJACENT DUPLICATES FROM lt_vbrp COMPARING vbeln.

*    SELECT *
*      INTO TABLE LT_VBRK
*      FROM VBRK
*      FOR ALL ENTRIES IN LT_VBRP
*      WHERE VBELN = LT_VBRP-VBELN
*      AND   FKSTO = SPACE
*      AND   SFAKN = SPACE.
    zcl_qry_salesorder_details=>vbrk( EXPORTING i_operacion = 'READ'
                                              it_vbrp = lt_vbrp
                                    IMPORTING et_vbrk = lt_vbrk ).
  ENDIF.

  IF lt_vbrk[] IS NOT INITIAL.
    " Recupera los textos para términos de pago y condiciones
*    SELECT *
*      INTO TABLE LT_T052U
*      FROM T052U
*      FOR ALL ENTRIES IN LT_VBRK
*      WHERE ZTERM = LT_VBRK-ZTERM
*      AND   SPRAS = SY-LANGU.
    zcl_qry_salesorder_details=>t052u( EXPORTING i_operacion = 'READ'
                                                 it_vbrk = lt_vbrk
                                       IMPORTING et_t052u = lt_t052u ).

    " Tipo de pago
*    SELECT *
*      INTO TABLE LT_T042Z
*      FROM T042Z
*      FOR ALL ENTRIES IN LT_VBRK
*      WHERE ZLSCH = LT_VBRK-ZLSCH
*      AND   LAND1 = GC_LAND1.
    zcl_qry_salesorder_details=>t042z( EXPORTING i_operacion = 'READ'
                                                 it_vbrk = lt_vbrk
                                       IMPORTING et_t042z = lt_t042z ).

    " Genera tabla auxiliar para consulta contable
    LOOP AT lt_vbrk INTO ls_vbrk.
      CLEAR ls_references.
      ls_references-awkey = ls_vbrk-vbeln.
      INSERT ls_references INTO TABLE lt_references.
    ENDLOOP.

    "Consulta para extraer documentos financieros (cabecera)
*    SELECT BUKRS BELNR GJAHR BLART AWKEY
*      INTO CORRESPONDING FIELDS OF TABLE LT_BKPF
*    FROM BKPF
*      FOR ALL ENTRIES IN LT_REFERENCES
*        WHERE AWKEY = LT_REFERENCES-AWKEY
*      AND  AWTYP = GC_AWTYP.
    zcl_qry_salesorder_list=>bkpf( EXPORTING i_operacion = 'READ'
                                             it_ref = lt_references
                                   IMPORTING et_doc_fin = lt_bkpf ).

    " Recupera los documentos financieros ya pagados (sin compensación)
    lt_bkpf_aux[] = lt_bkpf[].

*    SELECT *
*      FROM BSID
*      INTO TABLE LT_BSID_PAYED
*      FOR ALL ENTRIES IN LT_BKPF_AUX
*      WHERE BUKRS = LT_BKPF_AUX-BUKRS
*      AND   BLART = GC_PAYMENT
*      AND   REBZG = LT_BKPF_AUX-BELNR
*      AND   REBZJ = LT_BKPF_AUX-GJAHR.
    zcl_qry_salesorder_list=>bsid( EXPORTING i_operacion = 'READ'
                                             it_doc_fin = lt_bkpf_aux
                                   IMPORTING et_payed = lt_bsid_payed ).

    " Elimina documentos ya recuperados
    IF lt_bsid_payed[] IS NOT INITIAL.
      LOOP AT lt_bkpf_aux INTO ls_bkpf.
        " Guarda indice actual
        lv_index = sy-tabix.

        READ TABLE lt_bsid_payed TRANSPORTING NO FIELDS
          WITH KEY bukrs = ls_bkpf-bukrs
                   rebzg = ls_bkpf-belnr
                   rebzj = ls_bkpf-gjahr.
        IF sy-subrc = 0.
          " Elimina registro localizado
          DELETE lt_bkpf_aux INDEX lv_index.
        ENDIF.
      ENDLOOP.
    ENDIF.

    " Recupera los documentos financieros ya pagados (compensados)
*    SELECT *
*      FROM BSAD
*      INTO TABLE LT_BSAD_PAYED
*      FOR ALL ENTRIES IN LT_BKPF_AUX
*      WHERE BUKRS = LT_BKPF_AUX-BUKRS
*      AND   BLART = GC_PAYMENT
*      AND   REBZG = LT_BKPF_AUX-BELNR
*      AND   REBZJ = LT_BKPF_AUX-GJAHR.
    zcl_qry_salesorder_list=>bsid( EXPORTING i_operacion = 'READ'
                                             it_doc_fin = lt_bkpf_aux
                                   IMPORTING et_payed = lt_bsad_payed ).

    " Elimina documentos ya recuperados
    IF lt_bsad_payed[] IS NOT INITIAL.
      LOOP AT lt_bkpf_aux INTO ls_bkpf.
        " Guarda indice actual
        lv_index = sy-tabix.

        READ TABLE lt_bsad_payed TRANSPORTING NO FIELDS
          WITH KEY bukrs = ls_bkpf-bukrs
                   rebzg = ls_bkpf-belnr
                   rebzj = ls_bkpf-gjahr.
        IF sy-subrc = 0.
          " Elimina registro localizado
          DELETE lt_bkpf_aux INDEX lv_index.
        ENDIF.
      ENDLOOP.
    ENDIF.
  ENDIF.

  " Procesa facturas localizadas
  LOOP AT lt_vbrk INTO ls_vbrk.
    CLEAR ls_invoices.
    ls_invoices-vbeln = ls_vbrk-vbeln.
    ls_invoices-erdat = ls_vbrk-erdat.
    ls_invoices-zterm = ls_vbrk-zterm.

    " Busca la descripción del termino de pago
    CLEAR ls_t052u.
    READ TABLE lt_t052u INTO ls_t052u
      WITH KEY zterm = ls_vbrk-zterm.
    IF sy-subrc = 0.
      ls_invoices-text = ls_t052u-text1.
    ENDIF.

    ls_invoices-zlsch = ls_vbrk-zlsch.

    " Busca la descripción de la forma o vía de pago
    CLEAR ls_t042z.
    READ TABLE lt_t042z INTO ls_t042z
      WITH KEY zlsch = ls_vbrk-zlsch.
    IF sy-subrc = 0.
      ls_invoices-text1 = ls_t042z-text1.
    ENDIF.

    " Verifica si la factura se encuentra pagada
    CLEAR ls_bkpf.
    READ TABLE lt_bkpf INTO ls_bkpf
      WITH KEY awkey = ls_vbrk-vbeln.
    IF sy-subrc = 0.
      " Verifica si la factura se encuentra pagada
      CLEAR ls_bsid.
      READ TABLE lt_bsid_payed INTO ls_bsid_payed
        WITH KEY bukrs = ls_bkpf-bukrs
                 blart = gc_payment
                 rebzg = ls_bkpf-belnr
                 rebzj = ls_bkpf-gjahr.
      IF sy-subrc = 0.
        ls_invoices-status = TEXT-fs1.
      ELSE.
        " Busca pagos en BSAD
        CLEAR ls_bsad.
        READ TABLE lt_bsad_payed INTO ls_bsad
          WITH KEY bukrs = ls_bkpf-bukrs
                   blart = gc_payment
                   rebzg = ls_bkpf-belnr
                   rebzj = ls_bkpf-gjahr.
        IF sy-subrc = 0.
          ls_invoices-status = TEXT-fs1.
        ELSE.
          ls_invoices-status = TEXT-fs2.
        ENDIF.
      ENDIF.
    ELSE.
      ls_invoices-status = TEXT-fs2.
    ENDIF.

    " Inserta registro a facturas
    INSERT ls_invoices INTO TABLE et_invoices.
  ENDLOOP.

ENDFUNCTION.
