CLASS zcl_bseg_gr_list DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: journal_list_bkpf    IMPORTING VALUE(i_operacion) TYPE text10
                                                  i_company          TYPE bukrs
                                                  i_date_from        TYPE datum
                                                  i_date_to          TYPE datum
                                                  i_year             TYPE gjahr
                                        EXPORTING VALUE(lt_fi_hd)    TYPE ztt_lt_fi_hd.



    CLASS-METHODS: get_bseg    IMPORTING VALUE(i_operacion) TYPE text10
                                                        i_belnr      TYPE zchar10
                                                        i_bukrs      TYPE bukrs
                                                        i_gjahr      TYPE gjahr
                                                        i_buzid      TYPE zchar01
                                                        i_bschl      TYPE bschl
                                        EXPORTING VALUE(it_bseg)     TYPE ztt_lt_fi_item.



    CLASS-METHODS: journal_list_skb1    IMPORTING VALUE(i_operacion) TYPE text10
                                                  ls_fi_item         TYPE zst_lt_fi_item
                                        EXPORTING VALUE(ls_skb1)     TYPE ztt_skb1.

    CLASS-METHODS: journal_list_crp_aa  IMPORTING VALUE(i_operacion) TYPE text10
                                                  ls_fi_hd           TYPE zst_lt_fi_hd
                                        EXPORTING VALUE(ls_crp_aa)   TYPE zst_zfiglmx_crp_aa.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_BSEG_GR_LIST IMPLEMENTATION.


  METHOD journal_list_bkpf.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_crp_journal_list=>tys_z_i_bkpftype,
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
          lt_range_BUKRS      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_GJAHR      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
          lt_range_CPUDT      TYPE RANGE OF datum,
          ls_range_cpudt      LIKE LINE OF lt_range_cpudt,
          ls_fi_hd            LIKE LINE OF lt_fi_hd.



        TRY.
            " Create http client
            "DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = |DS4WD100| ). "|DS4100| ).
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

            CLEAR lt_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_company.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            CLEAR lt_range_gjahr.
            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = i_year.
            APPEND ls_range_gjahr TO lt_range_gjahr.
            CLEAR ls_range_gjahr.

            CLEAR lt_range_cpudt.
            ls_range_cpudt-sign = 'I'.
            ls_range_cpudt-option = 'EQ'.
            ls_range_cpudt-low = i_date_from.
            ls_range_cpudt-high = i_date_to.
            APPEND ls_range_cpudt TO lt_range_cpudt.
            CLEAR ls_range_cpudt.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BKPF' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_bukrs ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).
*            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'CPUDT'
*                                                                    it_range             = lt_range_cpudt ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )."->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 1000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR lt_fi_hd.

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_fi_hd.
              APPEND ls_fi_hd TO lt_fi_hd.
              CLEAR ls_fi_hd.
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


  METHOD get_bseg.
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
          lo_filter_node_5    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node.

        DATA:
          lt_range_belnr TYPE RANGE OF zchar10,
          ls_range_belnr LIKE LINE OF lt_range_belnr.

        DATA:
          lt_range_bukrs TYPE RANGE OF bukrs,
          ls_range_bukrs LIKE LINE OF lt_range_bukrs.

        DATA:
          lt_range_gjahr TYPE RANGE OF gjahr,
          ls_range_gjahr LIKE LINE OF lt_range_gjahr.

        DATA:
          lt_range_buzid TYPE RANGE OF zchar01,
          ls_range_buzid LIKE LINE OF lt_range_buzid.

        DATA:
          lt_range_bschl TYPE RANGE OF bschl,
          ls_range_bschl LIKE LINE OF lt_range_bschl.

        TRY.
            " Create http client
            "DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = |DS4WD100| ). "|DS4100| ).
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

            CLEAR: lt_range_belnr, ls_range_belnr.
            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = i_belnr.
            APPEND ls_range_belnr TO lt_range_belnr.

            CLEAR: lt_range_bukrs, ls_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.

            CLEAR: lt_range_gjahr, ls_range_gjahr.
            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = i_gjahr.
            APPEND ls_range_gjahr TO lt_range_gjahr.

            CLEAR: lt_range_buzid, ls_range_buzid.
            ls_range_buzid-sign = 'I'.
            ls_range_buzid-option = 'EQ'.
            ls_range_buzid-low = i_buzid.
            APPEND ls_range_buzid TO lt_range_buzid.

            CLEAR: lt_range_bschl, ls_range_bschl.
            ls_range_bschl-sign = 'I'.
            ls_range_bschl-option = 'EQ'.
            ls_range_bschl-low = i_bschl.
            APPEND ls_range_bschl TO lt_range_bschl.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSEG' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_belnr ).

            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_bukrs ).

            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).

            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BUZID'
                                                                    it_range             = lt_range_buzid ).

            lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'BSCHL '
                                                                     it_range             = lt_range_bschl ).


            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            MOVE-CORRESPONDING lt_business_data TO it_bseg.

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


  METHOD journal_list_skb1.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_crp_journal_list=>tys_z_i_skb_1_type,
          ls_business_data TYPE zscm_zfiglmx_crp_journal_list=>tys_z_i_skb_1_type,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read.



        TRY.
            " Create http client
            "DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = |DS4WD100| ). "|DS4100| ).
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


            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = ls_fi_item-bukrs
                      saknr  = ls_fi_item-hkont ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_SKB_1' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            IF ls_business_data-hbkid EQ space OR ls_business_data-hktid EQ space.
              CLEAR ls_business_data.
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


  METHOD journal_list_crp_aa.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_crp_journal_list=>tys_z_i_zfiglmx_crp_aatype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_AA_ID      TYPE RANGE OF char4,
          ls_range_aa_id      LIKE LINE OF lt_range_aa_id.
* lt_range_LIFNR TYPE RANGE OF <element_name>.



        TRY.
            " Create http client
            "DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = |DS4WD100| ). "|DS4100| ).
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

            CLEAR lt_range_aa_id.
            ls_range_aa_id-sign = 'I'.
            ls_range_aa_id-option = 'EQ'.
            ls_range_aa_id-low = ls_fi_hd-bktxt(4).
            "ls_range_aa_id-low = 'AA1'.
            APPEND ls_range_aa_id TO lt_range_aa_id.
            CLEAR ls_range_aa_id.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ZFIGLMX_CRP_AA' )->create_request_for_read( ).

            " Create the filter tree
lo_filter_factory = lo_request->create_filter_factory( ).

lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'AA_ID'
                                                        it_range             = lt_range_AA_ID ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'LIFNR'
*                                                        it_range             = lt_range_LIFNR ).

lo_filter_node_root = lo_filter_node_1.
lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 1 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_crp_aa.
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
