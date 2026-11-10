CLASS zcl_textos DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: read_text IMPORTING i_id     TYPE ztdid
                                       i_object TYPE ztdobject
                                       i_name   TYPE ztdobname
                                       i_spras  TYPE spras
                             EXPORTING e_subrc  TYPE sy-subrc
                                       et_lines TYPE ztt_tline.

    CLASS-METHODS: save_text IMPORTING i_id     TYPE ztdid
                                       i_object TYPE ztdobject
                                       i_name   TYPE ztdobname
                                       i_spras  TYPE spras
                                       i_save   TYPE char1 OPTIONAL
                                       i_owner  TYPE char1 OPTIONAL
                                       it_lines TYPE ztt_tline
                             EXPORTING e_subrc  TYPE sy-subrc.

    CLASS-METHODS: create_text IMPORTING i_id     TYPE ztdid
                                         i_object TYPE ztdobject
                                         i_name   TYPE ztdobname
                                         i_spras  TYPE spras
                                         i_save   TYPE char1 OPTIONAL
                                         it_lines TYPE ztt_tline
                               EXPORTING e_subrc  TYPE sy-subrc.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TEXTOS IMPLEMENTATION.


  METHOD read_text.



    DATA:
      lt_business_data TYPE TABLE OF zscm_read_text=>ty_deep,
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
      lt_range_TDOBJECT   TYPE RANGE OF ztdobject,
      ls_range_tdobject   LIKE LINE OF lt_range_tdobject,
      lt_range_TDNAME     TYPE RANGE OF ztdobname,
      ls_range_tdname     LIKE LINE OF lt_range_tdname,
      lt_range_tdid       TYPE RANGE OF ztdid,
      ls_range_tdid       LIKE LINE OF lt_range_tdid,
      lt_range_tdspras    TYPE RANGE OF spras,
      ls_range_tdspras    LIKE LINE OF lt_range_tdspras,
      ls_lines            LIKE LINE OF et_lines.

    TRY.
        " Create http client
        DATA lv_dest TYPE string.
        SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSCM_READ_TEXT'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_READ_TEXT_SRV' ).

        ASSERT lo_http_client IS BOUND.

        ls_range_tdobject-sign = 'I'.
        ls_range_tdobject-option = 'EQ'.
        ls_range_tdobject-low = i_object.
        APPEND ls_range_tdobject TO lt_range_tdobject.

        ls_range_tdname-sign = 'I'.
        ls_range_tdname-option = 'EQ'.
        ls_range_tdname-low = i_name.
        APPEND ls_range_tdname TO lt_range_tdname.

        ls_range_tdid-sign = 'I'.
        ls_range_tdid-option = 'EQ'.
        ls_range_tdid-low = i_id.
        APPEND ls_range_tdid TO lt_range_tdid.

        ls_range_tdspras-sign = 'I'.
        ls_range_tdspras-option = 'EQ'.
        ls_range_tdspras-low = i_spras.
        APPEND ls_range_tdspras TO lt_range_tdspras.


        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_read( ).

        DATA(lo_expand) = lo_request->create_expand_node(  ).
        lo_expand->add_expand( 'HEADERTOLINESNAV' ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'TDOBJECT'
                                                                it_range             = lt_range_TDOBJECT ).
        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'TDNAME'
                                                                it_range             = lt_range_TDNAME ).
        lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'TDSPRAS'
                                                                it_range             = lt_range_tdspras ).
        lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'TDID'
                                                                it_range             = lt_range_tdid ).

        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
        lo_request->set_filter( lo_filter_node_root ).

*        lo_request->set_top( 50 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
        IF sy-subrc = 0.
          e_subrc = ls_business_data-subrc.
          LOOP AT ls_business_data-headertolinesnav INTO DATA(ls_header).
            MOVE-CORRESPONDING ls_header TO ls_lines.
            APPEND ls_lines TO et_lines.
            CLEAR ls_lines.
          ENDLOOP.
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


  METHOD save_text.


    DATA:
      ls_business_data        TYPE zscm_save_text=>ty_deep,
      ls_business_data_resp   TYPE zscm_save_text=>ty_deep,
      lo_http_client          TYPE REF TO if_web_http_client,
      lo_client_proxy         TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request              TYPE REF TO /iwbep/if_cp_request_create,
      lo_response             TYPE REF TO /iwbep/if_cp_response_create,
      lo_data_desc_node_root  TYPE REF TO /iwbep/if_cp_data_desc_node,
      lo_data_desc_node_child TYPE REF TO /iwbep/if_cp_data_desc_node,
      lt_property_path_root   TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
      lt_headertolinesnav     TYPE TABLE OF zscm_save_text=>tys_lines,
      ls_headertolinesnav     LIKE LINE OF lt_headertolinesnav.

    TRY.
        " Create http client
        DATA lv_dest TYPE string.
        SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSCM_SAVE_TEXT'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_SAVE_TEXT_SRV' ).

        ASSERT lo_http_client IS BOUND.

        LOOP AT it_lines INTO DATA(ls_lines).
          MOVE-CORRESPONDING ls_lines TO ls_headertolinesnav.
          APPEND ls_headertolinesnav TO lt_headertolinesnav.
          CLEAR ls_headertolinesnav.
        ENDLOOP.

* Prepare business data
        ls_business_data = VALUE #(
                  date_time  = '001'
                  tdobject   = i_object
                  tdname     = i_name
                  tdid       = i_id
                  tdspras    = i_spras
                  savemode   = i_save
                  owner      = i_owner
                  headertolinesnav = lt_headertolinesnav ).

        " Navigate to the resource and create a request for the create operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_create( ).

        lt_property_path_root  = VALUE #(
                                                  ( |DATE_TIME| )
                                                  ( |TDOBJECT| )
                                                  ( |TDNAME| )
                                                  ( |TDID| )
                                                  ( |TDSPRAS| )
                                                  ( |SAVEMODE| )
                                                  ( |OWNER| )
                                                  ( |SUBRC| )
            ).

        lo_data_desc_node_root = lo_request->create_data_descripton_node( )->set_properties( lt_property_path_root ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOLINESNAV' ).

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

        e_subrc = ls_business_data_resp-subrc.

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


  METHOD create_text.


    DATA:
      ls_business_data        TYPE zscm_save_text=>ty_deep,
      ls_business_data_resp   TYPE zscm_save_text=>ty_deep,
      lo_http_client          TYPE REF TO if_web_http_client,
      lo_client_proxy         TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request              TYPE REF TO /iwbep/if_cp_request_create,
      lo_response             TYPE REF TO /iwbep/if_cp_response_create,
      lo_data_desc_node_root  TYPE REF TO /iwbep/if_cp_data_desc_node,
      lo_data_desc_node_child TYPE REF TO /iwbep/if_cp_data_desc_node,
      lt_property_path_root   TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path,
      lt_headertolinesnav     TYPE TABLE OF zscm_save_text=>tys_lines,
      ls_headertolinesnav     LIKE LINE OF lt_headertolinesnav.

    TRY.
        " Create http client
        DATA lv_dest TYPE string.
        SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSCM_CREATE_TEXT'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_CREATE_TEXT_SRV' ).

        ASSERT lo_http_client IS BOUND.

        LOOP AT it_lines INTO DATA(ls_lines).
          MOVE-CORRESPONDING ls_lines TO ls_headertolinesnav.
          APPEND ls_headertolinesnav TO lt_headertolinesnav.
          CLEAR ls_headertolinesnav.
        ENDLOOP.

* Prepare business data
        ls_business_data = VALUE #(
                  date_time  = '001'
                  tdobject   = i_object
                  tdname     = i_name
                  tdid       = i_id
                  tdspras    = i_spras
                  savemode   = i_save
                  headertolinesnav = lt_headertolinesnav ).

        " Navigate to the resource and create a request for the create operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_create( ).

        lt_property_path_root  = VALUE #(
                                                  ( |DATE_TIME| )
                                                  ( |TDOBJECT| )
                                                  ( |TDNAME| )
                                                  ( |TDID| )
                                                  ( |TDSPRAS| )
                                                  ( |SAVE| )
                                                  ( |SUBRC| )
            ).

        lo_data_desc_node_root = lo_request->create_data_descripton_node( )->set_properties( lt_property_path_root ).
        lo_data_desc_node_child = lo_data_desc_node_root->add_child( 'HEADERTOLINESNAV' ).

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

        e_subrc = ls_business_data_resp-subrc.

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
