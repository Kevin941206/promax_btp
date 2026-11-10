CLASS zcl_gn_delivery_create DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS gn_delivery_create IMPORTING i_vbsk     TYPE zst_vbsk
                                               it_komdlgn TYPE ztt_komdlgn
                                     EXPORTING et_vbfs    TYPE ztt_vbfs
                                               et_vbls    TYPE ztt_vbls.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GN_DELIVERY_CREATE IMPLEMENTATION.


  METHOD gn_delivery_create.

    DATA:
      ls_business_data        TYPE zscm_gn_delivery_create=>ty_deep,
      ls_business_data_resp   TYPE zscm_gn_delivery_create=>ty_deep,
      lo_http_client          TYPE REF TO if_web_http_client,
      lo_client_proxy         TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request              TYPE REF TO /iwbep/if_cp_request_create,
      lo_response             TYPE REF TO /iwbep/if_cp_response_create,
      lo_data_desc_node_root  TYPE REF TO /iwbep/if_cp_data_desc_node,
      lo_data_desc_node_child TYPE REF TO /iwbep/if_cp_data_desc_node,
      lt_property_path_root   TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
      lt_headertokomdlgn      LIKE ls_business_data-headertokomdlgn,
      ls_headertokomdlgn      LIKE LINE OF lt_headertokomdlgn,
      ls_vbfs LIKE LINE OF et_vbfs,
      ls_vbls LIKE LINE OF et_vbls.

    TRY.
        " Create http client
        DATA lv_dest TYPE string.
        SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSCM_GN_DELIVERY_CREATE'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_GN_DELIVERY_CREATE_SRV' ).

        ASSERT lo_http_client IS BOUND.

        LOOP AT it_komdlgn INTO DATA(ls_komdlgn).
          MOVE-CORRESPONDING ls_komdlgn TO ls_headertokomdlgn.
          APPEND ls_headertokomdlgn TO lt_headertokomdlgn.
          CLEAR ls_headertokomdlgn.
        ENDLOOP.


* Prepare business data
        ls_business_data = VALUE #(
                  date_time           = 'DateTime'
                  sammg               = i_vbsk-Sammg
                  smart               = i_vbsk-Smart
                  ernam               = i_vbsk-Ernam
                  erdat               = i_vbsk-erdat
                  uzeit               = i_vbsk-uzeit
                  vbnum               = i_vbsk-Vbnum
                  ernum               = i_vbsk-Ernum
                  brgew               = i_vbsk-brgew
                  gewei               = i_vbsk-gewei
                  volum               = i_vbsk-volum
                  voleh               = i_vbsk-Voleh
                  vstel               = i_vbsk-Vstel
                  vtext               = i_vbsk-Vtext
                  maxzt               = i_vbsk-maxzt
                  programm            = i_vbsk-Programm
                  selset              = i_vbsk-Selset
                  batch               = i_vbsk-Batch
                  anzlp               = i_vbsk-anzlp
                  anzgp               = i_vbsk-anzgp
                  anzgi               = i_vbsk-anzgi
                  kwpro               = i_vbsk-Kwpro
                  kaptp               = i_vbsk-Kaptp
                  lgnum               = i_vbsk-Lgnum
                  bedat               = i_vbsk-bedat
                  wrast               = i_vbsk-Wrast
                  collectiverun_uuid  = i_vbsk-collectiverun_uuid
                  headertokomdlgn     = lt_headertokomdlgn ).

        " Navigate to the resource and create a request for the create operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_create( ).

        lt_property_path_root  = VALUE #(
                                          ( |DATE_TIME| )
                                          ( |SAMMG| )
                                          ( |SMART| )
                                          ( |ERNAM| )
                                          ( |ERDAT| )
                                          ( |UZEIT| )
                                          ( |VBNUM| )
                                          ( |ERNUM| )
                                          ( |BRGEW| )
                                          ( |GEWEI| )
                                          ( |VOLUM| )
                                          ( |VOLEH| )
                                          ( |VSTEL| )
                                          ( |VTEXT| )
                                          ( |MAXZT| )
                                          ( |PROGRAMM| )
                                          ( |SELSET| )
                                          ( |BATCH| )
                                          ( |ANZLP| )
                                          ( |ANZGP| )
                                          ( |ANZGI| )
                                          ( |KWPRO| )
                                          ( |KAPTP| )
                                          ( |LGNUM| )
                                          ( |BEDAT| )
                                          ( |WRAST| )
                                          ( |COLLECTIVERUN_UUID| ) ).

        lo_data_desc_node_root = lo_request->create_data_descripton_node( )->set_properties( lt_property_path_root ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOKOMDLGN' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOVBFS' ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOVBLS' ).

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

        LOOP AT ls_business_data_resp-headertovbfs INTO DATA(ls_headertovbfs).
          MOVE-CORRESPONDING ls_headertovbfs TO ls_vbfs.
          APPEND ls_vbfs TO et_vbfs.
          CLEAR ls_vbfs.
        ENDLOOP.
        LOOP AT ls_business_data_resp-headertovbls INTO DATA(ls_headertovbls).
          MOVE-CORRESPONDING ls_headertovbls TO ls_vbls.
          APPEND ls_vbls TO et_vbls.
          CLEAR ls_vbls.
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
