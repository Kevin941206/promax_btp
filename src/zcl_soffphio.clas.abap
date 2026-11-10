CLASS zcl_soffphio DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

      CLASS-METHODS: soffphio_get     IMPORTING VALUE(i_operacion)  TYPE text10
                                                      i_ph_class    TYPE zchar10
                                                      i_loio_id     TYPE zchar32
                                EXPORTING VALUE(et_soffphio)        TYPE ztt_soffphio.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SOFFPHIO IMPLEMENTATION.


  METHOD soffphio_get.
    CASE i_operacion.
      WHEN 'READ'.

        DATA:
          lt_business_data TYPE TABLE OF zscm_soffphio=>tys_z_i_soffphiotype,
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
          lt_range_ph_class TYPE RANGE OF zchar10,
          ls_range_ph_class LIKE LINE OF lt_range_ph_class,
          lt_range_loio_id  TYPE RANGE OF zchar32,
          ls_range_loio_id  LIKE LINE OF lt_range_loio_id.


        TRY.
         " Create http client
          DATA lv_dest TYPE string.
          SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
          DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
          lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
          lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
            EXPORTING
               is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                  proxy_model_id      = 'ZSCM_SOFFPHIO'
                                                  proxy_model_version = '0001' )
              io_http_client             = lo_http_client
              iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_SOFFPHIO' ).

          ASSERT lo_http_client IS BOUND.

          CLEAR: lt_range_ph_class, ls_range_ph_class.
          ls_range_ph_class-sign = 'I'.
          ls_range_ph_class-option = 'EQ'.
          ls_range_ph_class-low = i_ph_class.
          APPEND ls_range_ph_class TO lt_range_ph_class.

          CLEAR: lt_range_loio_id, ls_range_loio_id.
          ls_range_loio_id-sign = 'I'.
          ls_range_loio_id-option = 'EQ'.
          ls_range_loio_id-low = i_loio_id.
          APPEND ls_range_loio_id TO lt_range_loio_id.


          " Navigate to the resource and create a request for the read operation
          lo_request = lo_client_proxy->create_resource_for_entity_set( 'Z_I_SOFFPHIO' )->create_request_for_read( ).

          " Create the filter tree
          lo_filter_factory = lo_request->create_filter_factory( ).

          lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'PH_CLASS'
                                                                it_range             = lt_range_ph_class ).
          lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'LOIO_ID'
                                                                it_range             = lt_range_loio_id ).

          lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
          lo_request->set_filter( lo_filter_node_root ).

          lo_request->set_top( 5000 )->set_skip( 0 ).

          " Execute the request and retrieve the business data
          lo_response = lo_request->execute( ).
          lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

          MOVE-CORRESPONDING lt_business_data TO et_soffphio.

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
