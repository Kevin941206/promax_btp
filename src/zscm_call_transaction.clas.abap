"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>ZCALL_TRANSACTION_SRV</em>
CLASS zscm_call_transaction DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">bdcdata</p>
      BEGIN OF tys_bdcdata,
        "! <em>Key property</em> Tcode
        tcode    TYPE c LENGTH 20,
        "! Program
        program  TYPE c LENGTH 40,
        "! Dynpro
        dynpro   TYPE c LENGTH 4,
        "! Dynbegin
        dynbegin TYPE c LENGTH 1,
        "! Fnam
        fnam     TYPE c LENGTH 132,
        "! Fval
        fval     TYPE c LENGTH 132,
      END OF tys_bdcdata,
      "! <p class="shorttext synchronized">List of bdcdata</p>
      tyt_bdcdata TYPE STANDARD TABLE OF tys_bdcdata WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">bdcmsgcoll</p>
      BEGIN OF tys_bdcmsgcoll,
        "! <em>Key property</em> Tcode
        tcode   TYPE c LENGTH 20,
        "! Dyname
        dyname  TYPE c LENGTH 40,
        "! Dynumb
        dynumb  TYPE c LENGTH 4,
        "! Msgtyp
        msgtyp  TYPE c LENGTH 1,
        "! Msgspra
        msgspra TYPE c LENGTH 2,
        "! Msgid
        msgid   TYPE c LENGTH 20,
        "! Msgnr
        msgnr   TYPE c LENGTH 3,
        "! Msgv1
        msgv_1  TYPE c LENGTH 100,
        "! Msgv2
        msgv_2  TYPE c LENGTH 100,
        "! Msgv3
        msgv_3  TYPE c LENGTH 100,
        "! Msgv4
        msgv_4  TYPE c LENGTH 100,
        "! Env
        env     TYPE c LENGTH 4,
        "! Fldname
        fldname TYPE c LENGTH 132,
      END OF tys_bdcmsgcoll,
      "! <p class="shorttext synchronized">List of bdcmsgcoll</p>
      tyt_bdcmsgcoll TYPE STANDARD TABLE OF tys_bdcmsgcoll WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">params</p>
      BEGIN OF tys_params,
        "! <em>Key property</em> Tcode
        tcode              TYPE string,
        "! Dismode
        dismode            TYPE c LENGTH 1,
        "! Updmode
        updmode            TYPE c LENGTH 1,
        "! Cattmode
        cattmode           TYPE c LENGTH 1,
        "! Defsize
        defsize            TYPE abap_bool,
        "! Racommit
        racommit           TYPE abap_bool,
        "! Nobinpt
        nobinpt            TYPE abap_bool,
        "! Nobiend
        nobiend            TYPE abap_bool,
        paramstobdcdatanav TYPE TABLE OF tys_bdcdata WITH DEFAULT KEY,
        paramstomsg        TYPE TABLE OF tys_bdcmsgcoll WITH DEFAULT KEY,
      END OF tys_params,
      "! <p class="shorttext synchronized">List of params</p>
      tyt_params TYPE STANDARD TABLE OF tys_params WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! bdcdataSet
        "! <br/> Collection of type 'bdcdata'
        bdcdata_set    TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'BDCDATA_SET',
        "! bdcmsgcollSet
        "! <br/> Collection of type 'bdcmsgcoll'
        bdcmsgcoll_set TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'BDCMSGCOLL_SET',
        "! paramsSet
        "! <br/> Collection of type 'params'
        params_set     TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'PARAMS_SET',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for bdcdata</p>
        "! See also structure type {@link ..tys_bdcdata}
        BEGIN OF bdcdata,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF bdcdata,
        "! <p class="shorttext synchronized">Internal names for bdcmsgcoll</p>
        "! See also structure type {@link ..tys_bdcmsgcoll}
        BEGIN OF bdcmsgcoll,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF bdcmsgcoll,
        "! <p class="shorttext synchronized">Internal names for params</p>
        "! See also structure type {@link ..tys_params}
        BEGIN OF params,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! PARAMSTOBDCDATANAV
            paramstobdcdatanav TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PARAMSTOBDCDATANAV',
            "! PARAMSTOMSG
            paramstomsg        TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PARAMSTOMSG',
          END OF navigation,
        END OF params,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define bdcdata</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_bdcdata RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define bdcmsgcoll</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_bdcmsgcoll RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define params</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_params RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSCM_CALL_TRANSACTION IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'ZCALL_TRANSACTION_SRV' ) ##NO_TEXT.

    def_bdcdata( ).
    def_bdcmsgcoll( ).
    def_params( ).

  ENDMETHOD.


  METHOD def_bdcdata.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'BDCDATA'
                                    is_structure              = VALUE tys_bdcdata( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'bdcdata' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'BDCDATA_SET' ).
    lo_entity_set->set_edm_name( 'bdcdataSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'TCODE' ).
    lo_primitive_property->set_edm_name( 'Tcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROGRAM' ).
    lo_primitive_property->set_edm_name( 'Program' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DYNPRO' ).
    lo_primitive_property->set_edm_name( 'Dynpro' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DYNBEGIN' ).
    lo_primitive_property->set_edm_name( 'Dynbegin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FNAM' ).
    lo_primitive_property->set_edm_name( 'Fnam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 132 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FVAL' ).
    lo_primitive_property->set_edm_name( 'Fval' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 132 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_bdcmsgcoll.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'BDCMSGCOLL'
                                    is_structure              = VALUE tys_bdcmsgcoll( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'bdcmsgcoll' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'BDCMSGCOLL_SET' ).
    lo_entity_set->set_edm_name( 'bdcmsgcollSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'TCODE' ).
    lo_primitive_property->set_edm_name( 'Tcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DYNAME' ).
    lo_primitive_property->set_edm_name( 'Dyname' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DYNUMB' ).
    lo_primitive_property->set_edm_name( 'Dynumb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSGTYP' ).
    lo_primitive_property->set_edm_name( 'Msgtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSGSPRA' ).
    lo_primitive_property->set_edm_name( 'Msgspra' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSGID' ).
    lo_primitive_property->set_edm_name( 'Msgid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSGNR' ).
    lo_primitive_property->set_edm_name( 'Msgnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSGV_1' ).
    lo_primitive_property->set_edm_name( 'Msgv1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 100 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSGV_2' ).
    lo_primitive_property->set_edm_name( 'Msgv2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 100 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSGV_3' ).
    lo_primitive_property->set_edm_name( 'Msgv3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 100 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSGV_4' ).
    lo_primitive_property->set_edm_name( 'Msgv4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 100 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENV' ).
    lo_primitive_property->set_edm_name( 'Env' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLDNAME' ).
    lo_primitive_property->set_edm_name( 'Fldname' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 132 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_params.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'PARAMS'
                                    is_structure              = VALUE tys_params( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'params' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'PARAMS_SET' ).
    lo_entity_set->set_edm_name( 'paramsSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'TCODE' ).
    lo_primitive_property->set_edm_name( 'Tcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISMODE' ).
    lo_primitive_property->set_edm_name( 'Dismode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPDMODE' ).
    lo_primitive_property->set_edm_name( 'Updmode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CATTMODE' ).
    lo_primitive_property->set_edm_name( 'Cattmode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEFSIZE' ).
    lo_primitive_property->set_edm_name( 'Defsize' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RACOMMIT' ).
    lo_primitive_property->set_edm_name( 'Racommit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NOBINPT' ).
    lo_primitive_property->set_edm_name( 'Nobinpt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NOBIEND' ).
    lo_primitive_property->set_edm_name( 'Nobiend' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PARAMSTOBDCDATANAV' ).
    lo_navigation_property->set_edm_name( 'PARAMSTOBDCDATANAV' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'BDCDATA' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PARAMSTOMSG' ).
    lo_navigation_property->set_edm_name( 'PARAMSTOMSG' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'BDCMSGCOLL' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.
ENDCLASS.
