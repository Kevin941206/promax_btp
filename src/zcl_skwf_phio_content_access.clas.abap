CLASS zcl_skwf_phio_content_access DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-DATA: lt_component TYPE STANDARD TABLE OF zst_sdokcomaci,
                lt_content   TYPE STANDARD TABLE OF zst_sdokcntbin.

    CLASS-METHODS: get_content IMPORTING i_phio       TYPE zskwf_io
                               EXPORTING et_component LIKE lt_component
                                         et_content   LIKE lt_content
                                         e_text64     TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SKWF_PHIO_CONTENT_ACCESS IMPLEMENTATION.


  METHOD get_content.

    DATA:
      lt_business_data TYPE TABLE OF zscm_skwf_phio_content_access=>ty_deep,
      lo_http_client   TYPE REF TO if_web_http_client,
      lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

    DATA:
      lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
      lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_3    TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
      lt_range_objtype    TYPE RANGE OF zskwf_io-objtype,
      ls_range_objtype    LIKE LINE OF lt_range_objtype,
      lt_range_class      TYPE RANGE OF zskwf_io-class,
      ls_range_class      LIKE LINE OF lt_range_class,
      lt_range_objid      TYPE RANGE OF zskwf_io-objid,
      ls_range_objid      LIKE LINE OF lt_range_objid,
      ls_component        LIKE LINE OF et_component,
      ls_content          LIKE LINE OF et_content.


    TRY.
        " Create http client
        DATA lv_dest TYPE string.
        SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSCM_SKWF_PHIO_CONTENT_ACCESS'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_SKWF_PHIO_CONTENT_ACCESS_SRV' ).

        ASSERT lo_http_client IS BOUND.

        ls_range_objtype-sign = 'I'.
        ls_range_objtype-option = 'EQ'.
        ls_range_objtype-low = i_phio-objtype.
        APPEND ls_range_objtype TO lt_range_objtype.

        ls_range_objid-sign = 'I'.
        ls_range_objid-option = 'EQ'.
        ls_range_objid-low = i_phio-objid.
        APPEND ls_range_objid TO lt_range_objid.

        ls_range_class-sign = 'I'.
        ls_range_class-option = 'EQ'.
        ls_range_class-low = i_phio-class.
        APPEND ls_range_class TO lt_range_class.

        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_read( ).

        DATA(lo_expand) = lo_request->create_expand_node(  ).
        lo_expand->add_expand( 'HEADERTOCOMPONENT' ).
        lo_expand->add_expand( 'HEADERTOCONTENT' ).
        lo_expand->add_expand( 'HEADERTOBASE_64' ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'OBJTYPE'
                                                                it_range             = lt_range_objtype ).
        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'OBJID'
                                                                it_range             = lt_range_objid ).
        lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'CLASS'
                                                                it_range             = lt_range_class ).

        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
        lo_request->set_filter( lo_filter_node_root ).

        lo_request->set_top( 5000 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
        IF sy-subrc = 0.
          LOOP AT ls_business_data-headertobase_64 INTO DATA(ls_headertobase_64).
            CONCATENATE e_text64 ls_headertobase_64-text INTO e_text64.
          ENDLOOP.
*          LOOP AT ls_business_data-headertocomponent INTO DATA(ls_headertocomponent).
*            MOVE-CORRESPONDING ls_headertocomponent TO ls_component.
*            APPEND ls_component TO et_component.
*            CLEAR ls_component.
*          ENDLOOP.
*          LOOP AT ls_business_data-headertocontent INTO DATA(ls_headertocontent).
*            MOVE-CORRESPONDING ls_headertocontent TO ls_content.
*            APPEND ls_content TO et_content.
*            CLEAR ls_content.
*          ENDLOOP.
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
ENDCLASS.
