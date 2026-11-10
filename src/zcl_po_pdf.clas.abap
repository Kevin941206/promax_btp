CLASS zcl_po_pdf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: get_pdf IMPORTING i_ebeln TYPE ebeln
                           EXPORTING e_pdf   TYPE string. "xstring.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PO_PDF IMPLEMENTATION.


  METHOD get_pdf.

    DATA:
      lt_business_data TYPE TABLE OF zscm_po_pdf=>ty_deep,
      lo_http_client   TYPE REF TO if_web_http_client,
      lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

    DATA:
      lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
      lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
      lt_range_DOC_NUMBER TYPE RANGE OF ebeln,
      ls_range_doc_number LIKE LINE OF lt_range_doc_number,
      lt_range_contador   TYPE RANGE OF int8,
      ls_range_contador   LIKE LINE OF lt_range_contador.

*    DATA: lv_exit,
*          lv_cont TYPE int8.
*    DATA lv_service_root TYPE string.
*    lv_service_root = |/sap/opu/odata/SAP/ZFM_PO_PDF_SRV/headerSet(DocNumber='{ i_ebeln }')/$value|.
    TRY.
        " Create http client
        DATA lv_dest TYPE string.
        SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest
        i_authn_mode = if_a4c_cp_service=>service_specific ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSCM_PO_PDF'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/ZFM_PO_PDF_SRV' ).

        ASSERT lo_http_client IS BOUND.

*        lo_http_client->get_http_request( )->set_uri_path( lv_service_root ).
*
*        lo_http_client->get_http_request( )->set_header_field(
*                                                               i_name  = 'Accept'
*                                                               i_value = 'application/pdf' ). "octet-stream' ).
*        lo_http_client->get_http_request( )->set_header_field(
*                                                               i_name  = 'x-csrf-token'
*                                                               i_value = 'fetch' ).
*
*        DATA(lo_response2) = lo_http_client->execute( if_web_http_client=>get ).
*
*        " Validar HTTP 200
*        IF lo_response2->get_status( )-code <> 200.
*          RAISE EXCEPTION TYPE cx_web_http_client_error.
*        ENDIF.
*
*        " Obtener el xstring directamente del body binario
*        e_pdf = lo_response2->get_binary( ).

        ls_range_doc_number-sign = 'I'.
        ls_range_doc_number-option = 'EQ'.
        ls_range_doc_number-low = i_ebeln.
        APPEND ls_range_doc_number TO lt_range_doc_number.

*        WHILE lv_exit IS INITIAL.
        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'HEADER_SET' )->create_request_for_read( ).

        DATA(lo_expand) = lo_request->create_expand_node(  ).
        lo_expand->add_expand( 'HEADERTOLINES' ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).

*        CLEAR lt_range_contador.
*        ls_range_contador-sign = 'I'.
*        ls_range_contador-option = 'EQ'.
*        ls_range_contador-low = lv_cont.
*        APPEND ls_range_contador TO lt_range_contador.

        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'DOC_NUMBER'
                                                                it_range             = lt_range_DOC_NUMBER ).
*        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'CONTADOR'
*                                                                it_range             = lt_range_contador ).

        lo_filter_node_root = lo_filter_node_1. "->and( lo_filter_node_2 ).
        lo_request->set_filter( lo_filter_node_root ).

*        lo_request->set_top( 50 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        READ TABLE lt_business_data INTO DATA(ls_business_data) INDEX 1.
        IF sy-subrc = 0.
          LOOP AT ls_business_data-headertolines INTO DATA(ls_headertolines).
            e_pdf = e_pdf && ls_headertolines-pdf.
          ENDLOOP.
*          lv_exit = ls_business_data-exit.
*          lv_cont = ls_business_data-contador.
*          e_pdf = ls_business_data-pdf.
        ENDIF.
*        ENDWHILE.

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
