CLASS zcl_acc_document_post DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS: call_je_post IMPORTING documentheader    TYPE zst_bapiache09
                                          customercpd       TYPE zst_bapiacpa09 OPTIONAL
                                          contractheader    TYPE zst_bapiaccahd OPTIONAL
                                          accountgl         TYPE ztt_bapiacgl09 OPTIONAL
                                          accountreceivable TYPE ztt_bapiacar09 OPTIONAL
                                          accountpayable    TYPE ztt_bapiacap09 OPTIONAL
                                          accounttax        TYPE ztt_bapiactx09 OPTIONAL
                                          currencyamount    TYPE ztt_bapiaccr09
                                          criteria          TYPE ztt_bapiackec9 OPTIONAL
                                          valuefield        TYPE ztt_bapiackev9 OPTIONAL
                                          extension1        TYPE ztt_bapiacextc OPTIONAL
                                          paymentcard       TYPE ztt_bapiacpc09 OPTIONAL
                                          contractitem      TYPE ztt_bapiaccait OPTIONAL
                                          extension2        TYPE bapiparextab OPTIONAL
                                          realestate        TYPE ztt_bapiacre09 OPTIONAL
                                          accountwt         TYPE ztt_bapiacwt09 OPTIONAL
                                EXPORTING obj_type          TYPE zst_bapiache09-obj_type
                                          obj_key           TYPE zst_bapiache09-obj_key
                                          obj_sys           TYPE zst_bapiache09-obj_sys
                                          return            TYPE ztt_bapiret2.

    CLASS-METHODS bkpf IMPORTING i_operacion TYPE text10
                                 i_bukrs     TYPE bukrs
                                 i_gjahr     TYPE gjahr
                                 i_xblnr     TYPE xblnr
                                 i_blart     TYPE blart
                       EXPORTING es_bkpf     TYPE zes_bkpf.

    CLASS-METHODS bseg IMPORTING i_operacion TYPE text10
                                 i_bukrs     TYPE bukrs
                                 i_gjahr     TYPE gjahr
                                 i_belnr     TYPE belnr_d
                       EXPORTING es_bseg     TYPE zst_bseg.

    CLASS-METHODS tvarvc IMPORTING i_operacion TYPE text10
                                   i_name      TYPE char30
                         EXPORTING et_tvarvc   TYPE ztt_tvarvc.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ACC_DOCUMENT_POST IMPLEMENTATION.


  METHOD call_je_post.

    DATA:
      ls_business_data      TYPE zscm_zfi_acc_je_post=>tys_jepost,
      ls_business_data_resp TYPE zscm_zfi_acc_je_post=>tys_jepost,
      lo_http_client        TYPE REF TO if_web_http_client,
      lo_client_proxy       TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request            TYPE REF TO /iwbep/if_cp_request_create,
      lo_response           TYPE REF TO /iwbep/if_cp_response_create.
    DATA:
      lt_selected_properties   TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
      lo_data_desc_node_root   TYPE REF TO /iwbep/if_cp_data_desc_node,
      lo_data_desc_node_child  TYPE REF TO /iwbep/if_cp_data_desc_node,
      lt_property_path_root    TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
      lt_property_path_cust    TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
      lt_property_path_addr    TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
      lt_property_path_sarea   TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
      lt_property_path_company TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path.

    DATA: lt_jeheadernav         TYPE STANDARD TABLE OF zscm_zfi_acc_je_post=>tys_documentheader,
          lt_JECustomerCPDNav    TYPE TABLE OF zscm_zfi_acc_je_post=>tys_customercpd,
          lt_JEContractHeaderNav TYPE TABLE OF zscm_zfi_acc_je_post=>tys_contractheader,
          lt_JEAccountAPNAV      TYPE TABLE OF zscm_zfi_acc_je_post=>tys_accountpayable,
          lt_JEAccountARNav      TYPE TABLE OF zscm_zfi_acc_je_post=>tys_accountreceivable,
          lt_JEAccountGLNav      TYPE TABLE OF zscm_zfi_acc_je_post=>tys_accountgl,
          lt_JEAccountTaxNav     TYPE TABLE OF zscm_zfi_acc_je_post=>tys_accounttax,
          lt_JEAccountWTNav      TYPE TABLE OF zscm_zfi_acc_je_post=>tys_accountwt,
          lt_JEContractItemNav   TYPE TABLE OF zscm_zfi_acc_je_post=>tys_contractitem,
          lt_JECriteriaNav       TYPE TABLE OF zscm_zfi_acc_je_post=>tys_criteria,
          lt_JECurrencyAmountNav TYPE TABLE OF zscm_zfi_acc_je_post=>tys_currencyamount,
          lt_JEExtension1Nav     TYPE TABLE OF zscm_zfi_acc_je_post=>tys_extension_1,
          lt_JEExtension2Nav     TYPE TABLE OF zscm_zfi_acc_je_post=>tys_extension_2,
          lt_JEPaymentCardNav    TYPE TABLE OF zscm_zfi_acc_je_post=>tys_paymentcard,
          lt_JERealEstateNav     TYPE TABLE OF zscm_zfi_acc_je_post=>tys_realestate,
          lt_JEReturnNav         TYPE TABLE OF zscm_zfi_acc_je_post=>tys_return,
          lt_JEValueFieldNav     TYPE TABLE OF zscm_zfi_acc_je_post=>tys_valuefield,
          ls_return2             LIKE LINE OF return.


    TRY.
        " Create http client
        DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSCM_ZFI_ACC_JE_POST'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/SAP/ZFI_ACC_JE_POST_SRV' ).

        ASSERT lo_http_client IS BOUND.

        APPEND INITIAL LINE TO lt_jeheadernav ASSIGNING FIELD-SYMBOL(<fs_jeheadernav>).
        MOVE-CORRESPONDING documentheader TO <fs_jeheadernav>.

        IF customercpd IS NOT INITIAL.
          APPEND INITIAL LINE TO lt_jecustomercpdnav ASSIGNING FIELD-SYMBOL(<fs_jecustomercpdnav>).
          MOVE-CORRESPONDING customercpd TO <fs_jecustomercpdnav>.
        ENDIF.

        IF contractheader IS NOT INITIAL.
          APPEND INITIAL LINE TO lt_jecontractheadernav ASSIGNING FIELD-SYMBOL(<fs_jecontractheadernav>).
          MOVE-CORRESPONDING contractheader TO <fs_jecontractheadernav>.
        ENDIF.

        LOOP AT accountgl INTO DATA(ls_accountgl).
          APPEND INITIAL LINE TO lt_JEAccountGLNav ASSIGNING FIELD-SYMBOL(<fs_JEAccountGLNav>).
          MOVE-CORRESPONDING ls_accountgl TO <fs_JEAccountGLNav>.
        ENDLOOP.

        LOOP AT accountreceivable INTO DATA(ls_accountreceivable).
          APPEND INITIAL LINE TO lt_JEAccountARNav ASSIGNING FIELD-SYMBOL(<fs_JEAccountARNav>).
          MOVE-CORRESPONDING ls_accountreceivable TO <fs_JEAccountARNav>.
        ENDLOOP.

        LOOP AT accountpayable INTO DATA(ls_accountpayable).
          APPEND INITIAL LINE TO lt_JEAccountAPNAV ASSIGNING FIELD-SYMBOL(<fs_JEAccountAPNAV>).
          MOVE-CORRESPONDING ls_accountpayable TO <fs_JEAccountAPNAV>.
        ENDLOOP.

        LOOP AT accounttax INTO DATA(ls_accounttax).
          APPEND INITIAL LINE TO lt_JEAccountTaxNav ASSIGNING FIELD-SYMBOL(<fs_JEAccountTaxNav>).
          MOVE-CORRESPONDING ls_accounttax TO <fs_JEAccountTaxNav>.
        ENDLOOP.

        LOOP AT currencyamount INTO DATA(ls_currencyamount).
          APPEND INITIAL LINE TO lt_JECurrencyAmountNav ASSIGNING FIELD-SYMBOL(<fs_JECurrencyAmountNav>).
          MOVE-CORRESPONDING ls_currencyamount TO <fs_JECurrencyAmountNav>.
        ENDLOOP.

        LOOP AT criteria INTO DATA(ls_criteria).
          APPEND INITIAL LINE TO lt_JECriteriaNav ASSIGNING FIELD-SYMBOL(<fs_JECriteriaNav>).
          MOVE-CORRESPONDING ls_criteria TO <fs_JECriteriaNav>.
        ENDLOOP.

        LOOP AT valuefield INTO DATA(ls_valuefield).
          APPEND INITIAL LINE TO lt_JEValueFieldNav ASSIGNING FIELD-SYMBOL(<fs_JEValueFieldNav>).
          MOVE-CORRESPONDING ls_valuefield TO <fs_JEValueFieldNav>.
        ENDLOOP.

        LOOP AT extension1 INTO DATA(ls_extension1).
          APPEND INITIAL LINE TO lt_JEExtension1Nav ASSIGNING FIELD-SYMBOL(<fs_JEExtension1Nav>).
          MOVE-CORRESPONDING ls_extension1 TO <fs_JEExtension1Nav>.
        ENDLOOP.

        LOOP AT extension2 INTO DATA(ls_extension2).
          APPEND INITIAL LINE TO lt_JEExtension2Nav ASSIGNING FIELD-SYMBOL(<fs_JEExtension2Nav>).
          MOVE-CORRESPONDING ls_extension2 TO <fs_JEExtension2Nav>.
        ENDLOOP.

        LOOP AT paymentcard INTO DATA(ls_paymentcard).
          APPEND INITIAL LINE TO lt_JEPaymentCardNav ASSIGNING FIELD-SYMBOL(<fs_JEPaymentCardNav>).
          MOVE-CORRESPONDING ls_paymentcard TO <fs_JEPaymentCardNav>.
        ENDLOOP.

        LOOP AT contractitem INTO DATA(ls_contractitem).
          APPEND INITIAL LINE TO lt_JEContractItemNav ASSIGNING FIELD-SYMBOL(<fs_JEContractItemNav>).
          MOVE-CORRESPONDING ls_contractitem TO <fs_JEContractItemNav>.
        ENDLOOP.

        LOOP AT realestate INTO DATA(ls_realestate).
          APPEND INITIAL LINE TO lt_JERealEstateNav ASSIGNING FIELD-SYMBOL(<fs_JERealEstateNav>).
          MOVE-CORRESPONDING ls_realestate TO <fs_JERealEstateNav>.
        ENDLOOP.

        LOOP AT accountwt INTO DATA(ls_accountwt).
          APPEND INITIAL LINE TO lt_JEAccountWTNav ASSIGNING FIELD-SYMBOL(<fs_JEAccountWTNav>).
          MOVE-CORRESPONDING ls_accountwt TO <fs_JEAccountWTNav>.
        ENDLOOP.

* Prepare business data
        ls_business_data = VALUE #(
                  date_time  = '001'
                  jeheadernav = lt_jeheadernav
                  jecustomercpdnav = lt_jecustomercpdnav
                  jecontractheadernav = lt_jecontractheadernav
                  jeaccountapnav = lt_jeaccountapnav
                  jeaccountarnav = lt_jeaccountarnav
                  jeaccountglnav = lt_jeaccountglnav
                  jeaccounttaxnav = lt_jeaccounttaxnav
                  jecurrencyamountnav = lt_jecurrencyamountnav
                  jecriterianav = lt_jecriterianav
                  jevaluefieldnav = lt_jevaluefieldnav
                  jeextension1nav = lt_jeextension1nav
                  jeextension2nav = lt_jeextension2nav
                  jepaymentcardnav = lt_jepaymentcardnav
                  jecontractitemnav = lt_jecontractitemnav
                  jerealestatenav = lt_jerealestatenav
                  jeaccountwtnav = lt_jeaccountwtnav
                  ).
        lt_property_path_root  = VALUE #(
                                          ( |DATE_TIME| )
                                          ( |OBJ_TYPE| )
                                          ( |OBJ_KEY| )
                                          ( |OBJ_SYS| )
*                                       ( |JECONTRACTHEADERNAV| )
*                                       ( |JECUSTOMERCPDNAV| )
*                                       ( |JEHEADERNAV| )
    ).

        " Navigate to the resource and create a request for the create operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'JEPOST_SET' )->create_request_for_create( ).

        lo_data_desc_node_root = lo_request->create_data_descripton_node( )->set_properties( lt_property_path_root ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'JEACCOUNTAPNAV' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'JEACCOUNTARNAV' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'JEACCOUNTGLNAV' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'JEACCOUNTTAXNAV' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'JEACCOUNTWTNAV' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'JECONTRACTHEADERNAV' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'JECONTRACTITEMNAV' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'JECRITERIANAV' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'JECURRENCYAMOUNTNAV' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'JECUSTOMERCPDNAV' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'JEEXTENSION1NAV' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'JEEXTENSION2NAV' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'JEHEADERNAV' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'JEPAYMENTCARDNAV' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'JEREALESTATENAV' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'JEVALUEFIELDNAV' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'JERETURNNAV' ).

        " Set the business data for the created entity
        lo_request->set_deep_business_data(
              EXPORTING
                is_business_data    = ls_business_data
                io_data_description = lo_data_desc_node_root ).
*lo_request->set_business_data( ls_business_data ).

        " Execute the request
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING es_business_data = ls_business_data_resp ).

        obj_key = ls_business_data_resp-obj_key.
        obj_sys = ls_business_data_resp-obj_sys.
        obj_type = ls_business_data_resp-obj_type.

        LOOP AT ls_business_data_resp-jereturnnav INTO DATA(ls_return).
          MOVE-CORRESPONDING ls_return TO ls_return2.
          APPEND ls_return2 TO return.
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


  METHOD bkpf.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_list=>tys_z_i_bkpftype,
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
          lt_range_bukrs      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_gjahr      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
          lt_range_xblnr      TYPE RANGE OF xblnr,
          ls_range_xblnr      LIKE LINE OF lt_range_xblnr,
          lt_range_blart      TYPE RANGE OF blart,
          ls_range_blart      LIKE LINE OF lt_range_blart.


        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALESORDER_LIST'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALESORDER_LIST' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = i_gjahr.
            APPEND ls_range_gjahr TO lt_range_gjahr.
            CLEAR ls_range_gjahr.

            ls_range_xblnr-sign = 'I'.
            ls_range_xblnr-option = 'EQ'.
            ls_range_xblnr-low = i_xblnr.
            APPEND ls_range_xblnr TO lt_range_xblnr.
            CLEAR ls_range_xblnr.

            ls_range_blart-sign = 'I'.
            ls_range_blart-option = 'EQ'.
            ls_range_blart-low = i_blart.
            APPEND ls_range_blart TO lt_range_blart.
            CLEAR ls_range_blart.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BKPF' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_bukrs ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'XBLNR'
                                                                    it_range             = lt_range_xblnr ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BLART'
                                                                    it_range             = lt_range_blart ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            MOVE-CORRESPONDING ls_business_data TO es_bkpf.

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


  METHOD bseg.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_crp_journal_list=>tys_z_i_bsegtype,
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
          lt_range_BUKRS      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_BELNR      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          lt_range_GJAHR      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
          lt_range_koart      TYPE RANGE OF koart,
          ls_range_koart      LIKE LINE OF lt_range_koart.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_CRP_JOURNAL_LIST'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_CRP_JOURNAL' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = i_belnr.
            APPEND ls_range_belnr TO lt_range_belnr.
            CLEAR ls_range_belnr.

            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = i_gjahr.
            APPEND ls_range_gjahr TO lt_range_gjahr.
            CLEAR ls_range_gjahr.

            ls_range_koart-sign = 'I'.
            ls_range_koart-option = 'EQ'.
            ls_range_koart-low = 'K'.
            APPEND ls_range_koart TO lt_range_koart.
            CLEAR ls_range_koart.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSEG' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_bukrs ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_belnr ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'KOART'
                                                                    it_range             = lt_range_koart ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            MOVE-CORRESPONDING ls_business_data TO es_bseg.

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


  METHOD tvarvc.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_details=>tys_z_i_tvarvctype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_name       TYPE RANGE OF char30,
          ls_range_name       LIKE LINE OF lt_range_name,
          ls_tvarvc           LIKE LINE OF et_tvarvc.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALESORDER_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALESORDER_DETAILS' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_name-sign = 'I'.
            ls_range_name-option = 'EQ'.
            ls_range_name-low = i_name.
            APPEND ls_range_name TO lt_range_name.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_TVARVC' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'NAME'
                                                                    it_range             = lt_range_NAME ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_tvarvc.
              APPEND ls_tvarvc TO et_tvarvc.
              CLEAR ls_tvarvc.
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
