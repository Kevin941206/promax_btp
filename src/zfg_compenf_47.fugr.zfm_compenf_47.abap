***--------------------------------------------------------------------**
***                       LOG DE MODIFICACIONES                        **
***--------------------------------------------------------------------**
*** Ticket:         CHG0032069-INC007758                               **
*** Fecha :         22.02.2023                                         **
*** Funcional:      Victor Rene Castro Rodríguez                       **
*** Consultor ABAP: Ximena Bodart Castañares   CSNECABAP               **
*** Descripción:    Evitar duplicidad de registros                     **
*************************************************************************
*
FUNCTION zfm_compenf_47.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(I_CREDT) TYPE  DATUM
*"     VALUE(I_BUKRS) TYPE  BUKRS
*"     VALUE(I_LIFNR) TYPE  LIFNR
*"     VALUE(I_IMPOR) TYPE  ZDEIMPOR
*"     VALUE(I_VENDT) TYPE  DATUM
*"     VALUE(I_REFER) TYPE  ZXBLNR1
*"     VALUE(I_TEXTO) TYPE  BKTXT
*"     VALUE(I_IDEDI) TYPE  ZDEIDEDI
*"  EXPORTING
*"     VALUE(E_BELNR) TYPE  BELNR_D
*"     VALUE(E_CREDT) TYPE  DATUM
*"     VALUE(E_VENDT) TYPE  DATUM
*"     VALUE(E_IDEDI) TYPE  ZDEIDEDI
*"     REFERENCE(T_RETURN) TYPE  ZTT_BAPIRET2
*"----------------------------------------------------------------------
  DATA: ls_return LIKE LINE OF t_return.
* INI CHG0031204-INC0051470 Ricardo Barrón Hernández CSNECABAP 30.07.2021
  DATA: lv_message TYPE bapi_msg,
* FIN CHG0031204-INC0051470 Ricardo Barrón Hernández CSNECABAP 30.07.2021
* INI CHG0032069-INC0077586 Ximena Bodart CSNECABAP 22.02.2023
        lw_bkpf    TYPE zst_bkpf.
* FIN CHG0032069-INC0077586 Ximena Bodart CSNECABAP 22.02.2023
* INI CHG0030756-INC0038716 Ricardo Barrón Hernández CSNECABAP 14.14.2020
* REQ  REQ0016009 - Julio cesar Gheno Manejo de anticipo a proveedores 18.06.2021.
  IF NOT ( i_refer+00(02) EQ 'GD' ) AND NOT ( i_refer+00(02) EQ 'PP' ).
    RETURN.
  ENDIF.
* FIN CHG0030756-INC0038716 Ricardo Barrón Hernández CSNECABAP 14.14.2020
* INI CHG0032069-INC0077586 Ximena Bodart CSNECABAP 22.02.2023
*  SELECT *
*   UP TO 1 ROWS
*    FROM bkpf
*    INTO lw_bkpf
*   WHERE bukrs = i_bukrs
*     AND budat = i_credt
*     AND xblnr = i_refer.
*  ENDSELECT.
  zcl_qry_compenf_47=>bkpf( EXPORTING i_operacion = 'READ'
                                      i_bukrs = i_bukrs
                                      i_budat = i_credt
                                      i_xblnr = i_refer
                            IMPORTING es_bkpf = lw_bkpf ).
  IF lw_bkpf IS NOT INITIAL.

    CLEAR ls_return.
    ls_return-type    = 'E'.
    ls_return-id      = '00'.
    ls_return-number  = '398'.
    ls_return-message_v1 = 'La solicitud de anticipo ya fue contabilizada con'.
    ls_return-message_v2 = lw_bkpf-bukrs.
    ls_return-message_v3 = lw_bkpf-belnr.
    ls_return-message_v4 = lw_bkpf-gjahr.
    APPEND ls_return TO t_return.

    e_belnr = lw_bkpf-belnr.
    e_credt = i_credt.
    e_vendt = i_vendt.
    e_idedi = i_idedi.

    RETURN.

  ENDIF.
* FIN CHG0032069-INC0077586 Ximena Bodart CSNECABAP 22.02.2023
* BEGIN JFMP 18.05.20 Lee tabla de constantes
  CLEAR i_const.
*  SELECT *       "Se requieren todos los campos
*  INTO TABLE i_const
*  FROM ztfi_const
*  WHERE modul EQ 'FI'
*    AND progr EQ 'SAPLZFG_COMPENF_47'.
  zcl_qry_compenf_47=>zfi_const( EXPORTING i_operacion = 'READ'
                                           i_modul = 'FI'
                                           i_progr = 'SAPLZFG_COMPENF_47'
                                 IMPORTING et_const = i_const ).
  IF i_const IS NOT INITIAL.
*   Lee el gpo. de cuentas
    CLEAR v_ktokk.
*    SELECT SINGLE ktokk
*    INTO v_ktokk
*    FROM lfa1
*    WHERE lifnr EQ i_lifnr.
    zcl_qry_compenf_47=>lfa1( EXPORTING i_operacion = 'READ'
                                        i_lifnr = i_lifnr
                              IMPORTING e_ktokk = v_ktokk
                                        e_subrc = DATA(lv_subrc) ).
    IF lv_subrc EQ 0.
*     Busca el gpo. de cuentas en la tabla de constantes
      READ TABLE i_const INTO w_const WITH KEY campo = v_ktokk.
      IF sy-subrc EQ 0.
*       Determina el valor
        CLEAR v_iva.
        IF w_const-valor EQ 'PROG1'
        OR w_const-valor EQ 'PROG2'.
          IF w_const-valor EQ 'PROG1'.
            v_iva = 'X'.
          ENDIF.
*   END JFMP 18.05.20
*         Crea el juego de datos
          CLEAR e_belnr.
          CLEAR: i_bdcdata,
                 i_messtab,
                 t_return.
*         Puentes de datos
          e_credt = i_credt.
          e_vendt = i_vendt.
          e_idedi = i_idedi.
*         Conversiones
          CONCATENATE i_credt+6(2)
                      i_credt+4(2)
                      i_credt(4) INTO v_datum SEPARATED BY '.'.
          CONCATENATE i_vendt+6(2)
                      i_vendt+4(2)
                      i_vendt(4) INTO v_vendt SEPARATED BY '.'.
          v_monat = i_credt+4(2).
          v_impor = i_impor.
*         Pantalla principal
          PERFORM dynpro USING: 'X' 'SAPMF05A'    '0112',
                                ' ' 'BDC_OKCODE'  '/00',
                                ' ' 'BKPF-BLDAT'  v_datum,
                                ' ' 'BKPF-BLART'  'KA',
                                ' ' 'BKPF-BUKRS'  i_bukrs,
                                ' ' 'BKPF-BUDAT'  v_datum,
                                ' ' 'BKPF-MONAT'  v_monat,
                                ' ' 'BKPF-WAERS'  'MXN',
                                ' ' 'BKPF-XBLNR'  i_refer,
                                ' ' 'BKPF-BKTXT'  i_texto,
                                ' ' 'RF05A-NEWKO' i_lifnr,
                                ' ' 'RF05A-ZUMSK' 'A',
*         Importes
                                'X' 'SAPMF05A'   '0304',
*                                ' ' 'BDC_OKCODE' '/00',   "JFMP 25.05.20
                                ' ' 'BDC_OKCODE' '=BU',    "JFMP 25.05.20
*                                ' ' 'BSEG-MWSKZ' 'V0'     "JFMP 18.05.20
                                ' ' 'BSEG-WRBTR' v_impor.
*   BEGIN JFMP 18.05.20 Indicador de IVA
          IF v_iva EQ 'X'.
*            PERFORM dynpro USING: ' ' 'BSEG-MWSKZ' 'V0'.
          ENDIF.
*   END JFMP 18.05.20
          PERFORM dynpro USING: ' ' 'BSEG-ZFBDT' v_vendt,
                                ' ' 'BSEG-SGTXT' i_texto,   "JFMP 25.05.20
                                ' ' 'BSEG-ZUONR' i_refer.   "JFMP 25.05.20
* BEGIN JFMP 25.05.20 Cambio de grabación
**         Diálogo para importes base
*                                'X' 'SAPLFWTD'                 '0100',
*                                ' ' 'BDC_OKCODE'               '=GO',
*                                ' ' 'WITH_DIALG-WT_BASE(01)'   '0',
*                                ' ' 'WITH_DIALG-WT_AMOUNT(01)' '0',
**         Grabar
*                                'X' 'SAPMF05A'   '0304',
*                                ' ' 'BDC_OKCODE' '=BU',
*                                ' ' 'BSEG-ZLSPR' 'A'.
* END JFMP 25.05.20
*         Prepara la ejecución
          CLEAR w_opti.
          w_opti-dismode = 'N'.
          w_opti-updmode = 'S'.
*         Ejecuta la carga
*          CALL TRANSACTION 'F-47'
*          USING i_bdcdata
*          OPTIONS FROM w_opti
*          MESSAGES INTO i_messtab.
          zcl_call_transaction=>call_transaction( EXPORTING i_tcode = 'F47'
                                                            is_params = w_opti
                                                            it_bdcdata = i_bdcdata
                                                  IMPORTING et_messtab = i_messtab ).
          READ TABLE i_messtab TRANSPORTING NO FIELDS WITH KEY msgid = 'FS'
                                                               msgnr = '222'.
          IF sy-subrc = 0.
            CLEAR i_messtab.
            CLEAR ls_bdcdata.
            ls_bdcdata-fnam = 'BSEG-MWSKZ'.
            ls_bdcdata-fval = 'V0'.
            INSERT ls_bdcdata INTO i_bdcdata INDEX 16.
            zcl_call_transaction=>call_transaction( EXPORTING i_tcode = 'F47'
                                                            is_params = w_opti
                                                            it_bdcdata = i_bdcdata
                                                  IMPORTING et_messtab = i_messtab ).
          ENDIF.
*         Busca la creación del documento
          READ TABLE i_messtab INTO DATA(ls_messtab) WITH KEY msgid = 'F5'
                                        msgnr = '312'.
          IF sy-subrc EQ 0.
*           Devuelve el número de documento creado
            e_belnr = ls_messtab-msgv1+4(10).
          ELSE.
*           Devuelve mensajes de la transacción
            LOOP AT i_messtab INTO ls_messtab.
              CLEAR t_return.
              ls_return-type    = ls_messtab-msgtyp.
              ls_return-id      = ls_messtab-msgid.
              ls_return-number  = ls_messtab-msgnr.
*              MESSAGE ID     i_messtab-msgid
*                      TYPE   i_messtab-msgtyp
*                      NUMBER i_messtab-msgnr
*                      WITH i_messtab-msgv1
*                           i_messtab-msgv2
*                           i_messtab-msgv3
*                           i_messtab-msgv4 INTO t_return-message.
              ls_return-message_v1 = ls_messtab-msgv1.
              ls_return-message_v2 = ls_messtab-msgv2.
              ls_return-message_v3 = ls_messtab-msgv3.
              ls_return-message_v4 = ls_messtab-msgv4.
              APPEND ls_return TO t_return.
            ENDLOOP.
          ENDIF.
*   BEGIN JFMP 18.05.20 Ajustes
        ELSE.
*         No tiene valor PROG1 o PROG2
          e_belnr = '99999999'.

* INI CHG0031204-INC0051470 Ricardo Barrón Hernández CSNECABAP 30.07.2021
*          MESSAGE e004(zfi_compenf_47) WITH 'ZTFI_CONST' INTO lv_message.
*         No existe PROG1/PROG2 en la tabla de constantes &

          CLEAR t_return.
          ls_return-type    = 'E'.
*          ls_return-id      = sy-msgid.
*          ls_return-number  = sy-msgno.
          ls_return-message = 'No existe PROG1/PROG2 en la tabla de constantes ZTFI_CONST'. "lv_message.
          ls_return-message_v1 = sy-msgv1.
          ls_return-message_v2 = sy-msgv2.
          ls_return-message_v3 = sy-msgv3.
          ls_return-message_v4 = sy-msgv4.
          APPEND ls_return TO t_return.
* FIN CHG0031204-INC0051470 Ricardo Barrón Hernández CSNECABAP 30.07.2021

        ENDIF.
      ELSE.
*       No existe gpo. cuentas en constante
        e_belnr = '99999999'.

* INI CHG0031204-INC0051470 Ricardo Barrón Hernández CSNECABAP 30.07.2021
*        MESSAGE e003(zfi_compenf_47) WITH v_ktokk 'ZTFI_CONST' INTO lv_message.
*       No existe GpoCuentas & en la tabla de constantes &

        CLEAR t_return.
        ls_return-type    = 'E'.
*        ls_return-id      = sy-msgid.
*        ls_return-number  = sy-msgno.
        ls_return-message = 'No existe GpoCuentas en la tabla de constantes ZTFI_CONST'. "lv_message.
        ls_return-message_v1 = sy-msgv1.
        ls_return-message_v2 = sy-msgv2.
        ls_return-message_v3 = sy-msgv3.
        ls_return-message_v4 = sy-msgv4.
        APPEND ls_return TO t_return.
* FIN CHG0031204-INC0051470 Ricardo Barrón Hernández CSNECABAP 30.07.2021

      ENDIF.
    ELSE.
*     No existe acreedor
      e_belnr = '99999999'.

* INI CHG0031204-INC0051470 Ricardo Barrón Hernández CSNECABAP 30.07.2021
*      MESSAGE e002(zfi_compenf_47) WITH i_lifnr  INTO lv_message.
*     No existe el acreedor: &

      CLEAR t_return.
      ls_return-type    = 'E'.
*      ls_return-id      = sy-msgid.
*      ls_return-number  = sy-msgno.
      ls_return-message = 'No existe el acreedor'. "lv_message.
      ls_return-message_v1 = sy-msgv1.
      ls_return-message_v2 = sy-msgv2.
      ls_return-message_v3 = sy-msgv3.
      ls_return-message_v4 = sy-msgv4.
      APPEND ls_return TO t_return.
* FIN CHG0031204-INC0051470 Ricardo Barrón Hernández CSNECABAP 30.07.2021

    ENDIF.
  ELSE.
*   No existen datos para este programa en tabla de constantes
    e_belnr = '99999999'.

* INI CHG0031204-INC0051470 Ricardo Barrón Hernández CSNECABAP 30.07.2021
*    MESSAGE e001(zfi_compenf_47) WITH 'ZTFI_CONST' INTO lv_message.
*   No existe información en la tabla de constantes &

    CLEAR t_return.
    ls_return-type    = 'E'.
*    ls_return-id      = sy-msgid.
*    ls_return-number  = sy-msgno.
    ls_return-message = 'No existe información en la tabla de constantes ZTFI_CONST'. "lv_message.
    ls_return-message_v1 = sy-msgv1.
    ls_return-message_v2 = sy-msgv2.
    ls_return-message_v3 = sy-msgv3.
    ls_return-message_v4 = sy-msgv4.
    APPEND ls_return TO t_return.
* FIN CHG0031204-INC0051470 Ricardo Barrón Hernández CSNECABAP 30.07.2021

  ENDIF.
* END JFMP 18.05.20
ENDFUNCTION.
*
*&---------------------------------------------------------------------*
*&      Form  DYNPRO                                                   *
*&---------------------------------------------------------------------*
*       Fill BDC-DATA                                                  *
*----------------------------------------------------------------------*
*      -->I_DYNBEGIN   Flag for program or field                       *
*      -->I_NAME       Program name or field name                      *
*      -->I_VALUE      Screen number or field value                    *
*----------------------------------------------------------------------*
FORM dynpro USING i_dynbegin TYPE char1
                  i_name     TYPE any
                  i_value    TYPE any.
* Clean table
  CLEAR ls_bdcdata.
* Program data
  IF i_dynbegin = 'X'.
    ls_bdcdata-program =  i_name.
    ls_bdcdata-dynpro = i_value.
    ls_bdcdata-dynbegin = 'X'.
  ELSE.
*   Field data
    ls_bdcdata-fnam = i_name.
    ls_bdcdata-fval = i_value.
  ENDIF.
* Add data set
  APPEND ls_bdcdata TO i_bdcdata.
ENDFORM.                    " DYNPRO
