CLASS zcl_ekpo_ekko DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: ekpo_ekko_get     IMPORTING VALUE(i_operacion)  TYPE text10
                                               i_po_number         TYPE ebeln
                                     EXPORTING VALUE(et_ekpo_ekko) TYPE ztt_gr_detail_pagos.

    CLASS-METHODS: ekpo_get         IMPORTING VALUE(i_operacion)  TYPE text10
                                              i_po_number         TYPE ebeln
                                    EXPORTING VALUE(et_ekpo_ekko) TYPE ztt_gr_detail_pagos.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ekpo_ekko IMPLEMENTATION.


  METHOD ekpo_ekko_get.

    CASE i_operacion.
      WHEN 'READ'.


        DATA:
          lt_business_data TYPE TABLE OF zscm_ekpo_ekko=>tys_z_i_ekpo_ekkotype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lt_range_ebeln TYPE RANGE OF ebeln,
          ls_range_ebeln LIKE LINE OF lt_range_ebeln,
          lt_range_loekz TYPE RANGE OF zekko-loekz,
          ls_range_loekz LIKE LINE OF lt_range_loekz.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          ls_ekpo_ekko        LIKE LINE OF et_ekpo_ekko.
*         lt_range_DELETE_MC TYPE RANGE OF <element_name>,
*         lt_range_UPDATE_MC TYPE RANGE OF <element_name>.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_EKPO_EKKO'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_EKPO_EKKO' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_ebeln.
            ls_range_ebeln-sign = 'I'.
            ls_range_ebeln-option = 'EQ'.
            ls_range_ebeln-low = i_po_number.
            APPEND ls_range_ebeln TO lt_range_ebeln.

            CLEAR lt_range_loekz.
            ls_range_loekz-sign = 'I'.
            ls_range_loekz-option = 'EQ'.
            ls_range_loekz-low = space.
            APPEND ls_range_loekz TO lt_range_loekz.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKPO_EKKO' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).
*
            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_ebeln ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'LOEKZ'
                                                                    it_range             = lt_range_loekz ).

*        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_ekpo_ekko.
              ls_ekpo_ekko-txz01 = ls_business_data-txz_01.
              APPEND ls_ekpo_ekko TO et_ekpo_ekko.
              CLEAR ls_ekpo_ekko.
            ENDLOOP.

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


    DATA:
      lt_business_data TYPE TABLE OF zscm_zvts_rfq_detail=>tys_z_i_ekpotype,
      lo_http_client   TYPE REF TO if_web_http_client,
      lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

    DATA:
      lt_range_ebeln TYPE RANGE OF ebeln,
      ls_range_ebeln LIKE LINE OF lt_range_ebeln,
      lt_range_loekz TYPE RANGE OF zekko-loekz,
      ls_range_loekz LIKE LINE OF lt_range_loekz.

    DATA:
      lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
      lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
      ls_ekpo_ekko        LIKE LINE OF et_ekpo_ekko.



    TRY.
        " Create http client
        DATA lv_dest TYPE string.
        SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSCM_ZVTS_RFQ_DETAIL'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVTS_RFQ_DETAIL' ).

        ASSERT lo_http_client IS BOUND.

        CLEAR lt_range_ebeln.
        ls_range_ebeln-sign = 'I'.
        ls_range_ebeln-option = 'EQ'.
        ls_range_ebeln-low = i_po_number.
        APPEND ls_range_ebeln TO lt_range_ebeln.

        CLEAR lt_range_loekz.
        ls_range_loekz-sign = 'I'.
        ls_range_loekz-option = 'EQ'.
        ls_range_loekz-low = space.
        APPEND ls_range_loekz TO lt_range_loekz.


        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKPO' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).
*
        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                it_range             = lt_range_ebeln ).
        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'LOEKZ'
                                                                it_range             = lt_range_loekz ).

        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
*        lo_filter_node_root = lo_filter_node_1.
        lo_request->set_filter( lo_filter_node_root ).

        lo_request->set_top( 50 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        LOOP AT lt_business_data INTO DATA(ls_business_data).
          MOVE-CORRESPONDING ls_business_data TO ls_ekpo_ekko.
          ls_ekpo_ekko-txz01 = ls_business_data-txz_01.
          APPEND ls_ekpo_ekko TO et_ekpo_ekko.
          CLEAR ls_ekpo_ekko.
        ENDLOOP.

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
