FUNCTION YFMSD_PRODFAMILYS_GET.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  EXPORTING
*"     VALUE(ET_PROD_FAMILIES) TYPE  YTTMM_MERCHGROUP_E
*"----------------------------------------------------------------------
  " Declaración de variables locales
  DATA: LT_MERC_GRP TYPE TABLE OF YSTMM_MERCHGROUP_E,
        LS_MERC_GRP TYPE YSTMM_MERCHGROUP_E,
        LT_T023T    TYPE ZTT_T023_T023T,
        LS_T023T    TYPE ZES_T023_T023T,
        LS_T023T_2  TYPE ZES_T023_T023T.

  " Recupera grupos de mercancía
*  SELECT MATKL
*    INTO CORRESPONDING FIELDS OF TABLE LT_MERC_GRP
*    FROM T023.
*
*  " Recupera datos adicionales
*  IF LT_MERC_GRP[] IS NOT INITIAL.
*    " Recupera los textos asociados
*    SELECT SPRAS MATKL WGBEZ
*      INTO CORRESPONDING FIELDS OF TABLE LT_T023T
*      FROM T023T
*      FOR ALL ENTRIES IN LT_MERC_GRP
*      WHERE MATKL = LT_MERC_GRP-MATKL
*      AND   ( SPRAS = GC_SPANISH
*      OR      SPRAS = GC_ENGLISH ).
*
*    " Devuelve los grupos de mercancía con su descripción
*    LOOP AT LT_MERC_GRP INTO LS_MERC_GRP.
*      CLEAR LS_T023T.
*      " Agrega descripción en español
*      READ TABLE LT_T023T INTO LS_T023T
*        WITH KEY MATKL = LS_MERC_GRP-MATKL
*                 SPRAS = GC_SPANISH.
*      IF SY-SUBRC = 0.
*        LS_MERC_GRP-WGBEZ_S = LS_T023T-WGBEZ.
*      ENDIF.
*
*      " Agrega descripción en español
*      READ TABLE LT_T023T INTO LS_T023T
*        WITH KEY MATKL = LS_MERC_GRP-MATKL
*                 SPRAS = GC_ENGLISH.
*      IF SY-SUBRC = 0.
*        LS_MERC_GRP-WGBEZ_E = LS_T023T-WGBEZ.
*      ENDIF.
*
*      "Inserta registro de salida
*      INSERT LS_MERC_GRP INTO TABLE ET_PROD_FAMILIES.
*    ENDLOOP.
*  ENDIF.

  zcl_t023=>prodfamilys_get( EXPORTING i_operacion = 'READ' IMPORTING et_prodfamilys_get = LT_T023T ).

  IF LT_T023T[] IS NOT INITIAL.

    CLEAR LS_T023T.

*    " Devuelve los grupos de mercancía con su descripción
    LOOP AT LT_T023T INTO LS_T023T.

      LS_MERC_GRP-matkl = LS_T023T-matkl.
      IF LS_MERC_GRP-matkl IS NOT INITIAL and ( LS_T023T-spras EQ 'ES' OR LS_T023T-spras EQ 'EN' ).
*          " Agrega descripción en español
*          IF LS_T023T-spras EQ 'S'.
*            LS_MERC_GRP-WGBEZ_S = LS_T023T-WGBEZ.
*          ENDIF.
*
*          " Agrega descripción en Ingles
*          IF LS_T023T-spras EQ 'E'.
*            LS_MERC_GRP-wgbez_e = LS_T023T-WGBEZ.
*          ENDIF.

          " Agrega descripción en español
          READ TABLE LT_T023T WITH KEY MATKL = LS_T023T-matkl SPRAS = 'ES' INTO LS_T023T_2.
          IF SY-SUBRC EQ 0.
            LS_MERC_GRP-wgbez_s = LS_T023T_2-WGBEZ.
          ENDIF.

          " Agrega descripción en Ingles
          READ TABLE LT_T023T WITH KEY MATKL = LS_T023T-matkl SPRAS = 'EN' INTO LS_T023T_2.
          IF SY-SUBRC EQ 0.
            LS_MERC_GRP-wgbez_e = LS_T023T_2-WGBEZ.
          ENDIF.

          "Inserta registro de salida
          INSERT LS_MERC_GRP INTO TABLE ET_PROD_FAMILIES.
       ENDIF.
       CLEAR LS_MERC_GRP.
    ENDLOOP.
  ENDIF.



ENDFUNCTION.
