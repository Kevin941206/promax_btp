CLASS zcl_bapi_incominginvoice_crea DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS bapi_incominginvoice_create IMPORTING i_header     TYPE zst_bapi_incinv_create_header
                                                        it_item      TYPE ztt_bapi_incinv_create_item
                                                        it_account   TYPE ztt_bapi_incinv_create_account
                                                        it_glaccount TYPE ztt_bapi_incinv_create_gl_acco
                                                        it_withtax   TYPE ztt_bapi_incinv_create_withtax
                                              EXPORTING e_invoice    TYPE char10
                                                        e_year       TYPE gjahr
                                                        et_return    TYPE ztt_bapiret2.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_BAPI_INCOMINGINVOICE_CREA IMPLEMENTATION.


  METHOD bapi_incominginvoice_create.

    DATA:
      ls_business_data        TYPE zscm_bapi_incominginvoice_crea=>ty_deep,
      ls_business_data_resp   TYPE zscm_bapi_incominginvoice_crea=>ty_deep,
      lo_http_client          TYPE REF TO if_web_http_client,
      lo_client_proxy         TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request              TYPE REF TO /iwbep/if_cp_request_create,
      lo_response             TYPE REF TO /iwbep/if_cp_response_create,
      lo_data_desc_node_root  TYPE REF TO /iwbep/if_cp_data_desc_node,
      lo_data_desc_node_child TYPE REF TO /iwbep/if_cp_data_desc_node,
      lt_property_path_root   TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
      lt_headertodata         LIKE ls_business_data-headertodata,
      ls_headertodata         LIKE LINE OF lt_headertodata,
      lt_headertoitem         LIKE ls_business_data-headertoitem,
      ls_headertoitem         LIKE LINE OF lt_headertoitem,
      lt_headertoaccounting   LIKE ls_business_data-headertoaccounting,
      ls_headertoaccounting   LIKE LINE OF lt_headertoaccounting,
      lt_headertoglaccount    LIKE ls_business_data-headertoglaccount,
      ls_headertoglaccount    LIKE LINE OF lt_headertoglaccount,
      lt_headertowithtax      LIKE ls_business_data-header_to_withtax,
      ls_headertowithtax      LIKE LINE OF lt_headertowithtax,
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
                                                 proxy_model_id      = 'ZSCM_BAPI_INCOMINGINVOICE_CREA'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_BAPI_INCOMINGINVOICE_CREAT_SRV' ).

        ASSERT lo_http_client IS BOUND.

        MOVE-CORRESPONDING i_header TO ls_headertodata.
        APPEND ls_headertodata TO lt_headertodata.
        CLEAR ls_headertodata.

        LOOP AT it_item INTO DATA(ls_item).
          MOVE-CORRESPONDING ls_item TO ls_headertoitem.
          APPEND ls_headertoitem TO lt_headertoitem.
          CLEAR ls_headertoitem.
        ENDLOOP.
        LOOP AT it_account INTO DATA(ls_account).
          MOVE-CORRESPONDING ls_account TO ls_headertoaccounting.
          APPEND ls_headertoaccounting TO lt_headertoaccounting.
          CLEAR ls_headertoaccounting.
        ENDLOOP.
        LOOP AT it_glaccount INTO DATA(ls_glaccount).
          MOVE-CORRESPONDING ls_glaccount TO ls_headertoglaccount.
          APPEND ls_headertoglaccount TO lt_headertoglaccount.
          CLEAR ls_headertoglaccount.
        ENDLOOP.
        LOOP AT it_withtax INTO DATA(ls_withtax).
          MOVE-CORRESPONDING ls_withtax TO ls_headertowithtax.
          APPEND ls_headertowithtax TO lt_headertowithtax.
          CLEAR ls_headertowithtax.
        ENDLOOP.

* Prepare business data
        ls_business_data = VALUE #(
                  date_time    = 'DateTime'
                  doc_number   = ''
                  fiscal_year  = ''
                  headertodata = lt_headertodata
                  headertoitem = lt_headertoitem
                  headertoaccounting = lt_headertoaccounting
                  headertoglaccount = lt_headertoglaccount
                  header_to_withtax = lt_headertowithtax ).

        " Navigate to the resource and create a request for the create operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_create( ).

        lt_property_path_root  = VALUE #(
                                          ( |DATE_TIME| )
                                          ( |DOC_NUMBER| )
                                          ( |FISCAL_YEAR| ) ).

        lo_data_desc_node_root = lo_request->create_data_descripton_node( )->set_properties( lt_property_path_root ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTODATA' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOITEM' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOACCOUNTING' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOGLACCOUNT' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADER_TO_WITHTAX' ).
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

        e_invoice = ls_business_data_resp-doc_number.
        e_year = ls_business_data_resp-fiscal_year.
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
