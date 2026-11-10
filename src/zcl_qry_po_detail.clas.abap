CLASS zcl_qry_po_detail DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: ekpo IMPORTING i_operacion TYPE text10
                                  i_ebeln     TYPE ebeln
                        EXPORTING et_pedidos  TYPE ztt_pedidos.

    CLASS-METHODS: ekbe IMPORTING i_operacion TYPE text10
                                  i_ebeln     TYPE ebeln
                                  i_ebelp     TYPE ebelp
                                  i_sel       TYPE char1
                        EXPORTING et_ekbe     TYPE ztt_ekbe.

    CLASS-METHODS: essr IMPORTING i_operacion TYPE text10
                                  i_lfbnr     TYPE char10
                        EXPORTING et_essr     TYPE ztt_essr.

    CLASS-METHODS: esll IMPORTING i_operacion TYPE text10
                                  i_packno    TYPE packno
                        EXPORTING et_esll     TYPE ztt_esll.

    CLASS-METHODS: ekko IMPORTING i_operacion TYPE text10
                                  i_ebeln     TYPE ebeln
                        EXPORTING es_ekko     TYPE zekko.

    CLASS-METHODS: ekes IMPORTING i_operacion TYPE text10
                                  i_ebeln     TYPE ebeln
                                  i_ebelp     TYPE ebelp
                        EXPORTING et_ekes     TYPE ztt_ekes.

    CLASS-METHODS: t006a IMPORTING i_operacion TYPE text10
                                   i_spras     TYPE spras
                                   i_msehi     TYPE msehi
                         EXPORTING e_mseh3     TYPE mseh3.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_QRY_PO_DETAIL IMPLEMENTATION.


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
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_ebeln      TYPE RANGE OF ebeln,
          ls_range_ebeln      LIKE LINE OF lt_range_ebeln,
          lt_range_elikz      TYPE RANGE OF char1,
          ls_range_elikz      LIKE LINE OF lt_range_elikz,
          lt_range_loekz      TYPE RANGE OF eloek,
          ls_range_loekz      LIKE LINE OF lt_range_loekz,
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

            ls_range_ebeln-sign = 'I'.
            ls_range_ebeln-option = 'EQ'.
            ls_range_ebeln-low = i_ebeln.
            APPEND ls_range_ebeln TO lt_range_ebeln.
            CLEAR ls_range_ebeln.

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

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKPO' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_ebeln ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'ELIKZ'
                                                                    it_range             = lt_range_elikz ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'LOEKZ'
                                                                    it_range             = lt_range_loekz ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_pedidos.
              ls_pedidos-txz01 = ls_business_data-txz_01.
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


  METHOD ekbe.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_ekbetype,
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
          lt_range_ebelp      TYPE RANGE OF ebelp,
          ls_range_ebelp      LIKE LINE OF lt_range_ebelp,
          lt_range_bewtp      TYPE RANGE OF char1,
          ls_range_bewtp      LIKE LINE OF lt_range_bewtp,
          lt_range_bwart      TYPE RANGE OF bwart,
          ls_range_bwart      LIKE LINE OF lt_range_bwart,
          ls_ekbe             LIKE LINE OF et_ekbe.

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

            ls_range_ebelp-sign = 'I'.
            ls_range_ebelp-option = 'EQ'.
            ls_range_ebelp-low = i_ebelp.
            APPEND ls_range_ebelp TO lt_range_ebelp.

            ls_range_bewtp-sign = 'I'.
            ls_range_bewtp-option = 'EQ'.
            ls_range_bewtp-low = 'E'.
            APPEND ls_range_bewtp TO lt_range_bewtp.

            IF i_sel = '1'.
              ls_range_bwart-sign = 'I'.
              ls_range_bwart-option = 'EQ'.
              ls_range_bwart-low = '101'.
              APPEND ls_range_bwart TO lt_range_bwart.
              ls_range_bwart-low = '103'.
              APPEND ls_range_bwart TO lt_range_bwart.
              ls_range_bwart-low = '105'.
              APPEND ls_range_bwart TO lt_range_bwart.
              ls_range_bwart-low = '911'.
              APPEND ls_range_bwart TO lt_range_bwart.
              ls_range_bwart-low = '913'.
              APPEND ls_range_bwart TO lt_range_bwart.
            ELSEIF i_sel = '2'.
              ls_range_bwart-sign = 'I'.
              ls_range_bwart-option = 'EQ'.
              ls_range_bwart-low = '102'.
              APPEND ls_range_bwart TO lt_range_bwart.
              ls_range_bwart-low = '104'.
              APPEND ls_range_bwart TO lt_range_bwart.
              ls_range_bwart-low = '106'.
              APPEND ls_range_bwart TO lt_range_bwart.
            ENDIF.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKBE' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_ebeln ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELP'
                                                                    it_range             = lt_range_ebelp ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'BEWTP'
                                                                    it_range             = lt_range_bewtp ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BWART'
                                                                    it_range             = lt_range_bwart ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_ekbe.
              APPEND ls_ekbe TO et_ekbe.
              CLEAR ls_ekbe.
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


  METHOD essr.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_essrtype,
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
          lt_range_lblni      TYPE RANGE OF char10,
          ls_range_lblni      LIKE LINE OF lt_range_lblni,
          lt_range_loekz      TYPE RANGE OF char1,
          ls_range_loekz      LIKE LINE OF lt_range_loekz,
          ls_essr             LIKE LINE OF et_essr.

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

            ls_range_lblni-sign = 'I'.
            ls_range_lblni-option = 'EQ'.
            ls_range_lblni-low = i_lfbnr.
            APPEND ls_range_lblni TO lt_range_lblni.

            ls_range_loekz-sign = 'I'.
            ls_range_loekz-option = 'EQ'.
            ls_range_loekz-low = space.
            APPEND ls_range_loekz TO lt_range_loekz.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ESSR' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'LBLNI'
                                                                    it_range             = lt_range_lblni ).
            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'LOEKZ'
                                                                    it_range             = lt_range_loekz ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            MOVE-CORRESPONDING ls_business_data TO ls_essr.
            APPEND ls_essr TO et_essr.
            CLEAR ls_essr.

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


  METHOD esll.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_eslltype,
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
          lt_range_packno     TYPE RANGE OF packno,
          ls_range_packno     LIKE LINE OF lt_range_packno,
          ls_esll             LIKE LINE OF et_esll.

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

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ESLL' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'PACKNO'
                                                                    it_range             = lt_range_packno ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 500 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_esll.
              ls_esll-package = ls_business_data-package_2.
              APPEND ls_esll TO et_esll.
              CLEAR ls_esll.
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


  METHOD ekko.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_po_details=>tys_z_i_ekkotype,
          ls_business_data TYPE zscm_po_details=>tys_z_i_ekkotype,
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
                                                     proxy_model_id      = 'ZSCM_PO_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_PO_DETAIL' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      ebeln  = i_ebeln ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKKO' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            MOVE-CORRESPONDING ls_business_data TO es_ekko.

          CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
            " Handle remote Exception
            " It contains details about the problems of your http(s) connection

          CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
            " Handle Exception

          CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
            " Handle Exception
            RAISE SHORTDUMP lx_web_http_client_error.


        ENDTRY.
*        DATA:
*          lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_ekkotype,
*          lo_http_client   TYPE REF TO if_web_http_client,
*          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
*          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
*          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.
*
*        DATA:
*          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
*          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
*          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
*          lo_filter_node_3    TYPE REF TO /iwbep/if_cp_filter_node,
*          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
*          lt_range_ebeln      TYPE RANGE OF ebeln,
*          ls_ekko             LIKE LINE OF et_ekko.
*
*        TRY.
*            " Create http client
*            DATA lv_dest TYPE string.
*            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
*            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
*            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
*            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
*              EXPORTING
*                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
*                                                     proxy_model_id      = 'ZSCM_PO_DETAILS'
*                                                     proxy_model_version = '0001' )
*                io_http_client             = lo_http_client
*                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_PO_DETAIL' ).
*
*            ASSERT lo_http_client IS BOUND.
*
*            " Navigate to the resource and create a request for the read operation
*            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKKO' )->create_request_for_read( ).
*
*            " Create the filter tree
**            lo_filter_factory = lo_request->create_filter_factory( ).
**
**            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
**                                                                    it_range             = lt_range_ebeln ).
**
**            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
**            lo_request->set_filter( lo_filter_node_root ).
*
**lo_request->set_top( 50 )->set_skip( 0 ).
*
*            " Execute the request and retrieve the business data
*            lo_response = lo_request->execute( ).
*            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).
*
*            LOOP AT lt_business_data INTO DATA(ls_business_data).
*              MOVE-CORRESPONDING ls_business_data TO ls_ekko.
*              APPEND ls_ekko TO et_ekko.
*              CLEAR ls_ekko.
*            ENDLOOP.
*
*          CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
*            " Handle remote Exception
*            " It contains details about the problems of your http(s) connection
*
*          CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
*            " Handle Exception
*
*          CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
*            " Handle Exception
*            RAISE SHORTDUMP lx_web_http_client_error.
*
*        ENDTRY.
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
          lo_filter_node_3    TYPE REF TO /iwbep/if_cp_filter_node,
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

            ls_range_ebelp-sign = 'I'.
            ls_range_ebelp-option = 'EQ'.
            ls_range_ebelp-low = i_ebelp.
            APPEND ls_range_ebelp TO lt_range_ebelp.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKES' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_ebeln ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELP'
                                                                    it_range             = lt_range_ebelp ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

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


  METHOD t006a.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_po_details=>tys_z_i_t_006_atype,
          ls_business_data TYPE zscm_po_details=>tys_z_i_t_006_atype,
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
                                                     proxy_model_id      = 'ZSCM_PO_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_PO_DETAIL' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      spras  = i_spras
                      msehi  = i_msehi ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_006_A' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            e_mseh3 = ls_business_data-mseh_3.

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
