FUNCTION zvts_comments.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(EBELN) TYPE  EBELN
*"     VALUE(COMENTARIOS) TYPE  CHAR255
*"     VALUE(LANGU) TYPE  LANGU
*"  EXPORTING
*"     VALUE(MESSAGE) TYPE  CHAR255
*"----------------------------------------------------------------------
  DATA: theader   LIKE zTHEAD,
        length    TYPE i,
        ofs       TYPE n,
        code(5),
        tlines    TYPE ztt_tline, "zTLINE,
        ls_tlines LIKE LINE OF tlines,
        txtlin    TYPE ztt_tline, "zTLINE.
        ls_txtlin LIKE LINE OF txtlin.

  zcl_qry_po_deliv_address=>ekko( EXPORTING i_operacion = 'READ'
                                            i_ebeln = ebeln
                                  IMPORTING es_ekko = DATA(ls_ekko) ).

  p_lan = ls_ekko-spras.
*refresh: txtlin, tlines.
  CLEAR: txtlin, mensaje.
  theader-tdobject = 'EKKO'.
  theader-tdname   = ebeln.
  theader-tdid     = 'F22' .
  theader-tdspras  = p_lan.

**-- Lee texto del Encabezado
*CALL FUNCTION 'READ_TEXT'
*  EXPORTING
**   CLIENT                        = SY-MANDT
*    ID                            = theader-TDID
*    LANGUAGE                      = theader-TDSPRAS
*    NAME                          = theader-TDNAME
*    OBJECT                        = theader-TDOBJECT
**   ARCHIVE_HANDLE                = 0
**   LOCAL_CAT                     = ' '
** IMPORTING
**   HEADER                        =
*  TABLES
*    LINES                         = txtlin
* EXCEPTIONS
*   ID                            = 1
*   LANGUAGE                      = 2
*   NAME                          = 3
*   NOT_FOUND                     = 4
*   OBJECT                        = 5
*   REFERENCE_CHECK               = 6
*   WRONG_ACCESS_TO_ARCHIVE       = 7
*   OTHERS                        = 8
*          .
  zcl_textos=>read_text( EXPORTING i_id = theader-tdid
                                   i_name = theader-tdname
                                   i_object = theader-tdobject
                                   i_spras = theader-tdspras
                         IMPORTING e_subrc = DATA(lv_subrc)
                                   et_lines = txtlin ).
  IF lv_subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    code = sy-subrc.
    CONCATENATE 'Error:Read Text:' code INTO mensaje SEPARATED BY space.
  ENDIF.


*-- Guarda texto de comentarios
  length = strlen( comentarios ).
  IF length > 132.
    ofs = 0.
    DO.
      CLEAR ls_txtlin-tdline.
      ls_txtlin-tdline = comentarios+ofs(132).
      APPEND ls_txtlin TO txtlin.
      ofs = ofs + 132.
      CHECK ofs > length.
      EXIT.
    ENDDO.
  ELSE.
    ls_txtlin-tdline = comentarios.
    APPEND ls_txtlin TO txtlin.
  ENDIF.
  CLEAR mensaje.
  CLEAR: tlines, ls_tlines.
  tlines[] = txtlin[].
*CALL FUNCTION 'SAVE_TEXT'
*  EXPORTING
**   CLIENT                = SY-MANDT
*    HEADER                = theader
**   INSERT                = ' '
*   SAVEMODE_DIRECT        = 'X'
**   OWNER_SPECIFIED       = ' '
**   LOCAL_CAT             = ' '
** IMPORTING
**   FUNCTION              =
**   NEWHEADER             =
*  TABLES
*    LINES                 = tlines
* EXCEPTIONS
*   ID                    = 1
*   LANGUAGE              = 2
*   NAME                  = 3
*   OBJECT                = 4
*   OTHERS                = 5.
  zcl_textos=>save_text( EXPORTING i_id = theader-tdid
                                   i_name = theader-tdname
                                   i_object = theader-tdobject
                                   i_spras = theader-tdspras
                                   i_save = abap_true
                                   it_lines = tlines
                         IMPORTING e_subrc = lv_subrc ).
  IF lv_subrc EQ 0.
*    COMMIT WORK AND WAIT.
    LOOP AT tlines INTO ls_tlines.
      CONCATENATE mensaje ls_tlines-tdline INTO mensaje.
    ENDLOOP.
    CONCATENATE 'Comentario guardado correctamente**' mensaje INTO mensaje.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ELSE.
    code = sy-subrc.
    CONCATENATE 'Error:Save Text:' code INTO mensaje SEPARATED BY space.
  ENDIF.

ENDFUNCTION.
