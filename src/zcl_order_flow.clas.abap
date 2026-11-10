CLASS zcl_order_flow DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: order_flow IMPORTING i_vbeln    TYPE vbeln
                              EXPORTING e_doctype  TYPE zvbtypl
                                        et_docflow TYPE ztt_vbfa.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ORDER_FLOW IMPLEMENTATION.


  METHOD order_flow.

    DATA:
      lt_business_data TYPE TABLE OF zscm_rv_order_flow_information=>ty_deep,
      lo_http_client   TYPE REF TO if_web_http_client,
      lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

    DATA:
      lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
      lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
      lt_range_VBELN      TYPE RANGE OF vbeln,
      ls_range_vbeln      LIKE LINE OF lt_range_vbeln,
      ls_docflow          LIKE LINE OF et_docflow.

    TRY.
        " Create http client
        DATA lv_dest TYPE string.
        SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSCM_RV_ORDER_FLOW_INFORMATION'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_ORDER_FLOW_INFO_SRV' ).

        ASSERT lo_http_client IS BOUND.

        ls_range_vbeln-sign = 'I'.
        ls_range_vbeln-option = 'EQ'.
        ls_range_vbeln-low = i_vbeln.
        APPEND ls_range_vbeln TO lt_range_vbeln.

        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'DOCINFO_SET' )->create_request_for_read( ).

        DATA(lo_expand) = lo_request->create_expand_node(  ).
        lo_expand->add_expand( 'DOCINFOTODOCFLOWNAV' ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELN'
                                                                it_range             = lt_range_VBELN ).

        lo_filter_node_root = lo_filter_node_1.
        lo_request->set_filter( lo_filter_node_root ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
        IF sy-subrc = 0.
          e_doctype = ls_business_data-vbtyp.
          LOOP AT ls_business_data-docinfotodocflownav INTO DATA(ls_flow).
            MOVE-CORRESPONDING ls_flow TO ls_docflow.
            APPEND ls_docflow TO et_docflow.
            CLEAR ls_docflow.
          ENDLOOP.
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
