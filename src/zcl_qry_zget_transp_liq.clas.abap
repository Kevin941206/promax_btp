CLASS zcl_qry_zget_transp_liq DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS: vttk          IMPORTING VALUE(i_operacion) TYPE text10
                                           signi              TYPE text20
                                 EXPORTING VALUE(t_vttk)      TYPE ztt_vttk.

    CLASS-METHODS: vttk2          IMPORTING VALUE(i_operacion) TYPE text10
                                            tknum              TYPE char10
                                            tpbez              TYPE text20
                                  EXPORTING VALUE(t_vttk)      TYPE ztt_vttk.

    CLASS-METHODS: vttk3         IMPORTING VALUE(i_operacion) TYPE text10
                                           st_vfkp            TYPE zst_vfkp
                                 EXPORTING VALUE(st_transp)   TYPE zst_zsd_transp.

    CLASS-METHODS: vfkp          IMPORTING VALUE(i_operacion) TYPE text10
                                           st_vttk            TYPE zst_vttk
                                 EXPORTING VALUE(t_vfkp)      TYPE ztt_vfkp.

    CLASS-METHODS: vfkp2         IMPORTING VALUE(i_operacion) TYPE text10
                                           fknum              TYPE char10
                                           lblni              TYPE char10
                                           st_vttk            TYPE zst_vttk
                                 EXPORTING VALUE(t_vfkp)      TYPE ztt_vfkp.

    CLASS-METHODS: vfkp3         IMPORTING VALUE(i_operacion) TYPE text10
                                           fknum              TYPE char10
                                           lblni              TYPE char10
                                           tknum              TYPE char10
                                           st_vttk            TYPE zst_vttk
                                 EXPORTING VALUE(t_vfkp)      TYPE ztt_vfkp.

    CLASS-METHODS: lfa1          IMPORTING VALUE(i_operacion)    TYPE text10
                                           st_vfkp               TYPE zst_vfkp
                                 EXPORTING VALUE(st_transp_name) TYPE zst_zsd_transp-name.

    CLASS-METHODS: t001          IMPORTING VALUE(i_operacion)   TYPE text10
                                           st_transp            TYPE zst_zsd_transp
                                 EXPORTING VALUE(st_transp_soc) TYPE zst_zsd_transp-sociedad.

    CLASS-METHODS: vtts          IMPORTING VALUE(i_operacion) TYPE text10
                                           st_vfkp            TYPE zst_vfkp
                                 EXPORTING VALUE(st_vtts)     TYPE zst_vtts.

    CLASS-METHODS: vtts2         IMPORTING VALUE(i_operacion) TYPE text10
                                           st_vfkp            TYPE zst_vfkp
                                 EXPORTING VALUE(st_vtts)     TYPE zst_vtts.

    CLASS-METHODS: vtts3         IMPORTING VALUE(i_operacion) TYPE text10
                                           tdlnr              TYPE ztt_eina_lifnr
                                           st_vfkp            TYPE zst_vfkp
                                 EXPORTING VALUE(st_vtts)     TYPE zst_vtts.

    CLASS-METHODS: tvknt         IMPORTING VALUE(i_operacion) TYPE text10
                                           st_vtts            TYPE zst_vtts
                                 EXPORTING VALUE(tvknt_bezei) TYPE zst_tvknt-bezei.

    CLASS-METHODS: adcr          IMPORTING VALUE(i_operacion) TYPE text10
                                           st_vtts            TYPE zst_vtts
                                 EXPORTING VALUE(st_adcr)     TYPE zst_adrc.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_QRY_ZGET_TRANSP_LIQ IMPLEMENTATION.


  METHOD vfkp.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zget_transp_liq=>tys_z_i_vfkptype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_rebel      TYPE RANGE OF char10,
          ls_range_rebel      LIKE LINE OF lt_range_rebel,
          ls_vfkp             LIKE LINE OF t_vfkp.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ). " |DS4WD100|
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
       EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_ZGET_TRANSP_LIQ'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZGET_TRANSP_LIQ' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_rebel.
            ls_range_rebel-sign = 'I'.
            ls_range_rebel-option = 'EQ'.
            ls_range_rebel-low = st_vttk-tknum.
            APPEND ls_range_rebel TO lt_range_rebel.
            CLEAR ls_range_rebel.


            " Navigate to the resource and create a request for the read operation
            "lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTK' )->create_request_for_read( ).
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VFKP' )->create_request_for_read( ).   " ACL

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'REBEL'
                                                                    it_range             = lt_range_rebel ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'VBTYP'
*                                                        it_range             = lt_range_VBTYP ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR t_vfkp.

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_vfkp.
              APPEND ls_vfkp TO t_vfkp.
              CLEAR ls_vfkp.
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


  METHOD vfkp2.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zget_transp_liq=>tys_z_i_vfkptype,
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
          lt_range_fknum      TYPE RANGE OF char10,
          ls_range_fknum      LIKE LINE OF lt_range_fknum,
          lt_range_lblni      TYPE RANGE OF char10,
          ls_range_lblni      LIKE LINE OF lt_range_lblni,
          lt_range_rebel      TYPE RANGE OF char10,
          ls_range_rebel      LIKE LINE OF lt_range_rebel,
          ls_vfkp             LIKE LINE OF t_vfkp.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
       EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_ZGET_TRANSP_LIQ'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZGET_TRANSP_LIQ' ).

            ASSERT lo_http_client IS BOUND.


            CLEAR lt_range_fknum.
            IF NOT fknum IS INITIAL.
              ls_range_fknum-sign   = 'I'.
              ls_range_fknum-option = 'EQ'.
              ls_range_fknum-low    = fknum.
              APPEND ls_range_fknum TO lt_range_fknum.
            ENDIF.

            CLEAR lt_range_lblni.
            IF NOT lblni IS INITIAL.
              ls_range_lblni-sign   = 'I'.
              ls_range_lblni-option = 'EQ'.
              ls_range_lblni-low    = lblni.
              APPEND ls_range_lblni TO lt_range_lblni.
            ENDIF.

            IF NOT st_vttk-tknum IS INITIAL.
              ls_range_rebel-sign   = 'I'.
              ls_range_rebel-option = 'EQ'.
              ls_range_rebel-low    = st_vttk-tknum.
              APPEND ls_range_rebel TO lt_range_rebel.
            ENDIF.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VFKP' )->create_request_for_read( ).

            " Create the filter tree
            IF lt_range_fknum IS NOT INITIAL OR lt_range_lblni IS NOT INITIAL OR lt_range_rebel IS NOT INITIAL.
            lo_filter_factory = lo_request->create_filter_factory( ).
            ENDIF.

            IF lt_range_fknum IS NOT INITIAL.
              lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'FKNUM'
                                                                      it_range             = lt_range_fknum ).
            ENDIF.
            IF lt_range_lblni IS NOT INITIAL.
              lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'LBLNI'
                                                                      it_range             = lt_range_lblni ).
            ENDIF.
            IF lt_range_rebel IS NOT INITIAL.
              lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'REBEL'
                                                                      it_range             = lt_range_rebel ).
            ENDIF.

            IF lt_range_fknum IS NOT INITIAL AND lt_range_lblni IS NOT INITIAL AND lt_range_rebel IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
              lo_request->set_filter( lo_filter_node_root ).
            ELSEIF lt_range_fknum IS NOT INITIAL AND lt_range_lblni IS NOT INITIAL AND lt_range_rebel IS INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
              lo_request->set_filter( lo_filter_node_root ).
            ELSEIF lt_range_fknum IS NOT INITIAL AND lt_range_lblni IS INITIAL AND lt_range_rebel IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_3 ).
              lo_request->set_filter( lo_filter_node_root ).
            ELSEIF lt_range_fknum IS INITIAL AND lt_range_lblni IS NOT INITIAL AND lt_range_rebel IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_2->and( lo_filter_node_3 ).
              lo_request->set_filter( lo_filter_node_root ).
            ELSEIF lt_range_fknum IS INITIAL AND lt_range_lblni IS INITIAL AND lt_range_rebel IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_3.
              lo_request->set_filter( lo_filter_node_root ).
            ELSEIF lt_range_fknum IS NOT INITIAL AND lt_range_lblni IS INITIAL AND lt_range_rebel IS INITIAL.
              lo_filter_node_root = lo_filter_node_1.
              lo_request->set_filter( lo_filter_node_root ).
            ELSEIF lt_range_fknum IS INITIAL AND lt_range_lblni IS NOT INITIAL AND lt_range_rebel IS INITIAL.
              lo_filter_node_root = lo_filter_node_2.
              lo_request->set_filter( lo_filter_node_root ).
            ENDIF.

*            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR t_vfkp.

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_vfkp.
              APPEND ls_vfkp TO t_vfkp.
              CLEAR ls_vfkp.
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


  METHOD lfa1.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_zget_transp_liq=>tys_z_i_lfa_1_type,
          ls_business_data TYPE zscm_zget_transp_liq=>tys_z_i_lfa_1_type,
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
                                              proxy_model_id      = 'ZSCM_ZGET_TRANSP_LIQ'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZGET_TRANSP_LIQ' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      lifnr  = st_vfkp-tdlnr ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LFA_1' )->navigate_with_key( ls_entity_key ).
            ls_entity_key-name_1 = st_transp_name.

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

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


  METHOD vtts2.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_zget_transp_liq=>tys_z_i_vttstype,
          ls_business_data TYPE zscm_zget_transp_liq=>tys_z_i_vttstype,
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
                                              proxy_model_id      = 'ZSCM_ZGET_TRANSP_LIQ'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZGET_TRANSP_LIQ' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      tknum  = st_vfkp-rebel
                      tsnum  = st_vfkp-repos ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTS' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            IF ls_entity_key-abland_1 NE 'MX'.
              ls_entity_key-abland_1 = st_vtts-abland1.
              ls_entity_key-knotz = st_vtts-knotz.
              ls_entity_key-edort_01 = st_vtts-edort01.
              ls_entity_key-adrnz = st_vtts-adrnz.
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
    ENDCASE.
  ENDMETHOD.


  METHOD vttk3.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_zget_transp_liq=>tys_z_i_vttktype,
          ls_business_data TYPE zscm_zget_transp_liq=>tys_z_i_vttktype,
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
                                              proxy_model_id      = 'ZSCM_ZGET_TRANSP_LIQ'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZGET_TRANSP_LIQ' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      tknum  = st_vfkp-rebel ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTK' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            ls_business_data-tpbez = st_transp-tpbez.
            ls_business_data-exti_1 = st_transp-exti1.
            ls_business_data-text_1 = st_transp-text1.
            ls_business_data-text_2 = st_transp-text2.
            ls_business_data-text_3 = st_transp-text3.
            ls_business_data-text_4 = st_transp-text4.

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


  METHOD t001.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_zget_transp_liq=>tys_z_i_t_001_type,
          ls_business_data TYPE zscm_zget_transp_liq=>tys_z_i_t_001_type,
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
                                              proxy_model_id      = 'ZSCM_ZGET_TRANSP_LIQ'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZGET_TRANSP_LIQ' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = st_transp-bukrs ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_001' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            ls_business_data-butxt = st_transp_soc.

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


  METHOD vtts.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_zget_transp_liq=>tys_z_i_vttstype,
          ls_business_data TYPE zscm_zget_transp_liq=>tys_z_i_vttstype,
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
                                              proxy_model_id      = 'ZSCM_ZGET_TRANSP_LIQ'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZGET_TRANSP_LIQ' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      tknum  = st_VFKP-rebel
                      tsnum  = st_vfkp-repos
                      vsart  = '04' ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTS' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            ls_entity_key-abland_1 = st_vtts-abland1.
            ls_entity_key-knotz = st_vtts-knotz.
            ls_entity_key-edort_01 = st_vtts-edort01.
            ls_entity_key-adrnz = st_vtts-adrnz.

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


  METHOD adcr.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_zget_transp_liq=>tys_z_i_adrctype,
          ls_business_data TYPE zscm_zget_transp_liq=>tys_z_i_adrctype,
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
                                              proxy_model_id      = 'ZSCM_ZGET_TRANSP_LIQ'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZGET_TRANSP_LIQ' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      addrnumber  = st_vtts-adrnz ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ADRC' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            ls_business_data-name_1 = st_adcr-name1.
            ls_business_data-city_1 = st_adcr-city1.
            ls_business_data-post_code_1 = st_adcr-post_code1.

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


  METHOD vtts3.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zget_transp_liq=>tys_z_i_vttstype,
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
          lt_range_tknum      TYPE RANGE OF char10,
          ls_range_tknum      LIKE LINE OF lt_range_tknum,
          lt_range_tsnum      TYPE RANGE OF ztsnum,
          ls_range_tsnum      LIKE LINE OF lt_range_tsnum,
          lt_range_tdlnr      TYPE RANGE OF char10,
          ls_range_tdlnr      LIKE LINE OF lt_range_tdlnr,
          lt_range_edlan1     TYPE RANGE OF char3,
          ls_range_edlan1     LIKE LINE OF lt_range_edlan1,
          ls_tdlnr            TYPE zst_eina_lifnr.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZGET_TRANSP_LIQ'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZGET_TRANSP_LIQ' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_tknum.
            ls_range_tknum-sign   = 'I'.
            ls_range_tknum-option = 'EQ'.
            ls_range_tknum-low    = st_vfkp-rebel.
            APPEND ls_range_tknum TO lt_range_tknum.

            CLEAR lt_range_tsnum.
            ls_range_tsnum-sign   = 'I'.
            ls_range_tsnum-option = 'EQ'.
            ls_range_tsnum-low    = st_vfkp-repos.
            APPEND ls_range_tsnum TO lt_range_tsnum.

            CLEAR lt_range_tdlnr.
            LOOP AT tdlnr INTO ls_tdlnr.
              ls_range_tdlnr-sign   = 'I'.
              ls_range_tdlnr-option = 'EQ'.
              ls_range_tdlnr-low    = ls_tdlnr-lifnr.
              APPEND ls_range_tdlnr TO lt_range_tdlnr.
            ENDLOOP.

            CLEAR lt_range_edlan1.
            ls_range_edlan1-sign   = 'I'.
            ls_range_edlan1-option = 'EQ'.
            ls_range_edlan1-low    = 'US'.
            APPEND ls_range_edlan1 TO lt_range_edlan1.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTS' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'TKNUM'
                                                                    it_range             = lt_range_tknum ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'TSNUM'
                                                                    it_range             = lt_range_tsnum ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'TDLNR'
                                                                    it_range             = lt_range_tdlnr ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'EDLNA1'
                                                                    it_range             = lt_range_edlan1 ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 1 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).
            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO st_vtts.
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


  METHOD vfkp3.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zget_transp_liq=>tys_z_i_vfkptype,
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
          lt_range_fknum      TYPE RANGE OF char10,
          ls_range_fknum      LIKE LINE OF lt_range_fknum,
          lt_range_lblni      TYPE RANGE OF char10,
          ls_range_lblni      LIKE LINE OF lt_range_lblni,
          lt_range_tknum      TYPE RANGE OF char10,
          ls_range_tknum      LIKE LINE OF lt_range_tknum,
          ls_vfkp             LIKE LINE OF t_vfkp.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
       EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_ZGET_TRANSP_LIQ'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZGET_TRANSP_LIQ' ).

            ASSERT lo_http_client IS BOUND.


            CLEAR lt_range_fknum.
            IF NOT fknum IS INITIAL.
              ls_range_fknum-sign   = 'I'.
              ls_range_fknum-option = 'EQ'.
              ls_range_fknum-low    = fknum.
              APPEND ls_range_fknum TO lt_range_fknum.
            ENDIF.

            CLEAR lt_range_lblni.
            IF NOT lblni IS INITIAL.
              ls_range_lblni-sign   = 'I'.
              ls_range_lblni-option = 'EQ'.
              ls_range_lblni-low    = lblni.
              APPEND ls_range_lblni TO lt_range_lblni.
            ENDIF.

            CLEAR lt_range_tknum.
            IF NOT tknum IS INITIAL.
              ls_range_tknum-sign   = 'I'.
              ls_range_tknum-option = 'EQ'.
              ls_range_tknum-low    = fknum.
              APPEND ls_range_tknum TO lt_range_tknum.
            ENDIF.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTK' )->create_request_for_read( ).

            " Create the filter tree
            IF lt_range_fknum IS NOT INITIAL OR lt_range_lblni IS NOT INITIAL OR lt_range_tknum IS NOT INITIAL.
              lo_filter_factory = lo_request->create_filter_factory( ).
            ENDIF.

            IF lt_range_fknum IS NOT INITIAL.
              lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'FKNUM'
                                                                      it_range             = lt_range_fknum ).
            ENDIF.
            IF lt_range_lblni IS NOT INITIAL.
              lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'LBLNI'
                                                                      it_range             = lt_range_lblni ).
            ENDIF.
            IF lt_range_tknum IS NOT INITIAL.
              lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'TKNUM'
                                                                      it_range             = lt_range_tknum ).
            ENDIF.

            IF lt_range_fknum IS NOT INITIAL AND lt_range_lblni IS NOT INITIAL AND lt_range_tknum IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
              lo_request->set_filter( lo_filter_node_root ).
            ELSEIF lt_range_fknum IS NOT INITIAL AND lt_range_lblni IS NOT INITIAL AND lt_range_tknum IS INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
              lo_request->set_filter( lo_filter_node_root ).
            ELSEIF lt_range_fknum IS NOT INITIAL AND lt_range_lblni IS INITIAL AND lt_range_tknum IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_3 ).
              lo_request->set_filter( lo_filter_node_root ).
            ELSEIF lt_range_fknum IS INITIAL AND lt_range_lblni IS NOT INITIAL AND lt_range_tknum IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_2->and( lo_filter_node_3 ).
              lo_request->set_filter( lo_filter_node_root ).
            ELSEIF lt_range_fknum IS INITIAL AND lt_range_lblni IS INITIAL AND lt_range_tknum IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_3.
              lo_request->set_filter( lo_filter_node_root ).
            ELSEIF lt_range_fknum IS NOT INITIAL AND lt_range_lblni IS INITIAL AND lt_range_tknum IS INITIAL.
              lo_filter_node_root = lo_filter_node_1.
              lo_request->set_filter( lo_filter_node_root ).
            ELSEIF lt_range_fknum IS INITIAL AND lt_range_lblni IS NOT INITIAL AND lt_range_tknum IS INITIAL.
              lo_filter_node_root = lo_filter_node_2.
              lo_request->set_filter( lo_filter_node_root ).
            ENDIF.
*            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR t_vfkp.

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_vfkp.
              APPEND ls_vfkp TO t_vfkp.
              CLEAR ls_vfkp.
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


  METHOD vttk2.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zget_transp_liq=>tys_z_i_vttktype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_tknum      TYPE RANGE OF char10,
          ls_range_tknum      LIKE LINE OF lt_range_tknum,
          lt_range_tpbez      TYPE RANGE OF text20,
          ls_range_tpbez      LIKE LINE OF lt_range_tpbez,
          ls_vttk             LIKE LINE OF t_vttk.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
       EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_ZGET_TRANSP_LIQ'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZGET_TRANSP_LIQ' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_tpbez.
            IF tpbez IS NOT INITIAL.
              ls_range_tpbez-sign   = 'I'.
              ls_range_tpbez-option = 'EQ'.
              ls_range_tpbez-low    = tpbez.
              APPEND ls_range_tpbez TO lt_range_tpbez.
            ENDIF.

            CLEAR lt_range_tknum.
            IF tknum IS NOT INITIAL.
              ls_range_tknum-sign   = 'I'.
              ls_range_tknum-option = 'EQ'.
              ls_range_tknum-low    = tknum.
              APPEND ls_range_tknum TO lt_range_tknum.
            ENDIF.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTK' )->create_request_for_read( ).

            IF lt_range_tpbez IS NOT INITIAL OR lt_range_tknum IS NOT INITIAL.
              " Create the filter tree
              lo_filter_factory = lo_request->create_filter_factory( ).
            ENDIF.

            IF lt_range_tpbez IS NOT INITIAL.
              lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'TPBEZ'
                                                                      it_range             = lt_range_tpbez ).
            ENDIF.
            IF lt_range_tknum IS NOT INITIAL.
              lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'TKNUM'
                                                                      it_range             = lt_range_tknum ).
            ENDIF.

            IF lt_range_tpbez IS NOT INITIAL AND lt_range_tknum IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
              lo_request->set_filter( lo_filter_node_root ).
            ELSEIF lt_range_tpbez IS NOT INITIAL AND lt_range_tknum IS INITIAL.
              lo_filter_node_root = lo_filter_node_1.
              lo_request->set_filter( lo_filter_node_root ).
            ELSEIF lt_range_tpbez IS INITIAL AND lt_range_tknum IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_2.
              lo_request->set_filter( lo_filter_node_root ).
            ENDIF.

*            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR t_vttk.

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_vttk.
              ls_business_data-exti_1 = ls_vttk-exti1.
              ls_business_data-text_1 = ls_vttk-text1.
              ls_business_data-text_2 = ls_vttk-text2.
              ls_business_data-text_3 = ls_vttk-text3.
              ls_business_data-text_4 = ls_vttk-text4.
              APPEND ls_vttk TO t_vttk.
              CLEAR ls_vttk.
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


  METHOD tvknt.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_zget_transp_liq=>tys_z_i_tvknttype,
          ls_business_data TYPE zscm_zget_transp_liq=>tys_z_i_tvknttype,
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
                                              proxy_model_id      = 'ZSCM_ZGET_TRANSP_LIQ'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZGET_TRANSP_LIQ' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      spras  = 'S'
                      knote  = st_vtts-knotz ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_TVKNT' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            ls_business_data-bezei = tvknt_bezei.

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


  METHOD vttk.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zget_transp_liq=>tys_z_i_vttktype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_signi      TYPE RANGE OF text20,
          ls_range_signi      LIKE LINE OF lt_range_signi,
          ls_vttk             LIKE LINE OF t_vttk.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
       EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_ZGET_TRANSP_LIQ'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZGET_TRANSP_LIQ' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_signi.
            ls_range_signi-sign = 'I'.
            ls_range_signi-option = 'EQ'.
            ls_range_signi-low = signi.
            APPEND ls_range_signi TO lt_range_signi.
            CLEAR ls_range_signi.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'SIGNI'
                                                                    it_range             = lt_range_signi ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'VBTYP'
*                                                        it_range             = lt_range_VBTYP ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR t_vttk.

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_vttk.
              ls_business_data-exti_1 = ls_vttk-exti1.
              ls_business_data-text_1 = ls_vttk-text1.
              ls_business_data-text_2 = ls_vttk-text2.
              ls_business_data-text_3 = ls_vttk-text3.
              ls_business_data-text_4 = ls_vttk-text4.
              APPEND ls_vttk TO t_vttk.
              CLEAR ls_vttk.
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
