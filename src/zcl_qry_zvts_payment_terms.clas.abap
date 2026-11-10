CLASS zcl_qry_zvts_payment_terms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS: t052u_terms        IMPORTING VALUE(i_operacion) TYPE text10
                                                i_langu            TYPE spras
                                      EXPORTING VALUE(terms)       TYPE ztt_iobj_zterm_desc.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_QRY_ZVTS_PAYMENT_TERMS IMPLEMENTATION.


  METHOD t052u_terms.
    CASE i_operacion.
      WHEN 'READ'.
        DATA:
          lt_business_data TYPE TABLE OF zscm_t052u=>tys_z_i_t_052_utype,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

        DATA:
          lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
          lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
          lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
          lt_range_spras      TYPE RANGE OF spras,
          ls_range_spras      LIKE LINE OF lt_range_spras,
          ls_terms            LIKE LINE OF terms.



        TRY.
            " Create http client
            DATA lv_dest TYPE string.
            SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
            DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
           EXPORTING
              is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                  proxy_model_id      = 'ZSCM_T052U'
                                                  proxy_model_version = '0001' )
             io_http_client             = lo_http_client
             iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_T052U' ).

            ASSERT lo_http_client IS BOUND.

            CLEAR lt_range_spras.
            ls_range_spras-sign = 'I'.
            ls_range_spras-option = 'EQ'.
            ls_range_spras-low = i_langu.
            APPEND ls_range_spras TO lt_range_spras.
            CLEAR ls_range_spras.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_T_052_U' )->create_request_for_read( ).

            " Create the filter tree
            lo_filter_factory = lo_request->create_filter_factory( ).
*
            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'SPRAS'
                                                                    it_range             = lt_range_SPRAS ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'SPART'
*                                                        it_range             = lt_range_SPART ).

            lo_filter_node_root = lo_filter_node_1.
            lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 1000 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

            CLEAR terms.

            LOOP AT lt_business_data INTO DATA(ls_business_data).
              ls_terms-zterm = ls_business_data-zterm.
              ls_terms-text1 = ls_business_data-text_1.
              APPEND ls_terms TO terms.
              CLEAR ls_terms.
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
