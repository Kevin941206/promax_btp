"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>ZFM_ZHFIS_DETIVA_SRV</em>
CLASS zscm_zhfis_detiva2 DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">docs</p>
      BEGIN OF tys_docs,
        "! <em>Key property</em> DateTime
        date_time         TYPE string,
        "! Bukrs
        bukrs             TYPE c LENGTH 4,
        "! Belnr
        belnr             TYPE c LENGTH 10,
        "! Gjahr
        gjahr             TYPE c LENGTH 4,
        "! Budat
        budat             TYPE string,
        "! Bldat
        bldat             TYPE string,
        "! Cpudt
        cpudt             TYPE string,
        "! FechaPago
        fecha_pago        TYPE string,
        "! Xblnr
        xblnr             TYPE c LENGTH 16,
        "! Bktxt
        bktxt             TYPE c LENGTH 25,
        "! Usnam
        usnam             TYPE c LENGTH 12,
        "! Augbl
        augbl             TYPE c LENGTH 10,
        "! Lifnr
        lifnr             TYPE c LENGTH 10,
        "! Kunnr
        kunnr             TYPE c LENGTH 10,
        "! Name
        name              TYPE c LENGTH 80,
        "! Stcd1
        stcd_1            TYPE c LENGTH 16,
        "! Banka
        banka             TYPE c LENGTH 60,
        "! Bankn
        bankn             TYPE c LENGTH 18,
        "! Uuid
        uuid              TYPE c LENGTH 40,
        "! PymtMeth
        pymt_meth         TYPE c LENGTH 10,
        "! Waers
        waers             TYPE c LENGTH 5,
        "! Wrbtr
        wrbtr             TYPE p LENGTH 13 DECIMALS 3,
        "! WaersMx
        waers_mx          TYPE c LENGTH 5,
        "! Dmbtr
        dmbtr             TYPE p LENGTH 13 DECIMALS 3,
        "! Kursf
        kursf             TYPE p LENGTH 5 DECIMALS 5,
        "! Subtotal
        subtotal          TYPE p LENGTH 8 DECIMALS 3,
        "! Tax16
        tax_16            TYPE p LENGTH 8 DECIMALS 3,
        "! Tax8
        tax_8             TYPE p LENGTH 8 DECIMALS 3,
        "! RetencionIsr
        retencion_isr     TYPE p LENGTH 9 DECIMALS 3,
        "! RetencionIva
        retencion_iva     TYPE p LENGTH 9 DECIMALS 3,
        "! RetencionOtro
        retencion_otro    TYPE p LENGTH 9 DECIMALS 3,
        "! Total
        total             TYPE p LENGTH 8 DECIMALS 3,
        "! SubtotalMd
        subtotal_md       TYPE p LENGTH 8 DECIMALS 3,
        "! Tax16Md
        tax_16_md         TYPE p LENGTH 8 DECIMALS 3,
        "! Tax8Md
        tax_8_md          TYPE p LENGTH 8 DECIMALS 3,
        "! RetencionIsrMd
        retencion_isr_md  TYPE p LENGTH 9 DECIMALS 3,
        "! RetencionIvaMd
        retencion_iva_md  TYPE p LENGTH 9 DECIMALS 3,
        "! RetencionOtroMd
        retencion_otro_md TYPE p LENGTH 9 DECIMALS 3,
        "! TotalMd
        total_md          TYPE p LENGTH 8 DECIMALS 3,
      END OF tys_docs,
      "! <p class="shorttext synchronized">List of docs</p>
      tyt_docs TYPE STANDARD TABLE OF tys_docs WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">header</p>
      BEGIN OF tys_header,
        "! <em>Key property</em> DateTime
        date_time TYPE string,
        "! Company
        company   TYPE string,
        "! DateFrom
        date_from TYPE string,
        "! DateTo
        date_to   TYPE string,
      END OF tys_header,
      "! <p class="shorttext synchronized">List of header</p>
      tyt_header TYPE STANDARD TABLE OF tys_header WITH DEFAULT KEY.

    TYPES: BEGIN OF ty_deep,
             date_time    TYPE string,
             "! Company
             company      TYPE string,
             "! DateFrom
             date_from    TYPE string,
             "! DateTo
             date_to      TYPE string,
             headertodocs TYPE TABLE OF tys_docs WITH DEFAULT KEY,
           END OF ty_deep.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! docsSet
        "! <br/> Collection of type 'docs'
        docs_set   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'DOCS_SET',
        "! headerSet
        "! <br/> Collection of type 'header'
        header_set TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'HEADER_SET',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for docs</p>
        "! See also structure type {@link ..tys_docs}
        BEGIN OF docs,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF docs,
        "! <p class="shorttext synchronized">Internal names for header</p>
        "! See also structure type {@link ..tys_header}
        BEGIN OF header,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! HEADERTODOCS
            headertodocs TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTODOCS',
          END OF navigation,
        END OF header,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define docs</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_docs RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define header</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_header RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSCM_ZHFIS_DETIVA2 IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'ZFM_ZHFIS_DETIVA_SRV' ) ##NO_TEXT.

    def_docs( ).
    def_header( ).

  ENDMETHOD.


  METHOD def_docs.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'DOCS'
                                    is_structure              = VALUE tys_docs( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'docs' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'DOCS_SET' ).
    lo_entity_set->set_edm_name( 'docsSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUKRS' ).
    lo_primitive_property->set_edm_name( 'Bukrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BELNR' ).
    lo_primitive_property->set_edm_name( 'Belnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GJAHR' ).
    lo_primitive_property->set_edm_name( 'Gjahr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDAT' ).
    lo_primitive_property->set_edm_name( 'Budat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLDAT' ).
    lo_primitive_property->set_edm_name( 'Bldat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CPUDT' ).
    lo_primitive_property->set_edm_name( 'Cpudt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FECHA_PAGO' ).
    lo_primitive_property->set_edm_name( 'FechaPago' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBLNR' ).
    lo_primitive_property->set_edm_name( 'Xblnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BKTXT' ).
    lo_primitive_property->set_edm_name( 'Bktxt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'USNAM' ).
    lo_primitive_property->set_edm_name( 'Usnam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUGBL' ).
    lo_primitive_property->set_edm_name( 'Augbl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFNR' ).
    lo_primitive_property->set_edm_name( 'Lifnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUNNR' ).
    lo_primitive_property->set_edm_name( 'Kunnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME' ).
    lo_primitive_property->set_edm_name( 'Name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STCD_1' ).
    lo_primitive_property->set_edm_name( 'Stcd1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANKA' ).
    lo_primitive_property->set_edm_name( 'Banka' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANKN' ).
    lo_primitive_property->set_edm_name( 'Bankn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UUID' ).
    lo_primitive_property->set_edm_name( 'Uuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYMT_METH' ).
    lo_primitive_property->set_edm_name( 'PymtMeth' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAERS' ).
    lo_primitive_property->set_edm_name( 'Waers' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WRBTR' ).
    lo_primitive_property->set_edm_name( 'Wrbtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAERS_MX' ).
    lo_primitive_property->set_edm_name( 'WaersMx' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DMBTR' ).
    lo_primitive_property->set_edm_name( 'Dmbtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KURSF' ).
    lo_primitive_property->set_edm_name( 'Kursf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBTOTAL' ).
    lo_primitive_property->set_edm_name( 'Subtotal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_16' ).
    lo_primitive_property->set_edm_name( 'Tax16' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_8' ).
    lo_primitive_property->set_edm_name( 'Tax8' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETENCION_ISR' ).
    lo_primitive_property->set_edm_name( 'RetencionIsr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETENCION_IVA' ).
    lo_primitive_property->set_edm_name( 'RetencionIva' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETENCION_OTRO' ).
    lo_primitive_property->set_edm_name( 'RetencionOtro' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOTAL' ).
    lo_primitive_property->set_edm_name( 'Total' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBTOTAL_MD' ).
    lo_primitive_property->set_edm_name( 'SubtotalMd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_16_MD' ).
    lo_primitive_property->set_edm_name( 'Tax16Md' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_8_MD' ).
    lo_primitive_property->set_edm_name( 'Tax8Md' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETENCION_ISR_MD' ).
    lo_primitive_property->set_edm_name( 'RetencionIsrMd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETENCION_IVA_MD' ).
    lo_primitive_property->set_edm_name( 'RetencionIvaMd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETENCION_OTRO_MD' ).
    lo_primitive_property->set_edm_name( 'RetencionOtroMd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOTAL_MD' ).
    lo_primitive_property->set_edm_name( 'TotalMd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_header.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'HEADER'
                                    is_structure              = VALUE tys_header( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'header' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'HEADER_SET' ).
    lo_entity_set->set_edm_name( 'headerSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY' ).
    lo_primitive_property->set_edm_name( 'Company' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_FROM' ).
    lo_primitive_property->set_edm_name( 'DateFrom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TO' ).
    lo_primitive_property->set_edm_name( 'DateTo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTODOCS' ).
    lo_navigation_property->set_edm_name( 'HEADERTODOCS' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'DOCS' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.
ENDCLASS.
