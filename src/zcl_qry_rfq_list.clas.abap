CLASS zcl_qry_rfq_list DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS arfqbidder IMPORTING i_operacion   TYPE text10
                                       i_prov        TYPE lifnr
                             EXPORTING et_arfqbidder TYPE ztt_arfqbidder.

    CLASS-METHODS: ekko IMPORTING i_operacion    TYPE text10
                                  i_bukrs        TYPE bukrs
                                  i_start        TYPE erdat
                                  i_end          TYPE erdat
                                  it_arfqbidder  TYPE ztt_arfqbidder
                        EXPORTING et_pedidos_cab TYPE ztt_pedidos_cab.

    CLASS-METHODS: ekko2 IMPORTING i_operacion    TYPE text10
                                   i_bukrs        TYPE bukrs
                                   i_start        TYPE erdat
                                   i_end          TYPE erdat
                                   i_ebeln        TYPE ebeln
                                   i_lifnr        TYPE lifnr
                         EXPORTING et_pedidos_cab TYPE ztt_pedidos_cab.

    CLASS-METHODS: lfm1 IMPORTING i_operacion TYPE text10
                                  i_lifnr     TYPE lifnr
                                  i_ekorg     TYPE ekorg
                        EXPORTING e_waers     TYPE waers.

    CLASS-METHODS: ekpo IMPORTING i_operacion TYPE text10
                                  it_ekko     TYPE ztt_pedidos_cab
                                  i_status    TYPE char1
                        EXPORTING et_ekpo     TYPE ztt_pedidos2.

    CLASS-METHODS: tmamt IMPORTING i_operacion TYPE text10
                                   i_agmem     TYPE char3
                         EXPORTING e_agtxt     TYPE text30.

    CLASS-METHODS: eket IMPORTING i_operacion TYPE text10
                                  i_ebeln     TYPE ebeln
                                  i_ebelp     TYPE ebelp
                        EXPORTING e_banfn     TYPE banfn
                                  e_eindt     TYPE eindt
                                  e_bnfpo     TYPE bnfpo.

    CLASS-METHODS: srgbtbrel IMPORTING i_operacion TYPE text10
                                       i_reltype   TYPE char4
                                       i_banfn     TYPE banfn
                             EXPORTING e_atch      TYPE char1.

    CLASS-METHODS: t163y IMPORTING i_operacion TYPE text10
                                   i_spras     TYPE spras
                                   i_pstyp     TYPE pstyp
                         EXPORTING e_epstp     TYPE epstp
                                   e_ptext     TYPE text20.

    CLASS-METHODS: eban IMPORTING i_operacion TYPE text10
                                  i_banfn     TYPE banfn
                                  i_bnfpo     TYPE bnfpo
                        EXPORTING e_statu     TYPE char1.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_qry_rfq_list IMPLEMENTATION.


  METHOD arfqbidder.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_rfq_list=>tys_z_i_arfqbidder_type,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_supplier   TYPE RANGE OF lifnr,
          ls_range_supplier   LIKE LINE OF lt_range_supplier,
          ls_arfqbidder       LIKE LINE OF et_arfqbidder.


        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_RFQ_LIST'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_RFQ_LIST' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_supplier-sign = 'I'.
            ls_range_supplier-option = 'EQ'.
            ls_range_supplier-low = i_prov.
            APPEND ls_range_supplier TO lt_range_supplier.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ARFQBIDDER' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'SUPPLIER'
                                                                    it_range             = lt_range_supplier ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_arfqbidder.
              APPEND ls_arfqbidder TO et_arfqbidder.
              CLEAR ls_arfqbidder.
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
          lt_range_aedat      TYPE RANGE OF aedat,
          ls_range_aedat      LIKE LINE OF lt_range_aedat,
          lt_range_bstyp      TYPE RANGE OF bstyp,
          ls_range_bstyp      LIKE LINE OF lt_range_bstyp,
          ls_pedidos_cab      LIKE LINE OF et_pedidos_cab.

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

            LOOP AT it_arfqbidder INTO DATA(ls_arfq).
              ls_range_ebeln-sign = 'I'.
              ls_range_ebeln-option = 'EQ'.
              ls_range_ebeln-low = ls_arfq-requestforquotation.
              APPEND ls_range_ebeln TO lt_range_ebeln.
            ENDLOOP.
            IF i_bukrs IS NOT INITIAL.
              ls_range_bukrs-sign = 'I'.
              ls_range_bukrs-option = 'EQ'.
              ls_range_bukrs-low = i_bukrs.
              APPEND ls_range_bukrs TO lt_range_bukrs.
            ENDIF.
            IF i_start IS NOT INITIAL AND i_end IS NOT INITIAL.
              ls_range_aedat-sign = 'I'.
              ls_range_aedat-option = 'BT'.
              ls_range_aedat-low = i_start.
              ls_range_aedat-high = i_end.
              APPEND ls_range_aedat TO lt_range_aedat.
            ELSEIF i_start IS NOT INITIAL AND i_end IS INITIAL.
              ls_range_aedat-sign = 'I'.
              ls_range_aedat-option = 'EQ'.
              ls_range_aedat-low = i_start.
              APPEND ls_range_aedat TO lt_range_aedat.
            ENDIF.

            ls_range_bstyp-sign = 'I'.
            ls_range_bstyp-option = 'EQ'.
            ls_range_bstyp-low = 'R'.
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
            IF lt_range_aedat IS NOT INITIAL.
              lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'AEDAT'
                                                                      it_range             = lt_range_aedat ).
            ENDIF.
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BSTYP'
                                                                    it_range             = lt_range_bstyp ).
            IF lt_range_ebeln IS NOT INITIAL AND lt_range_bukrs IS NOT INITIAL AND lt_range_aedat IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            ELSEIF lt_range_ebeln IS NOT INITIAL AND lt_range_bukrs IS NOT INITIAL AND lt_range_aedat IS INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_4 ).
            ELSEIF lt_range_ebeln IS NOT INITIAL AND lt_range_bukrs IS INITIAL AND lt_range_aedat IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            ELSEIF lt_range_ebeln IS INITIAL AND lt_range_bukrs IS NOT INITIAL AND lt_range_aedat IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_2->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            ELSEIF lt_range_ebeln IS NOT INITIAL AND lt_range_bukrs IS INITIAL AND lt_range_aedat IS INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_4 ).
            ELSEIF lt_range_ebeln IS INITIAL AND lt_range_bukrs IS NOT INITIAL AND lt_range_aedat IS INITIAL.
              lo_filter_node_root = lo_filter_node_2->and( lo_filter_node_4 ).
            ELSEIF lt_range_ebeln IS INITIAL AND lt_range_bukrs IS INITIAL AND lt_range_aedat IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_3->and( lo_filter_node_4 ).
            ELSEIF lt_range_ebeln IS INITIAL AND lt_range_bukrs IS INITIAL AND lt_range_aedat IS INITIAL.
              lo_filter_node_root = lo_filter_node_4.
            ENDIF.

            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_pedidos_cab.
              APPEND ls_pedidos_cab TO et_pedidos_cab.
              CLEAR ls_pedidos_cab.
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


  METHOD ekko2.
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
          lo_filter_node_5    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_ebeln      TYPE RANGE OF ebeln,
          ls_range_ebeln      LIKE LINE OF lt_range_ebeln,
          lt_range_lifnr      TYPE RANGE OF lifnr,
          ls_range_lifnr      LIKE LINE OF lt_range_lifnr,
          lt_range_bukrs      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_aedat      TYPE RANGE OF aedat,
          ls_range_aedat      LIKE LINE OF lt_range_aedat,
          lt_range_bstyp      TYPE RANGE OF bstyp,
          ls_range_bstyp      LIKE LINE OF lt_range_bstyp,
          ls_pedidos_cab      LIKE LINE OF et_pedidos_cab.

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
            IF i_start IS NOT INITIAL AND i_end IS NOT INITIAL.
              ls_range_aedat-sign = 'I'.
              ls_range_aedat-option = 'BT'.
              ls_range_aedat-low = i_start.
              ls_range_aedat-high = i_end.
              APPEND ls_range_aedat TO lt_range_aedat.
            ELSEIF i_start IS NOT INITIAL AND i_end IS INITIAL.
              ls_range_aedat-sign = 'I'.
              ls_range_aedat-option = 'EQ'.
              ls_range_aedat-low = i_start.
              APPEND ls_range_aedat TO lt_range_aedat.
            ENDIF.

            ls_range_bstyp-sign = 'I'.
            ls_range_bstyp-option = 'EQ'.
            ls_range_bstyp-low = 'A'.
            APPEND ls_range_bstyp TO lt_range_bstyp.

            ls_range_lifnr-sign = 'I'.
            ls_range_lifnr-option = 'EQ'.
            ls_range_lifnr-low = i_lifnr.
            APPEND ls_range_lifnr TO lt_range_lifnr.

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
            IF lt_range_aedat IS NOT INITIAL.
              lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'AEDAT'
                                                                      it_range             = lt_range_aedat ).
            ENDIF.
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BSTYP'
                                                                    it_range             = lt_range_bstyp ).
            lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'LIFNR'
                                                                    it_range             = lt_range_lifnr ).
            IF lt_range_ebeln IS NOT INITIAL AND lt_range_bukrs IS NOT INITIAL AND lt_range_aedat IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 ).
            ELSEIF lt_range_ebeln IS NOT INITIAL AND lt_range_bukrs IS NOT INITIAL AND lt_range_aedat IS INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_4 )->and( lo_filter_node_5 ).
            ELSEIF lt_range_ebeln IS NOT INITIAL AND lt_range_bukrs IS INITIAL AND lt_range_aedat IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 ).
            ELSEIF lt_range_ebeln IS INITIAL AND lt_range_bukrs IS NOT INITIAL AND lt_range_aedat IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_2->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 ).
            ELSEIF lt_range_ebeln IS NOT INITIAL AND lt_range_bukrs IS INITIAL AND lt_range_aedat IS INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_4 )->and( lo_filter_node_5 ).
            ELSEIF lt_range_ebeln IS INITIAL AND lt_range_bukrs IS NOT INITIAL AND lt_range_aedat IS INITIAL.
              lo_filter_node_root = lo_filter_node_2->and( lo_filter_node_4 )->and( lo_filter_node_5 ).
            ELSEIF lt_range_ebeln IS INITIAL AND lt_range_bukrs IS INITIAL AND lt_range_aedat IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_3->and( lo_filter_node_4 )->and( lo_filter_node_5 ).
            ELSEIF lt_range_ebeln IS INITIAL AND lt_range_bukrs IS INITIAL AND lt_range_aedat IS INITIAL.
              lo_filter_node_root = lo_filter_node_4->and( lo_filter_node_5 ).
            ENDIF.

            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_pedidos_cab.
              APPEND ls_pedidos_cab TO et_pedidos_cab.
              CLEAR ls_pedidos_cab.
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
          ls_entity_key    TYPE zscm_rfq_list=>tys_z_i_lfm_1_type,
          ls_business_data TYPE zscm_rfq_list=>tys_z_i_lfm_1_type,
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
                                                     proxy_model_id      = 'ZSCM_RFQ_LIST'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_RFQ_LIST' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      lifnr  = i_lifnr
                      ekorg  = i_ekorg ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LFM_1' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

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
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_ebeln      TYPE RANGE OF ebeln,
          ls_range_ebeln      LIKE LINE OF lt_range_ebeln,
          lt_range_loekz      TYPE RANGE OF eloek,
          ls_range_loekz      LIKE LINE OF lt_range_loekz,
          lt_range_agdat      TYPE RANGE OF datum,
          ls_range_agdat      LIKE LINE OF lt_range_agdat,
          lt_range_netpr      TYPE RANGE OF zekpo-netpr,
          ls_range_netpr      LIKE LINE OF lt_range_netpr,
          ls_ekpo             LIKE LINE OF et_ekpo.


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

            LOOP AT it_ekko INTO DATA(ls_ekko).
              ls_range_ebeln-sign = 'I'.
              ls_range_ebeln-option = 'EQ'.
              ls_range_ebeln-low = ls_ekko-ebeln.
              APPEND ls_range_ebeln TO lt_range_ebeln.
              CLEAR ls_range_ebeln.
            ENDLOOP.

            ls_range_loekz-sign = 'I'.
            ls_range_loekz-option = 'EQ'.
            ls_range_loekz-low = space.
            APPEND ls_range_loekz TO lt_range_loekz.
            CLEAR ls_range_loekz.

            IF i_status = 'V'.
              ls_range_agdat-sign = 'I'.
              ls_range_agdat-option = 'LT'.
              ls_range_agdat-low = sy-datum.
              APPEND ls_range_agdat TO lt_range_agdat.
              CLEAR ls_range_agdat.
            ENDIF.
            IF i_status = 'S' OR i_status = 'C'.
              ls_range_agdat-sign = 'I'.
              ls_range_agdat-option = 'GE'.
              ls_range_agdat-low = sy-datum.
              APPEND ls_range_agdat TO lt_range_agdat.
              CLEAR ls_range_agdat.
            ENDIF.
            IF i_status = 'S'.
              ls_range_netpr-sign = 'I'.
              ls_range_netpr-option = 'EQ'.
              ls_range_netpr-low = 0.
              APPEND ls_range_netpr TO lt_range_netpr.
              CLEAR ls_range_netpr.
            ENDIF.
            IF i_status = 'C'.
              ls_range_netpr-sign = 'I'.
              ls_range_netpr-option = 'NE'.
              ls_range_netpr-low = 0.
              APPEND ls_range_netpr TO lt_range_netpr.
              CLEAR ls_range_netpr.
            ENDIF.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKPO' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_ebeln ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'LOEKZ'
                                                                    it_range             = lt_range_loekz ).
            IF i_status = 'V' OR i_status = 'S' OR i_status = 'C'.
              lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'AGDAT'
                                                                      it_range             = lt_range_agdat ).
            ENDIF.
            IF i_status = 'S' OR i_status = 'C'.
              lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'NETPR'
                                                                      it_range             = lt_range_netpr ).
            ENDIF.

            IF i_status = 'T'.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            ELSEIF i_status = 'V'.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            ELSEIF i_status = 'S' OR i_status = 'C'.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            ENDIF.
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_ekpo.
              ls_ekpo-txz01 = ls_business_data-txz_01.
              APPEND ls_ekpo TO et_ekpo.
              CLEAR ls_ekpo.
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


  METHOD tmamt.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_rfq_list=>tys_z_i_tmamt_type,
          ls_business_data TYPE zscm_rfq_list=>tys_z_i_tmamt_type,
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
                                                     proxy_model_id      = 'ZSCM_RFQ_LIST'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_RFQ_LIST' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      spras  = 'ES'
                      agmem  = i_agmem ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_TMAMT' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            e_agtxt = ls_business_data-agtxt.

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
          lt_business_data TYPE TABLE OF zscm_po_list=>tys_z_i_ekettype,
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
          ls_range_ebelp      LIKE LINE OF lt_range_ebelp.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_PO_LIST'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_PO_LIST' ).

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
            e_banfn = ls_business_data-banfn.
            e_eindt = ls_business_data-eindt.
            e_bnfpo = ls_business_data-bnfpo.

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


  METHOD srgbtbrel.
    CASE i_operacion.
      WHEN 'READ'.


        DATA:
          lt_business_data TYPE TABLE OF zscm_rfq_list=>tys_z_i_srgbtbreltype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_RELTYPE    TYPE RANGE OF char10,
          ls_range_RELTYPE    LIKE LINE OF lt_range_RELTYPE,
          lt_range_INSTID_A   TYPE RANGE OF char70,
          ls_range_instid_a   LIKE LINE OF lt_range_instid_a,
          lv_banfn            TYPE c LENGTH 10.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_RFQ_LIST'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_RFQ_LIST' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_reltype-sign = 'I'.
            ls_range_reltype-option = 'EQ'.
            ls_range_reltype-low = i_reltype.
            APPEND ls_range_reltype TO lt_range_reltype.

            lv_banfn = |{ i_banfn ALPHA = IN }|.
            ls_range_instid_a-sign = 'I'.
            ls_range_instid_a-option = 'EQ'.
            ls_range_instid_a-low = lv_banfn.
            APPEND ls_range_instid_a TO lt_range_instid_a.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_SRGBTBREL' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'RELTYPE'
                                                                    it_range             = lt_range_reltype ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'INSTID_A'
                                                                    it_range             = lt_range_instid_a ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            IF sy-subrc = 0.
              e_atch = 'X'.
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
                                                     proxy_model_id      = 'ZSCM_RFQ_LIST'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_RFQ_LIST' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      spras  = i_spras
                      pstyp  = i_pstyp ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_163_Y' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            e_epstp = ls_business_data-epstp.
            e_ptext = ls_business_data-ptext.

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
*DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
*                                             comm_scenario  = '<Comm Scenario>'
*                                             comm_system_id = '<Comm System Id>'
*                                             service_id     = '<Service Id>' ).
*lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
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
ENDCLASS.
