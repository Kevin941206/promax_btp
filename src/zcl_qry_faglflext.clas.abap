CLASS zcl_qry_faglflext DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

*tabla faglflext
    CLASS-METHODS: GET_faglflext       IMPORTING VALUE(i_operacion)  TYPE text10
                                                 rldnr               TYPE char5
                                                 rrcty               TYPE c
                                                 rvers               TYPE char3
                                                 rbukrs              TYPE bukrs
                                                 racct               TYPE zfagl_range_t_racct
                                                 ryear               TYPE zryear
                                       EXPORTING VALUE(lt_faglflext) TYPE  ztt_faglflext.

*tabla skat
    CLASS-METHODS: GET_skat       IMPORTING VALUE(i_operacion) TYPE text10
                                            spras              TYPE c
                                            ktopl              TYPE ktopl
                                            saknr              TYPE zracct
                                  EXPORTING VALUE(e_txt50)     TYPE txt50_skat .

*tabla skat
    CLASS-METHODS: get_t001      IMPORTING VALUE(i_operacion) TYPE text10
                                 EXPORTING VALUE(et_companys) TYPE ztt_t001.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_QRY_FAGLFLEXT IMPLEMENTATION.


  METHOD get_t001.

    CASE i_operacion.

      WHEN 'READ LIST'.

        "------------------------------------------------------------
        " Declaración de variables
        "------------------------------------------------------------
        DATA:
          lt_business_data TYPE TABLE OF zscm_t001_2=>tys_z_i_t_001_2_type, "Datos recibidos del servicio OData
          lo_http_client   TYPE REF TO if_web_http_client,               "Cliente HTTP
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,         "Proxy OData
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,    "Request READ LIST
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst,    "Response del servicio
          ls_companys      LIKE LINE OF et_companys.                      "Estructura de salida

        TRY.

            "--------------------------------------------------------
            " Obtención del destino HTTP desde tabla de configuración
            "--------------------------------------------------------
            DATA lv_dest TYPE string.

            SELECT SINGLE destino
              FROM zbtp_t_destino
              INTO @lv_dest.

            "--------------------------------------------------------
            " Creación del destino HTTP (BTP / Cloud Destination)
            "--------------------------------------------------------
            DATA(lo_destination) =
              cl_http_destination_provider=>create_by_cloud_destination(
                i_name = lv_dest
              ).

            "--------------------------------------------------------
            " Creación del cliente HTTP
            "--------------------------------------------------------
            lo_http_client =
              cl_web_http_client_manager=>create_by_http_destination(
                lo_destination
              ).

            "--------------------------------------------------------
            " Creation of the OData V2 remote proxy
            "--------------------------------------------------------
            lo_client_proxy =
              /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
                EXPORTING
                  is_proxy_model_key     = VALUE #(
                                              repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_T001_2'
                                              proxy_model_version = '0001'
                                            )
                  io_http_client           = lo_http_client
                  iv_relative_service_root = '/sap/opu/odata/sap/ZSB_T001_2'
              ).

            " Validation that the HTTP client was created
            ASSERT lo_http_client IS BOUND.

            "--------------------------------------------------------
            " Creation of the READ request for the Entity Set”
            "--------------------------------------------------------
            lo_request =
              lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_001_2' )->create_request_for_read( ).

            " Pagination: first 50 records
            lo_request->set_top( 50 ).
            lo_request->set_skip( 0 ).

            "--------------------------------------------------------
            " Execution of the request
            "--------------------------------------------------------
            lo_response = lo_request->execute( ).

            " Retrieval of business data
            lo_response->get_business_data(
              IMPORTING
                et_business_data = lt_business_data
            ).

            "--------------------------------------------------------
            " Mapping OData data to the output table
            "--------------------------------------------------------
            LOOP AT lt_business_data INTO DATA(ls_business_data).

              ls_companys-bukrs = ls_business_data-bukrs.
              ls_companys-butxt = ls_business_data-butxt.
              ls_companys-ktopl = ls_business_data-ktopl.

              APPEND ls_companys TO et_companys.
              CLEAR ls_companys.

            ENDLOOP.

            "----------------------------------------------------------
            " Exception handling
            "----------------------------------------------------------
          CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
            " Remote communication error (HTTP / destination / network)

          CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
            " Critical HTTP client error

          CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
            " Critical HTTP client error
            RAISE SHORTDUMP lx_web_http_client_error.

        ENDTRY.

    ENDCASE.


  ENDMETHOD.


  METHOD GET_faglflext.

    CASE i_operacion.
      WHEN 'READ LIST'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_faglflext=>tys_z_i_faglflext_type,
          ls_business_data TYPE  zscm_faglflext=>tys_z_i_faglflext_type,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst,
          ls_faglflext     TYPE  zes_faglflext.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_3    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_4    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_5    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_6    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_rldnr      TYPE RANGE OF char2,
          ls_range_rldnr      LIKE LINE OF lt_range_rldnr,
          lt_range_rrcty      TYPE RANGE OF char1,
          ls_range_rrcty      LIKE LINE OF lt_range_rrcty,
          lt_range_rvers      TYPE RANGE OF char3,
          ls_range_rvers      LIKE LINE OF lt_range_rvers,
          lt_range_rbukrs     TYPE RANGE OF bukrs,
          ls_range_rbukrs     LIKE LINE OF lt_range_rbukrs,
          lt_range_racct      TYPE RANGE OF char10,
          ls_range_racct      LIKE LINE OF lt_range_racct,
          lt_range_ryear      TYPE RANGE OF numc4,
          ls_range_ryear      LIKE LINE OF lt_range_ryear.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).

            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_FAGLFLEXT'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_FAGLFLEXT' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_rldnr-sign = 'I'.
            ls_range_rldnr-option = 'EQ'.
            ls_range_rldnr-low = rldnr.
            APPEND ls_range_rldnr TO lt_range_rldnr.

            ls_range_rrcty-sign = 'I'.
            ls_range_rrcty-option = 'EQ'.
            ls_range_rrcty-low = rrcty.
            APPEND ls_range_rrcty TO lt_range_rrcty.

            ls_range_rvers-sign = 'I'.
            ls_range_rvers-option = 'EQ'.
            ls_range_rvers-low = rvers.
            APPEND ls_range_rvers TO lt_range_rvers.

            ls_range_rbukrs-sign = 'I'.
            ls_range_rbukrs-option = 'EQ'.
            ls_range_rbukrs-low = rbukrs.
            APPEND ls_range_rbukrs TO lt_range_rbukrs.

            LOOP AT racct INTO DATA(ls_racct).
              ls_range_racct-sign = 'I'.
              ls_range_racct-option = 'EQ'.
              ls_range_racct-low = ls_racct-low.
              APPEND ls_range_racct TO lt_range_racct.
            ENDLOOP.

            ls_range_ryear-sign = 'I'.
            ls_range_ryear-option = 'EQ'.
            ls_range_ryear-low = ryear.
            APPEND ls_range_ryear TO lt_range_ryear.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_FAGLFLEXT' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'RLDNR'
                                                                    it_range             = lt_range_rldnr ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'RRCTY'
                                                                    it_range             = lt_range_rrcty ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'RVERS'
                                                                    it_range             = lt_range_rvers ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'RBUKRS'
                                                                    it_range             = lt_range_rbukrs ).
            lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'RACCT'
                                                                    it_range             = lt_range_racct ).
            lo_filter_node_6  = lo_filter_factory->create_by_range( iv_property_path     = 'RYEAR'
                                                                    it_range             = lt_range_ryear ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 )->and( lo_filter_node_6 ).
            lo_request->set_filter( lo_filter_node_root ).


            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO ls_business_data.
              MOVE-CORRESPONDING ls_business_data TO ls_faglflext.
              APPEND ls_faglflext TO lt_faglflext.
            ENDLOOP.


          CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
            " Handle remote Exception
            " It contains details about the problems of your http(s) connection

          CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
            " Handle Exception

          CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
            " Handle Exception
            RAISE SHORTDUMP lx_web_http_client_error.


        ENDTRY.

    ENDCASE.


  ENDMETHOD.


  METHOD GET_skat.

    CASE i_operacion.
      WHEN 'READ'.


        DATA:
          ls_entity_key    TYPE zscm_skat=>tys_z_i_skattype,
          ls_business_data TYPE zscm_skat=>tys_z_i_skattype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read.



        TRY.
            " Create http client
*            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = |DS4WD100| ). "|DS4100| ).
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
*            DATA(lo_destination) = cl_http_destination_provider=>create_by_url( 'https://ds4wd.sap.gpromax.com:433?saml2=disabled' ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
*lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SKAT'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SKAT' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      spras  = spras
                      ktopl  = ktopl
                      saknr  = saknr ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_SKAT' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            e_txt50    = ls_business_data-txt_50.

          CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
            " Handle remote Exception
            " It contains details about the problems of your http(s) connection

          CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
            " Handle Exception

          CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
            " Handle Exception
            RAISE SHORTDUMP lx_web_http_client_error.


        ENDTRY.

    ENDCASE.


  ENDMETHOD.
ENDCLASS.
