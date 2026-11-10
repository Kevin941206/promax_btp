CLASS zcl_ekpo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: ekpo_get     IMPORTING VALUE(i_operacion)  TYPE text10
                                                et_ebeln      TYPE ztt_ebeln
                                                ev_loekz      TYPE zchar01
                                EXPORTING VALUE(et_ekpo)      TYPE ztt_ekpo.

    CLASS-METHODS: ekpo_get2    IMPORTING VALUE(i_operacion)  TYPE text10
                                                i_ebeln       TYPE ebeln
                                                i_ebelp       TYPE ebelp
                                EXPORTING VALUE(et_ekpo)      TYPE ztt_ekpo.

    CLASS-METHODS: ekpo_get3    IMPORTING VALUE(i_operacion)  TYPE text10
                                                i_ebeln       TYPE ebeln
                                EXPORTING VALUE(et_ekpo)      TYPE ztt_ekpo.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EKPO IMPLEMENTATION.


  METHOD ekpo_get2.
    CASE i_operacion.
      WHEN 'READ'.


        DATA:
              lt_business_data TYPE TABLE OF zscm_ekpo=>tys_z_i_ekpotype,
              lo_http_client   TYPE REF TO if_web_http_client,
              lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
              lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
              lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
             lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
             lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
             lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
             lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node.
*             lt_range_DELETE_MC TYPE RANGE OF <element_name>,
*             lt_range_UPDATE_MC TYPE RANGE OF <element_name>.

        DATA:
          lt_range_ebeln   TYPE RANGE OF ebeln,
          ls_range_ebeln   LIKE LINE OF lt_range_ebeln,

          lt_range_ebelp   TYPE RANGE OF ebelp,
          ls_range_ebelp   LIKE LINE OF lt_range_ebelp.

          TRY.
                 " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
                 EXPORTING
                      is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                          proxy_model_id      = 'ZSCM_EKPO'
                                                          proxy_model_version = '0001' )
                    io_http_client             = lo_http_client
                    iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_EKPO' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_ebeln, ls_range_ebeln.
            ls_range_ebeln-sign = 'I'.
            ls_range_ebeln-option = 'EQ'.
            ls_range_ebeln-low = i_ebeln.
            APPEND ls_range_ebeln TO lt_range_ebeln.

            CLEAR: lt_range_ebelp, ls_range_ebelp.
            ls_range_ebelp-sign = 'I'.
            ls_range_ebelp-option = 'EQ'.
            ls_range_ebelp-low = i_ebelp.
            APPEND ls_range_ebelp TO lt_range_ebelp.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKPO' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_ebeln ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELP'
                                                                    it_range             = lt_range_ebelp ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            MOVE-CORRESPONDING lt_business_data TO et_ekpo.

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


  METHOD ekpo_get3.
    CASE i_operacion.
      WHEN 'READ'.


        DATA:
              lt_business_data TYPE TABLE OF zscm_ekpo=>tys_z_i_ekpotype,
              lo_http_client   TYPE REF TO if_web_http_client,
              lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
              lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
              lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
             lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
             lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
             lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
             lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node.
*             lt_range_DELETE_MC TYPE RANGE OF <element_name>,
*             lt_range_UPDATE_MC TYPE RANGE OF <element_name>.

        DATA:
          lt_range_ebeln   TYPE RANGE OF ebeln,
          ls_range_ebeln   LIKE LINE OF lt_range_ebeln.

          TRY.
                 " Create http client
*           DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
*                                                         comm_scenario  = '<Comm Scenario>'
*                                                         comm_system_id = '<Comm System Id>'
*                                                         service_id     = '<Service Id>' ).
*           lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            "DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = |DS4WD100| ). "|DS4100| ).
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
                 EXPORTING
                      is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                          proxy_model_id      = 'ZSCM_EKPO'
                                                          proxy_model_version = '0001' )
                    io_http_client             = lo_http_client
                    iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_EKPO' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_ebeln, ls_range_ebeln.
            ls_range_ebeln-sign = 'I'.
            ls_range_ebeln-option = 'EQ'.
            ls_range_ebeln-low = i_ebeln.
            APPEND ls_range_ebeln TO lt_range_ebeln.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKPO' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_ebeln ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            MOVE-CORRESPONDING lt_business_data TO et_ekpo.

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


  METHOD ekpo_get.
    CASE i_operacion.
      WHEN 'READ'.

            DATA:
              lt_business_data TYPE TABLE OF zscm_ekpo=>tys_z_i_ekpotype,
              lo_http_client   TYPE REF TO if_web_http_client,
              lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
              lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
              lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

            DATA:
             lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
             lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
             lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
             lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
             lt_range_ebeln TYPE RANGE OF ebeln,
             ls_range_ebeln LIKE LINE OF lt_range_ebeln,
             lt_range_loekz TYPE RANGE OF char1,
             ls_range_loekz LIKE LINE OF lt_range_loekz.


            TRY.
                 " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
                 EXPORTING
                      is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                          proxy_model_id      = 'ZSCM_EKPO'
                                                          proxy_model_version = '0001' )
                    io_http_client             = lo_http_client
                    iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_EKPO' ).

            ASSERT lo_http_client IS BOUND.

            MOVE-CORRESPONDING et_ebeln TO lt_range_ebeln.

            ls_range_loekz-sign = 'I'.
            ls_range_loekz-option = 'EQ'.
            ls_range_loekz-low = ev_loekz.
            APPEND ls_range_loekz TO lt_range_loekz.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKPO' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_ebeln ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'LOEKZ'
                                                                    it_range             = lt_range_loekz ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            MOVE-CORRESPONDING lt_business_data TO et_ekpo.

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
