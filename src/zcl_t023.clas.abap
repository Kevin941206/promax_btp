CLASS zcl_t023 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: prodfamilys_get       IMPORTING VALUE(i_operacion)         TYPE text10
                                    EXPORTING VALUE(et_prodfamilys_get) TYPE ztt_t023_t023t.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_T023 IMPLEMENTATION.


  METHOD prodfamilys_get.

    CASE i_operacion.
      WHEN 'READ'.


            DATA:
              lt_business_data TYPE TABLE OF zscm_t023=>tys_z_i_t_023_t_023_ttype,
              lo_http_client   TYPE REF TO if_web_http_client,
              lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
              lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
              lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

*            DATA:
*             lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
*             lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
*             lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
*             lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
*             lt_range_MATKL TYPE RANGE OF <element_name>,
*             lt_range_SPART TYPE RANGE OF <element_name>.



           TRY.
                 " Create http client
*            DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
*                                                         comm_scenario  = '<Comm Scenario>'
*                                                         comm_system_id = '<Comm System Id>'
*                                                         service_id     = '<Service Id>' ).
*            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
             "DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = |DS4WD100| ). "|DS4100| ).
             DATA lv_dest TYPE string.
             SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
             DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
             lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
             lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
               EXPORTING
                  is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                      proxy_model_id      = 'ZSCM_T023'
                                                      proxy_model_version = '0001' )
                 io_http_client             = lo_http_client
                 iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_T023' ).

             ASSERT lo_http_client IS BOUND.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_023_T_023_T' )->create_request_for_read( ).

            " Create the filter tree
*            lo_filter_factory = lo_request->create_filter_factory( ).
*
*            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'MATKL'
*                                                                    it_range             = lt_range_MATKL ).
*            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'SPART'
*                                                                    it_range             = lt_range_SPART ).

*            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
*            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            " et_prodfamilys_get = lt_business_data.
            MOVE-CORRESPONDING lt_business_data TO et_prodfamilys_get.

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
