CLASS zcl_qry_rfq_send DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-DATA: BEGIN OF Ty_OFERTA,
                  ebeln          TYPE zekpo-ebeln,
                  ebelp          TYPE zekpo-ebelp,
                  matnr          TYPE zekpo-matnr,
                  txz01          TYPE zekpo-txz01,
                  ktmng          TYPE zekpo-menge,
                  meins          TYPE zekpo-meins,
                  netpr          TYPE zekpo-netpr,
                  agmem          TYPE zekpo-agmem,
                  peinh          TYPE zekpo-peinh,
                  bprme          TYPE zekpo-bprme,
                  aedat          TYPE zekko-aedat,
                  kdatb          TYPE zekko-kdatb,
                  kdate          TYPE zekko-kdate,
                  angdt          TYPE zekpo-agdat,
                  stat(1),
                  agtxt          TYPE text30, "tmamt-agtxt,
                  dirent         TYPE zst_adrc-name1,
                  pstyp          TYPE zekpo-pstyp,
                  packno         TYPE zekpo-packno,
                  werks          TYPE zekpo-werks,
                  eindt          TYPE eindt,
                  bednr          TYPE zekpo-bednr,
                  idnlf          TYPE zekpo-idnlf,
                  plifz(3),  "type EKPO-PLIFZ,
                  ekgrp          TYPE zekko-ekgrp,
                  bsart          TYPE zekko-bsart,
                  eknam          TYPE zst_t024-eknam,
                  ektel          TYPE zst_t024-ektel,
                  telfx          TYPE zst_t024-telfx,
                  mwskz          TYPE zekpo-mwskz,
                  txt(1),
                  chk(1),
                  atch(1),
                  c_atch(1),
                  attach1(1024),
                  attach2(1024),
                  attach3(1024),
                  attach4(1024),
                  attach5(1024),
                  attach6(1024),
                  attach7(1024),
                  attach8(1024),
                  attach9(1024),
                  attach10(1024),
                  xbsart(20),
                  lifnr          TYPE zekko-lifnr,
                  ernam          TYPE zekko-ernam,
                  waers          TYPE zekko-waers,
                  wkurs          TYPE zekko-wkurs,
                  ihran          TYPE zekko-ihran,
                  ihrez          TYPE zekko-ihrez,
                  unsez          TYPE zekko-unsez,
                  inco1          TYPE zekko-inco1,
                  inco2          TYPE zekko-inco2,
                  zterm          TYPE zekko-zterm,
                  zbd1t          TYPE zekko-zbd1t,
                  zbd2t          TYPE zekko-zbd2t,
                  zbd3t          TYPE zekko-zbd3t,
                  zbd1p          TYPE zekko-zbd1p,
                  zbd2p          TYPE zekko-zbd2p,
                  adrnr          TYPE zekpo-adrnr,
                  banfn          TYPE banfn,
                  text1(255),
                  text2(255),
                  text3(255),
                  text4(255),
                  text5(255),
                  text6(255),
                  text7(255),
                  text8(255),
                  text9(255),
                  text10(255),
                  text11(255),
                  text12(255),
                  text13(255),
                  text14(255),
                  text15(255),
                  text16(255),
                  text17(255),
                  text18(255),
                  text19(255),
                  text20(255),
                  texta1(255),
                  texta2(255),
                  texta3(255),
                  texta4(255),
                  texta5(255),
                  texta6(255),
                  texta7(255),
                  texta8(255),
                  texta9(255),
                  texta10(255),
                  texta11(255),
                  texta12(255),
                  texta13(255),
                  texta14(255),
                  texta15(255),
                  texta16(255),
                  texta17(255),
                  texta18(255),
                  texta19(255),
                  texta20(255),
                  default(4),
                  add(4),
                  total(4),
                  displ_i(1),
                  icms(2),
                  ricms(1),
                  icmsbr(5),
                  sticms(1),
                  sti(1),
                  mr(1),
                  ipi(5),
                  comments(2000),
                END OF Ty_OFERTA,

                BEGIN OF Ty_ESLL2,
                  check(1),
                  key            TYPE zst_ESLL-packno,
                  packno         TYPE zst_ESLL-packno,
                  introw         TYPE zst_ESLL-introw,
                  extrow         TYPE zst_ESLL-extrow,
                  ktext1         TYPE zst_ESLL-ktext1,
                  menge          TYPE zst_ESLL-menge,
                  tbtwr          TYPE zst_ESLL-tbtwr,
                  meins          TYPE zst_ESLL-meins,
                  comments(2000),
                END OF Ty_ESLL2.

    CLASS-DATA: lt_esll2 LIKE TABLE OF ty_esll2,
                ls_esll2 LIKE LINE OF lt_esll2.

    CLASS-METHODS: ekko      IMPORTING i_operacion TYPE text10
                                       i_quotation TYPE ebeln
                                       v_pedido1   TYPE zst_pedidos2-ebeln
                             EXPORTING st_ekko     TYPE zekko.

    CLASS-METHODS: lfm1      IMPORTING i_operacion TYPE text10
                                       st_ekko     TYPE zekko
                             EXPORTING st_lfm1     TYPE zst_lfm1.

    CLASS-METHODS: konv      IMPORTING i_operacion TYPE text10
                                       st_ekko     TYPE zekko
                             EXPORTING l_count     TYPE i
                                       it_konv     TYPE ztt_konv.

    CLASS-METHODS: ekpo      IMPORTING i_operacion TYPE text10
                                       ls_oferta   LIKE ty_oferta
                             EXPORTING st_ekpo     TYPE zekpo.

    CLASS-METHODS: cdhdr     IMPORTING i_operacion TYPE text10
                                       ls_oferta   LIKE ty_oferta
                             EXPORTING it_cdhdr    TYPE ztt_cdhdr.

    CLASS-METHODS: knumh     IMPORTING i_operacion TYPE text10
                                       ls_oferta   LIKE ty_oferta
                             EXPORTING wa_a016     TYPE zst_a016.

    CLASS-METHODS: usr01     IMPORTING i_operacion TYPE text10
                             EXPORTING lv_dcpfm    TYPE c.

    CLASS-METHODS: esll      IMPORTING i_operacion TYPE text10
                                       ls_oferta   LIKE ty_oferta
                             EXPORTING sub_packno  TYPE zst_esll-sub_packno.

    CLASS-METHODS: esll2     IMPORTING i_operacion TYPE text10
                                       sub_packno  TYPE zst_esll-sub_packno
                                       ls_esll     LIKE ty_esll2
                             EXPORTING lv_introw   TYPE zst_esll-introw.

    CLASS-METHODS: zvts_log  IMPORTING i_operacion TYPE text10
                                       wa_log      TYPE zst_zvts_log.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_QRY_RFQ_SEND IMPLEMENTATION.


  METHOD konv.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zvts_rfq_send=>tys_z_i_konvtype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_knumv      TYPE RANGE OF zekko-knumv,
          ls_range_knumv      LIKE LINE OF lt_range_knumv,
          ls_konv             LIKE LINE OF it_konv.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_ZVTS_RFQ_SEND'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZVTS_RFQ_SEND' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_knumv-sign = 'I'.
            ls_range_knumv-option = 'EQ'.
            ls_range_knumv-low = st_ekko-knumv.
            APPEND ls_range_knumv TO lt_range_knumv.
            CLEAR ls_range_knumv.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_KONV' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'KNUMV'
                                                                    it_range             = lt_range_KNUMV ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'KPOSN'
*                                                        it_range             = lt_range_KPOSN ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

*            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR l_count.
            LOOP AT lt_business_data INTO DATA(ls_business_data).
              IF ls_business_data-kposn EQ '000000'.
                MOVE-CORRESPONDING ls_business_data TO ls_konv.
                l_count = l_count + 1.
                APPEND ls_konv TO it_konv.
                CLEAR ls_konv.
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


  METHOD usr01.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zvts_rfq_send=>tys_z_i_usr_01_type,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_BNAME      TYPE RANGE OF sy-uname,
          ls_range_baname     LIKE LINE OF lt_range_bname.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_ZVTS_RFQ_SEND'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZVTS_RFQ_SEND' ).

            ASSERT lo_http_client IS BOUND.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_USR_01' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).
*
            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BNAME'
                                                                    it_range             = lt_range_BNAME ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'STCOD'
*                                                        it_range             = lt_range_STCOD ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 1 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              lv_dcpfm = ls_business_data-dcpfm.
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


  METHOD esll.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zvts_rfq_send=>tys_z_i_eslltype,
          ls_business_data TYPE zscm_zvts_rfq_send=>tys_z_i_eslltype,
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
                                              proxy_model_id      = 'ZSCM_ZVTS_RFQ_SEND'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZVTS_RFQ_SEND' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      packno  = ls_oferta-packno ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ESLL' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            sub_packno = ls_business_data-sub_packno.

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


  METHOD cdhdr.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_zvts_rfq_send=>tys_z_i_cdhdrtype,
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
          lt_range_objectclas TYPE RANGE OF zst_cdhdr-objectclas,
          ls_range_objectclas LIKE LINE OF lt_range_objectclas,
          lt_range_objectid   TYPE RANGE OF zst_cdhdr-objectid,
          ls_range_objectid   LIKE LINE OF lt_range_objectid,
          lt_range_tcode      TYPE RANGE OF zst_cdhdr-tcode,
          ls_range_tcode      LIKE LINE OF lt_range_tcode,
          wa_cdhdr            LIKE LINE OF it_cdhdr.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_ZVTS_RFQ_SEND'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZVTS_RFQ_SEND' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_objectclas-sign = 'I'.
            ls_range_objectclas-option = 'EQ'.
            ls_range_objectclas-low = 'EINKBELEG'.
            APPEND ls_range_objectclas TO lt_range_objectclas.
            CLEAR ls_range_objectclas.

            ls_range_objectid-sign = 'I'.
            ls_range_objectid-option = 'EQ'.
            ls_range_objectid-low = ls_oferta-ebeln.
            APPEND ls_range_objectid TO lt_range_objectid.
            CLEAR ls_range_objectid.

            ls_range_tcode-sign = 'I'.
            ls_range_tcode-option = 'EQ'.
            ls_range_tcode-low = 'ME47'.
            APPEND ls_range_tcode TO lt_range_tcode.
            CLEAR ls_range_tcode.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_CDHDR' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'OBJECTCLAS'
                                                                    it_range             = lt_range_OBJECTCLAS ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'OBJECTID'
                                                                    it_range             = lt_range_OBJECTID ).
            lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'TCODE'
            it_range             = lt_range_TCODE ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 ).
            lo_request->set_filter( lo_filter_node_root ).

*            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR it_cdhdr.
            LOOP AT lt_business_data INTO DATA(ls_business_data).
              MOVE-CORRESPONDING ls_business_data TO wa_cdhdr.
              APPEND wa_cdhdr TO it_cdhdr.
              CLEAR wa_cdhdr.
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


  METHOD esll2.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          ls_entity_key    TYPE zscm_zvts_rfq_send=>tys_z_i_eslltype,
          ls_business_data TYPE zscm_zvts_rfq_send=>tys_z_i_eslltype,
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
                                              proxy_model_id      = 'ZSCM_ZVTS_RFQ_SEND'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZVTS_RFQ_SEND' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            ls_entity_key = VALUE #(
                      packno  = sub_packno
                      extrow  = ls_esll-extrow ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ESLL' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            lv_introw = ls_business_data-introw.

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


  METHOD zvts_log.
    CASE i_operacion.
      WHEN 'CREATE'.
        DATA:
          ls_business_data TYPE zscm_zvts_rfq_send=>tys_z_i_zvts_logtype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_create,
          lo_response      TYPE REF TO /iwbep/if_cp_response_create.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_ZVTS_RFQ_SEND'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZVTS_RFQ_SEND' ).

            ASSERT lo_http_client IS BOUND.

            " Prepare business data
            MOVE-CORRESPONDING wa_log TO ls_business_data.


            " Navigate to the resource and create a request for the create operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ZVTS_LOG' )->create_request_for_create( ).

            " Set the business data for the created entity
            lo_request->set_business_data( ls_business_data ).

            " Execute the request
            lo_response = lo_request->execute( ).

            " Get the after image
*lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

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
          ls_entity_key    TYPE zscm_zvts_rfq_send=>tys_z_i_ekkotype,
          ls_business_data TYPE zscm_zvts_rfq_send=>tys_z_i_ekkotype,
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
                                              proxy_model_id      = 'ZSCM_ZVTS_RFQ_SEND'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZVTS_RFQ_SEND' ).

            ASSERT lo_http_client IS BOUND.

            " Set entity key
            IF v_pedido1 IS INITIAL.
              ls_entity_key = VALUE #(
                        ebeln  = i_quotation ).
            ELSE.
              ls_entity_key = VALUE #(
                          ebeln  = v_pedido1 ).
            ENDIF.

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKKO' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
            IF v_pedido1 IS INITIAL.
              MOVE-CORRESPONDING ls_business_data TO st_ekko.
            ELSE.
              st_ekko-waers = ls_business_data-waers.
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


  METHOD ekpo.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zvts_rfq_send=>tys_z_i_ekpotype,
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
                                                     proxy_model_id      = 'ZSCM_ZVTS_RFQ_SEND'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZVTS_RFQ_SEND' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_ebeln-sign = 'I'.
            ls_range_ebeln-option = 'EQ'.
            ls_range_ebeln-low = ls_oferta-ebeln.
            APPEND ls_range_ebeln TO lt_range_ebeln.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_EKPO' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EBELN'
                                                                    it_range             = lt_range_ebeln ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            LOOP AT lt_business_data INTO DATA(ls_business_data) WHERE netpr NE 0.
              st_ekpo-netpr = ls_business_data-netpr.
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


  METHOD knumh.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_zvts_rfq_send=>tys_z_i_a_016_type,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_evrtn      TYPE RANGE OF ebeln,
          ls_range_evrtn      LIKE LINE OF lt_range_evrtn,
          lt_range_evrtp      TYPE RANGE OF ebelp,
          ls_range_evrtp      LIKE LINE OF lt_range_evrtp.

        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSCM_ZVTS_RFQ_SEND'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = '/sap/opu/odata/sap/ZVTS_RFQ_SEND' ).

            ASSERT lo_http_client IS BOUND.

            ls_range_evrtn-sign = 'I'.
            ls_range_evrtn-option = 'EQ'.
            ls_range_evrtn-low = ls_oferta-ebeln.
            APPEND ls_range_evrtn TO lt_range_evrtn.

            ls_range_evrtp-sign = 'I'.
            ls_range_evrtp-option = 'EQ'.
            ls_range_evrtp-low = ls_oferta-ebelp.
            APPEND ls_range_evrtp TO lt_range_evrtp.

            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_A_016' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'EVRTN'
                                                                    it_range             = lt_range_evrtn ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'EVRTP'
                                                                    it_range             = lt_range_evrtp ).

            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
            wa_a016-knumh = ls_business_data-knumh.

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


  METHOD lfm1.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          ls_entity_key    TYPE zscm_zvts_rfq_send=>tys_z_i_lfm_1_type,
          ls_business_data TYPE zscm_zvts_rfq_send=>tys_z_i_lfm_1_type,
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
                                              proxy_model_id      = 'ZSCM_ZVTS_RFQ_SEND'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZVTS_RFQ_SEND' ).

            ASSERT lo_http_client IS BOUND.


            " Set entity key
            ls_entity_key = VALUE #(
                      lifnr  = st_ekko-lifnr
                      ekorg  = st_ekko-ekorg ).

            " Navigate to the resource
            lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_LFM_1' )->navigate_with_key( ls_entity_key ).

            " Execute the request and retrieve the business data
            lo_response = lo_resource->create_request_for_read( )->execute( ).
            lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

            st_lfm1-waers = ls_business_data-waers.
            st_lfm1-kalsk = ls_business_data-kalsk.

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
