CLASS zcl_qry_salesorder_list DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-DATA: BEGIN OF ty_aubel,
                  aubel TYPE vbeln,
                END OF ty_aubel.

    CLASS-DATA lt_aubel LIKE TABLE OF ty_aubel.

    CLASS-METHODS kna1 IMPORTING VALUE(i_operacion) TYPE text10
                                 i_name1            TYPE name1_gp
                                 i_name2            TYPE name2_gp
                       EXPORTING e_kunnr            TYPE kunnr.

    CLASS-METHODS vbrp IMPORTING VALUE(i_operacion) TYPE text10
                                 i_vbeln            TYPE vbeln
                       EXPORTING et_aubel           LIKE lt_aubel.

    CLASS-METHODS vbak IMPORTING VALUE(i_operacion) TYPE text10
                                 i_begin_date       TYPE erdat
                                 i_end_date         TYPE erdat
                                 it_bukrs           TYPE ztt_ebpp_bukrs
                                 i_kunnr            TYPE kunnr
                                 it_sold_to         TYPE ztt_wkunnr
                                 it_ship_to         TYPE ztt_wkunnr
                                 it_pedido          TYPE ztt_vbeln
                       EXPORTING et_sales_ord_data  TYPE ztt_sales_ord_data.

    CLASS-METHODS vbuk IMPORTING VALUE(i_operacion) TYPE text10
                                 it_priv            TYPE ztt_sales_ord_data
                       EXPORTING et_vbuk            TYPE ztt_vbuk.

    CLASS-METHODS vbfa IMPORTING VALUE(i_operacion) TYPE text10
                                 it_priv            TYPE ztt_sales_ord_data
                       EXPORTING et_inv_per         TYPE ztt_fact_rel.

    CLASS-METHODS vbrk IMPORTING VALUE(i_operacion) TYPE text10
                                 it_priv            TYPE ztt_sales_ord_data
                       EXPORTING et_vbrk            TYPE ztt_vbrk.

    CLASS-METHODS ytsd_oficina_fd IMPORTING VALUE(i_operacion) TYPE text10
                                            it_vbrk            TYPE ztt_vbrk
                                  EXPORTING et_files_info      TYPE yttsd_oficina_fd.

    CLASS-METHODS kna1_2 IMPORTING VALUE(i_operacion) TYPE text10
                                   it_ord_cus         TYPE ztt_sales_ord_data
                         EXPORTING et_clientes        TYPE ztt_clientes.

    CLASS-METHODS bkpf IMPORTING VALUE(i_operacion) TYPE text10
                                 it_ref             TYPE ztt_references
                       EXPORTING et_doc_fin         TYPE ztt_doc_fin.

    CLASS-METHODS bsid IMPORTING VALUE(i_operacion) TYPE text10
                                 it_doc_fin         TYPE ztt_doc_fin
                       EXPORTING et_payed           TYPE ztt_bsid_payed.

    CLASS-METHODS bsad IMPORTING VALUE(i_operacion) TYPE text10
                                 it_doc_fin         TYPE ztt_doc_fin
                       EXPORTING et_payed           TYPE ztt_bsid_payed.

    CLASS-METHODS bsid_2 IMPORTING VALUE(i_operacion) TYPE text10
                                   it_doc_fin         TYPE ztt_doc_fin
                         EXPORTING et_bsid            TYPE ztt_bsid.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_QRY_SALESORDER_LIST IMPLEMENTATION.


  METHOD kna1.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_sales_document_info=>tys_z_i_kna_1_type,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_name1      TYPE RANGE OF name1_gp,
          ls_range_name1      LIKE LINE OF lt_range_name1,
          lt_range_name2      TYPE RANGE OF name2_gp,
          ls_range_name2      LIKE LINE OF lt_range_name2.

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

            IF i_name1 IS NOT INITIAL.
              ls_range_name1-sign = 'I'.
              ls_range_name1-option = 'CP'.
              ls_range_name1-low = i_name1.
              APPEND ls_range_name1 TO lt_range_name1.
            ENDIF.

            IF i_name2 IS NOT INITIAL.
              ls_range_name2-sign = 'I'.
              ls_range_name2-option = 'CP'.
              ls_range_name2-low = i_name2.
              APPEND ls_range_name2 TO lt_range_name2.
            ENDIF.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_KNA_1' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).
            IF lt_range_name1 IS NOT INITIAL.
              lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'NAME1'
                                                                      it_range             = lt_range_name1 ).
            ENDIF.
            IF lt_range_name2 IS NOT INITIAL.
              lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'NAME2'
                                                                      it_range             = lt_range_name2 ).
            ENDIF.

            IF lo_filter_node_1 IS NOT INITIAL AND lo_filter_node_2 IS NOT INITIAL.
            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            ENDIF.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            e_kunnr = ls_business_data-kunnr.

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


  METHOD vbrp.
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
          ls_aubel            LIKE LINE OF et_aubel.



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
              MOVE-CORRESPONDING ls_business_data TO ls_aubel.
              APPEND ls_aubel TO et_aubel.
              CLEAR ls_aubel.
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


  METHOD vbak.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_list=>tys_z_i_vbak_vbpa_vbaptype,
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
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_vbeln      TYPE RANGE OF vbeln,
          ls_range_vbeln      LIKE LINE OF lt_range_vbeln,
          lt_range_erdat      TYPE RANGE OF erdat,
          ls_range_erdat      LIKE LINE OF lt_range_erdat,
          lt_range_bukrs      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_erdat,
          lt_range_kunnr      TYPE RANGE OF kunnr,
          ls_range_kunnr      LIKE LINE OF lt_range_erdat,
          lt_range_parvw      TYPE RANGE OF zparvw,
          ls_range_parvw      LIKE LINE OF lt_range_erdat,
          ls_sales_ord_data   LIKE LINE OF et_sales_ord_data.


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

            LOOP AT it_pedido INTO DATA(ls_pedido).
              ls_range_vbeln-sign = 'I'.
              ls_range_vbeln-option = 'EQ'.
              ls_range_vbeln-low = ls_pedido-vbeln.
              APPEND ls_range_vbeln TO lt_range_vbeln.
            ENDLOOP.

            LOOP AT it_bukrs INTO DATA(ls_bukrs).
              ls_range_bukrs-sign = 'I'.
              ls_range_bukrs-option = 'EQ'.
              ls_range_bukrs-low = ls_bukrs-bukrs.
              APPEND ls_range_bukrs TO lt_range_bukrs.
            ENDLOOP.

            LOOP AT it_sold_to INTO DATA(ls_sold_to).
              ls_range_kunnr-sign = 'I'.
              ls_range_kunnr-option = 'EQ'.
              ls_range_kunnr-low = ls_sold_to-kunnr.
              APPEND ls_range_kunnr TO lt_range_kunnr.
            ENDLOOP.

            LOOP AT it_ship_to INTO DATA(ls_ship_to).
              ls_range_kunnr-sign = 'I'.
              ls_range_kunnr-option = 'EQ'.
              ls_range_kunnr-low = ls_ship_to-kunnr.
              APPEND ls_range_kunnr TO lt_range_kunnr.
            ENDLOOP.

            IF i_kunnr IS NOT INITIAL.
              ls_range_kunnr-sign = 'I'.
              ls_range_kunnr-option = 'EQ'.
              ls_range_kunnr-low = i_kunnr.
              APPEND ls_range_kunnr TO lt_range_kunnr.
            ENDIF.

            IF i_begin_date IS NOT INITIAL AND i_end_date IS NOT INITIAL.
              ls_range_erdat-sign = 'I'.
              ls_range_erdat-option = 'BT'.
              ls_range_erdat-low = i_begin_date.
              ls_range_erdat-high = i_end_date.
              APPEND ls_range_erdat TO lt_range_erdat.
            ENDIF.

            IF i_kunnr IS NOT INITIAL OR it_sold_to IS NOT INITIAL.
              ls_range_parvw-sign = 'I'.
              ls_range_parvw-option = 'EQ'.
              ls_range_parvw-low = 'AG'.
              APPEND ls_range_parvw TO lt_range_parvw.
            ENDIF.

            IF it_ship_to IS NOT INITIAL.
              ls_range_parvw-sign = 'I'.
              ls_range_parvw-option = 'EQ'.
              ls_range_parvw-low = 'WE'.
              APPEND ls_range_parvw TO lt_range_parvw.
            ENDIF.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VBAK_VBPA_VBAP' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELN'
                                                                    it_range             = lt_range_VBELN ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'ERDAT'
                                                                    it_range             = lt_range_ERDAT ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS_VF'
                                                                    it_range             = lt_range_bukrs ).
            IF lt_range_kunnr IS NOT INITIAL.
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'KUNNR'
                                                                    it_range             = lt_range_kunnr ).
            ENDIF.
            IF lt_range_parvw IS NOT INITIAL.
            lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'PARVW'
                                                                    it_range             = lt_range_parvw ).
            ENDIF.

            IF lt_range_kunnr IS NOT INITIAL AND lt_range_parvw IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 ).
            ELSEIF lt_range_kunnr IS NOT INITIAL AND lt_range_parvw IS INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            ELSEIF lt_range_kunnr IS INITIAL AND lt_range_parvw IS NOT INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_5 ).
            ELSEIF lt_range_kunnr IS INITIAL AND lt_range_parvw IS INITIAL.
              lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            ENDIF.

            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_sales_ord_data.
              APPEND ls_sales_ord_data TO et_sales_ord_data.
              CLEAR ls_sales_ord_data.
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


  METHOD vbuk.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_list=>tys_z_i_vbuktype,
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
          ls_range_VBELN      LIKE LINE OF lt_range_VBELN,
          ls_vbuk             LIKE LINE OF et_vbuk.



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

            LOOP AT it_priv INTO DATA(ls_priv).
              ls_range_VBELN-sign = 'I'.
              ls_range_VBELN-option = 'EQ'.
              ls_range_VBELN-low = ls_priv-vbeln.
              APPEND ls_range_VBELN TO lt_range_VBELN.
              CLEAR ls_range_VBELN.
            ENDLOOP.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VBUK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELN'
                                                        it_range             = lt_range_VBELN ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'RFSTK'
*                                                        it_range             = lt_range_RFSTK ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_vbuk.
              APPEND ls_vbuk TO et_vbuk.
              CLEAR ls_vbuk.
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


  METHOD vbfa.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_list=>tys_z_i_vbfa_vbrptype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_VBELV      TYPE RANGE OF vbeln,
          ls_range_vbelv      LIKE LINE OF lt_range_vbelv,
          lt_range_vbtyp_n    TYPE RANGE OF zvbtypl,
          ls_range_vbtyp_n    LIKE LINE OF lt_range_vbtyp_n,
          ls_inv_per          LIKE LINE OF et_inv_per.


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

            LOOP AT it_priv INTO DATA(ls_priv).
              ls_range_vbelv-sign = 'I'.
              ls_range_vbelv-option = 'EQ'.
              ls_range_vbelv-low = ls_priv-vbeln.
              APPEND ls_range_vbelv TO lt_range_vbelv.
              CLEAR ls_range_vbelv.
            ENDLOOP.

            ls_range_vbtyp_n-sign = 'I'.
            ls_range_vbtyp_n-option = 'EQ'.
            ls_range_vbtyp_n-low = 'M'.
            APPEND ls_range_vbtyp_n TO lt_range_vbtyp_n.
            CLEAR ls_range_vbtyp_n.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VBFA_VBRP' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELV'
                                                                    it_range             = lt_range_VBELV ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'VBTYP_N'
                                                                    it_range             = lt_range_vbtyp_n ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_inv_per.
              APPEND ls_inv_per TO et_inv_per.
              CLEAR ls_inv_per.
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


  METHOD vbrk.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_list=>tys_z_i_vbrktype,
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
          lt_range_vbeln      TYPE RANGE OF vbeln,
          ls_range_vbeln      LIKE LINE OF lt_range_vbeln,
          lt_range_fksto      TYPE RANGE OF c,
          ls_range_fksto      LIKE LINE OF lt_range_fksto,
          lt_range_sfakn      TYPE RANGE OF char10,
          ls_range_sfakn      LIKE LINE OF lt_range_sfakn,
          ls_vbrk             LIKE LINE OF et_vbrk.



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

            LOOP AT it_priv INTO DATA(ls_priv).
              ls_range_vbeln-sign = 'I'.
              ls_range_vbeln-option = 'EQ'.
              ls_range_vbeln-low = ls_priv-vbeln.
              APPEND ls_range_vbeln TO lt_range_vbeln.
              CLEAR ls_range_vbeln.
            ENDLOOP.

            ls_range_fksto-sign = 'I'.
            ls_range_fksto-option = 'EQ'.
            ls_range_fksto-low = space.
            APPEND ls_range_fksto TO lt_range_fksto.
            CLEAR ls_range_fksto.

            ls_range_sfakn-sign = 'I'.
            ls_range_sfakn-option = 'EQ'.
            ls_range_sfakn-low = space.
            APPEND ls_range_sfakn TO lt_range_sfakn.
            CLEAR ls_range_sfakn.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VBRK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELN'
                                                                    it_range             = lt_range_VBELN ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'FKSTO'
                                                                    it_range             = lt_range_fksto ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'SFAKN'
                                                                    it_range             = lt_range_sfakn ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_vbrk.
              APPEND ls_vbrk TO et_vbrk.
              CLEAR ls_vbrk.
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


  METHOD ytsd_oficina_fd.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_list=>tys_z_i_ytsd_oficina_fdtype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory        TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1         TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2         TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root      TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_ORGVTA          TYPE RANGE OF vkorg,
          ls_range_ORGVTA          LIKE LINE OF lt_range_ORGVTA,
          lt_range_CLASE_DOCUEMNTO TYPE RANGE OF yesd_clase_doc,
          ls_range_CLASE_DOCUEMNTO LIKE LINE OF lt_range_CLASE_DOCUEMNTO,
          ls_files_info            LIKE LINE OF et_files_info.



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

            LOOP AT it_vbrk INTO DATA(ls_vbrk).
              ls_range_ORGVTA-sign = 'I'.
              ls_range_ORGVTA-option = 'EQ'.
              ls_range_ORGVTA-low = ls_vbrk-vkorg.
              APPEND ls_range_ORGVTA TO lt_range_ORGVTA.
              CLEAR ls_range_ORGVTA.

              ls_range_CLASE_DOCUEMNTO-sign = 'I'.
              ls_range_CLASE_DOCUEMNTO-option = 'EQ'.
              ls_range_CLASE_DOCUEMNTO-low = ls_vbrk-vkorg.
              APPEND ls_range_CLASE_DOCUEMNTO TO lt_range_CLASE_DOCUEMNTO.
              CLEAR ls_range_CLASE_DOCUEMNTO.
            ENDLOOP.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_YTSD_OFICINA_FD' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'ORGVTA'
                                                                    it_range             = lt_range_ORGVTA ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'CLASE_DOCUEMNTO'
                                                                    it_range             = lt_range_CLASE_DOCUEMNTO ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_files_info.
              APPEND ls_files_info TO et_files_info.
              CLEAR ls_files_info.
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


  METHOD kna1_2.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_sales_document_info=>tys_z_i_kna_1_type,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_KUNNR      TYPE RANGE OF kunnr,
          ls_range_KUNNR      LIKE LINE OF lt_range_KUNNR,
          ls_clientes         LIKE LINE OF et_clientes.



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

            LOOP AT it_ord_cus INTO DATA(ls_ord_cus).
              ls_range_KUNNR-sign = 'I'.
              ls_range_KUNNR-option = 'EQ'.
              ls_range_KUNNR-low = ls_ord_cus-kunnr.
              APPEND ls_range_KUNNR TO lt_range_KUNNR.
              CLEAR ls_range_KUNNR.
            ENDLOOP.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_KNA_1' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'KUNNR'
                                                                    it_range             = lt_range_KUNNR ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'LAND_1'
*                                                        it_range             = lt_range_LAND_1 ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_clientes.
              ls_clientes-name1 = ls_business_data-name_1.
              ls_clientes-name2 = ls_business_data-name_2.
              APPEND ls_clientes TO et_clientes.
              CLEAR ls_clientes.
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
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_awkey      TYPE RANGE OF awkey,
          ls_range_awkey      LIKE LINE OF lt_range_awkey,
          lt_range_awtyp      TYPE RANGE OF awtyp,
          ls_range_awtyp      LIKE LINE OF lt_range_awtyp,
          ls_doc_fin          LIKE LINE OF et_doc_fin.




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

            LOOP AT it_ref INTO DATA(ls_ref).
              ls_range_awkey-sign = 'I'.
              ls_range_awkey-option = 'EQ'.
              ls_range_awkey-low = ls_ref-awkey.
              APPEND ls_range_awkey TO lt_range_awkey.
              CLEAR ls_range_awkey.
            ENDLOOP.

            ls_range_awtyp-sign = 'I'.
            ls_range_awtyp-option = 'EQ'.
            ls_range_awtyp-low = 'VBRK'.
            APPEND ls_range_awtyp TO lt_range_awtyp.
            CLEAR ls_range_awtyp.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BKPF' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'AWKEY'
                                                                    it_range             = lt_range_awkey ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'AWTYP'
                                                                    it_range             = lt_range_awtyp ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_doc_fin.
              APPEND ls_doc_fin TO et_doc_fin.
              CLEAR ls_doc_fin.
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


  METHOD bsid.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_salesorder_list=>tys_z_i_bsidtype,
          ls_business_data TYPE zscm_salesorder_list=>tys_z_i_bsidtype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read,
          ls_payed LIKE LINE OF et_payed.



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

            LOOP AT it_doc_fin INTO DATA(ls_doc_fin).
              " Set entity key
              ls_entity_key = VALUE #(
                        bukrs  = ls_doc_fin-bukrs
                        blart = 'DZ'
                        rebzg = ls_doc_fin-belnr
                        rebzj = ls_doc_fin-gjahr ).

              " Navigate to the resource
              lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSID' )->navigate_with_key( ls_entity_key ).

              " Execute the request and retrieve the business data
              lo_response = lo_resource->create_request_for_read( )->execute( ).
              lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

              MOVE-CORRESPONDING ls_business_data TO ls_payed.
              APPEND ls_payed TO et_payed.
              CLEAR ls_payed.

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


  METHOD bsad.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_salesorder_list=>tys_z_i_bsidtype,
          ls_business_data TYPE zscm_salesorder_list=>tys_z_i_bsidtype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read,
          ls_payed LIKE LINE OF et_payed.



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

            LOOP AT it_doc_fin INTO DATA(ls_doc_fin).
              " Set entity key
              ls_entity_key = VALUE #(
                        bukrs  = ls_doc_fin-bukrs
                        blart = 'DZ'
                        rebzg = ls_doc_fin-belnr
                        rebzj = ls_doc_fin-gjahr ).

              " Navigate to the resource
              lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSAD' )->navigate_with_key( ls_entity_key ).

              " Execute the request and retrieve the business data
              lo_response = lo_resource->create_request_for_read( )->execute( ).
              lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

              MOVE-CORRESPONDING ls_business_data TO ls_payed.
              APPEND ls_payed TO et_payed.
              CLEAR ls_payed.

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


  METHOD bsid_2.
    case i_operacion.
      when 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_salesorder_list=>tys_z_i_bsidtype,
          ls_business_data TYPE zscm_salesorder_list=>tys_z_i_bsidtype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read,
          ls_bsid LIKE LINE OF et_bsid.



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

            LOOP AT it_doc_fin INTO DATA(ls_doc_fin).
              " Set entity key
              ls_entity_key = VALUE #(
                        bukrs  = ls_doc_fin-bukrs
                        blart = 'RV'
                        belnr = ls_doc_fin-belnr
                        gjahr = ls_doc_fin-gjahr ).

              " Navigate to the resource
              lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSID' )->navigate_with_key( ls_entity_key ).

              " Execute the request and retrieve the business data
              lo_response = lo_resource->create_request_for_read( )->execute( ).
              lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

              MOVE-CORRESPONDING ls_business_data TO ls_bsid.
              APPEND ls_bsid TO et_bsid.
              CLEAR ls_bsid.

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
    endcase.
  ENDMETHOD.
ENDCLASS.
