CLASS zcl_number_get_next DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: number_get_next IMPORTING i_object    TYPE char10
                                             i_nrrangenr TYPE char2 OPTIONAL
                                             i_smart     TYPE char1 OPTIONAL
                                   EXPORTING e_number    TYPE char10.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_NUMBER_GET_NEXT IMPLEMENTATION.


  METHOD number_get_next.

    DATA:
      lt_business_data TYPE TABLE OF zscm_number_get_next=>tys_header,
      lo_http_client   TYPE REF TO if_web_http_client,
      lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

    DATA:
      lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
      lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_3    TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
      lt_range_OBJECT     TYPE RANGE OF char10,
      ls_range_object     LIKE LINE OF lt_range_object,
      lt_range_NRRANGENR  TYPE RANGE OF char2,
      ls_range_nrrangenr  LIKE LINE OF lt_range_nrrangenr,
      lt_range_smart      TYPE RANGE OF char1,
      ls_range_smart      LIKE LINE OF lt_range_smart.

    TRY.
        " Create http client
        DATA lv_dest TYPE string.
        SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSCM_NUMBER_GET_NEXT'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_NUMBER_GET_NEXT_SRV' ).

        ASSERT lo_http_client IS BOUND.

        ls_range_object-sign = 'I'.
        ls_range_object-option = 'EQ'.
        ls_range_object-low = i_object.
        APPEND ls_range_object TO lt_range_object.
        CLEAR ls_range_object.

        ls_range_nrrangenr-sign = 'I'.
        ls_range_nrrangenr-option = 'EQ'.
        ls_range_nrrangenr-low = i_nrrangenr.
        APPEND ls_range_nrrangenr TO lt_range_nrrangenr.
        CLEAR ls_range_nrrangenr.

        ls_range_smart-sign = 'I'.
        ls_range_smart-option = 'EQ'.
        ls_range_smart-low = i_smart.
        APPEND ls_range_smart TO lt_range_smart.
        CLEAR ls_range_smart.

        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'OBJECT'
                                                                it_range             = lt_range_OBJECT ).
        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'NRRANGENR'
                                                                it_range             = lt_range_NRRANGENR ).
        lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'SMART'
                                                                it_range             = lt_range_smart ).

        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
        lo_request->set_filter( lo_filter_node_root ).

        lo_request->set_top( 50 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
        IF sy-subrc = 0.
          e_number = ls_business_data-number.
        ENDIF.

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " Handle Exception

      CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
        " Handle Exception
        RAISE SHORTDUMP lx_web_http_client_error.


    ENDTRY.
  ENDMETHOD.
ENDCLASS.
