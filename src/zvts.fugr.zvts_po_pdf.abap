FUNCTION zvts_po_pdf.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(DOC_NUMBER) TYPE  EBELN
*"     VALUE(COMPANY) TYPE  BUKRS OPTIONAL
*"  EXPORTING
*"     VALUE(PDF_XSTRING) TYPE  STRING
*"     REFERENCE(MSG) TYPE  STRING
*"----------------------------------------------------------------------
    zcl_po_pdf=>get_pdf( EXPORTING i_ebeln = doc_number
                         IMPORTING e_pdf = pdf_xstring ).

    IF pdf_xstring IS INITIAL.
      msg = 'No se encontró información.'.
    ENDIF.

ENDFUNCTION.
