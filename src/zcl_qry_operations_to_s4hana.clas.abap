CLASS zcl_qry_operations_to_s4hana DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-DATA: BEGIN OF ty_aubel,
                  aubel TYPE vbeln,
                END OF ty_aubel.

    CLASS-DATA lt_aubel LIKE TABLE OF ty_aubel.

    CLASS-METHODS: ztfi_pidatfisc   IMPORTING i_operacion TYPE text10
                                              it_datfisc  TYPE zttfi_datfisc.

    CLASS-METHODS: zprodfam_t       IMPORTING VALUE(i_operacion)         TYPE text10
                                    EXPORTING VALUE(et_prod_subfamilies) TYPE yttsd_prodfam_t.

    CLASS-METHODS: zproduct_catalog IMPORTING VALUE(i_operacion) TYPE text10
                                    EXPORTING VALUE(et_product)  TYPE ytt_stmm_products_e.

    CLASS-METHODS: sales_info_vttk_lfa1 IMPORTING VALUE(i_operacion) TYPE text10
                                                  it_docflow         TYPE ztt_vbfa
                                        EXPORTING VALUE(et_shipment) TYPE ztt_transp_data.

    CLASS-METHODS: sales_info_vbak_knvv IMPORTING VALUE(i_operacion) TYPE text10
                                                  i_vbeln            TYPE vbeln
                                        EXPORTING VALUE(es_document) TYPE zsales_document.

    CLASS-METHODS: sales_info_kna1      IMPORTING VALUE(i_operacion) TYPE text10
                                                  i_kunnr            TYPE kunnr
                                        EXPORTING VALUE(es_customer) TYPE zsales_customer.

    CLASS-METHODS: sales_info_vbap      IMPORTING VALUE(i_operacion) TYPE text10
                                                  i_vbeln            TYPE vbeln
                                        EXPORTING VALUE(et_vbap)     TYPE ztt_vbap.

    CLASS-METHODS: tspat            IMPORTING VALUE(i_operacion) TYPE text10
                                    EXPORTING VALUE(et_sectors)  TYPE ztt_tspat.

    CLASS-METHODS: sales_info_likp      IMPORTING VALUE(i_operacion) TYPE text10
                                                  i_vbeln            TYPE vbeln
                                        EXPORTING VALUE(es_document) TYPE zsales_document.

    CLASS-METHODS: sales_info_lips      IMPORTING VALUE(i_operacion) TYPE text10
                                                  i_vbeln            TYPE vbeln
                                        EXPORTING VALUE(et_lips)     TYPE ztt_lips.

    CLASS-METHODS: sales_info_vbrk      IMPORTING VALUE(i_operacion) TYPE text10
                                                  i_vbeln            TYPE vbeln
                                        EXPORTING VALUE(es_document) TYPE zsales_document.

    CLASS-METHODS: sales_info_vbrp      IMPORTING VALUE(i_operacion) TYPE text10
                                                  i_vbeln            TYPE vbeln
                                        EXPORTING VALUE(et_vbrp)     TYPE ztt_vbrp.

    CLASS-METHODS: company_code_list_get IMPORTING VALUE(i_operacion) TYPE text10
                                         EXPORTING VALUE(et_companys) TYPE ztt_bapi0002_1.

    CLASS-METHODS: customers_comp_get IMPORTING VALUE(i_operacion)       TYPE text10
                                                i_bukrs                  TYPE bukrs
                                      EXPORTING VALUE(et_customers_list) TYPE  yttsd_customer_list_e.

    CLASS-METHODS: customers_comp_kna1 IMPORTING VALUE(i_operacion)        TYPE text10
                                                 lv_customerno             TYPE kunnr
                                                 lv_companycode            TYPE bukrs
                                       EXPORTING VALUE(ls_customeraddress) TYPE zbapicustomer_04.

    CLASS-METHODS: incoterms_tinct    IMPORTING VALUE(i_operacion) TYPE text10
                                                i_langu            TYPE spras
                                      EXPORTING VALUE(inco)        TYPE ztt_tinct.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_QRY_OPERATIONS_TO_S4HANA IMPLEMENTATION.


  METHOD ztfi_pidatfisc.

    CASE i_operacion.
      WHEN 'CREATE'.

        DATA:
          ls_business_data TYPE zcl_scm_datfisc=>tys_z_i_datfisctype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_create,
          lo_response      TYPE REF TO /iwbep/if_cp_response_create.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_DATFISC'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_DATFISC' ).

            ASSERT lo_http_client IS BOUND.

            LOOP AT it_datfisc INTO DATA(ls_datfisc).
* Prepare business data
              MOVE-CORRESPONDING ls_datfisc TO ls_business_data.
              ls_business_data-xref_1 = ls_datfisc-xref1.

              " Navigate to the resource and create a request for the create operation
              lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_DATFISC' )->create_request_for_create( ).

              " Set the business data for the created entity
              lo_request->set_business_data( ls_business_data ).

              " Execute the request
              lo_response = lo_request->execute( ).

            ENDLOOP.

            " Get the after image
*lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

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


  METHOD zprodfam_t.

    CASE i_operacion.
      WHEN 'READ'.


        DATA:
          lt_business_data TYPE TABLE OF zscm_ytsd_prodfam_t=>tys_z_i_ytsd_prodfam_ttype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

*          DATA: ls_prodfam_t TYPE yessd_prodfam_t.

*        DATA:
*         lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
*         lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
*         lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
*         lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
*         lt_range_DELETE_MC TYPE RANGE OF <element_name>,
*         lt_range_UPDATE_MC TYPE RANGE OF <element_name>.



        TRY.
*          " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_YTSD_PRODFAM_T'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_YTSD_PRODFAM_T' ).

            ASSERT lo_http_client IS BOUND.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_YTSD_PRODFAM_T' )->create_request_for_read( ).

            " Create the filter tree
*            lo_filter_factory = lo_request->create_filter_factory( ).
*
*            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'DELETE_MC'
*                                                                    it_range             = lt_range_DELETE_MC ).
*            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'UPDATE_MC'
*                                                                    it_range             = lt_range_UPDATE_MC ).

*            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
*            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            et_prod_subfamilies = lt_business_data.

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


  METHOD zproduct_catalog.

    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_mara_makt=>tys_z_i_mara_makttype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst,
          ls_product       TYPE ystmm_products_e.

*DATA:
* lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
* lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
* lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
* lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
* lt_range_MATNR TYPE RANGE OF <element_name>,
* lt_range_MATKL TYPE RANGE OF <element_name>.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_MARA_MAKT'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_MARA_MAKT' ).

            ASSERT lo_http_client IS BOUND.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_MARA_MAKT' )->create_request_for_read( ).

            " Create the filter tree
*lo_filter_factory = lo_request->create_filter_factory( ).
*
*lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'MATNR'
*                                                        it_range             = lt_range_MATNR ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'MATKL'
*                                                        it_range             = lt_range_MATKL ).

*lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
*lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              ls_product-matnr        = ls_business_data-matnr.
              ls_product-artic_grp    = ls_business_data-matkl.
              ls_product-subfamily    = ls_business_data-matkl+04(01).
              ls_product-sector       = ls_business_data-spart.
              IF ls_business_data-spras = 'S'.
                ls_product-maktx_s      = ls_business_data-maktx.
              ELSEIF ls_business_data-spras = 'E'.
                ls_product-maktx_e      = ls_business_data-maktx.
              ENDIF.
              APPEND ls_product TO et_product.
              CLEAR  ls_product.
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


  METHOD customers_comp_kna1.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_sales_document_info=>tys_z_i_kna_1_type,
          ls_business_data TYPE zscm_sales_document_info=>tys_z_i_kna_1_type,
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
                                                  proxy_model_id      = 'ZSCM_SALES_DOCUMENT_INFO'
                                                  proxy_model_version = '0001' )
             io_http_client             = lo_http_client
             iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALES_DOCUMENT_INFO' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      kunnr  = lv_customerno ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_KNA_1' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            MOVE-CORRESPONDING ls_business_data TO ls_customeraddress.
            ls_customeraddress-name   = ls_business_data-name_1.
            ls_customeraddress-name_2 = ls_business_data-name_2.
            ls_customeraddress-name_3 = ls_business_data-name_3.
            ls_customeraddress-name_4 = ls_business_data-name_4.

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


  METHOD company_code_list_get.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm__companycode_list_get=>tys_z_i_t_001_type,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst,
          ls_companys      LIKE LINE OF et_companys.

*DATA:
* lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
* lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
* lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
* lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
* lt_range_BUKRS TYPE RANGE OF <element_name>,
* lt_range_BUTXT TYPE RANGE OF <element_name>.



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


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_001' )->create_request_for_read( ).

            " Create the filter tree
*lo_filter_factory = lo_request->create_filter_factory( ).
*
*lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
*                                                        it_range             = lt_range_BUKRS ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BUTXT'
*                                                        it_range             = lt_range_BUTXT ).

*lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
*lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              ls_companys-comp_code = ls_business_data-bukrs.
              ls_companys-comp_name = ls_business_data-butxt.
              APPEND ls_companys TO et_companys.
              CLEAR ls_companys.
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


  METHOD sales_info_vbak_knvv.

    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_sales_document_info=>tys_z_i_vbak_knvvtype,
          ls_business_data TYPE zscm_sales_document_info=>tys_z_i_vbak_knvvtype,
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
                                                     proxy_model_id      = 'ZSCM_SALES_DOCUMENT_INFO'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALES_DOCUMENT_INFO' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      vbeln  = i_vbeln ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VBAK_KNVV' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            MOVE-CORRESPONDING ls_business_data TO es_document.

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


  METHOD customers_comp_get.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_yfmsd_customers_comp_get=>tys_z_i_yfmsd_customers_comp_2,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_bukrs      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          ls_customer_list    LIKE LINE OF et_customers_list.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_YFMSD_CUSTOMERS_COMP_GET'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_YFMSD_CUSTOMERS_COMP' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.



            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_YFMSD_CUSTOMERS_COMP_G' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).
*
*lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'KUNNR'
*                                                        it_range             = lt_range_KUNNR ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_bukrs ).

            lo_filter_node_root = lo_filter_node_2."->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

*            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_customer_list.
              ls_customer_list-customer = ls_business_data-kunnr.
              ls_customer_list-comp_code = ls_business_data-bukrs.
              ls_customer_list-function = ls_business_data-parvw.
              IF ls_business_data-spras = 'S'.
                ls_customer_list-function_text_es = ls_business_data-vtext.
              ELSEIF ls_business_data-spras = 'E'.
                ls_customer_list-function_text_en = ls_business_data-vtext.
              ENDIF.
              ls_customer_list-kunn2 = ls_business_data-kunn_2.
              ls_customer_list-kunn2_name1 = ls_business_data-name_1.
              ls_customer_list-kunn2_name2 = ls_business_data-name_2.
              APPEND ls_customer_list TO et_customers_list.
              CLEAR ls_customer_list.
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


  METHOD incoterms_tinct.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_tinct=>tys_z_i_tincttype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_spras      TYPE RANGE OF spras,
          ls_range_spras      LIKE LINE OF lt_range_spras,
          ls_inco             LIKE LINE OF inco.


        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
           EXPORTING
              is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                  proxy_model_id      = 'ZSCM_TINCT'
                                                  proxy_model_version = '0001' )
             io_http_client             = lo_http_client
             iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_TINCT' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_spras.
            ls_range_spras-sign = 'I'.
            ls_range_spras-option = 'EQ'.
            ls_range_spras-low = i_langu.
            APPEND ls_range_spras TO lt_range_spras.
            CLEAR ls_range_spras.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_TINCT' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).
*
            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'SPRAS'
                                                                    it_range             = lt_range_SPRAS ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'SPART'
*                                                        it_range             = lt_range_SPART ).

            lo_filter_node_root = lo_filter_node_1."->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

*            lo_request->set_top( 150 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_inco.
              ls_inco-inco1 = ls_business_data-inco_1.
              APPEND ls_inco TO inco.
              CLEAR ls_inco.
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


  METHOD sales_info_kna1.

    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_sales_document_info=>tys_z_i_kna_1_type,
          ls_business_data TYPE zscm_sales_document_info=>tys_z_i_kna_1_type,
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
                                                     proxy_model_id      = 'ZSCM_SALES_DOCUMENT_INFO'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALES_DOCUMENT_INFO' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      kunnr  = i_kunnr ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_KNA_1' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            MOVE-CORRESPONDING ls_business_data TO es_customer.

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


  METHOD sales_info_likp.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_sales_document_info=>tys_z_i_likptype,
          ls_business_data TYPE zscm_sales_document_info=>tys_z_i_likptype,
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
                                                     proxy_model_id      = 'ZSCM_SALES_DOCUMENT_INFO'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALES_DOCUMENT_INFO' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      vbeln  = i_vbeln ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LIKP' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            MOVE-CORRESPONDING ls_business_data TO es_document.

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


  METHOD sales_info_lips.
    CASE i_operacion.
      WHEN 'READ'.


        DATA:
          lt_business_data TYPE TABLE OF zscm_sales_document_info=>tys_z_i_lipstype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_VBELN      TYPE RANGE OF vbeln,
          ls_range_vbeln      LIKE LINE OF lt_range_vbeln,
          lt_range_POSNR      TYPE RANGE OF posnr,
          ls_lips             LIKE LINE OF et_lips.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALES_DOCUMENT_INFO'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALES_DOCUMENT_INFO' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_vbeln.
            ls_range_vbeln-sign = 'I'.
            ls_range_vbeln-option = 'EQ'.
            ls_range_vbeln-low = i_vbeln.
            APPEND ls_range_vbeln TO lt_range_vbeln.
            CLEAR ls_range_vbeln.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LIPS' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELN'
                                                                    it_range             = lt_range_VBELN ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'POSNR'
*                                                        it_range             = lt_range_POSNR ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_lips.
              APPEND ls_lips TO et_lips.
              CLEAR ls_lips.
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


  METHOD sales_info_vbap.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_sales_document_info=>tys_z_i_vbaptype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_VBELN      TYPE RANGE OF vbeln,
          ls_range_vbeln      LIKE LINE OF lt_range_vbeln,
          lt_range_POSNR      TYPE RANGE OF posnr,
          ls_vbap             LIKE LINE OF et_vbap.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALES_DOCUMENT_INFO'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALES_DOCUMENT_INFO' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_vbeln.
            ls_range_vbeln-sign = 'I'.
            ls_range_vbeln-option = 'EQ'.
            ls_range_vbeln-low = i_vbeln.
            APPEND ls_range_vbeln TO lt_range_vbeln.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VBAP' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELN'
                                                                    it_range             = lt_range_VBELN ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'POSNR'
*                                                        it_range             = lt_range_POSNR ).

            lo_filter_node_root = lo_filter_node_1.
*lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_vbap.
              APPEND ls_vbap TO et_vbap.
              CLEAR ls_vbap.
            ENDLOOP..

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


  METHOD sales_info_vbrk.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_sales_document_info=>tys_z_i_vbrktype,
          ls_business_data TYPE zscm_sales_document_info=>tys_z_i_vbrktype,
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
                                                     proxy_model_id      = 'ZSCM_SALES_DOCUMENT_INFO'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALES_DOCUMENT_INFO' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      vbeln  = i_vbeln ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VBRK' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            MOVE-CORRESPONDING ls_business_data TO es_document.

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


  METHOD sales_info_vbrp.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_sales_document_info=>tys_z_i_vbrptype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_VBELN      TYPE RANGE OF vbeln,
          ls_range_vbeln      LIKE LINE OF lt_range_vbeln,
          lt_range_POSNR      TYPE RANGE OF posnr,
          ls_vbrp             LIKE LINE OF et_vbrp.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALES_DOCUMENT_INFO'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALES_DOCUMENT_INFO' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_vbeln.
            ls_range_vbeln-sign = 'I'.
            ls_range_vbeln-option = 'EQ'.
            ls_range_vbeln-low = i_vbeln.
            APPEND ls_range_vbeln TO lt_range_vbeln.
            CLEAR ls_range_vbeln.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VBRP' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELN'
                                                                    it_range             = lt_range_VBELN ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'POSNR'
*                                                        it_range             = lt_range_POSNR ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_vbrp.
              APPEND ls_vbrp TO et_vbrp.
              CLEAR ls_vbrp.
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


  METHOD sales_info_vttk_lfa1.

    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_sales_document_info=>tys_z_i_vttk_lfa_1_type,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst,
          ls_shipment      TYPE ztransp_data.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_TKNUM      TYPE RANGE OF ztknum,
          ls_range_tknum      LIKE LINE OF lt_range_tknum,
          lt_range_TDLNR      TYPE RANGE OF ztdlnr,
          ls_range_tdlrn      LIKE LINE OF lt_range_tdlnr.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALES_DOCUMENT_INFO'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALES_DOCUMENT_INFO' ).

            ASSERT lo_http_client IS BOUND.

            LOOP AT it_docflow INTO DATA(ls_docflow).
              ls_range_tknum-sign = 'I'.
              ls_range_tknum-option = 'EQ'.
              ls_range_tknum-low = ls_docflow-vbeln.
              APPEND ls_range_tknum TO lt_range_tknum.
              CLEAR ls_range_tknum.
            ENDLOOP.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTK_LFA_1' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'TKNUM'
                                                                    it_range             = lt_range_TKNUM ).
*            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'TDLNR'
*                                                                    it_range             = lt_range_TDLNR ).
            lo_filter_node_root = lo_filter_node_1.
*            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              ls_shipment-tknum = ls_business_data-tknum.
              ls_shipment-tdlnr = ls_business_data-tdlnr.
              ls_shipment-name1 = ls_business_data-name_1.
              APPEND ls_shipment TO et_shipment.
              CLEAR ls_shipment.
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


  METHOD tspat.

    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_tspat=>tys_z_i_tspattype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          ls_sectors          LIKE LINE OF et_sectors,
          lt_range_SPRAS      TYPE RANGE OF spras,
          ls_range_spras      LIKE LINE OF lt_range_spras.


        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_TSPAT'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_TSPAT' ).

            ASSERT lo_http_client IS BOUND.

*            CLEAR ls_range_spras.
*            ls_range_spras = 'E'.
*            APPEND ls_range_spras TO lt_range_spras.
*            CLEAR ls_range_spras.
*            ls_range_spras = 'S'.
*            APPEND ls_range_spras TO lt_range_spras.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_TSPAT' )->create_request_for_read( ).

            " Create the filter tree
*            lo_filter_factory = lo_request->create_filter_factory( ).
*
*            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'SPRAS'
*                                                                    it_range             = lt_range_SPRAS ).
**lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'ID'
**                                                        it_range             = lt_range_ID ).
*
*            lo_filter_node_root = lo_filter_node_1."->and( lo_filter_node_2 ).
*            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 150 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_sectors.
              APPEND ls_sectors TO et_sectors.
              CLEAR ls_sectors.
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
ENDCLASS.
