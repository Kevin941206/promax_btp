CLASS zcl_bapi_exchangerate_getdet DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: bapi_exchangerate_getdetail IMPORTING i_rate_type  TYPE kurst_curr
                                                         i_from_curr  TYPE fcurr_curr
                                                         i_to_currncy TYPE tcurr_curr
                                                         i_date       TYPE datum
                                               EXPORTING es_exch_rate TYPE zes_bapi1093_0.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_BAPI_EXCHANGERATE_GETDET IMPLEMENTATION.


  METHOD bapi_exchangerate_getdetail.

    DATA:
      lt_business_data TYPE TABLE OF zscm_bapi_exchangerate_getdet=>tys_header,
      lo_http_client   TYPE REF TO if_web_http_client,
      lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

    DATA:
      lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
      lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_3    TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_4    TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
      lt_range_RATE_TYPE  TYPE RANGE OF kurst_curr,
      ls_range_rate_type  LIKE LINE OF lt_range_rate_type,
      lt_range_from_curr  TYPE RANGE OF fcurr_curr,
      ls_range_from_curr  LIKE LINE OF lt_range_from_curr,
      lt_range_to_currncy TYPE RANGE OF tcurr_curr,
      ls_range_to_currncy LIKE LINE OF lt_range_to_currncy,
      lt_range_date       TYPE RANGE OF datum,
      ls_range_date       LIKE LINE OF lt_range_date.

    TRY.
        " Create http client
        DATA lv_dest TYPE string.
        SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSCM_BAPI_EXCHANGERATE_GETDET'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_BAPI_EXCHANGERATE_GETDETAI_SRV' ).

        ASSERT lo_http_client IS BOUND.

        ls_range_rate_type-sign = 'I'.
        ls_range_rate_type-option = 'EQ'.
        ls_range_rate_type-low = i_rate_type.
        APPEND ls_range_rate_type TO lt_range_rate_type.
        CLEAR ls_range_rate_type.

        ls_range_from_curr-sign = 'I'.
        ls_range_from_curr-option = 'EQ'.
        ls_range_from_curr-low = i_from_curr.
        APPEND ls_range_from_curr TO lt_range_from_curr.
        CLEAR ls_range_from_curr.

        ls_range_to_currncy-sign = 'I'.
        ls_range_to_currncy-option = 'EQ'.
        ls_range_to_currncy-low = i_to_currncy.
        APPEND ls_range_to_currncy TO lt_range_to_currncy.
        CLEAR ls_range_to_currncy.

        ls_range_date-sign = 'I'.
        ls_range_date-option = 'EQ'.
        ls_range_date-low = i_date.
        APPEND ls_range_date TO lt_range_date.
        CLEAR ls_range_date.

        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'RATE_TYPE'
                                                                it_range             = lt_range_RATE_TYPE ).
        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'FROM_CURR'
                                                                it_range             = lt_range_FROM_CURR ).
        lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'TO_CURRNCY'
                                                                it_range             = lt_range_to_currncy ).
        lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'VALID_FROM'
                                                                it_range             = lt_range_date ).

        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
        lo_request->set_filter( lo_filter_node_root ).

        lo_request->set_top( 50 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
        IF sy-subrc = 0.
          MOVE-CORRESPONDING ls_business_data TO es_exch_rate.
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
