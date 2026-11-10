FUNCTION zvts_gr_detail.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(PO_NUMBER) TYPE  EBELN
*"  EXPORTING
*"     VALUE(GRS_DETAIL) TYPE  ZTT_GRS_DETAIL
*"----------------------------------------------------------------------
 " You can use the template 'functionModuleParameter' to add here the signature!


  DATA:  t_menge LIKE zes_ekbe-menge,
         dif     LIKE zes_ekbe-menge,
         c_ent   LIKE zes_ekbe-menge,
         c_sal   LIKE zes_ekbe-menge,
         cant    LIKE zes_ekbe-menge,
         cant2   LIKE zes_ekbe-menge.

*  DATA: it_ekpo_ekko TYPE ztt_ekpo_ekko,
*        wa_ekpo_ekko LIKE LINE OF it_ekpo_ekko.

  DATA: t_pagos   TYPE ztt_gr_detail_pagos,
        wa_pagos  LIKE LINE OF t_pagos,
        t_pagos_f TYPE ztt_gr_detail_pagos,
        wa_pagos_f  LIKE LINE OF t_pagos_f.

  DATA: it_bwart  TYPE ztt_bwart,
        wa_bwart  LIKE LINE OF it_bwart.

  DATA: it_bwart2  TYPE ztt_bwart,
        wa_bwart2  LIKE LINE OF it_bwart2.

  DATA: it_ekbe   TYPE ztt_ekbe,
        wa_ekbe   LIKE LINE OF it_ekbe.

  DATA: et_grs_detail TYPE ztt_grs_detail,
        es_grs_detail LIKE LINE OF et_grs_detail.

  CLEAR: t_pagos, it_bwart, wa_bwart, it_ekbe, wa_ekbe, t_pagos_f, it_bwart2.
*
**--> Busca Detalle
*
*SELECT ebeln ebelp bukrs matnr meins txz01 pstyp werks menge
*INTO TABLE t_pagos
*FROM ekpo
*WHERE ebeln EQ po_number
*AND   loekz EQ space.

  CLEAR: t_pagos.
  zcl_ekpo_ekko=>ekpo_get( EXPORTING i_operacion = 'READ' i_po_number = po_number IMPORTING et_ekpo_ekko = t_pagos ).

  CHECK sy-subrc = 0.

  wa_bwart-bwart = '101'.
  APPEND wa_bwart TO it_bwart.
  wa_bwart-bwart = '103'.
  APPEND wa_bwart TO it_bwart.
  wa_bwart-bwart = '105'.
  APPEND wa_bwart TO it_bwart.
  wa_bwart-bwart = '911'.
  APPEND wa_bwart TO it_bwart.
  wa_bwart-bwart = '913'.
  APPEND wa_bwart TO it_bwart.
  wa_bwart-bwart = '123'.
  APPEND wa_bwart TO it_bwart.

  wa_bwart2-bwart = '102'.
  APPEND wa_bwart2 TO it_bwart2.
  wa_bwart2-bwart = '104'.
  APPEND wa_bwart2 TO it_bwart2.
  wa_bwart2-bwart = '106'.
  APPEND wa_bwart2 TO it_bwart2.
  wa_bwart2-bwart = '122'.
  APPEND wa_bwart2 TO it_bwart2.



  LOOP AT t_pagos INTO wa_pagos.
    CLEAR: c_ent, c_sal.

    wa_pagos-matnr_d = wa_pagos-matnr.
*
*    SELECT menge budat wrbtr waers
*    INTO (t_pagos-menge, t_pagos-budat,
*          t_pagos-wrbtr, t_pagos-waers)
*    FROM ekbe
*    WHERE ebeln EQ t_pagos-ebeln
*    AND ebelp EQ t_pagos-ebelp
*    AND bewtp = 'E'
*    AND bwart IN ('101', '103', '105', '911', '913', '123').
*        ADD t_pagos-menge TO c_ent.
*    ENDSELECT.

    CLEAR: it_ekbe.
    zcl_ekbe=>ekbe_get( EXPORTING i_operacion  = 'READ'
                                  i_ebeln      =  wa_pagos-ebeln
                                  i_ebelp      =  wa_pagos-ebelp
                                  i_bewtp      =  'E'
                                  it_bwart     =  it_bwart
                                  i_shkzg      = ''
                        IMPORTING et_ekbe = it_ekbe ).

    IF it_ekbe IS INITIAL.
      CLEAR: wa_pagos-menge.

*      MODIFY wa_pagos INDEX sy-tabix.

      APPEND wa_pagos TO t_pagos_f.

      CONTINUE.
    ELSE.

       LOOP AT it_ekbe INTO wa_ekbe.

         wa_pagos-menge = wa_ekbe-menge.
         wa_pagos-budat = wa_ekbe-budat.
         wa_pagos-wrbtr = wa_ekbe-wrbtr.
         wa_pagos-waers = wa_ekbe-waers.

         c_ent = c_ent + wa_pagos-menge.

       ENDLOOP.

     "  // CONTINUAR
*      SELECT menge INTO t_menge FROM ekbe
*         WHERE ebeln EQ t_pagos-ebeln
*           AND ebelp EQ t_pagos-ebelp
*           AND bewtp = 'E'
*           AND bwart IN ('102', '104', '106', '122').
*        ADD t_menge TO c_sal.
*      ENDSELECT.

      CLEAR: it_ekbe.
      zcl_ekbe=>ekbe_get( EXPORTING i_operacion  = 'READ'
                                  i_ebeln      =  wa_pagos-ebeln
                                  i_ebelp      =  wa_pagos-ebelp
                                  i_bewtp      =  'E'
                                  it_bwart     =  it_bwart2
                                  i_shkzg      = ''
                        IMPORTING et_ekbe      =  it_ekbe ).

      IF it_ekbe IS NOT INITIAL.

        LOOP AT it_ekbe INTO wa_ekbe.

          t_menge = wa_ekbe-menge.
          c_sal = c_sal + t_menge.
*          ADD t_menge TO c_sal.

        ENDLOOP.

      ENDIF.

      dif = c_ent - c_sal.

      IF dif EQ 0.
        CLEAR: wa_pagos-menge, wa_pagos-wrbtr, wa_pagos-budat, wa_pagos-waers.
*        MODIFY t_pagos INDEX sy-tabix.
      ELSE.

*      MODIFY t_pagos INDEX sy-tabix.

** Busca por R o Q
*        SELECT gjahr wrbtr waers menge budat belnr
*        INTO (t_pagos-gjahr, t_pagos-wrbtr2, t_pagos-waers2,
*                t_pagos-menge2, t_pagos-budat2, t_pagos-belnr)
*        FROM ekbe
*        WHERE ebeln EQ t_pagos-ebeln
*        AND ebelp EQ t_pagos-ebelp
*        AND ( bewtp = 'Q' OR bewtp = 'R' )
*        AND shkzg EQ 'S'.
*        ENDSELECT.


*        MODIFY t_pagos INDEX sy-tabix.

        CLEAR: it_ekbe.
        zcl_ekbe=>ekbe_get( EXPORTING i_operacion  = 'READ'
                                      i_ebeln      =  wa_pagos-ebeln
                                      i_ebelp      =  wa_pagos-ebelp
                                      i_bewtp      =  'Q'
                                      it_bwart     =  it_bwart2
                                      i_shkzg      = 'S'
                            IMPORTING et_ekbe      =  it_ekbe ).

        CHECK sy-subrc EQ 0.
        LOOP AT it_ekbe INTO wa_ekbe.
          wa_pagos-gjahr  = wa_ekbe-gjahr.
          wa_pagos-wrbtr2 = wa_ekbe-wrbtr.
          wa_pagos-waers2 = wa_ekbe-werks.
          wa_pagos-menge2 = wa_ekbe-menge.
          wa_pagos-budat2 = wa_ekbe-budat.
          wa_pagos-belnr  = wa_ekbe-belnr.
        ENDLOOP.

      ENDIF.
    ENDIF.

    APPEND wa_pagos TO t_pagos_f.

  ENDLOOP.



*SORT t_pagos_f  BY ebeln ebelp.
  CLEAR: es_grs_detail.
**--> Busca devoluciones
*
  LOOP AT t_pagos_f INTO wa_pagos_f.

    es_grs_detail-ITEM         = wa_pagos_f-EBELP.
    es_grs_detail-MATERIAL     = wa_pagos_f-MATNR.
    es_grs_detail-DESCRIPTION  = wa_pagos_f-TXZ01.
    es_grs_detail-GRS_DATE     = wa_pagos_f-BUDAT.
    es_grs_detail-GRS_QUANTITY = wa_pagos_f-MENGE.
    es_grs_detail-UM           = wa_pagos_f-MEINS.
    es_grs_detail-IRS_DATE     = wa_pagos_f-BUDAT2.
    es_grs_detail-IRS_QUANTIY  = wa_pagos_f-MENGE2.
    es_grs_detail-IRS_AMOUNT   = wa_pagos_f-WRBTR2.
    es_grs_detail-CURRENCY     = wa_pagos_f-WAERS.
    es_grs_detail-RET_QUANT    = wa_pagos_f-CANT_DEV.
    es_grs_detail-RETURN       = wa_pagos_f-DEVOLUCION.
    APPEND es_grs_detail TO grs_detail.
    CLEAR: es_grs_detail.
  ENDLOOP.


ENDFUNCTION.
