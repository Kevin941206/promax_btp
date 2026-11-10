CLASS zcl_qry_search_user DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

*tabla skat
    CLASS-METHODS: GET_usr21      IMPORTING VALUE(i_operacion)  TYPE text10
                                                  user type uname
                                  EXPORTING VALUE(l_usr21) TYPE zes_usr21.

    CLASS-METHODS: GET_ADR6      IMPORTING VALUE(i_operacion)  TYPE text10
                                                  addrnumber type ad_addrnum
                                                  persnumber TYPE ad_persnum
                                  EXPORTING VALUE(EMAIL) TYPE ZEMAIL.


    CLASS-METHODS: GET_ADRc      IMPORTING VALUE(i_operacion)  TYPE text10
                                                  addrnumber type ad_addrnum
                                  EXPORTING VALUE(name1) TYPE char30
                                                  name2 type char30.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_QRY_SEARCH_USER IMPLEMENTATION.


METHOD GET_usr21.
    CASE i_operacion.
      WHEN 'READ'.

DATA:
  ls_entity_key    TYPE zscm_usr21=>tys_z_i_usr_21_type,
  ls_business_data TYPE zscm_usr21=>tys_z_i_usr_21_type,
  lo_http_client   TYPE REF TO if_web_http_client,
  lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
  lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
  lo_request       TYPE REF TO /iwbep/if_cp_request_read,
  lo_response      TYPE REF TO /iwbep/if_cp_response_read.



     TRY.
     " Create http client
        DATA lv_dest TYPE string.

        SELECT SINGLE destino
          FROM zbtp_t_destino
          INTO @lv_dest.

        "--------------------------------------------------------
        " Creación del destino HTTP (BTP / Cloud Destination)
        "--------------------------------------------------------
        DATA(lo_destination) =
          cl_http_destination_provider=>create_by_cloud_destination(
            i_name = lv_dest
          ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
     lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
       EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_USR21'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_USR21' ).

     ASSERT lo_http_client IS BOUND.


" Set entity key
ls_entity_key = VALUE #(
          bname  = user ).

" Navigate to the resource
lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_USR_21' )->navigate_with_key( ls_entity_key ).

" Execute the request and retrieve the business data
lo_response = lo_resource->create_request_for_read( )->execute( ).
lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
l_usr21-persnumber = ls_business_data-persnumber.
l_usr21-addrnumber = ls_business_data-addrnumber.


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
endMETHOD.


METHOD GET_ADR6.
    CASE i_operacion.
      WHEN 'READ'.

DATA:
  ls_entity_key    TYPE zscm_adr6_2=>tys_z_i_adr_6_2_type,
  ls_business_data TYPE zscm_adr6_2=>tys_z_i_adr_6_2_type,
  lo_http_client   TYPE REF TO if_web_http_client,
  lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
  lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
  lo_request       TYPE REF TO /iwbep/if_cp_request_read,
  lo_response      TYPE REF TO /iwbep/if_cp_response_read.
*  EMAIL          TYPE ZEMAIL.



     TRY.
     " Create http client
        DATA lv_dest TYPE string.

        SELECT SINGLE destino
          FROM zbtp_t_destino
          INTO @lv_dest.

        "--------------------------------------------------------
        " Creación del destino HTTP (BTP / Cloud Destination)
        "--------------------------------------------------------
        DATA(lo_destination) =
          cl_http_destination_provider=>create_by_cloud_destination(
            i_name = lv_dest
          ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
     lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
       EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_ADR6_2'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ADR6_2' ).

     ASSERT lo_http_client IS BOUND.


" Set entity key
ls_entity_key = VALUE #(
          addrnumber  = Addrnumber
          persnumber  = Persnumber ).

" Navigate to the resource
lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ADR_6_2' )->navigate_with_key( ls_entity_key ).

" Execute the request and retrieve the business data
lo_response = lo_resource->create_request_for_read( )->execute( ).
lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
EMAIL = ls_business_data-smtp_addr.

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
endMETHOD.


METHOD GET_ADRc.
    CASE i_operacion.
      WHEN 'READ'.

DATA:
  ls_entity_key    TYPE zscm_adrc_2=>tys_z_i_adrc_2_type,
  ls_business_data TYPE zscm_adrc_2=>tys_z_i_adrc_2_type,
  lo_http_client   TYPE REF TO if_web_http_client,
  lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
  lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
  lo_request       TYPE REF TO /iwbep/if_cp_request_read,
  lo_response      TYPE REF TO /iwbep/if_cp_response_read.



     TRY.
        DATA lv_dest TYPE string.

        SELECT SINGLE destino
          FROM zbtp_t_destino
          INTO @lv_dest.

        "--------------------------------------------------------
        " Creación del destino HTTP (BTP / Cloud Destination)
        "--------------------------------------------------------
        DATA(lo_destination) =
          cl_http_destination_provider=>create_by_cloud_destination(
            i_name = lv_dest
          ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
     lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
       EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'ZSCM_ADRC_2'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_ADRC_2' ).

     ASSERT lo_http_client IS BOUND.


" Set entity key
ls_entity_key = VALUE #(
          addrnumber  = Addrnumber ).

" Navigate to the resource
lo_resource = lo_client_proxy->create_resource_for_entity_set( 'Z_I_ADRC_2' )->navigate_with_key( ls_entity_key ).

" Execute the request and retrieve the business data
lo_response = lo_resource->create_request_for_read( )->execute( ).
lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
name1 = ls_business_data-name_1.
name2 = ls_business_data-name_2.


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
endMETHOD.
ENDCLASS.
