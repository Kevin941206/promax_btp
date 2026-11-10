"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>ZFM_ORDER_FLOW_INFO_SRV</em>
CLASS zscm_rv_order_flow_information DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">docflow</p>
      BEGIN OF tys_docflow,
        "! <em>Key property</em> DateTime
        date_time TYPE string,
        "! Mandt
        mandt     TYPE c LENGTH 3,
        "! Ruuid
        ruuid     TYPE xstring,
        "! Vbelv
        vbelv     TYPE c LENGTH 10,
        "! Posnv
        posnv     TYPE c LENGTH 6,
        "! Vbeln
        vbeln     TYPE c LENGTH 10,
        "! Posnn
        posnn     TYPE c LENGTH 6,
        "! VbtypN
        vbtyp_n   TYPE c LENGTH 4,
        "! Rfmng
        rfmng     TYPE p LENGTH 8 DECIMALS 3,
        "! Meins
        meins     TYPE c LENGTH 3,
        "! Rfwrt
        rfwrt     TYPE p LENGTH 9 DECIMALS 3,
        "! Waers
        waers     TYPE c LENGTH 5,
        "! VbtypV
        vbtyp_v   TYPE c LENGTH 4,
        "! Plmin
        plmin     TYPE c LENGTH 1,
        "! Taqui
        taqui     TYPE abap_bool,
        "! Erdat
        erdat     TYPE string,
        "! Erzet
        erzet     TYPE timn,
        "! Matnr
        matnr     TYPE c LENGTH 40,
        "! Bwart
        bwart     TYPE c LENGTH 3,
        "! Bdart
        bdart     TYPE c LENGTH 2,
        "! Plart
        plart     TYPE c LENGTH 1,
        "! Lgnum
        lgnum     TYPE c LENGTH 3,
        "! Aedat
        aedat     TYPE string,
        "! Fktyp
        fktyp     TYPE c LENGTH 1,
        "! Brgew
        brgew     TYPE p LENGTH 8 DECIMALS 3,
        "! Gewei
        gewei     TYPE c LENGTH 3,
        "! Volum
        volum     TYPE p LENGTH 8 DECIMALS 3,
        "! Voleh
        voleh     TYPE c LENGTH 3,
        "! Fplnr
        fplnr     TYPE c LENGTH 10,
        "! Fpltr
        fpltr     TYPE c LENGTH 6,
        "! RfmngFlo
        rfmng_flo TYPE /iwbep/v4_float,
        "! RfmngFlt
        rfmng_flt TYPE /iwbep/v4_float,
        "! Vrkme
        vrkme     TYPE c LENGTH 3,
        "! Abges
        abges     TYPE /iwbep/v4_float,
        "! Sobkz
        sobkz     TYPE c LENGTH 1,
        "! Sonum
        sonum     TYPE c LENGTH 16,
        "! Kzbef
        kzbef     TYPE abap_bool,
        "! Ntgew
        ntgew     TYPE p LENGTH 7 DECIMALS 3,
        "! Logsys
        logsys    TYPE c LENGTH 10,
        "! Wbsta
        wbsta     TYPE c LENGTH 1,
        "! Cmeth
        cmeth     TYPE c LENGTH 1,
        "! Mjahr
        mjahr     TYPE c LENGTH 4,
        "! Stufe
        stufe     TYPE c LENGTH 2,
        "! Dataaging
        dataaging TYPE string,
      END OF tys_docflow,
      "! <p class="shorttext synchronized">List of docflow</p>
      tyt_docflow TYPE STANDARD TABLE OF tys_docflow WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">docinfo</p>
      BEGIN OF tys_docinfo,
        "! <em>Key property</em> DateTime
        date_time TYPE string,
        "! Vbeln
        vbeln     TYPE c LENGTH 10,
        "! Vbtyp
        vbtyp     TYPE c LENGTH 4,
      END OF tys_docinfo,
      "! <p class="shorttext synchronized">List of docinfo</p>
      tyt_docinfo TYPE STANDARD TABLE OF tys_docinfo WITH DEFAULT KEY.

    TYPES: BEGIN OF ty_deep,
             date_time           TYPE string,
             "! Vbeln
             vbeln               TYPE c LENGTH 10,
             "! Vbtyp
             vbtyp               TYPE c LENGTH 4,
             docinfotodocflownav TYPE TABLE OF tys_docflow WITH DEFAULT KEY,
           END OF ty_deep.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! docflowSet
        "! <br/> Collection of type 'docflow'
        docflow_set TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'DOCFLOW_SET',
        "! docinfoSet
        "! <br/> Collection of type 'docinfo'
        docinfo_set TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'DOCINFO_SET',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for docflow</p>
        "! See also structure type {@link ..tys_docflow}
        BEGIN OF docflow,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF docflow,
        "! <p class="shorttext synchronized">Internal names for docinfo</p>
        "! See also structure type {@link ..tys_docinfo}
        BEGIN OF docinfo,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! DOCINFOTODOCFLOWNAV
            docinfotodocflownav TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'DOCINFOTODOCFLOWNAV',
          END OF navigation,
        END OF docinfo,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define docflow</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_docflow RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define docinfo</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_docinfo RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSCM_RV_ORDER_FLOW_INFORMATION IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'ZFM_ORDER_FLOW_INFO_SRV' ) ##NO_TEXT.

    def_docflow( ).
    def_docinfo( ).

  ENDMETHOD.


  METHOD def_docflow.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'DOCFLOW'
                                    is_structure              = VALUE tys_docflow( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'docflow' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'DOCFLOW_SET' ).
    lo_entity_set->set_edm_name( 'docflowSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MANDT' ).
    lo_primitive_property->set_edm_name( 'Mandt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RUUID' ).
    lo_primitive_property->set_edm_name( 'Ruuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Binary' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELV' ).
    lo_primitive_property->set_edm_name( 'Vbelv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSNV' ).
    lo_primitive_property->set_edm_name( 'Posnv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELN' ).
    lo_primitive_property->set_edm_name( 'Vbeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSNN' ).
    lo_primitive_property->set_edm_name( 'Posnn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBTYP_N' ).
    lo_primitive_property->set_edm_name( 'VbtypN' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFMNG' ).
    lo_primitive_property->set_edm_name( 'Rfmng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEINS' ).
    lo_primitive_property->set_edm_name( 'Meins' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFWRT' ).
    lo_primitive_property->set_edm_name( 'Rfwrt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAERS' ).
    lo_primitive_property->set_edm_name( 'Waers' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBTYP_V' ).
    lo_primitive_property->set_edm_name( 'VbtypV' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLMIN' ).
    lo_primitive_property->set_edm_name( 'Plmin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAQUI' ).
    lo_primitive_property->set_edm_name( 'Taqui' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERDAT' ).
    lo_primitive_property->set_edm_name( 'Erdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERZET' ).
    lo_primitive_property->set_edm_name( 'Erzet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATNR' ).
    lo_primitive_property->set_edm_name( 'Matnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BWART' ).
    lo_primitive_property->set_edm_name( 'Bwart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BDART' ).
    lo_primitive_property->set_edm_name( 'Bdart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLART' ).
    lo_primitive_property->set_edm_name( 'Plart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGNUM' ).
    lo_primitive_property->set_edm_name( 'Lgnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AEDAT' ).
    lo_primitive_property->set_edm_name( 'Aedat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKTYP' ).
    lo_primitive_property->set_edm_name( 'Fktyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRGEW' ).
    lo_primitive_property->set_edm_name( 'Brgew' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GEWEI' ).
    lo_primitive_property->set_edm_name( 'Gewei' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLUM' ).
    lo_primitive_property->set_edm_name( 'Volum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLEH' ).
    lo_primitive_property->set_edm_name( 'Voleh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FPLNR' ).
    lo_primitive_property->set_edm_name( 'Fplnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FPLTR' ).
    lo_primitive_property->set_edm_name( 'Fpltr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFMNG_FLO' ).
    lo_primitive_property->set_edm_name( 'RfmngFlo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFMNG_FLT' ).
    lo_primitive_property->set_edm_name( 'RfmngFlt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VRKME' ).
    lo_primitive_property->set_edm_name( 'Vrkme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABGES' ).
    lo_primitive_property->set_edm_name( 'Abges' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SOBKZ' ).
    lo_primitive_property->set_edm_name( 'Sobkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SONUM' ).
    lo_primitive_property->set_edm_name( 'Sonum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZBEF' ).
    lo_primitive_property->set_edm_name( 'Kzbef' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NTGEW' ).
    lo_primitive_property->set_edm_name( 'Ntgew' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOGSYS' ).
    lo_primitive_property->set_edm_name( 'Logsys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WBSTA' ).
    lo_primitive_property->set_edm_name( 'Wbsta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMETH' ).
    lo_primitive_property->set_edm_name( 'Cmeth' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MJAHR' ).
    lo_primitive_property->set_edm_name( 'Mjahr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STUFE' ).
    lo_primitive_property->set_edm_name( 'Stufe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATAAGING' ).
    lo_primitive_property->set_edm_name( 'Dataaging' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_docinfo.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'DOCINFO'
                                    is_structure              = VALUE tys_docinfo( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'docinfo' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'DOCINFO_SET' ).
    lo_entity_set->set_edm_name( 'docinfoSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELN' ).
    lo_primitive_property->set_edm_name( 'Vbeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBTYP' ).
    lo_primitive_property->set_edm_name( 'Vbtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'DOCINFOTODOCFLOWNAV' ).
    lo_navigation_property->set_edm_name( 'DOCINFOTODOCFLOWNAV' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'DOCFLOW' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.
ENDCLASS.
