CLASS zcl_verifica_factura DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    CLASS-DATA: BEGIN OF ty_ekbe,
                  ebeln  TYPE zes_ekbe-ebeln,
                  ebelp  TYPE zes_ekbe-ebelp,
                  zekkn  TYPE zes_ekbe-zekkn,
                  gjahr  TYPE zes_ekbe-gjahr,
                  belnr  TYPE zes_ekbe-belnr,
                  buzei  TYPE zes_ekbe-buzei,
                  xblnr  TYPE zes_ekbe-xblnr,
                  bwart  TYPE zes_ekbe-bwart,
                  menge  TYPE zes_ekbe-menge,
                  budat  TYPE zes_ekbe-budat,
                  wrbtr  TYPE zes_ekbe-wrbtr,
                  waers  TYPE zes_ekbe-waers,
                  mwskz  TYPE zes_ekbe-mwskz,
                  lfgja  TYPE zes_ekbe-gjahr,
                  lfbnr  TYPE zes_ekbe-belnr,               "MRM 090304
                  lfpos  TYPE zes_ekbe-lfpos,
                  dmbtr  TYPE zes_ekbe-dmbtr,               "MRM 090304
                  packno TYPE zes_ekbe-packno,
                  introw TYPE zes_ekbe-introw,
                  werks  TYPE zekpo-werks,
                  lgort  TYPE zekpo-lgort,
                  knttp  TYPE zekpo-knttp,
                END   OF ty_ekbe,

                BEGIN OF ty_ekbe_ant,
                  ebeln TYPE zes_ekbe-ebeln,
                  ebelp TYPE zes_ekbe-ebelp,
                  gjahr TYPE zes_ekbe-gjahr,
                  belnr TYPE zes_ekbe-belnr,
                  buzei TYPE zes_ekbe-buzei,
                  menge TYPE zes_ekbe-menge,
                  dmbtr TYPE zes_ekbe-dmbtr,                "MRM 090304
                  wrbtr TYPE zes_ekbe-wrbtr,
                  waers TYPE zes_ekbe-waers,
                  mwskz TYPE zes_ekbe-mwskz,
                END   OF ty_ekbe_ant.

    CLASS-DATA: t_ekbe     LIKE STANDARD TABLE OF ty_ekbe,
                t_ekbe_ant LIKE STANDARD TABLE OF ty_ekbe_ant.

    CLASS-METHODS: but000             IMPORTING i_operacion TYPE text10
                                                i_lifnr     TYPE lifnr
                                      EXPORTING lv_name     TYPE zes_but000-name_org1.

    CLASS-METHODS: lfa1               IMPORTING i_operacion TYPE text10
                                                i_lifnr     TYPE lifnr
                                      EXPORTING es_lfa1     TYPE zst_lfa1.

    CLASS-METHODS: lfa1V2             IMPORTING i_operacion TYPE text10
                                                i_lifnr     TYPE lifnr
                                      EXPORTING lv_stcd     TYPE zst_lfa1-stcd1.

    CLASS-METHODS: lfa1V3             IMPORTING i_operacion TYPE text10
                                                i_stcd1     TYPE stcd1
                                      EXPORTING es_lfa1     TYPE zst_lfa1.

    CLASS-METHODS: lfa1V4             IMPORTING i_operacion TYPE text10
                                                i_stcd1     TYPE stcd1
                                      EXPORTING it_lfa1     TYPE ztt_lfa1.

    CLASS-METHODS: lfb1               IMPORTING i_operacion TYPE text10
                                                i_lifnr     TYPE lifnr
                                                i_bukrs     TYPE bukrs
                                      EXPORTING lv_zterm    TYPE zst_lfb1-zterm.

    CLASS-METHODS: lfbw               IMPORTING i_operacion TYPE text10
                                                i_lifnr     TYPE lifnr
                                                i_bukrs     TYPE bukrs
                                      EXPORTING lt_lfbw     TYPE ztt_lfbw.

    CLASS-METHODS: t023               IMPORTING VALUE(i_operacion) TYPE text10
                                                i_matkl TYPE matkl
                                      EXPORTING VALUE(et_T023T)    TYPE  ztt_t023_t023t.

    CLASS-METHODS: ekpo               IMPORTING VALUE(i_operacion) TYPE text10
                                                i_ebeln            TYPE ebeln
                                      EXPORTING VALUE(et_ekpo)     TYPE ztt_ekpo.

    CLASS-METHODS: ekpo2              IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_ebeln           TYPE zst_vfkp-ebeln
                                                lv_ebelp           TYPE zst_vfkp-ebelp
                                      EXPORTING VALUE(lv_pstyp)    TYPE zekpo-pstyp.

    CLASS-METHODS: ekpo3               IMPORTING VALUE(i_operacion) TYPE text10
                                                 lv_ebeln           TYPE zst_vfkp-ebeln
                                                 lv_ebelp           TYPE zst_vfkp-ebelp
                                       EXPORTING VALUE(es_ekpo)     TYPE zekpo.

    CLASS-METHODS: ekpo4               IMPORTING VALUE(i_operacion) TYPE text10
                                                 lv_ebeln           TYPE zst_vfkp-ebeln
                                                 lv_ebelp           TYPE zst_vfkp-ebelp
                                       EXPORTING VALUE(es_ekpo)     TYPE zekpo.

    CLASS-METHODS: mseg               IMPORTING i_operacion TYPE text10
                                                I_Mblnr     TYPE text10
                                                i_Mjahr     TYPE zmjahr
                                      EXPORTING et_mseg     TYPE ztt_mseg.

    CLASS-METHODS: mkpf_get           IMPORTING VALUE(i_operacion) TYPE text10
                                                i_mblnr            TYPE zchar10
                                                i_mjahr            TYPE ztsnum
                                      EXPORTING VALUE(et_mkpf)     TYPE ztt_mkpf.

    CLASS-METHODS: ekbe               IMPORTING i_operacion TYPE text10
                                      EXPORTING et_ekbe     TYPE ztt_ekbe.

    CLASS-METHODS: vfkp               IMPORTING VALUE(i_operacion) TYPE text10
                                                st_vttk            TYPE zst_vttk
                                      EXPORTING VALUE(ls_vfkp)     TYPE zst_vfkp.

    CLASS-METHODS: vfkp2              IMPORTING VALUE(i_operacion) TYPE text10
                                                st_vtts            TYPE zst_vtts
                                      EXPORTING VALUE(ls_vfkp)     TYPE zst_vfkp.

    CLASS-METHODS: vfkp3              IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_rebel           TYPE zhst-rebel
                                                lv_lblni           TYPE zhst-lblni
                                                lv_lifnr           TYPE lifnr
                                      EXPORTING VALUE(ls_vfkp)     TYPE zst_vfkp.

    CLASS-METHODS: vfkp4              IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_rebel           TYPE zhst-rebel
                                                lv_lifnr           TYPE lifnr
                                      EXPORTING VALUE(lt_vfkp)     TYPE ztt_vfkp.

    CLASS-METHODS: vfkp5              IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_lblni           TYPE zhst-lblni
                                                lv_lifnr           TYPE lifnr
                                      EXPORTING VALUE(ls_vfkp)     TYPE zst_vfkp.

    CLASS-METHODS: vttp               IMPORTING VALUE(i_operacion) TYPE text10
                                                i_ebeln            TYPE ebeln
                                      EXPORTING VALUE(E_vttp)      TYPE zes_vttp.

    CLASS-METHODS: ekbz               IMPORTING VALUE(i_operacion) TYPE text10
                                                i_ebeln            TYPE ebeln
                                      EXPORTING VALUE(E_ekbz)      TYPE ztt_ekbz.

    CLASS-METHODS: ekbz2              IMPORTING VALUE(i_operacion) TYPE text10
                                                i_ebeln            TYPE ebeln
                                                i_ebelp            TYPE ebelp
                                                i_belnr            TYPE belnr_d
                                      EXPORTING VALUE(lv_stunr)    TYPE zes_ekbz-stunr
                                                lv_zaehk           TYPE zes_ekbz-zaehk.

    CLASS-METHODS: search_vendor_lfa1 IMPORTING VALUE(i_operacion) TYPE text10
                                                prov               TYPE text10
                                      EXPORTING VALUE(e_stcd1)     TYPE stcd1.

    CLASS-METHODS: ekko               IMPORTING i_operacion TYPE text10
                                                i_quotation TYPE ebeln
                                      EXPORTING t_ekko      TYPE ztt_ekko_2.

    CLASS-METHODS: prcd_elements      IMPORTING i_operacion TYPE text10
                                                i_KNUMV     TYPE text10
                                                i_KSCHL     TYPE kschl
                                                i_kherk     TYPE char1
                                      EXPORTING e_lifnr     TYPE lifnr.

    CLASS-METHODS: vttk               IMPORTING VALUE(i_operacion) TYPE text10
                                                is_invoice         TYPE zinvoice
                                      EXPORTING VALUE(it_vttk)     TYPE ztt_vttk.

    CLASS-METHODS: vttk2              IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_tknum           TYPE zst_vfkp-rebel
                                                lv_tpbez           TYPE ebeln
                                      EXPORTING VALUE(ls_vttk)     TYPE zst_vttk.

    CLASS-METHODS: vttk3              IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_tknum           TYPE zst_vfkp-rebel
                                                lv_exti1           TYPE zst_vttk-exti1
                                      EXPORTING VALUE(v_tknum)     TYPE zst_vttk-tknum
                                                v_exti1            TYPE zst_vttk-exti1.

    CLASS-METHODS: vttk4              IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_tknum           TYPE zst_vfkp-rebel
                                                lv_exti1           TYPE zst_vfkp-rebel
                                      EXPORTING VALUE(v_tknum)     TYPE zst_vttk-tknum
                                                v_exti1            TYPE zst_vttk-exti1.

    CLASS-METHODS: vttk5              IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_tknum           TYPE zst_vfkp-rebel
                                      EXPORTING VALUE(ls_vttk)     TYPE zst_vttk.

    CLASS-METHODS: vtts               IMPORTING VALUE(i_operacion) TYPE text10
                                                st_vttk            TYPE zst_vttk
                                      EXPORTING VALUE(st_vtts)     TYPE zst_vtts.

    CLASS-METHODS: vtts2              IMPORTING VALUE(i_operacion) TYPE text10
                                                st_vttk            TYPE zst_vttk
                                                i_lifnr            TYPE lifnr
                                      EXPORTING VALUE(st_vtts)     TYPE zst_vtts.

    CLASS-METHODS: vtts3              IMPORTING VALUE(i_operacion) TYPE text10
                                                st_vttk            TYPE zst_vttk
                                                i_lifnr            TYPE lifnr
                                      EXPORTING VALUE(st_vtts)     TYPE zst_vtts.

    CLASS-METHODS: vtts4              IMPORTING VALUE(i_operacion) TYPE text10
                                                st_vttk            TYPE zst_vttk
                                      EXPORTING VALUE(st_vtts)     TYPE zst_vtts.

    CLASS-METHODS: adrc               IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_adrnz           TYPE zst_adrc-addrnumber
                                      EXPORTING VALUE(st_adrc)     TYPE zst_adrc.

    CLASS-METHODS: vbfa               IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_ebeln           TYPE ebeln
                                      EXPORTING VALUE(it_vbfa)     TYPE ztt_vbfa.

    CLASS-METHODS: vbfa2              IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_ebeln           TYPE ebeln
                                      EXPORTING VALUE(it_vbfa)     TYPE ztt_vbfa.

    CLASS-METHODS: essr               IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_lblni           TYPE zes_ekbe-lfbnr
                                      EXPORTING VALUE(ls_esrr)     TYPE zst_essr.

    CLASS-METHODS: rbkp               IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_belnr           TYPE belnr_d
                                                lv_gjahr           TYPE gjahr
                                                lv_xblnr           TYPE xblnr
                                      EXPORTING VALUE(ls_rbkp)     TYPE zes_rbkp.

    CLASS-METHODS: t006               IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_msehi           TYPE msehi
                                      EXPORTING VALUE(ls_t006)     TYPE zst_t006.

    CLASS-METHODS: esll               IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_packno          TYPE zst_esll-packno
                                      EXPORTING VALUE(ls_esll)     TYPE zst_esll.

    CLASS-METHODS: eskn               IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_lfbnr           TYPE zes_ekbe-lfbnr
                                                lv_zekkn           TYPE zes_ekbe-zekkn
                                      EXPORTING VALUE(lt_eskn)     TYPE ztt_eskn.

    CLASS-METHODS: ekkn               IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_ebeln           TYPE ebeln
                                                lv_ebelp           TYPE ebelp
                                      EXPORTING VALUE(lt_ekkn)     TYPE ztt_ekkn.

    CLASS-METHODS: zinv_spool         IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_nofact          TYPE char16
                                                lv_doctyp          TYPE char2
                                                lv_ebeln           TYPE ebeln
                                      EXPORTING VALUE(ls_zinv)     TYPE zinv_spool.

    CLASS-METHODS: zinv_spool2        IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_nofact          TYPE char16
                                                lv_doctyp          TYPE char2
                                                lv_ebeln           TYPE ebeln
                                      EXPORTING VALUE(ls_zinv)     TYPE zinv_spool.

    CLASS-METHODS: bkpf               IMPORTING VALUE(i_operacion) TYPE text10
                                                lv_awkey           TYPE awkey
                                      EXPORTING VALUE(lv_belnr)    TYPE belnr_d
                                                lv_gjahr           TYPE gjahr.

    CLASS-METHODS: ekbe1 IMPORTING i_ebeln TYPE ebeln
                         EXPORTING et_ekbe LIKE t_ekbe,
      ekbe2 IMPORTING i_ebeln TYPE ebeln
                      i_ebelp TYPE ebelp
                      i_lblni TYPE char10
            EXPORTING et_ekbe LIKE t_ekbe,
      ekbe3 IMPORTING i_ebeln TYPE ebeln
                      i_ebelp TYPE ebelp
                      i_belnr TYPE belnr_d
                      i_buzei TYPE numc4
            EXPORTING et_ekbe LIKE t_ekbe,
      ekbe4 IMPORTING i_ebeln TYPE ebeln
                      i_ebelp TYPE ebelp
                      i_lfbnr TYPE char10
                      i_buzei TYPE numc4
            EXPORTING e_subrc TYPE sy-subrc,
      ekbe5 IMPORTING i_xblnr TYPE char10
                      i_gjahr TYPE gjahr
            EXPORTING et_ekbe LIKE t_ekbe,
      ekbe6 IMPORTING i_ebeln     TYPE ebeln
            EXPORTING et_ekbe_ant LIKE t_ekbe_ant,
      ekbe7 IMPORTING i_ebeln TYPE ebeln
                      i_ebelp TYPE ebelp
                      i_lfbnr TYPE char10 OPTIONAL
            EXPORTING et_ekbe TYPE ztt_ekbe,
      ekbe8 IMPORTING i_ebeln TYPE ebeln
                      i_ebelp TYPE ebelp
                      i_xblnr TYPE char10
            EXPORTING et_ekbe TYPE ztt_ekbe,
      ekbe9 IMPORTING i_ebeln TYPE ebeln
                      i_ebelp TYPE ebelp
                      i_gjahr TYPE gjahr
                      i_lfbnr TYPE char10
                      i_lfpos TYPE numc4
            EXPORTING e_wrbtr TYPE wrbtr
                      e_menge TYPE menge_d.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_verifica_factura IMPLEMENTATION.


  METHOD but000.
    CASE i_operacion.
      WHEN 'READ'.


        DATA:
          ls_entity_key    TYPE zscm_but000=>tys_z_i_but_000_type,
          ls_business_data TYPE zscm_but000=>tys_z_i_but_000_type,
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
                                                     proxy_model_id      = 'ZSCM_BUT000'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_BUT000' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      partner  = i_lifnr ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BUT_000' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            lv_name = ls_business_data-name_org_1.


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
          ls_entity_key    TYPE zscm_zvts_search_vendor=>tys_z_i_lfa_1_type,
          ls_business_data TYPE zscm_zvts_search_vendor=>tys_z_i_lfa_1_type,
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
                                                     proxy_model_id      = 'ZSCM_ZVTS_SEARCH_VENDOR'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVTS_SEARCH_VENDOR' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      lifnr  = i_lifnr ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LFA_1' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            MOVE-CORRESPONDING ls_business_data TO es_lfa1.
            es_lfa1-name1 = ls_business_data-name_1.
            es_lfa1-name2 = ls_business_data-name_2.
            es_lfa1-ort01 = ls_business_data-ort_01.
            es_lfa1-land1 = ls_business_data-land_1.
            es_lfa1-telf1 = ls_business_data-telf_1.

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


  METHOD lfa1V2.
    CASE i_operacion.
      WHEN 'READ'.


        DATA:
          ls_entity_key    TYPE zscm_zvts_search_vendor=>tys_z_i_lfa_1_type,
          ls_business_data TYPE zscm_zvts_search_vendor=>tys_z_i_lfa_1_type,
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
                                                     proxy_model_id      = 'ZSCM_ZVTS_SEARCH_VENDOR'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVTS_SEARCH_VENDOR' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      lifnr  = i_lifnr ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LFA_1' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            lv_stcd = ls_business_data-stcd_1.

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


  METHOD lfa1V3.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zvts_search_vendor=>tys_z_i_lfa_1_type,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_stcd1      TYPE RANGE OF stcd1,
          ls_range_stcd1      LIKE LINE OF lt_range_stcd1.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVTS_SEARCH_VENDOR'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVTS_SEARCH_VENDOR' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_stcd1-sign = 'I'.
            ls_range_stcd1-option = 'EQ'.
            ls_range_stcd1-low = i_stcd1.
            APPEND ls_range_stcd1 TO lt_range_stcd1.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LFA_1' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'STCD1'
                                                                    it_range             = lt_range_stcd1 ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            IF sy-subrc = 0.
              MOVE-CORRESPONDING ls_business_data TO es_lfa1.
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


  METHOD lfa1V4.
    CASE i_operacion.
      WHEN 'READ'.


        DATA:
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_lfa_1_type,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_stcd1      TYPE RANGE OF stcd1,
          ls_range_stcd1      LIKE LINE OF lt_range_stcd1,
          ls_lfa1             LIKE LINE OF it_lfa1.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVTS_SEARCH_VENDOR'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVTS_SEARCH_VENDOR' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_stcd1, ls_range_stcd1.
            ls_range_stcd1-sign = 'I'.
            ls_range_stcd1-option = 'EQ'.
            ls_range_stcd1-low = i_stcd1.
            APPEND ls_range_stcd1 TO lt_range_stcd1.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LFA_1' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'STCD1'
                                                                    it_range             = lt_range_stcd1 ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

*            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).
            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_lfa1.
              APPEND ls_lfa1 TO it_lfa1.
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


  METHOD lfb1.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_lfb1=>tys_z_i_lfb_1_type,
          ls_business_data TYPE zscm_lfb1=>tys_z_i_lfb_1_type,
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
                                                     proxy_model_id      = 'ZSCM_ZVTS_SEARCH_VENDOR'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVTS_SEARCH_VENDOR' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      lifnr  = i_lifnr
                      bukrs  = i_bukrs ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LFB_1' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            lv_zterm = ls_business_data-zterm.

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


  METHOD lfbw.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_lfbwtype,
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
          lt_range_bukrs      TYPE RANGE OF bukrs,
          ls_range_bukrs      LIKE LINE OF lt_range_bukrs,
          lt_range_wt_subjct  TYPE RANGE OF char1,
          ls_range_wt_subjct  LIKE LINE OF lt_range_wt_subjct,
          ls_lfbw             LIKE LINE OF lt_lfbw.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_bukrs, ls_range_bukrs.
            ls_range_bukrs-sign = 'I'.
            ls_range_bukrs-option = 'EQ'.
            ls_range_bukrs-low = i_bukrs.
            APPEND ls_range_bukrs TO lt_range_bukrs.

            CLEAR: lt_range_lifnr, ls_range_lifnr.
            ls_range_lifnr-sign = 'I'.
            ls_range_lifnr-option = 'EQ'.
            ls_range_lifnr-low = i_lifnr.
            APPEND ls_range_lifnr TO lt_range_lifnr.

            CLEAR: lt_range_wt_subjct, ls_range_wt_subjct.
            ls_range_wt_subjct-sign = 'I'.
            ls_range_wt_subjct-option = 'EQ'.
            ls_range_wt_subjct-low = 'X'.
            APPEND ls_range_wt_subjct TO lt_range_wt_subjct.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LFBW' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'LIFNR'
                                                                    it_range             = lt_range_lifnr ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                    it_range             = lt_range_bukrs ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'WT_SUBJCT'
                                                                    it_range             = lt_range_wt_subjct ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).
            MOVE-CORRESPONDING lt_business_data TO lt_lfbw.

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


  METHOD t023.
    CASE i_operacion.
      WHEN 'READ'.


        DATA:
          lt_business_data TYPE TABLE OF zscm_t023=>tys_z_i_t_023_t_023_ttype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_matkl      TYPE RANGE OF matkl,
          ls_range_matkl LIKE LINE OF lt_range_matkl,
          lt_range_spras      TYPE RANGE OF spras,
          ls_range_spras LIKE LINE OF lt_range_spras.

        TRY.
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_T023'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_T023' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_matkl-sign = 'I'.
            ls_range_matkl-option = 'EQ'.
            ls_range_matkl-low = i_matkl.
            APPEND ls_range_matkl TO lt_range_matkl.

            ls_range_spras-sign = 'I'.
            ls_range_spras-option = 'EQ'.
            ls_range_spras-low = 'S'.
            APPEND ls_range_spras TO lt_range_spras.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_023_T_023_T' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'MATKL'
                                                                    it_range             = lt_range_matkl ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'SPRAS'
                                                                    it_range             = lt_range_spras ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            " et_prodfamilys_get = lt_business_data.
            MOVE-CORRESPONDING lt_business_data TO et_T023T.


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
          lt_business_data TYPE TABLE OF zscm_ekpo=>tys_z_i_ekpotype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node.
*             lt_range_DELETE_MC TYPE RANGE OF <element_name>,
*             lt_range_UPDATE_MC TYPE RANGE OF <element_name>.

        DATA:
          lt_range_ebeln TYPE RANGE OF ebeln,
          ls_range_ebeln LIKE LINE OF lt_range_ebeln.

        TRY.
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
                 EXPORTING
                      is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                          proxy_model_id      = 'ZSCM_EKPO'
                                                          proxy_model_version = '0001' )
                    io_http_client             = lo_http_client
                    iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_EKPO' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_ebeln, ls_range_ebeln.
            ls_range_ebeln-sign = 'I'.
            ls_range_ebeln-option = 'EQ'.
            ls_range_ebeln-low = i_ebeln.
            APPEND ls_range_ebeln TO lt_range_ebeln.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKPO' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_ebeln ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            MOVE-CORRESPONDING lt_business_data TO et_ekpo.

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


  METHOD ekpo2.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_zverifica_factura=>tys_z_i_ekpotype,
          ls_business_data TYPE zscm_zverifica_factura=>tys_z_i_ekpotype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read.

        TRY.
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
                 EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      ebeln  = lv_ebeln
                      ebelp  = lv_ebelp ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKPO' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            lv_pstyp = ls_business_data-pstyp.

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


  METHOD ekpo3.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_zverifica_factura=>tys_z_i_ekpotype,
          ls_business_data TYPE zscm_zverifica_factura=>tys_z_i_ekpotype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read.

        TRY.
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
                 EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      ebeln  = lv_ebeln
                      ebelp  = lv_ebelp ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKPO' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            IF ls_business_data-loekz EQ space.
              MOVE-CORRESPONDING ls_business_data TO es_ekpo.
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


  METHOD ekpo4.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_zverifica_factura=>tys_z_i_ekpotype,
          ls_business_data TYPE zscm_zverifica_factura=>tys_z_i_ekpotype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read.

        TRY.
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
                 EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      ebeln  = lv_ebeln
                      ebelp  = lv_ebelp ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKPO' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            MOVE-CORRESPONDING ls_business_data TO es_ekpo.

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


  METHOD mSEG.
    CASE i_operacion.
      WHEN 'READ'.


        DATA:
          lt_business_data TYPE TABLE OF zscm_material_header=>tys_z_i_materialdocumentitemty,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node.

        DATA:
          lt_range_mblnr TYPE RANGE OF zchar10,
          ls_range_mblnr LIKE LINE OF lt_range_mblnr,
          lt_range_mjahr TYPE RANGE OF ztsnum,
          ls_range_mjahr LIKE LINE OF lt_range_mjahr,
          ls_mseg        LIKE LINE OF et_mseg.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_MATERIAL_HEADER'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_MATERIAL_HEADER' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_mblnr, ls_range_mblnr.
            ls_range_mblnr-sign = 'I'.
            ls_range_mblnr-option = 'EQ'.
            ls_range_mblnr-low = i_mblnr.
            APPEND ls_range_mblnr TO lt_range_mblnr.

            CLEAR: lt_range_mjahr, ls_range_mjahr.
            ls_range_mjahr-sign = 'I'.
            ls_range_mjahr-option = 'EQ'.
            ls_range_mjahr-low = i_mjahr.
            APPEND ls_range_mjahr TO lt_range_mjahr.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_MATERIALDOCUMENTITEM' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'MATERIAL_DOCUMENT_YEAR'
                                                                    it_range             = lt_range_mjahr ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'MATERIAL_DOCUMENT'
                                                                    it_range             = lt_range_mblnr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              ls_mseg-ebeln = ls_business_data-purchase_order.
              ls_mseg-ebelp = ls_business_data-purchase_order_item.
              ls_mseg-zeile = ls_business_data-material_document_item.
              APPEND ls_mseg TO et_mseg.
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


  METHOD mkpf_get.
    CASE i_operacion.
      WHEN 'READ'.


        DATA:
          lt_business_data TYPE TABLE OF zscm_material_header=>tys_i_material_document_head_2,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node.
*         lt_range_DELETE_MC TYPE RANGE OF <element_name>,
*         lt_range_UPDATE_MC TYPE RANGE OF <element_name>.

        DATA:
          lt_range_mblnr TYPE RANGE OF zchar10,
          ls_range_mblnr LIKE LINE OF lt_range_mblnr,
          lt_range_mjahr TYPE RANGE OF ztsnum,
          ls_range_mjahr LIKE LINE OF lt_range_mjahr,
          ls_mkpf        LIKE LINE OF et_mkpf.


        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_MATERIAL_HEADER'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_MATERIAL_HEADER' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_mblnr, ls_range_mblnr.
            ls_range_mblnr-sign = 'I'.
            ls_range_mblnr-option = 'EQ'.
            ls_range_mblnr-low = i_mblnr.
            APPEND ls_range_mblnr TO lt_range_mblnr.

            CLEAR: lt_range_mjahr, ls_range_mjahr.
            ls_range_mjahr-sign = 'I'.
            ls_range_mjahr-option = 'EQ'.
            ls_range_mjahr-low = i_mjahr.
            APPEND ls_range_mjahr TO lt_range_mjahr.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'I_MATERIAL_DOCUMENT_HEADER' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'MATERIAL_DOCUMENT_YEAR'
                                                                    it_range             = lt_range_mjahr ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'MATERIAL_DOCUMENT'
                                                                    it_range             = lt_range_mblnr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              ls_mkpf-mblnr = ls_business_data-material_document.
              ls_mkpf-mjahr = ls_business_data-material_document_year.
              ls_mkpf-bldat = ls_business_data-document_date.
              APPEND ls_mkpf TO et_mkpf.
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


  METHOD ekbe.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_ekbetype,
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
          ls_ekbe             LIKE LINE OF et_ekbe.



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

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKBE' )->create_request_for_read( ).


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
          ls_range_rebel      LIKE LINE OF lt_range_rebel.
*          ls_vfkp             LIKE LINE OF t_vfkp.



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

            CLEAR lt_range_rebel.
            ls_range_rebel-sign = 'I'.
            ls_range_rebel-option = 'EQ'.
            ls_range_rebel-low = st_vttk-tknum.
            APPEND ls_range_rebel TO lt_range_rebel.
            CLEAR ls_range_rebel.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTK' )->create_request_for_read( ).

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

*            CLEAR t_vfkp.

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_vfkp.
*              APPEND ls_vfkp TO t_vfkp.
*              CLEAR ls_vfkp.
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
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_vfkptype,
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
          lt_range_tdlnr      TYPE RANGE OF char10,
          ls_range_tdlnr      LIKE LINE OF lt_range_tdlnr.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            DATA(lv_rebel) = |{ st_vtts-tknum ALPHA = IN }|.

            ls_range_rebel-sign = 'I'.
            ls_range_rebel-option = 'EQ'.
            ls_range_rebel-low = lv_rebel.
            APPEND ls_range_rebel TO lt_range_rebel.

            ls_range_tdlnr-sign = 'I'.
            ls_range_tdlnr-option = 'EQ'.
            ls_range_tdlnr-low = st_vtts-tdlnr.
            APPEND ls_range_tdlnr TO lt_range_tdlnr.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VFKP' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'REBEL'
                                                                    it_range             = lt_range_rebel ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'TDLNR'
                                                                    it_range             = lt_range_tdlnr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data) WHERE lblni <> space.
              MOVE-CORRESPONDING ls_business_data TO ls_vfkp.
              EXIT.
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
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_vfkptype,
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
          lt_range_rebel      TYPE RANGE OF char10,
          ls_range_rebel      LIKE LINE OF lt_range_rebel,
          lt_range_tdlnr      TYPE RANGE OF char10,
          ls_range_tdlnr      LIKE LINE OF lt_range_tdlnr,
          lt_range_lblni      TYPE RANGE OF char10,
          ls_range_lblni      LIKE LINE OF lt_range_lblni.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_rebel-sign = 'I'.
            ls_range_rebel-option = 'EQ'.
            ls_range_rebel-low = lv_rebel.
            APPEND ls_range_rebel TO lt_range_rebel.

            ls_range_tdlnr-sign = 'I'.
            ls_range_tdlnr-option = 'EQ'.
            ls_range_tdlnr-low = lv_lifnr.
            APPEND ls_range_tdlnr TO lt_range_tdlnr.

            ls_range_lblni-sign = 'I'.
            ls_range_lblni-option = 'EQ'.
            ls_range_lblni-low = lv_lblni.
            APPEND ls_range_lblni TO lt_range_lblni.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VFKP' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'REBEL'
                                                                    it_range             = lt_range_rebel ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'TDLNR'
                                                                    it_range             = lt_range_tdlnr ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'LBLNI'
                                                                    it_range             = lt_range_lblni ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_vfkp.
              EXIT.
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


  METHOD vfkp4.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_vfkptype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_rebel      TYPE RANGE OF vbeln,
          ls_range_rebel      LIKE LINE OF lt_range_rebel,
          lt_range_tdlnr      TYPE RANGE OF lifnr,
          ls_range_tdlnr      LIKE LINE OF lt_range_tdlnr,
          ls_vfkp             LIKE LINE OF lt_vfkp.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
       EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_rebel, ls_range_rebel.
            ls_range_rebel-sign = 'I'.
            ls_range_rebel-option = 'EQ'.
            ls_range_rebel-low = lv_rebel.
            APPEND ls_range_rebel TO lt_range_rebel.

            CLEAR: lt_range_tdlnr, ls_range_tdlnr.
            ls_range_tdlnr-sign = 'I'.
            ls_range_tdlnr-option = 'EQ'.
            ls_range_tdlnr-low = lv_lifnr.
            APPEND ls_range_tdlnr TO lt_range_tdlnr.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VFKP' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'REBEL'
                                                                    it_range             = lt_range_rebel ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'TDLNR'
                                                                    it_range             = lt_range_tdlnr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              IF ls_business_data NE space.
                MOVE-CORRESPONDING ls_business_data TO ls_vfkp.
                APPEND ls_vfkp TO lt_vfkp.
                CLEAR ls_vfkp.
              ENDIF.
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


  METHOD vfkp5.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_vfkptype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_tdlnr      TYPE RANGE OF char10,
          ls_range_tdlnr      LIKE LINE OF lt_range_tdlnr,
          lt_range_lblni      TYPE RANGE OF char10,
          ls_range_lblni      LIKE LINE OF lt_range_lblni.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_tdlnr-sign = 'I'.
            ls_range_tdlnr-option = 'EQ'.
            ls_range_tdlnr-low = lv_lifnr.
            APPEND ls_range_tdlnr TO lt_range_tdlnr.

            ls_range_lblni-sign = 'I'.
            ls_range_lblni-option = 'EQ'.
            ls_range_lblni-low = lv_lblni.
            APPEND ls_range_lblni TO lt_range_lblni.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VFKP' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'TDLNR'
                                                                    it_range             = lt_range_tdlnr ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'LBLNI'
                                                                    it_range             = lt_range_lblni ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_vfkp.
              EXIT.
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


  METHOD vttp.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_vttp=>tys_z_i_vttp_type,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_vbeln      TYPE RANGE OF vbeln_va,
          ls_range_vbeln      LIKE LINE OF lt_range_vbeln.


        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_VTTP'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_VTTP' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_vbeln-sign = 'I'.
            ls_range_vbeln-option = 'EQ'.
            ls_range_vbeln-low = i_ebeln.
            APPEND ls_range_vbeln TO lt_range_vbeln.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTP' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELN'
                                                                    it_range             = lt_range_vbeln ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO E_vttp.
              EXIT.
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


  METHOD ekbz.
    CASE i_operacion.
      WHEN 'READ LIST'.


        DATA:
          lt_business_data TYPE TABLE OF zscm_ekbz=>tys_z_i_ekbztype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
* lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_EBELN      TYPE RANGE OF ebeln,
          ls_range_ebeln      LIKE LINE OF lt_range_EBELN.
* lt_range_EBELP TYPE RANGE OF <element_name>.


        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_EKBZ'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_EKBZ' ).

            ASSERT lo_http_client IS BOUND.

            IF i_EBELN IS NOT INITIAL.
              ls_range_ebeln-sign = 'I'.
              ls_range_ebeln-option = 'EQ'.
              ls_range_ebeln-low = i_ebeln.
              APPEND ls_range_ebeln TO lt_range_ebeln.
            ENDIF.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKBZ' )->create_request_for_read( ).
            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).
*
            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_EBELN ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            DATA: es_ekbz TYPE zes_ekbz.
            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO es_ekbz.
              APPEND es_ekbz TO E_ekbz.

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


  METHOD ekbz2.
    CASE i_operacion.
      WHEN 'READ LIST'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_ekbz=>tys_z_i_ekbztype,
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
          lt_range_ebelp      TYPE RANGE OF ebelp,
          lt_range_belnr      TYPE RANGE OF belnr_d.


        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_EKBZ'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_EKBZ' ).

            ASSERT lo_http_client IS BOUND.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKBZ' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_EBELN ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELP'
                                                                    it_range             = lt_range_EBELP ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_belnr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            IF sy-subrc = 0.
              lv_stunr = ls_business_data-stunr.
              lv_zaehk = ls_business_data-zaehk.
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


  METHOD search_vendor_lfa1.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zvts_search_vendor=>tys_z_i_lfa_1_type,
          ls_business_data TYPE zscm_zvts_search_vendor=>tys_z_i_lfa_1_type,
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
                                              proxy_model_id      = 'ZSCM_ZVTS_SEARCH_VENDOR'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVTS_SEARCH_VENDOR' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      lifnr  = prov ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LFA_1' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
*            MOVE-CORRESPONDING ls_business_data TO lfa1.
*            lfa1-name1 = ls_business_data-name_1.
*            lfa1-name2 = ls_business_data-name_2.
*            lfa1-name3 = ls_business_data-name_3.
*            lfa1-name4 = ls_business_data-name_4.
*            lfa1-stcd1 = ls_business_data-stcd_1.
            e_stcd1 = ls_business_data-stcd_1.
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


  METHOD prcd_elements.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_prcd_elements=>tys_z_i_prcd_elementstype,
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
          lt_range_knumv      TYPE RANGE OF char10,
          ls_range_knumv      LIKE LINE OF lt_range_knumv,
          lt_range_kschl      TYPE RANGE OF char4,
          ls_range_kschl      LIKE LINE OF lt_range_kschl,
          lt_range_kherk      TYPE RANGE OF char1,
          ls_range_kherk      LIKE LINE OF lt_range_kherk.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_PRCD_ELEMENTS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_PRCD_ELEMENTS' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_knumv-sign = 'I'.
            ls_range_knumv-option = 'EQ'.
            ls_range_knumv-low = i_knumv.
            APPEND ls_range_knumv TO lt_range_knumv.

            ls_range_kschl-sign = 'I'.
            ls_range_kschl-option = 'EQ'.
            ls_range_kschl-low = i_kschl.
            APPEND ls_range_kschl TO lt_range_kschl.

            ls_range_kherk-sign = 'I'.
            ls_range_kherk-option = 'EQ'.
            ls_range_kherk-low = i_kherk.
            APPEND ls_range_kherk TO lt_range_kherk.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_PRCD_ELEMENTS' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'KNUMV'
                                                                    it_range             = lt_range_KNUMV ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'KSCHL'
                                                                    it_range             = lt_range_kschl ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'KHERK'
                                                                    it_range             = lt_range_kherk ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            IF sy-subrc = 0.
              e_lifnr = ls_business_data-lifnr.
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


  METHOD ekko.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zvts_rfq_detail=>tys_z_i_ekkotype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

*        DATA:
*          lt_business_data TYPE TABLE OF zscm_zvts_rfq_detail=>tys_z_i_ekkotype,
*          lo_http_client   TYPE REF TO if_web_http_client,
*          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
*          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
*          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
*          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
*          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
*          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
*          lo_filter_node_3    TYPE REF TO /iwbep/if_cp_filter_node,
*          lo_filter_node_4    TYPE REF TO /iwbep/if_cp_filter_node,
*          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_ebeln TYPE RANGE OF ebeln,
          ls_range_ebeln LIKE LINE OF lt_range_ebeln,
          ls_ekko        LIKE LINE OF t_ekko.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
* lt_range_TITLE TYPE RANGE OF <element_name>,
          lt_range_ID         TYPE RANGE OF sysuuid_x16.



        TRY.
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVTS_RFQ_DETAIL'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVTS_RFQ_DETAIL' ).

            ASSERT lo_http_client IS BOUND.


            IF i_quotation IS NOT INITIAL.
              ls_range_ebeln-sign = 'I'.
              ls_range_ebeln-option = 'EQ'.
              ls_range_ebeln-low = i_quotation.
              APPEND ls_range_ebeln TO lt_range_ebeln.
            ENDIF.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKKO' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).
            IF lt_range_ebeln IS NOT INITIAL.
              lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                      it_range             = lt_range_ebeln ).
            ENDIF.
            lo_filter_node_root = lo_filter_node_1.

            lo_request->set_filter( lo_filter_node_root ).

*            lo_request->set_top( 5000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_ekko.
              ls_ekko-inco1 = ls_business_data-inco_1.
              ls_ekko-inco2 = ls_business_data-inco_2.
              APPEND ls_ekko TO t_ekko.
              CLEAR ls_ekko.
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


  METHOD vttk.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_vttktype,
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
          lt_range_tpbez      TYPE RANGE OF char20,
          ls_range_tpbez      LIKE LINE OF lt_range_tpbez,
*          ls_invoice          LIKE LINE OF i_vttk,
          ls_vttk             LIKE LINE OF it_vttk.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_tknum, lt_range_tpbez.
            ls_range_tknum-sign = 'I'.
            ls_range_tknum-option = 'EQ'.
            ls_range_tknum-low = is_invoice-rebel.
            APPEND ls_range_tknum TO lt_range_tknum.
            CLEAR ls_range_tknum.

*            DATA(lv_ebeln) = |{ is_invoice-ebeln ALPHA = IN }|.
            ls_range_tpbez-sign = 'I'.
            ls_range_tpbez-option = 'EQ'.
            ls_range_tpbez-low = is_invoice-ebeln.
            APPEND ls_range_tpbez TO lt_range_tpbez.
            CLEAR ls_range_tpbez.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'TKNUM'
                                                                    it_range             = lt_range_tknum ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'TPBEZ'
                                                                    it_range             = lt_range_tpbez ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_vttk.
              ls_vttk-add01 = ls_business_data-add_01.
              ls_vttk-add02 = ls_business_data-add_02.
              ls_vttk-add03 = ls_business_data-add_03.
              ls_vttk-add04 = ls_business_data-add_04.
              ls_vttk-exti1 = ls_business_data-exti_1.
              ls_vttk-exti2 = ls_business_data-exti_2.
              ls_vttk-text1 = ls_business_data-text_1.
              ls_vttk-text2 = ls_business_data-text_2.
              ls_vttk-text3 = ls_business_data-text_3.
              ls_vttk-text4 = ls_business_data-text_4.
              APPEND ls_vttk TO it_vttk.
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


  METHOD vttk2.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_vttktype,
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
          lt_range_tpbez      TYPE RANGE OF char20,
          ls_range_tpbez      LIKE LINE OF lt_range_tpbez.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_tknum, lt_range_tpbez.
            ls_range_tknum-sign = 'I'.
            ls_range_tknum-option = 'EQ'.
            ls_range_tknum-low = lv_tknum.
            APPEND ls_range_tknum TO lt_range_tknum.
            CLEAR ls_range_tknum.

*            DATA(lv_ebeln) = |{ is_invoice-ebeln ALPHA = IN }|.
            ls_range_tpbez-sign = 'I'.
            ls_range_tpbez-option = 'EQ'.
            ls_range_tpbez-low = lv_tpbez.
            APPEND ls_range_tpbez TO lt_range_tpbez.
            CLEAR ls_range_tpbez.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'TKNUM'
                                                                    it_range             = lt_range_tknum ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'TPBEZ'
                                                                    it_range             = lt_range_tpbez ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_vttk.
              EXIT.
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


  METHOD vttk3.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_vttktype,
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
          lt_range_tknum      TYPE RANGE OF char10,
          ls_range_tknum      LIKE LINE OF lt_range_tknum,
          lt_range_sttrg      TYPE RANGE OF char1,
          ls_range_sttrg      LIKE LINE OF lt_range_sttrg,
          lt_range_exti1      TYPE RANGE OF char20,
          ls_range_exti1      LIKE LINE OF lt_range_exti1.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_tknum, lt_range_sttrg, ls_range_exti1.
            ls_range_tknum-sign = 'I'.
            ls_range_tknum-option = 'EQ'.
            ls_range_tknum-low = lv_tknum.
            APPEND ls_range_tknum TO lt_range_tknum.
            CLEAR ls_range_tknum.

            ls_range_sttrg-sign = 'I'.
            ls_range_sttrg-option = 'EQ'.
            ls_range_sttrg-low = '7'.
            APPEND ls_range_sttrg TO lt_range_sttrg.
            CLEAR ls_range_sttrg.

            ls_range_exti1-sign = 'I'.
            ls_range_exti1-option = 'EQ'.
            ls_range_exti1-low = lv_exti1.
            APPEND ls_range_exti1 TO lt_range_exti1.
            CLEAR ls_range_exti1.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'TKNUM'
                                                                    it_range             = lt_range_tknum ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'STTRG'
                                                                    it_range             = lt_range_sttrg ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'EXTI_1'
                                                                    it_range             = lt_range_exti1 ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              v_tknum = ls_business_data-tknum.
              v_exti1 = ls_business_data-exti_1.
              EXIT.
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


  METHOD vttk4.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_vttktype,
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
          lt_range_tknum      TYPE RANGE OF char10,
          ls_range_tknum      LIKE LINE OF lt_range_tknum,
          lt_range_sttrg      TYPE RANGE OF char1,
          ls_range_sttrg      LIKE LINE OF lt_range_sttrg,
          lt_range_exti1      TYPE RANGE OF char20,
          ls_range_exti1      LIKE LINE OF lt_range_exti1.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_tknum, lt_range_sttrg, ls_range_exti1.
            ls_range_tknum-sign = 'I'.
            ls_range_tknum-option = 'EQ'.
            ls_range_tknum-low = lv_tknum.
            APPEND ls_range_tknum TO lt_range_tknum.
            CLEAR ls_range_tknum.

            ls_range_sttrg-sign = 'I'.
            ls_range_sttrg-option = 'EQ'.
            ls_range_sttrg-low = '7'.
            APPEND ls_range_sttrg TO lt_range_sttrg.
            CLEAR ls_range_sttrg.

            ls_range_exti1-sign = 'I'.
            ls_range_exti1-option = 'EQ'.
            ls_range_exti1-low = lv_exti1.
            APPEND ls_range_exti1 TO lt_range_exti1.
            CLEAR ls_range_exti1.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'TKNUM'
                                                                    it_range             = lt_range_tknum ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'STTRG'
                                                                    it_range             = lt_range_sttrg ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'EXTI_1'
                                                                    it_range             = lt_range_exti1 ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              v_tknum = ls_business_data-tknum.
              v_exti1 = ls_business_data-exti_1.
              EXIT.
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


  METHOD vttk5.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_vttktype,
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
          lt_range_sttrg      TYPE RANGE OF char1,
          ls_range_sttrg      LIKE LINE OF lt_range_sttrg.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_tknum, lt_range_sttrg.
            ls_range_tknum-sign = 'I'.
            ls_range_tknum-option = 'EQ'.
            ls_range_tknum-low = lv_tknum.
            APPEND ls_range_tknum TO lt_range_tknum.
            CLEAR ls_range_tknum.

            ls_range_sttrg-sign = 'I'.
            ls_range_sttrg-option = 'EQ'.
            ls_range_sttrg-low = '7'.
            APPEND ls_range_sttrg TO lt_range_sttrg.
            CLEAR ls_range_sttrg.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTK' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'TKNUM'
                                                                    it_range             = lt_range_tknum ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'STTRG'
                                                                    it_range             = lt_range_sttrg ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_vttk.
              EXIT.
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


  METHOD vtts.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_vttstype,
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
          lt_range_TKNUM      TYPE RANGE OF char10,
          ls_range_tknum      LIKE LINE OF lt_range_tknum,
          lt_range_tdlnr      TYPE RANGE OF lifnr,
          ls_range_tdlnr      LIKE LINE OF lt_range_tdlnr,
          lt_range_abland1    TYPE RANGE OF land1,
          ls_range_abland1    LIKE LINE OF lt_range_abland1.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_tknum-sign = 'I'.
            ls_range_tknum-option = 'EQ'.
            ls_range_tknum-low = st_vttk-tknum.
            APPEND ls_range_tknum TO lt_range_tknum.
            CLEAR ls_range_tknum.

            ls_range_tdlnr-sign = 'I'.
            ls_range_tdlnr-option = 'EQ'.
            ls_range_tdlnr-low = st_vttk-tdlnr.
            APPEND ls_range_tdlnr TO lt_range_tdlnr.

            ls_range_abland1-sign = 'I'.
            ls_range_abland1-option = 'EQ'.
            ls_range_abland1-low = 'MX'.
            APPEND ls_range_abland1 TO lt_range_abland1.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTS' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'TKNUM'
                                                                    it_range             = lt_range_TKNUM ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'TDLNR'
                                                                    it_range             = lt_range_tdlnr ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'ABLAND_1'
                                                                    it_range             = lt_range_abland1 ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            IF sy-subrc = 0.
              MOVE-CORRESPONDING ls_business_data TO st_vtts.
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


  METHOD vtts2.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_vttstype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_TKNUM      TYPE RANGE OF char10,
          ls_range_tknum      LIKE LINE OF lt_range_tknum,
          lt_range_tdlnr      TYPE RANGE OF lifnr,
          ls_range_tdlnr      LIKE LINE OF lt_range_tdlnr,
          lt_range_abland1    TYPE RANGE OF land1,
          ls_range_abland1    LIKE LINE OF lt_range_abland1.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_tknum-sign = 'I'.
            ls_range_tknum-option = 'EQ'.
            ls_range_tknum-low = st_vttk-tknum.
            APPEND ls_range_tknum TO lt_range_tknum.
            CLEAR ls_range_tknum.

            ls_range_tdlnr-sign = 'I'.
            ls_range_tdlnr-option = 'EQ'.
            ls_range_tdlnr-low = i_lifnr.
            APPEND ls_range_tdlnr TO lt_range_tdlnr.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTS' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'TKNUM'
                                                                    it_range             = lt_range_TKNUM ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'TDLNR'
                                                                    it_range             = lt_range_tdlnr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            IF sy-subrc = 0.
              MOVE-CORRESPONDING ls_business_data TO st_vtts.
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


  METHOD vtts3.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_vttstype,
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
          lt_range_TKNUM      TYPE RANGE OF char10,
          ls_range_tknum      LIKE LINE OF lt_range_tknum,
          lt_range_tdlnr      TYPE RANGE OF lifnr,
          ls_range_tdlnr      LIKE LINE OF lt_range_tdlnr,
          lt_range_edland1    TYPE RANGE OF land1,
          ls_range_edland1    LIKE LINE OF lt_range_edland1.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_tknum-sign = 'I'.
            ls_range_tknum-option = 'EQ'.
            ls_range_tknum-low = st_vttk-tknum.
            APPEND ls_range_tknum TO lt_range_tknum.
            CLEAR ls_range_tknum.

            ls_range_tdlnr-sign = 'I'.
            ls_range_tdlnr-option = 'EQ'.
            ls_range_tdlnr-low = i_lifnr.
            APPEND ls_range_tdlnr TO lt_range_tdlnr.

            ls_range_edland1-sign = 'E'.
            ls_range_edland1-option = 'EQ'.
            ls_range_edland1-low = 'MX'.
            APPEND ls_range_edland1 TO lt_range_edland1.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTS' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'TKNUM'
                                                                    it_range             = lt_range_TKNUM ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'TDLNR'
                                                                    it_range             = lt_range_tdlnr ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'EDLAND_1'
                                                                    it_range             = lt_range_edland1 ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            IF sy-subrc = 0.
              MOVE-CORRESPONDING ls_business_data TO st_vtts.
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


  METHOD vtts4.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_vttstype,
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
          lt_range_TKNUM      TYPE RANGE OF char10,
          ls_range_tknum      LIKE LINE OF lt_range_tknum,
          lt_range_tdlnr      TYPE RANGE OF lifnr,
          ls_range_tdlnr      LIKE LINE OF lt_range_tdlnr,
          lt_range_vsart      TYPE RANGE OF char2,
          ls_range_vsart      LIKE LINE OF lt_range_vsart.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_tknum-sign = 'I'.
            ls_range_tknum-option = 'EQ'.
            ls_range_tknum-low = st_vttk-tknum.
            APPEND ls_range_tknum TO lt_range_tknum.
            CLEAR ls_range_tknum.

            ls_range_tdlnr-sign = 'I'.
            ls_range_tdlnr-option = 'EQ'.
            ls_range_tdlnr-low = st_vttk-tdlnr.
            APPEND ls_range_tdlnr TO lt_range_tdlnr.

            ls_range_vsart-sign = 'I'.
            ls_range_vsart-option = 'EQ'.
            ls_range_vsart-low = '04'.
            APPEND ls_range_vsart TO lt_range_vsart.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VTTS' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'TKNUM'
                                                                    it_range             = lt_range_TKNUM ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'TDLNR'
                                                                    it_range             = lt_range_tdlnr ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'VSART'
                                                                    it_range             = lt_range_vsart ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            IF sy-subrc = 0.
              MOVE-CORRESPONDING ls_business_data TO st_vtts.
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


  METHOD adrc.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_adrctype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_ADDRNUMBER TYPE RANGE OF zst_adrc-addrnumber,
          ls_range_ADDRNUMBER LIKE LINE OF lt_range_ADDRNUMBER.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_ADDRNUMBER-sign = 'I'.
            ls_range_ADDRNUMBER-option = 'EQ'.
            ls_range_ADDRNUMBER-low = lv_adrnz.
            APPEND ls_range_ADDRNUMBER TO lt_range_ADDRNUMBER.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ADRC' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'ADDRNUMBER'
                                                                    it_range             = lt_range_ADDRNUMBER ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            IF sy-subrc = 0.
              st_adrc-country    = ls_business_data-country.
              st_adrc-name1      = ls_business_data-name_1.
              st_adrc-city1      = ls_business_data-city_1.
              st_adrc-post_code1 = ls_business_data-post_code_1.
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


  METHOD vbfa.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_details=>tys_z_i_vbfatype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_vbelv      TYPE RANGE OF vbelv,
          ls_range_vbelv      LIKE LINE OF lt_range_vbelv,
          wa_vbfa             LIKE LINE OF it_vbfa.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALESORDER_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALESORDER_DETAILS' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_vbelv, ls_range_vbelv.
            ls_range_vbelv-sign = 'I'.
            ls_range_vbelv-option = 'EQ'.
            ls_range_vbelv-low = lv_ebeln.
            APPEND ls_range_vbelv TO lt_range_vbelv.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VBFA' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELV'
                                                                    it_range             = lt_range_VBELV ).

            lo_filter_node_root = lo_filter_node_2.
            lo_request->set_filter( lo_filter_node_root ).

*            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO wa_vbfa.
              APPEND wa_vbfa TO it_vbfa.
              CLEAR wa_vbfa.
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


  METHOD vbfa2.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_salesorder_details=>tys_z_i_vbfatype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_vbelv      TYPE RANGE OF vbelv,
          ls_range_vbelv      LIKE LINE OF lt_range_vbelv,
          wa_vbfa             LIKE LINE OF it_vbfa.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_SALESORDER_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SALESORDER_DETAILS' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_vbelv, ls_range_vbelv.
            ls_range_vbelv-sign = 'I'.
            ls_range_vbelv-option = 'EQ'.
            ls_range_vbelv-low = lv_ebeln.
            APPEND ls_range_vbelv TO lt_range_vbelv.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_VBFA' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'VBELV'
                                                                    it_range             = lt_range_VBELV ).

            lo_filter_node_root = lo_filter_node_2.
            lo_request->set_filter( lo_filter_node_root ).

*            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              IF ls_business_data-vbtyp_n EQ '8'.
                MOVE-CORRESPONDING ls_business_data TO wa_vbfa.
                APPEND wa_vbfa TO it_vbfa.
                CLEAR wa_vbfa.
              ENDIF.
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


  METHOD essr.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_po_details=>tys_z_i_essrtype,
          ls_business_data TYPE zscm_po_details=>tys_z_i_essrtype,
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
                                                     proxy_model_id      = 'ZSCM_PO_DETAILS'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_PO_DETAIL' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      lblni  = lv_lblni ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ESSR' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            MOVE-CORRESPONDING ls_business_data TO ls_esrr.

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


  METHOD rbkp.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_rbkp=>tys_z_i_rbkptype,
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
          lt_range_belnr      TYPE RANGE OF belnr_d,
          ls_range_belnr      LIKE LINE OF lt_range_belnr,
          lt_range_gjahr      TYPE RANGE OF gjahr,
          ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
          lt_range_xblnr      TYPE RANGE OF xblnr,
          ls_range_xblnr      LIKE LINE OF lt_range_xblnr.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_RBKP'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_RBKP' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_belnr-sign = 'I'.
            ls_range_belnr-option = 'EQ'.
            ls_range_belnr-low = lv_belnr.
            APPEND ls_range_belnr TO lt_range_belnr.

            ls_range_gjahr-sign = 'I'.
            ls_range_gjahr-option = 'EQ'.
            ls_range_gjahr-low = lv_gjahr.
            APPEND ls_range_gjahr TO lt_range_gjahr.

            ls_range_xblnr-sign = 'I'.
            ls_range_xblnr-option = 'EQ'.
            ls_range_xblnr-low = lv_xblnr.
            APPEND ls_range_xblnr TO lt_range_xblnr.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_RBKP' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                    it_range             = lt_range_belnr ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                    it_range             = lt_range_gjahr ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'XBLNR'
                                                                    it_range             = lt_range_xblnr ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            IF sy-subrc = 0.
              MOVE-CORRESPONDING ls_business_data TO ls_rbkp.
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


  METHOD t006.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zverifica_factura=>tys_z_i_t_006_type,
          ls_business_data TYPE zscm_zverifica_factura=>tys_z_i_t_006_type,
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
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      msehi  = lv_msehi ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_006' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            MOVE-CORRESPONDING ls_business_data TO ls_t006.

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


  METHOD esll.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_eslltype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_PACKNO     TYPE RANGE OF packno,
          ls_range_PACKNO     LIKE LINE OF lt_range_PACKNO.



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

            ls_range_PACKNO-sign = 'I'.
            ls_range_PACKNO-option = 'EQ'.
            ls_range_PACKNO-low = lv_packno.
            APPEND ls_range_PACKNO TO lt_range_PACKNO.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ESLL' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'PACKNO'
                                                                    it_range             = lt_range_PACKNO ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            IF sy-subrc = 0.
              MOVE-CORRESPONDING ls_business_data TO ls_esll.
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


  METHOD eskn.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_eskntype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_packno     TYPE RANGE OF packno,
          ls_range_packno     LIKE LINE OF lt_range_packno,
          lt_range_zekkn      TYPE RANGE OF numc2,
          ls_range_zekkn      LIKE LINE OF lt_range_zekkn,
          ls_eskn             LIKE LINE OF lt_eskn.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_packno, ls_range_packno.
            ls_range_packno-sign = 'I'.
            ls_range_packno-option = 'EQ'.
            ls_range_packno-low = lv_lfbnr.
            APPEND ls_range_packno TO lt_range_packno.

            CLEAR: lt_range_zekkn, ls_range_zekkn.
            ls_range_zekkn-sign = 'I'.
            ls_range_zekkn-option = 'EQ'.
            ls_range_zekkn-low = lv_zekkn.
            APPEND ls_range_zekkn TO lt_range_zekkn.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ESKN' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'PACKNO'
                                                                    it_range             = lt_range_packno ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'ZEKKN'
                                                                    it_range             = lt_range_zekkn ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            .  lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO ls_eskn.
              APPEND ls_eskn TO lt_eskn.
              CLEAR ls_eskn.
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
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_ekkntype,
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
          ls_range_ebelp      LIKE LINE OF lt_range_ebelp,
          ls_ekkn             LIKE LINE OF lt_ekkn.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR: lt_range_ebeln, ls_range_ebeln.
            ls_range_ebeln-sign = 'I'.
            ls_range_ebeln-option = 'EQ'.
            ls_range_ebeln-low = lv_ebeln.
            APPEND ls_range_ebeln TO lt_range_ebeln.

            CLEAR: lt_range_ebelp, ls_range_ebelp.
            ls_range_ebelp-sign = 'I'.
            ls_range_ebelp-option = 'EQ'.
            ls_range_ebelp-low = lv_ebelp.
            APPEND ls_range_ebelp TO lt_range_ebelp.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKKN' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_ebeln ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELP'
                                                                    it_range             = lt_range_ebelp ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              IF ls_business_data-loekz EQ space.
                MOVE-CORRESPONDING ls_business_data TO ls_ekkn.
                APPEND ls_ekkn TO lt_ekkn.
                CLEAR ls_ekkn.
              ENDIF.
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


  METHOD zinv_spool.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_zinv_spooltype,
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
          lt_range_nofact     TYPE RANGE OF xblnr,
          ls_range_nofact     LIKE LINE OF lt_range_nofact,
          lt_range_doctyp     TYPE RANGE OF char1,
          ls_range_doctyp     LIKE LINE OF lt_range_doctyp,
          lt_range_ebeln      TYPE RANGE OF ebeln,
          ls_range_ebeln      LIKE LINE OF lt_range_ebeln.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_nofact-sign = 'I'.
            ls_range_nofact-option = 'EQ'.
            ls_range_nofact-low = lv_nofact.
            APPEND ls_range_nofact TO lt_range_nofact.

            ls_range_doctyp-sign = 'I'.
            ls_range_doctyp-option = 'EQ'.
            ls_range_doctyp-low = lv_doctyp.
            APPEND ls_range_doctyp TO lt_range_doctyp.

            ls_range_ebeln-sign = 'I'.
            ls_range_ebeln-option = 'EQ'.
            ls_range_ebeln-low = lv_ebeln.
            APPEND ls_range_ebeln TO lt_range_ebeln.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ZINV_SPOOL' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'NOFACT'
                                                                    it_range             = lt_range_NOFACT ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'DOCTYP'
                                                                    it_range             = lt_range_DOCTYP ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_ebeln ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            IF sy-subrc = 0.
              MOVE-CORRESPONDING ls_business_data TO ls_zinv.
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


  METHOD zinv_spool2.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_zinv_spooltype,
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
          lt_range_nofact     TYPE RANGE OF xblnr,
          ls_range_nofact     LIKE LINE OF lt_range_nofact,
          lt_range_doctyp     TYPE RANGE OF char1,
          ls_range_doctyp     LIKE LINE OF lt_range_doctyp,
          lt_range_ebeln      TYPE RANGE OF ebeln,
          ls_range_ebeln      LIKE LINE OF lt_range_ebeln.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_nofact-sign = 'I'.
            ls_range_nofact-option = 'EQ'.
            ls_range_nofact-low = lv_nofact.
            APPEND ls_range_nofact TO lt_range_nofact.

            ls_range_doctyp-sign = 'I'.
            ls_range_doctyp-option = 'EQ'.
            ls_range_doctyp-low = lv_doctyp.
            APPEND ls_range_doctyp TO lt_range_doctyp.

            ls_range_ebeln-sign = 'I'.
            ls_range_ebeln-option = 'EQ'.
            ls_range_ebeln-low = lv_ebeln.
            APPEND ls_range_ebeln TO lt_range_ebeln.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ZINV_SPOOL' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'NOFACT'
                                                                    it_range             = lt_range_NOFACT ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'DOCTYP'
                                                                    it_range             = lt_range_DOCTYP ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_ebeln ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data) WHERE invoice_mm <> space.
              MOVE-CORRESPONDING ls_business_data TO ls_zinv.
              EXIT.
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
          lt_business_data TYPE TABLE OF zscm_zverifica_factura=>tys_z_i_bkpftype,
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
          lt_range_awkey      TYPE RANGE OF awkey,
          ls_range_awkey      LIKE LINE OF lt_range_awkey,
          lt_range_awtyp      TYPE RANGE OF awtyp,
          ls_range_awtyp      LIKE LINE OF lt_range_awtyp,
          lt_range_blart      TYPE RANGE OF blart,
          ls_range_blart      LIKE LINE OF lt_range_blart.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVERIFICA_FACTURA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ZVERIFICA_FACTURA' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_awkey-sign = 'I'.
            ls_range_awkey-option = 'EQ'.
            ls_range_awkey-low = lv_awkey.
            APPEND ls_range_awkey TO lt_range_awkey.

            ls_range_awtyp-sign = 'I'.
            ls_range_awtyp-option = 'EQ'.
            ls_range_awtyp-low = 'RMRP'.
            APPEND ls_range_awtyp TO lt_range_awtyp.

            ls_range_blart-sign = 'I'.
            ls_range_blart-option = 'EQ'.
            ls_range_blart-low = 'RE'.
            APPEND ls_range_blart TO lt_range_blart.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_BKPF' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'AWKEY'
                                                                    it_range             = lt_range_awkey ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'AWTYP'
                                                                    it_range             = lt_range_awtyp ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'BLART'
                                                                    it_range             = lt_range_blart ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            IF sy-subrc = 0.
              lv_belnr = ls_business_data-belnr.
              lv_gjahr = ls_business_data-gjahr.
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


  METHOD ekbe1.

    DATA:
      lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_ekbetype,
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
      lt_range_bewtp      TYPE RANGE OF char1,
      ls_range_bewtp      LIKE LINE OF lt_range_bewtp,
      lt_range_bwart      TYPE RANGE OF bwart,
      ls_range_bwart      LIKE LINE OF lt_range_bwart,
      ls_ekbe             LIKE LINE OF et_ekbe.

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

        ls_range_ebeln-sign = 'I'.
        ls_range_ebeln-option = 'EQ'.
        ls_range_ebeln-low = i_ebeln.
        APPEND ls_range_ebeln TO lt_range_ebeln.

        ls_range_bewtp-sign = 'I'.
        ls_range_bewtp-option = 'EQ'.
        ls_range_bewtp-low = 'E'.
        APPEND ls_range_bewtp TO lt_range_bewtp.

        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '101'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '103'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '105'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '911'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '913'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '123'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '102'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '104'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '106'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '122'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '924'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '925'.APPEND ls_range_bwart TO lt_range_bwart.

        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKBE' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                it_range             = lt_range_ebeln ).
        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BEWTP'
                                                                it_range             = lt_range_bewtp ).
        lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'BWART'
                                                                it_range             = lt_range_bwart ).

        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
        lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

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

  ENDMETHOD.


  METHOD ekbe2.

    DATA:
      lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_ekbetype,
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
      lt_range_ebeln      TYPE RANGE OF ebeln,
      ls_range_ebeln      LIKE LINE OF lt_range_ebeln,
      lt_range_bewtp      TYPE RANGE OF char1,
      ls_range_bewtp      LIKE LINE OF lt_range_bewtp,
      lt_range_bwart      TYPE RANGE OF bwart,
      ls_range_bwart      LIKE LINE OF lt_range_bwart,
      lt_range_ebelp      TYPE RANGE OF ebelp,
      ls_range_ebelp      LIKE LINE OF lt_range_ebelp,
      lt_range_lfbnr      TYPE RANGE OF char10,
      ls_range_lfbnr      LIKE LINE OF lt_range_lfbnr,
      ls_ekbe             LIKE LINE OF et_ekbe.

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

        ls_range_ebeln-sign = 'I'.
        ls_range_ebeln-option = 'EQ'.
        ls_range_ebeln-low = i_ebeln.
        APPEND ls_range_ebeln TO lt_range_ebeln.

        ls_range_ebelp-sign = 'I'.
        ls_range_ebelp-option = 'EQ'.
        ls_range_ebelp-low = i_ebelp.
        APPEND ls_range_ebelp TO lt_range_ebelp.

        ls_range_lfbnr-sign = 'I'.
        ls_range_lfbnr-option = 'EQ'.
        ls_range_lfbnr-low = i_lblni.
        APPEND ls_range_lfbnr TO lt_range_lfbnr.

        ls_range_bewtp-sign = 'I'.
        ls_range_bewtp-option = 'EQ'.
        ls_range_bewtp-low = 'E'.
        APPEND ls_range_bewtp TO lt_range_bewtp.

        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '101'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '103'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '105'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '911'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '913'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '123'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '102'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '104'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '106'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '122'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '924'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '925'.APPEND ls_range_bwart TO lt_range_bwart.

        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKBE' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                it_range             = lt_range_ebeln ).
        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELP'
                                                                it_range             = lt_range_ebelp ).
        lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'LFBNR'
                                                                it_range             = lt_range_lfbnr ).
        lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BEWTP'
                                                                it_range             = lt_range_bewtp ).
        lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'BWART'
                                                                it_range             = lt_range_bwart ).

        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 ).
        lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

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

  ENDMETHOD.


  METHOD ekbe3.

    DATA:
      lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_ekbetype,
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
      lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
      lt_range_ebeln      TYPE RANGE OF ebeln,
      ls_range_ebeln      LIKE LINE OF lt_range_ebeln,
      lt_range_bewtp      TYPE RANGE OF char1,
      ls_range_bewtp      LIKE LINE OF lt_range_bewtp,
      lt_range_bwart      TYPE RANGE OF bwart,
      ls_range_bwart      LIKE LINE OF lt_range_bwart,
      lt_range_ebelp      TYPE RANGE OF ebelp,
      ls_range_ebelp      LIKE LINE OF lt_range_ebelp,
      lt_range_belnr      TYPE RANGE OF belnr_d,
      ls_range_belnr      LIKE LINE OF lt_range_belnr,
      lt_range_buzei      TYPE RANGE OF buzei,
      ls_range_buzei      LIKE LINE OF lt_range_buzei,
      ls_ekbe             LIKE LINE OF et_ekbe.

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

        ls_range_ebeln-sign = 'I'.
        ls_range_ebeln-option = 'EQ'.
        ls_range_ebeln-low = i_ebeln.
        APPEND ls_range_ebeln TO lt_range_ebeln.

        ls_range_ebelp-sign = 'I'.
        ls_range_ebelp-option = 'EQ'.
        ls_range_ebelp-low = i_ebelp.
        APPEND ls_range_ebelp TO lt_range_ebelp.

        ls_range_belnr-sign = 'I'.
        ls_range_belnr-option = 'EQ'.
        ls_range_belnr-low = i_belnr.
        APPEND ls_range_belnr TO lt_range_belnr.

        ls_range_buzei-sign = 'I'.
        ls_range_buzei-option = 'EQ'.
        ls_range_buzei-low = i_buzei.
        APPEND ls_range_buzei TO lt_range_buzei.

        ls_range_bewtp-sign = 'I'.
        ls_range_bewtp-option = 'EQ'.
        ls_range_bewtp-low = 'E'.
        APPEND ls_range_bewtp TO lt_range_bewtp.

        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '101'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '103'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '105'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '911'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '913'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '123'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '102'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '104'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '106'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '122'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '924'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '925'.APPEND ls_range_bwart TO lt_range_bwart.

        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKBE' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                it_range             = lt_range_ebeln ).
        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELP'
                                                                it_range             = lt_range_ebelp ).
        lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'BELNR'
                                                                it_range             = lt_range_belnr ).
        lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BUZEI'
                                                                it_range             = lt_range_buzei ).
        lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'BEWTP'
                                                                it_range             = lt_range_bewtp ).
        lo_filter_node_6  = lo_filter_factory->create_by_range( iv_property_path     = 'BWART'
                                                                it_range             = lt_range_bwart ).

        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 )->and( lo_filter_node_6 ).
        lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

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

  ENDMETHOD.


  METHOD ekbe4.

    DATA:
      lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_ekbetype,
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
      lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
      lt_range_ebeln      TYPE RANGE OF ebeln,
      ls_range_ebeln      LIKE LINE OF lt_range_ebeln,
      lt_range_bewtp      TYPE RANGE OF char1,
      ls_range_bewtp      LIKE LINE OF lt_range_bewtp,
      lt_range_bwart      TYPE RANGE OF bwart,
      ls_range_bwart      LIKE LINE OF lt_range_bwart,
      lt_range_ebelp      TYPE RANGE OF ebelp,
      ls_range_ebelp      LIKE LINE OF lt_range_ebelp,
      lt_range_lfbnr      TYPE RANGE OF char10,
      ls_range_lfbnr      LIKE LINE OF lt_range_lfbnr,
      lt_range_buzei      TYPE RANGE OF buzei,
      ls_range_buzei      LIKE LINE OF lt_range_buzei,
      lt_range_vgabe      TYPE RANGE OF char1,
      ls_range_vgabe      LIKE LINE OF lt_range_vgabe.

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

        ls_range_ebeln-sign = 'I'.
        ls_range_ebeln-option = 'EQ'.
        ls_range_ebeln-low = i_ebeln.
        APPEND ls_range_ebeln TO lt_range_ebeln.

        ls_range_ebelp-sign = 'I'.
        ls_range_ebelp-option = 'EQ'.
        ls_range_ebelp-low = i_ebelp.
        APPEND ls_range_ebelp TO lt_range_ebelp.

        ls_range_lfbnr-sign = 'I'.
        ls_range_lfbnr-option = 'EQ'.
        ls_range_lfbnr-low = i_lfbnr.
        APPEND ls_range_lfbnr TO lt_range_lfbnr.

        ls_range_buzei-sign = 'I'.
        ls_range_buzei-option = 'EQ'.
        ls_range_buzei-low = i_buzei.
        APPEND ls_range_buzei TO lt_range_buzei.

        ls_range_bewtp-sign = 'I'.
        ls_range_bewtp-option = 'EQ'.
        ls_range_bewtp-low = 'E'.
        APPEND ls_range_bewtp TO lt_range_bewtp.

        ls_range_vgabe-sign = 'I'.
        ls_range_vgabe-option = 'EQ'.
        ls_range_vgabe-low = '1'.
        APPEND ls_range_vgabe TO lt_range_vgabe.

        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '102'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '104'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '106'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '122'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '912'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '924'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '925'.APPEND ls_range_bwart TO lt_range_bwart.

        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKBE' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                it_range             = lt_range_ebeln ).
        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELP'
                                                                it_range             = lt_range_ebelp ).
        lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'LFBNR'
                                                                it_range             = lt_range_lfbnr ).
        lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BUZEI'
                                                                it_range             = lt_range_buzei ).
        lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'BEWTP'
                                                                it_range             = lt_range_bewtp ).
        lo_filter_node_6  = lo_filter_factory->create_by_range( iv_property_path     = 'BWART'
                                                                it_range             = lt_range_bwart ).
        lo_filter_node_7  = lo_filter_factory->create_by_range( iv_property_path     = 'VGABE'
                                                                it_range             = lt_range_vgabe ).

        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 )->and( lo_filter_node_6 )->and( lo_filter_node_7 ).
        lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        IF lt_business_data IS INITIAL.
          e_subrc = 4.
        ENDIF.

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection
        e_subrc = 4.

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " Handle Exception

      CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
        " Handle Exception
        RAISE SHORTDUMP lx_web_http_client_error.


    ENDTRY.

  ENDMETHOD.


  METHOD ekbe5.

    DATA:
      lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_ekbetype,
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
      lt_range_xblnr      TYPE RANGE OF xblnr,
      ls_range_xblnr      LIKE LINE OF lt_range_xblnr,
      lt_range_bewtp      TYPE RANGE OF char1,
      ls_range_bewtp      LIKE LINE OF lt_range_bewtp,
      lt_range_bwart      TYPE RANGE OF bwart,
      ls_range_bwart      LIKE LINE OF lt_range_bwart,
      lt_range_gjahr      TYPE RANGE OF ebelp,
      ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
      lt_range_lfbnr      TYPE RANGE OF char10,
      ls_range_lfbnr      LIKE LINE OF lt_range_lfbnr,
      ls_ekbe             LIKE LINE OF et_ekbe.

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

        ls_range_xblnr-sign = 'I'.
        ls_range_xblnr-option = 'EQ'.
        ls_range_xblnr-low = i_xblnr.
        APPEND ls_range_xblnr TO lt_range_xblnr.

        ls_range_gjahr-sign = 'I'.
        ls_range_gjahr-option = 'EQ'.
        ls_range_gjahr-low = i_gjahr.
        APPEND ls_range_gjahr TO lt_range_gjahr.

        ls_range_lfbnr-sign = 'E'.
        ls_range_lfbnr-option = 'EQ'.
        ls_range_lfbnr-low = space.
        APPEND ls_range_lfbnr TO lt_range_lfbnr.

        ls_range_bewtp-sign = 'I'.
        ls_range_bewtp-option = 'EQ'.
        ls_range_bewtp-low = 'E'.
        APPEND ls_range_bewtp TO lt_range_bewtp.

        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '101'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '103'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '105'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '911'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '913'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '123'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '102'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '104'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '106'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '122'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '924'.APPEND ls_range_bwart TO lt_range_bwart.
        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '925'.APPEND ls_range_bwart TO lt_range_bwart.

        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKBE' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'XBLNR'
                                                                it_range             = lt_range_xblnr ).
        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                it_range             = lt_range_gjahr ).
        lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'LFBNR'
                                                                it_range             = lt_range_lfbnr ).
        lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BEWTP'
                                                                it_range             = lt_range_bewtp ).
        lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'BWART'
                                                                it_range             = lt_range_bwart ).

        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 ).
        lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

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

  ENDMETHOD.


  METHOD ekbe6.

    DATA:
      lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_ekbetype,
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
      lt_range_bewtp      TYPE RANGE OF char1,
      ls_range_bewtp      LIKE LINE OF lt_range_bewtp,
      lt_range_bwart      TYPE RANGE OF bwart,
      ls_range_bwart      LIKE LINE OF lt_range_bwart,
      ls_ekbe_ant         LIKE LINE OF et_ekbe_ant.

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

        ls_range_ebeln-sign = 'I'.
        ls_range_ebeln-option = 'EQ'.
        ls_range_ebeln-low = i_ebeln.
        APPEND ls_range_ebeln TO lt_range_ebeln.

        ls_range_bewtp-sign = 'I'.
        ls_range_bewtp-option = 'EQ'.
        ls_range_bewtp-low = 'A'.
        APPEND ls_range_bewtp TO lt_range_bewtp.

        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = space.APPEND ls_range_bwart TO lt_range_bwart.

        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKBE' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                it_range             = lt_range_ebeln ).
        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BEWTP'
                                                                it_range             = lt_range_bewtp ).
        lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'BWART'
                                                                it_range             = lt_range_bwart ).

        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
        lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        LOOP AT lt_business_data INTO DATA(ls_business_data).
          MOVE-CORRESPONDING ls_business_data TO ls_ekbe_ant.
          APPEND ls_ekbe_ant TO et_ekbe_ant.
          CLEAR ls_ekbe_ant.
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

  ENDMETHOD.


  METHOD ekbe7.

    DATA:
      lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_ekbetype,
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
      lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
      lt_range_ebeln      TYPE RANGE OF ebeln,
      ls_range_ebeln      LIKE LINE OF lt_range_ebeln,
      lt_range_ebelp      TYPE RANGE OF ebelp,
      ls_range_ebelp      LIKE LINE OF lt_range_ebelp,
      lt_range_lfbnr      TYPE RANGE OF char10,
      ls_range_lfbnr      LIKE LINE OF lt_range_lfbnr,
      lt_range_vgabe      TYPE RANGE OF char1,
      ls_range_vgabe      LIKE LINE OF lt_range_vgabe,
      ls_ekbe             LIKE LINE OF et_ekbe.

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

        ls_range_ebeln-sign = 'I'.
        ls_range_ebeln-option = 'EQ'.
        ls_range_ebeln-low = i_ebeln.
        APPEND ls_range_ebeln TO lt_range_ebeln.

        ls_range_ebelp-sign = 'I'.
        ls_range_ebelp-option = 'EQ'.
        ls_range_ebelp-low = i_ebelp.
        APPEND ls_range_ebelp TO lt_range_ebelp.

        ls_range_vgabe-sign = 'I'.
        ls_range_vgabe-option = 'EQ'.
        ls_range_vgabe-low = '2'.
        APPEND ls_range_vgabe TO lt_range_vgabe.

        IF i_lfbnr IS NOT INITIAL.
          ls_range_lfbnr-sign = 'I'.
          ls_range_lfbnr-option = 'EQ'.
          ls_range_lfbnr-low = i_lfbnr.
          APPEND ls_range_lfbnr TO lt_range_lfbnr.
        ENDIF.

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
        IF lt_range_lfbnr IS NOT INITIAL.
          lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'LFBNR'
                                                                  it_range             = lt_range_lfbnr ).
        ENDIF.

        IF lt_range_lfbnr IS NOT INITIAL.
          lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 ).
        ELSE.
          lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
        ENDIF.
        lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

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

  ENDMETHOD.


  METHOD ekbe8.

    DATA:
      lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_ekbetype,
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
      lt_range_ebeln      TYPE RANGE OF ebeln,
      ls_range_ebeln      LIKE LINE OF lt_range_ebeln,
      lt_range_bewtp      TYPE RANGE OF char1,
      ls_range_bewtp      LIKE LINE OF lt_range_bewtp,
      lt_range_shkzg      TYPE RANGE OF shkzg,
      ls_range_shkzg      LIKE LINE OF lt_range_shkzg,
      lt_range_ebelp      TYPE RANGE OF ebelp,
      ls_range_ebelp      LIKE LINE OF lt_range_ebelp,
      lt_range_xblnr      TYPE RANGE OF xblnr,
      ls_range_xblnr      LIKE LINE OF lt_range_xblnr,
      ls_ekbe             LIKE LINE OF et_ekbe.

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

        ls_range_ebeln-sign = 'I'.
        ls_range_ebeln-option = 'EQ'.
        ls_range_ebeln-low = i_ebeln.
        APPEND ls_range_ebeln TO lt_range_ebeln.

        ls_range_ebelp-sign = 'I'.
        ls_range_ebelp-option = 'EQ'.
        ls_range_ebelp-low = i_ebelp.
        APPEND ls_range_ebelp TO lt_range_ebelp.

        ls_range_xblnr-sign = 'I'.
        ls_range_xblnr-option = 'EQ'.
        ls_range_xblnr-low = i_xblnr.
        APPEND ls_range_xblnr TO lt_range_xblnr.

        ls_range_bewtp-sign = 'I'.
        ls_range_bewtp-option = 'EQ'.
        ls_range_bewtp-low = 'Q'.
        APPEND ls_range_bewtp TO lt_range_bewtp.

        ls_range_bewtp-sign = 'I'.
        ls_range_bewtp-option = 'EQ'.
        ls_range_bewtp-low = 'R'.
        APPEND ls_range_bewtp TO lt_range_bewtp.

        ls_range_shkzg-sign = 'I'.ls_range_shkzg-option = 'EQ'.ls_range_shkzg-low = 'S'.APPEND ls_range_shkzg TO lt_range_shkzg.
        ls_range_shkzg-sign = 'I'.ls_range_shkzg-option = 'EQ'.ls_range_shkzg-low = 'H'.APPEND ls_range_shkzg TO lt_range_shkzg.

        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKBE' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                it_range             = lt_range_ebeln ).
        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELP'
                                                                it_range             = lt_range_ebelp ).
        lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'XBLNR'
                                                                it_range             = lt_range_xblnr ).
        lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'BEWTP'
                                                                it_range             = lt_range_bewtp ).
        lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'SHKZG'
                                                                it_range             = lt_range_shkzg ).

        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 ).
        lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

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

  ENDMETHOD.


  METHOD ekbe9.

    DATA:
      lt_business_data TYPE TABLE OF zscm_po_details=>tys_z_i_ekbetype,
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
      lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
      lt_range_ebeln      TYPE RANGE OF ebeln,
      ls_range_ebeln      LIKE LINE OF lt_range_ebeln,
      lt_range_ebelp      TYPE RANGE OF ebelp,
      ls_range_ebelp      LIKE LINE OF lt_range_ebelp,
      lt_range_gjahr      TYPE RANGE OF gjahr,
      ls_range_gjahr      LIKE LINE OF lt_range_gjahr,
      lt_range_bwart      TYPE RANGE OF bwart,
      ls_range_bwart      LIKE LINE OF lt_range_bwart,
      lt_range_lfbnr      TYPE RANGE OF char10,
      ls_range_lfbnr      LIKE LINE OF lt_range_lfbnr,
      lt_range_lfpos      TYPE RANGE OF numc4,
      ls_range_lfpos      LIKE LINE OF lt_range_lfpos,
      lt_range_vgabe      TYPE RANGE OF char1,
      ls_range_vgabe      LIKE LINE OF lt_range_vgabe.

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

        ls_range_ebeln-sign = 'I'.
        ls_range_ebeln-option = 'EQ'.
        ls_range_ebeln-low = i_ebeln.
        APPEND ls_range_ebeln TO lt_range_ebeln.

        ls_range_ebelp-sign = 'I'.
        ls_range_ebelp-option = 'EQ'.
        ls_range_ebelp-low = i_ebelp.
        APPEND ls_range_ebelp TO lt_range_ebelp.

        ls_range_gjahr-sign = 'I'.
        ls_range_gjahr-option = 'EQ'.
        ls_range_gjahr-low = i_gjahr.
        APPEND ls_range_gjahr TO lt_range_gjahr.

        ls_range_lfbnr-sign = 'I'.
        ls_range_lfbnr-option = 'EQ'.
        ls_range_lfbnr-low = i_lfbnr.
        APPEND ls_range_lfbnr TO lt_range_lfbnr.

        ls_range_lfpos-sign = 'I'.
        ls_range_lfpos-option = 'EQ'.
        ls_range_lfpos-low = i_lfpos.
        APPEND ls_range_lfpos TO lt_range_lfpos.

        ls_range_vgabe-sign = 'I'.
        ls_range_vgabe-option = 'EQ'.
        ls_range_vgabe-low = '1'.
        APPEND ls_range_vgabe TO lt_range_vgabe.

        ls_range_bwart-sign = 'I'.ls_range_bwart-option = 'EQ'.ls_range_bwart-low = '105'.APPEND ls_range_bwart TO lt_range_bwart.

        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKBE' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                it_range             = lt_range_ebeln ).
        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELP'
                                                                it_range             = lt_range_ebelp ).
        lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'LFBNR'
                                                                it_range             = lt_range_lfbnr ).
        lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'GJAHR'
                                                                it_range             = lt_range_gjahr ).
        lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'LFPOS'
                                                                it_range             = lt_range_lfpos ).
        lo_filter_node_6  = lo_filter_factory->create_by_range( iv_property_path     = 'BWART'
                                                                it_range             = lt_range_bwart ).
        lo_filter_node_7  = lo_filter_factory->create_by_range( iv_property_path     = 'VGABE'
                                                                it_range             = lt_range_vgabe ).

        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4 )->and( lo_filter_node_5 )->and( lo_filter_node_6 )->and( lo_filter_node_7 ).
        lo_request->set_filter( lo_filter_node_root ).

*lo_request->set_top( 50 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
        IF sy-subrc = 0.
          e_wrbtr = ls_business_data-wrbtr.
          e_menge = ls_business_data-menge.
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
