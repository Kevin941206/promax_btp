CLASS zcl_bapi_po_change DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: bapi_po_change IMPORTING i_ebeln   TYPE ebeln
                                            it_item   TYPE ztt_BAPIMEPOITEM
                                            it_itemx  TYPE ztt_BAPIMEPOITEMx
                                  EXPORTING et_return TYPE ztt_bapiret2.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_BAPI_PO_CHANGE IMPLEMENTATION.


  METHOD bapi_po_change.

    DATA:
      ls_business_data        TYPE zscm_bapi_po_change=>ty_deep,
      ls_business_data_resp   TYPE zscm_bapi_po_change=>ty_deep,
      lo_http_client          TYPE REF TO if_web_http_client,
      lo_client_proxy         TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request              TYPE REF TO /iwbep/if_cp_request_create,
      lo_response             TYPE REF TO /iwbep/if_cp_response_create,
      lo_data_desc_node_root  TYPE REF TO /iwbep/if_cp_data_desc_node,
      lo_data_desc_node_child TYPE REF TO /iwbep/if_cp_data_desc_node,
      lt_property_path_root   TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
      lt_headertoitemnav      LIKE ls_business_data-headertoitemnav,
      ls_headertoitemnav      LIKE LINE OF lt_headertoitemnav,
      lt_headertoitemxnav     LIKE ls_business_data-headertoitemxnav,
      ls_headertoitemxnav     LIKE LINE OF lt_headertoitemxnav,
      ls_return               LIKE LINE OF et_return.


    TRY.
        " Create http client
        DATA lv_dest TYPE string.
        SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSCM_BAPI_PO_CHANGE'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_BAPI_PO_CHANGE_SRV' ).

        ASSERT lo_http_client IS BOUND.

        LOOP AT it_item INTO DATA(ls_item).
          MOVE-CORRESPONDING ls_item TO ls_headertoitemnav.
          APPEND ls_headertoitemnav TO lt_headertoitemnav.
          CLEAR ls_headertoitemnav.
        ENDLOOP.

        LOOP AT it_itemx INTO DATA(ls_itemx).
          MOVE-CORRESPONDING ls_itemx TO ls_headertoitemxnav.
          APPEND ls_headertoitemxnav TO lt_headertoitemxnav.
          CLEAR ls_headertoitemxnav.
        ENDLOOP.

* Prepare business data
        ls_business_data = VALUE #(
                  ebeln  = i_ebeln
                  headertoitemnav = lt_headertoitemnav
                  headertoitemxnav = lt_headertoitemxnav ).

        " Navigate to the resource and create a request for the create operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_create( ).

        lt_property_path_root  = VALUE #(
                                          ( |EBELN| ) ).

        lo_data_desc_node_root = lo_request->create_data_descripton_node( )->set_properties( lt_property_path_root ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOITEMNAV' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOITEMXNAV' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTORETURN' ).

        " Set the business data for the created entity
*        lo_request->set_business_data( ls_business_data ).
        lo_request->set_deep_business_data(
              EXPORTING
                is_business_data    = ls_business_data
                io_data_description = lo_data_desc_node_root ).

        " Execute the request
        lo_response = lo_request->execute( ).

        " Get the after image
        lo_response->get_business_data( IMPORTING es_business_data = ls_business_data_resp ).

        LOOP AT ls_business_data_resp-headertoreturn INTO DATA(ls_headertoreturn).
          MOVE-CORRESPONDING ls_headertoreturn TO ls_return.
          APPEND ls_return TO et_return.
          CLEAR ls_return.
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
  ENDMETHOD.
ENDCLASS.
