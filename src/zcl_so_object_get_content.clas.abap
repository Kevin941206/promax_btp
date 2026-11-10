CLASS zcl_so_object_get_content DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-DATA: lt_objhead TYPE STANDARD TABLE OF zst_soli,
                lt_objcont TYPE STANDARD TABLE OF zst_soli,
                lt_objpara TYPE STANDARD TABLE OF zst_selc,
                lt_objparb TYPE STANDARD TABLE OF zst_soop1.

    CLASS-METHODS: get_content IMPORTING i_soodk    TYPE zst_soodk
                               EXPORTING et_objhead LIKE lt_objhead
                                         et_objcont LIKE lt_objcont
                                         et_objpara LIKE lt_objpara
                                         et_objparb LIKE lt_objparb.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SO_OBJECT_GET_CONTENT IMPLEMENTATION.


  METHOD get_content.

    DATA:
      lt_business_data TYPE TABLE OF zscm_so_object_get_content=>ty_deep,
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
      lt_range_objtp      TYPE RANGE OF zst_soodk-objtp,
      ls_range_objtp      LIKE LINE OF lt_range_objtp,
      lt_range_objno      TYPE RANGE OF zst_soodk-objno,
      ls_range_objno      LIKE LINE OF lt_range_objno,
      lt_range_objyr      TYPE RANGE OF zst_soodk-objyr,
      ls_range_objyr      LIKE LINE OF lt_range_objyr,
      ls_objhead          LIKE LINE OF et_objhead,
      ls_objcont          LIKE LINE OF et_objcont,
      ls_objpara          LIKE LINE OF et_objpara,
      ls_objparb          LIKE LINE OF et_objparb.

    TRY.
        " Create http client
        DATA lv_dest TYPE string.
        SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSCM_SO_OBJECT_GET_CONTENT'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_SO_OBJECT_GET_CONTENT_SRV' ).

        ASSERT lo_http_client IS BOUND.

        ls_range_objtp-sign = 'I'.
        ls_range_objtp-option = 'EQ'.
        ls_range_objtp-low = i_soodk-objtp.
        APPEND ls_range_objtp TO lt_range_objtp.

        ls_range_objno-sign = 'I'.
        ls_range_objno-option = 'EQ'.
        ls_range_objno-low = i_soodk-objno.
        APPEND ls_range_objno TO lt_range_objno.

        ls_range_objyr-sign = 'I'.
        ls_range_objyr-option = 'EQ'.
        ls_range_objyr-low = i_soodk-objyr.
        APPEND ls_range_objyr TO lt_range_objyr.

        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_read( ).

        DATA(lo_expand) = lo_request->create_expand_node(  ).
        lo_expand->add_expand( 'HEADERTOOBJHEAD' ).
        lo_expand->add_expand( 'HEADERTOOBJCONT' ).
        lo_expand->add_expand( 'HEADERTOOBJPARA' ).
        lo_expand->add_expand( 'HEADERTOOBJPARB' ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'OBJTP'
                                                                it_range             = lt_range_objtp ).
        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'OBJNO'
                                                                it_range             = lt_range_objno ).
        lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'OBJYR'
                                                                it_range             = lt_range_objyr ).

        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
        lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
        IF sy-subrc = 0.
          LOOP AT ls_business_data-headertoobjhead INTO DATA(ls_headertoobjhead).
            MOVE-CORRESPONDING ls_headertoobjhead TO ls_objhead.
            APPEND ls_objhead TO et_objhead.
            CLEAR ls_objhead.
          ENDLOOP.
          LOOP AT ls_business_data-headertoobjcont INTO DATA(ls_headertoobjcont).
            MOVE-CORRESPONDING ls_headertoobjcont TO ls_objcont.
            APPEND ls_objcont TO et_objcont.
            CLEAR ls_objcont.
          ENDLOOP.
          LOOP AT ls_business_data-headertoobjpara INTO DATA(ls_headertoobjpara).
            MOVE-CORRESPONDING ls_headertoobjpara TO ls_objpara.
            APPEND ls_objpara TO et_objpara.
            CLEAR ls_objpara.
          ENDLOOP.
          LOOP AT ls_business_data-headertoobjparb INTO DATA(ls_headertoobjparb).
            MOVE-CORRESPONDING ls_headertoobjparb TO ls_objparb.
            APPEND ls_objparb TO et_objparb.
            CLEAR ls_objparb.
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
ENDCLASS.
