CLASS zcl_ext_bkpf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS:
      get_ext_bkpf
        IMPORTING
          VALUE(i_bukrs)    TYPE bukrs
          VALUE(i_blart)    TYPE blart
          VALUE(i_fech_ini) TYPE datum
          VALUE(i_fech_fin) TYPE datum OPTIONAL
          VALUE(i_usnam)    TYPE usnam OPTIONAL
        EXPORTING
          et_result         TYPE zfi_tt_allx_bkpf.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EXT_BKPF IMPLEMENTATION.


  METHOD get_ext_bkpf.

    DATA:
      lt_business_data TYPE TABLE OF zscm_ext_bkpf=>tys_zcds_c_all_ext_bkpftype,
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
      lt_range_blart      TYPE RANGE OF blart,
      lt_range_usnam      TYPE RANGE OF usnam,
      lt_range_fecha      TYPE RANGE OF datum,
      lt_range_ID         TYPE RANGE OF sysuuid_x16.

    APPEND INITIAL LINE TO lt_range_bukrs ASSIGNING FIELD-SYMBOL(<ls_range_bukrs>).
    <ls_range_bukrs>-sign = 'I'.
    <ls_range_bukrs>-option = 'EQ'.
    <ls_range_bukrs>-low = i_bukrs.
    <ls_range_bukrs>-high = ''.

    APPEND INITIAL LINE TO lt_range_blart ASSIGNING FIELD-SYMBOL(<ls_range_blart>).
    <ls_range_blart>-sign = 'I'.
    <ls_range_blart>-option = 'EQ'.
    <ls_range_blart>-low = i_blart.
    <ls_range_blart>-high = ''.

    APPEND INITIAL LINE TO lt_range_usnam ASSIGNING FIELD-SYMBOL(<ls_range_usnam>).
    <ls_range_usnam>-sign = 'I'.
    <ls_range_usnam>-option = 'EQ'.
    <ls_range_usnam>-low = i_usnam.
    <ls_range_usnam>-high = ''.

IF i_fech_fin IS NOT INITIAL.
    APPEND INITIAL LINE TO lt_range_fecha ASSIGNING FIELD-SYMBOL(<ls_range_fecha>).
    <ls_range_fecha>-sign = 'I'.
    <ls_range_fecha>-option = 'BT'.
    <ls_range_fecha>-low = i_fech_ini.
    <ls_range_fecha>-high = i_fech_fin.
ELSE.
    APPEND INITIAL LINE TO lt_range_fecha ASSIGNING <ls_range_fecha>.
    <ls_range_fecha>-sign = 'I'.
    <ls_range_fecha>-option = 'EQ'.
    <ls_range_fecha>-low = i_fech_ini.
ENDIF.



    TRY.
        " Create http client
        "DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = |DS4WD100| ). "|DS4100| ).
        DATA lv_dest TYPE string.
             SELECT SINGLE destino FROM zbtp_t_destino INTO @lv_dest.
             DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name = lv_dest ).
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
         EXPORTING
            is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                proxy_model_id      = 'ZSCM_EXT_BKPF'
                                                proxy_model_version = '0001' )
           io_http_client             = lo_http_client
           iv_relative_service_root   = '/sap/opu/odata/sap/ZSB_C_ALL_EXT_BKPF' ).

        ASSERT lo_http_client IS BOUND.


        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'ZCDS_C_ALL_EXT_BKPF' )->create_request_for_read( ).

        " Create the filter tree
        lo_filter_factory = lo_request->create_filter_factory( ).
        lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'BUKRS'
                                                                it_range             = lt_range_bukrs ).

        lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BLART'
                                                                it_range             = lt_range_blart ).

        lo_filter_node_3  = lo_filter_factory->create_by_range( iv_property_path     = 'USNAM'
                                                                it_range             = lt_range_usnam ).


        lo_filter_node_4  = lo_filter_factory->create_by_range( iv_property_path     = 'CPUDT'
                                                                it_range             = lt_range_fecha ).

        lo_filter_node_5  = lo_filter_factory->create_by_range( iv_property_path     = 'AEDAT'
                                                                it_range             = lt_range_fecha ).

        lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 )->and( lo_filter_node_3 )->and( lo_filter_node_4->or( lo_filter_node_5 ) ).
        lo_request->set_filter( lo_filter_node_root ).

        lo_request->set_top( 50 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).
        LOOP AT lt_business_data ASSIGNING FIELD-SYMBOL(<ls_business_data>).
          APPEND INITIAL LINE TO et_result ASSIGNING FIELD-SYMBOL(<ls_reuslt>).
          <ls_reuslt> = CORRESPONDING #( <ls_business_data> ).
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
ENDCLASS.
