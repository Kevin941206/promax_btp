"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>ZFM_BAPI_BUPA_BANKDETAIL_ADD_SRV</em>
CLASS zscm_bapi_bupa_bankdetail_add DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">bankDetail</p>
      BEGIN OF tys_bank_detail,
        "! <em>Key property</em> DateTime
        date_time           TYPE string,
        "! BankCtry
        bank_ctry           TYPE c LENGTH 3,
        "! BankCtryiso
        bank_ctryiso        TYPE c LENGTH 2,
        "! BankKey
        bank_key            TYPE c LENGTH 15,
        "! BankAcct
        bank_acct           TYPE c LENGTH 18,
        "! CtrlKey
        ctrl_key            TYPE c LENGTH 2,
        "! BankRef
        bank_ref            TYPE c LENGTH 20,
        "! Accountholder
        accountholder       TYPE c LENGTH 60,
        "! CollAuth
        coll_auth           TYPE abap_bool,
        "! Externalbankid
        externalbankid      TYPE c LENGTH 20,
        "! Bankaccountname
        bankaccountname     TYPE c LENGTH 40,
        "! Iban
        iban                TYPE c LENGTH 34,
        "! IbanFromDate
        iban_from_date      TYPE timestampl,
        "! Bankdetailvalidfrom
        bankdetailvalidfrom TYPE timestampl,
        "! Bankdetailvalidto
        bankdetailvalidto   TYPE timestampl,
        "! Bankdetailmovedate
        bankdetailmovedate  TYPE timestampl,
        "! Bankdetailmoveid
        bankdetailmoveid    TYPE c LENGTH 4,
        "! BankAccountType
        bank_account_type   TYPE c LENGTH 3,
        "! BpBankGuid
        bp_bank_guid        TYPE sysuuid_x16,
        "! PaymentSystem
        payment_system      TYPE c LENGTH 15,
        "! AliasType
        alias_type          TYPE c LENGTH 15,
        "! BankAlias
        bank_alias          TYPE c LENGTH 255,
      END OF tys_bank_detail,
      "! <p class="shorttext synchronized">List of bankDetail</p>
      tyt_bank_detail TYPE STANDARD TABLE OF tys_bank_detail WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">header</p>
      BEGIN OF tys_header,
        "! <em>Key property</em> DateTime
        date_time TYPE string,
        "! Id
        id        TYPE c LENGTH 4,
        "! Partner
        partner   TYPE c LENGTH 10,
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
             date_time          TYPE string,
             "! Id
             id                 TYPE c LENGTH 4,
             "! Partner
             partner            TYPE c LENGTH 10,
             headertobankdetail TYPE TABLE OF tys_bank_detail WITH DEFAULT KEY,
             headertoreturn     TYPE TABLE OF tys_return WITH DEFAULT KEY,
           END OF ty_deep.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! bankDetailSet
        "! <br/> Collection of type 'bankDetail'
        bank_detail_set TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'BANK_DETAIL_SET',
        "! headerSet
        "! <br/> Collection of type 'header'
        header_set      TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'HEADER_SET',
        "! returnSet
        "! <br/> Collection of type 'return'
        return_set      TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'RETURN_SET',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for bankDetail</p>
        "! See also structure type {@link ..tys_bank_detail}
        BEGIN OF bank_detail,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF bank_detail,
        "! <p class="shorttext synchronized">Internal names for header</p>
        "! See also structure type {@link ..tys_header}
        BEGIN OF header,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! HEADERTOBANKDETAIL
            headertobankdetail TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOBANKDETAIL',
            "! HEADERTORETURN
            headertoreturn     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTORETURN',
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


    "! <p class="shorttext synchronized">Define bankDetail</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_bank_detail RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define header</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_header RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define return</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_return RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSCM_BAPI_BUPA_BANKDETAIL_ADD IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'ZFM_BAPI_BUPA_BANKDETAIL_ADD_SRV' ) ##NO_TEXT.

    def_bank_detail( ).
    def_header( ).
    def_return( ).

  ENDMETHOD.


  METHOD def_bank_detail.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'BANK_DETAIL'
                                    is_structure              = VALUE tys_bank_detail( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'bankDetail' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'BANK_DETAIL_SET' ).
    lo_entity_set->set_edm_name( 'bankDetailSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANK_CTRY' ).
    lo_primitive_property->set_edm_name( 'BankCtry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANK_CTRYISO' ).
    lo_primitive_property->set_edm_name( 'BankCtryiso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANK_KEY' ).
    lo_primitive_property->set_edm_name( 'BankKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANK_ACCT' ).
    lo_primitive_property->set_edm_name( 'BankAcct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CTRL_KEY' ).
    lo_primitive_property->set_edm_name( 'CtrlKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANK_REF' ).
    lo_primitive_property->set_edm_name( 'BankRef' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCOUNTHOLDER' ).
    lo_primitive_property->set_edm_name( 'Accountholder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COLL_AUTH' ).
    lo_primitive_property->set_edm_name( 'CollAuth' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTERNALBANKID' ).
    lo_primitive_property->set_edm_name( 'Externalbankid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANKACCOUNTNAME' ).
    lo_primitive_property->set_edm_name( 'Bankaccountname' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IBAN' ).
    lo_primitive_property->set_edm_name( 'Iban' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 34 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IBAN_FROM_DATE' ).
    lo_primitive_property->set_edm_name( 'IbanFromDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANKDETAILVALIDFROM' ).
    lo_primitive_property->set_edm_name( 'Bankdetailvalidfrom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANKDETAILVALIDTO' ).
    lo_primitive_property->set_edm_name( 'Bankdetailvalidto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANKDETAILMOVEDATE' ).
    lo_primitive_property->set_edm_name( 'Bankdetailmovedate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANKDETAILMOVEID' ).
    lo_primitive_property->set_edm_name( 'Bankdetailmoveid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANK_ACCOUNT_TYPE' ).
    lo_primitive_property->set_edm_name( 'BankAccountType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BP_BANK_GUID' ).
    lo_primitive_property->set_edm_name( 'BpBankGuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYMENT_SYSTEM' ).
    lo_primitive_property->set_edm_name( 'PaymentSystem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALIAS_TYPE' ).
    lo_primitive_property->set_edm_name( 'AliasType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANK_ALIAS' ).
    lo_primitive_property->set_edm_name( 'BankAlias' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER' ).
    lo_primitive_property->set_edm_name( 'Partner' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOBANKDETAIL' ).
    lo_navigation_property->set_edm_name( 'HEADERTOBANKDETAIL' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'BANK_DETAIL' ).
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
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOG_NO' ).
    lo_primitive_property->set_edm_name( 'LogNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOG_MSG_NO' ).
    lo_primitive_property->set_edm_name( 'LogMsgNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE_V_1' ).
    lo_primitive_property->set_edm_name( 'MessageV1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE_V_2' ).
    lo_primitive_property->set_edm_name( 'MessageV2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE_V_3' ).
    lo_primitive_property->set_edm_name( 'MessageV3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE_V_4' ).
    lo_primitive_property->set_edm_name( 'MessageV4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARAMETER' ).
    lo_primitive_property->set_edm_name( 'Parameter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROW' ).
    lo_primitive_property->set_edm_name( 'Row' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIELD' ).
    lo_primitive_property->set_edm_name( 'Field' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SYSTEM' ).
    lo_primitive_property->set_edm_name( 'System' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.
ENDCLASS.
