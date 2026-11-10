"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>ZFM_SO_OBJECT_GET_CONTENT_SRV</em>
CLASS zscm_so_object_get_content DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">header</p>
      BEGIN OF tys_header,
        "! <em>Key property</em> DataTime
        data_time TYPE string,
        "! Objtp
        objtp     TYPE c LENGTH 3,
        "! Objyr
        objyr     TYPE c LENGTH 2,
        "! Objno
        objno     TYPE c LENGTH 12,
      END OF tys_header,
      "! <p class="shorttext synchronized">List of header</p>
      tyt_header TYPE STANDARD TABLE OF tys_header WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">objcont</p>
      BEGIN OF tys_objcont,
        "! <em>Key property</em> DataTime
        data_time TYPE string,
        "! Line
        line      TYPE c LENGTH 255,
      END OF tys_objcont,
      "! <p class="shorttext synchronized">List of objcont</p>
      tyt_objcont TYPE STANDARD TABLE OF tys_objcont WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">objhead</p>
      BEGIN OF tys_objhead,
        "! <em>Key property</em> DataTime
        data_time TYPE string,
        "! Line
        line      TYPE c LENGTH 255,
      END OF tys_objhead,
      "! <p class="shorttext synchronized">List of objhead</p>
      tyt_objhead TYPE STANDARD TABLE OF tys_objhead WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">objpara</p>
      BEGIN OF tys_objpara,
        "! <em>Key property</em> DateTime
        date_time TYPE string,
        "! Name
        name      TYPE c LENGTH 8,
        "! Option
        option    TYPE c LENGTH 4,
        "! Low
        low       TYPE c LENGTH 40,
        "! High
        high      TYPE c LENGTH 40,
      END OF tys_objpara,
      "! <p class="shorttext synchronized">List of objpara</p>
      tyt_objpara TYPE STANDARD TABLE OF tys_objpara WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">objparb</p>
      BEGIN OF tys_objparb,
        "! <em>Key property</em> DateTime
        date_time TYPE string,
        "! Name
        name      TYPE c LENGTH 30,
        "! Value
        value     TYPE c LENGTH 255,
      END OF tys_objparb,
      "! <p class="shorttext synchronized">List of objparb</p>
      tyt_objparb TYPE STANDARD TABLE OF tys_objparb WITH DEFAULT KEY.

    TYPES: BEGIN OF ty_deep,
             data_time       TYPE string,
             "! Objtp
             objtp           TYPE c LENGTH 3,
             "! Objyr
             objyr           TYPE c LENGTH 2,
             "! Objno
             objno           TYPE c LENGTH 12,
             headertoobjhead TYPE TABLE OF tys_objhead WITH DEFAULT KEY,
             headertoobjcont TYPE TABLE OF tys_objcont WITH DEFAULT KEY,
             headertoobjpara TYPE TABLE OF tys_objpara WITH DEFAULT KEY,
             headertoobjparb TYPE TABLE OF tys_objparb WITH DEFAULT KEY,
           END OF ty_deep.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! headerSet
        "! <br/> Collection of type 'header'
        header_set  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'HEADER_SET',
        "! objcontSet
        "! <br/> Collection of type 'objcont'
        objcont_set TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'OBJCONT_SET',
        "! objheadSet
        "! <br/> Collection of type 'objhead'
        objhead_set TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'OBJHEAD_SET',
        "! objparaSet
        "! <br/> Collection of type 'objpara'
        objpara_set TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'OBJPARA_SET',
        "! objparbSet
        "! <br/> Collection of type 'objparb'
        objparb_set TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'OBJPARB_SET',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for header</p>
        "! See also structure type {@link ..tys_header}
        BEGIN OF header,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! HEADERTOOBJCONT
            headertoobjcont TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOOBJCONT',
            "! HEADERTOOBJHEAD
            headertoobjhead TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOOBJHEAD',
            "! HEADERTOOBJPARA
            headertoobjpara TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOOBJPARA',
            "! HEADERTOOBJPARB
            headertoobjparb TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOOBJPARB',
          END OF navigation,
        END OF header,
        "! <p class="shorttext synchronized">Internal names for objcont</p>
        "! See also structure type {@link ..tys_objcont}
        BEGIN OF objcont,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF objcont,
        "! <p class="shorttext synchronized">Internal names for objhead</p>
        "! See also structure type {@link ..tys_objhead}
        BEGIN OF objhead,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF objhead,
        "! <p class="shorttext synchronized">Internal names for objpara</p>
        "! See also structure type {@link ..tys_objpara}
        BEGIN OF objpara,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF objpara,
        "! <p class="shorttext synchronized">Internal names for objparb</p>
        "! See also structure type {@link ..tys_objparb}
        BEGIN OF objparb,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF objparb,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define header</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_header RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define objcont</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_objcont RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define objhead</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_objhead RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define objpara</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_objpara RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define objparb</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_objparb RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSCM_SO_OBJECT_GET_CONTENT IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'ZFM_SO_OBJECT_GET_CONTENT_SRV' ) ##NO_TEXT.

    def_header( ).
    def_objcont( ).
    def_objhead( ).
    def_objpara( ).
    def_objparb( ).

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


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATA_TIME' ).
    lo_primitive_property->set_edm_name( 'DataTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OBJTP' ).
    lo_primitive_property->set_edm_name( 'Objtp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OBJYR' ).
    lo_primitive_property->set_edm_name( 'Objyr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OBJNO' ).
    lo_primitive_property->set_edm_name( 'Objno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOOBJCONT' ).
    lo_navigation_property->set_edm_name( 'HEADERTOOBJCONT' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'OBJCONT' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOOBJHEAD' ).
    lo_navigation_property->set_edm_name( 'HEADERTOOBJHEAD' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'OBJHEAD' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOOBJPARA' ).
    lo_navigation_property->set_edm_name( 'HEADERTOOBJPARA' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'OBJPARA' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOOBJPARB' ).
    lo_navigation_property->set_edm_name( 'HEADERTOOBJPARB' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'OBJPARB' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


  METHOD def_objcont.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'OBJCONT'
                                    is_structure              = VALUE tys_objcont( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'objcont' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'OBJCONT_SET' ).
    lo_entity_set->set_edm_name( 'objcontSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATA_TIME' ).
    lo_primitive_property->set_edm_name( 'DataTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LINE' ).
    lo_primitive_property->set_edm_name( 'Line' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_objhead.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'OBJHEAD'
                                    is_structure              = VALUE tys_objhead( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'objhead' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'OBJHEAD_SET' ).
    lo_entity_set->set_edm_name( 'objheadSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATA_TIME' ).
    lo_primitive_property->set_edm_name( 'DataTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LINE' ).
    lo_primitive_property->set_edm_name( 'Line' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_objpara.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'OBJPARA'
                                    is_structure              = VALUE tys_objpara( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'objpara' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'OBJPARA_SET' ).
    lo_entity_set->set_edm_name( 'objparaSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME' ).
    lo_primitive_property->set_edm_name( 'Name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OPTION' ).
    lo_primitive_property->set_edm_name( 'Option' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOW' ).
    lo_primitive_property->set_edm_name( 'Low' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HIGH' ).
    lo_primitive_property->set_edm_name( 'High' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_objparb.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'OBJPARB'
                                    is_structure              = VALUE tys_objparb( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'objparb' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'OBJPARB_SET' ).
    lo_entity_set->set_edm_name( 'objparbSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME' ).
    lo_primitive_property->set_edm_name( 'Name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALUE' ).
    lo_primitive_property->set_edm_name( 'Value' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.

  ENDMETHOD.
ENDCLASS.
