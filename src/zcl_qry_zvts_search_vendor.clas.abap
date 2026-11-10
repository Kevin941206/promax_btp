CLASS zcl_qry_zvts_search_vendor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: search_vendor_lfa1          IMPORTING VALUE(i_operacion) TYPE text10
                                                         prov               TYPE c
                                               EXPORTING VALUE(lfa1)        TYPE zst_lfa1.

    CLASS-METHODS: search_vendor_knvk          IMPORTING VALUE(i_operacion) TYPE text10
                                                         prov               TYPE c
                                               EXPORTING VALUE(knvk)        TYPE zst_knvk.

    CLASS-METHODS: search_vendor_adr6          IMPORTING VALUE(i_operacion) TYPE text10
                                                         knvk               TYPE zst_knvk
                                                         lfa1               TYPE zst_lfa1
                                               EXPORTING VALUE(smtp_addr)   TYPE zst_zvts_vendor-smtp_addr.

    CLASS-METHODS: search_vendor_lfa1V2        IMPORTING VALUE(i_operacion) TYPE text10
                                                         name               TYPE zst_lfb1-intad
                                               EXPORTING VALUE(lfa1)        TYPE ztt_lfa1.

    CLASS-METHODS: search_vendor_knvkV2          IMPORTING VALUE(i_operacion) TYPE text10
                                                           lfa1               TYPE zst_lfa1
                                                 EXPORTING VALUE(knvk)        TYPE zst_knvk.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_QRY_ZVTS_SEARCH_VENDOR IMPLEMENTATION.


  METHOD search_vendor_lfa1.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zvts_search_vendor=>tys_z_i_lfa_1_type,
          ls_business_data TYPE zscm_zvts_search_vendor=>tys_z_i_lfa_1_type,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
       EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_ZVTS_SEARCH_VENDOR'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVTS_SEARCH_VENDOR' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      lifnr  = prov ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LFA_1' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            MOVE-CORRESPONDING ls_business_data TO lfa1.
            lfa1-name1 = ls_business_data-name_1.
            lfa1-name2 = ls_business_data-name_2.
            lfa1-name3 = ls_business_data-name_3.
            lfa1-name4 = ls_business_data-name_4.
            lfa1-stcd1 = ls_business_data-stcd_1.
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


  METHOD search_vendor_knvk.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zvts_search_vendor=>tys_z_i_knvktype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_lifnr      TYPE RANGE OF lifnr,
          ls_range_lifnr      LIKE LINE OF lt_range_lifnr.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVTS_SEARCH_VENDOR'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVTS_SEARCH_VENDOR' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_lifnr.
            ls_range_lifnr-sign = 'I'.
            ls_range_lifnr-option = 'EQ'.
            ls_range_lifnr-low = prov.
            APPEND ls_range_lifnr TO lt_range_lifnr.
            CLEAR ls_range_lifnr.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_KNVK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'LIFNR'
                                                                    it_range             = lt_range_lifnr ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'KUNNR'
*                                                        it_range             = lt_range_KUNNR ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 1 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO knvk.
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


  METHOD search_vendor_adr6.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zvts_search_vendor=>tys_z_i_adr_6_type,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_ADDRNUMBER TYPE RANGE OF char10,
          ls_range_addrnumber LIKE LINE OF lt_range_addrnumber,
          lt_range_PERSNUMBER TYPE RANGE OF char10,
          ls_range_persnumber LIKE LINE OF lt_range_persnumber.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVTS_SEARCH_VENDOR'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVTS_SEARCH_VENDOR' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_addrnumber-sign = 'I'.
            ls_range_addrnumber-option = 'EQ'.
            ls_range_addrnumber-low = lfa1-adrnr.
            APPEND ls_range_addrnumber TO lt_range_addrnumber.

            ls_range_persnumber-sign = 'I'.
            ls_range_persnumber-option = 'EQ'.
            ls_range_persnumber-low = knvk-prsnr.
            APPEND ls_range_persnumber TO lt_range_persnumber.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ADR_6' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'ADDRNUMBER'
                                                                    it_range             = lt_range_ADDRNUMBER ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'PERSNUMBER'
                                                                    it_range             = lt_range_PERSNUMBER ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) WITH KEY flgdefault = abap_true.
            IF sy-subrc = 0.
              smtp_addr = ls_business_data-smtp_addr.
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

    ENDCASE.
  ENDMETHOD.


  METHOD search_vendor_lfa1v2.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zvts_search_vendor=>tys_z_i_lfa_1_type,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_name1      TYPE RANGE OF name1_gp,
          ls_range_name1      LIKE LINE OF lt_range_name1,
          lt_range_name2      TYPE RANGE OF name2_gp,
          ls_range_name2      LIKE LINE OF lt_range_name2,
          ls_lfa1             LIKE LINE OF lfa1.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVTS_SEARCH_VENDOR'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVTS_SEARCH_VENDOR' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_name1.
            ls_range_name1-sign = 'I'.
            ls_range_name1-option = 'CP'.
            ls_range_name1-low = name.
            APPEND ls_range_name1 TO lt_range_name1.
            CLEAR ls_range_name1.

            CLEAR lt_range_name2.
            ls_range_name2-sign = 'I'.
            ls_range_name2-option = 'CP'.
            ls_range_name2-low = name.
            APPEND ls_range_name2 TO lt_range_name2.
            CLEAR ls_range_name2.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LFA_1' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'NAME_1'
                                                                    it_range             = lt_range_name1 ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'NAME_2'
                                                                    it_range             = lt_range_name2 ).

            lo_filter_node_root = lo_filter_node_1->or( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              ls_lfa1-lifnr  = ls_business_data-lifnr.
              ls_lfa1-name1  = ls_business_data-name_1.
              ls_lfa1-name2  = ls_business_data-name_2.
              ls_lfa1-name3  = ls_business_data-name_3.
              ls_lfa1-name4  = ls_business_data-name_4.
              ls_lfa1-stcd1  = ls_business_data-stcd_1.
              ls_lfa1-adrnr  = ls_business_data-adrnr.
              APPEND ls_lfa1 TO lfa1.
              CLEAR ls_lfa1.
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


  METHOD search_vendor_knvkV2.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zvts_search_vendor=>tys_z_i_knvktype,
          ls_business_data TYPE zscm_zvts_search_vendor=>tys_z_i_knvktype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
       EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_ZVTS_SEARCH_VENDOR'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVTS_SEARCH_VENDOR' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      lifnr  = lfa1-lifnr ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_KNVK' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            MOVE-CORRESPONDING ls_business_data TO knvk.

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
