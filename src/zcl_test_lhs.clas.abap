CLASS zcl_test_lhs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    "METHODS ZDATFISC IMPORTING t_datfisc TYPE zttfi_datfisc
    "                EXPORTING e_messa TYPE zdemessa.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TEST_LHS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lv_json TYPE string.
    DATA lr_data TYPE REF TO data.
    FIELD-SYMBOLS:
      <data>        TYPE data,
      <results>     TYPE any,
      <structure>   TYPE any,
      <table>       TYPE ANY TABLE,
      <field>       TYPE any,
      <field_value> TYPE data.
    DATA t_datfisc TYPE STANDARD TABLE OF zstfi_datfisc.
    DATA l_dat TYPE zstfi_datfisc.
    DATA e_messa TYPE zdemessa.
    DATA lt_comp TYPE ztt_bapi0002_1.
    DATA lt_fam TYPE yttmm_merchgroup_e.
    DATA: lt_ystsd_salesorder_detail_e TYPE ystsd_salesorder_detail_e,
          lt_ystsd_totales_s           TYPE ystsd_totales_s,
          lt_yttsd_contacts_s          TYPE yttsd_contacts_s,
          lt_yttsd_positions_s         TYPE yttsd_positions_s,
          lt_yttsd_dates_s             TYPE yttsd_dates_s,
          lt_yttsd_invoices_s          TYPE yttsd_invoices_s.
    DATA lt_vbfa TYPE ztt_vbfa.
    DATA list TYPE ztt_vts_po_detail.
    DATA po_list TYPE zvts_tt_po_list.
    DATA: lv_message   TYPE char255,
          po_confirmed TYPE zvts_tt_po_confirmed.
    DATA ls_out TYPE zst_po_deliv_address_out.
    DATA: lt_tab_result TYPE zfi_tt_allx_bkpf.
zcl_acc_document_post=>call_je_post(  ).
*    CALL FUNCTION 'ZALL_EXTRACTOR_BKPF'
*     EXPORTING
*      bukrs = '1101'
*      blart = 'SA'
*      fech_ini = '20200101'
*      fech_fin = '20260101'
*      usnam = 'CHCHAVARRIA'
*     IMPORTING
*      tab_result = lt_tab_result.

*    CALL FUNCTION 'ZVTS_PO_DELIV_ADDRESS'
*      EXPORTING
*        vendor       = '7000000002'
*        po_number    = '4500000000'
*        po_item      = '0010'
*        langu        = 'S'
*      IMPORTING
*        material     = ls_out-material
*        description  = ls_out-description
*        purchaser    = ls_out-purchaser
*        pur_name     = ls_out-pur_name
*        d_name1      = ls_out-d_name1
*        d_name2      = ls_out-d_name2
*        d_street     = ls_out-d_street
*        d_post_code1 = ls_out-d_post_code1
*        d_city1      = ls_out-d_city1
*        d_country    = ls_out-d_country
*        d_region     = ls_out-d_region
*        d_tel_number = ls_out-d_tel_number
*        d_fax_number = ls_out-d_fax_number
*        delivery_to  = ls_out-delivery_to
*        i_name1      = ls_out-i_name1
*        i_city       = ls_out-i_city
*        i_street     = ls_out-i_street
*        i_district   = ls_out-i_district
*        i_tel_number = ls_out-i_tel_number
*        i_post_code  = ls_out-i_post_code
*        i_name2      = ls_out-i_name2
*        mail         = ls_out-mail.

*    CALL FUNCTION 'ZVTS_PO_VIEW_CONFIRMED'
*      EXPORTING
*        vendor       = '7000000002'
*        company      = '1101'
*        po_number    = ''
*        po_item      = '0010'
*        language     = 'S'
*      IMPORTING
*        message      = lv_message
*        po_confirmed = po_confirmed.

*    CALL FUNCTION 'ZVTS_PO_LIST'
*      EXPORTING
*        vendor = '7000000002'
*        status = 'S'
*      IMPORTING
*        po_list = po_list.

*    CALL FUNCTION 'ZVTS_PO_DETAIL'
*      EXPORTING
*        po_number = '4500000000'
*        langu     = 'S'
*      IMPORTING
*        list      = list.

*    zcl_qry_operations_to_s4hana=>order_flow( EXPORTING i_operacion = 'READ'
*                                                        i_vblen = '0000000002'
*                                              IMPORTING et_vbfa = lt_vbfa ).

*    CALL FUNCTION '<YFMSD_SALESORDER_DETAILS'
*      EXPORTING
*        iv_sales_order         = '0000000002'
*      IMPORTING
*        es_sales_order_details = lt_ystsd_salesorder_detail_e
*        es_totales             = lt_ystsd_totales_s
*        et_contacts            = lt_yttsd_contacts_s
*        et_positions           = lt_yttsd_positions_s
*        et_dates               = lt_yttsd_dates_s
*        et_invoices   >         = lt_yttsd_invoices_s.


*        CALL FUNCTION 'YFMSD_COMPANYCODE_LIST_GET'
*          IMPORTING et_companycode_list =  lt_comp.

*        zcl_qry_operations_to_s4hana=>vttk_lfa1( i_operacion = 'READ' ).

*        l_dat-uuid = 'UUID7'.
*        l_dat-bukrs = '1103'.
*        l_dat-belnr = '2400000208'.
*        l_dat-gjahr = '2026'.
*        l_dat-xref1 = 'test2'.
*        APPEND l_dat TO t_datfisc.
*
*    CALL FUNCTION 'ZFM_DATFISC'
*      EXPORTING
*        t_datfisc = t_datfisc
*      IMPORTING
*        e_messa = e_messa.

*    TRY.
*        DATA(lo_rfc_dest) = cl_rfc_destination_provider=>create_by_cloud_destination(
*                               i_name = |RFC_QS4| ).
*
*        DATA(lv_rfc_dest) = lo_rfc_dest->get_destination_name( ).
*
**        l_dat-bukrs = '1103'.
**        l_dat-belnr = '2400000208'.
**        l_dat-gjahr = '2025'.
**        l_dat-xref1 = 'test2'.
**        APPEND l_dat TO t_datfisc.
*
*    lv_json = '{"t_datfisc": [{"bukrs": "1103","belnr": "2400000208","gjahr": 2025,"xref1": "test3","forpa": "","metpa": "","impor": 0,"rfc": "","uuid": "UUID10"}]}'.
*         lv_json = '{"iv_sales_order": "0000000002"}'.
*    CALL METHOD /ui2/cl_json=>deserialize
*      EXPORTING
*        json         = lv_json
*        pretty_name  = /ui2/cl_json=>pretty_mode-user
*        assoc_arrays = abap_true
*      CHANGING
*        data         = lr_data.

    IF lr_data IS BOUND.
*      ASSIGN lr_data->* TO <data>.
*      ASSIGN COMPONENT 'T_DATFISC' OF STRUCTURE <data> TO <results>.
*      ASSIGN <results>->* TO <table>.
*
*      LOOP AT <table> ASSIGNING <structure>.
*        ASSIGN <structure>->* TO <data>.
*
*        ASSIGN COMPONENT 'BUKRS' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          l_dat-bukrs = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'BELNR' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          l_dat-belnr = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'GJAHR' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          l_dat-gjahr = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'XREF1' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          l_dat-xref1 = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        ASSIGN COMPONENT 'UUID' OF STRUCTURE <data> TO <field>.
*        IF <field> IS ASSIGNED.
*          lr_data = <field>.
*          ASSIGN lr_data->* TO <field_value>.
*          l_dat-uuid = <field_value>.
*        ENDIF.
*        UNASSIGN: <field>, <field_value>.
*
*        APPEND l_dat TO t_datfisc.
*        CLEAR l_dat.
*      ENDLOOP.
    ENDIF.
*
**        lv_json = /ui2/cl_json=>serialize(
**                 data        = e_messa "t_datfisc
**                 pretty_name = /ui2/cl_json=>pretty_mode-camel_case  " Optional: camelCase keys
**                 compress    = abap_false                            " Pretty print
**               ).
*
*    CALL FUNCTION 'ZFM_DATFISC'
*      EXPORTING
*        t_datfisc = t_datfisc
*      IMPORTING
*        e_messa   = e_messa.
*
*        CASE sy-subrc.
*          WHEN 0.
*            out->write( e_messa ).
*          WHEN 1.
*            out->write( |EXCEPTION SYSTEM_FAILURE |  ).
*          WHEN 2.
*            out->write( |EXCEPTION COMMUNICATION_FAILURE | ).
*          WHEN 3.
*            out->write( |EXCEPTION OTHERS| ).
*        ENDCASE.
*
*      CATCH cx_root INTO DATA(lx_root).
*        out->write( lx_root->get_text( ) ).
*
*    ENDTRY.
*
*    DATA(lv_response) = '{ e_messa: "' && e_messa && '" }'.

  ENDMETHOD.
ENDCLASS.
