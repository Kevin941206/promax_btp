CLASS zcl_qry_rfq_detail DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-DATA: BEGIN OF Ty_ESLL,
                  packno     TYPE zst_ESLL-packno,
                  sub_packno TYPE zst_ESLL-sub_packno,
                END OF Ty_ESLL,

                BEGIN OF Ty_ESLL2,
                  check(1),
                  key            TYPE zst_ESLL-packno,
                  packno         TYPE zst_ESLL-packno,
                  introw         TYPE zst_ESLL-introw,
                  extrow         TYPE zst_ESLL-extrow,
                  ktext1         TYPE zst_ESLL-ktext1,
                  menge          TYPE zst_ESLL-menge,
                  tbtwr          TYPE zst_ESLL-tbtwr,
                  meins          TYPE zst_ESLL-meins,
                  comments(2000),
                END OF Ty_ESLL2.

    CLASS-DATA: lt_esll  LIKE TABLE OF ty_esll,
                lt_esll2 LIKE TABLE OF ty_esll2.

    CLASS-METHODS: ekko      IMPORTING i_operacion TYPE text10
                                       i_quotation TYPE ebeln
                             EXPORTING t_ekko      TYPE ztt_pedidos_cab.

    CLASS-METHODS: lfm1      IMPORTING i_operacion TYPE text10
                                       i_prov      TYPE char10 OPTIONAL
                                       ls_ekko     TYPE zst_pedidos_cab
                                       i_terms     TYPE char30
                                       i_inco      TYPE char3
                             EXPORTING curr        TYPE waers
                                       terms       TYPE char30
                                       inco        TYPE char3.

    CLASS-METHODS: t024      IMPORTING i_operacion TYPE text10
                                       ls_ekko     TYPE zst_pedidos_cab
                             EXPORTING st_t024     TYPE zst_t024.

    CLASS-METHODS: ekpo      IMPORTING i_operacion TYPE text10
                                       it_ekko     TYPE ztt_pedidos_cab
                             EXPORTING et_ekpo     TYPE ztt_pedidos2.

    CLASS-METHODS: t001W     IMPORTING i_operacion TYPE text10
                                       st_ekpo     TYPE zst_pedidos2
                             EXPORTING st_t001w    TYPE zst_t001w.

    CLASS-METHODS: eket      IMPORTING i_operacion TYPE text10
                                       st_ekpo     TYPE zst_pedidos2
                             EXPORTING st_eket     TYPE zst_eket.

    CLASS-METHODS: eket_eban IMPORTING i_operacion TYPE text10
                                       st_ekpo     TYPE zst_pedidos2
                             EXPORTING t_eket      TYPE ztt_eket
                                       t_eban      TYPE ztt_eban.

    CLASS-METHODS: t163y     IMPORTING i_operacion TYPE text10
                                       i_langu     TYPE sy-langu
                                       st_ekpo     TYPE zst_pedidos2
                             EXPORTING doc_type    TYPE char20.

    CLASS-METHODS: esll      IMPORTING i_operacion TYPE text10
                                       st_ekpo     TYPE zst_pedidos2
                                       st_esll     LIKE ty_esll
                             EXPORTING t_esll      LIKE lt_esll
                                       t_esll2     LIKE lt_esll2.

    CLASS-METHODS: eban IMPORTING i_operacion TYPE text10
                                  i_banfn     TYPE banfn
                                  i_bnfpo     TYPE bnfpo
                        EXPORTING e_statu     TYPE char1.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_qry_rfq_detail IMPLEMENTATION.


  METHOD ekpo.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zvts_rfq_detail=>tys_z_i_ekpotype,
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
          ls_ekpo             LIKE LINE OF et_ekpo.
*          lt_range_loekz      TYPE RANGE OF eloek,
*          ls_range_loekz      LIKE LINE OF lt_range_loekz,
*          lt_range_agdat      TYPE RANGE OF datum,
*          ls_range_agdat      LIKE LINE OF lt_range_agdat,
*          lt_range_netpr      TYPE RANGE OF zekpo-netpr,
*          ls_range_netpr      LIKE LINE OF lt_range_netpr,



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

            LOOP AT it_ekko INTO DATA(ls_ekko).
              ls_range_ebeln-sign = 'I'.
              ls_range_ebeln-option = 'EQ'.
              ls_range_ebeln-low = ls_ekko-ebeln.
              APPEND ls_range_ebeln TO lt_range_ebeln.
              CLEAR ls_range_ebeln.
            ENDLOOP.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKPO' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_ebeln ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              IF ls_business_data-loekz EQ space.
                MOVE-CORRESPONDING ls_business_data TO ls_ekpo.
                ls_ekpo-txz01 = ls_business_data-txz_01.
                ls_ekpo-adrn2 = ls_business_data-adrn_2.
                APPEND ls_ekpo TO et_ekpo.
                CLEAR ls_ekpo.
              ENDIF.
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


  METHOD t024.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zvts_rfq_detail=>tys_z_i_t_024_type,
          ls_business_data TYPE zscm_zvts_rfq_detail=>tys_z_i_t_024_type,
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
                                              proxy_model_id      = 'ZSCM_ZVTS_RFQ_DETAIL'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVTS_RFQ_DETAIL' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      ekgrp  = ls_ekko-ekgrp ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_024' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            st_t024-eknam = ls_business_data-eknam.
            st_t024-ektel = ls_business_data-ektel.
            st_t024-telfx = ls_business_data-telfx.
            st_t024-smtp_addr = ls_business_data-smtp_addr.

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


  METHOD t163y.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_rfq_list=>tys_z_i_t_163_y_type,
          ls_business_data TYPE zscm_rfq_list=>tys_z_i_t_163_y_type,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read.



        TRY.
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


            " Set entity key
            ls_entity_key = VALUE #(
                      spras  = i_langu
                      pstyp  = st_ekpo-pstyp ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_163_Y' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            doc_type = ls_business_data-ptext.

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
          lt_business_data TYPE TABLE OF zscm_zvts_rfq_detail=>tys_z_i_ekkotype,
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
          ls_ekko             LIKE LINE OF t_ekko.
*          lt_range_bukrs      TYPE RANGE OF bukrs,
*          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
*          lt_range_aedat      TYPE RANGE OF aedat,
*          ls_range_aedat      LIKE LINE OF lt_range_aedat,
*          lt_range_bstyp      TYPE RANGE OF bstyp,
*          ls_range_bstyp      LIKE LINE OF lt_range_bstyp,


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

            IF i_quotation IS NOT INITIAL.
              ls_range_ebeln-sign = 'I'.
              ls_range_ebeln-option = 'EQ'.
              ls_range_ebeln-low = i_quotation.
              APPEND ls_range_ebeln TO lt_range_ebeln.
            ENDIF.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKKO' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).
            IF lt_range_ebeln IS NOT INITIAL.
              lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                      it_range             = lt_range_ebeln ).
            ENDIF.

            lo_filter_node_root = lo_filter_node_1.

            lo_request->set_filter( lo_filter_node_root ).

*            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_ekko.
              ls_ekko-inco1 = ls_business_data-inco_1.
              ls_ekko-inco2 = ls_business_data-inco_2.
              APPEND ls_ekko TO t_ekko.
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


  METHOD eket_eban.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zvts_rfq_detail=>tys_z_i_eket_ebantype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_ebelp      TYPE RANGE OF ebelp,
          ls_range_ebelp      LIKE LINE OF lt_range_ebelp,
          ls_eban             LIKE LINE OF t_eban,
          ls_eket             LIKE LINE OF t_eket.



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
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_PO_LIST' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_ebelp-sign = 'I'.
            ls_range_ebelp-option = 'EQ'.
            ls_range_ebelp-low = st_ekpo-ebelp.
            APPEND ls_range_ebelp TO lt_range_ebelp.
            CLEAR ls_range_ebelp.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKET_EBAN' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELP'
                                                                    it_range             = lt_range_ebelp ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BNFPO'
*                                                        it_range             = lt_range_BNFPO ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).


            LOOP AT lt_business_data INTO DATA(ls_business_data).
              IF ls_business_data-ebeln = st_ekpo-ebeln OR ls_business_data-ebeln EQ space.
                ls_business_data-banfn = ls_eket-banfn.
                ls_business_data-bnfpo = ls_eket-bnfpo.
                ls_business_data-ebeln = ls_eban-ebeln.
                ls_business_data-ebelp = ls_eban-ebelp.
                ls_business_data-statu = ls_eban-statu.
                APPEND ls_eket TO t_eket.
                APPEND ls_eban TO t_eban.
                CLEAR: ls_eket, ls_eban.
              ENDIF.
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


  METHOD eket.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zvts_rfq_detail=>tys_z_i_ekettype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_EBELN      TYPE RANGE OF ebeln,
          ls_range_EBELN      LIKE LINE OF lt_range_EBELN,
          lt_range_EBELP      TYPE RANGE OF ebelp,
          ls_range_EBELP      LIKE LINE OF lt_range_EBELP.



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

            ls_range_EBELN-sign = 'I'.
            ls_range_EBELN-option = 'EQ'.
            ls_range_EBELN-low = st_ekpo-ebeln.
            APPEND ls_range_EBELN TO lt_range_EBELN.

            ls_range_EBELP-sign = 'I'.
            ls_range_EBELP-option = 'EQ'.
            ls_range_EBELP-low = st_ekpo-ebelp.
            APPEND ls_range_EBELP TO lt_range_EBELP.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKET' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_EBELN ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELP'
                                                                    it_range             = lt_range_EBELP ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            IF sy-subrc = 0.
              st_eket-eindt = ls_business_data-eindt.
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


  METHOD eban.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_rfq_list=>tys_z_i_ebantype,
          ls_business_data TYPE zscm_rfq_list=>tys_z_i_ebantype,
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
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_RFQ_LIST'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '<service_root>' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      banfn  = i_banfn
                      bnfpo  = i_bnfpo ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EBAN' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            e_statu = ls_business_data-statu.

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
          lt_business_data TYPE TABLE OF zscm_zvts_rfq_detail=>tys_z_i_eslltype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_packno     TYPE RANGE OF packno,
          ls_range_packno     LIKE LINE OF lt_range_packno,
          ls_esll             LIKE LINE OF t_esll,
          ls_esll2            LIKE LINE OF t_esll2.


        TRY.
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

            IF st_esll IS INITIAL.
              ls_range_packno-sign = 'I'.
              ls_range_packno-option = 'EQ'.
              ls_range_packno-low = st_ekpo-packno.
            ELSEIF st_esll IS NOT INITIAL.
              ls_range_packno-sign = 'I'.
              ls_range_packno-option = 'EQ'.
              ls_range_packno-low = st_esll-sub_packno.
            ENDIF.
            APPEND ls_range_packno TO lt_range_packno.
            CLEAR ls_range_packno.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ESLL' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'PACKNO'
                                                                    it_range             = lt_range_PACKNO ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'INTROW'
*                                                        it_range             = lt_range_INTROW ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

*            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).

              IF st_esll IS INITIAL.
                ls_business_data-packno = ls_esll-packno.
                ls_business_data-sub_packno = ls_esll-sub_packno.
                APPEND ls_esll TO t_esll.
              ELSEIF st_esll IS NOT INITIAL.
                ls_business_data-packno  = ls_esll2-packno.
                ls_business_data-introw  = ls_esll2-introw.
                ls_business_data-extrow  = ls_esll2-extrow.
                ls_business_data-ktext_1 = ls_esll2-ktext1.
                ls_business_data-menge   = ls_esll2-menge.
                ls_business_data-tbtwr   = ls_esll2-tbtwr.
                ls_business_data-meins   = ls_esll2-meins.
                APPEND ls_esll2 TO t_esll2.
              ENDIF.
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


  METHOD lfm1.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_zvts_rfq_detail=>tys_z_i_lfm_1_type,
          ls_business_data TYPE zscm_zvts_rfq_detail=>tys_z_i_lfm_1_type,
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
                                                     proxy_model_id      = 'ZSCM_ZVTS_RFQ_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVTS_RFQ_DETAIL' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            IF i_prov IS INITIAL.
              ls_entity_key = VALUE #(
                        lifnr  = ls_ekko-lifnr
                        ekorg  = ls_ekko-ekorg ).
            ELSE.
              ls_entity_key = VALUE #(
              lifnr  = i_prov
              ekorg  = ls_ekko-ekorg ).
            ENDIF.

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LFM_1' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            curr = ls_business_data-waers.
            terms = ls_business_data-zterm.
            inco = ls_business_data-inco_1.

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


  METHOD t001w.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_zvts_rfq_detail=>tys_z_i_t_001_wtype,
          ls_business_data TYPE zscm_zvts_rfq_detail=>tys_z_i_t_001_wtype,
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
                                                     proxy_model_id      = 'ZSCM_ZVTS_RFQ_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVTS_RFQ_DETAIL' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      werks  = st_ekpo-werks ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_001_W' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            MOVE-CORRESPONDING ls_business_data TO st_t001w.
            st_t001w-name1 = ls_business_data-name_1.
            st_t001w-ort01 = ls_business_data-ort_01.

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
