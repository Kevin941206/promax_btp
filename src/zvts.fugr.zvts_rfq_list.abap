FUNCTION zvts_rfq_list.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(VENDOR) TYPE  ELIFN
*"     VALUE(COMPANY) TYPE  BUKRS OPTIONAL
*"     VALUE(QUOTATION) TYPE  EBELN OPTIONAL
*"     VALUE(START_DATE) TYPE  ERDAT OPTIONAL
*"     VALUE(END_DATE) TYPE  ERDAT OPTIONAL
*"     VALUE(STATUS) TYPE  CHAR1 OPTIONAL
*"     VALUE(LANGU) TYPE  SY-LANGU OPTIONAL
*"     VALUE(RECORDS) TYPE  SY-TABIX OPTIONAL
*"  EXPORTING
*"     VALUE(MESSAGE) TYPE  CHAR255
*"     REFERENCE(RFQ_LIST) TYPE  ZVTS_TT_RFQ_LIST
*"----------------------------------------------------------------------
  DATA ls_list LIKE LINE OF rfq_list.

  l_rec = records.
  p_lan = langu.

  CLEAR: prov.

  IF vendor CA 'ABCDEFGHIJKLMNOPQRSTVWXYZ'.
    prov  = vendor.
  ELSE.
    provc = vendor.
    prov  = provc.
  ENDIF.

*  PERFORM prepara_parametros USING company
*                                   quotation
*                                   start_date
*                                   end_date.
*   Busca Oftas. Encabezado
  PERFORM selecciona_encabezado USING status company quotation start_date end_date vendor.

*   Busca detalle de las oftas.
  PERFORM selecciona_detalle USING status quotation.

  LOOP AT t_oferta INTO ls_oferta.
    ls_list-purch_doc = ls_oferta-ebeln.
    ls_list-item      = ls_oferta-ebelp.
    ls_list-doc_typ   = ls_oferta-xbsart.
    ls_list-packno    = ls_oferta-packno.
    ls_list-material  = ls_oferta-matnr.
    ls_list-text      = ls_oferta-txz01.
    ls_list-quantity  = ls_oferta-ktmng.
    ls_list-unit      = ls_oferta-meins.
    ls_list-price     = ls_oferta-netpr.
    ls_list-curr      = ls_oferta-waers.
    ls_list-deadline  = ls_oferta-angdt.
    ls_list-status    = ls_oferta-stat.
    ls_list-ittext    = ls_oferta-txt.
    ls_list-attach    = ls_oferta-atch.
    ls_list-req       = ls_oferta-banfn.                    "06.2022
    ls_list-itcat     = ls_oferta-pstyp.
    ls_list-comm      = ls_oferta-agmem.
    APPEND ls_list TO rfq_list.
  ENDLOOP.

*sort RFQ_LIST by status deadline descending.
  message = l_message.

ENDFUNCTION.
