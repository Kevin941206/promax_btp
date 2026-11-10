CLASS zcl_qry_po_list DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: ekko IMPORTING i_operacion    TYPE text10
                                  i_company      TYPE bukrs
                                  i_po           TYPE ebeln
                                  i_start        TYPE erdat
                                  i_end          TYPE erdat
                                  i_lifnr        TYPE lifnr
                        EXPORTING et_pedidos_cab TYPE ztt_pedidos_cab.

    CLASS-METHODS: ekpo IMPORTING i_operacion    TYPE text10
                                  it_pedidos_cab TYPE ztt_pedidos_cab
                        EXPORTING et_pedidos     TYPE ztt_pedidos.

    CLASS-METHODS: ekkn IMPORTING i_operacion TYPE text10
                                  i_ebeln     TYPE ebeln
                                  i_ebelp     TYPE ebelp
                        EXPORTING e_ablad     TYPE ablad
                                  e_wempf     TYPE wempf.

    CLASS-METHODS: eket IMPORTING i_operacion TYPE text10
                                  i_ebeln     TYPE ebeln
                                  i_ebelp     TYPE ebelp
                        EXPORTING e_uzeit     TYPE uzeit
                                  e_eindt     TYPE eindt
                                  e_menge     TYPE menge_d
                                  e_wemng     TYPE weemg.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_QRY_PO_LIST IMPLEMENTATION.


  METHOD ekko.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_ekkotype,
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
          lo_filter_node_8    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_lifnr      TYPE RANGE OF lifnr,
          ls_range_lifnr      LIKE LINE OF lt_range_lifnr,
          lt_range_ebeln      TYPE RANGE OF ebeln,
          ls_range_ebeln      LIKE LINE OF lt_range_ebeln,
          lt_range_bukrs      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_bedat      TYPE RANGE OF bedat,
          ls_range_bedat      LIKE LINE OF lt_range_bedat,
          lt_range_bstyp      TYPE RANGE OF bstyp,
          ls_range_bstyp      LIKE LINE OF lt_range_bstyp,
          lt_range_frgke      TYPE RANGE OF frgke,
          ls_range_frgke      LIKE LINE OF lt_range_frgke,
          lt_range_loekz      TYPE RANGE OF eloek,
          ls_range_loekz      LIKE LINE OF lt_range_loekz,
          lt_range_procstat   TYPE RANGE OF char2,
          ls_range_procstat   LIKE LINE OF lt_range_procstat,
          ls_pedidos_cab      LIKE LINE OF et_pedidos_cab.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_PO_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_PO_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_lifnr-sign = 'I'.
            ls_range_lifnr-option = 'EQ'.
            ls_range_lifnr-low = i_lifnr.
            APPEND ls_range_lifnr TO lt_range_lifnr.

            IF i_po IS NOT INITIAL.
              ls_range_ebeln-sign = 'I'.
              ls_range_ebeln-option = 'EQ'.
              ls_range_ebeln-low = i_po.
              APPEND ls_range_ebeln TO lt_range_ebeln.
            ENDIF.
            IF i_company IS NOT INITIAL.
              ls_range_bukrs-sign = 'I'.
              ls_range_bukrs-option = 'EQ'.
              ls_range_bukrs-low = i_company.
              APPEND ls_range_bukrs TO lt_range_bukrs.
            ENDIF.
            IF i_start IS NOT INITIAL AND i_end IS NOT INITIAL.
              ls_range_bedat-sign = 'I'.
              ls_range_bedat-option = 'BT'.
              ls_range_bedat-low = i_start.
              ls_range_bedat-high = i_end.
              APPEND ls_range_bedat TO lt_range_bedat.
            ELSEIF i_start IS NOT INITIAL AND i_end IS INITIAL.
              ls_range_bedat-sign = 'I'.
              ls_range_bedat-option = 'EQ'.
              ls_range_bedat-low = i_start.
              APPEND ls_range_bedat TO lt_range_bedat.
            ENDIF.

            ls_range_bstyp-sign = 'I'.
            ls_range_bstyp-option = 'EQ'.
            ls_range_bstyp-low = 'F'.
            APPEND ls_range_bstyp TO lt_range_bstyp.

            ls_range_frgke-sign = 'I'.
            ls_range_frgke-option = 'EQ'.
            ls_range_frgke-low = 'D'.
            APPEND ls_range_frgke TO lt_range_frgke.
            ls_range_frgke-sign = 'I'.
            ls_range_frgke-option = 'EQ'.
            ls_range_frgke-low = 'E'.
            APPEND ls_range_frgke TO lt_range_frgke.
            ls_range_frgke-sign = 'I'.
            ls_range_frgke-option = 'EQ'.
            ls_range_frgke-low = 'F'.
            APPEND ls_range_frgke TO lt_range_frgke.
            ls_range_frgke-sign = 'I'.
            ls_range_frgke-option = 'EQ'.
            ls_range_frgke-low = space.
            APPEND ls_range_frgke TO lt_range_frgke.

            ls_range_loekz-sign = 'I'.
            ls_range_loekz-option = 'EQ'.
            ls_range_loekz-low = space.
            APPEND ls_range_loekz TO lt_range_loekz.

            ls_range_procstat-sign = 'I'.
            ls_range_procstat-option = 'EQ'.
            ls_range_procstat-low = '05'.
            APPEND ls_range_procstat TO lt_range_procstat.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKKO' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).
            IF lt_range_ebeln IS NOT INITIAL.
              lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                      it_range             = lt_range_ebeln ).
            ENDIF.
            IF lt_range_bukrs IS NOT INITIAL.
              lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                      it_range             = lt_range_bukrs ).
            ENDIF.
            IF lt_range_bedat IS NOT INITIAL.
              lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'BEDAT'
                                                                      it_range             = lt_range_bedat ).
            ENDIF.
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BSTYP'
                                                                    it_range             = lt_range_bstyp ).
            lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'FRGKE'
                                                                    it_range             = lt_range_frgke ).
            lo_filter_node_6  = lo_filter_factory->create_by_range( iv_property_path     = 'LOEKZ'
                                                                    it_range             = lt_range_loekz ).
            lo_filter_node_7  = lo_filter_factory->create_by_range( iv_property_path     = 'PROCSTAT'
                                                                    it_range             = lt_range_procstat ).
            lo_filter_node_8  = lo_filter_factory->create_by_range( iv_property_path     = 'LIFNR'
                                                                    it_range             = lt_range_lifnr ).
            IF lt_range_ebeln IS NOT INITIAL AND lt_range_bukrs IS NOT INITIAL AND lt_range_bedat IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 )->and( lo_filter_node_6 )->and( lo_filter_node_7 )->and( lo_filter_node_8 ).
            ELSEIF lt_range_ebeln IS NOT INITIAL AND lt_range_bukrs IS NOT INITIAL AND lt_range_bedat IS INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_4 )->and( lo_filter_node_5 )->and( lo_filter_node_6 )->and( lo_filter_node_7 )->and( lo_filter_node_8 ).
            ELSEIF lt_range_ebeln IS NOT INITIAL AND lt_range_bukrs IS INITIAL AND lt_range_bedat IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 )->and( lo_filter_node_6 )->and( lo_filter_node_7 )->and( lo_filter_node_8 ).
            ELSEIF lt_range_ebeln IS INITIAL AND lt_range_bukrs IS NOT INITIAL AND lt_range_bedat IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_2->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 )->and( lo_filter_node_6 )->and( lo_filter_node_7 )->and( lo_filter_node_8 ).
            ELSEIF lt_range_ebeln IS NOT INITIAL AND lt_range_bukrs IS INITIAL AND lt_range_bedat IS INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_4 )->and( lo_filter_node_5 )->and( lo_filter_node_6 )->and( lo_filter_node_7 )->and( lo_filter_node_8 ).
            ELSEIF lt_range_ebeln IS INITIAL AND lt_range_bukrs IS NOT INITIAL AND lt_range_bedat IS INITIAL.
              lo_filter_node_root = lo_filter_node_2->and( lo_filter_node_4 )->and( lo_filter_node_5 )->and( lo_filter_node_6 )->and( lo_filter_node_7 )->and( lo_filter_node_8 ).
            ELSEIF lt_range_ebeln IS INITIAL AND lt_range_bukrs IS INITIAL AND lt_range_bedat IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_3->and( lo_filter_node_4 )->and( lo_filter_node_5 )->and( lo_filter_node_6 )->and( lo_filter_node_7 )->and( lo_filter_node_8 ).
            ELSEIF lt_range_ebeln IS INITIAL AND lt_range_bukrs IS INITIAL AND lt_range_bedat IS INITIAL.
              lo_filter_node_root = lo_filter_node_4->and( lo_filter_node_5 )->and( lo_filter_node_6 )->and( lo_filter_node_7 )->and( lo_filter_node_8 ).
            ENDIF.

            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_pedidos_cab.
              APPEND ls_pedidos_cab TO et_pedidos_cab.
              CLEAR ls_pedidos_cab.
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


  METHOD ekpo.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_ekpotype,
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
          lt_range_ebeln      TYPE RANGE OF ebeln,
          ls_range_ebeln      LIKE LINE OF lt_range_ebeln,
          lt_range_elikz      TYPE RANGE OF char1,
          ls_range_elikz      LIKE LINE OF lt_range_elikz,
          lt_range_loekz      TYPE RANGE OF eloek,
          ls_range_loekz      LIKE LINE OF lt_range_loekz,
          ls_pedidos          LIKE LINE OF et_pedidos.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_PO_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_PO_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            LOOP AT it_pedidos_cab INTO DATA(ls_ped).
              ls_range_ebeln-sign = 'I'.
              ls_range_ebeln-option = 'EQ'.
              ls_range_ebeln-low = ls_ped-ebeln.
              APPEND ls_range_ebeln TO lt_range_ebeln.
              CLEAR ls_range_ebeln.
            ENDLOOP.

            ls_range_elikz-sign = 'I'.
            ls_range_elikz-option = 'EQ'.
            ls_range_elikz-low = space.
            APPEND ls_range_elikz TO lt_range_elikz.
            CLEAR ls_range_elikz.

            ls_range_loekz-sign = 'I'.
            ls_range_loekz-option = 'EQ'.
            ls_range_loekz-low = space.
            APPEND ls_range_loekz TO lt_range_loekz.
            CLEAR ls_range_loekz.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKPO' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_ebeln ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'ELIKZ'
                                                                    it_range             = lt_range_elikz ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'LOEKZ'
                                                                    it_range             = lt_range_loekz ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_pedidos.
              ls_pedidos-txz01 = ls_business_data-txz_01.
              APPEND ls_pedidos TO et_pedidos.
              CLEAR ls_pedidos.
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


  METHOD ekkn.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_po_list=>tys_z_i_ekkntype,
          ls_business_data TYPE zscm_po_list=>tys_z_i_ekkntype,
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
                                                     proxy_model_id      = 'ZSCM_PO_LIST'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_PO_LIST' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      ebeln  = i_ebeln
                      ebelp  = i_ebelp ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKKN' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            e_ablad = ls_business_data-ablad.
            e_wempf = ls_business_data-wempf.

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


  METHOD eket.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_po_list=>tys_z_i_ekettype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_ebeln      TYPE RANGE OF ebeln,
          ls_range_ebeln      LIKE LINE OF lt_range_ebeln,
          lt_range_ebelp      TYPE RANGE OF ebelp,
          ls_range_ebelp      LIKE LINE OF lt_range_ebelp.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_PO_LIST'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_PO_LIST' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_ebeln-sign = 'I'.
            ls_range_ebeln-option = 'EQ'.
            ls_range_ebeln-low = i_ebeln.
            APPEND ls_range_ebeln TO lt_range_ebeln.

            ls_range_ebelp-sign = 'I'.
            ls_range_ebelp-option = 'EQ'.
            ls_range_ebelp-low = i_ebelp.
            APPEND ls_range_ebelp TO lt_range_ebelp.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKET' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_EBELN ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELP'
                                                                    it_range             = lt_range_EBELP ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            e_eindt = ls_business_data-eindt.
            e_menge = ls_business_data-menge.
            e_uzeit = ls_business_data-uzeit.
            e_wemng = ls_business_data-wemng.

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
