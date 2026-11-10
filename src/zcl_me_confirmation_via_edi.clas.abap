CLASS zcl_me_confirmation_via_edi DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: me_confirmation_via_edi IMPORTING it_komdlgn TYPE ztt_komdlgn
                                           EXPORTING et_errores TYPE ztt_wuebs.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ME_CONFIRMATION_VIA_EDI IMPLEMENTATION.


  METHOD me_confirmation_via_edi.

    DATA:
      ls_business_data        TYPE zscm_me_confirmation_via_edi=>ty_deep,
      ls_business_data_resp   TYPE zscm_me_confirmation_via_edi=>ty_deep,
      lo_http_client          TYPE REF TO if_web_http_client,
      lo_client_proxy         TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request              TYPE REF TO /iwbep/if_cp_request_create,
      lo_response             TYPE REF TO /iwbep/if_cp_response_create,
      lo_data_desc_node_root  TYPE REF TO /iwbep/if_cp_data_desc_node,
      lo_data_desc_node_child TYPE REF TO /iwbep/if_cp_data_desc_node,
      lt_property_path_root   TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
      lt_headertoitem         LIKE ls_business_data-headertoitem,
      ls_headertoitem         LIKE LINE OF lt_headertoitem,
      ls_errores              LIKE LINE OF et_errores.

    TRY.
        " Create http client
        DATA lv_dest TYPE string.
        SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSCM_ME_CONFIRMATION_VIA_EDI'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_ME_CONFIRMATION_VIA_EDI_SRV' ).

        ASSERT lo_http_client IS BOUND.

        LOOP AT it_komdlgn INTO DATA(ls_komdlgn).
          MOVE-CORRESPONDING ls_komdlgn TO ls_headertoitem.
          APPEND ls_headertoitem TO lt_headertoitem.
          CLEAR ls_headertoitem.
        ENDLOOP.


* Prepare business data
        ls_business_data = VALUE #(
                  date_time  = 'DateTime'
                  headertoitem = lt_headertoitem ).

        " Navigate to the resource and create a request for the create operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_create( ).

        lt_property_path_root  = VALUE #(
                                          ( |DATE_TIME| ) ).

        lo_data_desc_node_root = lo_request->create_data_descripton_node( )->set_properties( lt_property_path_root ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOITEM' ).
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
          MOVE-CORRESPONDING ls_headertoreturn TO ls_errores.
          APPEND ls_errores TO et_errores.
          CLEAR ls_errores.
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
