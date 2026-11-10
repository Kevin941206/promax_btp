CLASS zcl_qry_po_view_confirmed DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: ekko IMPORTING i_operacion TYPE text10
                                  i_lifnr     TYPE lifnr
                                  i_bukrs     TYPE bukrs
                                  i_ebeln     TYPE ebeln
                        EXPORTING et_ekko     TYPE ztt_pedidos_cab.

    CLASS-METHODS: ekpo IMPORTING i_operacion    TYPE text10
                                  i_po_item      TYPE ebelp
                                  it_pedidos_cab TYPE ztt_pedidos_cab
                        EXPORTING et_pedidos     TYPE ztt_pedidos.

    CLASS-METHODS: ekes IMPORTING i_operacion TYPE text10
                                  i_ebeln     TYPE ebeln
                                  i_ebelp     TYPE ebelp
                        EXPORTING et_ekes     TYPE ztt_ekes.

    CLASS-METHODS: likp IMPORTING i_operacion TYPE text10
                                  i_vbeln     TYPE vbeln
                        EXPORTING e_traty     TYPE char4
                                  e_traid     TYPE char20.

    CLASS-METHODS: lips IMPORTING i_operacion TYPE text10
                                  i_vbeln     TYPE vbeln
                                  i_vbelp     TYPE posnr
                        EXPORTING e_kdmat     TYPE char35.

    CLASS-METHODS: tvtyt IMPORTING i_operacion TYPE text10
                                   i_traty     TYPE char4
                                   i_spras     TYPE spras
                         EXPORTING e_vtext     TYPE vtext.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_QRY_PO_VIEW_CONFIRMED IMPLEMENTATION.


  METHOD ekko.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_ekkotype,
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
          lt_range_ebeln      TYPE RANGE OF ebeln,
          ls_range_ebeln      LIKE LINE OF lt_range_ebeln,
          lt_range_bukrs      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_lifnr      TYPE RANGE OF lifnr,
          ls_range_lifnr      LIKE LINE OF lt_range_lifnr,
          lt_range_bstyp      TYPE RANGE OF bstyp,
          ls_range_bstyp      LIKE LINE OF lt_range_bstyp,
          ls_ekko             LIKE LINE OF et_ekko.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_PO_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_PO_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            IF i_ebeln IS NOT INITIAL.
              ls_range_ebeln-sign = 'I'.
              ls_range_ebeln-option = 'EQ'.
              ls_range_ebeln-low = i_ebeln.
              APPEND ls_range_ebeln TO lt_range_ebeln.
            ENDIF.
            IF i_bukrs IS NOT INITIAL.
              ls_range_bukrs-sign = 'I'.
              ls_range_bukrs-option = 'EQ'.
              ls_range_bukrs-low = i_bukrs.
              APPEND ls_range_bukrs TO lt_range_bukrs.
            ENDIF.

            ls_range_lifnr-sign = 'I'.
            ls_range_lifnr-option = 'EQ'.
            ls_range_lifnr-low = i_lifnr.
            CLEAR ls_range_lifnr-high.
            APPEND ls_range_lifnr TO lt_range_lifnr.

            ls_range_bstyp-sign = 'I'.
            ls_range_bstyp-option = 'EQ'.
            ls_range_bstyp-low = 'F'.
            APPEND ls_range_bstyp TO lt_range_bstyp.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKKO' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).
            IF lt_range_ebeln IS NOT INITIAL.
              lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                      it_range             = lt_range_ebeln ).
            ENDIF.
            IF lt_range_bukrs IS NOT INITIAL.
              lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                      it_range             = lt_range_bukrs ).
            ENDIF.
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'LIFNR'
                                                                    it_range             = lt_range_lifnr ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BSTYP'
                                                                    it_range             = lt_range_bstyp ).
            IF lt_range_ebeln IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            ELSE.
              lo_filter_node_root = lo_filter_node_2->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            ENDIF.

            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_ekko.
              APPEND ls_ekko TO et_ekko.
              CLEAR ls_ekko.
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


  METHOD ekpo.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_ekpotype,
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
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_ebeln      TYPE RANGE OF ebeln,
          ls_range_ebeln      LIKE LINE OF lt_range_ebeln,
          lt_range_ebelp      TYPE RANGE OF ebelp,
          ls_range_ebelp      LIKE LINE OF lt_range_ebelp,
          lt_range_elikz      TYPE RANGE OF char1,
          ls_range_elikz      LIKE LINE OF lt_range_elikz,
          lt_range_loekz      TYPE RANGE OF eloek,
          ls_range_loekz      LIKE LINE OF lt_range_loekz,
          lt_range_bstyp      TYPE RANGE OF bstyp,
          ls_range_bstyp      LIKE LINE OF lt_range_bstyp,
          ls_pedidos          LIKE LINE OF et_pedidos.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_PO_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_PO_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            LOOP AT it_pedidos_cab INTO DATA(ls_ped).
              ls_range_ebeln-sign = 'I'.
              ls_range_ebeln-option = 'EQ'.
              ls_range_ebeln-low = ls_ped-ebeln.
              APPEND ls_range_ebeln TO lt_range_ebeln.
              CLEAR ls_range_ebeln.
            ENDLOOP.

            ls_range_ebelp-sign = 'I'.
            ls_range_ebelp-option = 'EQ'.
            ls_range_ebelp-low = i_po_item.
            APPEND ls_range_ebelp TO lt_range_ebelp.
            CLEAR ls_range_ebelp.

            ls_range_elikz-sign = 'I'.
            ls_range_elikz-option = 'EQ'.
            ls_range_elikz-low = space.
            APPEND ls_range_elikz TO lt_range_elikz.
            CLEAR ls_range_elikz.

            ls_range_loekz-sign = 'I'.
            ls_range_loekz-option = 'EQ'.
            ls_range_loekz-low = space.
            APPEND ls_range_loekz TO lt_range_loekz.
            CLEAR ls_range_loekz.

            ls_range_bstyp-sign = 'I'.
            ls_range_bstyp-option = 'EQ'.
            ls_range_bstyp-low = 'F'.
            APPEND ls_range_bstyp TO lt_range_bstyp.
            CLEAR ls_range_bstyp.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKPO' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_ebeln ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELP'
                                                                    it_range             = lt_range_ebelp ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'ELIKZ'
                                                                    it_range             = lt_range_elikz ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'LOEKZ'
                                                                    it_range             = lt_range_loekz ).
            lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'BSTYP'
                                                                    it_range             = lt_range_bstyp ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_pedidos.
              APPEND ls_pedidos TO et_pedidos.
              CLEAR ls_pedidos.
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


  METHOD ekes.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_ekestype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_ebeln      TYPE RANGE OF ebeln,
          ls_range_ebeln      LIKE LINE OF lt_range_ebeln,
          lt_range_ebelp      TYPE RANGE OF ebelp,
          ls_range_ebelp      LIKE LINE OF lt_range_ebelp,
          ls_ekes             LIKE LINE OF et_ekes.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_PO_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_PO_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_ebeln-sign = 'I'.
            ls_range_ebeln-option = 'EQ'.
            ls_range_ebeln-low = i_ebeln.
            APPEND ls_range_ebeln TO lt_range_ebeln.
            CLEAR ls_range_ebeln.

            ls_range_ebelp-sign = 'I'.
            ls_range_ebelp-option = 'EQ'.
            ls_range_ebelp-low = i_ebelp.
            APPEND ls_range_ebelp TO lt_range_ebelp.
            CLEAR ls_range_ebelp.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKES' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_ebeln ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELP'
                                                                    it_range             = lt_range_ebelp ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_ekes.
              APPEND ls_ekes TO et_ekes.
              CLEAR ls_ekes.
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


  METHOD likp.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_sales_document_info=>tys_z_i_likptype,
          ls_business_data TYPE zscm_sales_document_info=>tys_z_i_likptype,
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
                                                     proxy_model_id      = 'ZSCM_SALES_DOCUMENT_INFO'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALES_DOCUMENT_INFO' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      vbeln  = i_vbeln ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LIKP' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            e_traty = ls_business_data-traty.
            e_traid = ls_business_data-traid.

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


  METHOD lips.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_sales_document_info=>tys_z_i_lipstype,
          ls_business_data TYPE zscm_sales_document_info=>tys_z_i_lipstype,
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
                                                     proxy_model_id      = 'ZSCM_SALES_DOCUMENT_INFO'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALES_DOCUMENT_INFO' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      vbeln  = i_vbeln
                      posnr  = i_vbelp ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LIPS' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            e_kdmat = ls_business_data-kdmat.

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


  METHOD tvtyt.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_po_view_confirmed=>tys_z_i_tvtyttype,
          ls_business_data TYPE zscm_po_view_confirmed=>tys_z_i_tvtyttype,
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
                                                     proxy_model_id      = 'ZSCM_PO_VIEW_CONFIRMED'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_PO_VIEW_CONFIRMED' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      spras  = i_spras
                      traty  = i_traty ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_TVTYT' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            e_vtext = ls_business_data-vtext.

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
