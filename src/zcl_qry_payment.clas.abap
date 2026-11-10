CLASS zcl_qry_payment DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: bsik IMPORTING i_operacion TYPE text10
                                  i_lifnr     TYPE lifnr
                                  i_bukrs     TYPE bukrs
                                  i_start     TYPE erdat
                                  i_end       TYPE erdat
                                  i_period    TYPE char1
                        EXPORTING et_bsik     TYPE ztt_bsik_payment.

    CLASS-METHODS: bkpf IMPORTING i_operacion TYPE text10
                                  i_belnr     TYPE belnr_d
                                  i_bukrs     TYPE bukrs
                                  i_gjahr     TYPE gjahr
                        EXPORTING et_bkpf     TYPE ztt_bkpf.

    CLASS-METHODS: ekbe IMPORTING i_operacion TYPE text10
                                  i_belnr     TYPE belnr_d
                                  i_gjahr     TYPE gjahr
                        EXPORTING et_ekbe     TYPE ztt_ekbe.

    CLASS-METHODS: bseg IMPORTING i_operacion TYPE text10
                                  i_belnr     TYPE belnr_d
                                  i_bukrs     TYPE bukrs
                                  i_gjahr     TYPE gjahr
                        EXPORTING e_ebeln     TYPE ebeln
                                  e_menge     TYPE zekpo-menge.

    CLASS-METHODS: bsak IMPORTING i_operacion TYPE text10
                                  i_lifnr     TYPE lifnr
                                  i_bukrs     TYPE bukrs
                                  i_start     TYPE erdat
                                  i_end       TYPE erdat
                                  i_period    TYPE char1
                        EXPORTING et_bsak     TYPE ztt_bsak_payment.

    CLASS-METHODS: bkpf2 IMPORTING i_operacion TYPE text10
                                   i_belnr     TYPE belnr_d
                                   i_bukrs     TYPE bukrs
                                   i_gjahr     TYPE gjahr
                         EXPORTING e_kursf     TYPE zkursf
                                   e_stblg     TYPE char10.

    CLASS-METHODS: bsak2 IMPORTING i_operacion TYPE text10
                                   i_lifnr     TYPE lifnr
                                   i_bukrs     TYPE bukrs
                                   i_start     TYPE erdat
                                   i_end       TYPE erdat
                                   i_period    TYPE char1
                         EXPORTING et_bsak     TYPE ztt_bsak_payment.

    CLASS-METHODS: t001 IMPORTING i_operacion TYPE text10
                                  i_bukrs     TYPE bukrs
                        EXPORTING e_butxt     TYPE butxt
                                  e_waers     TYPE waers.

    CLASS-METHODS: bsak3 IMPORTING i_operacion TYPE text10
                                   i_lifnr     TYPE lifnr
                                   i_bukrs     TYPE bukrs
                                   i_start     TYPE erdat
                                   i_end       TYPE erdat
                                   i_period    TYPE char1
                                   i_augbl     TYPE augbl
                         EXPORTING et_bsak     TYPE ztt_bsak_payment.

    CLASS-METHODS: bkpf3 IMPORTING i_operacion TYPE text10
                                   i_belnr     TYPE belnr_d
                                   i_bukrs     TYPE bukrs
                         EXPORTING e_kursf     TYPE zkursf.

    CLASS-METHODS: bseg2 IMPORTING i_operacion TYPE text10
                                   i_belnr     TYPE belnr_d
                                   i_bukrs     TYPE bukrs
                                   i_gjahr     TYPE gjahr
                         EXPORTING e_hkont     TYPE hkont
                                   e_dmbtr     TYPE dmbtr
                                   e_wrbtr     TYPE wrbtr.

    CLASS-METHODS: skat IMPORTING i_operacion TYPE text10
                                  i_saknr     TYPE saknr
                        EXPORTING e_txt20     TYPE text20.

    CLASS-METHODS: lfbk IMPORTING i_operacion TYPE text10
                                  i_lifnr     TYPE lifnr
                        EXPORTING e_bankl     TYPE bankl.

    CLASS-METHODS: bnka IMPORTING i_operacion TYPE text10
                                  i_bankl     TYPE bankl
                        EXPORTING e_banka     TYPE banka.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_QRY_PAYMENT IMPLEMENTATION.


  METHOD bsik.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_payment=>tys_z_i_bsiktype,
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
          lt_range_BUKRS      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_LIFNR      TYPE RANGE OF lifnr,
          ls_range_lifnr      LIKE LINE OF lt_range_lifnr,
          lt_range_budat      TYPE RANGE OF budat,
          ls_range_budat      LIKE LINE OF lt_range_budat,
          lt_range_umsks      TYPE RANGE OF char1,
          ls_range_umsks      LIKE LINE OF lt_range_umsks,
          lt_range_umskz      TYPE RANGE OF char1,
          ls_range_umskz      LIKE LINE OF lt_range_umskz,
          ls_bsik             LIKE LINE OF et_bsik.


        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_PAYMENT'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_PAYMENT' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.

            ls_range_lifnr-sign = 'I'.
            ls_range_lifnr-option = 'EQ'.
            ls_range_lifnr-low = i_lifnr.
            APPEND ls_range_lifnr TO lt_range_lifnr.

            ls_range_budat-sign   = 'I'.
            ls_range_budat-option = 'BT'.
            IF i_start IS INITIAL AND i_end IS INITIAL.
              CASE i_period.
                WHEN '1'.  " 1 mes
                  ls_range_budat-low = sy-datum - 31.
                WHEN '2'.  " 3 meses
                  ls_range_budat-low = sy-datum - 93.
                WHEN '3'.  " 6 meses
                  ls_range_budat-low = sy-datum - 186.
              ENDCASE.
              ls_range_budat-high   = sy-datum.
              APPEND ls_range_budat TO lt_range_budat.
            ELSE.
              ls_range_budat-low    = i_start.
              ls_range_budat-high   = i_end.
              APPEND ls_range_budat TO lt_range_budat.
            ENDIF.

            ls_range_umsks-sign = 'I'.
            ls_range_umsks-option = 'EQ'.
            ls_range_umsks-low = 'A'.
            APPEND ls_range_umsks TO lt_range_umsks.
            ls_range_umsks-sign = 'I'.
            ls_range_umsks-option = 'EQ'.
            ls_range_umsks-low = space.
            APPEND ls_range_umsks TO lt_range_umsks.

            ls_range_umskz-sign = 'I'.
            ls_range_umskz-option = 'EQ'.
            ls_range_umskz-low = 'F'.
            APPEND ls_range_umskz TO lt_range_umskz.
            ls_range_umskz-sign = 'I'.
            ls_range_umskz-option = 'EQ'.
            ls_range_umskz-low = space.
            APPEND ls_range_umskz TO lt_range_umskz.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSIK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'LIFNR'
                                                                    it_range             = lt_range_LIFNR ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'BUDAT'
                                                                    it_range             = lt_range_budat ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'UMSKS'
                                                                    it_range             = lt_range_umsks ).
            lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'UMSKZ'
                                                                    it_range             = lt_range_umskz ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_bsik.
              APPEND ls_bsik TO et_bsik.
              CLEAR ls_bsik.
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
          lo_filter_node_3    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_BUKRS      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_GJAHR      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
          lt_range_belnr      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
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

            CLEAR lt_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            CLEAR lt_range_gjahr.
            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = i_gjahr.
            APPEND ls_range_gjahr TO lt_range_gjahr.
            CLEAR ls_range_gjahr.

            CLEAR lt_range_belnr.
            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = i_belnr.
            APPEND ls_range_belnr TO lt_range_belnr.
            CLEAR ls_range_belnr.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BKPF' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_bukrs ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_belnr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 1000 )->set_skip( 0 ).

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
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_belnr      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          lt_range_gjahr      TYPE RANGE OF ebeln,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
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

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKBE' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_belnr ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

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
          lt_range_buzid      TYPE RANGE OF char1,
          ls_range_buzid      LIKE LINE OF lt_range_buzid.


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

            CLEAR lt_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            CLEAR lt_range_belnr.
            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = i_belnr.
            APPEND ls_range_belnr TO lt_range_belnr.
            CLEAR ls_range_belnr.

            CLEAR lt_range_gjahr.
            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = i_gjahr.
            APPEND ls_range_gjahr TO lt_range_gjahr.
            CLEAR ls_range_gjahr.

            CLEAR lt_range_buzid.
            ls_range_buzid-sign = 'I'.
            ls_range_buzid-option = 'EQ'.
            ls_range_buzid-low = 'W'.
            APPEND ls_range_buzid TO lt_range_buzid.
            CLEAR ls_range_buzid.


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
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BUZID'
                                                                    it_range             = lt_range_buzid ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            IF sy-subrc = 0.
              e_ebeln = ls_business_data-ebeln.
              e_menge = ls_business_data-menge.
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


  METHOD bsak.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zhfis_detiva=>tys_z_i_bsaktype,
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
          lt_range_BUKRS      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_LIFNR      TYPE RANGE OF lifnr,
          ls_range_lifnr      LIKE LINE OF lt_range_lifnr,
          lt_range_budat      TYPE RANGE OF budat,
          ls_range_budat      LIKE LINE OF lt_range_budat,
          lt_range_umsks      TYPE RANGE OF char1,
          ls_range_umsks      LIKE LINE OF lt_range_umsks,
          lt_range_umskz      TYPE RANGE OF char1,
          ls_range_umskz      LIKE LINE OF lt_range_umskz,
          lt_range_blart      TYPE RANGE OF blart,
          ls_range_blart      LIKE LINE OF lt_range_blart,
          ls_bsak             LIKE LINE OF et_bsak.


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

            ls_range_lifnr-sign = 'I'.
            ls_range_lifnr-option = 'EQ'.
            ls_range_lifnr-low = i_lifnr.
            APPEND ls_range_lifnr TO lt_range_lifnr.

            ls_range_budat-sign   = 'I'.
            ls_range_budat-option = 'BT'.
            IF i_start IS INITIAL AND i_end IS INITIAL.
              CASE i_period.
                WHEN '1'.  " 1 mes
                  ls_range_budat-low = sy-datum - 31.
                WHEN '2'.  " 3 meses
                  ls_range_budat-low = sy-datum - 93.
                WHEN '3'.  " 6 meses
                  ls_range_budat-low = sy-datum - 186.
              ENDCASE.
              ls_range_budat-high   = sy-datum.
              APPEND ls_range_budat TO lt_range_budat.
            ELSE.
              ls_range_budat-low    = i_start.
              ls_range_budat-high   = i_end.
              APPEND ls_range_budat TO lt_range_budat.
            ENDIF.

            ls_range_umsks-sign = 'I'.
            ls_range_umsks-option = 'NE'.
            ls_range_umsks-low = 'A'.
            APPEND ls_range_umsks TO lt_range_umsks.

            ls_range_umskz-sign = 'I'.
            ls_range_umskz-option = 'NE'.
            ls_range_umskz-low = 'A'.
            APPEND ls_range_umskz TO lt_range_umskz.

            ls_range_blart-sign   = 'I'.
            ls_range_blart-option = 'EQ'.
            ls_range_blart-low    = 'KT'. APPEND ls_range_blart TO lt_range_blart.
            ls_range_blart-low    = 'KA'. APPEND ls_range_blart TO lt_range_blart.
            ls_range_blart-low    = 'KC'. APPEND ls_range_blart TO lt_range_blart.
            ls_range_blart-low    = 'KS'. APPEND ls_range_blart TO lt_range_blart.
            ls_range_blart-low    = 'KB'. APPEND ls_range_blart TO lt_range_blart.
            ls_range_blart-low    = 'KZ'. APPEND ls_range_blart TO lt_range_blart.
            ls_range_blart-low    = 'ZC'. APPEND ls_range_blart TO lt_range_blart.
            ls_range_blart-low    = 'ZU'. APPEND ls_range_blart TO lt_range_blart.
            ls_range_blart-low    = 'ZT'. APPEND ls_range_blart TO lt_range_blart.
            ls_range_blart-low    = 'ZP'. APPEND ls_range_blart TO lt_range_blart.
            ls_range_blart-low    = 'AB'. APPEND ls_range_blart TO lt_range_blart.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSAK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'LIFNR'
                                                                    it_range             = lt_range_LIFNR ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'BUDAT'
                                                                    it_range             = lt_range_budat ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'UMSKS'
                                                                    it_range             = lt_range_umsks ).
            lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'UMSKZ'
                                                                    it_range             = lt_range_umskz ).
            lo_filter_node_6  = lo_filter_factory->create_by_range( iv_property_path     = 'BLART'
                                                                    it_range             = lt_range_blart ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 )->and( lo_filter_node_6 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_bsak.
              APPEND ls_bsak TO et_bsak.
              CLEAR ls_bsak.
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

            e_kursf = ls_business_data-kursf.
            e_stblg = ls_business_data-stblg.

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


  METHOD bsak2.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zhfis_detiva=>tys_z_i_bsaktype,
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
          lt_range_BUKRS      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_LIFNR      TYPE RANGE OF lifnr,
          ls_range_lifnr      LIKE LINE OF lt_range_lifnr,
          lt_range_budat      TYPE RANGE OF budat,
          ls_range_budat      LIKE LINE OF lt_range_budat,
          lt_range_umsks      TYPE RANGE OF char1,
          ls_range_umsks      LIKE LINE OF lt_range_umsks,
          lt_range_umskz      TYPE RANGE OF char1,
          ls_range_umskz      LIKE LINE OF lt_range_umskz,
          lt_range_xanet      TYPE RANGE OF char1,
          ls_range_xanet      LIKE LINE OF lt_range_xanet,
          ls_bsak             LIKE LINE OF et_bsak.


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

            ls_range_lifnr-sign = 'I'.
            ls_range_lifnr-option = 'EQ'.
            ls_range_lifnr-low = i_lifnr.
            APPEND ls_range_lifnr TO lt_range_lifnr.

            ls_range_budat-sign   = 'I'.
            ls_range_budat-option = 'BT'.
            IF i_start IS INITIAL AND i_end IS INITIAL.
              CASE i_period.
                WHEN '1'.  " 1 mes
                  ls_range_budat-low = sy-datum - 31.
                WHEN '2'.  " 3 meses
                  ls_range_budat-low = sy-datum - 93.
                WHEN '3'.  " 6 meses
                  ls_range_budat-low = sy-datum - 186.
              ENDCASE.
              ls_range_budat-high   = sy-datum.
              APPEND ls_range_budat TO lt_range_budat.
            ELSE.
              ls_range_budat-low    = i_start.
              ls_range_budat-high   = i_end.
              APPEND ls_range_budat TO lt_range_budat.
            ENDIF.

            ls_range_umsks-sign = 'I'.
            ls_range_umsks-option = 'EQ'.
            ls_range_umsks-low = 'A'.
            APPEND ls_range_umsks TO lt_range_umsks.

            ls_range_umskz-sign = 'I'.
            ls_range_umskz-option = 'EQ'.
            ls_range_umskz-low = 'F'.
            APPEND ls_range_umskz TO lt_range_umskz.

            ls_range_xanet-sign = 'I'.
            ls_range_xanet-option = 'EQ'.
            ls_range_xanet-low = 'X'.
            APPEND ls_range_xanet TO lt_range_xanet.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSAK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'LIFNR'
                                                                    it_range             = lt_range_LIFNR ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'BUDAT'
                                                                    it_range             = lt_range_budat ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'UMSKS'
                                                                    it_range             = lt_range_umsks ).
            lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'UMSKZ'
                                                                    it_range             = lt_range_umskz ).
            lo_filter_node_6  = lo_filter_factory->create_by_range( iv_property_path     = 'XANET'
                                                                    it_range             = lt_range_xanet ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 )->and( lo_filter_node_6 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_bsak.
              APPEND ls_bsak TO et_bsak.
              CLEAR ls_bsak.
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


  METHOD t001.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm__companycode_list_get=>tys_z_i_t_001_type,
          ls_business_data TYPE zscm__companycode_list_get=>tys_z_i_t_001_type,
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
                                                     proxy_model_id      = 'ZSCM__COMPANYCODE_LIST_GET'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_COMPANYCODE_LIST_GET' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = i_bukrs ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_001' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            e_butxt = ls_business_data-butxt.
            e_waers = ls_business_data-waers.

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


  METHOD bsak3.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zhfis_detiva=>tys_z_i_bsaktype,
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
          lt_range_LIFNR      TYPE RANGE OF lifnr,
          ls_range_lifnr      LIKE LINE OF lt_range_lifnr,
          lt_range_augbl      TYPE RANGE OF augbl,
          ls_range_augbl      LIKE LINE OF lt_range_augbl,
          lt_range_gjahr      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
          ls_bsak             LIKE LINE OF et_bsak.


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

            ls_range_lifnr-sign = 'I'.
            ls_range_lifnr-option = 'EQ'.
            ls_range_lifnr-low = i_lifnr.
            APPEND ls_range_lifnr TO lt_range_lifnr.

            IF i_start IS INITIAL AND i_end IS INITIAL.
              CASE i_period.
                WHEN '1'.  " 1 mes
                  DATA(fec_ent1) = CONV datum( sy-datum - 31 ).
                WHEN '2'.  " 3 meses
                  fec_ent1 = sy-datum - 93.
                WHEN '3'.  " 6 meses
                  fec_ent1 = sy-datum - 186.
              ENDCASE.
              DATA(fec_ent2) = CONV datum( sy-datum ).

              IF fec_ent1(4) EQ fec_ent2(4).
*- si son los primeros 6 meses del año
                IF fec_ent1+4(2) <= 6.
                  ls_range_gjahr-sign   = 'I'.
                  ls_range_gjahr-option = 'BT'.
                  ls_range_gjahr-low  = fec_ent1(4) - 1.
                  ls_range_gjahr-high = fec_ent2(4).
                  APPEND ls_range_gjahr TO lt_range_gjahr.
                ELSE.
                  ls_range_gjahr-sign   = 'I'.
                  ls_range_gjahr-option = 'EQ'.
                  ls_range_gjahr-low    = fec_ent1(4).
                  APPEND ls_range_gjahr TO lt_range_gjahr.
                ENDIF.
              ELSE.
                ls_range_gjahr-sign   = 'I'.
                ls_range_gjahr-option = 'BT'.
                ls_range_gjahr-low  = fec_ent1(4).
                ls_range_gjahr-high = fec_ent2(4).
                APPEND ls_range_gjahr TO lt_range_gjahr.
              ENDIF.

            ELSE.

              IF i_start(4) EQ i_end(4).
*-   si son los primeros 6 meses del año
                IF i_start+4(2) <= 6.
                  ls_range_gjahr-sign   = 'I'.
                  ls_range_gjahr-option = 'BT'.
                  ls_range_gjahr-low  = i_start(4) - 1.
                  ls_range_gjahr-high = i_start(4).
                  APPEND ls_range_gjahr TO lt_range_gjahr.
                ELSE.
                  ls_range_gjahr-sign   = 'I'.
                  ls_range_gjahr-option = 'EQ'.
                  ls_range_gjahr-low    = i_start(4).
                  APPEND ls_range_gjahr TO lt_range_gjahr.
                ENDIF.

              ELSE.
                ls_range_gjahr-sign   = 'I'.
                ls_range_gjahr-option = 'BT'.
                ls_range_gjahr-low  = i_start(4).
                ls_range_gjahr-high = i_end(4).
                APPEND ls_range_gjahr TO lt_range_gjahr.
              ENDIF.

            ENDIF.

            ls_range_augbl-sign = 'I'.
            ls_range_augbl-option = 'EQ'.
            ls_range_augbl-low = i_augbl.
            APPEND ls_range_augbl TO lt_range_augbl.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSAK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'LIFNR'
                                                                    it_range             = lt_range_LIFNR ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'AUGBL'
                                                                    it_range             = lt_range_augbl ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_bsak.
              APPEND ls_bsak TO et_bsak.
              CLEAR ls_bsak.
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


  METHOD bkpf3.
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
          lo_filter_node_3    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_4    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_BUKRS      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_GJAHR      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
          lt_range_belnr      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          lt_range_blart      TYPE RANGE OF blart,
          ls_range_blart      LIKE LINE OF lt_range_blart.


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

            CLEAR lt_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            CLEAR lt_range_belnr.
            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = i_belnr.
            APPEND ls_range_belnr TO lt_range_belnr.
            CLEAR ls_range_belnr.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BKPF' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_bukrs ).
*            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
*                                                                    it_range             = lt_range_gjahr ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_belnr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ). "->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 1000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            e_kursf = ls_business_data-kursf.

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
          lt_range_hkont      TYPE RANGE OF hkont,
          ls_range_hkont      LIKE LINE OF lt_range_hkont.


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

            CLEAR lt_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            CLEAR lt_range_belnr.
            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = i_belnr.
            APPEND ls_range_belnr TO lt_range_belnr.
            CLEAR ls_range_belnr.

            CLEAR lt_range_gjahr.
            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = i_gjahr.
            APPEND ls_range_gjahr TO lt_range_gjahr.
            CLEAR ls_range_gjahr.

            CLEAR lt_range_hkont.
            ls_range_hkont-sign = 'I'.
            ls_range_hkont-option = 'CP'.
            ls_range_hkont-low = '001010*'.
            APPEND ls_range_hkont TO lt_range_hkont.
            CLEAR ls_range_hkont.


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

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            IF sy-subrc = 0.
              e_hkont = ls_business_data-hkont.
              e_dmbtr = ls_business_data-dmbtr.
              e_wrbtr = ls_business_data-wrbtr.
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
                      ktopl  = 'PCGP'
                      saknr  = i_saknr ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_SKAT' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            e_txt20 = ls_business_data-txt_20.

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


  METHOD lfbk.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_payment=>tys_z_i_lfbktype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_LIFNR      TYPE RANGE OF lifnr,
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
                                                     proxy_model_id      = 'ZSCM_PAYMENT'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_PAYMENT' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_lifnr-sign = 'I'.
            ls_range_lifnr-option = 'EQ'.
            ls_range_lifnr-low = i_lifnr.
            APPEND ls_range_lifnr TO lt_range_lifnr.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LFBK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'LIFNR'
                                                                    it_range             = lt_range_LIFNR ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            e_bankl = ls_business_data-bankl.

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


  METHOD bnka.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_zhfis_detiva=>tys_z_i_bnkatype,
          ls_business_data TYPE zscm_zhfis_detiva=>tys_z_i_bnkatype,
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
                      banks  = 'MX'
                      bankl  = i_bankl ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BNKA' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            e_banka = ls_business_data-banka.

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
