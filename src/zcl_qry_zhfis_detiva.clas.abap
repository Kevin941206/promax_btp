CLASS zcl_qry_zhfis_detiva DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-DATA: BEGIN OF ty_listadoccompprov,
                  bukrs TYPE bukrs,
                  augbl TYPE augbl,
                  auggj TYPE gjahr,
                  belnr TYPE belnr_d,
                  gjahr TYPE gjahr,
                END OF ty_listadoccompprov,

                BEGIN OF ty_listadoccompcli,
                  bukrs TYPE bukrs,
                  augbl TYPE augbl,
                  auggj TYPE gjahr,
                  belnr TYPE belnr_d,
                  gjahr TYPE gjahr,
                END OF ty_listadoccompcli,

                BEGIN OF ty_bsakbsad,
                  bukrs TYPE bukrs,
                  belnr TYPE belnr_d,
                  gjahr TYPE gjahr,
                  buzei TYPE buzei,
                  budat TYPE budat,
                  bldat TYPE bldat,
                  cpudt TYPE datum,
                  xblnr TYPE xblnr,
                  augbl TYPE augbl,
                  auggj TYPE gjahr,
                  waers TYPE waers,
                  shkzg TYPE shkzg,
                  dmbtr TYPE dmbtr,
                  wrbtr TYPE wrbtr,
                  lifnr TYPE lifnr,
                  kunnr TYPE kunnr,
                  blart TYPE blart,
                END OF ty_bsakbsad,

                BEGIN OF ty_listadoc_fi,
                  bukrs TYPE bukrs,
                  belnr TYPE belnr_d,
                  gjahr TYPE gjahr,
                END OF ty_listadoc_fi,

                BEGIN OF ty_bkpf_fi,
                  bukrs TYPE bukrs,
                  belnr TYPE belnr_d,
                  gjahr TYPE gjahr,
                  bktxt TYPE bktxt,
                  usnam TYPE usnam,
                END OF ty_bkpf_fi,

                BEGIN OF ty_bkpf_tc_pago,
                  bukrs TYPE bukrs,
                  belnr TYPE belnr_d,
                  gjahr TYPE gjahr,
                  kursf TYPE zkursf,
                  blart TYPE blart,
                  bldat TYPE bldat,
                END OF ty_bkpf_tc_pago,

                BEGIN OF ty_bseg,
                  bukrs TYPE bukrs,
                  belnr TYPE belnr_d,
                  gjahr TYPE gjahr,
                  buzei TYPE buzei,
                  koart TYPE koart,
                  shkzg TYPE zst_bseg-shkzg,
                  dmbtr TYPE zst_bseg-dmbtr,
                  wrbtr TYPE zst_bseg-wrbtr,
                  mwskz TYPE zst_bseg-mwskz,
                  hkont TYPE zst_bseg-hkont,
                END OF ty_bseg,

                BEGIN OF ty_lifnr,
                  lifnr TYPE lifnr,
                END OF ty_lifnr,

                BEGIN OF ty_kunnr,
                  kunnr TYPE kunnr,
                END OF ty_kunnr.

    CLASS-DATA: lt_listadoccompprov LIKE TABLE OF ty_listadoccompprov,
                lt_listadoccompcli  LIKE TABLE OF ty_listadoccompcli,
                lt_bsakbsad         LIKE TABLE OF ty_bsakbsad,
                lt_listadoc_fi      LIKE TABLE OF ty_listadoc_fi,
                lt_bkpf_fi          LIKE TABLE OF ty_bkpf_fi,
                lt_bkpf_tc_pago     LIKE TABLE OF ty_bkpf_tc_pago,
                lt_lifnr            LIKE TABLE OF ty_lifnr,
                lt_kunnr            LIKE TABLE OF ty_kunnr,
                lt_bseg             LIKE TABLE OF ty_bseg.

    CLASS-METHODS: zhfis_bsak         IMPORTING VALUE(i_operacion)         TYPE text10
                                                i_company_code             TYPE bukrs
                                                i_date_from                TYPE budat
                                                i_date_to                  TYPE budat
                                      EXPORTING VALUE(lt_listadoccompprov) LIKE lt_listadoccompprov.

    CLASS-METHODS: zhfis_bsak2        IMPORTING VALUE(i_operacion)  TYPE text10
                                                i_company_code      TYPE bukrs
                                                ls_listadoccompprov LIKE LINE OF lt_listadoccompprov
                                      EXPORTING VALUE(lt_bsakbsad)  LIKE lt_bsakbsad.

    CLASS-METHODS: zhfis_bsad         IMPORTING VALUE(i_operacion)        TYPE text10
                                                i_company_code            TYPE bukrs
                                                i_date_from               TYPE budat
                                                i_date_to                 TYPE budat
                                      EXPORTING VALUE(lt_listadoccompcli) LIKE lt_listadoccompcli.

    CLASS-METHODS: zhfis_bsad2        IMPORTING VALUE(i_operacion) TYPE text10
                                                i_company_code     TYPE bukrs
                                                ls_listadoccompcli LIKE LINE OF lt_listadoccompcli
                                      EXPORTING VALUE(lt_bsakbsad) LIKE lt_bsakbsad.

    CLASS-METHODS: zhfis_bseg         IMPORTING VALUE(i_operacion) TYPE text10
                                                ls_listadoc_fi     LIKE LINE OF lt_listadoc_fi
                                      EXPORTING VALUE(lt_bseg)     LIKE lt_bseg.

    CLASS-METHODS: zhfis_bseg2        IMPORTING VALUE(i_operacion) TYPE text10
                                                ls_listadoc        LIKE LINE OF lt_listadoccompprov
                                      EXPORTING VALUE(lt_bseg)     LIKE lt_bseg.

    CLASS-METHODS: zhfis_bseg3        IMPORTING VALUE(i_operacion) TYPE text10
                                                ls_bsakbsad        LIKE LINE OF lt_bsakbsad
                                      EXPORTING VALUE(lv_vbeln)    TYPE vbeln.

    CLASS-METHODS: zhfis_bseg4        IMPORTING VALUE(i_operacion) TYPE text10
                                                ls_listadoc        LIKE LINE OF lt_listadoccompprov
                                      EXPORTING VALUE(lt_bseg)     LIKE lt_bseg.

    CLASS-METHODS: zhfis_bkpf         IMPORTING VALUE(i_operacion) TYPE text10
                                                ls_listadoc_fi     LIKE LINE OF lt_listadoc_fi
                                      EXPORTING VALUE(lt_bkpf_fi)  LIKE lt_bkpf_fi.

    CLASS-METHODS: zhfis_bkpf2        IMPORTING VALUE(i_operacion)     TYPE text10
                                                ls_listadoc            LIKE LINE OF lt_listadoccompprov
                                      EXPORTING VALUE(lt_bkpf_tc_pago) LIKE lt_bkpf_tc_pago.

    CLASS-METHODS: zhfis_bkpf3        IMPORTING VALUE(i_operacion)   TYPE text10
                                                ls_listadoc          LIKE LINE OF lt_listadoccompprov
                                      EXPORTING VALUE(ls_docsdetiva) TYPE zst_zhfis_detiva.

    CLASS-METHODS: zhfis_lfa1         IMPORTING VALUE(i_operacion) TYPE text10
                                                lt_lifnr           LIKE lt_lifnr
                                      EXPORTING VALUE(lt_lfa1)     TYPE ztt_lfa1.

    CLASS-METHODS: zhfis_kna1         IMPORTING VALUE(i_operacion) TYPE text10
                                                lt_kunnr           LIKE lt_kunnr
                                      EXPORTING VALUE(lt_kna1)     TYPE ztt_kna1.

    CLASS-METHODS: zhfis_skb1         IMPORTING VALUE(i_operacion) TYPE text10
                                                i_company_code     TYPE bukrs
                                      EXPORTING VALUE(lt_skb1)     TYPE ztt_skb1.

    CLASS-METHODS: zhfis_item         IMPORTING VALUE(i_operacion)    TYPE text10
                                                lt_listadoc_fi        LIKE lt_listadoc_fi
                                      EXPORTING VALUE(lt_retenciones) TYPE ztt_with_item.

    CLASS-METHODS: zhfis_ztasd        IMPORTING VALUE(i_operacion)        TYPE text10
                                                ls_bsakbsad               LIKE LINE OF lt_bsakbsad
                                                lv_vbeln                  TYPE vbeln
                                                lv_fecha                  TYPE char10
                                      EXPORTING VALUE(ls_ztasd_fact_uuid) TYPE zst_fact_uuid.

    CLASS-METHODS: zhfis_zvalida      IMPORTING VALUE(i_operacion)   TYPE text10
                                                ls_bsakbsad          LIKE LINE OF lt_bsakbsad
                                      EXPORTING VALUE(ls_zvalida_fi) TYPE zst_zvalida_fi.

    CLASS-METHODS: zhfis_t012k        IMPORTING VALUE(i_operacion) TYPE text10
                                                ls_bseg            LIKE LINE OF lt_bseg
                                                ls_skb1            TYPE zst_skb1
                                      EXPORTING VALUE(ls_t012k)    TYPE zst_t012k.

    CLASS-METHODS: zhfis_t012k2       IMPORTING VALUE(i_operacion) TYPE text10
                                                ls_bseg_temp       LIKE LINE OF lt_bseg
                                                ls_skb1            TYPE zst_skb1
                                      EXPORTING VALUE(ls_t012k)    TYPE zst_t012k.

    CLASS-METHODS: zhfis_t012         IMPORTING VALUE(i_operacion) TYPE text10
                                                ls_bseg            LIKE LINE OF lt_bseg
                                                ls_skb1            TYPE zst_skb1
                                      EXPORTING VALUE(ls_t012)     TYPE zst_t012.

    CLASS-METHODS: zhfis_t012V2       IMPORTING VALUE(i_operacion) TYPE text10
                                                ls_bseg_temp       LIKE LINE OF lt_bseg
                                                ls_skb1            TYPE zst_skb1
                                      EXPORTING VALUE(ls_t012)     TYPE zst_t012.

    CLASS-METHODS: zhfis_bnka         IMPORTING VALUE(i_operacion) TYPE text10
                                                ls_t012            TYPE zst_t012
                                      EXPORTING VALUE(ls_bnka)     TYPE zst_bnka.

    CLASS-METHODS: zhfis_stxh         IMPORTING VALUE(i_operacion) TYPE text10
                                                ls_stxh            TYPE zst_stxh
                                      EXPORTING VALUE(lv_tdpras)   TYPE zst_stxh-tdspras.

    CLASS-METHODS: zhfis_detiva       IMPORTING i_bukrs      TYPE bukrs
                                                i_date_from  TYPE datum
                                                i_date_to    TYPE datum
                                      EXPORTING e_docsdetiva TYPE ztt_zhfis_detiva.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_QRY_ZHFIS_DETIVA IMPLEMENTATION.


  METHOD zhfis_bsad.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zhfis_detiva=>tys_z_i_bsadtype,
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
          ls_range_BUKRS      LIKE LINE OF lt_range_bukrs,
          lt_range_BUDAT      TYPE RANGE OF budat,
          ls_range_BUDAT      LIKE LINE OF lt_range_budat,
          lt_range_umsks      TYPE RANGE OF char1,
          ls_range_umsks      LIKE LINE OF lt_range_umsks,
          lt_range_belnr      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          ls_listadoccompcli  LIKE LINE OF lt_listadoccompcli.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_company_code.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            CLEAR lt_range_budat.
            ls_range_budat-sign = 'I'.
            ls_range_budat-option = 'BT'.
            ls_range_budat-low = i_date_from.
            ls_range_budat-high = i_date_to.
            APPEND ls_range_budat TO lt_range_budat.
            CLEAR ls_range_budat.

            CLEAR lt_range_umsks.
            ls_range_umsks-sign = 'I'.
            ls_range_umsks-option = 'EQ'.
            ls_range_umsks-low = space.
            APPEND ls_range_umsks TO lt_range_umsks.
            ls_range_umsks-low = 'A'.
            APPEND ls_range_umsks TO lt_range_umsks.
            CLEAR ls_range_umsks.

            CLEAR lt_range_belnr.
            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'CP'.
            ls_range_belnr-low = '14*'.
            APPEND ls_range_belnr TO lt_range_belnr.
            CLEAR ls_range_belnr.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSAD' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BUDAT'
                                                                    it_range             = lt_range_budat ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'UMSKS'
                                                                    it_range             = lt_range_umsks ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_belnr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR lt_listadoccompcli.

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_listadoccompcli.
              APPEND ls_listadoccompcli TO lt_listadoccompcli.
              CLEAR ls_listadoccompcli.
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


  METHOD zhfis_bsad2.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zhfis_detiva=>tys_z_i_bsadtype,
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
          ls_range_BUKRS      LIKE LINE OF lt_range_bukrs,
          lt_range_augbl      TYPE RANGE OF augbl,
          ls_range_augbl      LIKE LINE OF lt_range_augbl,
          lt_range_auggj      TYPE RANGE OF gjahr,
          ls_range_auggj      LIKE LINE OF lt_range_auggj,
          lt_range_belnr      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
*          ls_listadoccompcli  LIKE LINE OF lt_listadoccompcli,
          ls_bsakbsad         LIKE LINE OF lt_bsakbsad.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_company_code.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

*            LOOP AT lt_listadoccompcli INTO ls_listadoccompcli.
            ls_range_augbl-sign = 'I'.
            ls_range_augbl-option = 'EQ'.
            ls_range_augbl-low = ls_listadoccompcli-augbl.
            APPEND ls_range_augbl TO lt_range_augbl.
            CLEAR ls_range_augbl.

            ls_range_auggj-sign = 'I'.
            ls_range_auggj-option = 'EQ'.
            ls_range_auggj-low = ls_listadoccompcli-auggj.
            APPEND ls_range_auggj TO lt_range_auggj.
            CLEAR ls_range_auggj.

            ls_range_belnr-sign = 'E'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = ls_listadoccompcli-augbl.
            APPEND ls_range_belnr TO lt_range_belnr.
            CLEAR ls_range_belnr.
*            ENDLOOP.
            ls_range_belnr-sign = 'E'.
            ls_range_belnr-option = 'CP'.
            ls_range_belnr-low = '14*'.
            APPEND ls_range_belnr TO lt_range_belnr.
            CLEAR ls_range_belnr.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSAD' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'AUGBL'
                                                                    it_range             = lt_range_augbl ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'AUGGJ'
                                                                    it_range             = lt_range_auggj ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_belnr ).


            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR lt_bsakbsad.

            LOOP AT lt_business_data INTO DATA(ls_business_data).
*              IF ls_business_data-belnr(2) NE '15' AND ls_business_data-umsks EQ space.
              IF ls_business_data-umsks EQ space.
                MOVE-CORRESPONDING ls_business_data TO ls_bsakbsad.
                APPEND ls_bsakbsad TO lt_bsakbsad.
              ENDIF.
              CLEAR ls_bsakbsad.
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


  METHOD zhfis_bsak2.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zhfis_detiva=>tys_z_i_bsaktype,
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
          ls_range_BUKRS      LIKE LINE OF lt_range_bukrs,
          lt_range_augbl      TYPE RANGE OF augbl,
          ls_range_augbl      LIKE LINE OF lt_range_augbl,
          lt_range_auggj      TYPE RANGE OF gjahr,
          ls_range_auggj      LIKE LINE OF lt_range_auggj,
          lt_range_belnr      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          ls_bsakbsad         LIKE LINE OF lt_bsakbsad.
*          ls_listadoccompprov LIKE LINE OF lt_listadoccompprov.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_company_code.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            CLEAR: lt_range_augbl, lt_range_auggj.

*            LOOP AT lt_listadoccompprov INTO ls_listadoccompprov.
            ls_range_augbl-sign = 'I'.
            ls_range_augbl-option = 'EQ'.
            ls_range_augbl-low = ls_listadoccompprov-augbl.
            APPEND ls_range_augbl TO lt_range_augbl.
            CLEAR ls_range_augbl.

            ls_range_auggj-sign = 'I'.
            ls_range_auggj-option = 'EQ'.
            ls_range_auggj-low = ls_listadoccompprov-auggj.
            APPEND ls_range_auggj TO lt_range_auggj.
            CLEAR ls_range_auggj.

            ls_range_belnr-sign = 'E'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = ls_listadoccompprov-augbl.
            APPEND ls_range_belnr TO lt_range_belnr.
            CLEAR ls_range_belnr.
*            ENDLOOP.
            ls_range_belnr-sign = 'E'.
            ls_range_belnr-option = 'CP'.
            ls_range_belnr-low = '15*'.
            APPEND ls_range_belnr TO lt_range_belnr.
            CLEAR ls_range_belnr.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSAK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'AUGBL'
                                                                    it_range             = lt_range_augbl ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'AUGGJ'
                                                                    it_range             = lt_range_auggj ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_belnr ).


            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR lt_bsakbsad.

            LOOP AT lt_business_data INTO DATA(ls_business_data).
*              IF ls_business_data-belnr(2) NE '15' AND ls_business_data-umsks EQ space.
              IF ls_business_data-umsks EQ space.
                MOVE-CORRESPONDING ls_business_data TO ls_bsakbsad.
                APPEND ls_bsakbsad TO lt_bsakbsad.
              ENDIF.
              CLEAR ls_bsakbsad.
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


  METHOD zhfis_bseg.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zhfis_detiva=>tys_z_i_bsegtype,
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
          lt_range_BUKRS      TYPE RANGE OF bukrs,
          ls_range_BUKRS      LIKE LINE OF lt_range_bukrs,
          lt_range_belnr      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          lt_range_gjahr      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
*          ls_listadoc_fi      LIKE LINE OF lt_listadoc_fi,
          ls_bseg             LIKE LINE OF lt_bseg.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_bukrs, lt_range_belnr, lt_range_gjahr.

*            LOOP AT lt_listadoc_fi INTO ls_listadoc_fi.

            CLEAR lt_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = ls_listadoc_fi-bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = ls_listadoc_fi-belnr.
            APPEND ls_range_belnr TO lt_range_belnr.
            CLEAR ls_range_belnr.

            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = ls_listadoc_fi-gjahr.
            APPEND ls_range_gjahr TO lt_range_gjahr.
            CLEAR ls_range_gjahr.

*            ENDLOOP.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSEG' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_belnr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR lt_listadoccompprov.

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_bseg.
              APPEND ls_bseg TO lt_bseg.
              CLEAR ls_bseg.
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


  METHOD zhfis_bseg2.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zhfis_detiva=>tys_z_i_bsegtype,
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
          lt_range_BUKRS      TYPE RANGE OF bukrs,
          ls_range_BUKRS      LIKE LINE OF lt_range_bukrs,
          lt_range_augbl      TYPE RANGE OF augbl,
          ls_range_augbl      LIKE LINE OF lt_range_augbl,
          lt_range_auggj      TYPE RANGE OF gjahr,
          ls_range_auggj      LIKE LINE OF lt_range_auggj,
*          ls_listadoc         LIKE LINE OF lt_listadoc,
          ls_bseg             LIKE LINE OF lt_bseg.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_bukrs, lt_range_augbl, lt_range_auggj.

*            LOOP AT lt_listadoc INTO ls_listadoc.

            CLEAR lt_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = ls_listadoc-bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            ls_range_augbl-sign = 'I'.
            ls_range_augbl-option = 'EQ'.
            ls_range_augbl-low = ls_listadoc-augbl.
            APPEND ls_range_augbl TO lt_range_augbl.
            CLEAR ls_range_augbl.

            ls_range_auggj-sign = 'I'.
            ls_range_auggj-option = 'EQ'.
            ls_range_auggj-low = ls_listadoc-auggj.
            APPEND ls_range_auggj TO lt_range_auggj.
            CLEAR ls_range_auggj.

*            ENDLOOP.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSEG' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'AUGBL'
                                                                    it_range             = lt_range_augbl ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'AUGGJ'
                                                                    it_range             = lt_range_auggj ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_bseg.
              APPEND ls_bseg TO lt_bseg.
              CLEAR ls_bseg.
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


  METHOD zhfis_bkpf.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zhfis_detiva=>tys_z_i_bkpftype,
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
          lt_range_BUKRS      TYPE RANGE OF bukrs,
          ls_range_BUKRS      LIKE LINE OF lt_range_bukrs,
          lt_range_belnr      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          lt_range_gjahr      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
*          ls_listadoc_fi      LIKE LINE OF lt_listadoc_fi,
          ls_bkpf_fi          LIKE LINE OF lt_bkpf_fi.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_bukrs, lt_range_belnr, lt_range_gjahr.

*            LOOP AT lt_listadoc_fi INTO ls_listadoc_fi.

            CLEAR lt_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = ls_listadoc_fi-bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = ls_listadoc_fi-belnr.
            APPEND ls_range_belnr TO lt_range_belnr.
            CLEAR ls_range_belnr.

            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = ls_listadoc_fi-gjahr.
            APPEND ls_range_gjahr TO lt_range_gjahr.
            CLEAR ls_range_gjahr.

*            ENDLOOP.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BKPF' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_belnr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR lt_listadoccompprov.

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              IF ls_business_data-xreversal EQ space.
                MOVE-CORRESPONDING ls_business_data TO ls_bkpf_fi.
                APPEND ls_bkpf_fi TO lt_bkpf_fi.
              ENDIF.
              CLEAR ls_bkpf_fi.
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


  METHOD zhfis_ztasd.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_zhfis_detiva=>tys_z_i_ztasd_fact_uuidtype,
          ls_business_data TYPE zscm_zhfis_detiva=>tys_z_i_ztasd_fact_uuidtype,
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
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs     = ls_bsakbsad-bukrs
                      vbeln     = lv_vbeln
                      fecha     = lv_fecha ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ZTASD_FACT_UUID' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            MOVE-CORRESPONDING ls_business_data TO ls_ztasd_fact_uuid.

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


  METHOD zhfis_t012k2.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zhfis_detiva=>tys_z_i_t_012_ktype,
          ls_business_data TYPE zscm_zhfis_detiva=>tys_z_i_t_012_ktype,
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
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = ls_bseg_temp-bukrs
                      hbkid  = ls_skb1-hbkid
                      hktid  = ls_skb1-hktid ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_012_K' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            MOVE-CORRESPONDING ls_business_data TO ls_t012k.

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


  METHOD zhfis_bkpf2.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zhfis_detiva=>tys_z_i_bkpftype,
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
          lt_range_BUKRS      TYPE RANGE OF bukrs,
          ls_range_BUKRS      LIKE LINE OF lt_range_bukrs,
          lt_range_augbl      TYPE RANGE OF augbl,
          ls_range_augbl      LIKE LINE OF lt_range_augbl,
          lt_range_auggj      TYPE RANGE OF gjahr,
          ls_range_auggj      LIKE LINE OF lt_range_auggj,
*          ls_listadoc         LIKE LINE OF lt_listadoc,
          ls_bkpf_tc_pago     LIKE LINE OF lt_bkpf_tc_pago.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_bukrs, lt_range_augbl, lt_range_auggj.

*            LOOP AT lt_listadoc INTO ls_listadoc.

            CLEAR lt_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = ls_listadoc-bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            ls_range_augbl-sign = 'I'.
            ls_range_augbl-option = 'EQ'.
            ls_range_augbl-low = ls_listadoc-augbl.
            APPEND ls_range_augbl TO lt_range_augbl.
            CLEAR ls_range_augbl.

            ls_range_auggj-sign = 'I'.
            ls_range_auggj-option = 'EQ'.
            ls_range_auggj-low = ls_listadoc-auggj.
            APPEND ls_range_auggj TO lt_range_auggj.
            CLEAR ls_range_auggj.

*            ENDLOOP.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BKPF' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'AUGBL'
                                                                    it_range             = lt_range_augbl ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'AUGGJ'
                                                                    it_range             = lt_range_auggj ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR lt_listadoccompprov.

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_bkpf_tc_pago.
              APPEND ls_bkpf_tc_pago TO lt_bkpf_tc_pago.
              CLEAR ls_bkpf_tc_pago.
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


  METHOD zhfis_lfa1.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zhfis_detiva=>tys_z_i_lfa_1_type,
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
          lt_range_lifnr      TYPE RANGE OF lifnr,
          ls_range_lifnr      LIKE LINE OF lt_range_lifnr,
          ls_lfa1             LIKE LINE OF lt_lfa1,
          ls_lifnr            LIKE LINE OF lt_lifnr.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_lifnr.

            LOOP AT lt_lifnr INTO ls_lifnr.

              CLEAR lt_range_lifnr.
              ls_range_lifnr-sign = 'I'.
              ls_range_lifnr-option = 'EQ'.
              ls_range_lifnr-low = ls_lifnr-lifnr.
              APPEND ls_range_lifnr TO lt_range_lifnr.
              CLEAR ls_range_lifnr.

            ENDLOOP.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LFA_1' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'LIFNR'
                                                                    it_range             = lt_range_lifnr ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR lt_listadoccompprov.

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_lfa1.
              APPEND ls_lfa1 TO lt_lfa1.
              CLEAR ls_lfa1.
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


  METHOD zhfis_bseg4.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zhfis_detiva=>tys_z_i_bsegtype,
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
          lt_range_BUKRS      TYPE RANGE OF bukrs,
          ls_range_BUKRS      LIKE LINE OF lt_range_bukrs,
          lt_range_belnr      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          lt_range_gjahr      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
          ls_bseg             LIKE LINE OF lt_bseg.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_bukrs, lt_range_belnr, lt_range_gjahr.

            CLEAR lt_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = ls_listadoc-bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = ls_listadoc-belnr.
            APPEND ls_range_belnr TO lt_range_belnr.
            CLEAR ls_range_belnr.

            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = ls_listadoc-gjahr.
            APPEND ls_range_gjahr TO lt_range_gjahr.
            CLEAR ls_range_gjahr.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSEG' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_belnr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_bseg.
              APPEND ls_bseg TO lt_bseg.
              CLEAR ls_bseg.
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


  METHOD zhfis_kna1.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zhfis_detiva=>tys_z_i_kna_1_type,
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
          lt_range_kunnr      TYPE RANGE OF kunnr,
          ls_range_kunnr      LIKE LINE OF lt_range_kunnr,
          ls_kna1             LIKE LINE OF lt_kna1,
          ls_kunnr            LIKE LINE OF lt_kunnr.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_kunnr.

            LOOP AT lt_lifnr INTO ls_kunnr.

              CLEAR lt_range_kunnr.
              ls_range_kunnr-sign = 'I'.
              ls_range_kunnr-option = 'EQ'.
              ls_range_kunnr-low = ls_kunnr-kunnr.
              APPEND ls_range_kunnr TO lt_range_kunnr.
              CLEAR ls_range_kunnr.

            ENDLOOP.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_KNA_1' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'KUNNR'
                                                                    it_range             = lt_range_kunnr ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR lt_listadoccompprov.

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_kna1.
              APPEND ls_kna1 TO lt_kna1.
              CLEAR ls_kna1.
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


  METHOD zhfis_skb1.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zhfis_detiva=>tys_z_i_skb_1_type,
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
          lt_range_BUKRS      TYPE RANGE OF bukrs,
          ls_range_BUKRS      LIKE LINE OF lt_range_bukrs,
          ls_skb1             LIKE LINE OF lt_skb1.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_bukrs.

            LOOP AT lt_lifnr INTO ls_range_bukrs.

              CLEAR lt_range_bukrs.
              ls_range_bukrs-sign = 'I'.
              ls_range_bukrs-option = 'EQ'.
              ls_range_bukrs-low = i_company_code.
              APPEND ls_range_bukrs TO lt_range_bukrs.
              CLEAR ls_range_bukrs.

            ENDLOOP.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_SKB_1' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_bukrs ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR lt_listadoccompprov.

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              IF ls_business_data-hbkid NE space.
                MOVE-CORRESPONDING ls_business_data TO ls_skb1.
                APPEND ls_skb1 TO lt_skb1.
              ENDIF.
              CLEAR ls_skb1.
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


  METHOD zhfis_item.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zhfis_detiva=>tys_z_i_skb_1_type,
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
          lt_range_BUKRS      TYPE RANGE OF bukrs,
          ls_range_BUKRS      LIKE LINE OF lt_range_bukrs,
          lt_range_belnr      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          lt_range_gjahr      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
          ls_listadoc_fi      LIKE LINE OF lt_listadoc_fi,
          ls_retenciones      LIKE LINE OF lt_retenciones.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_bukrs.

            LOOP AT lt_listadoc_fi INTO ls_listadoc_fi.

              CLEAR lt_range_bukrs.
              ls_range_bukrs-sign = 'I'.
              ls_range_bukrs-option = 'EQ'.
              ls_range_bukrs-low = ls_listadoc_fi-bukrs.
              APPEND ls_range_bukrs TO lt_range_bukrs.
              CLEAR ls_range_bukrs.

              ls_range_belnr-sign = 'I'.
              ls_range_belnr-option = 'EQ'.
              ls_range_belnr-low = ls_listadoc_fi-belnr.
              APPEND ls_range_belnr TO lt_range_belnr.
              CLEAR ls_range_belnr.

              ls_range_gjahr-sign = 'I'.
              ls_range_gjahr-option = 'EQ'.
              ls_range_gjahr-low = ls_listadoc_fi-gjahr.
              APPEND ls_range_gjahr TO lt_range_gjahr.
              CLEAR ls_range_gjahr.

            ENDLOOP.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_WITH_ITEM' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_belnr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR lt_listadoccompprov.

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_retenciones.
              APPEND ls_retenciones TO lt_retenciones.
              CLEAR ls_retenciones  .
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


  METHOD zhfis_bseg3.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_zhfis_detiva=>tys_z_i_bsegtype,
          ls_business_data TYPE zscm_zhfis_detiva=>tys_z_i_bsegtype,
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
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = ls_bsakbsad-bukrs
                      belnr  = ls_bsakbsad-belnr
                      gjahr  = ls_bsakbsad-gjahr
                      buzei  = ls_bsakbsad-buzei ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSEG' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            lv_vbeln = ls_business_data-vbeln.

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


  METHOD zhfis_zvalida.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_zhfis_detiva=>tys_z_i_zvalida_fitype,
          ls_business_data TYPE zscm_zhfis_detiva=>tys_z_i_zvalida_fitype,
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
                                              proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = ls_bsakbsad-bukrs
                      belnr  = ls_bsakbsad-belnr
                      gjahr  = ls_bsakbsad-gjahr ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'SAP_COVER_PAGE_SET' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            MOVE-CORRESPONDING ls_business_data TO ls_zvalida_fi.

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


  METHOD zhfis_t012k.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zhfis_detiva=>tys_z_i_t_012_ktype,
          ls_business_data TYPE zscm_zhfis_detiva=>tys_z_i_t_012_ktype,
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
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = ls_bseg-bukrs
                      hbkid  = ls_skb1-hbkid
                      hktid  = ls_skb1-hktid ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_012_K' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            MOVE-CORRESPONDING ls_business_data TO ls_t012k.

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


  METHOD zhfis_t012.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zhfis_detiva=>tys_z_i_t_012_type,
          ls_business_data TYPE zscm_zhfis_detiva=>tys_z_i_t_012_type,
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
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = ls_bseg-bukrs
                      hbkid  = ls_skb1-hbkid ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_012_K' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            MOVE-CORRESPONDING ls_business_data TO ls_t012.

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


  METHOD zhfis_t012V2.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zhfis_detiva=>tys_z_i_t_012_type,
          ls_business_data TYPE zscm_zhfis_detiva=>tys_z_i_t_012_type,
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
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = ls_bseg_temp-bukrs
                      hbkid  = ls_skb1-hbkid ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_012_K' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            MOVE-CORRESPONDING ls_business_data TO ls_t012.

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


  METHOD zhfis_bnka.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zhfis_detiva=>tys_z_i_bnkatype,
          ls_business_data TYPE zscm_zhfis_detiva=>tys_z_i_bnkatype,
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
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      banks  = ls_t012-banks
                      bankl  = ls_t012-bankl ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BNKA' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            MOVE-CORRESPONDING ls_business_data TO ls_bnka.

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


  METHOD zhfis_stxh.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:

          ls_entity_key    TYPE zscm_zhfis_detiva=>tys_z_i_stxhtype,
          ls_business_data TYPE zscm_zhfis_detiva=>tys_z_i_stxhtype,
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
                                         proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                         proxy_model_version = '0001' )
    io_http_client             = lo_http_client
    iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                                  tdobject    = ls_stxh-tdobject
                                  tdname      = ls_stxh-tdname
                                  tdid        = ls_stxh-tdid ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_STXH' )->navigate_with_key( ls_entity_key ).

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


  METHOD zhfis_bkpf3.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zhfis_detiva=>tys_z_i_bkpftype,
          ls_business_data TYPE zscm_zhfis_detiva=>tys_z_i_bkpftype,
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
                                              proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = ls_listadoc-bukrs
                      belnr  = ls_listadoc-belnr
                      gjahr  = ls_listadoc-gjahr ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BKPF' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            ls_docsdetiva-fecha_pago = ls_business_data-bldat.
            ls_docsdetiva-kursf = ls_business_data-kursf.

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


  METHOD zhfis_bsak.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zhfis_detiva=>tys_z_i_bsaktype,
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
          ls_range_BUKRS      LIKE LINE OF lt_range_bukrs,
          lt_range_BUDAT      TYPE RANGE OF budat,
          ls_range_BUDAT      LIKE LINE OF lt_range_budat,
          lt_range_umsks      TYPE RANGE OF char1,
          ls_range_umsks      LIKE LINE OF lt_range_umsks,
          lt_range_belnr      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          ls_listadoccompprov LIKE LINE OF lt_listadoccompprov.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZHFIS_DETIVA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZHFIS_DETIVA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_company_code.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            CLEAR lt_range_budat.
            ls_range_budat-sign = 'I'.
            ls_range_budat-option = 'BT'.
            ls_range_budat-low = i_date_from.
            ls_range_budat-high = i_date_to.
            APPEND ls_range_budat TO lt_range_budat.
            CLEAR ls_range_budat.

            CLEAR lt_range_umsks.
            ls_range_umsks-sign = 'I'.
            ls_range_umsks-option = 'EQ'.
            ls_range_umsks-low = space.
            APPEND ls_range_umsks TO lt_range_umsks.
            ls_range_umsks-low = 'A'.
            APPEND ls_range_umsks TO lt_range_umsks.
            CLEAR ls_range_umsks.

            CLEAR lt_range_belnr.
            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'CP'.
            ls_range_belnr-low = '15*'.
            APPEND ls_range_belnr TO lt_range_belnr.
            CLEAR ls_range_belnr.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSAK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BUDAT'
                                                                    it_range             = lt_range_budat ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'UMSKS'
                                                                    it_range             = lt_range_umsks ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_belnr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR lt_listadoccompprov.

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_listadoccompprov.
              APPEND ls_listadoccompprov TO lt_listadoccompprov.
              CLEAR ls_listadoccompprov.
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


  METHOD zhfis_detiva.


    DATA:
      lt_business_data TYPE TABLE OF zscm_zhfis_detiva2=>ty_deep,
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
      lt_range_bukrs      TYPE RANGE OF bukrs,
      ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
      lt_range_date_from  TYPE RANGE OF datum,
      ls_range_date_from  LIKE LINE OF lt_range_date_from,
      lt_range_date_to    TYPE RANGE OF datum,
      ls_range_date_to    LIKE LINE OF lt_range_date_to,
      ls_docsdetiva       LIKE LINE OF e_docsdetiva.


    TRY.
        " Create http client
        DATA lv_dest TYPE string.
        SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSCM_ZHFIS_DETIVA2'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_ZHFIS_DETIVA_SRV' ).

        ASSERT lo_http_client IS BOUND.

        ls_range_bukrs-sign = 'I'.
        ls_range_bukrs-option = 'EQ'.
        ls_range_bukrs-low = i_bukrs.
        APPEND ls_range_bukrs TO lt_range_bukrs.

        ls_range_date_from-sign = 'I'.
        ls_range_date_from-option = 'EQ'.
        ls_range_date_from-low = i_date_from.
        APPEND ls_range_date_from TO lt_range_date_from.

        ls_range_date_to-sign = 'I'.
        ls_range_date_to-option = 'EQ'.
        ls_range_date_to-low = i_date_to.
        APPEND ls_range_date_to TO lt_range_date_to.


        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_read( ).

        DATA(lo_expand) = lo_request->create_expand_node(  ).
        lo_expand->add_expand( 'HEADERTODOCS' ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'COMPANY'
                                                                it_range             = lt_range_bukrs ).
        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'DATE_FROM'
                                                                it_range             = lt_range_date_from ).
        lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'DATE_TO'
                                                                it_range             = lt_range_date_to ).

        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
        lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
        IF sy-subrc = 0.
          LOOP AT ls_business_data-headertodocs INTO DATA(ls_headertodocs).
            MOVE-CORRESPONDING ls_headertodocs TO ls_docsdetiva.
            APPEND ls_docsdetiva TO e_docsdetiva.
            CLEAR ls_docsdetiva.
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
