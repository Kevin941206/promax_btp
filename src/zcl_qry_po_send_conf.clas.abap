CLASS zcl_qry_po_send_conf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: ekko IMPORTING i_ebeln TYPE ebeln
                        EXPORTING e_ekko  TYPE zekko.

    CLASS-METHODS: ekpo IMPORTING i_ebeln TYPE ebeln
                                  i_ebelp TYPE ebelp
                        EXPORTING e_bstae TYPE zekpo-bstae
                                  e_kzabs TYPE zekpo-kzabs.

    CLASS-METHODS: ekbe IMPORTING i_ebeln TYPE ebeln
                                  i_ebelp TYPE ebelp
                        EXPORTING e_subrc TYPE sy-subrc.

    CLASS-METHODS: ekpo2 IMPORTING i_ebeln TYPE ebeln
                                   i_ebelp TYPE ebelp
                         EXPORTING e_matnr TYPE zekpo-matnr
                                   e_bpumz TYPE zekpo-bpumz
                                   e_bpumn TYPE zekpo-bpumn
                                   e_meins TYPE zekpo-meins.

    CLASS-METHODS: eket IMPORTING i_ebeln TYPE ebeln
                                  i_ebelp TYPE ebelp
                        EXPORTING e_eindt TYPE datum.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_QRY_PO_SEND_CONF IMPLEMENTATION.


  METHOD ekko.

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

        MOVE-CORRESPONDING ls_business_data TO e_ekko.

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


  METHOD ekpo.

    DATA:
      ls_entity_key    TYPE zscm_po_details=>tys_z_i_ekpotype,
      ls_business_data TYPE zscm_po_details=>tys_z_i_ekpotype,
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
                  ebeln  = i_ebeln
                  ebelp  = i_ebelp ).

        " Navigate to the resource
        lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKPO' )->navigate_with_key( ls_entity_key ).

        " Execute the request and retrieve the business data
        lo_response = lo_resource->create_request_for_read( )->execute( ).
        lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

        e_bstae = ls_business_data-bstae.
        e_kzabs = ls_business_data-kzabs.

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


  METHOD ekbe.

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
      lt_range_ebeln      TYPE RANGE OF ebeln,
      ls_range_ebeln      LIKE LINE OF lt_range_ebeln,
      lt_range_ebelp      TYPE RANGE OF ebelp,
      ls_range_ebelp      LIKE LINE OF lt_range_ebelp,
      lt_range_vgabe      TYPE RANGE OF char1,
      ls_range_vgabe      LIKE LINE OF lt_range_vgabe.

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

        ls_range_vgabe-sign = 'I'.
        ls_range_vgabe-option = 'EQ'.
        ls_range_vgabe-low = '1'.
        APPEND ls_range_vgabe TO lt_range_vgabe.

        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKBE' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                it_range             = lt_range_ebeln ).
        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELP'
                                                                it_range             = lt_range_ebelp ).
        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'VGABE'
                                                                it_range             = lt_range_vgabe ).

        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
        lo_request->set_filter( lo_filter_node_root ).

        lo_request->set_top( 50 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        READ TABLE lt_business_data TRANSPORTING NO FIELDS INDEX 1.
        e_subrc = sy-subrc.

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


  METHOD eket.

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
        IF sy-subrc = 0.
          e_eindt = ls_business_data-eindt.
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
  ENDMETHOD.


  METHOD ekpo2.

    DATA:
      ls_entity_key    TYPE zscm_po_details=>tys_z_i_ekpotype,
      ls_business_data TYPE zscm_po_details=>tys_z_i_ekpotype,
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
                  ebeln  = i_ebeln
                  ebelp  = i_ebelp ).

        " Navigate to the resource
        lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKPO' )->navigate_with_key( ls_entity_key ).

        " Execute the request and retrieve the business data
        lo_response = lo_resource->create_request_for_read( )->execute( ).
        lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

        e_matnr = ls_business_data-matnr.
        e_bpumz = ls_business_data-bpumz.
        e_bpumn = ls_business_data-bpumn.
        e_meins = ls_business_data-meins.

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
