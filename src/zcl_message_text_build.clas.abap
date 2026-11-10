CLASS zcl_message_text_build DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: message_text_build IMPORTING i_msgid TYPE zst_wuebs-msgid
                                                i_msgno TYPE zst_wuebs-msgno
                                                i_msgv1 TYPE msgv1
                                                i_msgv2 TYPE msgv2
                                                i_msgv3 TYPE msgv3
                                                i_msgv4 TYPE msgv4
                                      EXPORTING e_mensaje TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_MESSAGE_TEXT_BUILD IMPLEMENTATION.


  METHOD message_text_build.

    DATA:
      lt_business_data TYPE TABLE OF zscm_message_text_build=>tys_header,
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
      lo_filter_node_5    TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_6    TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
      lt_range_MSGID      TYPE RANGE OF zst_wuebs-msgid,
      ls_range_msgid      LIKE LINE OF lt_range_msgid,
      lt_range_MSGNO      TYPE RANGE OF zst_wuebs-msgno,
      ls_range_msgno      LIKE LINE OF lt_range_msgno,
      lt_range_msgv1      TYPE RANGE OF msgv1,
      ls_range_msgv1      LIKE LINE OF lt_range_msgv1,
      lt_range_msgv2      TYPE RANGE OF msgv2,
      ls_range_msgv2      LIKE LINE OF lt_range_msgv2,
      lt_range_msgv3      TYPE RANGE OF msgv3,
      ls_range_msgv3      LIKE LINE OF lt_range_msgv3,
      lt_range_msgv4      TYPE RANGE OF msgv4,
      ls_range_msgv4      LIKE LINE OF lt_range_msgv4.

    TRY.
        " Create http client
        DATA lv_dest TYPE string.
        SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSCM_MESSAGE_TEXT_BUILD'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_MESSAGE_TEXT_BUILD_SRV' ).

        ASSERT lo_http_client IS BOUND.

        ls_range_msgid-sign = 'I'.
        ls_range_msgid-option = 'EQ'.
        ls_range_msgid-low = i_msgid.
        APPEND ls_range_msgid TO lt_range_msgid.
        CLEAR ls_range_msgid.

        ls_range_msgno-sign = 'I'.
        ls_range_msgno-option = 'EQ'.
        ls_range_msgno-low = i_msgno.
        APPEND ls_range_msgno TO lt_range_msgno.
        CLEAR ls_range_msgno.

        ls_range_msgv1-sign = 'I'.
        ls_range_msgv1-option = 'EQ'.
        ls_range_msgv1-low = i_msgv1.
        APPEND ls_range_msgv1 TO lt_range_msgv1.
        CLEAR ls_range_msgv1.

        ls_range_msgv2-sign = 'I'.
        ls_range_msgv2-option = 'EQ'.
        ls_range_msgv2-low = i_msgv2.
        APPEND ls_range_msgv2 TO lt_range_msgv2.
        CLEAR ls_range_msgv2.

        ls_range_msgv3-sign = 'I'.
        ls_range_msgv3-option = 'EQ'.
        ls_range_msgv3-low = i_msgv3.
        APPEND ls_range_msgv3 TO lt_range_msgv3.
        CLEAR ls_range_msgv3.

        ls_range_msgv4-sign = 'I'.
        ls_range_msgv4-option = 'EQ'.
        ls_range_msgv4-low = i_msgv4.
        APPEND ls_range_msgv4 TO lt_range_msgv4.
        CLEAR ls_range_msgv4.


        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'MSGID'
                                                                it_range             = lt_range_MSGID ).
        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'MSGNO'
                                                                it_range             = lt_range_MSGNO ).
        lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'MSGV_1'
                                                                it_range             = lt_range_msgv1 ).
        lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'MSGV_2'
                                                                it_range             = lt_range_msgv2 ).
        lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'MSGV_3'
                                                                it_range             = lt_range_msgv3 ).
        lo_filter_node_6  = lo_filter_factory->create_by_range( iv_property_path     = 'MSGV_4'
                                                                it_range             = lt_range_msgv4 ).

        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 )->and( lo_filter_node_6 ).
        lo_request->set_filter( lo_filter_node_root ).

        lo_request->set_top( 50 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
        IF sy-subrc = 0.
          e_mensaje = ls_business_data-mensaje.
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
