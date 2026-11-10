FUNCTION zvts_search_user.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(USER) TYPE  UNAME
*"  EXPORTING
*"     VALUE(NAME1) TYPE  CHAR30
*"     VALUE(NAME2) TYPE  CHAR30
*"     VALUE(EMAIL) TYPE  ZEMAIL
*"     VALUE(MESSAGE) TYPE  CHAR100
*"----------------------------------------------------------------------
  " Mensaje de retorno
*"----------------------------------------------------------------------

  "--------------------------------------------------------------------
  " Estructura para datos del usuario (USR21)
  "--------------------------------------------------------------------
  DATA:
    l_usr21 TYPE zes_usr21.

  "--------------------------------------------------------------------
  " Búsqueda del usuario en USR21
  "--------------------------------------------------------------------
  zcl_qry_search_user=>get_usr21(
    EXPORTING
      i_operacion = 'READ'
      user        = user
    IMPORTING
      l_usr21     = l_usr21
  ).

  "--------------------------------------------------------------------
  " Validación: usuario no encontrado
  "--------------------------------------------------------------------
  IF l_usr21 IS INITIAL.

    " Se construye el mensaje estándar del sistema
    MESSAGE ID sy-msgid
            TYPE sy-msgty
            NUMBER sy-msgno
            INTO message
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.

  ELSE.

    "--------------------------------------------------------------
    " Búsqueda del correo electrónico (ADR6)
    "--------------------------------------------------------------
    zcl_qry_search_user=>get_adr6(
      EXPORTING
        i_operacion = 'READ'
        addrnumber  = l_usr21-addrnumber
        persnumber  = l_usr21-persnumber
      IMPORTING
        email       = email
    ).

    "--------------------------------------------------------------
    " Búsqueda del nombre y apellido (ADRC)
    "--------------------------------------------------------------
    zcl_qry_search_user=>get_adrc(
      EXPORTING
        i_operacion = 'READ'
        addrnumber  = l_usr21-addrnumber
      IMPORTING
        name1       = name1
        name2       = name2
    ).

  ENDIF.

ENDFUNCTION.
