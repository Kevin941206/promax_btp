CLASS zcl_bapi_bupa_create_from_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: bapi_bupa_create_from_data IMPORTING i_partnercat        TYPE zbapibus1006_head-partn_cat
                                                        i_partnergroup      TYPE zbapibus1006_head-partn_grp
                                                        i_centraldata       TYPE zbapibus1006_central OPTIONAL
                                                        i_centraldataperson TYPE zbapibus1006_central_person OPTIONAL
                                                        i_centraldataorg    TYPE zbapibus1006_central_organ OPTIONAL
                                                        i_addressdata       TYPE zbapibus1006_address OPTIONAL
                                                        it_tel              TYPE ztt_bapiadtel OPTIONAL
                                                        it_fax              TYPE ztt_bapiadfax OPTIONAL
                                                        it_mail             TYPE ztt_bapiadsmtp OPTIONAL
                                              EXPORTING e_partner           TYPE zbapibus1006_head-bpartner
                                                        et_return           TYPE ztt_bapiret2.

    CLASS-METHODS: bapi_bupa_bankdetail_add IMPORTING i_partner    TYPE zbapibus1006_head-bpartner
                                                      i_id         TYPE zbapibus1006_head-bankdetailid
                                                      i_bankdetail TYPE zbapibus1006_bankdetail
                                            EXPORTING et_return    TYPE ztt_bapiret2.

    CLASS-METHODS: bapi_bupa_tax_common_change IMPORTING i_partner    TYPE zbapibus1006_head-bpartner
                                                         i_tax_common TYPE zbapibus1006tax_common
                                               EXPORTING et_return    TYPE ztt_bapiret2.

    CLASS-METHODS: bapi_bupa_tax_add IMPORTING i_partner   TYPE zbapibus1006_head-bpartner
                                               i_taxtype   TYPE char4
                                               i_taxnumber TYPE char20
                                     EXPORTING et_return   TYPE ztt_bapiret2.

    CLASS-METHODS: bapi_bupr_contp_create IMPORTING i_partner       TYPE zbapibus1006_head-bpartner
                                                    i_contactperson TYPE zbapibus1006_head-bpartner
                                                    i_validfrom     TYPE datum
                                                    i_validto       TYPE datum
                                                    i_default       TYPE char1
                                                    i_centraldata   TYPE zbapibus1006002_central
                                          EXPORTING et_return       TYPE ztt_bapiret2.

    CLASS-METHODS: bapi_bupa_role_add IMPORTING i_partner TYPE zbapibus1006_head-bpartner
                                                i_role    TYPE zbapibus1006_head-partnerrole
                                      EXPORTING et_return TYPE ztt_bapiret2.

    CLASS-METHODS: bupa_central_change IMPORTING i_partner TYPE zbapibus1006_head-bpartner
                                                 i_data    TYPE zbapibus1006_central
                                                 i_datax   TYPE zbapibus1006_central_x
                                       EXPORTING et_return TYPE ztt_bapiret2.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_BAPI_BUPA_CREATE_FROM_DATA IMPLEMENTATION.


  METHOD bapi_bupa_create_from_data.


    DATA:
      ls_business_data        TYPE zscm_bupa_create_from_data=>ty_deep,
      ls_business_data_resp   TYPE zscm_bupa_create_from_data=>ty_deep,
      lo_http_client          TYPE REF TO if_web_http_client,
      lo_client_proxy         TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request              TYPE REF TO /iwbep/if_cp_request_create,
      lo_response             TYPE REF TO /iwbep/if_cp_response_create,
      lo_data_desc_node_root  TYPE REF TO /iwbep/if_cp_data_desc_node,
      lo_data_desc_node_child TYPE REF TO /iwbep/if_cp_data_desc_node,
      lt_property_path_root   TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
      lt_centraldata          LIKE ls_business_data-headertocentraldata,
      ls_centraldata          LIKE LINE OF lt_centraldata,
      lt_centraldataperson    LIKE ls_business_data-headertocentraldataperson,
      ls_centraldataperson    LIKE LINE OF lt_centraldataperson,
      lt_centraldataorg       LIKE ls_business_data-headertocentraldataorg,
      ls_centraldataorg       LIKE LINE OF lt_centraldataorg,
      lt_addressdata          LIKE ls_business_data-headertoaddressdata,
      ls_addressdata          LIKE LINE OF lt_addressdata,
      lt_telefondata          LIKE ls_business_data-headertotelefondata,
      ls_telefondata          LIKE LINE OF lt_telefondata,
      lt_faxdata              LIKE ls_business_data-headertofaxdata,
      ls_faxdata              LIKE LINE OF lt_faxdata,
      lt_emaildata            LIKE ls_business_data-headertoemaildata,
      ls_emaildata            LIKE LINE OF lt_emaildata,
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
                                                 proxy_model_id      = 'ZSCM_BUPA_CREATE_FROM_DATA'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_BAPI_BUPA_CREATE_FROM_DATA_SRV' ).

        ASSERT lo_http_client IS BOUND.

        MOVE-CORRESPONDING i_centraldata TO ls_centraldata.
        ls_centraldata-searchterm_1 = i_centraldata-searchterm1.
        ls_centraldata-searchterm_2 = i_centraldata-searchterm2.
        APPEND ls_centraldata TO lt_centraldata.
        CLEAR ls_centraldata.

        IF i_centraldataperson IS NOT INITIAL.
          MOVE-CORRESPONDING i_centraldataperson TO ls_centraldataperson.
          ls_centraldataperson-prefix_1 = i_centraldataperson-prefix1.
          ls_centraldataperson-prefix_2 = i_centraldataperson-prefix2.
          ls_centraldataperson-title_aca_1 = i_centraldataperson-title_aca1.
          ls_centraldataperson-title_aca_2 = i_centraldataperson-title_aca2.
          APPEND ls_centraldataperson TO lt_centraldataperson.
          CLEAR ls_centraldataperson.
        ENDIF.

        IF i_centraldataorg IS NOT INITIAL.
          MOVE-CORRESPONDING i_centraldataorg TO ls_centraldataorg.
          ls_centraldataorg-name_1 = i_centraldataorg-name1.
          ls_centraldataorg-name_2 = i_centraldataorg-name2.
          ls_centraldataorg-name_3 = i_centraldataorg-name3.
          ls_centraldataorg-name_4 = i_centraldataorg-name4.
          APPEND ls_centraldataorg TO lt_centraldataorg.
          CLEAR ls_centraldataorg.
        ENDIF.

        IF i_addressdata IS NOT INITIAL.
          MOVE-CORRESPONDING i_addressdata TO ls_addressdata.
          ls_addressdata-house_no_2 = i_addressdata-house_no2.
          ls_addressdata-house_no_3 = i_addressdata-house_no3.
          ls_addressdata-pcode_1_ext = i_addressdata-pcode1_ext.
          ls_addressdata-pcode_2_ext = i_addressdata-pcode2_ext.
          ls_addressdata-pcode_3_ext = i_addressdata-pcode3_ext.
          ls_addressdata-postl_cod_1 = i_addressdata-postl_cod1.
          ls_addressdata-postl_cod_2 = i_addressdata-postl_cod2.
          ls_addressdata-postl_cod_3 = i_addressdata-postl_cod3.
          APPEND ls_addressdata TO lt_addressdata.
          CLEAR ls_addressdata.
        ENDIF.

        LOOP AT it_tel INTO DATA(ls_tel).
          MOVE-CORRESPONDING ls_tel TO ls_telefondata.
          APPEND ls_telefondata TO lt_telefondata.
          CLEAR ls_telefondata.
        ENDLOOP.

        LOOP AT it_fax INTO DATA(ls_fax).
          MOVE-CORRESPONDING ls_fax TO ls_faxdata.
          APPEND ls_faxdata TO lt_faxdata.
          CLEAR ls_faxdata.
        ENDLOOP.

        LOOP AT it_mail INTO DATA(ls_mail).
          MOVE-CORRESPONDING ls_mail TO ls_emaildata.
          ls_emaildata-email = ls_mail-e_mail.
          APPEND ls_emaildata TO lt_emaildata.
          CLEAR ls_emaildata.
        ENDLOOP.


* Prepare business data
        ls_business_data = VALUE #(
                  date_time  = 'DateTime'
                  partn_cat  = i_partnercat
                  partn_grp  = i_partnergroup
                  headertocentraldata = lt_centraldata
                  headertocentraldataperson = lt_centraldataperson
                  headertocentraldataorg = lt_centraldataorg
                  headertoaddressdata = lt_addressdata
                  headertotelefondata = lt_telefondata
                  headertofaxdata = lt_faxdata
                  headertoemaildata = lt_emaildata ).

        " Navigate to the resource and create a request for the create operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_create( ).

        lt_property_path_root  = VALUE #(
                                          ( |DATE_TIME| )
                                          ( |BPARTNER| )
                                          ( |PARTN_CAT| )
                                          ( |PARTN_GRP| ) ).

        lo_data_desc_node_root = lo_request->create_data_descripton_node( )->set_properties( lt_property_path_root ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOADDRESSDATA' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOCENTRALDATA' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOCENTRALDATAORG' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOCENTRALDATAPERSON' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOEMAILDATA' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOFAXDATA' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTORETURN' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOTELEFONDATA' ).

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

        e_partner = ls_business_data_resp-bpartner.
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


  METHOD bapi_bupa_bankdetail_add.

    DATA:
      ls_business_data        TYPE zscm_bapi_bupa_bankdetail_add=>ty_deep,
      ls_business_data_resp   TYPE zscm_bapi_bupa_bankdetail_add=>ty_deep,
      lo_http_client          TYPE REF TO if_web_http_client,
      lo_client_proxy         TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request              TYPE REF TO /iwbep/if_cp_request_create,
      lo_response             TYPE REF TO /iwbep/if_cp_response_create,
      lo_data_desc_node_root  TYPE REF TO /iwbep/if_cp_data_desc_node,
      lo_data_desc_node_child TYPE REF TO /iwbep/if_cp_data_desc_node,
      lt_property_path_root   TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
      lt_bankdetail           LIKE ls_business_data-headertobankdetail,
      ls_bankdetail           LIKE LINE OF lt_bankdetail,
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
                                                 proxy_model_id      = 'ZSCM_BAPI_BUPA_BANKDETAIL_ADD'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_BAPI_BUPA_BANKDETAIL_ADD_SRV' ).

        ASSERT lo_http_client IS BOUND.

        MOVE-CORRESPONDING i_bankdetail TO ls_bankdetail.
        APPEND ls_bankdetail TO lt_bankdetail.
        CLEAR ls_bankdetail.


* Prepare business data
        ls_business_data = VALUE #(
                  date_time  = 'DateTime'
                  id         = i_id
                  partner    = i_partner
                  headertobankdetail = lt_bankdetail ).

        " Navigate to the resource and create a request for the create operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_create( ).

        lt_property_path_root  = VALUE #(
                                          ( |DATE_TIME| )
                                          ( |ID| )
                                          ( |PARTNER| ) ).

        lo_data_desc_node_root = lo_request->create_data_descripton_node( )->set_properties( lt_property_path_root ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOBANKDETAIL' ).
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


  METHOD bapi_bupa_tax_common_change.

    DATA:
      ls_business_data        TYPE zscm_bapi_bupa_tax_common_chan=>ty_deep,
      ls_business_data_resp   TYPE zscm_bapi_bupa_tax_common_chan=>ty_deep,
      lo_http_client          TYPE REF TO if_web_http_client,
      lo_client_proxy         TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request              TYPE REF TO /iwbep/if_cp_request_create,
      lo_response             TYPE REF TO /iwbep/if_cp_response_create,
      lo_data_desc_node_root  TYPE REF TO /iwbep/if_cp_data_desc_node,
      lo_data_desc_node_child TYPE REF TO /iwbep/if_cp_data_desc_node,
      lt_property_path_root   TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
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
                                                 proxy_model_id      = 'ZSCM_BAPI_BUPA_TAX_COMMON_CHAN'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_BAPI_BUPA_TAX_COMMON_CHANG_SRV' ).

        ASSERT lo_http_client IS BOUND.


* Prepare business data
        ls_business_data = VALUE #(
                  partner         = i_partner
                  natural_person  = i_tax_common-naturalperson ).

        " Navigate to the resource and create a request for the create operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_create( ).

        lt_property_path_root  = VALUE #(
                                          ( |PARTNER| )
                                          ( |NATURAL_PERSON| ) ).

        lo_data_desc_node_root = lo_request->create_data_descripton_node( )->set_properties( lt_property_path_root ).
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


  METHOD bapi_bupa_tax_add.

    DATA:
      ls_business_data        TYPE zscm_bapi_bupa_tax_add=>ty_deep,
      ls_business_data_resp   TYPE zscm_bapi_bupa_tax_add=>ty_deep,
      lo_http_client          TYPE REF TO if_web_http_client,
      lo_client_proxy         TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request              TYPE REF TO /iwbep/if_cp_request_create,
      lo_response             TYPE REF TO /iwbep/if_cp_response_create,
      lo_data_desc_node_root  TYPE REF TO /iwbep/if_cp_data_desc_node,
      lo_data_desc_node_child TYPE REF TO /iwbep/if_cp_data_desc_node,
      lt_property_path_root   TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
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
                                                 proxy_model_id      = 'ZSCM_BAPI_BUPA_TAX_ADD'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_BAPI_BUPA_TAX_ADD_SRV' ).

        ASSERT lo_http_client IS BOUND.


* Prepare business data
        ls_business_data = VALUE #(
                  partner     = i_partner
                  tax_type    = i_taxtype
                  tax_number  = i_taxnumber ).

        " Navigate to the resource and create a request for the create operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_create( ).

        lt_property_path_root  = VALUE #(
                                          ( |PARTNER| )
                                          ( |TAX_TYPE| )
                                          ( |TAX_NUMBER| ) ).

        lo_data_desc_node_root = lo_request->create_data_descripton_node( )->set_properties( lt_property_path_root ).
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


  METHOD bapi_bupr_contp_create.

    DATA:
      ls_business_data        TYPE zscm_bapi_bupr_contp_create=>ty_deep,
      ls_business_data_resp   TYPE zscm_bapi_bupr_contp_create=>ty_deep,
      lo_http_client          TYPE REF TO if_web_http_client,
      lo_client_proxy         TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request              TYPE REF TO /iwbep/if_cp_request_create,
      lo_response             TYPE REF TO /iwbep/if_cp_response_create,
      lo_data_desc_node_root  TYPE REF TO /iwbep/if_cp_data_desc_node,
      lo_data_desc_node_child TYPE REF TO /iwbep/if_cp_data_desc_node,
      lt_property_path_root   TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
      lt_centraldata          LIKE ls_business_data-headertocentraldata,
      ls_centraldata          LIKE LINE OF lt_centraldata,
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
                                                 proxy_model_id      = 'ZSCM_BAPI_BUPR_CONTP_CREATE'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_BAPI_BUPR_CONTP_CREATE_SRV' ).

        ASSERT lo_http_client IS BOUND.

        MOVE-CORRESPONDING i_centraldata TO ls_centraldata.
        APPEND ls_centraldata TO lt_centraldata.
        CLEAR ls_centraldata.

* Prepare business data
        ls_business_data = VALUE #(
                  date_time       = 'DateTime'
                  partner         = i_partner
                  contact_person  = i_contactperson
                  valid_from      = i_validfrom
                  valid_to        = i_validto
                  default_rel     = i_default
                  headertocentraldata = lt_centraldata ).

        " Navigate to the resource and create a request for the create operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_create( ).

        lt_property_path_root  = VALUE #(
                                          ( |DATE_TIME| )
                                          ( |PARTNER| )
                                          ( |CONTACT_PERSON| )
                                          ( |VALID_FROM| )
                                          ( |VALID_TO| )
                                          ( |DEFAULT_REL| ) ).

        lo_data_desc_node_root = lo_request->create_data_descripton_node( )->set_properties( lt_property_path_root ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOCENTRALDATA' ).
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


  METHOD bapi_bupa_role_add.

    DATA:
      ls_business_data        TYPE zscm_bapi_bupa_role_add=>ty_deep,
      ls_business_data_resp   TYPE zscm_bapi_bupa_role_add=>ty_deep,
      lo_http_client          TYPE REF TO if_web_http_client,
      lo_client_proxy         TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request              TYPE REF TO /iwbep/if_cp_request_create,
      lo_response             TYPE REF TO /iwbep/if_cp_response_create,
      lo_data_desc_node_root  TYPE REF TO /iwbep/if_cp_data_desc_node,
      lo_data_desc_node_child TYPE REF TO /iwbep/if_cp_data_desc_node,
      lt_property_path_root   TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
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
                                                 proxy_model_id      = 'ZSCM_BAPI_BUPA_ROLE_ADD'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_BAPI_BUPA_ROLE_ADD_SRV' ).

        ASSERT lo_http_client IS BOUND.


* Prepare business data
        ls_business_data = VALUE #(
                  partner      = i_partner
                  partner_rol  = i_role ).

        " Navigate to the resource and create a request for the create operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_create( ).

        lt_property_path_root  = VALUE #(
                                          ( |PARTNER| )
                                          ( |PARTNER_ROL| ) ).

        lo_data_desc_node_root = lo_request->create_data_descripton_node( )->set_properties( lt_property_path_root ).
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


  METHOD bupa_central_change.

    DATA:
      ls_business_data        TYPE zscm_bupa_central_change=>ty_deep,
      ls_business_data_resp   TYPE zscm_bupa_central_change=>ty_deep,
      lo_http_client          TYPE REF TO if_web_http_client,
      lo_client_proxy         TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request              TYPE REF TO /iwbep/if_cp_request_create,
      lo_response             TYPE REF TO /iwbep/if_cp_response_create,
      lo_data_desc_node_root  TYPE REF TO /iwbep/if_cp_data_desc_node,
      lo_data_desc_node_child TYPE REF TO /iwbep/if_cp_data_desc_node,
      lt_property_path_root   TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
      ls_return               LIKE LINE OF et_return,
      lt_headertocentraldata  LIKE ls_business_data-headertocentraldata,
      ls_headertocentraldata  LIKE LINE OF lt_headertocentraldata,
      lt_headertocentraldatax LIKE ls_business_data-headertocentraldatax,
      ls_headertocentraldatax LIKE LINE OF lt_headertocentraldatax.

    TRY.
        " Create http client
        DATA lv_dest TYPE string.
        SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSCM_BUPA_CENTRAL_CHANGE'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_BUPA_CENTRAL_CHANGE_SRV' ).

        ASSERT lo_http_client IS BOUND.

        MOVE-CORRESPONDING i_data TO ls_headertocentraldata.
        APPEND ls_headertocentraldata TO lt_headertocentraldata.
        CLEAR ls_headertocentraldata.

        MOVE-CORRESPONDING i_datax TO ls_headertocentraldatax.
        APPEND ls_headertocentraldatax TO lt_headertocentraldatax.
        CLEAR ls_headertocentraldatax.

* Prepare business data
        ls_business_data = VALUE #(
                  partner  = i_partner
                  headertocentraldata = lt_headertocentraldata
                  headertocentraldatax = lt_headertocentraldatax ).

        " Navigate to the resource and create a request for the create operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_create( ).

        lt_property_path_root  = VALUE #(
                                          ( |PARTNER| ) ).

        lo_data_desc_node_root = lo_request->create_data_descripton_node( )->set_properties( lt_property_path_root ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOCENTRALDATA' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOCENTRALDATAX' ).
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
