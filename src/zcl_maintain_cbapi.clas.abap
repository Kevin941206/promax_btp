CLASS zcl_maintain_cbapi DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: maintain_bapi IMPORTING i_load_vendor TYPE zload_vendor
                                           i_partner     TYPE lifnr
                                 EXPORTING e_vendor      TYPE lifnr
                                           e_message     TYPE char256.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_MAINTAIN_CBAPI IMPLEMENTATION.


  METHOD maintain_bapi.

    DATA:
      ls_business_data        TYPE zscm_maintain_bapi=>ty_deep,
      ls_business_data_resp   TYPE zscm_maintain_bapi=>ty_deep,
      lo_http_client          TYPE REF TO if_web_http_client,
      lo_client_proxy         TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request              TYPE REF TO /iwbep/if_cp_request_create,
      lo_response             TYPE REF TO /iwbep/if_cp_response_create,
      lo_data_desc_node_root  TYPE REF TO /iwbep/if_cp_data_desc_node,
      lo_data_desc_node_child TYPE REF TO /iwbep/if_cp_data_desc_node,
      lt_property_path_root   TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
      lt_headertovendor       LIKE ls_business_data-headertovendor,
      ls_headertovendor       LIKE LINE OF lt_headertovendor.


    TRY.
        " Create http client
        DATA lv_dest TYPE string.
        SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSCM_MAINTAIN_BAPI'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_MAINTAIN_BAPI_SRV' ).

        ASSERT lo_http_client IS BOUND.

        MOVE-CORRESPONDING i_load_vendor TO ls_headertovendor.
        APPEND ls_headertovendor TO lt_headertovendor.
        CLEAR ls_headertovendor.

* Prepare business data
        ls_business_data = VALUE #(
                  date_time  = 'DateTime'
                  partner = i_partner
                  headertovendor = lt_headertovendor ).

        " Navigate to the resource and create a request for the create operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_create( ).

        lt_property_path_root  = VALUE #(
                                          ( |DATE_TIME| )
                                          ( |PARTNER| )
                                          ( |MESSAGE| ) ).

        lo_data_desc_node_root = lo_request->create_data_descripton_node( )->set_properties( lt_property_path_root ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOVENDOR' ).

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

        e_vendor = ls_business_data_resp-partner.
        e_message = ls_business_data_resp-message.

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
