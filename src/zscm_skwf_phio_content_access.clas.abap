"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>ZFM_SKWF_PHIO_CONTENT_ACCESS_SRV</em>
CLASS zscm_skwf_phio_content_access DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">base64</p>
      BEGIN OF tys_base_64,
        "! <em>Key property</em> DateTime
        date_time TYPE string,
        "! Text
        text      TYPE string,
      END OF tys_base_64,
      "! <p class="shorttext synchronized">List of base64</p>
      tyt_base_64 TYPE STANDARD TABLE OF tys_base_64 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">component</p>
      BEGIN OF tys_component,
        "! <em>Key property</em> DateTime
        date_time  TYPE string,
        "! FileName
        file_name  TYPE c LENGTH 255,
        "! Property
        property   TYPE c LENGTH 4,
        "! FileSize
        file_size  TYPE c LENGTH 12,
        "! BinaryFlg
        binary_flg TYPE abap_bool,
        "! FirstLine
        first_line TYPE c LENGTH 12,
        "! LastLine
        last_line  TYPE c LENGTH 12,
        "! Mimetype
        mimetype   TYPE c LENGTH 128,
        "! HttpUri
        http_uri   TYPE string,
        "! HttpsUri
        https_uri  TYPE string,
      END OF tys_component,
      "! <p class="shorttext synchronized">List of component</p>
      tyt_component TYPE STANDARD TABLE OF tys_component WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">content</p>
      BEGIN OF tys_content,
        "! <em>Key property</em> DateTime
        date_time TYPE string,
        "! Line
        line      TYPE xstring,
      END OF tys_content,
      "! <p class="shorttext synchronized">List of content</p>
      tyt_content TYPE STANDARD TABLE OF tys_content WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">header</p>
      BEGIN OF tys_header,
        "! <em>Key property</em> DateTime
        date_time TYPE string,
        "! Objtype
        objtype   TYPE c LENGTH 1,
        "! Class
        class     TYPE c LENGTH 10,
        "! Objid
        objid     TYPE c LENGTH 32,
      END OF tys_header,
      "! <p class="shorttext synchronized">List of header</p>
      tyt_header TYPE STANDARD TABLE OF tys_header WITH DEFAULT KEY.

    TYPES: BEGIN OF ty_deep,
             date_time         TYPE string,
             "! Objtype
             objtype           TYPE c LENGTH 1,
             "! Class
             class             TYPE c LENGTH 10,
             "! Objid
             objid             TYPE c LENGTH 32,
             headertocomponent TYPE TABLE OF tys_component WITH DEFAULT KEY,
             headertocontent   TYPE TABLE OF tys_content WITH DEFAULT KEY,
             headertobase_64   TYPE TABLE OF tys_base_64 WITH DEFAULT KEY,
           END OF ty_deep.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! base64Set
        "! <br/> Collection of type 'base64'
        base_64_set   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'BASE_64_SET',
        "! componentSet
        "! <br/> Collection of type 'component'
        component_set TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'COMPONENT_SET',
        "! contentSet
        "! <br/> Collection of type 'content'
        content_set   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'CONTENT_SET',
        "! headerSet
        "! <br/> Collection of type 'header'
        header_set    TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'HEADER_SET',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for base64</p>
        "! See also structure type {@link ..tys_base_64}
        BEGIN OF base_64,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF base_64,
        "! <p class="shorttext synchronized">Internal names for component</p>
        "! See also structure type {@link ..tys_component}
        BEGIN OF component,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF component,
        "! <p class="shorttext synchronized">Internal names for content</p>
        "! See also structure type {@link ..tys_content}
        BEGIN OF content,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF content,
        "! <p class="shorttext synchronized">Internal names for header</p>
        "! See also structure type {@link ..tys_header}
        BEGIN OF header,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! HEADERTOBASE64
            headertobase_64   TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOBASE_64',
            "! HEADERTOCOMPONENT
            headertocomponent TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOCOMPONENT',
            "! HEADERTOCONTENT
            headertocontent   TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOCONTENT',
          END OF navigation,
        END OF header,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define base64</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_base_64 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define component</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_component RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define content</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_content RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define header</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_header RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSCM_SKWF_PHIO_CONTENT_ACCESS IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'ZFM_SKWF_PHIO_CONTENT_ACCESS_SRV' ) ##NO_TEXT.

    def_base_64( ).
    def_component( ).
    def_content( ).
    def_header( ).

  ENDMETHOD.


  METHOD def_base_64.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'BASE_64'
                                    is_structure              = VALUE tys_base_64( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'base64' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'BASE_64_SET' ).
    lo_entity_set->set_edm_name( 'base64Set' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEXT' ).
    lo_primitive_property->set_edm_name( 'Text' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_component.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'COMPONENT'
                                    is_structure              = VALUE tys_component( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'component' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'COMPONENT_SET' ).
    lo_entity_set->set_edm_name( 'componentSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FILE_NAME' ).
    lo_primitive_property->set_edm_name( 'FileName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROPERTY' ).
    lo_primitive_property->set_edm_name( 'Property' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FILE_SIZE' ).
    lo_primitive_property->set_edm_name( 'FileSize' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BINARY_FLG' ).
    lo_primitive_property->set_edm_name( 'BinaryFlg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIRST_LINE' ).
    lo_primitive_property->set_edm_name( 'FirstLine' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAST_LINE' ).
    lo_primitive_property->set_edm_name( 'LastLine' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MIMETYPE' ).
    lo_primitive_property->set_edm_name( 'Mimetype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 128 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HTTP_URI' ).
    lo_primitive_property->set_edm_name( 'HttpUri' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4096 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HTTPS_URI' ).
    lo_primitive_property->set_edm_name( 'HttpsUri' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4096 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_content.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'CONTENT'
                                    is_structure              = VALUE tys_content( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'content' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'CONTENT_SET' ).
    lo_entity_set->set_edm_name( 'contentSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LINE' ).
    lo_primitive_property->set_edm_name( 'Line' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Binary' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1022 ) ##NUMBER_OK.

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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OBJTYPE' ).
    lo_primitive_property->set_edm_name( 'Objtype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CLASS' ).
    lo_primitive_property->set_edm_name( 'Class' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OBJID' ).
    lo_primitive_property->set_edm_name( 'Objid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOBASE_64' ).
    lo_navigation_property->set_edm_name( 'HEADERTOBASE64' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'BASE_64' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOCOMPONENT' ).
    lo_navigation_property->set_edm_name( 'HEADERTOCOMPONENT' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'COMPONENT' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOCONTENT' ).
    lo_navigation_property->set_edm_name( 'HEADERTOCONTENT' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'CONTENT' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.
ENDCLASS.
