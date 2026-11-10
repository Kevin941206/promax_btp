CLASS zcl_vttk_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  CLASS-METHODS: vttk_get     IMPORTING VALUE(i_operacion)  TYPE text10
                                                i_tknum     TYPE zchar10
                                EXPORTING VALUE(et_vttk)    TYPE ztt_vttk. " zst_vttk

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_VTTK_2 IMPLEMENTATION.


  METHOD vttk_get.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_vttk_2=>tys_z_i_vttk_2_type,
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
          lt_range_tknum TYPE RANGE OF zchar10,
          ls_range_tknum LIKE LINE OF lt_range_tknum.



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
                                                      proxy_model_id      = 'ZSCM_VTTK_2'
                                                      proxy_model_version = '0001' )
                 io_http_client             = lo_http_client
                 iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_VTTK_2' ).

             ASSERT lo_http_client IS BOUND.


        CLEAR: lt_range_tknum, ls_range_tknum.
        ls_range_tknum-sign = 'I'.
        ls_range_tknum-option = 'EQ'.
        ls_range_tknum-low = i_tknum.
        APPEND ls_range_tknum TO lt_range_tknum.


        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTK_2' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'TKNUM'
                                                                it_range             = lt_range_tknum ).
*        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'UPDATE_MC'
*                                                                it_range             = lt_range_UPDATE_MC ).

        lo_filter_node_root = lo_filter_node_1.
        lo_request->set_filter( lo_filter_node_root ).

        lo_request->set_top( 5000 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        MOVE-CORRESPONDING lt_business_data TO et_vttk.

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
