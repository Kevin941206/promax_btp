FUNCTION yfmsd_companycode_list_get.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  EXPORTING
*"     VALUE(ET_COMPANYCODE_LIST) TYPE  ZTT_BAPI0002_1
*"----------------------------------------------------------------------
* Declaración de variables locales
  DATA: lt_companycode_tab TYPE TABLE OF zBAPI0002_1,
        ls_companycode_tab TYPE zBAPI0002_1.

  zcl_qry_operations_to_s4hana=>company_code_list_get( EXPORTING i_operacion = 'READ'
                                                       IMPORTING et_companys = lt_companycode_tab ).

** Recupera lista de todas las sociedades
*  CALL FUNCTION 'BAPI_COMPANYCODE_GETLIST'
*    TABLES
*      COMPANYCODE_LIST = LT_COMPANYCODE_TAB.


* Elimina las sociedades no validas
  LOOP AT lt_companycode_tab INTO ls_companycode_tab.
    IF ls_companycode_tab-comp_code+0(02) = gc_valid_companycode.
      INSERT ls_companycode_tab INTO TABLE et_companycode_list.
    ENDIF.
  ENDLOOP.

ENDFUNCTION.
