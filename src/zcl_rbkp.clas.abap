CLASS zcl_rbkp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS: rbkp_get     IMPORTING VALUE(i_operacion) TYPE text10
                                          i_belnr            TYPE belnr_d
                                          i_gjahr            TYPE gjahr
                                EXPORTING VALUE(et_rbkp)     TYPE ztt_rbkp.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RBKP IMPLEMENTATION.


  METHOD rbkp_get.

    CASE i_operacion.

      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_rbkp=>tys_z_i_rbkptype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_belnr      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          lt_range_gjahr      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_RBKP'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_RBKP' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = i_belnr.
            APPEND ls_range_belnr TO lt_range_belnr.

            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = i_gjahr.
            APPEND ls_range_gjahr TO lt_range_gjahr.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_RBKP' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_belnr ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            MOVE-CORRESPONDING lt_business_data TO et_rbkp.

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
