"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>ZFM_BAPI_INCOMINGINVOICE_CREAT_SRV</em>
CLASS zscm_bapi_incominginvoice_crea DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">accounting</p>
      BEGIN OF tys_accounting,
        "! <em>Key property</em> DateTime
        date_time        TYPE string,
        "! InvoiceDocItem
        invoice_doc_item TYPE c LENGTH 6,
        "! Xunpl
        xunpl            TYPE abap_bool,
        "! SerialNo
        serial_no        TYPE c LENGTH 2,
        "! TaxCode
        tax_code         TYPE c LENGTH 2,
        "! Taxjurcode
        taxjurcode       TYPE c LENGTH 15,
        "! ItemAmount
        item_amount      TYPE p LENGTH 12 DECIMALS 4,
        "! Quantity
        quantity         TYPE p LENGTH 7 DECIMALS 3,
        "! PoUnit
        po_unit          TYPE c LENGTH 3,
        "! PoUnitIso
        po_unit_iso      TYPE c LENGTH 3,
        "! PoPrQnt
        po_pr_qnt        TYPE p LENGTH 7 DECIMALS 3,
        "! PoPrUom
        po_pr_uom        TYPE c LENGTH 3,
        "! PoPrUomIso
        po_pr_uom_iso    TYPE c LENGTH 3,
        "! GlAccount
        gl_account       TYPE c LENGTH 10,
        "! Costcenter
        costcenter       TYPE c LENGTH 10,
        "! SdDoc
        sd_doc           TYPE c LENGTH 10,
        "! SdocItem
        sdoc_item        TYPE c LENGTH 6,
        "! AssetNo
        asset_no         TYPE c LENGTH 12,
        "! SubNumber
        sub_number       TYPE c LENGTH 4,
        "! Orderid
        orderid          TYPE c LENGTH 12,
        "! RefDate
        ref_date         TYPE string,
        "! CmmtItem
        cmmt_item        TYPE c LENGTH 24,
        "! FundsCtr
        funds_ctr        TYPE c LENGTH 16,
        "! FuncArea
        func_area        TYPE c LENGTH 4,
        "! Fund
        fund             TYPE c LENGTH 10,
        "! BusArea
        bus_area         TYPE c LENGTH 4,
        "! RlEstKey
        rl_est_key       TYPE c LENGTH 40,
        "! CoArea
        co_area          TYPE c LENGTH 4,
        "! Costobject
        costobject       TYPE c LENGTH 12,
        "! Network
        network          TYPE c LENGTH 12,
        "! Activity
        activity         TYPE c LENGTH 4,
        "! ProfitSegmNo
        profit_segm_no   TYPE c LENGTH 10,
        "! ProfitCtr
        profit_ctr       TYPE c LENGTH 10,
        "! WbsElem
        wbs_elem         TYPE c LENGTH 24,
        "! GrantNbr
        grant_nbr        TYPE c LENGTH 20,
        "! CmmtItemLong
        cmmt_item_long   TYPE c LENGTH 24,
        "! FuncAreaLong
        func_area_long   TYPE c LENGTH 16,
        "! BudgetPeriod
        budget_period    TYPE c LENGTH 10,
        "! DelCreateDate
        del_create_date  TYPE string,
        "! ItemText
        item_text        TYPE c LENGTH 50,
        "! StlmntPer
        stlmnt_per       TYPE c LENGTH 6,
        "! TaxCountry
        tax_country      TYPE c LENGTH 3,
      END OF tys_accounting,
      "! <p class="shorttext synchronized">List of accounting</p>
      tyt_accounting TYPE STANDARD TABLE OF tys_accounting WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">data</p>
      BEGIN OF tys_data,
        "! <em>Key property</em> DateTime
        date_time             TYPE string,
        "! InvoiceInd
        invoice_ind           TYPE c LENGTH 1,
        "! DocType
        doc_type              TYPE c LENGTH 2,
        "! DocDate
        doc_date              TYPE string,
        "! PstngDate
        pstng_date            TYPE string,
        "! RefDocNo
        ref_doc_no            TYPE c LENGTH 16,
        "! CompCode
        comp_code             TYPE c LENGTH 4,
        "! DiffInv
        diff_inv              TYPE c LENGTH 10,
        "! Currency
        currency              TYPE c LENGTH 5,
        "! CurrencyIso
        currency_iso          TYPE c LENGTH 3,
        "! ExchRate
        exch_rate             TYPE p LENGTH 5 DECIMALS 5,
        "! ExchRateV
        exch_rate_v           TYPE p LENGTH 5 DECIMALS 5,
        "! GrossAmount
        gross_amount          TYPE p LENGTH 12 DECIMALS 4,
        "! CalcTaxInd
        calc_tax_ind          TYPE abap_bool,
        "! Pmnttrms
        pmnttrms              TYPE c LENGTH 4,
        "! BlineDate
        bline_date            TYPE string,
        "! DsctDays1
        dsct_days_1           TYPE p LENGTH 2 DECIMALS 0,
        "! DsctDays2
        dsct_days_2           TYPE p LENGTH 2 DECIMALS 0,
        "! Netterms
        netterms              TYPE p LENGTH 2 DECIMALS 0,
        "! DsctPct1
        dsct_pct_1            TYPE p LENGTH 3 DECIMALS 3,
        "! DsctPct2
        dsct_pct_2            TYPE p LENGTH 3 DECIMALS 3,
        "! IvCategory
        iv_category           TYPE c LENGTH 1,
        "! HeaderTxt
        header_txt            TYPE c LENGTH 25,
        "! PmntBlock
        pmnt_block            TYPE c LENGTH 1,
        "! DelCosts
        del_costs             TYPE p LENGTH 12 DECIMALS 4,
        "! DelCostsTaxc
        del_costs_taxc        TYPE c LENGTH 2,
        "! DelCostsTaxj
        del_costs_taxj        TYPE c LENGTH 15,
        "! PersonExt
        person_ext            TYPE c LENGTH 12,
        "! PymtMeth
        pymt_meth             TYPE c LENGTH 1,
        "! Pmtmthsupl
        pmtmthsupl            TYPE c LENGTH 2,
        "! InvDocNo
        inv_doc_no            TYPE c LENGTH 10,
        "! ScbankInd
        scbank_ind            TYPE c LENGTH 3,
        "! Supcountry
        supcountry            TYPE c LENGTH 3,
        "! BllsrvInd
        bllsrv_ind            TYPE c LENGTH 1,
        "! RefDocNoLong
        ref_doc_no_long       TYPE c LENGTH 35,
        "! DsctAmount
        dsct_amount           TYPE p LENGTH 12 DECIMALS 4,
        "! PoSubNo
        po_sub_no             TYPE c LENGTH 11,
        "! PoCheckdg
        po_checkdg            TYPE c LENGTH 2,
        "! PoRefNo
        po_ref_no             TYPE c LENGTH 27,
        "! PayeePayer
        payee_payer           TYPE c LENGTH 10,
        "! PartnerBk
        partner_bk            TYPE c LENGTH 4,
        "! Housebankid
        housebankid           TYPE c LENGTH 5,
        "! AllocNmbr
        alloc_nmbr            TYPE c LENGTH 18,
        "! PaymtRef
        paymt_ref             TYPE c LENGTH 30,
        "! InvRefNo
        inv_ref_no            TYPE c LENGTH 10,
        "! InvYear
        inv_year              TYPE c LENGTH 4,
        "! InvRecDate
        inv_rec_date          TYPE string,
        "! PlanningLevel
        planning_level        TYPE c LENGTH 2,
        "! PlanningDate
        planning_date         TYPE string,
        "! Fixedterms
        fixedterms            TYPE c LENGTH 1,
        "! BusArea
        bus_area              TYPE c LENGTH 4,
        "! LotNumber
        lot_number            TYPE c LENGTH 10,
        "! ItemText
        item_text             TYPE c LENGTH 50,
        "! J1bnftype
        j_1_bnftype           TYPE c LENGTH 2,
        "! EuTriangDeal
        eu_triang_deal        TYPE abap_bool,
        "! Repcountry
        repcountry            TYPE c LENGTH 3,
        "! VatRegNo
        vat_reg_no            TYPE c LENGTH 20,
        "! BusinessPlace
        business_place        TYPE c LENGTH 4,
        "! TaxExchRate
        tax_exch_rate         TYPE p LENGTH 5 DECIMALS 5,
        "! GoodsAffected
        goods_affected        TYPE abap_bool,
        "! RetDueProp
        ret_due_prop          TYPE string,
        "! DelivPosting
        deliv_posting         TYPE c LENGTH 1,
        "! ReturnPosting
        return_posting        TYPE c LENGTH 1,
        "! InvTran
        inv_tran              TYPE c LENGTH 1,
        "! Simulation
        simulation            TYPE abap_bool,
        "! J1tpbupl
        j_1_tpbupl            TYPE c LENGTH 5,
        "! Secco
        secco                 TYPE c LENGTH 4,
        "! Vatdate
        vatdate               TYPE string,
        "! DeCreInd
        de_cre_ind            TYPE c LENGTH 1,
        "! TransDate
        trans_date            TYPE string,
        "! TaxCalcDate
        tax_calc_date         TYPE string,
        "! Housebankacctid
        housebankacctid       TYPE c LENGTH 5,
        "! DelCostsTaxCountry
        del_costs_tax_country TYPE c LENGTH 3,
        "! GstPart
        gst_part              TYPE c LENGTH 10,
        "! PlcSup
        plc_sup               TYPE c LENGTH 3,
        "! Irn
        irn                   TYPE c LENGTH 64,
        "! Fulfilldate
        fulfilldate           TYPE string,
        "! GloRef1Hd
        glo_ref_1_hd          TYPE c LENGTH 80,
        "! GloDat1Hd
        glo_dat_1_hd          TYPE string,
        "! GloRef2Hd
        glo_ref_2_hd          TYPE c LENGTH 25,
        "! GloDat2Hd
        glo_dat_2_hd          TYPE string,
        "! GloRef3Hd
        glo_ref_3_hd          TYPE c LENGTH 25,
        "! GloDat3Hd
        glo_dat_3_hd          TYPE string,
        "! GloRef4Hd
        glo_ref_4_hd          TYPE c LENGTH 50,
        "! GloDat4Hd
        glo_dat_4_hd          TYPE string,
        "! GloRef5Hd
        glo_ref_5_hd          TYPE c LENGTH 50,
        "! GloDat5Hd
        glo_dat_5_hd          TYPE string,
        "! GloBp1Hd
        glo_bp_1_hd           TYPE c LENGTH 10,
        "! GloBp2Hd
        glo_bp_2_hd           TYPE c LENGTH 10,
      END OF tys_data,
      "! <p class="shorttext synchronized">List of data</p>
      tyt_data TYPE STANDARD TABLE OF tys_data WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">glaccount</p>
      BEGIN OF tys_glaccount,
        "! <em>Key property</em> DateTime
        date_time        TYPE string,
        "! InvoiceDocItem
        invoice_doc_item TYPE c LENGTH 6,
        "! GlAccount
        gl_account       TYPE c LENGTH 10,
        "! ItemAmount
        item_amount      TYPE p LENGTH 12 DECIMALS 4,
        "! DbCrInd
        db_cr_ind        TYPE c LENGTH 1,
        "! NegPostng
        neg_postng       TYPE abap_bool,
        "! CompCode
        comp_code        TYPE c LENGTH 4,
        "! TaxCode
        tax_code         TYPE c LENGTH 2,
        "! Taxjurcode
        taxjurcode       TYPE c LENGTH 15,
        "! ItemText
        item_text        TYPE c LENGTH 50,
        "! Costcenter
        costcenter       TYPE c LENGTH 10,
        "! SdDoc
        sd_doc           TYPE c LENGTH 10,
        "! SdocItem
        sdoc_item        TYPE c LENGTH 6,
        "! Orderid
        orderid          TYPE c LENGTH 12,
        "! RefDate
        ref_date         TYPE string,
        "! CmmtItem
        cmmt_item        TYPE c LENGTH 24,
        "! FundsCtr
        funds_ctr        TYPE c LENGTH 16,
        "! FuncArea
        func_area        TYPE c LENGTH 4,
        "! ProfitCtr
        profit_ctr       TYPE c LENGTH 10,
        "! Fund
        fund             TYPE c LENGTH 10,
        "! BusArea
        bus_area         TYPE c LENGTH 4,
        "! TrPartBa
        tr_part_ba       TYPE c LENGTH 4,
        "! Costobject
        costobject       TYPE c LENGTH 12,
        "! Network
        network          TYPE c LENGTH 12,
        "! Activity
        activity         TYPE c LENGTH 4,
        "! WbsElem
        wbs_elem         TYPE c LENGTH 24,
        "! Acttype
        acttype          TYPE c LENGTH 6,
        "! RlEstKey
        rl_est_key       TYPE c LENGTH 40,
        "! PersonNo
        person_no        TYPE c LENGTH 8,
        "! CoBusproc
        co_busproc       TYPE c LENGTH 12,
        "! GrantNbr
        grant_nbr        TYPE c LENGTH 20,
        "! CmmtItemLong
        cmmt_item_long   TYPE c LENGTH 24,
        "! FuncAreaLong
        func_area_long   TYPE c LENGTH 16,
        "! Quantity
        quantity         TYPE p LENGTH 7 DECIMALS 3,
        "! BaseUom
        base_uom         TYPE c LENGTH 3,
        "! AllocNmbr
        alloc_nmbr       TYPE c LENGTH 18,
        "! CshdisInd
        cshdis_ind       TYPE abap_bool,
        "! TaxBaseAmount
        tax_base_amount  TYPE p LENGTH 12 DECIMALS 4,
        "! ProfitSegmNo
        profit_segm_no   TYPE c LENGTH 10,
        "! Plant
        plant            TYPE c LENGTH 4,
        "! BudgetPeriod
        budget_period    TYPE c LENGTH 10,
        "! CoArea
        co_area          TYPE c LENGTH 4,
        "! Recid
        recid            TYPE c LENGTH 4,
        "! WorkItemId
        work_item_id     TYPE c LENGTH 10,
        "! TaxCountry
        tax_country      TYPE c LENGTH 3,
        "! CsTransT
        cs_trans_t       TYPE c LENGTH 3,
      END OF tys_glaccount,
      "! <p class="shorttext synchronized">List of glaccount</p>
      tyt_glaccount TYPE STANDARD TABLE OF tys_glaccount WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">header</p>
      BEGIN OF tys_header,
        "! <em>Key property</em> DateTime
        date_time   TYPE string,
        "! DocNumber
        doc_number  TYPE string,
        "! FiscalYear
        fiscal_year TYPE string,
      END OF tys_header,
      "! <p class="shorttext synchronized">List of header</p>
      tyt_header TYPE STANDARD TABLE OF tys_header WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">item</p>
      BEGIN OF tys_item,
        "! <em>Key property</em> DateTime
        date_time               TYPE string,
        "! InvoiceDocItem
        invoice_doc_item        TYPE c LENGTH 6,
        "! PoNumber
        po_number               TYPE c LENGTH 10,
        "! PoItem
        po_item                 TYPE c LENGTH 5,
        "! RefDoc
        ref_doc                 TYPE c LENGTH 10,
        "! RefDocYear
        ref_doc_year            TYPE c LENGTH 4,
        "! RefDocIt
        ref_doc_it              TYPE c LENGTH 4,
        "! DeCreInd
        de_cre_ind              TYPE c LENGTH 1,
        "! TaxCode
        tax_code                TYPE c LENGTH 2,
        "! Taxjurcode
        taxjurcode              TYPE c LENGTH 15,
        "! ItemAmount
        item_amount             TYPE p LENGTH 12 DECIMALS 4,
        "! Quantity
        quantity                TYPE p LENGTH 7 DECIMALS 3,
        "! PoUnit
        po_unit                 TYPE c LENGTH 3,
        "! PoUnitIso
        po_unit_iso             TYPE c LENGTH 3,
        "! PoPrQnt
        po_pr_qnt               TYPE p LENGTH 7 DECIMALS 3,
        "! PoPrUom
        po_pr_uom               TYPE c LENGTH 3,
        "! PoPrUomIso
        po_pr_uom_iso           TYPE c LENGTH 3,
        "! CondType
        cond_type               TYPE c LENGTH 4,
        "! CondStNo
        cond_st_no              TYPE c LENGTH 3,
        "! CondCount
        cond_count              TYPE c LENGTH 2,
        "! SheetNo
        sheet_no                TYPE c LENGTH 10,
        "! ItemText
        item_text               TYPE c LENGTH 50,
        "! FinalInv
        final_inv               TYPE abap_bool,
        "! SheetItem
        sheet_item              TYPE c LENGTH 10,
        "! GrirClearSrv
        grir_clear_srv          TYPE abap_bool,
        "! FreightVen
        freight_ven             TYPE c LENGTH 10,
        "! CshdisInd
        cshdis_ind              TYPE abap_bool,
        "! RetentionDocuCurrency
        retention_docu_currency TYPE p LENGTH 8 DECIMALS 3,
        "! RetentionPercentage
        retention_percentage    TYPE p LENGTH 3 DECIMALS 2,
        "! RetentionDueDate
        retention_due_date      TYPE string,
        "! NoRetention
        no_retention            TYPE abap_bool,
        "! ValuationType
        valuation_type          TYPE c LENGTH 10,
        "! InvRelation
        inv_relation            TYPE c LENGTH 6,
        "! InvItmOrigin
        inv_itm_origin          TYPE c LENGTH 1,
        "! CondCountLong
        cond_count_long         TYPE c LENGTH 3,
        "! DelCreateDate
        del_create_date         TYPE string,
        "! TaxCountry
        tax_country             TYPE c LENGTH 3,
        "! HsnSac
        hsn_sac                 TYPE c LENGTH 16,
        "! CustomsVal
        customs_val             TYPE p LENGTH 12 DECIMALS 4,
      END OF tys_item,
      "! <p class="shorttext synchronized">List of item</p>
      tyt_item TYPE STANDARD TABLE OF tys_item WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">return</p>
      BEGIN OF tys_return,
        "! <em>Key property</em> Type
        type        TYPE c LENGTH 1,
        "! <em>Key property</em> Id
        id          TYPE c LENGTH 20,
        "! <em>Key property</em> Number
        number      TYPE c LENGTH 3,
        "! Message
        message     TYPE c LENGTH 220,
        "! LogNo
        log_no      TYPE c LENGTH 20,
        "! LogMsgNo
        log_msg_no  TYPE c LENGTH 6,
        "! MessageV1
        message_v_1 TYPE c LENGTH 50,
        "! MessageV2
        message_v_2 TYPE c LENGTH 50,
        "! MessageV3
        message_v_3 TYPE c LENGTH 50,
        "! MessageV4
        message_v_4 TYPE c LENGTH 50,
        "! Parameter
        parameter   TYPE c LENGTH 32,
        "! Row
        row         TYPE int4,
        "! Field
        field       TYPE c LENGTH 30,
        "! System
        system      TYPE c LENGTH 10,
      END OF tys_return,
      "! <p class="shorttext synchronized">List of return</p>
      tyt_return TYPE STANDARD TABLE OF tys_return WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">withtax</p>
      BEGIN OF tys_withtax,
        "! <em>Key property</em> DateTime
        date_time           TYPE string,
        "! SplitKey
        split_key           TYPE c LENGTH 6,
        "! WiTaxType
        wi_tax_type         TYPE c LENGTH 2,
        "! WiTaxCode
        wi_tax_code         TYPE c LENGTH 2,
        "! WiTaxBase
        wi_tax_base         TYPE p LENGTH 12 DECIMALS 4,
        "! WiTaxAmt
        wi_tax_amt          TYPE p LENGTH 12 DECIMALS 4,
        "! WiTaxWithheldAmt
        wi_tax_withheld_amt TYPE p LENGTH 12 DECIMALS 4,
      END OF tys_withtax,
      "! <p class="shorttext synchronized">List of withtax</p>
      tyt_withtax TYPE STANDARD TABLE OF tys_withtax WITH DEFAULT KEY.

    TYPES: BEGIN OF ty_deep,
             date_time           TYPE string,
             doc_number          TYPE string,
             fiscal_year         TYPE string,
             headertodata       TYPE TABLE OF tys_data WITH DEFAULT KEY,
             headertoitem       TYPE TABLE OF tys_item WITH DEFAULT KEY,
             headertoaccounting TYPE TABLE OF tys_accounting WITH DEFAULT KEY,
             headertoglaccount  TYPE TABLE OF tys_glaccount WITH DEFAULT KEY,
             header_to_withtax    TYPE TABLE OF tys_withtax WITH DEFAULT KEY,
             headertoreturn     TYPE TABLE OF tys_return WITH DEFAULT KEY,
           END OF ty_deep.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! accountingSet
        "! <br/> Collection of type 'accounting'
        accounting_set TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'ACCOUNTING_SET',
        "! dataSet
        "! <br/> Collection of type 'data'
        data_set       TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'DATA_SET',
        "! glaccountSet
        "! <br/> Collection of type 'glaccount'
        glaccount_set  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'GLACCOUNT_SET',
        "! headerSet
        "! <br/> Collection of type 'header'
        header_set     TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'HEADER_SET',
        "! itemSet
        "! <br/> Collection of type 'item'
        item_set       TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'ITEM_SET',
        "! returnSet
        "! <br/> Collection of type 'return'
        return_set     TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'RETURN_SET',
        "! withtaxSet
        "! <br/> Collection of type 'withtax'
        withtax_set    TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'WITHTAX_SET',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for accounting</p>
        "! See also structure type {@link ..tys_accounting}
        BEGIN OF accounting,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF accounting,
        "! <p class="shorttext synchronized">Internal names for data</p>
        "! See also structure type {@link ..tys_data}
        BEGIN OF data,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF data,
        "! <p class="shorttext synchronized">Internal names for glaccount</p>
        "! See also structure type {@link ..tys_glaccount}
        BEGIN OF glaccount,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF glaccount,
        "! <p class="shorttext synchronized">Internal names for header</p>
        "! See also structure type {@link ..tys_header}
        BEGIN OF header,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! HEADERTOACCOUNTING
            headertoaccounting TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOACCOUNTING',
            "! HEADERTODATA
            headertodata       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTODATA',
            "! HEADERTOGLACCOUNT
            headertoglaccount  TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOGLACCOUNT',
            "! HEADERTOITEM
            headertoitem       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOITEM',
            "! HEADERTORETURN
            headertoreturn     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTORETURN',
            "! HEADER_TO_WITHTAX
            header_to_withtax  TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADER_TO_WITHTAX',
          END OF navigation,
        END OF header,
        "! <p class="shorttext synchronized">Internal names for item</p>
        "! See also structure type {@link ..tys_item}
        BEGIN OF item,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF item,
        "! <p class="shorttext synchronized">Internal names for return</p>
        "! See also structure type {@link ..tys_return}
        BEGIN OF return,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF return,
        "! <p class="shorttext synchronized">Internal names for withtax</p>
        "! See also structure type {@link ..tys_withtax}
        BEGIN OF withtax,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF withtax,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define accounting</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_accounting RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define data</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_data RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define glaccount</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_glaccount RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define header</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_header RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define item</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_item RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define return</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_return RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define withtax</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_withtax RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSCM_BAPI_INCOMINGINVOICE_CREA IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'ZFM_BAPI_INCOMINGINVOICE_CREAT_SRV' ) ##NO_TEXT.

    def_accounting( ).
    def_data( ).
    def_glaccount( ).
    def_header( ).
    def_item( ).
    def_return( ).
    def_withtax( ).

  ENDMETHOD.


  METHOD def_accounting.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'ACCOUNTING'
                                    is_structure              = VALUE tys_accounting( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'accounting' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'ACCOUNTING_SET' ).
    lo_entity_set->set_edm_name( 'accountingSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICE_DOC_ITEM' ).
    lo_primitive_property->set_edm_name( 'InvoiceDocItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XUNPL' ).
    lo_primitive_property->set_edm_name( 'Xunpl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERIAL_NO' ).
    lo_primitive_property->set_edm_name( 'SerialNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXJURCODE' ).
    lo_primitive_property->set_edm_name( 'Taxjurcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ItemAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY' ).
    lo_primitive_property->set_edm_name( 'Quantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_UNIT' ).
    lo_primitive_property->set_edm_name( 'PoUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_UNIT_ISO' ).
    lo_primitive_property->set_edm_name( 'PoUnitIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_PR_QNT' ).
    lo_primitive_property->set_edm_name( 'PoPrQnt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_PR_UOM' ).
    lo_primitive_property->set_edm_name( 'PoPrUom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_PR_UOM_ISO' ).
    lo_primitive_property->set_edm_name( 'PoPrUomIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GL_ACCOUNT' ).
    lo_primitive_property->set_edm_name( 'GlAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COSTCENTER' ).
    lo_primitive_property->set_edm_name( 'Costcenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SD_DOC' ).
    lo_primitive_property->set_edm_name( 'SdDoc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDOC_ITEM' ).
    lo_primitive_property->set_edm_name( 'SdocItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ASSET_NO' ).
    lo_primitive_property->set_edm_name( 'AssetNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUB_NUMBER' ).
    lo_primitive_property->set_edm_name( 'SubNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDERID' ).
    lo_primitive_property->set_edm_name( 'Orderid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_DATE' ).
    lo_primitive_property->set_edm_name( 'RefDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMMT_ITEM' ).
    lo_primitive_property->set_edm_name( 'CmmtItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNDS_CTR' ).
    lo_primitive_property->set_edm_name( 'FundsCtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNC_AREA' ).
    lo_primitive_property->set_edm_name( 'FuncArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUND' ).
    lo_primitive_property->set_edm_name( 'Fund' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUS_AREA' ).
    lo_primitive_property->set_edm_name( 'BusArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RL_EST_KEY' ).
    lo_primitive_property->set_edm_name( 'RlEstKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CO_AREA' ).
    lo_primitive_property->set_edm_name( 'CoArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COSTOBJECT' ).
    lo_primitive_property->set_edm_name( 'Costobject' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETWORK' ).
    lo_primitive_property->set_edm_name( 'Network' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACTIVITY' ).
    lo_primitive_property->set_edm_name( 'Activity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROFIT_SEGM_NO' ).
    lo_primitive_property->set_edm_name( 'ProfitSegmNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROFIT_CTR' ).
    lo_primitive_property->set_edm_name( 'ProfitCtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WBS_ELEM' ).
    lo_primitive_property->set_edm_name( 'WbsElem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRANT_NBR' ).
    lo_primitive_property->set_edm_name( 'GrantNbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMMT_ITEM_LONG' ).
    lo_primitive_property->set_edm_name( 'CmmtItemLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNC_AREA_LONG' ).
    lo_primitive_property->set_edm_name( 'FuncAreaLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDGET_PERIOD' ).
    lo_primitive_property->set_edm_name( 'BudgetPeriod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEL_CREATE_DATE' ).
    lo_primitive_property->set_edm_name( 'DelCreateDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_TEXT' ).
    lo_primitive_property->set_edm_name( 'ItemText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STLMNT_PER' ).
    lo_primitive_property->set_edm_name( 'StlmntPer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_data.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'DATA'
                                    is_structure              = VALUE tys_data( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'data' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'DATA_SET' ).
    lo_entity_set->set_edm_name( 'dataSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICE_IND' ).
    lo_primitive_property->set_edm_name( 'InvoiceInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOC_TYPE' ).
    lo_primitive_property->set_edm_name( 'DocType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOC_DATE' ).
    lo_primitive_property->set_edm_name( 'DocDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSTNG_DATE' ).
    lo_primitive_property->set_edm_name( 'PstngDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_DOC_NO' ).
    lo_primitive_property->set_edm_name( 'RefDocNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMP_CODE' ).
    lo_primitive_property->set_edm_name( 'CompCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DIFF_INV' ).
    lo_primitive_property->set_edm_name( 'DiffInv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURRENCY' ).
    lo_primitive_property->set_edm_name( 'Currency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURRENCY_ISO' ).
    lo_primitive_property->set_edm_name( 'CurrencyIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXCH_RATE' ).
    lo_primitive_property->set_edm_name( 'ExchRate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXCH_RATE_V' ).
    lo_primitive_property->set_edm_name( 'ExchRateV' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GROSS_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'GrossAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CALC_TAX_IND' ).
    lo_primitive_property->set_edm_name( 'CalcTaxInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PMNTTRMS' ).
    lo_primitive_property->set_edm_name( 'Pmnttrms' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLINE_DATE' ).
    lo_primitive_property->set_edm_name( 'BlineDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DSCT_DAYS_1' ).
    lo_primitive_property->set_edm_name( 'DsctDays1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DSCT_DAYS_2' ).
    lo_primitive_property->set_edm_name( 'DsctDays2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETTERMS' ).
    lo_primitive_property->set_edm_name( 'Netterms' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DSCT_PCT_1' ).
    lo_primitive_property->set_edm_name( 'DsctPct1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DSCT_PCT_2' ).
    lo_primitive_property->set_edm_name( 'DsctPct2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IV_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'IvCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HEADER_TXT' ).
    lo_primitive_property->set_edm_name( 'HeaderTxt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PMNT_BLOCK' ).
    lo_primitive_property->set_edm_name( 'PmntBlock' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEL_COSTS' ).
    lo_primitive_property->set_edm_name( 'DelCosts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEL_COSTS_TAXC' ).
    lo_primitive_property->set_edm_name( 'DelCostsTaxc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEL_COSTS_TAXJ' ).
    lo_primitive_property->set_edm_name( 'DelCostsTaxj' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERSON_EXT' ).
    lo_primitive_property->set_edm_name( 'PersonExt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYMT_METH' ).
    lo_primitive_property->set_edm_name( 'PymtMeth' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PMTMTHSUPL' ).
    lo_primitive_property->set_edm_name( 'Pmtmthsupl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INV_DOC_NO' ).
    lo_primitive_property->set_edm_name( 'InvDocNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCBANK_IND' ).
    lo_primitive_property->set_edm_name( 'ScbankInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPCOUNTRY' ).
    lo_primitive_property->set_edm_name( 'Supcountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLLSRV_IND' ).
    lo_primitive_property->set_edm_name( 'BllsrvInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_DOC_NO_LONG' ).
    lo_primitive_property->set_edm_name( 'RefDocNoLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DSCT_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'DsctAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_SUB_NO' ).
    lo_primitive_property->set_edm_name( 'PoSubNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 11 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_CHECKDG' ).
    lo_primitive_property->set_edm_name( 'PoCheckdg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_REF_NO' ).
    lo_primitive_property->set_edm_name( 'PoRefNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 27 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYEE_PAYER' ).
    lo_primitive_property->set_edm_name( 'PayeePayer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_BK' ).
    lo_primitive_property->set_edm_name( 'PartnerBk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSEBANKID' ).
    lo_primitive_property->set_edm_name( 'Housebankid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALLOC_NMBR' ).
    lo_primitive_property->set_edm_name( 'AllocNmbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYMT_REF' ).
    lo_primitive_property->set_edm_name( 'PaymtRef' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INV_REF_NO' ).
    lo_primitive_property->set_edm_name( 'InvRefNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INV_YEAR' ).
    lo_primitive_property->set_edm_name( 'InvYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INV_REC_DATE' ).
    lo_primitive_property->set_edm_name( 'InvRecDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANNING_LEVEL' ).
    lo_primitive_property->set_edm_name( 'PlanningLevel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANNING_DATE' ).
    lo_primitive_property->set_edm_name( 'PlanningDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIXEDTERMS' ).
    lo_primitive_property->set_edm_name( 'Fixedterms' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUS_AREA' ).
    lo_primitive_property->set_edm_name( 'BusArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOT_NUMBER' ).
    lo_primitive_property->set_edm_name( 'LotNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_TEXT' ).
    lo_primitive_property->set_edm_name( 'ItemText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_BNFTYPE' ).
    lo_primitive_property->set_edm_name( 'J1bnftype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EU_TRIANG_DEAL' ).
    lo_primitive_property->set_edm_name( 'EuTriangDeal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REPCOUNTRY' ).
    lo_primitive_property->set_edm_name( 'Repcountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAT_REG_NO' ).
    lo_primitive_property->set_edm_name( 'VatRegNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PLACE' ).
    lo_primitive_property->set_edm_name( 'BusinessPlace' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_EXCH_RATE' ).
    lo_primitive_property->set_edm_name( 'TaxExchRate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GOODS_AFFECTED' ).
    lo_primitive_property->set_edm_name( 'GoodsAffected' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RET_DUE_PROP' ).
    lo_primitive_property->set_edm_name( 'RetDueProp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIV_POSTING' ).
    lo_primitive_property->set_edm_name( 'DelivPosting' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETURN_POSTING' ).
    lo_primitive_property->set_edm_name( 'ReturnPosting' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INV_TRAN' ).
    lo_primitive_property->set_edm_name( 'InvTran' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SIMULATION' ).
    lo_primitive_property->set_edm_name( 'Simulation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_TPBUPL' ).
    lo_primitive_property->set_edm_name( 'J1tpbupl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SECCO' ).
    lo_primitive_property->set_edm_name( 'Secco' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VATDATE' ).
    lo_primitive_property->set_edm_name( 'Vatdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DE_CRE_IND' ).
    lo_primitive_property->set_edm_name( 'DeCreInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANS_DATE' ).
    lo_primitive_property->set_edm_name( 'TransDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CALC_DATE' ).
    lo_primitive_property->set_edm_name( 'TaxCalcDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSEBANKACCTID' ).
    lo_primitive_property->set_edm_name( 'Housebankacctid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEL_COSTS_TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'DelCostsTaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GST_PART' ).
    lo_primitive_property->set_edm_name( 'GstPart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLC_SUP' ).
    lo_primitive_property->set_edm_name( 'PlcSup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IRN' ).
    lo_primitive_property->set_edm_name( 'Irn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 64 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FULFILLDATE' ).
    lo_primitive_property->set_edm_name( 'Fulfilldate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_1_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef1Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_1_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat1Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_2_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef2Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_2_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat2Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_3_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef3Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_3_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat3Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_4_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef4Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_4_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat4Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_5_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef5Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_5_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat5Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_BP_1_HD' ).
    lo_primitive_property->set_edm_name( 'GloBp1Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_BP_2_HD' ).
    lo_primitive_property->set_edm_name( 'GloBp2Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_glaccount.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'GLACCOUNT'
                                    is_structure              = VALUE tys_glaccount( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'glaccount' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'GLACCOUNT_SET' ).
    lo_entity_set->set_edm_name( 'glaccountSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICE_DOC_ITEM' ).
    lo_primitive_property->set_edm_name( 'InvoiceDocItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GL_ACCOUNT' ).
    lo_primitive_property->set_edm_name( 'GlAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ItemAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DB_CR_IND' ).
    lo_primitive_property->set_edm_name( 'DbCrInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NEG_POSTNG' ).
    lo_primitive_property->set_edm_name( 'NegPostng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMP_CODE' ).
    lo_primitive_property->set_edm_name( 'CompCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXJURCODE' ).
    lo_primitive_property->set_edm_name( 'Taxjurcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_TEXT' ).
    lo_primitive_property->set_edm_name( 'ItemText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COSTCENTER' ).
    lo_primitive_property->set_edm_name( 'Costcenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SD_DOC' ).
    lo_primitive_property->set_edm_name( 'SdDoc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDOC_ITEM' ).
    lo_primitive_property->set_edm_name( 'SdocItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDERID' ).
    lo_primitive_property->set_edm_name( 'Orderid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_DATE' ).
    lo_primitive_property->set_edm_name( 'RefDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMMT_ITEM' ).
    lo_primitive_property->set_edm_name( 'CmmtItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNDS_CTR' ).
    lo_primitive_property->set_edm_name( 'FundsCtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNC_AREA' ).
    lo_primitive_property->set_edm_name( 'FuncArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROFIT_CTR' ).
    lo_primitive_property->set_edm_name( 'ProfitCtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUND' ).
    lo_primitive_property->set_edm_name( 'Fund' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUS_AREA' ).
    lo_primitive_property->set_edm_name( 'BusArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TR_PART_BA' ).
    lo_primitive_property->set_edm_name( 'TrPartBa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COSTOBJECT' ).
    lo_primitive_property->set_edm_name( 'Costobject' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETWORK' ).
    lo_primitive_property->set_edm_name( 'Network' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACTIVITY' ).
    lo_primitive_property->set_edm_name( 'Activity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WBS_ELEM' ).
    lo_primitive_property->set_edm_name( 'WbsElem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACTTYPE' ).
    lo_primitive_property->set_edm_name( 'Acttype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RL_EST_KEY' ).
    lo_primitive_property->set_edm_name( 'RlEstKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERSON_NO' ).
    lo_primitive_property->set_edm_name( 'PersonNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CO_BUSPROC' ).
    lo_primitive_property->set_edm_name( 'CoBusproc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRANT_NBR' ).
    lo_primitive_property->set_edm_name( 'GrantNbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMMT_ITEM_LONG' ).
    lo_primitive_property->set_edm_name( 'CmmtItemLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNC_AREA_LONG' ).
    lo_primitive_property->set_edm_name( 'FuncAreaLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY' ).
    lo_primitive_property->set_edm_name( 'Quantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BASE_UOM' ).
    lo_primitive_property->set_edm_name( 'BaseUom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALLOC_NMBR' ).
    lo_primitive_property->set_edm_name( 'AllocNmbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CSHDIS_IND' ).
    lo_primitive_property->set_edm_name( 'CshdisInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_BASE_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'TaxBaseAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROFIT_SEGM_NO' ).
    lo_primitive_property->set_edm_name( 'ProfitSegmNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANT' ).
    lo_primitive_property->set_edm_name( 'Plant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDGET_PERIOD' ).
    lo_primitive_property->set_edm_name( 'BudgetPeriod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CO_AREA' ).
    lo_primitive_property->set_edm_name( 'CoArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RECID' ).
    lo_primitive_property->set_edm_name( 'Recid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WORK_ITEM_ID' ).
    lo_primitive_property->set_edm_name( 'WorkItemId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CS_TRANS_T' ).
    lo_primitive_property->set_edm_name( 'CsTransT' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_header.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'HEADER'
                                    is_structure              = VALUE tys_header( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'header' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'HEADER_SET' ).
    lo_entity_set->set_edm_name( 'headerSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOC_NUMBER' ).
    lo_primitive_property->set_edm_name( 'DocNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_YEAR' ).
    lo_primitive_property->set_edm_name( 'FiscalYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOACCOUNTING' ).
    lo_navigation_property->set_edm_name( 'HEADERTOACCOUNTING' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'ACCOUNTING' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTODATA' ).
    lo_navigation_property->set_edm_name( 'HEADERTODATA' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'DATA' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOGLACCOUNT' ).
    lo_navigation_property->set_edm_name( 'HEADERTOGLACCOUNT' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'GLACCOUNT' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOITEM' ).
    lo_navigation_property->set_edm_name( 'HEADERTOITEM' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'ITEM' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTORETURN' ).
    lo_navigation_property->set_edm_name( 'HEADERTORETURN' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'RETURN' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADER_TO_WITHTAX' ).
    lo_navigation_property->set_edm_name( 'HEADER_TO_WITHTAX' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'WITHTAX' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


  METHOD def_item.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'ITEM'
                                    is_structure              = VALUE tys_item( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'item' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'ITEM_SET' ).
    lo_entity_set->set_edm_name( 'itemSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICE_DOC_ITEM' ).
    lo_primitive_property->set_edm_name( 'InvoiceDocItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_NUMBER' ).
    lo_primitive_property->set_edm_name( 'PoNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_ITEM' ).
    lo_primitive_property->set_edm_name( 'PoItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_DOC' ).
    lo_primitive_property->set_edm_name( 'RefDoc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_DOC_YEAR' ).
    lo_primitive_property->set_edm_name( 'RefDocYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_DOC_IT' ).
    lo_primitive_property->set_edm_name( 'RefDocIt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DE_CRE_IND' ).
    lo_primitive_property->set_edm_name( 'DeCreInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXJURCODE' ).
    lo_primitive_property->set_edm_name( 'Taxjurcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ItemAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY' ).
    lo_primitive_property->set_edm_name( 'Quantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_UNIT' ).
    lo_primitive_property->set_edm_name( 'PoUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_UNIT_ISO' ).
    lo_primitive_property->set_edm_name( 'PoUnitIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_PR_QNT' ).
    lo_primitive_property->set_edm_name( 'PoPrQnt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_PR_UOM' ).
    lo_primitive_property->set_edm_name( 'PoPrUom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_PR_UOM_ISO' ).
    lo_primitive_property->set_edm_name( 'PoPrUomIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COND_TYPE' ).
    lo_primitive_property->set_edm_name( 'CondType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COND_ST_NO' ).
    lo_primitive_property->set_edm_name( 'CondStNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COND_COUNT' ).
    lo_primitive_property->set_edm_name( 'CondCount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHEET_NO' ).
    lo_primitive_property->set_edm_name( 'SheetNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_TEXT' ).
    lo_primitive_property->set_edm_name( 'ItemText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FINAL_INV' ).
    lo_primitive_property->set_edm_name( 'FinalInv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHEET_ITEM' ).
    lo_primitive_property->set_edm_name( 'SheetItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRIR_CLEAR_SRV' ).
    lo_primitive_property->set_edm_name( 'GrirClearSrv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FREIGHT_VEN' ).
    lo_primitive_property->set_edm_name( 'FreightVen' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CSHDIS_IND' ).
    lo_primitive_property->set_edm_name( 'CshdisInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETENTION_DOCU_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'RetentionDocuCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETENTION_PERCENTAGE' ).
    lo_primitive_property->set_edm_name( 'RetentionPercentage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETENTION_DUE_DATE' ).
    lo_primitive_property->set_edm_name( 'RetentionDueDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NO_RETENTION' ).
    lo_primitive_property->set_edm_name( 'NoRetention' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALUATION_TYPE' ).
    lo_primitive_property->set_edm_name( 'ValuationType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INV_RELATION' ).
    lo_primitive_property->set_edm_name( 'InvRelation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INV_ITM_ORIGIN' ).
    lo_primitive_property->set_edm_name( 'InvItmOrigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COND_COUNT_LONG' ).
    lo_primitive_property->set_edm_name( 'CondCountLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEL_CREATE_DATE' ).
    lo_primitive_property->set_edm_name( 'DelCreateDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HSN_SAC' ).
    lo_primitive_property->set_edm_name( 'HsnSac' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMS_VAL' ).
    lo_primitive_property->set_edm_name( 'CustomsVal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_return.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'RETURN'
                                    is_structure              = VALUE tys_return( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'return' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'RETURN_SET' ).
    lo_entity_set->set_edm_name( 'returnSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'TYPE' ).
    lo_primitive_property->set_edm_name( 'Type' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NUMBER' ).
    lo_primitive_property->set_edm_name( 'Number' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE' ).
    lo_primitive_property->set_edm_name( 'Message' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 220 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOG_NO' ).
    lo_primitive_property->set_edm_name( 'LogNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOG_MSG_NO' ).
    lo_primitive_property->set_edm_name( 'LogMsgNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE_V_1' ).
    lo_primitive_property->set_edm_name( 'MessageV1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE_V_2' ).
    lo_primitive_property->set_edm_name( 'MessageV2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE_V_3' ).
    lo_primitive_property->set_edm_name( 'MessageV3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE_V_4' ).
    lo_primitive_property->set_edm_name( 'MessageV4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARAMETER' ).
    lo_primitive_property->set_edm_name( 'Parameter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROW' ).
    lo_primitive_property->set_edm_name( 'Row' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIELD' ).
    lo_primitive_property->set_edm_name( 'Field' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SYSTEM' ).
    lo_primitive_property->set_edm_name( 'System' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_withtax.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'WITHTAX'
                                    is_structure              = VALUE tys_withtax( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'withtax' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'WITHTAX_SET' ).
    lo_entity_set->set_edm_name( 'withtaxSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPLIT_KEY' ).
    lo_primitive_property->set_edm_name( 'SplitKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WI_TAX_TYPE' ).
    lo_primitive_property->set_edm_name( 'WiTaxType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WI_TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'WiTaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WI_TAX_BASE' ).
    lo_primitive_property->set_edm_name( 'WiTaxBase' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WI_TAX_AMT' ).
    lo_primitive_property->set_edm_name( 'WiTaxAmt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WI_TAX_WITHHELD_AMT' ).
    lo_primitive_property->set_edm_name( 'WiTaxWithheldAmt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.

  ENDMETHOD.
ENDCLASS.
