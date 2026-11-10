"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>ZFM_PO_PDF_SRV</em>
CLASS zscm_po_pdf DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">header</p>
      BEGIN OF tys_header,
        "! <em>Key property</em> DocNumber
        doc_number TYPE string,
        "! Contador
        contador   TYPE int8,
        "! Exit
        exit       TYPE string,
        "! pdf
        pdf        TYPE xstring,
      END OF tys_header,
      "! <p class="shorttext synchronized">List of header</p>
      tyt_header TYPE STANDARD TABLE OF tys_header WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">lines</p>
      BEGIN OF tys_lines,
        "! <em>Key property</em> DocNumber
        doc_number TYPE string,
        "! pdf
        pdf        TYPE string,
      END OF tys_lines,
      "! <p class="shorttext synchronized">List of lines</p>
      tyt_lines TYPE STANDARD TABLE OF tys_lines WITH DEFAULT KEY.

    TYPES: BEGIN OF ty_deep,
             doc_number    TYPE string,
             "! Contador
             contador      TYPE int8,
             "! Exit
             exit          TYPE string,
             "! pdf
             pdf           TYPE xstring,
             headertolines TYPE TABLE OF tys_lines WITH DEFAULT KEY,
           END OF ty_deep.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! headerSet
        "! <br/> Collection of type 'header'
        header_set TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'HEADER_SET',
        "! linesSet
        "! <br/> Collection of type 'lines'
        lines_set  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'LINES_SET',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for header</p>
        "! See also structure type {@link ..tys_header}
        BEGIN OF header,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! HEADERTOLINES
            headertolines TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOLINES',
          END OF navigation,
        END OF header,
        "! <p class="shorttext synchronized">Internal names for lines</p>
        "! See also structure type {@link ..tys_lines}
        BEGIN OF lines,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF lines,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define header</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_header RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define lines</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_lines RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSCM_PO_PDF IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'ZFM_PO_PDF_SRV' ) ##NO_TEXT.

    def_header( ).
    def_lines( ).

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


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOC_NUMBER' ).
    lo_primitive_property->set_edm_name( 'DocNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTADOR' ).
    lo_primitive_property->set_edm_name( 'Contador' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int64' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXIT' ).
    lo_primitive_property->set_edm_name( 'Exit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PDF' ).
    lo_primitive_property->set_edm_name( 'pdf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Binary' ) ##NO_TEXT.

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOLINES' ).
    lo_navigation_property->set_edm_name( 'HEADERTOLINES' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'LINES' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


  METHOD def_lines.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'LINES'
                                    is_structure              = VALUE tys_lines( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'lines' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'LINES_SET' ).
    lo_entity_set->set_edm_name( 'linesSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOC_NUMBER' ).
    lo_primitive_property->set_edm_name( 'DocNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PDF' ).
    lo_primitive_property->set_edm_name( 'pdf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

  ENDMETHOD.
ENDCLASS.
