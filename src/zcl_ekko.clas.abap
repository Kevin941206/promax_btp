CLASS zcl_ekko DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: ekko_get     IMPORTING VALUE(i_operacion)  TYPE text10
                                                et_ebeln      TYPE ztt_ebeln
                                                et_bukrs      TYPE ztt_bukrs
                                                P_lifnr       TYPE ebeln
                                EXPORTING VALUE(et_ekko)      TYPE ztt_ekko.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EKKO IMPLEMENTATION.


  METHOD ekko_get.
    CASE i_operacion.
      WHEN 'READ'.


        DATA:
          lt_business_data TYPE TABLE OF zscm_ekko=>tys_z_i_ekkotype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
         lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
         lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
         lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
         lo_filter_node_3    TYPE REF TO /iwbep/if_cp_filter_node,
         lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node.
*         lt_range_DELETE_MC TYPE RANGE OF <element_name>,
*         lt_range_UPDATE_MC TYPE RANGE OF <element_name>.

        DATA:
          lt_range_ebeln   TYPE RANGE OF ebeln,
          ls_range_ebeln   LIKE LINE OF lt_range_ebeln,
          lt_range_bukrs   TYPE RANGE OF bukrs,
          ls_range_bukrs   LIKE LINE OF lt_range_bukrs,
          lt_range_lifnr   TYPE RANGE OF lifnr,
          ls_range_lifnr   LIKE LINE OF lt_range_lifnr.

             TRY.
             " Create http client
*        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
*                                                     comm_scenario  = '<Comm Scenario>'
*                                                     comm_system_id = '<Comm System Id>'
*                                                     service_id     = '<Service Id>' ).
*        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
             "DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = |DS4WD100| ). "|DS4100| ).
             DATA lv_dest TYPE string.
             SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
             DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
             lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
             lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
               EXPORTING
                  is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                      proxy_model_id      = 'ZSCM_EKKO'
                                                      proxy_model_version = '0001' )
                 io_http_client             = lo_http_client
                 iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_EKKO' ).

             ASSERT lo_http_client IS BOUND.

        MOVE-CORRESPONDING et_ebeln TO  lt_range_ebeln.
        MOVE-CORRESPONDING et_bukrs TO  lt_range_bukrs.

        IF p_lifnr NE '0000000000'.
          CLEAR: lt_range_lifnr, ls_range_lifnr.
          ls_range_lifnr-sign = 'I'.
          ls_range_lifnr-option = 'EQ'.
          ls_range_lifnr-low = p_lifnr.
          APPEND ls_range_lifnr TO lt_range_lifnr.
        ENDIF.


        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKKO' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                it_range             = et_ebeln ).

        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                it_range             = lt_range_bukrs ).

        IF p_lifnr NE '0000000000'.

          lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'LIFNR'
                                                                  it_range             = lt_range_lifnr ).

          lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).

        ELSE.

          lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).

        ENDIF.

*        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
        lo_request->set_filter( lo_filter_node_root ).

        lo_request->set_top( 5000 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        MOVE-CORRESPONDING lt_business_data TO et_ekko.

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
