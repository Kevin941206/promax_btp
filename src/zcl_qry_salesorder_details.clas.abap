CLASS zcl_qry_salesorder_details DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS vbak IMPORTING VALUE(i_operacion) TYPE text10
                                 i_sales_order      TYPE vbeln_va
                       EXPORTING et_order_header    TYPE ztt_bapisdhd.

    CLASS-METHODS vbap IMPORTING VALUE(i_operacion) TYPE text10
                                 i_sales_order      TYPE vbeln_va
                       EXPORTING et_order_items     TYPE ztt_bapisdit.

    CLASS-METHODS vbpa IMPORTING VALUE(i_operacion) TYPE text10
                                 i_sales_order      TYPE vbeln_va
                       EXPORTING et_order_partner   TYPE ztt_bapisdpart.

    CLASS-METHODS vbuk IMPORTING VALUE(i_operacion) TYPE text10
                                 i_sales_order      TYPE vbeln_va
                       EXPORTING et_status_header   TYPE ztt_bapisdhdst.

    CLASS-METHODS adrc IMPORTING VALUE(i_operacion) TYPE text10
                                 it_order_partner   TYPE ztt_bapisdpart
                       EXPORTING et_order_address   TYPE ztt_bapisdcoad.

    CLASS-METHODS konv IMPORTING VALUE(i_operacion)  TYPE text10
                                 it_order_header     TYPE ztt_bapisdhd
                       EXPORTING et_order_conditions TYPE ztt_bapisdcond.

    CLASS-METHODS knvk IMPORTING VALUE(i_operacion) TYPE text10
                                 i_kunnr            TYPE kunnr
                       EXPORTING et_knvk            TYPE ztt_knvk.

    CLASS-METHODS adrp IMPORTING VALUE(i_operacion) TYPE text10
                                 it_knvk            TYPE ztt_knvk
                       EXPORTING et_adrp            TYPE ztt_adrp.

    CLASS-METHODS tsabt IMPORTING VALUE(i_operacion) TYPE text10
                                  it_knvk            TYPE ztt_knvk
                        EXPORTING et_tsabt           TYPE ztt_tsabt.

    CLASS-METHODS tpfkt IMPORTING VALUE(i_operacion) TYPE text10
                                  it_knvk            TYPE ztt_knvk
                        EXPORTING et_tpfkt           TYPE ztt_tpfkt.

    CLASS-METHODS t005t IMPORTING VALUE(i_operacion) TYPE text10
                                  it_address         TYPE ztt_bapisdcoad
                        EXPORTING et_t005t           TYPE ztt_t005t.

    CLASS-METHODS tvarvc IMPORTING VALUE(i_operacion) TYPE text10
                         EXPORTING et_tvarvc          TYPE ztt_tvarvc.

    CLASS-METHODS lips IMPORTING VALUE(i_operacion) TYPE text10
                                 i_vbeln            TYPE vbeln
                       EXPORTING et_lips            TYPE ztt_lips.

    CLASS-METHODS vbfa IMPORTING VALUE(i_operacion) TYPE text10
                                 i_vbeln            TYPE vbeln
                       EXPORTING et_vbfa            TYPE ztt_vbfa.

    CLASS-METHODS vbrp IMPORTING VALUE(i_operacion) TYPE text10
                                 it_vbfa            TYPE ztt_vbfa
                       EXPORTING et_vbrp            TYPE ztt_vbrp.

    CLASS-METHODS vbrk IMPORTING VALUE(i_operacion) TYPE text10
                                 it_vbrp            TYPE ztt_vbrp
                       EXPORTING et_vbrk            TYPE ztt_vbrk.

    CLASS-METHODS t052u IMPORTING VALUE(i_operacion) TYPE text10
                                  it_vbrk            TYPE ztt_vbrk
                        EXPORTING et_t052u           TYPE ztt_t052u.

    CLASS-METHODS t042z IMPORTING VALUE(i_operacion) TYPE text10
                                  it_vbrk            TYPE ztt_vbrk
                        EXPORTING et_t042z           TYPE ztt_t042z.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_QRY_SALESORDER_DETAILS IMPLEMENTATION.


  METHOD vbap.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_sales_document_info=>tys_z_i_vbaptype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_vbeln      TYPE RANGE OF vbeln_va,
          ls_range_vbeln      LIKE LINE OF lt_range_vbeln,
          ls_items            LIKE LINE OF et_order_items.



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

            ls_range_vbeln-sign = 'I'.
            ls_range_vbeln-option = 'EQ'.
            ls_range_vbeln-low = i_sales_order.
            APPEND ls_range_vbeln TO lt_range_vbeln.
            CLEAR ls_range_vbeln.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VBAP' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELN'
                                                                    it_range             = lt_range_vbeln ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'POSNR'
*                                                        it_range             = lt_range_POSNR ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              ls_items-doc_number = |{ ls_business_data-vbeln ALPHA = IN }|.
              ls_items-itm_number = ls_business_data-posnr.
              ls_items-material = ls_business_data-matnr.
              ls_items-short_text = ls_business_data-arktx.
              ls_items-base_uom = ls_business_data-meins.
              ls_items-req_qty = ls_business_data-kwmeng.
              ls_items-net_price = ls_business_data-netpr.
              ls_items-net_value = ls_business_data-netwr.
              ls_items-currency = ls_business_data-waerk.
              ls_items-plant = ls_business_data-werks.
              APPEND ls_items TO et_order_items.
              CLEAR ls_items.
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


  METHOD vbpa.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_details=>tys_z_i_vbpatype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_vbeln      TYPE RANGE OF vbeln_va,
          ls_range_vbeln      LIKE LINE OF lt_range_vbeln,
          ls_order_partner    LIKE LINE OF et_order_partner.


        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALESORDER_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALESORDER_DETAILS' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_vbeln-sign = 'I'.
            ls_range_vbeln-option = 'EQ'.
            ls_range_vbeln-low = i_sales_order.
            APPEND ls_range_vbeln TO lt_range_vbeln.
            CLEAR ls_range_vbeln.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VBAK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELN'
                                                                    it_range             = lt_range_vbeln ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'ERDAT'
*                                                        it_range             = lt_range_ERDAT ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              ls_order_partner-sd_doc = |{ ls_business_data-vbeln ALPHA = IN }|.
              ls_order_partner-partn_role = ls_business_data-parvw.
              ls_order_partner-customer = ls_business_data-kunnr.
              ls_order_partner-address = ls_business_data-adrnr.
              APPEND ls_order_partner TO et_order_partner.
              CLEAR ls_order_partner.
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


  METHOD vbuk.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_list=>tys_z_i_vbuktype,
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
          ls_range_VBELN      LIKE LINE OF lt_range_VBELN,
          ls_status_header    LIKE LINE OF et_status_header.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALESORDER_LIST'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALESORDER_LIST' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_VBELN-sign = 'I'.
            ls_range_VBELN-option = 'EQ'.
            ls_range_VBELN-low = i_sales_order.
            APPEND ls_range_VBELN TO lt_range_VBELN.
            CLEAR ls_range_VBELN.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VBUK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELN'
                                                        it_range             = lt_range_VBELN ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'RFSTK'
*                                                        it_range             = lt_range_RFSTK ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              ls_status_header-sd_doc = |{ ls_business_data-vbeln ALPHA = IN }|.
              ls_status_header-overallrej = ls_business_data-abstk.
              ls_status_header-prc_stat_h = ls_business_data-gbstk.
              APPEND ls_status_header TO et_status_header.
              CLEAR ls_status_header.
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


  METHOD knvk.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_details=>tys_z_i_knvktype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_kunnr      TYPE RANGE OF kunnr,
          ls_range_kunnr      LIKE LINE OF lt_range_kunnr,
          ls_knvk             LIKE LINE OF et_knvk.


        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALESORDER_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALESORDER_DETAILS' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_kunnr-sign = 'I'.
            ls_range_kunnr-option = 'EQ'.
            ls_range_kunnr-low = i_kunnr.
            APPEND ls_range_kunnr TO lt_range_kunnr.
            CLEAR ls_range_kunnr.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_KNVK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'KUNNR'
                                                                    it_range             = lt_range_kunnr ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'KUNNR'
*                                                        it_range             = lt_range_KUNNR ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_knvk.
              APPEND ls_knvk TO et_knvk.
              CLEAR ls_knvk.
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


  METHOD konv.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_details=>tys_z_i_konvtype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_knumv      TYPE RANGE OF char10,
          ls_range_knumv      LIKE LINE OF lt_range_knumv,
          ls_cond             LIKE LINE OF et_order_conditions.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALESORDER_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALESORDER_DETAILS' ).

            ASSERT lo_http_client IS BOUND.

            LOOP AT it_order_header INTO DATA(ls_header).
              ls_range_knumv-sign = 'I'.
              ls_range_knumv-option = 'EQ'.
              ls_range_knumv-low = ls_header-conditions.
              APPEND ls_range_knumv TO lt_range_knumv.
              CLEAR ls_range_knumv.
            ENDLOOP.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_KONV' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'KNUMV'
                                                                    it_range             = lt_range_KNUMV ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'KPOSN'
*                                                        it_range             = lt_range_KPOSN ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              ls_cond-sd_doc = ls_header-doc_number.
              ls_cond-condit_no = ls_business_data-knumv.
              ls_cond-condtype = ls_business_data-kntyp.
              ls_cond-condvalue = ls_business_data-kwert.
              APPEND ls_cond TO et_order_conditions.
              CLEAR ls_cond.
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


  METHOD adrp.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_details=>tys_z_i_adrptype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_PERSNUMBER TYPE RANGE OF ad_persnum,
          ls_range_persnumer  LIKE LINE OF lt_range_persnumber,
          lt_range_DATE_TO    TYPE RANGE OF datn,
          ls_range_date_to    LIKE LINE OF lt_range_date_to,
          ls_adrp             LIKE LINE OF et_adrp.


        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALESORDER_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALESORDER_DETAILS' ).

            ASSERT lo_http_client IS BOUND.

            LOOP AT it_knvk INTO DATA(ls_knvk).
              ls_range_persnumer-sign = 'I'.
              ls_range_persnumer-option = 'EQ'.
              ls_range_persnumer-low = ls_knvk-prsnr.
              APPEND ls_range_persnumer TO lt_range_persnumber.
              CLEAR ls_range_persnumer.
            ENDLOOP.
            ls_range_date_to-sign = 'I'.
            ls_range_date_to-option = 'GE'.
            ls_range_date_to-low = sy-datum.
            APPEND ls_range_date_to TO lt_range_date_to.
            CLEAR ls_range_date_to.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ADRP' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'PERSNUMBER'
                                                                    it_range             = lt_range_PERSNUMBER ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'DATE_TO'
                                                                    it_range             = lt_range_DATE_TO ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_adrp.
              APPEND ls_adrp TO et_adrp.
              CLEAR ls_adrp.
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


  METHOD tpfkt.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_details=>tys_z_i_tpfkttype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_SPRAS      TYPE RANGE OF spras,
          ls_range_spras      LIKE LINE OF lt_range_spras,
          lt_range_pafkt      TYPE RANGE OF char2,
          ls_range_pafkt      LIKE LINE OF lt_range_pafkt,
          ls_tpfkt            LIKE LINE OF et_tpfkt.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALESORDER_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALESORDER_DETAILS' ).

            ASSERT lo_http_client IS BOUND.

            LOOP AT it_knvk INTO DATA(ls_knvk).
              ls_range_pafkt-sign = 'I'.
              ls_range_pafkt-option = 'EQ'.
              ls_range_pafkt-low = ls_knvk-pafkt.
              APPEND ls_range_pafkt TO lt_range_pafkt.
              CLEAR ls_range_pafkt.
            ENDLOOP.

            ls_range_spras-sign = 'I'.
            ls_range_spras-option = 'EQ'.
            ls_range_spras-low = 'S'.
            APPEND ls_range_spras TO lt_range_spras.
            ls_range_spras-low = 'E'.
            APPEND ls_range_spras TO lt_range_spras.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_TPFKT' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'SPRAS'
                                                                    it_range             = lt_range_SPRAS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'PAFKT'
                                                                    it_range             = lt_range_PAFKT ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_tpfkt.
              APPEND ls_tpfkt TO et_tpfkt.
              CLEAR ls_tpfkt.
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


  METHOD t005t.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_details=>tys_z_i_t_005_ttype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_SPRAS      TYPE RANGE OF spras,
          ls_range_spras      LIKE LINE OF lt_range_spras,
          lt_range_land1      TYPE RANGE OF land1,
          ls_range_land1      LIKE LINE OF lt_range_land1,
          ls_t005t            LIKE LINE OF et_t005t.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALESORDER_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALESORDER_DETAILS' ).

            ASSERT lo_http_client IS BOUND.

            LOOP AT it_address INTO DATA(ls_address).
              ls_range_land1-sign = 'I'.
              ls_range_land1-option = 'EQ'.
              ls_range_land1-low = ls_address-country.
              APPEND ls_range_land1 TO lt_range_land1.
              CLEAR ls_range_land1.

              ls_range_spras-sign = 'I'.
              ls_range_spras-option = 'EQ'.
              ls_range_spras-low = ls_address-langu.
              APPEND ls_range_spras TO lt_range_spras.
            ENDLOOP.




            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T005T' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'SPRAS'
                                                                    it_range             = lt_range_SPRAS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'LAND1'
                                                                    it_range             = lt_range_LAND1 ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_t005t.
              APPEND ls_t005t TO et_t005t.
              CLEAR ls_t005t.
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


  METHOD tsabt.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_details=>tys_z_i_tsabttype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_SPRAS      TYPE RANGE OF spras,
          ls_range_spras      LIKE LINE OF lt_range_spras,
          lt_range_ABTNR      TYPE RANGE OF char4,
          ls_range_abtrn      LIKE LINE OF lt_range_abtnr,
          ls_tsabt            LIKE LINE OF et_tsabt.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALESORDER_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALESORDER_DETAILS' ).

            ASSERT lo_http_client IS BOUND.

            LOOP AT it_knvk INTO DATA(ls_knvk).
              ls_range_abtrn-sign = 'I'.
              ls_range_abtrn-option = 'EQ'.
              ls_range_abtrn-low = ls_knvk-abtnr.
              APPEND ls_range_abtrn TO lt_range_abtnr.
              CLEAR ls_range_abtrn.
            ENDLOOP.

            ls_range_spras-sign = 'I'.
            ls_range_spras-option = 'EQ'.
            ls_range_spras-low = 'S'.
            APPEND ls_range_spras TO lt_range_spras.
            ls_range_spras-low = 'E'.
            APPEND ls_range_spras TO lt_range_spras.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_TSABT' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'SPRAS'
                                                                    it_range             = lt_range_SPRAS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'ABTNR'
                                                                    it_range             = lt_range_ABTNR ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_tsabt.
              APPEND ls_tsabt TO et_tsabt.
              CLEAR ls_tsabt.
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


  METHOD tvarvc.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_details=>tys_z_i_tvarvctype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_name       TYPE RANGE OF name1_gp,
          ls_range_name       LIKE LINE OF lt_range_name,
          ls_tvarvc           LIKE LINE OF et_tvarvc.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALESORDER_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALESORDER_DETAILS' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_name-sign = 'I'.
            ls_range_name-option = 'EQ'.
            ls_range_name-low = 'YSD_TOTCONDITEM'.
            APPEND ls_range_name TO lt_range_name.
            ls_range_name-low = 'YSD_TOT_SUBTOTAL'.
            APPEND ls_range_name TO lt_range_name.
            ls_range_name-low = 'YSD_TOT_DESCUENTO'.
            APPEND ls_range_name TO lt_range_name.
            ls_range_name-low = 'YSD_TOT_IVA'.
            APPEND ls_range_name TO lt_range_name.
            ls_range_name-low = 'YSD_TOT_TOTAL'.
            APPEND ls_range_name TO lt_range_name.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_TVARVC' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'NAME'
                                                                    it_range             = lt_range_NAME ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_tvarvc.
              APPEND ls_tvarvc TO et_tvarvc.
              CLEAR ls_tvarvc.
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


  METHOD lips.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_sales_document_info=>tys_z_i_lipstype,
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
          lt_range_POSNR      TYPE RANGE OF posnr,
          ls_lips             LIKE LINE OF et_lips.



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

            CLEAR lt_range_vbeln.
            ls_range_vbeln-sign = 'I'.
            ls_range_vbeln-option = 'EQ'.
            ls_range_vbeln-low = i_vbeln.
            APPEND ls_range_vbeln TO lt_range_vbeln.
            CLEAR ls_range_vbeln.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LIPS' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELN'
                                                                    it_range             = lt_range_VBELN ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'POSNR'
*                                                        it_range             = lt_range_POSNR ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_lips.
              APPEND ls_lips TO et_lips.
              CLEAR ls_lips.
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


  METHOD vbfa.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_details=>tys_z_i_vbfatype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_vbtyp_n    TYPE RANGE OF char1,
          ls_range_vbtyp_n    LIKE LINE OF lt_range_vbtyp_n,
          lt_range_vbelv      TYPE RANGE OF vbeln,
          ls_range_vbelv      LIKE LINE OF lt_range_vbelv,
          ls_vbfa             LIKE LINE OF et_vbfa.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALESORDER_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALESORDER_DETAILS' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_vbelv-sign = 'I'.
            ls_range_vbelv-option = 'EQ'.
            ls_range_vbelv-low = i_vbeln.
            APPEND ls_range_vbelv TO lt_range_vbelv.
            ls_range_vbtyp_n-sign = 'I'.
            ls_range_vbtyp_n-option = 'EQ'.
            ls_range_vbtyp_n-low = 'M'.
            APPEND ls_range_vbtyp_n TO lt_range_vbtyp_n.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VBFA' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'VBTYP_N'
                                                                    it_range             = lt_range_vbtyp_n ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELV'
                                                                    it_range             = lt_range_VBELV ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_vbfa.
              APPEND ls_vbfa TO et_vbfa.
              CLEAR ls_vbfa.
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


  METHOD vbrp.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_sales_document_info=>tys_z_i_vbrptype,
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
          lt_range_POSNR      TYPE RANGE OF posnr,
          ls_range_posnr      LIKE LINE OF lt_range_posnr,
          ls_vbrp             LIKE LINE OF et_vbrp.



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

            LOOP AT it_vbfa INTO DATA(ls_vbfa).
              ls_range_vbeln-sign = 'I'.
              ls_range_vbeln-option = 'EQ'.
              ls_range_vbeln-low = ls_vbfa-vbeln.
              APPEND ls_range_vbeln TO lt_range_vbeln.
              CLEAR ls_range_vbeln.
              ls_range_posnr-sign = 'I'.
              ls_range_posnr-option = 'EQ'.
              ls_range_posnr-low = ls_vbfa-posnn.
              APPEND ls_range_posnr TO lt_range_posnr.
              CLEAR ls_range_posnr.
            ENDLOOP..

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VBRP' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELN'
                                                                    it_range             = lt_range_VBELN ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'POSNR'
                                                                    it_range             = lt_range_POSNR ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_vbrp.
              APPEND ls_vbrp TO et_vbrp.
              CLEAR ls_vbrp.
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


  METHOD vbrk.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_sales_document_info=>tys_z_i_vbrktype,
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
          lt_range_VBELN      TYPE RANGE OF vbeln,
          ls_range_vbeln      LIKE LINE OF lt_range_vbeln,
          lt_range_fksto      TYPE RANGE OF char1,
          ls_range_fksto      LIKE LINE OF lt_range_fksto,
          lt_range_sfakn      TYPE RANGE OF char10,
          ls_range_sfakn      LIKE LINE OF lt_range_sfakn,
          ls_vbrk             LIKE LINE OF et_vbrk.


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

            LOOP AT it_vbrp INTO DATA(ls_vbrp).
              ls_range_vbeln-sign = 'I'.
              ls_range_vbeln-option = 'EQ'.
              ls_range_vbeln-low = ls_vbrp-vbeln.
              APPEND ls_range_vbeln TO lt_range_vbeln.
            ENDLOOP.

            ls_range_fksto-sign = 'I'.
            ls_range_fksto-option = 'EQ'.
            ls_range_fksto-low = space.
            APPEND ls_range_fksto TO lt_range_fksto.

            ls_range_sfakn-sign = 'I'.
            ls_range_sfakn-option = 'EQ'.
            ls_range_sfakn-low = space.
            APPEND ls_range_sfakn TO lt_range_sfakn.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VBRK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELN'
                                                                    it_range             = lt_range_VBELN ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'FKSTO'
                                                                    it_range             = lt_range_fksto ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'SFAKN'
                                                                    it_range             = lt_range_sfakn ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_vbrk.
              APPEND ls_vbrk TO et_vbrk.
              CLEAR ls_vbrk.
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


  METHOD t052u.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_details=>tys_z_i_t_052_utype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_SPRAS      TYPE RANGE OF spras,
          ls_range_spras      LIKE LINE OF lt_range_spras,
          lt_range_ZTERM      TYPE RANGE OF dzterm,
          ls_range_zterm      LIKE LINE OF lt_range_zterm,
          ls_t052u            LIKE LINE OF et_t052u.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALESORDER_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALESORDER_DETAILS' ).

            ASSERT lo_http_client IS BOUND.

            LOOP AT it_vbrk INTO DATA(ls_vbrk).
              ls_range_zterm-sign = 'I'.
              ls_range_zterm-option = 'EQ'.
              ls_range_zterm-low = ls_vbrk-zterm.
              APPEND ls_range_zterm TO lt_range_zterm.
            ENDLOOP.
            ls_range_spras-sign = 'I'.
            ls_range_spras-option = 'EQ'.
            ls_range_spras-low = sy-langu.
            APPEND ls_range_spras TO lt_range_spras.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_052_U' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'SPRAS'
                                                                    it_range             = lt_range_SPRAS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'ZTERM'
                                                                    it_range             = lt_range_ZTERM ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_t052u.
              APPEND ls_t052u TO et_t052u.
              CLEAR ls_t052u.
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


  METHOD t042z.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_details=>tys_z_i_t_042_ztype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_zlsch      TYPE RANGE OF dzlsch,
          ls_range_zlsch      LIKE LINE OF lt_range_zlsch,
          lt_range_land1      TYPE RANGE OF land1,
          ls_range_land1      LIKE LINE OF lt_range_land1,
          ls_t042z            LIKE LINE OF et_t042z.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALESORDER_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALESORDER_DETAILS' ).

            ASSERT lo_http_client IS BOUND.

            LOOP AT it_vbrk INTO DATA(ls_vbrk).
              ls_range_zlsch-sign = 'I'.
              ls_range_zlsch-option = 'EQ'.
              ls_range_zlsch-low = ls_vbrk-zlsch.
              APPEND ls_range_zlsch TO lt_range_zlsch.
            ENDLOOP.
            ls_range_land1-sign = 'I'.
            ls_range_land1-option = 'EQ'.
            ls_range_land1-low = 'MX'.
            APPEND ls_range_land1 TO lt_range_land1.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_042_Z' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'ZLSCH'
                                                                    it_range             = lt_range_zlsch ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'LAND1'
                                                                    it_range             = lt_range_land1 ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_t042z.
              APPEND ls_t042z TO et_t042z.
              CLEAR ls_t042z.
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


  METHOD adrc.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_details=>tys_z_i_adrctype,
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
          ls_order_address    LIKE LINE OF et_order_address.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALESORDER_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALESORDER_DETAILS' ).

            ASSERT lo_http_client IS BOUND.

            LOOP AT it_order_partner INTO DATA(ls_bp).
              ls_range_addrnumber-sign = 'I'.
              ls_range_addrnumber-option = 'EQ'.
              ls_range_addrnumber-low = ls_bp-address.
              APPEND ls_range_addrnumber TO lt_range_addrnumber.
              CLEAR ls_range_addrnumber.
            ENDLOOP.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ADRC' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'ADDRNUMBER'
                                                                    it_range             = lt_range_ADDRNUMBER ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'DATE_FROM'
*                                                        it_range             = lt_range_DATE_FROM ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              ls_order_address-doc_number = ls_bp-sd_doc.
              ls_order_address-address = ls_business_data-addrnumber.
              ls_order_address-name = ls_business_data-name_1.
              ls_order_address-name_2 = ls_business_data-name_2.
              ls_order_address-name_3 = ls_business_data-name_3.
              ls_order_address-name_4 = ls_business_data-name_4.
              ls_order_address-street = ls_business_data-street.
              ls_order_address-house_no = ls_business_data-house_num_1.
              ls_order_address-city = ls_business_data-city_1.
              ls_order_address-district = ls_business_data-city_2.
              ls_order_address-region = ls_business_data-region.
              ls_order_address-postl_code = ls_business_data-post_code_1.
              ls_order_address-langu = ls_business_data-langu.
              ls_order_address-country = ls_business_data-country.
              APPEND ls_order_address TO et_order_address.
              CLEAR ls_order_address.
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


  METHOD vbak.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_details=>tys_z_i_vbaktype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_vbeln      TYPE RANGE OF vbeln_va,
          ls_range_vbeln      LIKE LINE OF lt_range_vbeln,
          ls_order_header     LIKE LINE OF et_order_header.


        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALESORDER_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALESORDER_DETAILS' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_vbeln-sign = 'I'.
            ls_range_vbeln-option = 'EQ'.
            ls_range_vbeln-low = i_sales_order.
            APPEND ls_range_vbeln TO lt_range_vbeln.
            CLEAR ls_range_vbeln.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VBAK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELN'
                                                                    it_range             = lt_range_vbeln ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'ERDAT'
*                                                        it_range             = lt_range_ERDAT ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              ls_order_header-doc_number = |{ ls_business_data-vbeln ALPHA = IN }|.
              ls_order_header-doc_date = ls_business_data-audat.
              ls_order_header-req_date_h = ls_business_data-vdatu.
              APPEND ls_order_header TO et_order_header.
              CLEAR ls_order_header.
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
ENDCLASS.
