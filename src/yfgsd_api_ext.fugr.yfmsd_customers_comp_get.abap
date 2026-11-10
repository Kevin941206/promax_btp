FUNCTION yfmsd_customers_comp_get.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_COMPANYCODE) TYPE  BUKRS
*"  EXPORTING
*"     VALUE(ET_CUSTOMERS_LIST) TYPE  YTTSD_CUSTOMER_LIST_E
*"----------------------------------------------------------------------
** Declaracion de variables locales
  DATA:
*        LT_KNB1            TYPE TABLE OF KNB1,
*        LS_KNB1            TYPE KNB1,
*        LT_KNVP            TYPE TABLE OF KNVP,
*        LT_KNVP_C          TYPE TABLE OF KNVP,
*        LS_KNVP            TYPE KNVP,
*        LT_TPART           TYPE TABLE OF TPART,
*        LS_TPART           TYPE TPART,
*        LT_KNA1            TYPE TABLE OF KNA1,
*        LS_KNA1            TYPE KNA1,
    lv_customerno      TYPE kunnr,
    lv_linea           TYPE i,
    lv_companycode     TYPE bukrs,
    ls_customeraddress TYPE zbapicustomer_04,
    lt_data            TYPE yttsd_customer_list_e,
    ls_data            TYPE ystsd_customer_list_e,
    ls_customers_list  LIKE LINE OF et_customers_list.
*
** Limpia tabla de salida
*  REFRESH ET_CUSTOMERS_LIST.

  zcl_qry_operations_to_s4hana=>customers_comp_get( EXPORTING i_operacion = 'READ' i_bukrs = iv_companycode IMPORTING et_customers_list = lt_data ).
*
** Recupera clientes de la sociedad
*  SELECT KUNNR BUKRS
*    INTO CORRESPONDING FIELDS OF TABLE LT_KNB1
*    FROM KNB1
*    WHERE BUKRS = IV_COMPANYCODE.
*
** Verifica si existen clientes en la sociedad
*  IF LT_KNB1[] IS NOT INITIAL.
*    " Recupera las funciones asociadas al cliente
*    SELECT KUNNR PARVW KUNN2
*      INTO CORRESPONDING FIELDS OF TABLE LT_KNVP
*      FROM KNVP
*      FOR ALL ENTRIES IN LT_KNB1
*      WHERE KUNNR = LT_KNB1-KUNNR
*      AND   PARVW = GC_SHIP_FUNC.
*
*    " Recupera las descripciones de cada función
*    IF LT_KNVP[] IS NOT INITIAL.
*
*      " Recupera datos asociados a destinatarios de mercancía
*      SELECT KUNNR NAME1 NAME2
*        INTO CORRESPONDING FIELDS OF TABLE LT_KNA1
*        FROM KNA1
*        FOR ALL ENTRIES IN LT_KNVP
*        WHERE KUNNR = LT_KNVP-KUNN2.
*
*      LT_KNVP_C[] = LT_KNVP[].
*      SORT LT_KNVP_C BY PARVW.
*      DELETE ADJACENT DUPLICATES FROM LT_KNVP_C COMPARING PARVW.
*
*      " Recupera textos de las funciones de interlocutor
*      SELECT *
*        INTO TABLE LT_TPART
*        FROM TPART
*        FOR ALL ENTRIES IN LT_KNVP_C
*        WHERE PARVW = LT_KNVP_C-PARVW
*        AND   ( SPRAS = GC_SPANISH
*        OR      SPRAS = GC_ENGLISH ).
*    ENDIF.
  CLEAR lv_linea.
*
*    " Recupera detalle de cada cliente
  LOOP AT lt_data INTO ls_data.
*    LOOP AT LT_KNB1 INTO LS_KNB1.
*      " Limpia WA de datos de salida
    CLEAR ls_customers_list.
*
*      "Ajusta valores para llamar BAPI
    lv_customerno  = ls_data-customer.
*      LV_CUSTOMERNO  = LS_KNB1-KUNNR.
    lv_companycode = ls_data-comp_code.
*      LV_COMPANYCODE = LS_KNB1-BUKRS.
*
*      "limpia variables
    CLEAR ls_customeraddress.
    zcl_qry_operations_to_s4hana=>customers_comp_kna1( EXPORTING i_operacion = 'READ' lv_companycode = lv_companycode
    lv_customerno = lv_customerno IMPORTING ls_customeraddress = ls_customeraddress ).
*
*      " Recupera nombre de cliente
*      CALL FUNCTION 'BAPI_CUSTOMER_GETDETAIL2'
*        EXPORTING
*          CUSTOMERNO      = LV_CUSTOMERNO
*          COMPANYCODE     = LV_COMPANYCODE
*        IMPORTING
*          CUSTOMERADDRESS = LS_CUSTOMERADDRESS.
*
*      "Agrega campos de salida (no. cliente y nombres)
    ls_customers_list-customer = ls_data-customer.
*      LS_DATA-CUSTOMER  = LS_KNB1-KUNNR.
    ls_customers_list-comp_code = ls_data-comp_code.
*      LS_DATA-COMP_CODE = LS_KNB1-BUKRS.
    ls_customers_list-name      = ls_customeraddress-name.
    ls_customers_list-name_2    = ls_customeraddress-name_2.
    ls_customers_list-name_3    = ls_customeraddress-name_3.
    ls_customers_list-name_4    = ls_customeraddress-name_4.
*
*      " Recupera y ajusta función interlocutor y textos
*      LOOP AT LT_KNVP INTO LS_KNVP
*        WHERE KUNNR = LS_KNB1-KUNNR.
    ls_customers_list-function = ls_data-function.
*
*        " Recupera texto de función (Español)
*        CLEAR LS_TPART.
*        READ TABLE LT_TPART INTO LS_TPART
*          WITH KEY PARVW = LS_KNVP-PARVW
*                   SPRAS = GC_SPANISH.
    IF ls_data-function_text_es IS NOT INITIAL.
      ls_customers_list-function_text_es = ls_data-function_text_es.
    ENDIF.
*        IF SY-SUBRC = 0.
*          LS_DATA-FUNCTION_TEXT_ES = LS_TPART-VTEXT.
*        ENDIF.
*
*        " Recupera texto de función (Inglés)
*        CLEAR LS_TPART.
*        READ TABLE LT_TPART INTO LS_TPART
*          WITH KEY PARVW = LS_KNVP-PARVW
*                   SPRAS = GC_ENGLISH.
    IF ls_data-function_text_en IS NOT INITIAL.
      ls_customers_list-function_text_es = ls_data-function_text_en.
    ENDIF.
*        IF SY-SUBRC = 0.
*          LS_DATA-FUNCTION_TEXT_EN = LS_TPART-VTEXT.
*        ENDIF.
*
*        " Recupera el interlocutor relacionado
    ls_customers_list-kunn2 = ls_data-kunn2.
*        LS_DATA-KUNN2 = LS_KNVP-KUNN2.
*
*        " Recupera el nombre del interlocutor relacionado
*        CLEAR LS_KNA1.
*        READ TABLE LT_KNA1 INTO LS_KNA1
*          WITH KEY KUNNR = LS_DATA-KUNN2.
    IF ls_data-kunn2 IS NOT INITIAL.
      ls_customers_list-kunn2_NAME1 = ls_data-kunn2_name1.
      ls_customers_list-kunn2_NAME2 = ls_data-kunn2_name2.
    ENDIF.
*        IF SY-SUBRC = 0.
*          LS_DATA-KUNN2_NAME1 = LS_KNA1-NAME1.
*          LS_DATA-KUNN2_NAME2 = LS_KNA1-NAME2.
*        ENDIF.
*
*        " Agrega el registro a la tabla de salida
*        INSERT LS_DATA INTO TABLE ET_CUSTOMERS_LIST.
    APPEND ls_customers_list TO et_customers_list.
*      ENDLOOP.
  ENDLOOP.
*  ENDIF.
*
ENDFUNCTION.
