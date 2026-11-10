***--------------------------------------------------------------------**
***                       LOG DE MODIFICACIONES                        **
***--------------------------------------------------------------------**
*** Ticket:         CHG0032326_INC0088989                              **
*** Fecha :         21.08.2023                                         **
*** Funcional:      Victor Rene Castro Rodríguez                       **
*** Consultor ABAP: Ximena Bodart Castañares   CSNECABAP               **
*** Descripción:    Ajuste para evitar Sobreencolamiento PI ABAP       **
*************************************************************************
FUNCTION zfm_datfisc.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(T_DATFISC) TYPE  ZTTFI_DATFISC
*"  EXPORTING
*"     VALUE(E_MESSA) TYPE  ZDEMESSA
*"----------------------------------------------------------------------
* Graba los datos
  CLEAR e_messa.
  CLEAR i_datfisc.
  LOOP AT t_datfisc INTO DATA(l_datfisc).
    CLEAR w_datfisc.

*INI CHG0031595-REQ0021879 Ximena Bodart NE_RBARRON 21.08.2023
    IF l_datfisc-bukrs = '9999' AND
       l_datfisc-belnr = '9999999999' AND
       l_datfisc-gjahr = '9999'.
      CONTINUE.
    ENDIF.
*FIN CHG0031595-REQ0021879 Ximena Bodart NE_RBARRON 21.08.2023
    w_datfisc-mandt = sy-mandt.
    w_datfisc-uuid  = l_datfisc-uuid.
    w_datfisc-bukrs = l_datfisc-bukrs.
    w_datfisc-belnr = l_datfisc-belnr.
    w_datfisc-gjahr = l_datfisc-gjahr.
    w_datfisc-xref1 = l_datfisc-xref1.
    w_datfisc-forpa = l_datfisc-forpa.
    w_datfisc-metpa = l_datfisc-metpa.
    w_datfisc-impor = l_datfisc-impor.
    w_datfisc-rfc   = l_datfisc-rfc.
    APPEND w_datfisc TO i_datfisc.
  ENDLOOP.
*INI CHG0031595-REQ0021879 Ximena Bodart NE_RBARRON 21.08.2023
  IF i_datfisc[] IS NOT INITIAL.
*FIN CHG0031595-REQ0021879 Ximena Bodart NE_RBARRON 21.08.2023

*    MODIFY ztfi_pidatfisc FROM TABLE @i_datfisc.
    zcl_qry_operations_to_s4hana=>ztfi_pidatfisc( i_operacion = 'CREATE' it_datfisc = t_datfisc ).


* BEGIN JFMP 08.06.20 Guarda los datos como textos
    SORT i_datfisc BY bukrs ASCENDING
                      belnr ASCENDING
                      gjahr ASCENDING.
    DELETE ADJACENT DUPLICATES FROM i_datfisc COMPARING bukrs
                                                        belnr
                                                        gjahr.
    LOOP AT i_datfisc INTO w_datfisc.
*   Nota/Año
      lv_texto = w_datfisc-gjahr.
      PERFORM save_text USING '0002'
                              lv_texto.
*   CFDI Forma de pago/Forma de pago
      lv_texto = w_datfisc-forpa.
      PERFORM save_text USING 'ZFOP'
                              lv_texto.
*   CFDI Método de pago/Vía de pago
      lv_texto = w_datfisc-metpa.
      PERFORM save_text USING 'ZMEP'
                              lv_texto.
*   Importe XML/Importe
      lv_texto = w_datfisc-impor.
      SHIFT lv_texto LEFT DELETING LEADING space.
      PERFORM save_text USING 'ZUIM'
                              lv_texto.
*   RFC XML/RFC XML
      lv_texto = w_datfisc-rfc.
      PERFORM save_text USING 'ZURF'
                              lv_texto.
*   UUID NoCertificado Digital XML/UUID XML
      lv_texto = w_datfisc-uuid.
      PERFORM save_text USING 'ZUUI'
                              lv_texto.
    ENDLOOP.
* END JFMP 08.06.20

* Valida el resultado
    IF sy-subrc EQ 0.
      COMMIT WORK AND WAIT.
      e_messa = 'Registro almacenado'.
    ELSE.
      ROLLBACK WORK.
      e_messa = 'Error al grabar datos'.
    ENDIF.

*INI CHG0031595-REQ0021879 Ximena Bodart NE_RBARRON 21.08.2023
  ENDIF.
*FIN CHG0031595-REQ0021879 Ximena Bodart NE_RBARRON 21.08.2023
ENDFUNCTION.

* BEGIN JFMP 08.06.20 Rutinas
*&---------------------------------------------------------------------*
*&      Form  SAVE_TEXT                                                *
*&---------------------------------------------------------------------*
*       Graba texto                                                    *
*----------------------------------------------------------------------*
*      -->P_IDTXT     ID texto                                         *
*      -->P_TEXTO     Texto                                            *
*----------------------------------------------------------------------*
FORM save_text  USING    p_idtxt TYPE ztdid
                         p_texto TYPE ztdline.

  DATA(lo_rfc_dest) = cl_rfc_destination_provider=>create_by_cloud_destination(
                             i_name = |RFC_QS4| ).

  DATA(lv_rfc_dest) = lo_rfc_dest->get_destination_name( ).

* Variables locales
  DATA: lt_lines  TYPE STANDARD TABLE OF ztline,   "Textos
        lw_lines  LIKE LINE OF lt_lines,          "Cabecera tabla textos
        lw_header TYPE zthead.                     "Cabecera
* Prepara los datos
  CLEAR: lw_lines,
         lw_header.
  CLEAR lt_lines.
  lw_header-tdobject = 'BELEG'.
  CONCATENATE w_datfisc-bukrs
              w_datfisc-belnr
              w_datfisc-gjahr INTO lw_header-tdname.
  lw_header-tdid = p_idtxt.
*  lw_header-tdspras = sy-langu.   "JFMP 10.06.20
  lw_header-tdspras = 'S'.         "JFMP 10.06.20
  lw_lines-tdformat = '*'.
  lw_lines-tdline   = p_texto.
  APPEND lw_lines TO lt_lines.
* Graba el texto
*  CALL FUNCTION 'SAVE_TEXT' DESTINATION lv_rfc_dest
*    EXPORTING
*      header          = lw_header
*      savemode_direct = 'X'
*      owner_specified = 'X'
*    TABLES
*      lines           = lt_lines
*    EXCEPTIONS
*      id              = 1
*      language        = 2
*      name            = 3
*      object          = 4
*      OTHERS          = 5.
  zcl_textos=>save_text( EXPORTING i_id = lw_header-tdid
                                   i_name = lw_header-tdname
                                   i_object = lw_header-tdobject
                                   i_spras = lw_header-tdspras
                                   i_save = abap_true
                                   i_owner = abap_true
                                   it_lines = lt_lines
                         IMPORTING e_subrc = DATA(lv_subrc) ).
* BEGIN JFMP 10.06.20 Inglés
  lw_header-tdspras = 'EN'.
*  CALL FUNCTION 'SAVE_TEXT' DESTINATION lv_rfc_dest
*    EXPORTING
*      header          = lw_header
*      savemode_direct = 'X'
*      owner_specified = 'X'
*    TABLES
*      lines           = lt_lines
*    EXCEPTIONS
*      id              = 1
*      language        = 2
*      name            = 3
*      object          = 4
*      OTHERS          = 5.
  zcl_textos=>save_text( EXPORTING i_id = lw_header-tdid
                                   i_name = lw_header-tdname
                                   i_object = lw_header-tdobject
                                   i_spras = lw_header-tdspras
                                   i_save = abap_true
                                   i_owner = abap_true
                                   it_lines = lt_lines
                         IMPORTING e_subrc = lv_subrc ).
* END JFMP 10.06.20
ENDFORM.                    " SAVE_TEXT
* END JFMP 08.06.20
