CLASS zcl_ekbe_gr_detail DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: ekbe_get     IMPORTING VALUE(i_operacion) TYPE text10
                                          i_ebeln            TYPE ebeln     OPTIONAL
                                          i_ebelp            TYPE ebelp     OPTIONAL
                                          et_budat           TYPE ztt_budat
                                          i_vgabe            TYPE zchar01
                                EXPORTING VALUE(et_ekbe)     TYPE ztt_ekbe.


    CLASS-METHODS: ekbe_get2     IMPORTING VALUE(i_operacion) TYPE text10
                                           i_ebeln            TYPE ebeln     OPTIONAL
                                           i_ebelp            TYPE ebelp     OPTIONAL
                                           i_vgabe            TYPE zchar01
                                           i_gjahr            TYPE gjahr
                                           i_lfbnr            TYPE zchar10
                                 EXPORTING VALUE(et_ekbe)     TYPE ztt_ekbe.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EKBE_GR_DETAIL IMPLEMENTATION.


  METHOD ekbe_get.

    CASE i_operacion.
      WHEN 'READ'.


        DATA:
          lt_business_data TYPE TABLE OF zscm_ekbe=>tys_z_i_ekbetype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lt_range_ebeln TYPE RANGE OF ebeln,
          ls_range_ebeln LIKE LINE OF lt_range_ebeln.

        DATA:
          lt_range_ebelp TYPE RANGE OF ebelp,
          ls_range_ebelp LIKE LINE OF lt_range_ebelp.

        DATA:
          lt_range_vgabe TYPE RANGE OF zchar01,
          ls_range_vgabe LIKE LINE OF lt_range_vgabe.

*        DATA:
*          lt_range_shkzg   TYPE RANGE OF shkzg,
*          ls_range_shkzg   LIKE LINE OF lt_range_shkzg.

        DATA:
          lt_range_budat TYPE RANGE OF budat,
          ls_range_budat LIKE LINE OF lt_range_budat,
          ls_budat       TYPE zes_budat.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_3    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_4    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_5    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          ls_ekbe             LIKE LINE OF et_ekbe.
*         lt_range_DELETE_MC TYPE RANGE OF <element_name>,
*         lt_range_UPDATE_MC TYPE RANGE OF <element_name>.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_EKBE'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_EKBE' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_vgabe, ls_range_vgabe.
            ls_range_vgabe-sign = 'I'.
            ls_range_vgabe-option = 'EQ'.
            ls_range_vgabe-low = i_vgabe.
            APPEND ls_range_vgabe TO lt_range_vgabe.

            CLEAR: lt_range_budat, ls_range_budat.
*             LOOP AT et_budat INTO ls_budat.
*
*               IF ls_budat-low IS NOT INITIAL.
*
*                 ls_range_budat-sign   = 'I'.
*                 ls_range_budat-option = 'BT'.
*                 ls_range_budat-low    = ls_budat-low.
*                 ls_range_budat-high   = ls_budat-high.
*                 APPEND ls_range_budat TO lt_range_budat.
*
*               ELSEIF ls_budat-low IS NOT INITIAL.
*
*                 ls_range_budat-sign   = 'I'.
*                 ls_range_budat-option = 'EQ'.
*                 ls_range_budat-low    = ls_budat-low.
**                 ls_range_budat-high   = ls_budat-high.
*                 APPEND ls_range_budat TO lt_range_budat.
*               ENDIF.
*             ENDLOOP.
            IF et_budat IS NOT INITIAL.
              MOVE-CORRESPONDING et_budat TO lt_range_budat.
            ENDIF.

            IF i_ebeln IS NOT INITIAL AND i_ebelp IS NOT INITIAL.

              CLEAR: lt_range_ebeln, ls_range_ebeln.
              ls_range_ebeln-sign = 'I'.
              ls_range_ebeln-option = 'EQ'.
              ls_range_ebeln-low = i_ebeln.
              APPEND ls_range_ebeln TO lt_range_ebeln.

              CLEAR: lt_range_ebelp, ls_range_ebelp.
              ls_range_ebelp-sign = 'I'.
              ls_range_ebelp-option = 'EQ'.
              ls_range_ebelp-low = i_ebelp.
              APPEND ls_range_ebelp TO lt_range_ebelp.

            ENDIF.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKBE' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'VGABE'
                                                                    it_range             = lt_range_vgabe ).
            IF lt_range_budat IS NOT INITIAL.
              lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BUDAT'
                                                                      it_range             = lt_range_budat ).
            ENDIF.

            IF i_ebeln IS NOT INITIAL AND i_ebelp IS NOT INITIAL.

              lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_ebeln ).

              lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELP'
                                                                    it_range             = lt_range_ebelp ).
              IF lt_range_budat IS NOT INITIAL.
                lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
              ELSE.
                lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
              ENDIF.

            ELSE.
              IF lt_range_budat IS NOT INITIAL.
                lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
              ELSE.
                lo_filter_node_root = lo_filter_node_1.
              ENDIF.
            ENDIF.


            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_ekbe.
              APPEND ls_ekbe TO et_ekbe.
              CLEAR ls_ekbe.
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


  METHOD ekbe_get2.

    CASE i_operacion.
      WHEN 'READ'.


        DATA:
          lt_business_data TYPE TABLE OF zscm_ekbe=>tys_z_i_ekbetype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lt_range_ebeln TYPE RANGE OF ebeln,
          ls_range_ebeln LIKE LINE OF lt_range_ebeln.

        DATA:
          lt_range_ebelp TYPE RANGE OF ebelp,
          ls_range_ebelp LIKE LINE OF lt_range_ebelp.

        DATA:
          lt_range_vgabe TYPE RANGE OF zchar01,
          ls_range_vgabe LIKE LINE OF lt_range_vgabe.


        DATA:
          lt_range_gjahr TYPE RANGE OF gjahr,
          ls_range_gjahr LIKE LINE OF lt_range_gjahr.

        DATA:
          lt_range_lfbnr TYPE RANGE OF zchar10,
          ls_range_lfbnr LIKE LINE OF lt_range_lfbnr.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_3    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_4    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_5    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          ls_ekbe             LIKE LINE OF et_ekbe.
*         lt_range_DELETE_MC TYPE RANGE OF <element_name>,
*         lt_range_UPDATE_MC TYPE RANGE OF <element_name>.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_EKBE'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_EKBE' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_ebeln, ls_range_ebeln.
            ls_range_ebeln-sign = 'I'.
            ls_range_ebeln-option = 'EQ'.
            ls_range_ebeln-low = i_ebeln.
            APPEND ls_range_ebeln TO lt_range_ebeln.

            CLEAR: lt_range_ebelp, ls_range_ebelp.
            ls_range_ebelp-sign = 'I'.
            ls_range_ebelp-option = 'EQ'.
            ls_range_ebelp-low = i_ebelp.
            APPEND ls_range_ebelp TO lt_range_ebelp.

            CLEAR: lt_range_vgabe, ls_range_vgabe.
            ls_range_vgabe-sign = 'I'.
            ls_range_vgabe-option = 'EQ'.
            ls_range_vgabe-low = i_vgabe.
            APPEND ls_range_vgabe TO lt_range_vgabe.


            CLEAR: lt_range_gjahr, ls_range_gjahr.
            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = i_gjahr.
            APPEND ls_range_gjahr TO lt_range_gjahr.

            CLEAR: lt_range_lfbnr, ls_range_lfbnr.
            ls_range_lfbnr-sign = 'I'.
            ls_range_lfbnr-option = 'EQ'.
            ls_range_lfbnr-low = i_lfbnr.
            APPEND ls_range_lfbnr TO lt_range_lfbnr.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKBE' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).


            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_ebeln ).

            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELP'
                                                                    it_range             = lt_range_ebelp ).

            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'VGABE'
                                                                    it_range             = lt_range_vgabe ).

            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).

            lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'LFBNR '
                                                                    it_range             = lt_range_lfbnr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).


            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_ekbe.
              APPEND ls_ekbe TO et_ekbe.
              CLEAR ls_ekbe.
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
