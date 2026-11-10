FUNCTION zfmsd_product_catalog.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  EXPORTING
*"     VALUE(ET_PRODUCT_CATALOG) TYPE  YTT_STMM_PRODUCTS_E
*"----------------------------------------------------------------------
*  " Declaración de latos locales
  DATA: lt_mara     TYPE TABLE OF zmara,
        ls_mara     TYPE zmara,
        lt_makt     TYPE TABLE OF zes_makt,
        ls_makt     TYPE zes_makt,
        ls_products TYPE ystmm_products_e.

* Recupera todos los productos de la tabla MARA
*  SELECT MATNR MATKL SPART
*    INTO CORRESPONDING FIELDS OF TABLE LT_MARA
*    FROM MARA.
*
* Recupera textos
*  IF LT_MARA[] IS NOT INITIAL.
*    " Recupera textos de materiales
*    SELECT *
*      INTO TABLE LT_MAKT
*      FROM MAKT
*      FOR ALL ENTRIES IN LT_MARA
*      WHERE MATNR = LT_MARA-MATNR
*      AND  ( SPRAS = GC_SPANISH
*      OR     SPRAS = GC_ENGLISH ).
*  ENDIF.
* Completa información adicional
  zcl_qry_operations_to_s4hana=>zproduct_catalog( EXPORTING i_operacion = 'READ' IMPORTING et_product = et_product_catalog ).
*  SORT lt_makt BY matnr spras.

*  LOOP AT lt_mara INTO ls_mara.
*    " Coloca datos
*    CLEAR ls_products.
*    ls_products-matnr = ls_mara-matnr.
*    ls_products-artic_grp = ls_mara-matkl.
*
*    " Recupera subfamilia
*    ls_products-subfamily = ls_mara-matkl+04(01).
*
*    " Recupera el sector
*    ls_products-sector = ls_mara-spart.
*
*    " Lee descripción en español
*    CLEAR ls_makt.
*    READ TABLE lt_makt INTO ls_makt
*      WITH KEY matnr = ls_mara-matnr
*               spras = 'S' BINARY SEARCH.
*    IF sy-subrc = 0.
*      ls_products-maktx_s = ls_makt-maktx.
*    ENDIF.
*
*    "Lee descripción en inglés
*    CLEAR ls_makt.
*    READ TABLE lt_makt INTO ls_makt
*      WITH KEY matnr = ls_mara-matnr
*               spras = 'E' BINARY SEARCH.
*    IF sy-subrc = 0.
*      ls_products-maktx_e = ls_makt-maktx.
*    ENDIF.
*
*    " Inserta en registro de salida
*    INSERT ls_products INTO TABLE et_product_catalog.
*  ENDLOOP.
*
ENDFUNCTION.
