CLASS zcl_qry_ingresos DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: t001 IMPORTING i_operacion TYPE text10
                        EXPORTING et_t001     TYPE ztt_t001.

    CLASS-METHODS bkpf IMPORTING i_operacion TYPE text10
                                 i_bukrs     TYPE bukrs
                                 i_start     TYPE budat
                                 i_end       TYPE budat
                       EXPORTING et_bkpf     TYPE ztt_bkpf.

    CLASS-METHODS bseg IMPORTING i_operacion TYPE text10
                                 it_bkpf     TYPE ztt_bkpf
                                 it_account  TYPE ztthfis_racct
                       EXPORTING et_bseg     TYPE ztt_bseg.

    CLASS-METHODS: skat IMPORTING i_operacion TYPE text10
                                  i_ktopl     TYPE ktopl
                                  i_saknr     TYPE saknr
                        EXPORTING e_txt50     TYPE text50.

    CLASS-METHODS bseg2 IMPORTING i_operacion TYPE text10
                                  i_bukrs     TYPE bukrs
                                  i_belnr     TYPE belnr_d
                                  i_gjahr     TYPE gjahr
                        EXPORTING e_vbeln     TYPE vbeln.

    CLASS-METHODS bkpf2 IMPORTING i_operacion TYPE text10
                                  i_bukrs     TYPE bukrs
                                  i_belnr     TYPE belnr_d
                                  i_gjahr     TYPE gjahr
                        EXPORTING es_bkpf     TYPE zst_bkpf.

    CLASS-METHODS ztasd_fact_uuid IMPORTING i_operacion TYPE text10
                                            i_bukrs     TYPE bukrs
                                            i_vbeln     TYPE vbeln
                                  EXPORTING e_uuid      TYPE text40.

    CLASS-METHODS zvalida_fi IMPORTING i_operacion TYPE text10
                                       i_bukrs     TYPE bukrs
                                       i_belnr     TYPE belnr_d
                                       i_gjahr     TYPE gjahr
                             EXPORTING e_uuid      TYPE text40.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_QRY_INGRESOS IMPLEMENTATION.


  METHOD t001.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm__companycode_list_get=>tys_z_i_t_001_type,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst,
          ls_t001          LIKE LINE OF et_t001.

*DATA:
* lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
* lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
* lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
* lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
* lt_range_BUKRS TYPE RANGE OF <element_name>,
* lt_range_BUTXT TYPE RANGE OF <element_name>.


        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM__COMPANYCODE_LIST_GET'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_COMPANYCODE_LIST_GET' ).

            ASSERT lo_http_client IS BOUND.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_001' )->create_request_for_read( ).

            " Create the filter tree
*lo_filter_factory = lo_request->create_filter_factory( ).
*
*lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
*                                                        it_range             = lt_range_BUKRS ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BUTXT'
*                                                        it_range             = lt_range_BUTXT ).

*lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
*lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_t001.
              APPEND ls_t001 TO et_t001.
              CLEAR ls_t001.
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


  METHOD bkpf.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_list=>tys_z_i_bkpftype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_bukrs      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_budat      TYPE RANGE OF budat,
          ls_range_budat      LIKE LINE OF lt_range_budat,
          ls_bkpf             LIKE LINE OF et_bkpf.

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

            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            ls_range_budat-sign = 'I'.
            ls_range_budat-option = 'BT'.
            ls_range_budat-low = i_start.
            ls_range_budat-high = i_end.
            APPEND ls_range_budat TO lt_range_budat.
            CLEAR ls_range_budat.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BKPF' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_bukrs ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BUDAT'
                                                                    it_range             = lt_range_budat ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_bkpf.
              APPEND ls_bkpf TO et_bkpf.
              CLEAR ls_bkpf.
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


  METHOD bseg.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_crp_journal_list=>tys_z_i_bsegtype,
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
          lt_range_BUKRS      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_BELNR      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          lt_range_GJAHR      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
          lt_range_hkont      TYPE RANGE OF hkont,
          ls_range_hkont      LIKE LINE OF lt_range_hkont,
          ls_bseg             LIKE LINE OF et_bseg.


        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_CRP_JOURNAL_LIST'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_CRP_JOURNAL' ).

            ASSERT lo_http_client IS BOUND.

            LOOP AT it_bkpf INTO DATA(ls_bkpf).

              ls_range_bukrs-sign = 'I'.
              ls_range_bukrs-option = 'EQ'.
              ls_range_bukrs-low = ls_bkpf-bukrs.
              APPEND ls_range_bukrs TO lt_range_bukrs.
              CLEAR ls_range_bukrs.

              ls_range_belnr-sign = 'I'.
              ls_range_belnr-option = 'EQ'.
              ls_range_belnr-low = ls_bkpf-belnr.
              APPEND ls_range_belnr TO lt_range_belnr.
              CLEAR ls_range_belnr.

              ls_range_gjahr-sign = 'I'.
              ls_range_gjahr-option = 'EQ'.
              ls_range_gjahr-low = ls_bkpf-gjahr.
              APPEND ls_range_gjahr TO lt_range_gjahr.
              CLEAR ls_range_gjahr.
            ENDLOOP.

            LOOP AT it_account INTO DATA(ls_account).
              ls_range_hkont-sign = 'I'.
              ls_range_hkont-option = 'EQ'.
              ls_range_hkont-low = ls_account-racct.
              APPEND ls_range_hkont TO lt_range_hkont.
              CLEAR ls_range_hkont.
            ENDLOOP.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSEG' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_bukrs ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_belnr ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'HKONT'
                                                                    it_range             = lt_range_hkont ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_bseg.
              APPEND ls_bseg TO et_bseg.
              CLEAR ls_bseg.
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


  METHOD skat.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_skat=>tys_z_i_skattype,
          ls_business_data TYPE zscm_skat=>tys_z_i_skattype,
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
                                                     proxy_model_id      = 'ZSCM_SKAT'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SKAT' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      spras  = 'ES'
                      ktopl  = i_ktopl
                      saknr  = i_saknr ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_SKAT' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            e_txt50 = ls_business_data-txt_50.

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


  METHOD bseg2.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_crp_journal_list=>tys_z_i_bsegtype,
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
          lt_range_BUKRS      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_BELNR      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          lt_range_GJAHR      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
          lt_range_koart      TYPE RANGE OF koart,
          ls_range_koart      LIKE LINE OF lt_range_koart.


        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_CRP_JOURNAL_LIST'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_CRP_JOURNAL' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = i_belnr.
            APPEND ls_range_belnr TO lt_range_belnr.
            CLEAR ls_range_belnr.

            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = i_gjahr.
            APPEND ls_range_gjahr TO lt_range_gjahr.
            CLEAR ls_range_gjahr.

            ls_range_koart-sign = 'I'.
            ls_range_koart-option = 'EQ'.
            ls_range_koart-low = 'D'.
            APPEND ls_range_koart TO lt_range_koart.
            CLEAR ls_range_koart.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSEG' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_bukrs ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_belnr ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'KOART'
                                                                    it_range             = lt_range_koart ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            e_vbeln = ls_business_data-vbeln.

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


  METHOD bkpf2.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_salesorder_list=>tys_z_i_bkpftype,
          ls_business_data TYPE zscm_salesorder_list=>tys_z_i_bkpftype,
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
                                                     proxy_model_id      = 'ZSCM_SALESORDER_LIST'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALESORDER_LIST' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = i_bukrs
                      belnr  = i_belnr
                      gjahr  = i_gjahr ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BKPF' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            MOVE-CORRESPONDING ls_business_data TO es_bkpf.

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


  METHOD ztasd_fact_uuid.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zhfis_detiva=>tys_z_i_ztasd_fact_uuidtype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_BUKRS      TYPE RANGE OF bukrs,
          ls_range_bukrs LIKE LINE OF lt_range_bukrs,
          lt_range_VBELN      TYPE RANGE OF vbeln,
          ls_range_vbeln LIKE LINE OF lt_range_vbeln.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.

            ls_range_vbeln-sign = 'I'.
            ls_range_vbeln-option = 'EQ'.
            ls_range_vbeln-low = i_vbeln.
            APPEND ls_range_vbeln TO lt_range_vbeln.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ZTASD_FACT_UUID' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELN'
                                                                    it_range             = lt_range_VBELN ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            e_uuid = ls_business_data-uuid_fac.

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


  METHOD zvalida_fi.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zhfis_detiva=>tys_z_i_zvalida_fitype,
          ls_business_data TYPE zscm_zhfis_detiva=>tys_z_i_zvalida_fitype,
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
                                              proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = i_bukrs
                      belnr  = i_belnr
                      gjahr  = i_gjahr ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'SAP_COVER_PAGE_SET' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            e_uuid = ls_business_data-zuuid.

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
