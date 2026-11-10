"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>ZFM_BAPI_BUPR_CONTP_CREATE_SRV</em>
CLASS zscm_bapi_bupr_contp_create DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">centralData</p>
      BEGIN OF tys_central_data,
        "! <em>Key property</em> DateTime
        date_time      TYPE string,
        "! Functionname
        functionname   TYPE c LENGTH 40,
        "! Function
        function       TYPE c LENGTH 4,
        "! Departmentname
        departmentname TYPE c LENGTH 40,
        "! Department
        department     TYPE c LENGTH 4,
        "! Authority
        authority      TYPE c LENGTH 1,
        "! Vip
        vip            TYPE c LENGTH 1,
        "! Comments
        comments       TYPE c LENGTH 40,
        "! Tel1Numbr
        tel_1_numbr    TYPE c LENGTH 30,
        "! Tel1Ext
        tel_1_ext      TYPE c LENGTH 10,
        "! FaxNumber
        fax_number     TYPE c LENGTH 30,
        "! FaxExtens
        fax_extens     TYPE c LENGTH 10,
        "! EMail
        email          TYPE c LENGTH 241,
      END OF tys_central_data,
      "! <p class="shorttext synchronized">List of centralData</p>
      tyt_central_data TYPE STANDARD TABLE OF tys_central_data WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">header</p>
      BEGIN OF tys_header,
        "! <em>Key property</em> DateTime
        date_time      TYPE string,
        "! Partner
        partner        TYPE c LENGTH 10,
        "! ContactPerson
        contact_person TYPE c LENGTH 10,
        "! ValidFrom
        valid_from     TYPE c LENGTH 10,
        "! ValidTo
        valid_to       TYPE c LENGTH 10,
        "! DefaultRel
        default_rel    TYPE c LENGTH 1,
      END OF tys_header,
      "! <p class="shorttext synchronized">List of header</p>
      tyt_header TYPE STANDARD TABLE OF tys_header WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">return</p>
      BEGIN OF tys_return,
        "! <em>Key property</em> Type
        type        TYPE c LENGTH 1,
        "! <em>Key property</em> Id
        id          TYPE c LENGTH 20,
        "! <em>Key property</em> Number
        number      TYPE c LENGTH 3,
        "! Message
        message     TYPE c LENGTH 220,
        "! LogNo
        log_no      TYPE c LENGTH 20,
        "! LogMsgNo
        log_msg_no  TYPE c LENGTH 6,
        "! MessageV1
        message_v_1 TYPE c LENGTH 50,
        "! MessageV2
        message_v_2 TYPE c LENGTH 50,
        "! MessageV3
        message_v_3 TYPE c LENGTH 50,
        "! MessageV4
        message_v_4 TYPE c LENGTH 50,
        "! Parameter
        parameter   TYPE c LENGTH 32,
        "! Row
        row         TYPE int4,
        "! Field
        field       TYPE c LENGTH 30,
        "! System
        system      TYPE c LENGTH 10,
      END OF tys_return,
      "! <p class="shorttext synchronized">List of return</p>
      tyt_return TYPE STANDARD TABLE OF tys_return WITH DEFAULT KEY.

    TYPES: BEGIN OF ty_deep,
             date_time           TYPE string,
             "! Partner
             partner             TYPE c LENGTH 10,
             "! ContactPerson
             contact_person      TYPE c LENGTH 10,
             "! ValidFrom
             valid_from          TYPE c LENGTH 10,
             "! ValidTo
             valid_to            TYPE c LENGTH 10,
             "! DefaultRel
             default_rel         TYPE c LENGTH 1,
             headertocentraldata TYPE TABLE OF tys_central_data WITH DEFAULT KEY,
             headertoreturn      TYPE TABLE OF tys_return WITH DEFAULT KEY,
           END OF ty_deep.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! centralDataSet
        "! <br/> Collection of type 'centralData'
        central_data_set TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'CENTRAL_DATA_SET',
        "! headerSet
        "! <br/> Collection of type 'header'
        header_set       TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'HEADER_SET',
        "! returnSet
        "! <br/> Collection of type 'return'
        return_set       TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'RETURN_SET',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for centralData</p>
        "! See also structure type {@link ..tys_central_data}
        BEGIN OF central_data,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF central_data,
        "! <p class="shorttext synchronized">Internal names for header</p>
        "! See also structure type {@link ..tys_header}
        BEGIN OF header,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! HEADERTOCENTRALDATA
            headertocentraldata TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOCENTRALDATA',
            "! HEADERTORETURN
            headertoreturn      TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTORETURN',
          END OF navigation,
        END OF header,
        "! <p class="shorttext synchronized">Internal names for return</p>
        "! See also structure type {@link ..tys_return}
        BEGIN OF return,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF return,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define centralData</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_central_data RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define header</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_header RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define return</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_return RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSCM_BAPI_BUPR_CONTP_CREATE IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'ZFM_BAPI_BUPR_CONTP_CREATE_SRV' ) ##NO_TEXT.

    def_central_data( ).
    def_header( ).
    def_return( ).

  ENDMETHOD.


  METHOD def_central_data.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'CENTRAL_DATA'
                                    is_structure              = VALUE tys_central_data( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'centralData' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'CENTRAL_DATA_SET' ).
    lo_entity_set->set_edm_name( 'centralDataSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNCTIONNAME' ).
    lo_primitive_property->set_edm_name( 'Functionname' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNCTION' ).
    lo_primitive_property->set_edm_name( 'Function' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEPARTMENTNAME' ).
    lo_primitive_property->set_edm_name( 'Departmentname' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEPARTMENT' ).
    lo_primitive_property->set_edm_name( 'Department' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUTHORITY' ).
    lo_primitive_property->set_edm_name( 'Authority' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VIP' ).
    lo_primitive_property->set_edm_name( 'Vip' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMMENTS' ).
    lo_primitive_property->set_edm_name( 'Comments' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEL_1_NUMBR' ).
    lo_primitive_property->set_edm_name( 'Tel1Numbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEL_1_EXT' ).
    lo_primitive_property->set_edm_name( 'Tel1Ext' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAX_NUMBER' ).
    lo_primitive_property->set_edm_name( 'FaxNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAX_EXTENS' ).
    lo_primitive_property->set_edm_name( 'FaxExtens' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMAIL' ).
    lo_primitive_property->set_edm_name( 'EMail' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 241 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER' ).
    lo_primitive_property->set_edm_name( 'Partner' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTACT_PERSON' ).
    lo_primitive_property->set_edm_name( 'ContactPerson' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALID_FROM' ).
    lo_primitive_property->set_edm_name( 'ValidFrom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALID_TO' ).
    lo_primitive_property->set_edm_name( 'ValidTo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEFAULT_REL' ).
    lo_primitive_property->set_edm_name( 'DefaultRel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOCENTRALDATA' ).
    lo_navigation_property->set_edm_name( 'HEADERTOCENTRALDATA' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'CENTRAL_DATA' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTORETURN' ).
    lo_navigation_property->set_edm_name( 'HEADERTORETURN' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'RETURN' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


  METHOD def_return.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'RETURN'
                                    is_structure              = VALUE tys_return( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'return' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'RETURN_SET' ).
    lo_entity_set->set_edm_name( 'returnSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'TYPE' ).
    lo_primitive_property->set_edm_name( 'Type' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NUMBER' ).
    lo_primitive_property->set_edm_name( 'Number' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE' ).
    lo_primitive_property->set_edm_name( 'Message' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 220 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOG_NO' ).
    lo_primitive_property->set_edm_name( 'LogNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOG_MSG_NO' ).
    lo_primitive_property->set_edm_name( 'LogMsgNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE_V_1' ).
    lo_primitive_property->set_edm_name( 'MessageV1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE_V_2' ).
    lo_primitive_property->set_edm_name( 'MessageV2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE_V_3' ).
    lo_primitive_property->set_edm_name( 'MessageV3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE_V_4' ).
    lo_primitive_property->set_edm_name( 'MessageV4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARAMETER' ).
    lo_primitive_property->set_edm_name( 'Parameter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROW' ).
    lo_primitive_property->set_edm_name( 'Row' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIELD' ).
    lo_primitive_property->set_edm_name( 'Field' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SYSTEM' ).
    lo_primitive_property->set_edm_name( 'System' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

  ENDMETHOD.
ENDCLASS.
