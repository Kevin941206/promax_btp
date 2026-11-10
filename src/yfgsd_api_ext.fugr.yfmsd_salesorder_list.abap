FUNCTION yfmsd_salesorder_list.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(IV_SALES_ORDER) TYPE  VBELN_VA OPTIONAL
*"     VALUE(IV_INVOICE) TYPE  ZVBELN_VF OPTIONAL
*"     VALUE(IV_NAME1) TYPE  NAME1_GP OPTIONAL
*"     VALUE(IV_NAME2) TYPE  NAME2_GP OPTIONAL
*"     VALUE(IV_BEGIN_DATE) TYPE  ERDAT
*"     VALUE(IV_END_DATE) TYPE  ERDAT
*"     VALUE(IT_BUKRS) TYPE  ZTT_EBPP_BUKRS OPTIONAL
*"     VALUE(IT_SOLD_TO) TYPE  ZTT_WKUNNR OPTIONAL
*"     VALUE(IT_SHIP_TO) TYPE  ZTT_WKUNNR OPTIONAL
*"  EXPORTING
*"     VALUE(ET_SALES_ORDERS) TYPE  YTTSD_SALESORDER_LIST_E
*"     VALUE(ET_INVOICES) TYPE  YTTSD_INVOICES_LIST_T
*"----------------------------------------------------------------------
* Declaración de variables locales
  DATA: lr_bukrs            TYPE RANGE OF bukrs,
        ls_bukrs            LIKE LINE OF lr_bukrs,
        lv_bukrs            TYPE zebpp_bukrs, "bukrs,
        lr_werks            TYPE RANGE OF zwerks_ext,
        ls_werks            LIKE LINE OF lr_werks,
        ls_centros          TYPE _tt_centros,
        lv_sold_to          TYPE zwkunnr, "kunnr,
        lv_ship_to          TYPE zwkunnr, "kunnr,
        lr_kunnr1           TYPE RANGE OF kunnr,
        ls_kunnr1           LIKE LINE OF lr_kunnr1,
        lr_name1            TYPE RANGE OF name1_gp,
        ls_name1            LIKE LINE OF lr_name1,
        lr_name2            TYPE RANGE OF name2_gp,
        ls_name2            LIKE LINE OF lr_name2,
        lr_kunnr2           TYPE RANGE OF kunnr,
        ls_kunnr2           LIKE LINE OF lr_kunnr2,
        lr_pedido           TYPE RANGE OF vbeln_va,
        ls_pedido           LIKE LINE OF lr_pedido,
        lt_aubel            TYPE TABLE OF _tt_aubel,
        ls_aubel            TYPE _tt_aubel,
        lr_invoice          TYPE RANGE OF vbeln,
        ls_invoice          LIKE LINE OF lr_invoice,
        lt_vbuk             TYPE TABLE OF zst_vbuk,
        ls_vbuk             TYPE zst_vbuk,
        lt_sales_order_piv  TYPE TABLE OF zst_sales_ord_data, "_tt_sales_ord_data,
        ls_sales_order_piv  TYPE zst_sales_ord_data, "_tt_sales_ord_data,
        lt_inv_per_salesord TYPE TABLE OF zst_fact_rel, "_tt_inv_per_order,
        ls_inv_per_salesord TYPE zst_fact_rel, "_tt_inv_per_order,
        lt_vbfa             TYPE TABLE OF _tt_vbfa,
        lt_invoices_piv     TYPE TABLE OF zst_sales_ord_data, "_tt_sales_ord_data,
        lt_sales_ord_cus    TYPE TABLE OF zst_sales_ord_data, "_tt_sales_ord_data,
        ls_invoices_piv     TYPE zst_sales_ord_data, "_tt_sales_ord_data,
        ls_salesord_init    TYPE _tt_sales_ord_data,
        lt_vbrk             TYPE TABLE OF zst_vbrk,
        ls_vbrk             TYPE zst_vbrk,
        lt_bkpf             TYPE TABLE OF zst_doc_fin, "_tt_bkpf,
        ls_bkpf             TYPE zst_doc_fin, "_tt_bkpf,
        lt_bkpf_aux         TYPE TABLE OF zst_doc_fin, "_tt_bkpf,
        lt_bsid_payed       TYPE TABLE OF zst_bsid_payed, "ty_bsid,
        ls_bsid_payed       TYPE zst_bsid_payed, "ty_bsid,
        lt_bsad_payed       TYPE TABLE OF zst_bsid_payed, "ty_bsid,
        lt_bsid             TYPE TABLE OF zst_bsid, "_tt_bsid,
        ls_bsid             TYPE zst_bsid, "_tt_bsid,
        ls_bsad             TYPE zst_bsid_payed, "ty_bsid,
        ls_bsid_chg         TYPE zst_bsid, "_tt_bsid,
        ls_faede            TYPE zst_faede,
        lt_references       TYPE TABLE OF zst_references, "_tt_references,
        ls_references       TYPE zst_references, "_tt_references,
        ls_output_data      TYPE ystsd_salesorder_list_e,
        lt_kna1             TYPE TABLE OF zst_clientes, "_tt_kna1,
        ls_kna1             TYPE zst_clientes, "_tt_kna1,
        ls_inv_data         TYPE ystsd_invoices_list_s,
        lt_inv_data         TYPE ytsd_invoices_list_t,
        lt_files_info       TYPE TABLE OF ytsd_oficina_fd,
        ls_files_info       TYPE ytsd_oficina_fd,
        lr_date             TYPE RANGE OF erdat,
        ls_date             LIKE LINE OF lr_date,
        lv_where            TYPE string,
        lv_index            TYPE sy-tabix,
        lv_paydate          TYPE sy-datum,
        lv_duedate          TYPE sy-datum,
        lv_overdue_days     TYPE p LENGTH 5,
        lv_skip_record      TYPE boolean,
        lt_vbeln            TYPE TABLE OF zst_vbeln,
        ls_vbeln            TYPE zst_vbeln.

  " Limpia datos de memoria
  CLEAR: gt_salesord_init,
           gt_centros.

  " Prepara rango para sociedad
  LOOP AT it_bukrs INTO lv_bukrs.
    CLEAR ls_bukrs.
    ls_bukrs-sign = gc_include.
    ls_bukrs-option = gc_equal.
    ls_bukrs-low = lv_bukrs-bukrs.
    APPEND ls_bukrs TO lr_bukrs.
  ENDLOOP.

  " Se comenta esta parte, porque para sociedades, no es necesario
  " hacer el filtro por medio de centros
  " Recupera los centros relacionados a la sociedad
  "IF lr_bukrs[] IS NOT INITIAL.
  "  SELECT t001k~bukrs t001w~werks
  "    INTO CORRESPONDING FIELDS OF TABLE gt_centros
  "FROM ( t001k
  "       INNER JOIN t001w
  "       ON  t001w~bwkey = t001k~bwkey )
  "    WHERE t001k~bukrs IN lr_bukrs.
  "ENDIF.

  " Elimina datos duplicados de centros
  "DELETE ADJACENT DUPLICATES FROM gt_centros COMPARING ALL FIELDS.

  " Prepara rango de centros
  "LOOP AT gt_centros INTO ls_centros.
  "  CLEAR ls_werks.
  "  ls_werks-sign = gc_include.
  "  ls_werks-option = gc_equal.
  "  ls_werks-low = ls_centros-werks.
  "  APPEND ls_werks TO lr_werks.
  "ENDLOOP.

  " Prepara rango de clientes
  LOOP AT it_sold_to INTO lv_sold_to.
    CLEAR ls_kunnr1.
    ls_kunnr1-sign = gc_include.
    ls_kunnr1-option = gc_equal.
    ls_kunnr1-low = lv_sold_to-kunnr.
    APPEND ls_kunnr1 TO lr_kunnr1.
  ENDLOOP.

  " Recupera cliente adicional, si existe
  IF iv_name1 IS NOT INITIAL.
    CLEAR ls_name1.
    ls_name1-sign = gc_include.
    ls_name1-option = gc_cp.
    ls_name1-low = iv_name1.
    APPEND ls_name1 TO lr_name1.
  ENDIF.

  IF iv_name2 IS NOT INITIAL.
    CLEAR ls_name2.
    ls_name2-sign = gc_include.
    ls_name2-option = gc_cp.
    ls_name2-low = iv_name2.
    APPEND ls_name2 TO lr_name2.
  ENDIF.

  "Recupera cliente adicional
  CLEAR lv_sold_to.
  zcl_qry_salesorder_list=>kna1( EXPORTING i_operacion = 'READ'
                                           i_name1 = iv_name1
                                           i_name2 = iv_name2
                                 IMPORTING e_kunnr = DATA(lv_kunnr) ).

*  IF lr_name1 IS NOT INITIAL AND lr_name2 IS NOT INITIAL.
*    SELECT SINGLE kunnr INTO lv_sold_to
*      FROM kna1
*      WHERE name1 IN lr_name1
*      AND   name2 IN lr_name2.
*  ELSEIF lr_name1 IS NOT INITIAL AND lr_name2 IS INITIAL.
*    SELECT SINGLE kunnr INTO lv_sold_to
*      FROM kna1
*      WHERE name1 IN lr_name1.
*  ELSEIF lr_name1 IS INITIAL AND lr_name2 IS NOT INITIAL.
*    SELECT SINGLE kunnr INTO lv_sold_to
*      FROM kna1
*      WHERE name2 IN lr_name2.
*  ENDIF.
  IF lv_kunnr IS NOT INITIAL.
    CLEAR ls_kunnr1.
    ls_kunnr1-sign = gc_include.
    ls_kunnr1-option = gc_equal.
    ls_kunnr1-low = lv_kunnr. "LV_SOLD_TO.
    APPEND ls_kunnr1 TO lr_kunnr1.
  ENDIF.

  " Genera rango para ship to
  LOOP AT it_ship_to INTO lv_ship_to.
    CLEAR ls_kunnr2.
    ls_kunnr2-sign = gc_include.
    ls_kunnr2-option = gc_equal.
    ls_kunnr2-low = lv_ship_to-kunnr.
    APPEND ls_kunnr2 TO lr_kunnr2.
  ENDLOOP.

  "genera rango para número de pedido
  IF iv_sales_order IS NOT INITIAL.
    CLEAR ls_pedido.
    ls_pedido-sign = gc_include.
    ls_pedido-option = gc_cp.
    ls_pedido-low = iv_sales_order.
    APPEND ls_pedido TO lr_pedido.
    ls_vbeln-vbeln = iv_sales_order.
    APPEND ls_vbeln TO lt_vbeln.
  ENDIF.

  "genera rango para número de factura
  IF iv_invoice IS NOT INITIAL.
    " recupera los pedidos asociados a la factura
    ls_invoice-sign = gc_include.
    ls_invoice-option = gc_cp.
    ls_invoice-low = iv_invoice.
    APPEND ls_invoice TO lr_invoice.

    zcl_qry_salesorder_list=>vbrp( EXPORTING i_operacion = 'READ'
                                             i_vbeln = iv_invoice
                                   IMPORTING et_aubel = lt_aubel ).
*    SELECT aubel
*      INTO CORRESPONDING FIELDS OF TABLE lt_aubel
*      FROM vbrp
*      WHERE vbeln IN lr_invoice.

    IF lt_aubel IS NOT INITIAL.
      " elimina registros duplicados
      DELETE ADJACENT DUPLICATES FROM lt_aubel COMPARING ALL FIELDS.

      " construye rango
      LOOP AT lt_aubel INTO ls_aubel.
        CLEAR ls_pedido.
        ls_pedido-sign = gc_include.
        ls_pedido-option = gc_equal.
        ls_pedido-low = ls_aubel-aubel.
        APPEND ls_pedido TO lr_pedido.
        ls_vbeln-vbeln = ls_aubel-aubel.
        APPEND ls_vbeln TO lt_vbeln.
      ENDLOOP.
    ENDIF.
  ENDIF.

  "genera rango de fecha
  ls_date-sign = gc_include.
  ls_date-option = gc_between.
  ls_date-low = iv_begin_date.
  ls_date-high = iv_end_date.
  APPEND ls_date TO lr_date.

  " Where dinámico
  lv_where = 'vbak~erdat IN lr_date '.
  " Se modifica filtro de centro, por sociedad
  " Verifica si tiene valor de centro
  "IF lr_werks IS NOT INITIAL.
  "  CONCATENATE lv_where ' AND vbap~werks IN lr_werks ' INTO lv_where SEPARATED BY space.
  "ENDIF.

*  " Nuevo filtro por sociedad
*  IF lr_bukrs IS NOT INITIAL.
*    CONCATENATE lv_where ' AND vbak~bukrs_vf IN lr_bukrs ' INTO lv_where SEPARATED BY space.
*  ENDIF.
*
*  " Si cliente 1 no está vacío
*  IF lr_kunnr1 IS NOT INITIAL.
*    CONCATENATE lv_where ' AND ( vbpa~kunnr IN lr_kunnr1 AND vbpa~parvw = gc_customer_func ) ' INTO lv_where SEPARATED BY space.
*  ENDIF.
*
*  " Si cliente 2 no está vacío
*  IF lr_kunnr2 IS NOT INITIAL.
*    CONCATENATE lv_where ' AND ( vbpa~kunnr IN lr_kunnr2 AND vbpa~parvw = gc_ship_func ) ' INTO lv_where SEPARATED BY space.
*  ENDIF.
*
*  " Verifica si tiene pedido y factura, u otra combinación
*  IF lr_pedido IS NOT INITIAL .
*    CONCATENATE lv_where ' AND vbak~vbeln IN lr_pedido ' INTO lv_where SEPARATED BY space.
*  ENDIF.
*
*  " Recupera información de pedidos y facturas
*  SELECT vbak~vbeln vbak~erdat vbak~kunnr vbap~werks
*    "vbrp~vbeln AS invoice
*    INTO CORRESPONDING FIELDS OF TABLE gt_salesord_init
*    FROM ( vbak
*           INNER JOIN vbpa
*           ON  vbpa~vbeln = vbak~vbeln
*           INNER JOIN vbap
*           ON  vbap~vbeln = vbak~vbeln )
*           "INNER JOIN vbrp
*           "ON  vbrp~aubel = vbak~vbeln )
*    WHERE (lv_where).

  zcl_qry_salesorder_list=>vbak( EXPORTING i_operacion = 'READ'
                                           i_kunnr = lv_kunnr
                                           i_begin_date = iv_begin_date
                                           i_end_date = iv_end_date
                                           it_pedido = lt_vbeln
                                           it_bukrs = it_bukrs
                                           it_sold_to = it_sold_to
                                           it_ship_to = it_ship_to
                                 IMPORTING et_sales_ord_data = gt_salesord_init ).

  " Elimina registros duplicados
  DELETE ADJACENT DUPLICATES FROM gt_salesord_init COMPARING ALL FIELDS.

  " Copia tabla de ordenes de venta en tabla pivote
  lt_sales_order_piv[] = gt_salesord_init[].

  " Elimina ordenes de venta duplicadas
  SORT lt_sales_order_piv BY vbeln.
  DELETE ADJACENT DUPLICATES FROM lt_sales_order_piv COMPARING vbeln.

  IF lt_sales_order_piv[] IS NOT INITIAL.
    " Recupera la información del estatus asociado a los pedidos de venta
*    SELECT *
*      INTO TABLE LT_VBUK
*      FROM VBUK
*      FOR ALL ENTRIES IN LT_SALES_ORDER_PIV
*      WHERE VBELN = LT_SALES_ORDER_PIV-VBELN.

    zcl_qry_salesorder_list=>vbuk( EXPORTING i_operacion = 'READ'
                                             it_priv = lt_sales_order_piv
                                   IMPORTING et_vbuk = lt_vbuk ).

    " Recupera las facturas asociadas al pedido de venta
*    SELECT VBELN POSNN
*      FROM VBFA
*      INTO CORRESPONDING FIELDS OF TABLE LT_VBFA
*      FOR ALL ENTRIES IN LT_SALES_ORDER_PIV
*      WHERE VBTYP_N = GC_TYPE_REL_M
*      AND   VBELV  = LT_SALES_ORDER_PIV-VBELN.

    " Elimina registros duplicados
*    DELETE ADJACENT DUPLICATES FROM LT_VBFA COMPARING ALL FIELDS.

    " Recupera facturas asociadas
*    IF LT_VBFA[] IS NOT INITIAL.
*      SELECT VBELN AUBEL
*        INTO CORRESPONDING FIELDS OF TABLE LT_INV_PER_SALESORD
*        FROM VBRP
*        FOR ALL ENTRIES IN LT_VBFA
*        WHERE VBELN = LT_VBFA-VBELN
*        AND   POSNR = LT_VBFA-POSNN.
*    ENDIF.

    zcl_qry_salesorder_list=>vbfa( EXPORTING i_operacion = 'READ'
                                             it_priv = lt_sales_order_piv
                                   IMPORTING et_inv_per = lt_inv_per_salesord ).

    " Elimina duplicados
    DELETE ADJACENT DUPLICATES FROM lt_inv_per_salesord COMPARING ALL FIELDS.

    IF lt_inv_per_salesord[] IS NOT INITIAL.
      "Agrega facturas asociadas a los pedidos
      CLEAR gt_salesord_init.
      LOOP AT lt_sales_order_piv INTO ls_sales_order_piv.
        LOOP AT lt_inv_per_salesord INTO ls_inv_per_salesord
          WHERE aubel = ls_sales_order_piv-vbeln.
          " completa campo de factura
          ls_sales_order_piv-invoice = ls_inv_per_salesord-vbeln.

          " agrega registro
          INSERT ls_sales_order_piv INTO TABLE gt_salesord_init.
        ENDLOOP.
      ENDLOOP.
    ENDIF.

    " Copia tabla de ordenes de transporte en tabla pivote para facturas
    lt_invoices_piv[] = gt_salesord_init[].

    " Elimina facturas duplicadas
    SORT lt_invoices_piv BY invoice.
    DELETE ADJACENT DUPLICATES FROM lt_invoices_piv COMPARING invoice.

    " Recupera información de facturas
    IF lt_invoices_piv[] IS NOT INITIAL.
*      SELECT VBELN FKSTO RFBSK FKDAT FKART VKORG NETWR WAERK
*        INTO CORRESPONDING FIELDS OF TABLE LT_VBRK
*        FROM VBRK
*        FOR ALL ENTRIES IN LT_INVOICES_PIV
*        WHERE VBELN = LT_INVOICES_PIV-INVOICE
*        AND    FKSTO = SPACE
*        AND   SFAKN = SPACE .

      zcl_qry_salesorder_list=>vbrk( EXPORTING i_operacion = 'READ'
                                               it_priv = lt_invoices_piv
                                     IMPORTING et_vbrk = lt_vbrk ).

      " Recupera tabla Z para ruta de archivos de factura
      IF lt_vbrk[] IS NOT INITIAL.
*        SELECT *
*          INTO TABLE LT_FILES_INFO
*          FROM YTSD_OFICINA_FD
*          FOR ALL ENTRIES IN LT_VBRK
*          WHERE ORGVTA = LT_VBRK-VKORG
*          AND   CLASE_DOCUEMNTO = LT_VBRK-FKART.
        zcl_qry_salesorder_list=>ytsd_oficina_fd( EXPORTING i_operacion = 'READ'
                                                            it_vbrk = lt_vbrk
                                                  IMPORTING et_files_info = lt_files_info ).
      ENDIF.

      "Recupera la información asociada con el cliente
      lt_sales_ord_cus[] = gt_salesord_init[].

      "Elimina clientes duplicados
      SORT lt_sales_ord_cus BY kunnr.
      DELETE ADJACENT DUPLICATES FROM lt_sales_ord_cus COMPARING kunnr.

      " Recupera datos de clientes
      IF lt_sales_ord_cus[] IS NOT INITIAL.
*        SELECT KUNNR NAME1 NAME2
*          INTO CORRESPONDING FIELDS OF TABLE LT_KNA1
*          FROM KNA1
*          FOR ALL ENTRIES IN LT_SALES_ORD_CUS
*          WHERE KUNNR = LT_SALES_ORD_CUS-KUNNR.

        zcl_qry_salesorder_list=>kna1_2( EXPORTING i_operacion = 'READ'
                                                   it_ord_cus = lt_sales_ord_cus
                                         IMPORTING et_clientes = lt_kna1 ).
      ENDIF.

      " Recupera documentos financieros, asociados a la factura
      IF lt_vbrk[] IS NOT INITIAL.

        " Genera tabla auxiliar para consulta
        LOOP AT lt_vbrk INTO ls_vbrk.
          CLEAR ls_references.
          ls_references-awkey = ls_vbrk-vbeln.
          INSERT ls_references INTO TABLE lt_references.
        ENDLOOP.

        "Consulta para extraer documentos financieros (cabecera)
*        SELECT BUKRS BELNR GJAHR BLART AWKEY
*          INTO CORRESPONDING FIELDS OF TABLE LT_BKPF
*        FROM BKPF
*          FOR ALL ENTRIES IN LT_REFERENCES
*            WHERE AWKEY = LT_REFERENCES-AWKEY
*          AND  AWTYP = GC_AWTYP.

        zcl_qry_salesorder_list=>bkpf( EXPORTING i_operacion = 'READ'
                                                 it_ref = lt_references
                                       IMPORTING et_doc_fin = lt_bkpf ).

        " Recupera los documentos financieros ya pagados (sin compensación)
        lt_bkpf_aux[] = lt_bkpf[].

*        SELECT *
*          FROM bsid
*          INTO TABLE lt_bsid_payed
*          FOR ALL ENTRIES IN lt_bkpf_aux
*          WHERE bukrs = lt_bkpf_aux-bukrs
*          AND   blart = gc_payment
*          AND   rebzg = lt_bkpf_aux-belnr
*          AND   rebzj = lt_bkpf_aux-gjahr.

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
*        SELECT *
*          FROM bsad
*          INTO TABLE lt_bsad_payed
*          FOR ALL ENTRIES IN lt_bkpf_aux
*          WHERE bukrs = lt_bkpf_aux-bukrs
*          AND   blart = gc_payment
*          AND   rebzg = lt_bkpf_aux-belnr
*          AND   rebzj = lt_bkpf_aux-gjahr.

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

        " Recupera los documentos no pagados
*        SELECT *
*          FROM bsid
*          INTO CORRESPONDING FIELDS OF TABLE lt_bsid
*          FOR ALL ENTRIES IN lt_bkpf_aux
*          WHERE bukrs = lt_bkpf_aux-bukrs
*          AND   blart = gc_invoice
*          AND   belnr = lt_bkpf_aux-belnr
*          AND   gjahr = lt_bkpf_aux-gjahr.

        zcl_qry_salesorder_list=>bsid_2( EXPORTING i_operacion = 'READ'
                                                   it_doc_fin = lt_bkpf_aux
                                         IMPORTING et_bsid = lt_bsid ).

*        " Agrega información adicional de documento no pagado:
*        " Fecha de pago, días de atraso de pago, documento contable, días de crédito
*        IF LT_BSID[] IS NOT INITIAL.
*          LOOP AT LT_BSID INTO LS_BSID.
*            " Recupera índice actual
*            LV_INDEX = SY-TABIX.
*            CLEAR LS_FAEDE.
*            MOVE-CORRESPONDING: LS_BSID TO LS_FAEDE,
*                                LS_BSID TO LS_BSID_CHG.
*
*            LS_FAEDE-KOART = GC_DEBITOR.
*
*            " Recupera la fecha limite de pago
*            CALL FUNCTION 'DETERMINE_DUE_DATE'
*              EXPORTING
*                I_FAEDE = LS_FAEDE
*              IMPORTING
*                E_FAEDE = LS_FAEDE
*              EXCEPTIONS
*                OTHERS  = 1.
*            IF SY-SUBRC = 0.
*              " Ajusta variables para cálcular días de demora de pago
*              LV_PAYDATE = LS_FAEDE-SK1DT.
*              LV_DUEDATE = LS_FAEDE-NETDT.
*
*              CLEAR LV_OVERDUE_DAYS.
*
*              " Recupera los días de atraso de pago
*              CALL FUNCTION 'ITEM_OVERDUE_DAYS'
*                EXPORTING
*                  KEY_DATE     = SY-DATUM
*                  PAY_DATE     = LV_PAYDATE
*                  DUE_DATE     = LV_DUEDATE
*                IMPORTING
*                  OVERDUE_DAYS = LV_OVERDUE_DAYS.
*
*              " Realiza modificaciones
*              LS_BSID_CHG-DABRZ = LV_DUEDATE.
*              LS_BSID_CHG-VERZN = LV_OVERDUE_DAYS.
*
*              " Realiza modificación
*              MODIFY LT_BSID FROM LS_BSID_CHG INDEX LV_INDEX.
*            ENDIF.
*          ENDLOOP.
*        ENDIF.
*
      ENDIF.
    ENDIF.

    " Realiza proceso para generar tabla final de salida
    LOOP AT lt_sales_order_piv INTO ls_sales_order_piv.
      " Limpia registro de salida
      CLEAR ls_output_data.
      lv_skip_record = abap_false.

      ls_output_data-vbeln = ls_sales_order_piv-vbeln. "No. de pedido de venta
      ls_output_data-kunnr = ls_sales_order_piv-kunnr. "No. de cliente
      ls_output_data-erdat = ls_sales_order_piv-erdat. "Fecha de creación del pedido de venta

      " Recupera datos del cliente
      CLEAR ls_kna1.
      READ TABLE lt_kna1 INTO ls_kna1
        WITH KEY kunnr = ls_sales_order_piv-kunnr.
      IF sy-subrc = 0.
        ls_output_data-name1 = ls_kna1-name1.               "Nombre 1
        ls_output_data-name2 = ls_kna1-name2.               "Nombre 2
      ENDIF.

      " Recupera el estatus general del pedido
      CLEAR ls_vbuk.
      READ TABLE lt_vbuk INTO ls_vbuk
        WITH KEY vbeln = ls_sales_order_piv-vbeln.
      IF sy-subrc = 0.
        IF ls_vbuk-abstk = gc_tratado_tot.
          ls_output_data-status = 'Cancelado'.
        ELSE.
          IF ls_vbuk-gbstk = gc_tratado_tot.
            ls_output_data-status = 'Concluido'.
          ELSE.
            ls_output_data-status = 'En curso'.
          ENDIF.
        ENDIF.
      ELSE.
        ls_output_data-status = 'En curso'.
      ENDIF.

      " Recupera facturas asociadas al pedido de venta
      CLEAR lt_inv_data.
      LOOP AT gt_salesord_init INTO ls_salesord_init
          WHERE vbeln = ls_sales_order_piv-vbeln
           AND invoice IS NOT INITIAL.

        CLEAR ls_inv_data.
        ls_inv_data-vbeln = ls_sales_order_piv-vbeln. "No. de pedido
        ls_inv_data-invoice = ls_salesord_init-invoice. "No. de factura

        " Recupera fecha de la factura
        CLEAR ls_vbrk.
        READ TABLE lt_vbrk INTO ls_vbrk
          WITH KEY vbeln = ls_salesord_init-invoice.
        IF sy-subrc = 0.
          ls_inv_data-fkdat = ls_vbrk-fkdat. "Fecha de facturación
          ls_inv_data-waerk = ls_vbrk-waerk. "Moneda del documento comercial
          ls_inv_data-netwr = ls_vbrk-netwr. "Importe del documento comercial

          " Lee los datos asociados a las rutas de los archivos
          CLEAR ls_files_info.
          READ TABLE lt_files_info INTO ls_files_info
            WITH KEY orgvta = ls_vbrk-vkorg
                     clase_docuemnto = ls_vbrk-fkart.
          IF sy-subrc = 0.
            " llena información asociada a los archivos de facturación
            ls_inv_data-orgvta = ls_files_info-orgvta.
            ls_inv_data-clase_documento = ls_files_info-clase_docuemnto.
            ls_inv_data-pathxml = ls_files_info-pathxml.
            ls_inv_data-pathpdf = ls_files_info-pathpdf.
          ENDIF.
        ELSE.
          lv_skip_record = abap_true.
        ENDIF.

        " Verifica si la factura se encuentra pagada
        CLEAR ls_bkpf.
        READ TABLE lt_bkpf INTO ls_bkpf
          WITH KEY awkey = ls_salesord_init-invoice.
        IF sy-subrc = 0.
          " Verifica si la factura se encuentra pagada
          CLEAR ls_bsid.
          READ TABLE lt_bsid_payed INTO ls_bsid_payed
            WITH KEY bukrs = ls_bkpf-bukrs
                     blart = gc_payment
                     rebzg = ls_bkpf-belnr
                     rebzj = ls_bkpf-gjahr.
          IF sy-subrc = 0.
            ls_inv_data-status = TEXT-fs1.

            "coloca documento de pago y documento contable
            ls_inv_data-belnr = ls_bkpf-belnr.
            ls_inv_data-belnr_payment = ls_bsid-belnr.
          ELSE.
            " Busca pagos en BSAD
            CLEAR ls_bsad.
            READ TABLE lt_bsad_payed INTO ls_bsad
              WITH KEY bukrs = ls_bkpf-bukrs
                       blart = gc_payment
                       rebzg = ls_bkpf-belnr
                       rebzj = ls_bkpf-gjahr.
            IF sy-subrc = 0.
              ls_inv_data-status = TEXT-fs1.

              "coloca documento de pago y documento contable
              ls_inv_data-belnr = ls_bkpf-belnr.
              ls_inv_data-belnr_payment = ls_bsad-belnr.
            ELSE.
              " Busca el documento, sin pago
              CLEAR ls_bsid.
              READ TABLE lt_bsid INTO ls_bsid
                WITH KEY bukrs = ls_bkpf-bukrs
                         blart = gc_invoice
                         belnr = ls_bkpf-belnr
                         gjahr = ls_bkpf-gjahr.
              IF sy-subrc = 0.
                ls_inv_data-status = TEXT-fs2.

                " Colocar fecha límite de pago, documento contable y días de atraso en pago
                ls_inv_data-belnr = ls_bkpf-belnr.
                ls_inv_data-belnr_payment = space.
                ls_inv_data-netdt = ls_bsid-dabrz.
                ls_inv_data-verzn = ls_bsid-verzn.
                ls_inv_data-zfbdt = ls_bsid-zfbdt.
                ls_inv_data-zbd1t = ls_bsid-zbd1t.
              ELSE.
                ls_inv_data-status = TEXT-fs2.
                " Limpiar otros campos
                CLEAR: ls_inv_data-belnr,
                       ls_inv_data-belnr_payment,
                       ls_inv_data-netdt,
                       ls_inv_data-verzn,
                       ls_inv_data-zfbdt,
                       ls_inv_data-zbd1t.
              ENDIF.
            ENDIF.
          ENDIF.
        ELSE.
          ls_inv_data-status = TEXT-fs2.

          " Limpiar otros campos
          CLEAR: ls_inv_data-belnr,
                 ls_inv_data-belnr_payment,
                 ls_inv_data-netdt,
                 ls_inv_data-verzn,
                 ls_inv_data-zfbdt,
                 ls_inv_data-zbd1t.
        ENDIF.

        "Inserta registro de factura asociada
        IF lv_skip_record = abap_false.
          INSERT ls_inv_data INTO TABLE lt_inv_data.
        ENDIF.
      ENDLOOP.

      " Coloca las facturas asociadas al pedido de venta
      APPEND LINES OF lt_inv_data TO et_invoices.
      "et_invoices[] = lt_inv_data[].

      " Agrega registro de salida
      INSERT ls_output_data INTO TABLE et_sales_orders.
    ENDLOOP.
  ENDIF.

ENDFUNCTION.
