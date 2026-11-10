"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>cds_zsd_c_all_ext_bkpf</em>
CLASS zscm_ext_bkpf DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">SAP__FitToPage</p>
      BEGIN OF tys_sap_fit_to_page,
        "! ErrorRecoveryBehavior
        error_recovery_behavior TYPE c LENGTH 8,
        "! IsEnabled
        is_enabled              TYPE abap_bool,
        "! MinimumFontSize
        minimum_font_size       TYPE int4,
      END OF tys_sap_fit_to_page,
      "! <p class="shorttext synchronized">List of SAP__FitToPage</p>
      tyt_sap_fit_to_page TYPE STANDARD TABLE OF tys_sap_fit_to_page WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__CoverPage</p>
      BEGIN OF tys_sap_cover_page,
        "! <em>Key property</em> Title
        title TYPE c LENGTH 256,
        "! <em>Key property</em> Id
        id    TYPE sysuuid_x16,
        "! <em>Key property</em> Name
        name  TYPE c LENGTH 256,
        "! Value
        value TYPE c LENGTH 256,
      END OF tys_sap_cover_page,
      "! <p class="shorttext synchronized">List of SAP__CoverPage</p>
      tyt_sap_cover_page TYPE STANDARD TABLE OF tys_sap_cover_page WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__Currency</p>
      BEGIN OF tys_sap_currency,
        "! <em>Key property</em> CurrencyCode
        currency_code  TYPE c LENGTH 5,
        "! ISOCode
        isocode        TYPE c LENGTH 3,
        "! Text
        text           TYPE c LENGTH 15,
        "! DecimalPlaces
        decimal_places TYPE int1,
      END OF tys_sap_currency,
      "! <p class="shorttext synchronized">List of SAP__Currency</p>
      tyt_sap_currency TYPE STANDARD TABLE OF tys_sap_currency WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__DocumentDescription</p>
      BEGIN OF tys_sap_document_description,
        "! <em>Key property</em> Id
        id         TYPE sysuuid_x16,
        "! CreatedBy
        created_by TYPE c LENGTH 12,
        "! CreatedAt
        created_at TYPE timestamp,
        "! FileName
        file_name  TYPE c LENGTH 256,
        "! Title
        title      TYPE c LENGTH 256,
      END OF tys_sap_document_description,
      "! <p class="shorttext synchronized">List of SAP__DocumentDescription</p>
      tyt_sap_document_description TYPE STANDARD TABLE OF tys_sap_document_description WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__Format</p>
      BEGIN OF tys_sap_format,
        "! FitToPage
        fit_to_page TYPE tys_sap_fit_to_page,
        "! <em>Key property</em> Id
        id          TYPE sysuuid_x16,
        "! FontSize
        font_size   TYPE int4,
        "! Orientation
        orientation TYPE c LENGTH 10,
        "! PaperSize
        paper_size  TYPE c LENGTH 10,
        "! BorderSize
        border_size TYPE int4,
        "! MarginSize
        margin_size TYPE int4,
        "! FontName
        font_name   TYPE c LENGTH 255,
      END OF tys_sap_format,
      "! <p class="shorttext synchronized">List of SAP__Format</p>
      tyt_sap_format TYPE STANDARD TABLE OF tys_sap_format WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__PDFStandard</p>
      BEGIN OF tys_sap_pdfstandard,
        "! <em>Key property</em> Id
        id                      TYPE sysuuid_x16,
        "! UsePDFAConformance
        use_pdfaconformance     TYPE abap_bool,
        "! DoEnableAccessibility
        do_enable_accessibility TYPE abap_bool,
      END OF tys_sap_pdfstandard,
      "! <p class="shorttext synchronized">List of SAP__PDFStandard</p>
      tyt_sap_pdfstandard TYPE STANDARD TABLE OF tys_sap_pdfstandard WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__Signature</p>
      BEGIN OF tys_sap_signature,
        "! <em>Key property</em> Id
        id      TYPE sysuuid_x16,
        "! DoSign
        do_sign TYPE abap_bool,
        "! Reason
        reason  TYPE c LENGTH 256,
      END OF tys_sap_signature,
      "! <p class="shorttext synchronized">List of SAP__Signature</p>
      tyt_sap_signature TYPE STANDARD TABLE OF tys_sap_signature WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__TableColumns</p>
      BEGIN OF tys_sap_table_columns,
        "! <em>Key property</em> Id
        id                   TYPE sysuuid_x16,
        "! <em>Key property</em> Name
        name                 TYPE c LENGTH 256,
        "! <em>Key property</em> Header
        header               TYPE c LENGTH 256,
        "! HorizontalAlignment
        horizontal_alignment TYPE c LENGTH 10,
      END OF tys_sap_table_columns,
      "! <p class="shorttext synchronized">List of SAP__TableColumns</p>
      tyt_sap_table_columns TYPE STANDARD TABLE OF tys_sap_table_columns WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__UnitOfMeasure</p>
      BEGIN OF tys_sap_unit_of_measure,
        "! <em>Key property</em> UnitCode
        unit_code      TYPE c LENGTH 3,
        "! ISOCode
        isocode        TYPE c LENGTH 3,
        "! ExternalCode
        external_code  TYPE c LENGTH 3,
        "! Text
        text           TYPE c LENGTH 30,
        "! DecimalPlaces
        decimal_places TYPE int2,
      END OF tys_sap_unit_of_measure,
      "! <p class="shorttext synchronized">List of SAP__UnitOfMeasure</p>
      tyt_sap_unit_of_measure TYPE STANDARD TABLE OF tys_sap_unit_of_measure WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__ValueHelp</p>
      BEGIN OF tys_sap_value_help,
        "! <em>Key property</em> VALUEHELP
        valuehelp   TYPE string,
        "! FIELD_VALUE
        field_value TYPE c LENGTH 10,
        "! DESCRIPTION
        description TYPE string,
      END OF tys_sap_value_help,
      "! <p class="shorttext synchronized">List of SAP__ValueHelp</p>
      tyt_sap_value_help TYPE STANDARD TABLE OF tys_sap_value_help WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">ZCDS_C_ALL_EXT_BKPFType</p>
      BEGIN OF tys_zcds_c_all_ext_bkpftype,
        "! <em>Key property</em> Bukrs
        bukrs  TYPE c LENGTH 4,
        "! <em>Key property</em> Belnr
        belnr  TYPE c LENGTH 10,
        "! <em>Key property</em> Gjahr
        gjahr  TYPE c LENGTH 4,
        "! Blart
        blart  TYPE c LENGTH 2,
        "! Bldat
        bldat  TYPE datn,
        "! Budat
        budat  TYPE datn,
        "! Monat
        monat  TYPE c LENGTH 2,
        "! Cpudt
        cpudt  TYPE datn,
        "! Aedat
        aedat  TYPE datn,
        "! Cputm
        cputm  TYPE timn,
        "! Xblnr
        xblnr  TYPE c LENGTH 16,
        "! Bktxt
        bktxt  TYPE c LENGTH 25,
        "! Waers
        waers  TYPE c LENGTH 5,
        "! Usnam
        usnam  TYPE c LENGTH 12,
        "! Zuonr
        zuonr  TYPE c LENGTH 18,
        "! Sgtxt
        sgtxt  TYPE c LENGTH 50,
        "! Lifnr
        lifnr  TYPE c LENGTH 10,
        "! Wrbtr
        wrbtr  TYPE p LENGTH 7 DECIMALS 3,
        "! Stcd1
        stcd_1 TYPE c LENGTH 16,
      END OF tys_zcds_c_all_ext_bkpftype,
      "! <p class="shorttext synchronized">List of ZCDS_C_ALL_EXT_BKPFType</p>
      tyt_zcds_c_all_ext_bkpftype TYPE STANDARD TABLE OF tys_zcds_c_all_ext_bkpftype WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! SAP__CoverPageSet
        "! <br/> Collection of type 'SAP__CoverPage'
        sap_cover_page_set         TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_COVER_PAGE_SET',
        "! SAP__Currencies
        "! <br/> Collection of type 'SAP__Currency'
        sap_currencies             TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_CURRENCIES',
        "! SAP__FormatSet
        "! <br/> Collection of type 'SAP__Format'
        sap_format_set             TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_FORMAT_SET',
        "! SAP__MyDocumentDescriptions
        "! <br/> Collection of type 'SAP__DocumentDescription'
        sap_my_document_descriptio TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_MY_DOCUMENT_DESCRIPTIO',
        "! SAP__PDFStandardSet
        "! <br/> Collection of type 'SAP__PDFStandard'
        sap_pdfstandard_set        TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_PDFSTANDARD_SET',
        "! SAP__SignatureSet
        "! <br/> Collection of type 'SAP__Signature'
        sap_signature_set          TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_SIGNATURE_SET',
        "! SAP__TableColumnsSet
        "! <br/> Collection of type 'SAP__TableColumns'
        sap_table_columns_set      TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_TABLE_COLUMNS_SET',
        "! SAP__UnitsOfMeasure
        "! <br/> Collection of type 'SAP__UnitOfMeasure'
        sap_units_of_measure       TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_UNITS_OF_MEASURE',
        "! SAP__ValueHelpSet
        "! <br/> Collection of type 'SAP__ValueHelp'
        sap_value_help_set         TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_VALUE_HELP_SET',
        "! ZCDS_C_ALL_EXT_BKPF
        "! <br/> Collection of type 'ZCDS_C_ALL_EXT_BKPFType'
        zcds_c_all_ext_bkpf        TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'ZCDS_C_ALL_EXT_BKPF',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for complex types</p>
      BEGIN OF gcs_complex_type,
        "! <p class="shorttext synchronized">Internal names for SAP__FitToPage</p>
        "! See also structure type {@link ..tys_sap_fit_to_page}
        BEGIN OF sap_fit_to_page,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_fit_to_page,
      END OF gcs_complex_type.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for SAP__CoverPage</p>
        "! See also structure type {@link ..tys_sap_cover_page}
        BEGIN OF sap_cover_page,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_cover_page,
        "! <p class="shorttext synchronized">Internal names for SAP__Currency</p>
        "! See also structure type {@link ..tys_sap_currency}
        BEGIN OF sap_currency,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_currency,
        "! <p class="shorttext synchronized">Internal names for SAP__DocumentDescription</p>
        "! See also structure type {@link ..tys_sap_document_description}
        BEGIN OF sap_document_description,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! CoverPage
            cover_page    TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'COVER_PAGE',
            "! Format
            format        TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'FORMAT',
            "! PDFStandard
            pdfstandard   TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PDFSTANDARD',
            "! Signature
            signature     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'SIGNATURE',
            "! TableColumns
            table_columns TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TABLE_COLUMNS',
          END OF navigation,
        END OF sap_document_description,
        "! <p class="shorttext synchronized">Internal names for SAP__Format</p>
        "! See also structure type {@link ..tys_sap_format}
        BEGIN OF sap_format,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_format,
        "! <p class="shorttext synchronized">Internal names for SAP__PDFStandard</p>
        "! See also structure type {@link ..tys_sap_pdfstandard}
        BEGIN OF sap_pdfstandard,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_pdfstandard,
        "! <p class="shorttext synchronized">Internal names for SAP__Signature</p>
        "! See also structure type {@link ..tys_sap_signature}
        BEGIN OF sap_signature,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_signature,
        "! <p class="shorttext synchronized">Internal names for SAP__TableColumns</p>
        "! See also structure type {@link ..tys_sap_table_columns}
        BEGIN OF sap_table_columns,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_table_columns,
        "! <p class="shorttext synchronized">Internal names for SAP__UnitOfMeasure</p>
        "! See also structure type {@link ..tys_sap_unit_of_measure}
        BEGIN OF sap_unit_of_measure,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_unit_of_measure,
        "! <p class="shorttext synchronized">Internal names for SAP__ValueHelp</p>
        "! See also structure type {@link ..tys_sap_value_help}
        BEGIN OF sap_value_help,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_value_help,
        "! <p class="shorttext synchronized">Internal names for ZCDS_C_ALL_EXT_BKPFType</p>
        "! See also structure type {@link ..tys_zcds_c_all_ext_bkpftype}
        BEGIN OF zcds_c_all_ext_bkpftype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF zcds_c_all_ext_bkpftype,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define SAP__FitToPage</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_fit_to_page RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__CoverPage</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_cover_page RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__Currency</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_currency RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__DocumentDescription</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_document_description RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__Format</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_format RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__PDFStandard</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_pdfstandard RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__Signature</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_signature RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__TableColumns</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_table_columns RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__UnitOfMeasure</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_unit_of_measure RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__ValueHelp</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_value_help RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define ZCDS_C_ALL_EXT_BKPFType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_zcds_c_all_ext_bkpftype RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSCM_EXT_BKPF IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'cds_zsd_c_all_ext_bkpf' ) ##NO_TEXT.

    def_sap_fit_to_page( ).
    def_sap_cover_page( ).
    def_sap_currency( ).
    def_sap_document_description( ).
    def_sap_format( ).
    def_sap_pdfstandard( ).
    def_sap_signature( ).
    def_sap_table_columns( ).
    def_sap_unit_of_measure( ).
    def_sap_value_help( ).
    def_zcds_c_all_ext_bkpftype( ).

  ENDMETHOD.


  METHOD def_sap_cover_page.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_COVER_PAGE'
                                    is_structure              = VALUE tys_sap_cover_page( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__CoverPage' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_COVER_PAGE_SET' ).
    lo_entity_set->set_edm_name( 'SAP__CoverPageSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'TITLE' ).
    lo_primitive_property->set_edm_name( 'Title' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 256 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME' ).
    lo_primitive_property->set_edm_name( 'Name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 256 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALUE' ).
    lo_primitive_property->set_edm_name( 'Value' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 256 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_sap_currency.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_CURRENCY'
                                    is_structure              = VALUE tys_sap_currency( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__Currency' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_CURRENCIES' ).
    lo_entity_set->set_edm_name( 'SAP__Currencies' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURRENCY_CODE' ).
    lo_primitive_property->set_edm_name( 'CurrencyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ISOCODE' ).
    lo_primitive_property->set_edm_name( 'ISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEXT' ).
    lo_primitive_property->set_edm_name( 'Text' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DECIMAL_PLACES' ).
    lo_primitive_property->set_edm_name( 'DecimalPlaces' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Byte' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_sap_document_description.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_DOCUMENT_DESCRIPTION'
                                    is_structure              = VALUE tys_sap_document_description( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__DocumentDescription' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_MY_DOCUMENT_DESCRIPTIO' ).
    lo_entity_set->set_edm_name( 'SAP__MyDocumentDescriptions' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY' ).
    lo_primitive_property->set_edm_name( 'CreatedBy' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_AT' ).
    lo_primitive_property->set_edm_name( 'CreatedAt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FILE_NAME' ).
    lo_primitive_property->set_edm_name( 'FileName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 256 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TITLE' ).
    lo_primitive_property->set_edm_name( 'Title' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 256 ) ##NUMBER_OK.

    lo_navigation_property = lo_entity_type->create_navigation_property( 'COVER_PAGE' ).
    lo_navigation_property->set_edm_name( 'CoverPage' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SAP_COVER_PAGE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'FORMAT' ).
    lo_navigation_property->set_edm_name( 'Format' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SAP_FORMAT' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PDFSTANDARD' ).
    lo_navigation_property->set_edm_name( 'PDFStandard' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SAP_PDFSTANDARD' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'SIGNATURE' ).
    lo_navigation_property->set_edm_name( 'Signature' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SAP_SIGNATURE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TABLE_COLUMNS' ).
    lo_navigation_property->set_edm_name( 'TableColumns' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SAP_TABLE_COLUMNS' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


  METHOD def_sap_fit_to_page.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'SAP_FIT_TO_PAGE'
                                    is_structure              = VALUE tys_sap_fit_to_page( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'SAP__FitToPage' ) ##NO_TEXT.


    lo_primitive_property = lo_complex_type->get_primitive_property( 'ERROR_RECOVERY_BEHAVIOR' ).
    lo_primitive_property->set_edm_name( 'ErrorRecoveryBehavior' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'IS_ENABLED' ).
    lo_primitive_property->set_edm_name( 'IsEnabled' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'MINIMUM_FONT_SIZE' ).
    lo_primitive_property->set_edm_name( 'MinimumFontSize' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_sap_format.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_FORMAT'
                                    is_structure              = VALUE tys_sap_format( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__Format' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_FORMAT_SET' ).
    lo_entity_set->set_edm_name( 'SAP__FormatSet' ) ##NO_TEXT.


    lo_complex_property = lo_entity_type->create_complex_property( 'FIT_TO_PAGE' ).
    lo_complex_property->set_edm_name( 'FitToPage' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_FIT_TO_PAGE' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FONT_SIZE' ).
    lo_primitive_property->set_edm_name( 'FontSize' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORIENTATION' ).
    lo_primitive_property->set_edm_name( 'Orientation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAPER_SIZE' ).
    lo_primitive_property->set_edm_name( 'PaperSize' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BORDER_SIZE' ).
    lo_primitive_property->set_edm_name( 'BorderSize' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MARGIN_SIZE' ).
    lo_primitive_property->set_edm_name( 'MarginSize' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FONT_NAME' ).
    lo_primitive_property->set_edm_name( 'FontName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_sap_pdfstandard.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_PDFSTANDARD'
                                    is_structure              = VALUE tys_sap_pdfstandard( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__PDFStandard' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_PDFSTANDARD_SET' ).
    lo_entity_set->set_edm_name( 'SAP__PDFStandardSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'USE_PDFACONFORMANCE' ).
    lo_primitive_property->set_edm_name( 'UsePDFAConformance' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DO_ENABLE_ACCESSIBILITY' ).
    lo_primitive_property->set_edm_name( 'DoEnableAccessibility' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_sap_signature.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_SIGNATURE'
                                    is_structure              = VALUE tys_sap_signature( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__Signature' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_SIGNATURE_SET' ).
    lo_entity_set->set_edm_name( 'SAP__SignatureSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DO_SIGN' ).
    lo_primitive_property->set_edm_name( 'DoSign' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REASON' ).
    lo_primitive_property->set_edm_name( 'Reason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 256 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_sap_table_columns.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_TABLE_COLUMNS'
                                    is_structure              = VALUE tys_sap_table_columns( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__TableColumns' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_TABLE_COLUMNS_SET' ).
    lo_entity_set->set_edm_name( 'SAP__TableColumnsSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME' ).
    lo_primitive_property->set_edm_name( 'Name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 256 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HEADER' ).
    lo_primitive_property->set_edm_name( 'Header' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 256 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HORIZONTAL_ALIGNMENT' ).
    lo_primitive_property->set_edm_name( 'HorizontalAlignment' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_sap_unit_of_measure.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_UNIT_OF_MEASURE'
                                    is_structure              = VALUE tys_sap_unit_of_measure( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__UnitOfMeasure' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_UNITS_OF_MEASURE' ).
    lo_entity_set->set_edm_name( 'SAP__UnitsOfMeasure' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNIT_CODE' ).
    lo_primitive_property->set_edm_name( 'UnitCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ISOCODE' ).
    lo_primitive_property->set_edm_name( 'ISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTERNAL_CODE' ).
    lo_primitive_property->set_edm_name( 'ExternalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEXT' ).
    lo_primitive_property->set_edm_name( 'Text' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DECIMAL_PLACES' ).
    lo_primitive_property->set_edm_name( 'DecimalPlaces' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int16' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_sap_value_help.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_VALUE_HELP'
                                    is_structure              = VALUE tys_sap_value_help( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__ValueHelp' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_VALUE_HELP_SET' ).
    lo_entity_set->set_edm_name( 'SAP__ValueHelpSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALUEHELP' ).
    lo_primitive_property->set_edm_name( 'VALUEHELP' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIELD_VALUE' ).
    lo_primitive_property->set_edm_name( 'FIELD_VALUE' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DESCRIPTION' ).
    lo_primitive_property->set_edm_name( 'DESCRIPTION' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_zcds_c_all_ext_bkpftype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'ZCDS_C_ALL_EXT_BKPFTYPE'
                                    is_structure              = VALUE tys_zcds_c_all_ext_bkpftype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'ZCDS_C_ALL_EXT_BKPFType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'ZCDS_C_ALL_EXT_BKPF' ).
    lo_entity_set->set_edm_name( 'ZCDS_C_ALL_EXT_BKPF' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUKRS' ).
    lo_primitive_property->set_edm_name( 'Bukrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BELNR' ).
    lo_primitive_property->set_edm_name( 'Belnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GJAHR' ).
    lo_primitive_property->set_edm_name( 'Gjahr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLART' ).
    lo_primitive_property->set_edm_name( 'Blart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLDAT' ).
    lo_primitive_property->set_edm_name( 'Bldat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDAT' ).
    lo_primitive_property->set_edm_name( 'Budat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MONAT' ).
    lo_primitive_property->set_edm_name( 'Monat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CPUDT' ).
    lo_primitive_property->set_edm_name( 'Cpudt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AEDAT' ).
    lo_primitive_property->set_edm_name( 'Aedat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CPUTM' ).
    lo_primitive_property->set_edm_name( 'Cputm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBLNR' ).
    lo_primitive_property->set_edm_name( 'Xblnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BKTXT' ).
    lo_primitive_property->set_edm_name( 'Bktxt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAERS' ).
    lo_primitive_property->set_edm_name( 'Waers' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'USNAM' ).
    lo_primitive_property->set_edm_name( 'Usnam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZUONR' ).
    lo_primitive_property->set_edm_name( 'Zuonr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SGTXT' ).
    lo_primitive_property->set_edm_name( 'Sgtxt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFNR' ).
    lo_primitive_property->set_edm_name( 'Lifnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WRBTR' ).
    lo_primitive_property->set_edm_name( 'Wrbtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STCD_1' ).
    lo_primitive_property->set_edm_name( 'Stcd1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.
ENDCLASS.
