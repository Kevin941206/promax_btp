CLASS zcl_call_transaction DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: call_transaction IMPORTING i_tcode    TYPE sy-tcode
                                              is_params  TYPE zst_ctu_params
                                              it_bdcdata TYPE ztt_bdcdata
                                    EXPORTING et_messtab TYPE ztt_bdcmsgcoll.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CALL_TRANSACTION IMPLEMENTATION.


  METHOD call_transaction.

    DATA:
      ls_business_data        TYPE zscm_call_transaction=>tys_params,
      ls_business_data_resp   TYPE zscm_call_transaction=>tys_params,
      lo_http_client          TYPE REF TO if_web_http_client,
      lo_client_proxy         TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request              TYPE REF TO /iwbep/if_cp_request_create,
      lo_response             TYPE REF TO /iwbep/if_cp_response_create,
      lo_data_desc_node_root  TYPE REF TO /iwbep/if_cp_data_desc_node,
      lo_data_desc_node_child TYPE REF TO /iwbep/if_cp_data_desc_node,
      lt_property_path_root   TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
      lt_paramstobdcdatanav   TYPE TABLE OF zscm_call_transaction=>tys_bdcdata,
      ls_messtab LIKE LINE OF et_messtab.


    TRY.
        " Create http client
        DATA lv_dest TYPE string.
        SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSCM_CALL_TRANSACTION'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZCALL_TRANSACTION_SRV' ).

        ASSERT lo_http_client IS BOUND.

        LOOP AT it_bdcdata INTO DATA(ls_bdcdata).
          APPEND INITIAL LINE TO lt_paramstobdcdatanav ASSIGNING FIELD-SYMBOL(<fs_bdcdata>).
          MOVE-CORRESPONDING ls_bdcdata TO <fs_bdcdata>.
        ENDLOOP.

* Prepare business data
        ls_business_data = VALUE #(
                  tcode     = i_tcode
                  dismode   = is_params-dismode
                  updmode   = is_params-updmode
                  cattmode  = is_params-cattmode
                  defsize   = is_params-defsize
                  racommit  = is_params-racommit
                  nobinpt   = is_params-nobinpt
                  nobiend   = is_params-nobiend
                  paramstobdcdatanav = lt_paramstobdcdatanav ).

        " Navigate to the resource and create a request for the create operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'PARAMS_SET' )->create_request_for_create( ).

        lt_property_path_root  = VALUE #(
                                          ( |TCODE| )
                                          ( |DISMODE| )
                                          ( |UPDMODE| )
                                          ( |CATTMODE| )
                                          ( |DEFSIZE| )
                                          ( |RACOMMIT| )
                                          ( |NOBINPT| )
                                          ( |NOBIEND| )
    ).
        lo_data_desc_node_root = lo_request->create_data_descripton_node( )->set_properties( lt_property_path_root ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'PARAMSTOBDCDATANAV' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'PARAMSTOMSG' ).

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

        LOOP AT ls_business_data_resp-paramstomsg INTO DATA(ls_paramstomsg).
          MOVE-CORRESPONDING ls_paramstomsg TO ls_messtab.
          ls_messtab-msgv1 = ls_paramstomsg-msgv_1.
          ls_messtab-msgv2 = ls_paramstomsg-msgv_2.
          ls_messtab-msgv3 = ls_paramstomsg-msgv_3.
          ls_messtab-msgv4 = ls_paramstomsg-msgv_4.
          APPEND ls_messtab TO et_messtab.
          CLEAR ls_messtab.
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
