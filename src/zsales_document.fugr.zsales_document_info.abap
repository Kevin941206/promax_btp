FUNCTION zsales_document_info.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(I_DOCUMENT) TYPE  CHAR10
*"  EXPORTING
*"     VALUE(E_CUSTOMER) TYPE  ZSALES_CUSTOMER
*"     VALUE(E_DOCUMENT) TYPE  ZSALES_DOCUMENT
*"     VALUE(E_DOCTYPE) TYPE  ZVBTYPL
*"     VALUE(E_RETURN) TYPE  BAPIRET1
*"     VALUE(T_DETAIL) TYPE  ZTT_SALES_DATA
*"     VALUE(T_SHIPMENT) TYPE  ZTT_TRANSP_DATA
*"----------------------------------------------------------------------
  DATA: lw_comwa TYPE zvbco6.

  CLEAR: e_return,
         e_customer,
         e_document,
         t_detail[],
         T_shipment[],
         t_vbap[],
         t_lips[],
         t_vbrp[].

*  CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
*    EXPORTING
*      input  = i_document
*    IMPORTING
*      output = lw_comwa-vbeln.

  lw_comwa-vbeln = |{ i_document ALPHA = IN }|.

*  CALL FUNCTION 'RV_ORDER_FLOW_INFORMATION'
*    EXPORTING
*      comwa         = lw_comwa
*    IMPORTING
*      belegtyp_back = e_doctype
*    TABLES
*      vbfa_tab      = t_docflow
*    EXCEPTIONS
*      no_vbfa       = 1
*      no_vbuk_found = 2
*      OTHERS        = 3.
  zcl_order_flow=>order_flow( EXPORTING i_vbeln = lw_comwa-vbeln
                              IMPORTING e_doctype = e_doctype
                                        et_docflow = t_docflow ).
  IF sy-subrc EQ 0.

    PERFORM f_fill_shipment CHANGING t_shipment.            "LDGL 25.08.2020 Se agrega info transportista

*    MOVE: 'S'                                       TO e_return-type,
*          'Se ha recuperado el documento con éxito' TO e_return-message.

    e_return-type = 'S'.
    e_return-message = 'Se ha recuperado el documento con éxito'.

    CASE e_doctype.
      WHEN 'C'.
        PERFORM f_fill_vbak
          USING lw_comwa-vbeln
          CHANGING e_document.

        PERFORM f_fill_customer
          USING e_customer-cust_no
          CHANGING e_customer.

        PERFORM f_get_order
          USING lw_comwa-vbeln.

        PERFORM f_fill_out_order CHANGING t_detail.

      WHEN 'J'. "Entrega
        PERFORM f_fill_likp
          USING lw_comwa-vbeln
          CHANGING e_document.

        PERFORM f_fill_customer
          USING e_customer-cust_no
          CHANGING e_customer.

        PERFORM f_get_delivery
          USING lw_comwa-vbeln.

        PERFORM f_fill_out_delivery CHANGING t_detail.

      WHEN 'M'. "Factura
        PERFORM f_fill_vbrk
          USING lw_comwa-vbeln
          CHANGING e_document.

        PERFORM f_fill_customer
          USING e_customer-cust_no
          CHANGING e_customer.

        PERFORM f_get_bill
          USING lw_comwa-vbeln.

        PERFORM f_fill_out_bill CHANGING t_detail.
      WHEN OTHERS.
*        MOVE: 'E' TO e_return-type,
*              'El documento no es del tipo C-Pedido  J-Entrega  M-Factura' TO e_return-message.
        e_return-type = 'E'.
        e_return-message = 'El documento no es del tipo C-Pedido  J-Entrega  M-Factura'.
    ENDCASE.

  ELSE.
*    MOVE: 'E' TO e_return-type,
*          'No se encontraron valores con el documento proporcionado' TO e_return-message.
    e_return-type = 'E'.
    e_return-message = 'No se encontraron valores con el documento proporcionado'.
  ENDIF.

ENDFUNCTION.
