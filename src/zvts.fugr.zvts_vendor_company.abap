FUNCTION zvts_vendor_company.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(VENDOR) TYPE  LIFNR
*"  EXPORTING
*"     VALUE(MESSAGE) TYPE  CHAR255
*"     VALUE(COMPANY) TYPE  ZTT_LFB1
*"----------------------------------------------------------------------
     " Sociedades del proveedor
*"----------------------------------------------------------------------

  "--------------------------------------------------------------------
  " Declaración de variables
  "--------------------------------------------------------------------
  DATA:
    ls_bukrs TYPE zebpp_bukrs,   " Estructura para sociedad
    lfa1     TYPE zst_lfa1.      " Datos generales del proveedor (LFA1)

  " Variables auxiliares (asumidas como globales en el FM)
  " prov  : proveedor en formato correcto
  " provc : proveedor con conversión numérica

  CLEAR: prov, company, message.

  "--------------------------------------------------------------------
  " Normalización del número de proveedor
  " Si contiene letras, se usa directamente
  " Si es numérico, se convierte al formato interno
  "--------------------------------------------------------------------
  IF vendor CA 'ABCDEFGHIJKLMNOPQRSTVWXYZ'.
    prov = vendor.
  ELSE.
    provc = vendor.
    prov  = provc.
  ENDIF.

  "--------------------------------------------------------------------
  " Extracción de datos generales del proveedor (LFA1)
  "--------------------------------------------------------------------
  zcl_qry_po_deliv_address=>lfa1(
    EXPORTING
      i_operacion = 'READ'
      i_lifnr     = prov
    IMPORTING
      es_lfa1     = lfa1
  ).

  "--------------------------------------------------------------------
  " Validación: proveedor existente
  "--------------------------------------------------------------------
  IF lfa1 IS NOT INITIAL.

    "--------------------------------------------------------------
    " Extracción de sociedades del proveedor (LFB1)
    "--------------------------------------------------------------
    zcl_qry_fbl1=>get_lfb1(
      EXPORTING
        i_operacion = 'READ'
        lifnr       = prov
      IMPORTING
        et_bukrs     = company
    ).

    " Agregar sociedad a la tabla de salida
*    APPEND ls_bukrs TO company.

  ELSE.

    "--------------------------------------------------------------
    " Proveedor no existe en SAP
    "--------------------------------------------------------------
    message = 'Proveedor no existe en SAP'.

  ENDIF.

ENDFUNCTION.
