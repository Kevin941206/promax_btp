CLASS zcl_lfbw DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

      CLASS-METHODS: lfbw_get   IMPORTING VALUE(i_operacion) TYPE text10
                                                i_lifnr      TYPE lifnr
                                                i_bukrs      TYPE bukrs
                                EXPORTING VALUE(et_lfbw)     TYPE ztt_lfbw.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LFBW IMPLEMENTATION.


  METHOD lfbw_get.
    CASE i_operacion.
      WHEN 'READ'.


        DATA:
          lt_business_data TYPE TABLE OF zscm_lfbw=>tys_z_i_lfbwtype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
         lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
         lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
         lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
         lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node.
*         lt_range_DELETE_MC TYPE RANGE OF <element_name>,
*         lt_range_UPDATE_MC TYPE RANGE OF <element_name>.

        DATA:
          lt_range_lifnr   TYPE RANGE OF lifnr,
          ls_range_lifnr   LIKE LINE OF lt_range_lifnr,

          lt_range_bukrs   TYPE RANGE OF bukrs,
          ls_range_bukrs   LIKE LINE OF lt_range_bukrs.

        TRY.
             " Create http client
*        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
*                                                     comm_scenario  = '<Comm Scenario>'
*                                                     comm_system_id = '<Comm System Id>'
*                                                     service_id     = '<Service Id>' ).
*        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
             DATA lv_dest TYPE string.
             SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
             DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
             lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
             lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
               EXPORTING
                  is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                      proxy_model_id      = 'ZSCM_LFBW'
                                                      proxy_model_version = '0001' )
                 io_http_client             = lo_http_client
                 iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_LFBW' ).

             ASSERT lo_http_client IS BOUND.


        CLEAR: lt_range_lifnr, ls_range_lifnr.
        ls_range_lifnr-sign = 'I'.
        ls_range_lifnr-option = 'EQ'.
        ls_range_lifnr-low = i_lifnr.
        APPEND ls_range_lifnr TO lt_range_lifnr.

        CLEAR: lt_range_bukrs, ls_range_bukrs.
        ls_range_bukrs-sign = 'I'.
        ls_range_bukrs-option = 'EQ'.
        ls_range_bukrs-low = i_bukrs.
        APPEND ls_range_bukrs TO lt_range_bukrs.


        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LFBW' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'LIFNR'
                                                                it_range             = lt_range_lifnr ).
        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                it_range             = lt_range_bukrs ).

        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
        lo_request->set_filter( lo_filter_node_root ).

        lo_request->set_top( 50 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        MOVE-CORRESPONDING lt_business_data TO et_lfbw.

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
