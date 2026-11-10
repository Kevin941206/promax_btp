CLASS zcl_qry_zfiglmx_journal_detail DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-DATA:
      BEGIN OF ty_bseg,
        bukrs TYPE zst_bseg-bukrs,
        belnr TYPE zst_bseg-belnr,
        gjahr TYPE zst_bseg-gjahr,
        buzei TYPE zst_bseg-buzei,
        koart TYPE zst_bseg-koart,
        shkzg TYPE zst_bseg-shkzg,
        mwskz TYPE zst_bseg-mwskz,
        dmbtr TYPE zst_bseg-dmbtr,
        wrbtr TYPE zst_bseg-wrbtr,
        sgtxt TYPE zst_bseg-sgtxt,
        hkont TYPE zst_bseg-hkont,
        kunnr TYPE zst_bseg-kunnr,
        lifnr TYPE zst_bseg-lifnr,
        empfb TYPE zst_bseg-empfb,
        fwbas TYPE zst_bseg-fwbas,
        qsskz TYPE zst_bseg-qsskz,
      END OF ty_bseg.

    CLASS-DATA: lt_bseg  LIKE TABLE OF ty_bseg.

    CLASS-METHODS: detail_zcrp_cuentas_imp IMPORTING VALUE(i_operacion)    TYPE text10
                                           EXPORTING VALUE(lt_cuentas_imp) TYPE ztt_zcrp_cuentas_imp.

    CLASS-METHODS: detail_bkpf             IMPORTING VALUE(i_operacion) TYPE text10
                                                     i_company          TYPE bukrs
                                                     i_doc_number       TYPE belnr_d
                                                     i_year             TYPE gjahr
                                           EXPORTING VALUE(ls_bkpf)     TYPE zst_bkpf.

    CLASS-METHODS: detail_bkpf2            IMPORTING VALUE(i_operacion) TYPE text10
                                                     i_company          TYPE bukrs
                                                     i_doc_number       TYPE belnr_d
                                                     i_year             TYPE gjahr
                                           EXPORTING VALUE(lv_bktxt)    TYPE bktxt
                                                     lv_bldat           TYPE bldat.

    CLASS-METHODS: detail_bkpf3            IMPORTING VALUE(i_operacion) TYPE text10
                                                     i_company          TYPE bukrs
                                                     i_doc_number       TYPE belnr_d
                                                     i_year             TYPE gjahr
                                                     i_cpudt            TYPE datum
                                           EXPORTING VALUE(ls_bkpf)     TYPE zst_bkpf.

    CLASS-METHODS: detail_bseg             IMPORTING VALUE(i_operacion) TYPE text10
                                                     ls_bkpf            TYPE zst_bkpf
                                           EXPORTING VALUE(lt_bseg)     LIKE lt_bseg.

    CLASS-METHODS: detail_bseg2            IMPORTING VALUE(i_operacion) TYPE text10
                                                     ls_comp            TYPE zst_bse_clr
                                           EXPORTING VALUE(lv_rebzg)    TYPE zst_bseg-rebzg
                                                     lv_rebzj           TYPE zst_bseg-rebzj
                                                     lv_rebzz           TYPE zst_bseg-rebzz.

    CLASS-METHODS: detail_bseg3            IMPORTING VALUE(i_operacion) TYPE text10
                                                     ls_bkpf            TYPE zst_bkpf
                                                     lv_item            TYPE zst_bseg-buzei
                                           EXPORTING VALUE(lv_zuonr)    TYPE zst_bseg-zuonr
                                                     lv_vbeln           TYPE vbeln.

    CLASS-METHODS: detail_bseg4            IMPORTING VALUE(i_operacion) TYPE text10
                                                     i_company          TYPE bukrs
                                                     i_doc_number       TYPE belnr_d
                                                     i_year             TYPE gjahr
                                                     i_item             TYPE buzei
                                           EXPORTING VALUE(lv_total)    TYPE wrbtr.

    CLASS-METHODS: detail_bseg5            IMPORTING VALUE(i_operacion) TYPE text10
                                                     ls_bkpf            TYPE zst_bkpf
                                                     lt_racct           TYPE zvtt_fagl_range_racct
                                           EXPORTING VALUE(lt_bseg)     LIKE lt_bseg.

    CLASS-METHODS: detail_bseg6            IMPORTING VALUE(i_operacion) TYPE text10
                                                     i_company          TYPE bukrs
                                                     i_doc_number       TYPE belnr_d
                                                     i_year             TYPE gjahr
                                           EXPORTING VALUE(lv_total)    TYPE wrbtr.

    CLASS-METHODS: detail_kna1             IMPORTING VALUE(i_operacion) TYPE text10
                                                     lv_kunnr           TYPE kunnr
                                           EXPORTING VALUE(ls_kna1)     TYPE zst_kna1.

    CLASS-METHODS: detail_lfa1             IMPORTING VALUE(i_operacion) TYPE text10
                                                     lv_lifnr           TYPE lifnr
                                           EXPORTING VALUE(ls_lfa1)     TYPE zst_lfa1.

    CLASS-METHODS: detail_/AIF/T_MVMApval  IMPORTING VALUE(i_operacion)        TYPE text10
                                                     lv_int_value              TYPE kunnr
                                           EXPORTING VALUE(ls_/AIF/T_MVMApval) TYPE zst_AIF_T_MVMApval.

    CLASS-METHODS: detail_/AIF/T_MVMApval2 IMPORTING VALUE(i_operacion)        TYPE text10
                                                     lv_int_value              TYPE dzterm
                                           EXPORTING VALUE(ls_/AIF/T_MVMApval) TYPE zst_AIF_T_MVMApval.

    CLASS-METHODS: detail_/AIF/T_MVMApval3 IMPORTING VALUE(i_operacion)        TYPE text10
                                                     lv_int_value              TYPE zst_vbrk-zlsch
                                           EXPORTING VALUE(ls_/AIF/T_MVMApval) TYPE zst_AIF_T_MVMApval.

    CLASS-METHODS: detail_dfkkbptaxnum     IMPORTING VALUE(i_operacion)     TYPE text10
                                                     lv_partner             TYPE kunnr
                                           EXPORTING VALUE(ls_dfkkbptaxnum) TYPE zst_dfkkbptaxnum.

    CLASS-METHODS: detail_but051           IMPORTING VALUE(i_operacion) TYPE text10
                                                     lv_partner         TYPE zbu_partner
                                           EXPORTING VALUE(lt_but051)   TYPE ztt_but051.

    CLASS-METHODS: detail_but051V2         IMPORTING VALUE(i_operacion) TYPE text10
                                                     lv_partner         TYPE zbu_partner
                                                     lv_abtnr           TYPE char4
                                           EXPORTING VALUE(lt_but051)   TYPE ztt_but051.

    CLASS-METHODS: detail_adrc             IMPORTING VALUE(i_operacion)    TYPE text10
                                                     lv_adrnr              TYPE char10
                                           EXPORTING VALUE(lv_vendor_type) TYPE char20.

    CLASS-METHODS: detail_adrc2            IMPORTING VALUE(i_operacion) TYPE text10
                                                     lv_adrnr           TYPE char10
                                           EXPORTING VALUE(ls_adrc)     TYPE zst_adrc.

    CLASS-METHODS: detail_adr6             IMPORTING VALUE(i_operacion) TYPE text10
                                                     lv_prsnr           TYPE ad_persnum
                                           EXPORTING VALUE(lv_smtp)     TYPE zad_smtpadr.

    CLASS-METHODS: detail_t001             IMPORTING VALUE(i_operacion) TYPE text10
                                                     lv_bukrs           TYPE bukrs
                                           EXPORTING VALUE(lv_adrnr)    TYPE char10.

    CLASS-METHODS: detail_t001z            IMPORTING VALUE(i_operacion) TYPE text10
                                                     lv_bukrs           TYPE bukrs
                                           EXPORTING VALUE(lv_paval)    TYPE stcd1.

    CLASS-METHODS: detail_stxh             IMPORTING VALUE(i_operacion) TYPE text10
                                                     ls_stxh            TYPE zst_stxh
                                           EXPORTING VALUE(lv_tdspras)  TYPE spras.

    CLASS-METHODS: detail_reguh            IMPORTING VALUE(i_operacion) TYPE text10
                                                     lv_date_from       TYPE sy-datum
                                                     lv_date_to         TYPE sy-datum
                                                     ls_bkpf            TYPE zst_bkpf
                                           EXPORTING VALUE(ls_reguh)    TYPE zst_reguh.

    CLASS-METHODS: detail_bnka             IMPORTING VALUE(i_operacion) TYPE text10
                                                     ls_reguh           TYPE zst_reguh
                                           EXPORTING VALUE(ls_bnka)     TYPE zst_bnka.

    CLASS-METHODS: detail_bnka2            IMPORTING VALUE(i_operacion) TYPE text10
                                                     ls_t012            TYPE zst_t012
                                           EXPORTING VALUE(ls_bnka)     TYPE zst_bnka.

    CLASS-METHODS: detail_t042z            IMPORTING VALUE(i_operacion) TYPE text10
                                                     lv_rzawe           TYPE char1
                                           EXPORTING VALUE(ls_t042z)    TYPE zst_t042z.

    CLASS-METHODS: detail_zfiglmx_crp_aa   IMPORTING VALUE(i_operacion) TYPE text10
                                                     lv_bktxt           TYPE bktxt
                                           EXPORTING VALUE(ls_crp_aa)   TYPE zst_zfiglmx_crp_aa.

    CLASS-METHODS: detail_knvk             IMPORTING VALUE(i_operacion) TYPE text10
                                                     lv_lifnr           TYPE lifnr
                                                     lv_abtnr           TYPE char4
                                           EXPORTING VALUE(ls_knvk)     TYPE zst_knvk.

    CLASS-METHODS: detail_skb1             IMPORTING VALUE(i_operacion) TYPE text10
                                                     lv_bukrs           TYPE bukrs
                                                     lv_saknr           TYPE hkont
                                           EXPORTING VALUE(ls_skb1)     TYPE zst_skb1.

    CLASS-METHODS: detail_t012k            IMPORTING VALUE(i_operacion) TYPE text10
                                                     lv_bukrs           TYPE bukrs
                                                     lv_hbkid           TYPE hbkid
                                                     lv_hktid           TYPE hktid
                                           EXPORTING VALUE(ls_t012k)    TYPE zst_t012k.

    CLASS-METHODS: detail_t012             IMPORTING VALUE(i_operacion) TYPE text10
                                                     lv_bukrs           TYPE bukrs
                                                     lv_hbkid           TYPE hbkid
                                           EXPORTING VALUE(ls_t012)     TYPE zst_t012.

    CLASS-METHODS: detail_zcrp_account    IMPORTING VALUE(i_operacion) TYPE text10
                                                    lv_hkont           TYPE hkont
                                          EXPORTING VALUE(v_hkont)     TYPE hkont.

    CLASS-METHODS: detail_bse_clr         IMPORTING VALUE(i_operacion) TYPE text10
                                                    lv_bukrs           TYPE bukrs
                                                    lv_belnr           TYPE belnr_d
                                                    lv_gjahr           TYPE gjahr
                                                    lv_koart           TYPE koart
                                                    lv_shkzg           TYPE shkzg
                                          EXPORTING VALUE(lt_bse_clr)  TYPE ztt_bse_clr.

    CLASS-METHODS: detail_bse_clr2        IMPORTING VALUE(i_operacion) TYPE text10
                                                    lv_bukrs           TYPE bukrs
                                                    lv_belnr           TYPE belnr_d
                                                    lv_gjahr           TYPE gjahr
                                                    lv_buzei           TYPE buzei
                                          EXPORTING VALUE(lt_bse_clr)  TYPE ztt_bse_clr.

    CLASS-METHODS: detail_with_item       IMPORTING VALUE(i_operacion) TYPE text10
                                                    lv_bukrs           TYPE bukrs
                                                    lv_belnr           TYPE belnr_d
                                                    lv_gjahr           TYPE gjahr
                                          EXPORTING VALUE(lt_with)     TYPE ztt_with_item.

    CLASS-METHODS: detail_vbrk            IMPORTING VALUE(i_operacion) TYPE text10
                                                    lv_vbeln           TYPE vbeln
                                          EXPORTING VALUE(ls_vbrk)     TYPE zst_vbrk.

    CLASS-METHODS: detail_edocument       IMPORTING VALUE(i_operacion) TYPE text10
                                                    lv_vbeln           TYPE vbeln
                                          EXPORTING VALUE(ls_edocumen) TYPE zst_edocument.

    CLASS-METHODS: detail_edomxinvoice    IMPORTING VALUE(i_operacion) TYPE text10
                                                    lv_edoc_guid       TYPE zst_edocument-edoc_guid
                                          EXPORTING VALUE(ls_edomxinv) TYPE zst_edomxinvoice.

    CLASS-METHODS: detail_ytasd_fact_uuid IMPORTING VALUE(i_operacion) TYPE text10
                                                    lv_vbeln           TYPE vbeln
                                                    lv_bukrs           TYPE bukrs
                                                    lv_fecha           TYPE char10
                                          EXPORTING VALUE(ls_fac_uuid) TYPE ytasd_fact_uuid.

    CLASS-METHODS: detail_yvalida_fi      IMPORTING VALUE(i_operacion) TYPE text10
                                                    lv_bukrs           TYPE bukrs
                                                    lv_belnr           TYPE belnr_d
                                                    lv_gjahr           TYPE gjahr
                                          EXPORTING VALUE(ls_yvalida)  TYPE yvalida_fi.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_QRY_ZFIGLMX_JOURNAL_DETAIL IMPLEMENTATION.


  METHOD detail_bkpf.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_bkpftype,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_bkpftype,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = i_company
                      belnr  = i_doc_number
                      gjahr  = i_year ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BKPF' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            MOVE-CORRESPONDING ls_business_data TO ls_bkpf.

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


  METHOD detail_bseg.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_journal_detail=>tys_z_i_bsegtype,
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
                                              proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = ls_bkpf-bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            CLEAR lt_range_belnr.
            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = ls_bkpf-belnr.
            APPEND ls_range_belnr TO lt_range_belnr.
            CLEAR ls_range_belnr.

            CLEAR lt_range_gjahr.
            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = ls_bkpf-gjahr.
            APPEND ls_range_gjahr TO lt_range_gjahr.
            CLEAR ls_range_gjahr.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSEG' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_BELNR ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

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


  METHOD detail_with_item.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_journal_detail=>tys_z_i_with_itemtype,
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
          lt_range_bukrs      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_belnr      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          lt_range_gjahr      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
          ls_with_item        LIKE LINE OF lt_with.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = lv_bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            CLEAR lt_range_belnr.
            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = lv_belnr.
            APPEND ls_range_belnr TO lt_range_belnr.
            CLEAR ls_range_belnr.

            CLEAR lt_range_gjahr.
            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = lv_gjahr.
            APPEND ls_range_gjahr TO lt_range_gjahr.
            CLEAR ls_range_gjahr.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSE_CLR' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_BELNR ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).


            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_with_item.
              ls_with_item-wt_accbs1 = ls_business_data-wt_accbs_1.
              ls_with_item-wt_accbs2 = ls_business_data-wt_accbs_2.
              ls_with_item-text15    = ls_business_data-text_15.
              ls_with_item-wt_accwt1 = ls_business_data-wt_accwt_1.
              ls_with_item-wt_accwt2 = ls_business_data-wt_accwt_2.
              APPEND ls_with_item TO lt_with.
              CLEAR ls_with_item.
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


  METHOD detail_bseg3.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_journal_detail=>tys_z_i_bsegtype,
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
          lt_range_bukrs      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_belnr      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          lt_range_gjahr      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
          lt_range_buzei      TYPE RANGE OF buzei,
          ls_range_buzei      LIKE LINE OF lt_range_buzei.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = ls_bkpf-bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.

            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = ls_bkpf-belnr.
            APPEND ls_range_belnr TO lt_range_belnr.

            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = ls_bkpf-gjahr.
            APPEND ls_range_gjahr TO lt_range_gjahr.

            ls_range_buzei-sign = 'I'.
            ls_range_buzei-option = 'EQ'.
            ls_range_buzei-low = lv_item.
            APPEND ls_range_buzei TO lt_range_buzei.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSEG' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_BELNR ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BUZEI'
                                                                    it_range             = lt_range_buzei ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            lv_zuonr = ls_business_data-zuonr.
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


  METHOD detail_kna1.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_kna_1_type,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_kna_1_type,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      kunnr  = lv_kunnr ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_KNA_1' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            MOVE-CORRESPONDING ls_business_data TO ls_kna1.
            ls_kna1-name1 = ls_business_data-name_1.
            ls_kna1-name2 = ls_business_data-name_2.
            ls_kna1-name3 = ls_business_data-name_3.
            ls_kna1-name4 = ls_business_data-name_4.
            ls_kna1-stcd1 = ls_business_data-stcd_1.
            ls_kna1-stcd2 = ls_business_data-stcd_2.
            ls_kna1-stcd3 = ls_business_data-stcd_3.
            ls_kna1-stcd4 = ls_business_data-stcd_4.
            ls_kna1-land1 = ls_business_data-land_1.

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


  METHOD detail_bse_clr2.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_journal_detail=>tys_z_i_bse_clrtype,
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
          lt_range_bukrs_clr  TYPE RANGE OF bukrs,
          ls_range_bukrs_clr  LIKE LINE OF lt_range_bukrs_clr,
          lt_range_belnr_clr  TYPE RANGE OF belnr_d,
          ls_range_belnr_clr  LIKE LINE OF lt_range_belnr_clr,
          lt_range_gjahr_clr  TYPE RANGE OF gjahr,
          ls_range_gjahr_clr  LIKE LINE OF lt_range_gjahr_clr,
          lt_range_buzei_clr  TYPE RANGE OF koart,
          ls_range_buzei_clr  LIKE LINE OF lt_range_buzei_clr,
          lS_bse_clr          LIKE LINE OF lt_bse_clr.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_bukrs_clr.
            ls_range_bukrs_clr-sign = 'I'.
            ls_range_bukrs_clr-option = 'EQ'.
            ls_range_bukrs_clr-low = lv_bukrs.
            APPEND ls_range_bukrs_clr TO lt_range_bukrs_clr.
            CLEAR ls_range_bukrs_clr.

            CLEAR lt_range_belnr_clr.
            ls_range_belnr_clr-sign = 'I'.
            ls_range_belnr_clr-option = 'EQ'.
            ls_range_belnr_clr-low = lv_belnr.
            APPEND ls_range_belnr_clr TO lt_range_belnr_clr.
            CLEAR ls_range_belnr_clr.

            CLEAR lt_range_gjahr_clr.
            ls_range_gjahr_clr-sign = 'I'.
            ls_range_gjahr_clr-option = 'EQ'.
            ls_range_gjahr_clr-low = lv_gjahr.
            APPEND ls_range_gjahr_clr TO lt_range_gjahr_clr.
            CLEAR ls_range_gjahr_clr.

            CLEAR lt_range_buzei_clr.
            ls_range_buzei_clr-sign = 'I'.
            ls_range_buzei_clr-option = 'EQ'.
            ls_range_buzei_clr-low = lv_buzei.
            APPEND ls_range_buzei_clr TO lt_range_buzei_clr.
            CLEAR ls_range_buzei_clr.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSE_CLR' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS_CLR ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_BELNR_CLR ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr_clr ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BUZEI'
                                                                    it_range             = lt_range_buzei_clr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_bse_clr.
              ls_bse_clr-bdif2 = ls_business_data-bdif_2.
              ls_bse_clr-bdif3 = ls_business_data-bdif_3.
              ls_bse_clr-difh2 = ls_business_data-difh_2.
              ls_bse_clr-difh3 = ls_business_data-difh_3.
              ls_bse_clr-dmbe2 = ls_business_data-dmbe_2.
              ls_bse_clr-dmbe3 = ls_business_data-dmbe_3.
              ls_bse_clr-rdif2 = ls_business_data-rdif_2.
              ls_bse_clr-rdif3 = ls_business_data-rdif_3.
              ls_bse_clr-sknt2 = ls_business_data-sknt_2.
              ls_bse_clr-sknt3 = ls_business_data-sknt_3.
              APPEND ls_bse_clr TO lt_bse_clr.
              CLEAR ls_bse_clr.
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


  METHOD detail_vbrk.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_vbrktype,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_vbrktype,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      vbeln  = lv_vbeln ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VBRK' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            MOVE-CORRESPONDING ls_business_data TO ls_vbrk.

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


  METHOD detail_bseg5.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_journal_detail=>tys_z_i_bsegtype,
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
          lt_range_bukrs      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_belnr      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          lt_range_gjahr      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
          lt_range_hkont      TYPE RANGE OF hkont,
          ls_range_hkont      LIKE LINE OF lt_range_hkont,
          ls_bseg             LIKE LINE OF lt_bseg,
          ls_racct            LIKE LINE OF lt_racct.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
       EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = ls_bkpf-bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.
            CLEAR ls_range_bukrs.

            CLEAR lt_range_belnr.
            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = ls_bkpf-belnr.
            APPEND ls_range_belnr TO lt_range_belnr.
            CLEAR ls_range_belnr.

            CLEAR lt_range_gjahr.
            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = ls_bkpf-gjahr.
            APPEND ls_range_gjahr TO lt_range_gjahr.
            CLEAR ls_range_gjahr.

            CLEAR lt_range_hkont.
            LOOP AT lt_racct INTO ls_racct.
              ls_range_hkont-sign = 'I'.
              ls_range_hkont-option = 'EQ'.
              ls_range_hkont-low = ls_racct-low.
              APPEND ls_range_hkont TO lt_range_hkont.
              CLEAR ls_range_hkont.
            ENDLOOP.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSEG' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_BELNR ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

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


  METHOD detail_bseg6.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_journal_detail=>tys_z_i_bsegtype,
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
          lt_range_bukrs      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_belnr      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          lt_range_gjahr      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
          lt_range_koart      TYPE RANGE OF koart,
          ls_range_koart      LIKE LINE OF lt_range_koart.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_company.
            APPEND ls_range_bukrs TO lt_range_bukrs.

            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = i_doc_number.
            APPEND ls_range_belnr TO lt_range_belnr.

            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = i_year.
            APPEND ls_range_gjahr TO lt_range_gjahr.

            ls_range_koart-sign = 'I'.
            ls_range_koart-option = 'EQ'.
            ls_range_koart-low = 'K'.
            APPEND ls_range_koart TO lt_range_koart.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSEG' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_BELNR ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'KOART'
                                                                    it_range             = lt_range_koart ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            lv_total = ls_business_data-wrbtr.

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


  METHOD detail_/aif/t_mvmapval.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_journal_detail=>tys_z_i_aif_t_mvmapval_type,
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
          lt_range_NS         TYPE RANGE OF char6,
          ls_range_ns         LIKE LINE OF lt_range_ns,
          lt_range_VMAPNAME   TYPE RANGE OF char20,
          ls_range_vmapname   LIKE LINE OF lt_range_vmapname,
          lt_range_int_value  TYPE RANGE OF char200,
          ls_range_int_value  LIKE LINE OF lt_range_int_value.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_ns-sign = 'I'.
            ls_range_ns-option = 'EQ'.
            ls_range_ns-low = '/EDOMX'.
            APPEND ls_range_ns TO lt_range_ns.

            ls_range_vmapname-sign = 'I'.
            ls_range_vmapname-option = 'EQ'.
            ls_range_vmapname-low = 'RECEIVER_TAX_REGIME'.
            APPEND ls_range_vmapname TO lt_range_vmapname.

            ls_range_int_value-sign = 'I'.
            ls_range_int_value-option = 'EQ'.
            ls_range_int_value-low = lv_int_value.
            APPEND ls_range_int_value TO lt_range_int_value.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_AIF_T_MVMAPVAL' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'NS'
                                                                    it_range             = lt_range_NS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'VMAPNAME'
                                                                    it_range             = lt_range_VMAPNAME ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'INT_VALUE'
                                                                    it_range             = lt_range_INT_VALUE ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            MOVE-CORRESPONDING ls_business_data TO ls_/aif/t_mvmapval.

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


  METHOD detail_but051V2.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_journal_detail=>tys_z_i_but_051_type,
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
          lt_range_partner1   TYPE RANGE OF zbu_partner,
          ls_range_partner1   LIKE LINE OF lt_range_partner1,
          lt_range_pafkt      TYPE RANGE OF char4,
          ls_range_pafkt      LIKE LINE OF lt_range_pafkt,
          lt_range_abtnr      TYPE RANGE OF char4,
          ls_range_abtnr      LIKE LINE OF lt_range_abtnr,
          ls_but051           LIKE LINE OF lt_but051.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_partner1.
            ls_range_partner1-sign = 'I'.
            ls_range_partner1-option = 'EQ'.
            ls_range_partner1-low = lv_partner.
            APPEND ls_range_partner1 TO lt_range_partner1.
            CLEAR ls_range_partner1.

            CLEAR lt_range_pafkt.
            ls_range_pafkt-sign = 'I'.
            ls_range_pafkt-option = 'EQ'.
            ls_range_pafkt-low = '0011'.
            APPEND ls_range_pafkt TO lt_range_pafkt.
            CLEAR ls_range_pafkt.

            CLEAR lt_range_abtnr.
            ls_range_abtnr-sign = 'I'.
            ls_range_abtnr-option = 'EQ'.
            ls_range_abtnr-low = lv_abtnr.
            APPEND ls_range_abtnr TO lt_range_abtnr.
            CLEAR ls_range_abtnr.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BUT_051' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'PAFKT'
                                                                    it_range             = lt_range_pafkt ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'PARTNER_1'
                                                                    it_range             = lt_range_partner1 ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'ABTNR'
                                                                    it_range             = lt_range_abtnr ).


            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_but051.
              ls_but051-partner1 = ls_business_data-partner_1.
              ls_but051-partner2 = ls_business_data-partner_2.
              APPEND ls_but051 TO lt_but051.
              CLEAR ls_but051.
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


  METHOD detail_dfkkbptaxnum.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_journal_detail=>tys_z_i_dfkkbptaxnumtype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_PARTNER    TYPE RANGE OF char10,
          ls_range_partner    LIKE LINE OF lt_range_partner.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_partner-sign = 'I'.
            ls_range_partner-option = 'EQ'.
            ls_range_partner-low = lv_partner.
            APPEND ls_range_partner TO lt_range_partner.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_DFKKBPTAXNUM' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'PARTNER'
                                                                    it_range             = lt_range_PARTNER ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            MOVE-CORRESPONDING ls_business_data TO ls_dfkkbptaxnum.

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


  METHOD detail_/aif/t_mvmapval3.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_journal_detail=>tys_z_i_aif_t_mvmapval_type,
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
          lt_range_NS         TYPE RANGE OF char6,
          ls_range_ns         LIKE LINE OF lt_range_ns,
          lt_range_VMAPNAME   TYPE RANGE OF char20,
          ls_range_vmapname   LIKE LINE OF lt_range_vmapname,
          lt_range_int_value  TYPE RANGE OF char200,
          ls_range_int_value  LIKE LINE OF lt_range_int_value.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_ns-sign = 'I'.
            ls_range_ns-option = 'EQ'.
            ls_range_ns-low = '/EDOMX'.
            APPEND ls_range_ns TO lt_range_ns.

            ls_range_vmapname-sign = 'I'.
            ls_range_vmapname-option = 'EQ'.
            ls_range_vmapname-low = 'CFDI_PAYMNT_MEANS'.
            APPEND ls_range_vmapname TO lt_range_vmapname.

            ls_range_int_value-sign = 'I'.
            ls_range_int_value-option = 'EQ'.
            ls_range_int_value-low = lv_int_value.
            APPEND ls_range_int_value TO lt_range_int_value.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_AIF_T_MVMAPVAL' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'NS'
                                                                    it_range             = lt_range_NS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'VMAPNAME'
                                                                    it_range             = lt_range_VMAPNAME ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'INT_VALUE'
                                                                    it_range             = lt_range_INT_VALUE ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            MOVE-CORRESPONDING ls_business_data TO ls_/aif/t_mvmapval.

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


  METHOD detail_ytasd_fact_uuid.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_ztasd_fact_uuidtype,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_ztasd_fact_uuidtype,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = lv_bukrs
                      vbeln  = lv_vbeln
                      fecha  = lv_fecha ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ZTASD_FACT_UUID' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            MOVE-CORRESPONDING ls_business_data TO ls_fac_uuid.

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


  METHOD detail_but051.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_journal_detail=>tys_z_i_but_051_type,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_partner1   TYPE RANGE OF zbu_partner,
          ls_range_partner1   LIKE LINE OF lt_range_partner1,
          lt_range_pafkt      TYPE RANGE OF char4,
          ls_range_pafkt      LIKE LINE OF lt_range_pafkt,
          ls_but051           LIKE LINE OF lt_but051.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_partner1.
            ls_range_partner1-sign = 'I'.
            ls_range_partner1-option = 'EQ'.
            ls_range_partner1-low = lv_partner.
            APPEND ls_range_partner1 TO lt_range_partner1.
            CLEAR ls_range_partner1.

            CLEAR lt_range_pafkt.
            ls_range_pafkt-sign = 'I'.
            ls_range_pafkt-option = 'EQ'.
            ls_range_pafkt-low = '0005'.
            APPEND ls_range_pafkt TO lt_range_pafkt.
            CLEAR ls_range_pafkt.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BUT_051' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'PAFKT'
                                                                    it_range             = lt_range_pafkt ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'PARTNER_1'
                                                                    it_range             = lt_range_partner1 ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_but051.
              ls_but051-partner1 = ls_business_data-partner_1.
              ls_but051-partner2 = ls_business_data-partner_2.
              APPEND ls_but051 TO lt_but051.
              CLEAR ls_but051.
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


  METHOD detail_adrc.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_adrctype,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_adrctype,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      addrnumber  = lv_adrnr
                      date_to     = '99991231' ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ADRC' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            lv_vendor_type = ls_business_data-sort_2.

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


  METHOD detail_adr6.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_adr_6_type,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_adr_6_type,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      persnumber  = lv_prsnr ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ADR_6' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            lv_smtp = ls_business_data-smtp_addr.

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


  METHOD detail_t001.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_t_001_type,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_t_001_type,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = lv_bukrs ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_001' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            lv_adrnr = ls_business_data-adrnr.

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


  METHOD detail_t001z.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_t_001_ztype,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_t_001_ztype,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = lv_bukrs
                      party  = 'MX_RFC' ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_001_Z' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            lv_paval = ls_business_data-paval.

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


  METHOD detail_knvk.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_knvktype,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_knvktype,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      lifnr  = lv_lifnr
                      abtnr  = lv_abtnr
                      pafkt  = 11 ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_KNVK' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            MOVE-CORRESPONDING ls_business_data TO ls_knvk.

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


  METHOD detail_adrc2.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_adrctype,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_adrctype,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      addrnumber  = lv_adrnr
                      date_to     = '99991231' ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ADRC' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            MOVE-CORRESPONDING ls_business_data TO ls_adrc.
            ls_adrc-name1 = ls_business_data-name_1.
            ls_adrc-name2 = ls_business_data-name_2.
            ls_adrc-name3 = ls_business_data-name_3.
            ls_adrc-name4 = ls_business_data-name_4.
            ls_adrc-post_code1 = ls_business_data-post_code_1.

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


  METHOD detail_stxh.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_stxhtype,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_stxhtype,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      tdobject  = 'Tdobject'
                      tdname    = 'Tdname'
                      tdid      = 'Tdid' ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_STXH' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            lv_tdspras = ls_business_data-tdspras.

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


  METHOD detail_reguh.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_reguhtype,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_reguhtype,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      xvorl  = space
                      zbukr  = ls_bkpf-bukrs
                      vblnr  = ls_bkpf-belnr ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_REGUH' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            IF ls_business_data-laufd GE lv_date_from AND ls_business_data-laufd LE lv_date_to.
              MOVE-CORRESPONDING ls_business_data TO ls_reguh.
              ls_reguh-name1 = ls_business_data-name_1.
              ls_reguh-name2 = ls_business_data-name_2.
              ls_reguh-name3 = ls_business_data-name_3.
              ls_reguh-name4 = ls_business_data-name_4.
              ls_reguh-ort01 = ls_business_data-ort_01.
              ls_reguh-stcd1 = ls_business_data-stcd_1.
              ls_reguh-znme1 = ls_business_data-znme_1.
              ls_reguh-znme2 = ls_business_data-znme_2.
              ls_reguh-znme3 = ls_business_data-znme_3.
              ls_reguh-znme4 = ls_business_data-znme_4.
              ls_reguh-zort1 = ls_business_data-zort_1.
              ls_reguh-rspe1 = ls_business_data-rspe_1.
              ls_reguh-rspe2 = ls_business_data-rspe_2.
              ls_reguh-rspm1 = ls_business_data-rspm_1.
              ls_reguh-rspm2 = ls_business_data-rspm_2.
              ls_reguh-pstl2 = ls_business_data-pstl_2.
              ls_reguh-rbet2 = ls_business_data-rbet_2.
              ls_reguh-rbet3 = ls_business_data-rbet_3.
              ls_reguh-rsko2 = ls_business_data-rsko_2.
              ls_reguh-rsko3 = ls_business_data-rsko_3.
              ls_reguh-kurs2 = ls_business_data-kurs_2.
              ls_reguh-kurs3 = ls_business_data-kurs_3_f.
              ls_reguh-zort2 = ls_business_data-zort_2.
              ls_reguh-dtws1 = ls_business_data-dtws_1.
              ls_reguh-dtws2 = ls_business_data-dtws_2.
              ls_reguh-dtws3 = ls_business_data-dtws_3.
              ls_reguh-dtws4 = ls_business_data-dtws_4.
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


  METHOD detail_bnka.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_bnkatype,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_bnkatype,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      banks  = ls_reguh-zbnks
                      bankl  = ls_reguh-zbnky ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BNKA' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            MOVE-CORRESPONDING ls_business_data TO ls_bnka.
            ls_bnka-ort01 = ls_business_data-ort_01.

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


  METHOD detail_t042z.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_t_042_ztype,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_t_042_ztype,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      land_1  = 'MX'
                      zlsch   = lv_rzawe ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_042_Z' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            MOVE-CORRESPONDING ls_business_data TO ls_t042z.
            ls_t042z-text1 = ls_business_data-text_1.

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


  METHOD detail_zcrp_account.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_zcrp_accounttype,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_zcrp_accounttype,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      hkont  = lv_hkont ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ZCRP_ACCOUNT' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            v_hkont = ls_business_data-hkont.

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


  METHOD detail_zfiglmx_crp_aa.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_zfiglmx_crp_aatype,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_zfiglmx_crp_aatype,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      aa_id  = lv_bktxt ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ZFIGLMX_CRP_AA' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            MOVE-CORRESPONDING ls_business_data TO ls_crp_aa.

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


  METHOD detail_lfa1.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_lfa_1_type,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_lfa_1_type,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      lifnr  = lv_lifnr ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LFA_1' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            MOVE-CORRESPONDING ls_business_data TO ls_lfa1.
            ls_lfa1-name1 = ls_business_data-name_1.
            ls_lfa1-name2 = ls_business_data-name_2.
            ls_lfa1-name3 = ls_business_data-name_3.
            ls_lfa1-name4 = ls_business_data-name_4.
            ls_lfa1-ort01 = ls_business_data-ort_01.
            ls_lfa1-ort02 = ls_business_data-ort_02.
            ls_lfa1-mcod1 = ls_business_data-mcod_1.
            ls_lfa1-mcod2 = ls_business_data-mcod_2.
            ls_lfa1-mcod2 = ls_business_data-mcod_3.

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


  METHOD detail_skb1.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_skb_1_type,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_skb_1_type,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = lv_bukrs
                      saknr  = lv_saknr ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_SKB_1' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            IF ls_business_data-hbkid NE space AND ls_business_data-hktid NE space.
              MOVE-CORRESPONDING ls_business_data TO ls_skb1.
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


  METHOD detail_t012k.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_t_012_ktype,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_t_012_ktype,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = lv_bukrs
                      hktid  = lv_hktid
                      hbkid  = lv_hbkid ).

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


  METHOD detail_t012.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_t_012_type,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_t_012_type,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = lv_bukrs
                      hbkid  = lv_hbkid ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_012' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            MOVE-CORRESPONDING ls_business_data TO ls_t012.
            ls_t012-name1 = ls_business_data-name_1.
            ls_t012-stcd1 = ls_business_data-stcd_1.
            ls_t012-telf1 = ls_business_data-telf_1.

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


  METHOD detail_bnka2.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_bnkatype,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_bnkatype,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

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
            ls_bnka-ort01 = ls_business_data-ort_01.

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


  METHOD detail_bse_clr.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_journal_detail=>tys_z_i_bse_clrtype,
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
          lt_range_bukrs_clr  TYPE RANGE OF bukrs,
          ls_range_bukrs_clr  LIKE LINE OF lt_range_bukrs_clr,
          lt_range_belnr_clr  TYPE RANGE OF belnr_d,
          ls_range_belnr_clr  LIKE LINE OF lt_range_belnr_clr,
          lt_range_gjahr_clr  TYPE RANGE OF gjahr,
          ls_range_gjahr_clr  LIKE LINE OF lt_range_gjahr_clr,
          lt_range_koart_clr  TYPE RANGE OF koart,
          ls_range_koart_clr  LIKE LINE OF lt_range_koart_clr,
          lt_range_shkzg_clr  TYPE RANGE OF shkzg,
          ls_range_shkzg_clr  LIKE LINE OF lt_range_shkzg_clr,
          lS_bse_clr          LIKE LINE OF lt_bse_clr.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_bukrs_clr.
            ls_range_bukrs_clr-sign = 'I'.
            ls_range_bukrs_clr-option = 'EQ'.
            ls_range_bukrs_clr-low = lv_bukrs.
            APPEND ls_range_bukrs_clr TO lt_range_bukrs_clr.
            CLEAR ls_range_bukrs_clr.

            CLEAR lt_range_belnr_clr.
            ls_range_belnr_clr-sign = 'I'.
            ls_range_belnr_clr-option = 'EQ'.
            ls_range_belnr_clr-low = lv_belnr.
            APPEND ls_range_belnr_clr TO lt_range_belnr_clr.
            CLEAR ls_range_belnr_clr.

            CLEAR lt_range_gjahr_clr.
            ls_range_gjahr_clr-sign = 'I'.
            ls_range_gjahr_clr-option = 'EQ'.
            ls_range_gjahr_clr-low = lv_gjahr.
            APPEND ls_range_gjahr_clr TO lt_range_gjahr_clr.
            CLEAR ls_range_gjahr_clr.

            CLEAR lt_range_koart_clr.
            ls_range_koart_clr-sign = 'I'.
            ls_range_koart_clr-option = 'EQ'.
            ls_range_koart_clr-low = lv_koart.
            APPEND ls_range_koart_clr TO lt_range_koart_clr.
            CLEAR ls_range_koart_clr.

            CLEAR lt_range_shkzg_clr.
            ls_range_shkzg_clr-sign = 'I'.
            ls_range_shkzg_clr-option = 'EQ'.
            ls_range_shkzg_clr-low = lv_shkzg.
            APPEND ls_range_shkzg_clr TO lt_range_shkzg_clr.
            CLEAR ls_range_gjahr_clr.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSE_CLR' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS_CLR'
                                                                    it_range             = lt_range_BUKRS_CLR ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR_CLR'
                                                                    it_range             = lt_range_BELNR_CLR ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR_CLR'
                                                                    it_range             = lt_range_gjahr_clr ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'KOART'
                                                                    it_range             = lt_range_koart_clr ).
            lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'SHKZG'
                                                                    it_range             = lt_range_shkzg_clr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_bse_clr.
              ls_bse_clr-bdif2 = ls_business_data-bdif_2.
              ls_bse_clr-bdif3 = ls_business_data-bdif_3.
              ls_bse_clr-difh2 = ls_business_data-difh_2.
              ls_bse_clr-difh3 = ls_business_data-difh_3.
              ls_bse_clr-dmbe2 = ls_business_data-dmbe_2.
              ls_bse_clr-dmbe3 = ls_business_data-dmbe_3.
              ls_bse_clr-rdif2 = ls_business_data-rdif_2.
              ls_bse_clr-rdif3 = ls_business_data-rdif_3.
              ls_bse_clr-sknt2 = ls_business_data-sknt_2.
              ls_bse_clr-sknt3 = ls_business_data-sknt_3.
              APPEND ls_bse_clr TO lt_bse_clr.
              CLEAR ls_bse_clr.
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


  METHOD detail_bkpf2.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_bkpftype,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_bkpftype,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = i_company
                      belnr  = i_doc_number
                      gjahr  = i_year ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BKPF' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            lv_bktxt = ls_business_data-bktxt.
            lv_bldat = ls_business_data-bldat.

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


  METHOD detail_bkpf3.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_bkpftype,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_bkpftype,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = i_company
                      belnr  = i_doc_number
                      gjahr  = i_year ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BKPF' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            IF ls_business_data-stblg EQ space AND ls_business_data-cpudt LE i_cpudt.
              MOVE-CORRESPONDING ls_business_data TO ls_bkpf.
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


  METHOD detail_bseg2.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_journal_detail=>tys_z_i_bsegtype,
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
          lt_range_bukrs      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_belnr      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          lt_range_gjahr      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
          lt_range_buzei      TYPE RANGE OF buzei,
          ls_range_buzei      LIKE LINE OF lt_range_buzei.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = ls_comp-bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.

            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = ls_comp-belnr.
            APPEND ls_range_belnr TO lt_range_belnr.

            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = ls_comp-gjahr.
            APPEND ls_range_gjahr TO lt_range_gjahr.

            ls_range_buzei-sign = 'I'.
            ls_range_buzei-option = 'EQ'.
            ls_range_buzei-low = ls_comp-buzei.
            APPEND ls_range_buzei TO lt_range_buzei.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSEG' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_BELNR ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BUZEI'
                                                                    it_range             = lt_range_buzei ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            lv_rebzg = ls_business_data-rebzg.
            lv_rebzj = ls_business_data-rebzj.
            lv_rebzz = ls_business_data-rebzz.

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


  METHOD detail_edomxinvoice.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_edomxinvoicetype,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_edomxinvoicetype,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      edoc_guid  = lv_edoc_guid ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EDOMXINVOICE' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            MOVE-CORRESPONDING ls_business_data TO ls_edomxinv.

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


  METHOD detail_/aif/t_mvmapval2.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_journal_detail=>tys_z_i_aif_t_mvmapval_type,
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
          lt_range_NS         TYPE RANGE OF char6,
          ls_range_ns         LIKE LINE OF lt_range_ns,
          lt_range_VMAPNAME   TYPE RANGE OF char20,
          ls_range_vmapname   LIKE LINE OF lt_range_vmapname,
          lt_range_int_value  TYPE RANGE OF char200,
          ls_range_int_value  LIKE LINE OF lt_range_int_value.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_ns-sign = 'I'.
            ls_range_ns-option = 'EQ'.
            ls_range_ns-low = '/EDOMX'.
            APPEND ls_range_ns TO lt_range_ns.

            ls_range_vmapname-sign = 'I'.
            ls_range_vmapname-option = 'EQ'.
            ls_range_vmapname-low = 'CFDI_PAYMETHOD'.
            APPEND ls_range_vmapname TO lt_range_vmapname.

            ls_range_int_value-sign = 'I'.
            ls_range_int_value-option = 'EQ'.
            ls_range_int_value-low = lv_int_value.
            APPEND ls_range_int_value TO lt_range_int_value.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_AIF_T_MVMAPVAL' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'NS'
                                                                    it_range             = lt_range_NS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'VMAPNAME'
                                                                    it_range             = lt_range_VMAPNAME ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'INT_VALUE'
                                                                    it_range             = lt_range_INT_VALUE ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            MOVE-CORRESPONDING ls_business_data TO ls_/aif/t_mvmapval.

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


  METHOD detail_edocument.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_journal_detail=>tys_z_i_edocumenttype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory    TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1     TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2     TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root  TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_source_type TYPE RANGE OF char10,
          ls_range_source_type LIKE LINE OF lt_range_source_type,
          lt_range_source_key  TYPE RANGE OF char32,
          ls_range_source_key  LIKE LINE OF lt_range_source_key.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_source_type-sign = 'I'.
            ls_range_source_type-option = 'EQ'.
            ls_range_source_type-low = 'SD_INVOICE'.
            APPEND ls_range_source_type TO lt_range_source_type.

            DATA(lv_doc) = |{ lv_vbeln ALPHA = IN }|.

            ls_range_source_key-sign = 'I'.
            ls_range_source_key-option = 'EQ'.
            ls_range_source_key-low = lv_doc.
            APPEND ls_range_source_key TO lt_range_source_key.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EDOCUMENT' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'SOURCE_TYPE'
                                                                    it_range             = lt_range_source_type ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'SOURCE_KEY'
                                                                    it_range             = lt_range_source_key ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            MOVE-CORRESPONDING ls_business_data TO ls_edocumen.

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


  METHOD detail_yvalida_fi.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zfiglmx_journal_detail=>tys_z_i_yvalida_fitype,
          ls_business_data TYPE zscm_zfiglmx_journal_detail=>tys_z_i_yvalida_fitype,
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
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      bukrs  = lv_bukrs
                      belnr  = lv_belnr
                      gjahr  = lv_gjahr ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_YVALIDA_FI' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            MOVE-CORRESPONDING ls_business_data TO ls_yvalida.

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


  METHOD detail_bseg4.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_journal_detail=>tys_z_i_bsegtype,
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
          lt_range_bukrs      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_belnr      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          lt_range_gjahr      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
          lt_range_buzei      TYPE RANGE OF buzei,
          ls_range_buzei      LIKE LINE OF lt_range_buzei.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_company.
            APPEND ls_range_bukrs TO lt_range_bukrs.

            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = i_doc_number.
            APPEND ls_range_belnr TO lt_range_belnr.

            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = i_year.
            APPEND ls_range_gjahr TO lt_range_gjahr.

            ls_range_buzei-sign = 'I'.
            ls_range_buzei-option = 'EQ'.
            ls_range_buzei-low = i_item.
            APPEND ls_range_buzei TO lt_range_buzei.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BSEG' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_BUKRS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_BELNR ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).
            lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BUZEI'
                                                                    it_range             = lt_range_buzei ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            lv_total = ls_business_data-wrbtr.

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


  METHOD detail_zcrp_cuentas_imp.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zfiglmx_journal_detail=>tys_z_i_zcrp_cuentas_imptype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst,
          ls_cuentas_imp   TYPE zst_zcrp_cuentas_imp.


        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
       EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_ZFIGLMX_JOURNAL_DETAIL'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZFIGLMX_JOURNAL_DETAIL' ).

            ASSERT lo_http_client IS BOUND.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ZCRP_CUENTAS_IMP' )->create_request_for_read( ).

            " Create the filter tree
*lo_filter_factory = lo_request->create_filter_factory( ).
*
*lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'CUENTA'
*                                                        it_range             = lt_range_CUENTA ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'IND_IVA_SAP'
*                                                        it_range             = lt_range_IND_IVA_SAP ).

*lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
*lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_cuentas_imp.
              APPEND ls_cuentas_imp TO lt_cuentas_imp.
              CLEAR ls_cuentas_imp.
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
