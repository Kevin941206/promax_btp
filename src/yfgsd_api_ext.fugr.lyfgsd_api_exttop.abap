FUNCTION-POOL yfgsd_api_ext.                "MESSAGE-ID ..

* INCLUDE LYFGSD_API_EXTD...                 " Local class definition
*---------------------------------------------------------------------*
* TIPOS DE DATOS
*---------------------------------------------------------------------*
TYPES: BEGIN OF _tt_sales_ord_data, "Datos de pedidos
         vbeln   TYPE vbeln,
         erdat   TYPE erdat,
         kunnr   TYPE kunnr,
         invoice TYPE vbeln,
       END OF _tt_sales_ord_data,

       BEGIN OF _tt_inv_per_order, " Facturas por órdenes de venta
         vbeln TYPE vbeln,
         aubel TYPE vbeln_va,
       END OF _tt_inv_per_order,

       BEGIN OF _tt_vbfa, " Datos de facturas relacionadas
         vbeln TYPE vbeln,
         posnn TYPE posnr,
       END OF _tt_vbfa,

       BEGIN OF _tt_aubel, " Datos de pedidos asociados en la factura
         aubel TYPE vbeln,
       END OF _tt_aubel,

       BEGIN OF _tt_centros, "Datos de centros y sociedades
         bukrs TYPE bukrs,
         werks TYPE werks_d,
       END OF _tt_centros,

       BEGIN OF _tt_bkpf,  "Datos de documento financiero
         bukrs TYPE bukrs,
         belnr TYPE belnr_d,
         gjahr TYPE gjahr,
         blart TYPE blart,
         bldat TYPE bldat,
         awkey TYPE awkey,
       END OF _tt_bkpf,

       BEGIN OF _tt_references, " Referencias para documentos financieros
         awkey TYPE awkey,
       END OF _tt_references,

       BEGIN OF _tt_kna1, " Tabla de clientes
         kunnr TYPE kunnr,
         name1 TYPE name1_gp,
         name2 TYPE name2_gp,
       END OF _tt_kna1.

*TYPES:  BEGIN OF _tt_bsid. " Tabla ampliada de BSID
*TYPES: verzn TYPE verzn.
*       INCLUDE TYPE bsid.
*TYPES:  END OF _tt_bsid.

*---------------------------------------------------------------------*
* CONSTANTES
*---------------------------------------------------------------------*
CONSTANTS: gc_valid_companycode    TYPE char2 VALUE '10',
           gc_spanish              TYPE spras VALUE 'S',
           gc_english              TYPE spras VALUE 'E',
           gc_include              TYPE char1 VALUE 'I',
           gc_debitor              TYPE char1 VALUE 'D',
           gc_equal                TYPE char2 VALUE 'EQ',
           gc_cp                   TYPE char2 VALUE 'CP',
           gc_between              TYPE char2 VALUE 'BT',
           gc_customer_func        TYPE char2 VALUE 'AG',
           gc_ship_func            TYPE char2 VALUE 'WE',
           gc_bill_func            TYPE char2 VALUE 'RE',
           gc_payer_func           TYPE char2 VALUE 'RG',
           gc_awtyp                TYPE awtyp VALUE 'VBRK',
           gc_payment              TYPE blart VALUE 'DZ',
           gc_invoice              TYPE blart VALUE 'RV',
           gc_tratado_tot          TYPE char1 VALUE 'C',
           gc_type_rel_m           TYPE char1 VALUE 'M',
           gc_condtype_totpos      TYPE char25 VALUE 'YSD_TOTCONDITEM',
           gc_condtype_totsubtotal TYPE char25 VALUE 'YSD_TOT_SUBTOTAL',
           gc_condtype_totdesc     TYPE char25 VALUE 'YSD_TOT_DESCUENTO',
           gc_condtype_totiva      TYPE char25 VALUE 'YSD_TOT_IVA',
           gc_condtype_tottotal    TYPE char25 VALUE 'YSD_TOT_TOTAL',
           gc_land1                TYPE char2 VALUE 'MX'.

*---------------------------------------------------------------------*
* VARIABLES
*---------------------------------------------------------------------*
DATA: GT_SALESORD_INIT TYPE TABLE OF zst_sales_ord_data, "_TT_SALES_ORD_DATA,
      GT_CENTROS       TYPE TABLE OF _TT_CENTROS.
