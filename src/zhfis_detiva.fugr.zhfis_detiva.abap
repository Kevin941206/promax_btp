FUNCTION zhfis_detiva.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(I_COMPANY_CODE) TYPE  BUKRS
*"     VALUE(I_DATE_FROM) TYPE  BUDAT DEFAULT SY-DATUM
*"     VALUE(I_DATE_TO) TYPE  BUDAT DEFAULT SY-DATUM
*"  EXPORTING
*"     VALUE(E_DOCSDETIVA) TYPE  ZTT_ZHFIS_DETIVA
*"----------------------------------------------------------------------
  zcl_qry_zhfis_detiva=>zhfis_detiva( EXPORTING i_bukrs = i_company_code
                                                i_date_from = i_date_from
                                                i_date_to = i_date_to
                                      IMPORTING e_docsdetiva = e_docsdetiva ).

ENDFUNCTION.
