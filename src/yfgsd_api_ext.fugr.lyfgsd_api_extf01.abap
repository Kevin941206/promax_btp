*&---------------------------------------------------------------------*
*&      Form  F_GET_PARTNER_DATA
*&---------------------------------------------------------------------*
*       Recupera datos de interlocutor
*----------------------------------------------------------------------*
*      -->P_LT_ORDER_PARTNER  Tabla de interlocutores
*      -->P_LT_ORDER_ADDRESS  Direcciones de interlocutores
*      -->P_LT_T005T          Detalle de países
*      <--P_ES_SALES_ORDER_DETAILS_NAME_SO  Nombre de interlocutor
*      <--P_ES_SALES_ORDER_DETAILS_DIR_SOL  Dirección de interlocutor
*      <--P_ES_SALES_ORDER_DETAILS_COUNTRY  País de interlocutor
*      -->P_IV_SALES_ORDER  Orden de Venta
*      -->P_GC_CUSTOMER_FUNC  Función interlocutor
*----------------------------------------------------------------------*
FORM f_get_partner_data  USING   p_lt_order_partner TYPE ztt_BAPISDPART
                                  p_lt_order_address TYPE ztt_BAPISDCOAD
                                  p_lt_t005t         TYPE ztt_T005T
                                  p_sales_order TYPE vbeln_va
                                  p_part_role
                         CHANGING c_name        TYPE yesd_name_e
                                  c_address     TYPE ystsd_dir_s
                                  c_country     TYPE zLANDX.
* Declaración de variables locales
  DATA: ls_order_partner TYPE zst_BAPISDPART,
        ls_order_address TYPE zst_BAPISDCOAD,
        ls_t005t         TYPE zst_T005T.

* Lee dato de partner y rol
  CLEAR ls_order_partner.
  READ TABLE p_lt_order_partner INTO ls_order_partner
    WITH KEY sd_doc = p_sales_order
         partn_role = p_part_role.
  IF sy-subrc = 0.
    "Encuentra la dirección asociada al partner
    CLEAR ls_order_address.
    READ TABLE p_lt_order_address INTO ls_order_address
      WITH KEY doc_number = ls_order_partner-sd_doc
               address    = ls_order_partner-address.
    IF sy-subrc = 0.
      " Recupera datos de nombre
      CONCATENATE ls_order_address-name ls_order_address-name_2 ls_order_address-name_3 ls_order_address-name_4
        INTO c_name .

      " Recupera datos de direccion
      MOVE-CORRESPONDING ls_order_address TO c_address.

      " Recupera la descripción del país
      CLEAR ls_t005t.
      READ TABLE p_lt_t005t INTO ls_t005t
        WITH KEY land1 = ls_order_address-country.
      IF sy-subrc = 0.
        c_country = ls_t005t-landx.
      ENDIF.
    ENDIF.
  ENDIF.

ENDFORM.                    " F_GET_PARTNER_DATA

*&---------------------------------------------------------------------*
*&      Form  F_FILL_TOTAL
*&---------------------------------------------------------------------*
*       Llena información de subtotales
*----------------------------------------------------------------------*
*      -->P_LT_ORDER_COND_ITEM  tabla de totales
*      -->P_LT_TVARVC  tipo de variable
*      -->P_GC_CONDTYPE_TOTSUBTOTAL  tipo de condición
*      <--P_ES_TOTALES_SUBTOTAL  importe total
*----------------------------------------------------------------------*
FORM f_fill_total  USING   p_lt_order_cond_item TYPE ztt_BAPISDCOND
                           p_lt_tvarvc TYPE ztt_TVARVc
                           p_gc_condtype TYPE char25
                   CHANGING p_valor TYPE bapicurext.
* Declaración de datos locales
  DATA: ls_order_cond_item TYPE zst_BAPISDCOND,
        ls_tvarvc          TYPE zst_TVARVC,
        lr_condtype        TYPE RANGE OF kscha,
        ls_condtype        LIKE LINE OF lr_condtype.

* Construye rango
  LOOP AT p_lt_tvarvc INTO ls_tvarvc
    WHERE name = p_gc_condtype.
    CLEAR ls_condtype.
    ls_condtype-sign = gc_include.
    ls_condtype-option = gc_equal.
    ls_condtype-low = ls_tvarvc-low.
    APPEND ls_condtype TO lr_condtype.
  ENDLOOP.

  " Realiza sumatoria para obtener valor
  LOOP AT p_lt_order_cond_item INTO ls_order_cond_item
    WHERE cond_type IN lr_condtype.
    p_valor = p_valor + ls_order_cond_item-condvalue.
  ENDLOOP.

ENDFORM.                    " F_FILL_TOTAL
