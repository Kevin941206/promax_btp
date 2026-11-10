CLASS zcl_ekko_gr_list DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: ekko_get     IMPORTING VALUE(i_operacion)  TYPE text10
                                                et_ebeln      TYPE ztt_ebeln OPTIONAL
                                                ev_lifnr      TYPE ebeln
                                                et_bukrs      TYPE ztt_bukrs
                                                ev_bstyp      TYPE bstyp
                                                ev_loekz      TYPE zchar01
                                                et_bedat      TYPE ztt_budat OPTIONAL
                                                ev_filter     TYPE zchar01
                                EXPORTING VALUE(et_ekko)      TYPE ztt_ekko.


    CLASS-METHODS: ekko_get2    IMPORTING VALUE(i_operacion)  TYPE text10
                                                i_ebeln       TYPE ebeln
                                                i_filter     TYPE zchar01
                                EXPORTING VALUE(et_ekko)      TYPE ztt_ekko.

    CLASS-METHODS: ekko_get3    IMPORTING VALUE(i_operacion)  TYPE text10
                                                i_ebeln       TYPE ebeln
                                EXPORTING VALUE(et_ekko)      TYPE ztt_ekko.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EKKO_GR_LIST IMPLEMENTATION.


  METHOD ekko_get.
    CASE i_operacion.
      WHEN 'READ'.


        DATA:
          lt_business_data TYPE TABLE OF zscm_ekko=>tys_z_i_ekkotype,
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
         lo_filter_node_5    TYPE REF TO /iwbep/if_cp_filter_node,
         lo_filter_node_6    TYPE REF TO /iwbep/if_cp_filter_node,
         lo_filter_node_7    TYPE REF TO /iwbep/if_cp_filter_node,
         lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node.
*         lt_range_DELETE_MC TYPE RANGE OF <element_name>,
*         lt_range_UPDATE_MC TYPE RANGE OF <element_name>.

        DATA:
          lt_range_ebeln   TYPE RANGE OF ebeln,
          ls_range_ebeln   LIKE LINE OF lt_range_ebeln,
          lt_range_bukrs   TYPE RANGE OF bukrs,
          ls_range_bukrs   LIKE LINE OF lt_range_bukrs,
          lt_range_lifnr   TYPE RANGE OF lifnr,
          ls_range_lifnr   LIKE LINE OF lt_range_lifnr.

        DATA: lt_range_frgke TYPE RANGE OF frgke,
              ls_range_frgke LIKE LINE OF lt_range_frgke.

        DATA: lt_range_bstyp TYPE RANGE OF bstyp,
              ls_range_bstyp LIKE LINE OF lt_range_bstyp.

        DATA: lt_range_bedat TYPE RANGE OF bedat,
              ls_range_bedat LIKE LINE OF lt_range_bedat,
              wa_bedat       TYPE zes_budat.

        DATA: lt_range_loekz TYPE RANGE OF zchar01,
              ls_range_loekz LIKE LINE OF lt_range_loekz.

             TRY.
             " Create http client
*        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
*                                                     comm_scenario  = '<Comm Scenario>'
*                                                     comm_system_id = '<Comm System Id>'
*                                                     service_id     = '<Service Id>' ).
*        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
             "DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = |DS4WD100| ). "|DS4100| ).
             DATA lv_dest TYPE string.
             SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
             DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
             lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
             lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
               EXPORTING
                  is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                      proxy_model_id      = 'ZSCM_EKKO'
                                                      proxy_model_version = '0001' )
                 io_http_client             = lo_http_client
                 iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_EKKO' ).

             ASSERT lo_http_client IS BOUND.

        MOVE-CORRESPONDING et_ebeln TO  lt_range_ebeln.

        IF et_bukrs IS INITIAL.
          CLEAR: lt_range_bukrs, ls_range_bukrs.
          ls_range_bukrs-sign = 'I'.
          ls_range_bukrs-option = 'EQ'.
          ls_range_bukrs-low = space.
          APPEND ls_range_bukrs TO lt_range_bukrs.
        ELSE.
          MOVE-CORRESPONDING et_bukrs TO  lt_range_bukrs.
        ENDIF.

        CLEAR: lt_range_lifnr, ls_range_lifnr.
        ls_range_lifnr-sign = 'I'.
        ls_range_lifnr-option = 'EQ'.
        ls_range_lifnr-low = ev_lifnr.
        APPEND ls_range_lifnr TO lt_range_lifnr.

        CLEAR: lt_range_frgke, ls_range_frgke.
        ls_range_frgke-sign   = 'I'.
        ls_range_frgke-option = 'EQ'.
        ls_range_frgke-low    = 'D'.
        APPEND ls_range_frgke TO lt_range_frgke.

        CLEAR: ls_range_frgke.
        ls_range_frgke-sign   = 'I'.
        ls_range_frgke-option = 'EQ'.
        ls_range_frgke-low    = 'E'.
        APPEND ls_range_frgke TO lt_range_frgke.

        CLEAR: ls_range_frgke.
        ls_range_frgke-sign   = 'I'.
        ls_range_frgke-option = 'EQ'.
        ls_range_frgke-low    = 'F'.
        APPEND ls_range_frgke TO lt_range_frgke.

        CLEAR: ls_range_frgke.
        ls_range_frgke-sign   = 'I'.
        ls_range_frgke-option = 'EQ'.
        ls_range_frgke-low    = space.
        APPEND ls_range_frgke TO lt_range_frgke.


        CLEAR: lt_range_bstyp, ls_range_bstyp.
        ls_range_bstyp-sign   = 'I'.
        ls_range_bstyp-option = 'EQ'.
        ls_range_bstyp-low    = ev_bstyp.
        APPEND ls_range_bstyp TO lt_range_bstyp.

        CLEAR: lt_range_loekz, ls_range_loekz.
        ls_range_loekz-sign   = 'I'.
        ls_range_loekz-option = 'EQ'.
        ls_range_loekz-low    = ev_loekz.
        APPEND ls_range_loekz TO lt_range_loekz.

        IF ev_filter EQ 'C'.
          CLEAR: lt_range_bedat.
          LOOP AT et_bedat INTO wa_bedat.

            CLEAR: ls_range_bedat.
            ls_range_bedat-sign   = 'I'.
            ls_range_bedat-option = 'EQ'.
            ls_range_bedat-low    = wa_bedat-low.
            IF wa_bedat-high IS NOT INITIAL.
              ls_range_bedat-high = wa_bedat-high.
              ls_range_bedat-option = 'BT'.
            ENDIF.
            APPEND ls_range_bedat TO lt_range_bedat.

          ENDLOOP.
        ENDIF.


        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKKO' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        IF ev_filter EQ 'A'.

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = et_ebeln ).

            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'LIFNR'
                                                                      it_range             = lt_range_lifnr ).

            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_bukrs ).

            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BSTYP'
                                                                    it_range             = lt_range_bstyp ).

            lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'FRGKE'
                                                                    it_range             = lt_range_frgke ).

            lo_filter_node_6  = lo_filter_factory->create_by_range( iv_property_path     = 'LOEKZ'
                                                                    it_range             = lt_range_loekz ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 )->and( lo_filter_node_6 ).


        ELSEIF ev_filter EQ 'B'.


            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'LIFNR'
                                                                      it_range             = lt_range_lifnr ).

            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_bukrs ).

            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'BSTYP'
                                                                    it_range             = lt_range_bstyp ).

            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'FRGKE'
                                                                    it_range             = lt_range_frgke ).

            lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'LOEKZ'
                                                                    it_range             = lt_range_loekz ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 ).


        ELSEIF ev_filter EQ 'C'.

*            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
*                                                                    it_range             = et_ebeln ).

            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'LIFNR'
                                                                      it_range             = lt_range_lifnr ).

            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_bukrs ).

            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BSTYP'
                                                                    it_range             = lt_range_bstyp ).

            lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'BEDAT'
                                                                    it_range             = lt_range_bedat ).

            lo_filter_node_6  = lo_filter_factory->create_by_range( iv_property_path     = 'FRGKE'
                                                                    it_range             = lt_range_frgke ).

            lo_filter_node_7  = lo_filter_factory->create_by_range( iv_property_path     = 'LOEKZ'
                                                                    it_range             = lt_range_loekz ).

            lo_filter_node_root = lo_filter_node_2->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 )->and( lo_filter_node_6 )->and( lo_filter_node_7 ).

        ENDIF.

*        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
        lo_request->set_filter( lo_filter_node_root ).

        lo_request->set_top( 5000 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        MOVE-CORRESPONDING lt_business_data TO et_ekko.

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


  METHOD ekko_get2.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_ekko=>tys_z_i_ekkotype,
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
         lo_filter_node_5    TYPE REF TO /iwbep/if_cp_filter_node,
         lo_filter_node_6    TYPE REF TO /iwbep/if_cp_filter_node,
         lo_filter_node_7    TYPE REF TO /iwbep/if_cp_filter_node,
         lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node.
*         lt_range_DELETE_MC TYPE RANGE OF <element_name>,
*         lt_range_UPDATE_MC TYPE RANGE OF <element_name>.

        DATA:
          lt_range_ebeln   TYPE RANGE OF ebeln,
          ls_range_ebeln   LIKE LINE OF lt_range_ebeln.

        TRY.
             " Create http client
*        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
*                                                     comm_scenario  = '<Comm Scenario>'
*                                                     comm_system_id = '<Comm System Id>'
*                                                     service_id     = '<Service Id>' ).
*        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        "DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = |DS4WD100| ). "|DS4100| ).
        DATA lv_dest TYPE string.
             SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
             DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
           EXPORTING
              is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                  proxy_model_id      = 'ZSCM_EKKO'
                                                  proxy_model_version = '0001' )
             io_http_client             = lo_http_client
             iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_EKKO' ).

        ASSERT lo_http_client IS BOUND.


        CLEAR: lt_range_ebeln, ls_range_ebeln.
        ls_range_ebeln-sign   = 'I'.
        ls_range_ebeln-option = 'EQ'.
        ls_range_ebeln-low    = i_ebeln.
        APPEND ls_range_ebeln TO lt_range_ebeln.

        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKKO' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                it_range             = lt_range_ebeln ).

        lo_filter_node_root = lo_filter_node_1.

*        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
        lo_request->set_filter( lo_filter_node_root ).

        lo_request->set_top( 5000 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        MOVE-CORRESPONDING lt_business_data TO et_ekko.

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


  METHOD ekko_get3.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_ekko=>tys_z_i_ekkotype,
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
         lo_filter_node_5    TYPE REF TO /iwbep/if_cp_filter_node,
         lo_filter_node_6    TYPE REF TO /iwbep/if_cp_filter_node,
         lo_filter_node_7    TYPE REF TO /iwbep/if_cp_filter_node,
         lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node.
*         lt_range_DELETE_MC TYPE RANGE OF <element_name>,
*         lt_range_UPDATE_MC TYPE RANGE OF <element_name>.

        DATA:
          lt_range_ebeln   TYPE RANGE OF ebeln,
          ls_range_ebeln   LIKE LINE OF lt_range_ebeln.

        TRY.
             " Create http client
*        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
*                                                     comm_scenario  = '<Comm Scenario>'
*                                                     comm_system_id = '<Comm System Id>'
*                                                     service_id     = '<Service Id>' ).
*        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        "DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = |DS4WD100| ). "|DS4100| ).
        DATA lv_dest TYPE string.
             SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
             DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
           EXPORTING
              is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                  proxy_model_id      = 'ZSCM_EKKO'
                                                  proxy_model_version = '0001' )
             io_http_client             = lo_http_client
             iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_EKKO' ).

        ASSERT lo_http_client IS BOUND.


        CLEAR: lt_range_ebeln, ls_range_ebeln.
        ls_range_ebeln-sign   = 'I'.
        ls_range_ebeln-option = 'EQ'.
        ls_range_ebeln-low    = i_ebeln.
        APPEND ls_range_ebeln TO lt_range_ebeln.

        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKKO' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                it_range             = lt_range_ebeln ).

        lo_filter_node_root = lo_filter_node_1.

*        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
        lo_request->set_filter( lo_filter_node_root ).

        lo_request->set_top( 5000 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        MOVE-CORRESPONDING lt_business_data TO et_ekko.

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
