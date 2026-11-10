"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>ZFI_ACC_JE_POST_SRV</em>
CLASS zscm_zfi_acc_je_post DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">ACCOUNTGL</p>
      BEGIN OF tys_accountgl,
        "! <em>Key property</em> DateTime
        date_time                 TYPE string,
        "! ItemnoAcc
        itemno_acc                TYPE c LENGTH 10,
        "! GlAccount
        gl_account                TYPE c LENGTH 10,
        "! ItemText
        item_text                 TYPE c LENGTH 50,
        "! StatCon
        stat_con                  TYPE c LENGTH 1,
        "! LogProc
        log_proc                  TYPE c LENGTH 6,
        "! AcDocNo
        ac_doc_no                 TYPE c LENGTH 10,
        "! RefKey1
        ref_key_1                 TYPE c LENGTH 12,
        "! RefKey2
        ref_key_2                 TYPE c LENGTH 12,
        "! RefKey3
        ref_key_3                 TYPE c LENGTH 20,
        "! AcctKey
        acct_key                  TYPE c LENGTH 3,
        "! AcctType
        acct_type                 TYPE c LENGTH 1,
        "! DocType
        doc_type                  TYPE c LENGTH 2,
        "! CompCode
        comp_code                 TYPE c LENGTH 4,
        "! BusArea
        bus_area                  TYPE c LENGTH 4,
        "! FuncArea
        func_area                 TYPE c LENGTH 4,
        "! Plant
        plant                     TYPE c LENGTH 4,
        "! FisPeriod
        fis_period                TYPE c LENGTH 2,
        "! FiscYear
        fisc_year                 TYPE c LENGTH 4,
        "! PstngDate
        pstng_date                TYPE string,
        "! ValueDate
        value_date                TYPE string,
        "! FmArea
        fm_area                   TYPE c LENGTH 4,
        "! Customer
        customer                  TYPE c LENGTH 10,
        "! CshdisInd
        cshdis_ind                TYPE abap_bool,
        "! VendorNo
        vendor_no                 TYPE c LENGTH 10,
        "! AllocNmbr
        alloc_nmbr                TYPE c LENGTH 18,
        "! TaxCode
        tax_code                  TYPE c LENGTH 2,
        "! Taxjurcode
        taxjurcode                TYPE c LENGTH 15,
        "! ExtObjectId
        ext_object_id             TYPE c LENGTH 34,
        "! BusScenario
        bus_scenario              TYPE c LENGTH 16,
        "! Costobject
        costobject                TYPE c LENGTH 12,
        "! Costcenter
        costcenter                TYPE c LENGTH 10,
        "! Acttype
        acttype                   TYPE c LENGTH 6,
        "! ProfitCtr
        profit_ctr                TYPE c LENGTH 10,
        "! PartPrctr
        part_prctr                TYPE c LENGTH 10,
        "! Network
        network                   TYPE c LENGTH 12,
        "! WbsElement
        wbs_element               TYPE c LENGTH 24,
        "! Orderid
        orderid                   TYPE c LENGTH 12,
        "! OrderItno
        order_itno                TYPE c LENGTH 4,
        "! RoutingNo
        routing_no                TYPE c LENGTH 10,
        "! Activity
        activity                  TYPE c LENGTH 4,
        "! CondType
        cond_type                 TYPE c LENGTH 4,
        "! CondCount
        cond_count                TYPE c LENGTH 2,
        "! CondStNo
        cond_st_no                TYPE c LENGTH 3,
        "! Fund
        fund                      TYPE c LENGTH 10,
        "! FundsCtr
        funds_ctr                 TYPE c LENGTH 16,
        "! CmmtItem
        cmmt_item                 TYPE c LENGTH 24,
        "! CoBusproc
        co_busproc                TYPE c LENGTH 12,
        "! AssetNo
        asset_no                  TYPE c LENGTH 12,
        "! SubNumber
        sub_number                TYPE c LENGTH 4,
        "! BillType
        bill_type                 TYPE c LENGTH 4,
        "! SalesOrd
        sales_ord                 TYPE c LENGTH 10,
        "! SOrdItem
        sord_item                 TYPE c LENGTH 6,
        "! DistrChan
        distr_chan                TYPE c LENGTH 2,
        "! Division
        division                  TYPE c LENGTH 2,
        "! Salesorg
        salesorg                  TYPE c LENGTH 4,
        "! SalesGrp
        sales_grp                 TYPE c LENGTH 3,
        "! SalesOff
        sales_off                 TYPE c LENGTH 4,
        "! SoldTo
        sold_to                   TYPE c LENGTH 10,
        "! DeCreInd
        de_cre_ind                TYPE c LENGTH 1,
        "! PElPrctr
        pel_prctr                 TYPE c LENGTH 10,
        "! Xmfrw
        xmfrw                     TYPE abap_bool,
        "! Quantity
        quantity                  TYPE p LENGTH 7 DECIMALS 3,
        "! BaseUom
        base_uom                  TYPE c LENGTH 3,
        "! BaseUomIso
        base_uom_iso              TYPE c LENGTH 3,
        "! InvQty
        inv_qty                   TYPE p LENGTH 7 DECIMALS 3,
        "! InvQtySu
        inv_qty_su                TYPE p LENGTH 7 DECIMALS 3,
        "! SalesUnit
        sales_unit                TYPE c LENGTH 3,
        "! SalesUnitIso
        sales_unit_iso            TYPE c LENGTH 3,
        "! PoPrQnt
        po_pr_qnt                 TYPE p LENGTH 7 DECIMALS 3,
        "! PoPrUom
        po_pr_uom                 TYPE c LENGTH 3,
        "! PoPrUomIso
        po_pr_uom_iso             TYPE c LENGTH 3,
        "! EntryQnt
        entry_qnt                 TYPE p LENGTH 7 DECIMALS 3,
        "! EntryUom
        entry_uom                 TYPE c LENGTH 3,
        "! EntryUomIso
        entry_uom_iso             TYPE c LENGTH 3,
        "! Volume
        volume                    TYPE p LENGTH 8 DECIMALS 3,
        "! Volumeunit
        volumeunit                TYPE c LENGTH 3,
        "! VolumeunitIso
        volumeunit_iso            TYPE c LENGTH 3,
        "! GrossWt
        gross_wt                  TYPE p LENGTH 8 DECIMALS 3,
        "! NetWeight
        net_weight                TYPE p LENGTH 8 DECIMALS 3,
        "! UnitOfWt
        unit_of_wt                TYPE c LENGTH 3,
        "! UnitOfWtIso
        unit_of_wt_iso            TYPE c LENGTH 3,
        "! ItemCat
        item_cat                  TYPE c LENGTH 1,
        "! Material
        material                  TYPE c LENGTH 18,
        "! MatlType
        matl_type                 TYPE c LENGTH 4,
        "! MvtInd
        mvt_ind                   TYPE c LENGTH 1,
        "! RevalInd
        reval_ind                 TYPE abap_bool,
        "! OrigGroup
        orig_group                TYPE c LENGTH 4,
        "! OrigMat
        orig_mat                  TYPE c LENGTH 1,
        "! SerialNo
        serial_no                 TYPE c LENGTH 2,
        "! PartAcct
        part_acct                 TYPE c LENGTH 10,
        "! TrPartBa
        tr_part_ba                TYPE c LENGTH 4,
        "! TradeId
        trade_id                  TYPE c LENGTH 6,
        "! ValArea
        val_area                  TYPE c LENGTH 4,
        "! ValType
        val_type                  TYPE c LENGTH 10,
        "! AsvalDate
        asval_date                TYPE string,
        "! PoNumber
        po_number                 TYPE c LENGTH 10,
        "! PoItem
        po_item                   TYPE c LENGTH 5,
        "! ItmNumber
        itm_number                TYPE c LENGTH 6,
        "! CondCategory
        cond_category             TYPE c LENGTH 1,
        "! FuncAreaLong
        func_area_long            TYPE c LENGTH 16,
        "! CmmtItemLong
        cmmt_item_long            TYPE c LENGTH 24,
        "! GrantNbr
        grant_nbr                 TYPE c LENGTH 20,
        "! CsTransT
        cs_trans_t                TYPE c LENGTH 3,
        "! Measure
        measure                   TYPE c LENGTH 24,
        "! Segment
        segment                   TYPE c LENGTH 10,
        "! PartnerSegment
        partner_segment           TYPE c LENGTH 10,
        "! ResDoc
        res_doc                   TYPE c LENGTH 10,
        "! ResItem
        res_item                  TYPE c LENGTH 3,
        "! BillingPeriodStartDate
        billing_period_start_date TYPE string,
        "! BillingPeriodEndDate
        billing_period_end_date   TYPE string,
        "! PpaExInd
        ppa_ex_ind                TYPE abap_bool,
        "! Fastpay
        fastpay                   TYPE abap_bool,
        "! PartnerGrantNbr
        partner_grant_nbr         TYPE c LENGTH 20,
        "! BudgetPeriod
        budget_period             TYPE c LENGTH 10,
        "! PartnerBudgetPeriod
        partner_budget_period     TYPE c LENGTH 10,
        "! PartnerFund
        partner_fund              TYPE c LENGTH 10,
        "! ItemnoTax
        itemno_tax                TYPE c LENGTH 6,
        "! PaymentType
        payment_type              TYPE c LENGTH 4,
        "! ExpenseType
        expense_type              TYPE c LENGTH 4,
        "! ProgramProfile
        program_profile           TYPE c LENGTH 10,
        "! MaterialLong
        material_long             TYPE c LENGTH 40,
        "! Housebankid
        housebankid               TYPE c LENGTH 5,
        "! Housebankacctid
        housebankacctid           TYPE c LENGTH 5,
        "! PersonNo
        person_no                 TYPE c LENGTH 8,
        "! AcrobjType
        acrobj_type               TYPE c LENGTH 4,
        "! AcrobjId
        acrobj_id                 TYPE c LENGTH 32,
        "! AcrsubobjId
        acrsubobj_id              TYPE c LENGTH 32,
        "! AcritemType
        acritem_type              TYPE c LENGTH 11,
        "! Valobjtype
        valobjtype                TYPE c LENGTH 4,
        "! ValobjId
        valobj_id                 TYPE c LENGTH 32,
        "! ValsubobjId
        valsubobj_id              TYPE c LENGTH 32,
        "! TaxCalcDate
        tax_calc_date             TYPE string,
        "! TaxCalcDtFrom
        tax_calc_dt_from          TYPE string,
        "! ServiceDocType
        service_doc_type          TYPE c LENGTH 4,
        "! ServiceDocId
        service_doc_id            TYPE c LENGTH 10,
        "! ServiceDocItemId
        service_doc_item_id       TYPE c LENGTH 6,
        "! BdgtAccount
        bdgt_account              TYPE c LENGTH 10,
        "! TaxCountry
        tax_country               TYPE c LENGTH 3,
        "! GloRef1
        glo_ref_1                 TYPE c LENGTH 50,
        "! Acrlogsys
        acrlogsys                 TYPE c LENGTH 10,
        "! Acrvaldat
        acrvaldat                 TYPE string,
        "! WorkItemId
        work_item_id              TYPE c LENGTH 10,
        "! Businessplace
        businessplace             TYPE c LENGTH 4,
        "! JointVenture
        joint_venture             TYPE c LENGTH 6,
        "! RecoveryInd
        recovery_ind              TYPE c LENGTH 2,
        "! EquityGroup
        equity_group              TYPE c LENGTH 3,
      END OF tys_accountgl,
      "! <p class="shorttext synchronized">List of ACCOUNTGL</p>
      tyt_accountgl TYPE STANDARD TABLE OF tys_accountgl WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">ACCOUNTPAYABLE</p>
      BEGIN OF tys_accountpayable,
        "! <em>Key property</em> DateTime
        date_time          TYPE string,
        "! ItemnoAcc
        itemno_acc         TYPE c LENGTH 10,
        "! VendorNo
        vendor_no          TYPE c LENGTH 10,
        "! GlAccount
        gl_account         TYPE c LENGTH 10,
        "! RefKey1
        ref_key_1          TYPE c LENGTH 12,
        "! RefKey2
        ref_key_2          TYPE c LENGTH 12,
        "! RefKey3
        ref_key_3          TYPE c LENGTH 20,
        "! CompCode
        comp_code          TYPE c LENGTH 4,
        "! BusArea
        bus_area           TYPE c LENGTH 4,
        "! Pmnttrms
        pmnttrms           TYPE c LENGTH 4,
        "! BlineDate
        bline_date         TYPE string,
        "! DsctDays1
        dsct_days_1        TYPE p LENGTH 2 DECIMALS 0,
        "! DsctDays2
        dsct_days_2        TYPE p LENGTH 2 DECIMALS 0,
        "! Netterms
        netterms           TYPE p LENGTH 2 DECIMALS 0,
        "! DsctPct1
        dsct_pct_1         TYPE p LENGTH 3 DECIMALS 3,
        "! DsctPct2
        dsct_pct_2         TYPE p LENGTH 3 DECIMALS 3,
        "! PymtMeth
        pymt_meth          TYPE c LENGTH 1,
        "! Pmtmthsupl
        pmtmthsupl         TYPE c LENGTH 2,
        "! PmntBlock
        pmnt_block         TYPE c LENGTH 1,
        "! ScbankInd
        scbank_ind         TYPE c LENGTH 3,
        "! Supcountry
        supcountry         TYPE c LENGTH 3,
        "! SupcountryIso
        supcountry_iso     TYPE c LENGTH 2,
        "! BllsrvInd
        bllsrv_ind         TYPE c LENGTH 1,
        "! AllocNmbr
        alloc_nmbr         TYPE c LENGTH 18,
        "! ItemText
        item_text          TYPE c LENGTH 50,
        "! PoSubNo
        po_sub_no          TYPE c LENGTH 11,
        "! PoCheckdg
        po_checkdg         TYPE c LENGTH 2,
        "! PoRefNo
        po_ref_no          TYPE c LENGTH 27,
        "! WTaxCode
        wtax_code          TYPE c LENGTH 2,
        "! Businessplace
        businessplace      TYPE c LENGTH 4,
        "! Sectioncode
        sectioncode        TYPE c LENGTH 4,
        "! Instr1
        instr_1            TYPE c LENGTH 2,
        "! Instr2
        instr_2            TYPE c LENGTH 2,
        "! Instr3
        instr_3            TYPE c LENGTH 2,
        "! Instr4
        instr_4            TYPE c LENGTH 2,
        "! Branch
        branch             TYPE c LENGTH 10,
        "! PymtCur
        pymt_cur           TYPE c LENGTH 5,
        "! PymtAmt
        pymt_amt           TYPE p LENGTH 12 DECIMALS 4,
        "! PymtCurIso
        pymt_cur_iso       TYPE c LENGTH 3,
        "! SpGlInd
        sp_gl_ind          TYPE c LENGTH 1,
        "! TaxCode
        tax_code           TYPE c LENGTH 2,
        "! TaxDate
        tax_date           TYPE string,
        "! Taxjurcode
        taxjurcode         TYPE c LENGTH 15,
        "! AltPayee
        alt_payee          TYPE c LENGTH 10,
        "! AltPayeeBank
        alt_payee_bank     TYPE c LENGTH 4,
        "! PartnerBk
        partner_bk         TYPE c LENGTH 4,
        "! BankId
        bank_id            TYPE c LENGTH 5,
        "! PartnerGuid
        partner_guid       TYPE c LENGTH 32,
        "! ProfitCtr
        profit_ctr         TYPE c LENGTH 10,
        "! Fund
        fund               TYPE c LENGTH 10,
        "! GrantNbr
        grant_nbr          TYPE c LENGTH 20,
        "! Measure
        measure            TYPE c LENGTH 24,
        "! Housebankacctid
        housebankacctid    TYPE c LENGTH 5,
        "! BudgetPeriod
        budget_period      TYPE c LENGTH 10,
        "! PpaExInd
        ppa_ex_ind         TYPE abap_bool,
        "! PartBusinessplace
        part_businessplace TYPE c LENGTH 5,
        "! PaymtRef
        paymt_ref          TYPE c LENGTH 30,
        "! PymtAmtLong
        pymt_amt_long      TYPE p LENGTH 16 DECIMALS 8,
        "! BdgtAccount
        bdgt_account       TYPE c LENGTH 10,
        "! GloRef1
        glo_ref_1          TYPE c LENGTH 50,
        "! TaxCountry
        tax_country        TYPE c LENGTH 3,
        "! VatRegNo
        vat_reg_no         TYPE c LENGTH 20,
        "! PaytRsn
        payt_rsn           TYPE c LENGTH 4,
        "! JointVenture
        joint_venture      TYPE c LENGTH 6,
        "! RecoveryInd
        recovery_ind       TYPE c LENGTH 2,
        "! EquityGroup
        equity_group       TYPE c LENGTH 3,
      END OF tys_accountpayable,
      "! <p class="shorttext synchronized">List of ACCOUNTPAYABLE</p>
      tyt_accountpayable TYPE STANDARD TABLE OF tys_accountpayable WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">ACCOUNTRECEIVABLE</p>
      BEGIN OF tys_accountreceivable,
        "! <em>Key property</em> DateTime
        date_time          TYPE string,
        "! ItemnoAcc
        itemno_acc         TYPE c LENGTH 10,
        "! Customer
        customer           TYPE c LENGTH 10,
        "! GlAccount
        gl_account         TYPE c LENGTH 10,
        "! RefKey1
        ref_key_1          TYPE c LENGTH 12,
        "! RefKey2
        ref_key_2          TYPE c LENGTH 12,
        "! RefKey3
        ref_key_3          TYPE c LENGTH 20,
        "! CompCode
        comp_code          TYPE c LENGTH 4,
        "! BusArea
        bus_area           TYPE c LENGTH 4,
        "! Pmnttrms
        pmnttrms           TYPE c LENGTH 4,
        "! BlineDate
        bline_date         TYPE string,
        "! DsctDays1
        dsct_days_1        TYPE p LENGTH 2 DECIMALS 0,
        "! DsctDays2
        dsct_days_2        TYPE p LENGTH 2 DECIMALS 0,
        "! Netterms
        netterms           TYPE p LENGTH 2 DECIMALS 0,
        "! DsctPct1
        dsct_pct_1         TYPE p LENGTH 3 DECIMALS 3,
        "! DsctPct2
        dsct_pct_2         TYPE p LENGTH 3 DECIMALS 3,
        "! PymtMeth
        pymt_meth          TYPE c LENGTH 1,
        "! Pmtmthsupl
        pmtmthsupl         TYPE c LENGTH 2,
        "! PaymtRef
        paymt_ref          TYPE c LENGTH 30,
        "! DunnKey
        dunn_key           TYPE c LENGTH 1,
        "! DunnBlock
        dunn_block         TYPE c LENGTH 1,
        "! PmntBlock
        pmnt_block         TYPE c LENGTH 1,
        "! VatRegNo
        vat_reg_no         TYPE c LENGTH 20,
        "! AllocNmbr
        alloc_nmbr         TYPE c LENGTH 18,
        "! ItemText
        item_text          TYPE c LENGTH 50,
        "! PartnerBk
        partner_bk         TYPE c LENGTH 4,
        "! ScbankInd
        scbank_ind         TYPE c LENGTH 3,
        "! Businessplace
        businessplace      TYPE c LENGTH 4,
        "! Sectioncode
        sectioncode        TYPE c LENGTH 4,
        "! Branch
        branch             TYPE c LENGTH 10,
        "! PymtCur
        pymt_cur           TYPE c LENGTH 5,
        "! PymtCurIso
        pymt_cur_iso       TYPE c LENGTH 3,
        "! PymtAmt
        pymt_amt           TYPE p LENGTH 12 DECIMALS 4,
        "! CCtrArea
        cctr_area          TYPE c LENGTH 4,
        "! BankId
        bank_id            TYPE c LENGTH 5,
        "! Supcountry
        supcountry         TYPE c LENGTH 3,
        "! SupcountryIso
        supcountry_iso     TYPE c LENGTH 2,
        "! TaxCode
        tax_code           TYPE c LENGTH 2,
        "! Taxjurcode
        taxjurcode         TYPE c LENGTH 15,
        "! TaxDate
        tax_date           TYPE string,
        "! SpGlInd
        sp_gl_ind          TYPE c LENGTH 1,
        "! PartnerGuid
        partner_guid       TYPE c LENGTH 32,
        "! AltPayee
        alt_payee          TYPE c LENGTH 10,
        "! AltPayeeBank
        alt_payee_bank     TYPE c LENGTH 4,
        "! DunnArea
        dunn_area          TYPE c LENGTH 2,
        "! CaseGuid
        case_guid          TYPE sysuuid_x16,
        "! ProfitCtr
        profit_ctr         TYPE c LENGTH 10,
        "! Fund
        fund               TYPE c LENGTH 10,
        "! GrantNbr
        grant_nbr          TYPE c LENGTH 20,
        "! Measure
        measure            TYPE c LENGTH 24,
        "! Housebankacctid
        housebankacctid    TYPE c LENGTH 5,
        "! ResDoc
        res_doc            TYPE c LENGTH 10,
        "! ResItem
        res_item           TYPE c LENGTH 3,
        "! FundLong
        fund_long          TYPE c LENGTH 20,
        "! DisputeIfType
        dispute_if_type    TYPE c LENGTH 1,
        "! BudgetPeriod
        budget_period      TYPE c LENGTH 10,
        "! PaysProv
        pays_prov          TYPE c LENGTH 4,
        "! PaysTran
        pays_tran          TYPE c LENGTH 35,
        "! SepaMandateId
        sepa_mandate_id    TYPE c LENGTH 35,
        "! PartBusinessplace
        part_businessplace TYPE c LENGTH 5,
        "! RepCountryEu
        rep_country_eu     TYPE c LENGTH 3,
        "! PymtAmtLong
        pymt_amt_long      TYPE p LENGTH 16 DECIMALS 8,
        "! SalesOrd
        sales_ord          TYPE c LENGTH 10,
        "! SOrdItem
        sord_item          TYPE c LENGTH 6,
        "! BdgtAccount
        bdgt_account       TYPE c LENGTH 10,
        "! GloRef1
        glo_ref_1          TYPE c LENGTH 50,
        "! TaxCountry
        tax_country        TYPE c LENGTH 3,
        "! BillingInd
        billing_ind        TYPE c LENGTH 2,
        "! PaytRsn
        payt_rsn           TYPE c LENGTH 4,
        "! EuTriangDeal
        eu_triang_deal     TYPE abap_bool,
        "! JointVenture
        joint_venture      TYPE c LENGTH 6,
        "! RecoveryInd
        recovery_ind       TYPE c LENGTH 2,
        "! EquityGroup
        equity_group       TYPE c LENGTH 3,
      END OF tys_accountreceivable,
      "! <p class="shorttext synchronized">List of ACCOUNTRECEIVABLE</p>
      tyt_accountreceivable TYPE STANDARD TABLE OF tys_accountreceivable WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">ACCOUNTTAX</p>
      BEGIN OF tys_accounttax,
        "! <em>Key property</em> DateTime
        date_time        TYPE string,
        "! ItemnoAcc
        itemno_acc       TYPE c LENGTH 10,
        "! GlAccount
        gl_account       TYPE c LENGTH 10,
        "! CondKey
        cond_key         TYPE c LENGTH 4,
        "! AcctKey
        acct_key         TYPE c LENGTH 3,
        "! TaxCode
        tax_code         TYPE c LENGTH 2,
        "! TaxRate
        tax_rate         TYPE p LENGTH 16 DECIMALS 3,
        "! TaxDate
        tax_date         TYPE string,
        "! Taxjurcode
        taxjurcode       TYPE c LENGTH 15,
        "! TaxjurcodeDeep
        taxjurcode_deep  TYPE c LENGTH 15,
        "! TaxjurcodeLevel
        taxjurcode_level TYPE c LENGTH 1,
        "! ItemnoTax
        itemno_tax       TYPE c LENGTH 6,
        "! DirectTax
        direct_tax       TYPE abap_bool,
        "! TaxCalcDtFrom
        tax_calc_dt_from TYPE string,
        "! TaxCountry
        tax_country      TYPE c LENGTH 3,
      END OF tys_accounttax,
      "! <p class="shorttext synchronized">List of ACCOUNTTAX</p>
      tyt_accounttax TYPE STANDARD TABLE OF tys_accounttax WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">ACCOUNTWT</p>
      BEGIN OF tys_accountwt,
        "! <em>Key property</em> DateTime
        date_time        TYPE string,
        "! ItemnoAcc
        itemno_acc       TYPE c LENGTH 10,
        "! WtType
        wt_type          TYPE c LENGTH 2,
        "! WtCode
        wt_code          TYPE c LENGTH 2,
        "! BasAmtLc
        bas_amt_lc       TYPE p LENGTH 12 DECIMALS 4,
        "! BasAmtTc
        bas_amt_tc       TYPE p LENGTH 12 DECIMALS 4,
        "! BasAmtL2
        bas_amt_l_2      TYPE p LENGTH 12 DECIMALS 4,
        "! BasAmtL3
        bas_amt_l_3      TYPE p LENGTH 12 DECIMALS 4,
        "! ManAmtLc
        man_amt_lc       TYPE p LENGTH 12 DECIMALS 4,
        "! ManAmtTc
        man_amt_tc       TYPE p LENGTH 12 DECIMALS 4,
        "! ManAmtL2
        man_amt_l_2      TYPE p LENGTH 12 DECIMALS 4,
        "! ManAmtL3
        man_amt_l_3      TYPE p LENGTH 12 DECIMALS 4,
        "! AwhAmtLc
        awh_amt_lc       TYPE p LENGTH 12 DECIMALS 4,
        "! AwhAmtTc
        awh_amt_tc       TYPE p LENGTH 12 DECIMALS 4,
        "! AwhAmtL2
        awh_amt_l_2      TYPE p LENGTH 12 DECIMALS 4,
        "! AwhAmtL3
        awh_amt_l_3      TYPE p LENGTH 12 DECIMALS 4,
        "! BasAmtInd
        bas_amt_ind      TYPE abap_bool,
        "! ManAmtInd
        man_amt_ind      TYPE abap_bool,
        "! BasAmtLcLong
        bas_amt_lc_long  TYPE p LENGTH 16 DECIMALS 8,
        "! BasAmtTcLong
        bas_amt_tc_long  TYPE p LENGTH 16 DECIMALS 8,
        "! BasAmtL2Long
        bas_amt_l_2_long TYPE p LENGTH 16 DECIMALS 8,
        "! BasAmtL3Long
        bas_amt_l_3_long TYPE p LENGTH 16 DECIMALS 8,
        "! ManAmtLcLong
        man_amt_lc_long  TYPE p LENGTH 16 DECIMALS 8,
        "! ManAmtTcLong
        man_amt_tc_long  TYPE p LENGTH 16 DECIMALS 8,
        "! ManAmtL2Long
        man_amt_l_2_long TYPE p LENGTH 16 DECIMALS 8,
        "! ManAmtL3Long
        man_amt_l_3_long TYPE p LENGTH 16 DECIMALS 8,
        "! AwhAmtLcLong
        awh_amt_lc_long  TYPE p LENGTH 16 DECIMALS 8,
        "! AwhAmtTcLong
        awh_amt_tc_long  TYPE p LENGTH 16 DECIMALS 8,
        "! AwhAmtL2Long
        awh_amt_l_2_long TYPE p LENGTH 16 DECIMALS 8,
        "! AwhAmtL3Long
        awh_amt_l_3_long TYPE p LENGTH 16 DECIMALS 8,
      END OF tys_accountwt,
      "! <p class="shorttext synchronized">List of ACCOUNTWT</p>
      tyt_accountwt TYPE STANDARD TABLE OF tys_accountwt WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">CONTRACTHEADER</p>
      BEGIN OF tys_contractheader,
        "! <em>Key property</em> DateTime
        date_time        TYPE string,
        "! DocNo
        doc_no           TYPE c LENGTH 12,
        "! DocTypeCa
        doc_type_ca      TYPE c LENGTH 2,
        "! ResKey
        res_key          TYPE c LENGTH 30,
        "! Fikey
        fikey            TYPE c LENGTH 12,
        "! PaymentFormRef
        payment_form_ref TYPE c LENGTH 30,
      END OF tys_contractheader,
      "! <p class="shorttext synchronized">List of CONTRACTHEADER</p>
      tyt_contractheader TYPE STANDARD TABLE OF tys_contractheader WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">CONTRACTITEM</p>
      BEGIN OF tys_contractitem,
        "! <em>Key property</em> DateTime
        date_time      TYPE string,
        "! ItemnoAcc
        itemno_acc     TYPE c LENGTH 10,
        "! ContAcct
        cont_acct      TYPE c LENGTH 12,
        "! MainTrans
        main_trans     TYPE c LENGTH 4,
        "! SubTrans
        sub_trans      TYPE c LENGTH 4,
        "! FuncArea
        func_area      TYPE c LENGTH 4,
        "! FmArea
        fm_area        TYPE c LENGTH 4,
        "! CmmtItem
        cmmt_item      TYPE c LENGTH 24,
        "! FundsCtr
        funds_ctr      TYPE c LENGTH 16,
        "! Fund
        fund           TYPE c LENGTH 10,
        "! AgreementGuid
        agreement_guid TYPE sysuuid_x16,
        "! FuncAreaLong
        func_area_long TYPE c LENGTH 16,
        "! CmmtItemLong
        cmmt_item_long TYPE c LENGTH 24,
        "! GrantNbr
        grant_nbr      TYPE c LENGTH 20,
        "! Vtref
        vtref          TYPE c LENGTH 20,
        "! VtrefGuid
        vtref_guid     TYPE sysuuid_x16,
        "! ExtObjectId
        ext_object_id  TYPE c LENGTH 34,
        "! BusScenario
        bus_scenario   TYPE c LENGTH 16,
        "! ReferenceNo
        reference_no   TYPE c LENGTH 16,
        "! BudgetPeriod
        budget_period  TYPE c LENGTH 10,
      END OF tys_contractitem,
      "! <p class="shorttext synchronized">List of CONTRACTITEM</p>
      tyt_contractitem TYPE STANDARD TABLE OF tys_contractitem WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">CRITERIA</p>
      BEGIN OF tys_criteria,
        "! <em>Key property</em> DateTime
        date_time            TYPE string,
        "! ItemnoAcc
        itemno_acc           TYPE c LENGTH 10,
        "! Fieldname
        fieldname            TYPE c LENGTH 30,
        "! Character
        character            TYPE c LENGTH 18,
        "! ProdNoLong
        prod_no_long         TYPE c LENGTH 40,
        "! CustCharValueLong
        cust_char_value_long TYPE c LENGTH 40,
      END OF tys_criteria,
      "! <p class="shorttext synchronized">List of CRITERIA</p>
      tyt_criteria TYPE STANDARD TABLE OF tys_criteria WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">CURRENCYAMOUNT</p>
      BEGIN OF tys_currencyamount,
        "! <em>Key property</em> DateTime
        date_time       TYPE string,
        "! ItemnoAcc
        itemno_acc      TYPE c LENGTH 10,
        "! CurrType
        curr_type       TYPE c LENGTH 2,
        "! Currency
        currency        TYPE c LENGTH 5,
        "! CurrencyIso
        currency_iso    TYPE c LENGTH 3,
        "! AmtDoccur
        amt_doccur      TYPE p LENGTH 12 DECIMALS 4,
        "! ExchRate
        exch_rate       TYPE p LENGTH 5 DECIMALS 5,
        "! ExchRateV
        exch_rate_v     TYPE p LENGTH 5 DECIMALS 5,
        "! AmtBase
        amt_base        TYPE p LENGTH 12 DECIMALS 4,
        "! DiscBase
        disc_base       TYPE p LENGTH 12 DECIMALS 4,
        "! DiscAmt
        disc_amt        TYPE p LENGTH 12 DECIMALS 4,
        "! TaxAmt
        tax_amt         TYPE p LENGTH 12 DECIMALS 4,
        "! AmtDoccurLong
        amt_doccur_long TYPE p LENGTH 16 DECIMALS 8,
        "! AmtBaseLong
        amt_base_long   TYPE p LENGTH 16 DECIMALS 8,
        "! DiscBaseLong
        disc_base_long  TYPE p LENGTH 16 DECIMALS 8,
        "! DiscAmtLong
        disc_amt_long   TYPE p LENGTH 16 DECIMALS 8,
        "! TaxAmtLong
        tax_amt_long    TYPE p LENGTH 16 DECIMALS 8,
      END OF tys_currencyamount,
      "! <p class="shorttext synchronized">List of CURRENCYAMOUNT</p>
      tyt_currencyamount TYPE STANDARD TABLE OF tys_currencyamount WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">CUSTOMERCPD</p>
      BEGIN OF tys_customercpd,
        "! <em>Key property</em> DateTime
        date_time     TYPE string,
        "! Name
        name          TYPE c LENGTH 35,
        "! Name2
        name_2        TYPE c LENGTH 35,
        "! Name3
        name_3        TYPE c LENGTH 35,
        "! Name4
        name_4        TYPE c LENGTH 35,
        "! PostlCode
        postl_code    TYPE c LENGTH 10,
        "! City
        city          TYPE c LENGTH 35,
        "! Country
        country       TYPE c LENGTH 3,
        "! CountryIso
        country_iso   TYPE c LENGTH 2,
        "! Street
        street        TYPE c LENGTH 35,
        "! PoBox
        po_box        TYPE c LENGTH 10,
        "! PobxPcd
        pobx_pcd      TYPE c LENGTH 10,
        "! PobkCurac
        pobk_curac    TYPE c LENGTH 16,
        "! BankAcct
        bank_acct     TYPE c LENGTH 18,
        "! BankNo
        bank_no       TYPE c LENGTH 15,
        "! BankCtry
        bank_ctry     TYPE c LENGTH 3,
        "! BankCtryIso
        bank_ctry_iso TYPE c LENGTH 2,
        "! TaxNo1
        tax_no_1      TYPE c LENGTH 16,
        "! TaxNo2
        tax_no_2      TYPE c LENGTH 11,
        "! Tax
        tax           TYPE abap_bool,
        "! EqualTax
        equal_tax     TYPE c LENGTH 1,
        "! Region
        region        TYPE c LENGTH 3,
        "! CtrlKey
        ctrl_key      TYPE c LENGTH 2,
        "! InstrKey
        instr_key     TYPE c LENGTH 2,
        "! DmeInd
        dme_ind       TYPE c LENGTH 1,
        "! LanguIso
        langu_iso     TYPE c LENGTH 2,
        "! Iban
        iban          TYPE c LENGTH 34,
        "! SwiftCode
        swift_code    TYPE c LENGTH 11,
        "! TaxNo3
        tax_no_3      TYPE c LENGTH 18,
        "! TaxNo4
        tax_no_4      TYPE c LENGTH 18,
        "! Title
        title         TYPE c LENGTH 15,
        "! TaxNo5
        tax_no_5      TYPE c LENGTH 60,
        "! GloRe1Ot
        glo_re_1_ot   TYPE c LENGTH 140,
        "! SoleProp
        sole_prop     TYPE c LENGTH 1,
        "! TaxNoTy
        tax_no_ty     TYPE c LENGTH 2,
      END OF tys_customercpd,
      "! <p class="shorttext synchronized">List of CUSTOMERCPD</p>
      tyt_customercpd TYPE STANDARD TABLE OF tys_customercpd WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">DOCUMENTHEADER</p>
      BEGIN OF tys_documentheader,
        "! <em>Key property</em> DateTime
        date_time            TYPE string,
        "! ObjType
        obj_type             TYPE c LENGTH 5,
        "! ObjKey
        obj_key              TYPE c LENGTH 20,
        "! ObjSys
        obj_sys              TYPE c LENGTH 10,
        "! BusAct
        bus_act              TYPE c LENGTH 4,
        "! Username
        username             TYPE c LENGTH 12,
        "! HeaderTxt
        header_txt           TYPE c LENGTH 25,
        "! CompCode
        comp_code            TYPE c LENGTH 4,
        "! DocDate
        doc_date             TYPE string,
        "! PstngDate
        pstng_date           TYPE string,
        "! TransDate
        trans_date           TYPE string,
        "! FiscYear
        fisc_year            TYPE c LENGTH 4,
        "! FisPeriod
        fis_period           TYPE c LENGTH 2,
        "! DocType
        doc_type             TYPE c LENGTH 2,
        "! RefDocNo
        ref_doc_no           TYPE c LENGTH 16,
        "! AcDocNo
        ac_doc_no            TYPE c LENGTH 10,
        "! ObjKeyR
        obj_key_r            TYPE c LENGTH 20,
        "! ReasonRev
        reason_rev           TYPE c LENGTH 2,
        "! CompoAcc
        compo_acc            TYPE c LENGTH 4,
        "! RefDocNoLong
        ref_doc_no_long      TYPE c LENGTH 35,
        "! AccPrinciple
        acc_principle        TYPE c LENGTH 4,
        "! NegPostng
        neg_postng           TYPE abap_bool,
        "! ObjKeyInv
        obj_key_inv          TYPE c LENGTH 20,
        "! BillCategory
        bill_category        TYPE c LENGTH 1,
        "! Vatdate
        vatdate              TYPE string,
        "! InvoiceRecDate
        invoice_rec_date     TYPE string,
        "! EcsEnv
        ecs_env              TYPE c LENGTH 10,
        "! PartialRev
        partial_rev          TYPE abap_bool,
        "! DocStatus
        doc_status           TYPE c LENGTH 1,
        "! TaxCalcDate
        tax_calc_date        TYPE string,
        "! GloRef1Hd
        glo_ref_1_hd         TYPE c LENGTH 80,
        "! GloDat1Hd
        glo_dat_1_hd         TYPE string,
        "! GloRef2Hd
        glo_ref_2_hd         TYPE c LENGTH 25,
        "! GloDat2Hd
        glo_dat_2_hd         TYPE string,
        "! GloRef3Hd
        glo_ref_3_hd         TYPE c LENGTH 25,
        "! GloDat3Hd
        glo_dat_3_hd         TYPE string,
        "! GloRef4Hd
        glo_ref_4_hd         TYPE c LENGTH 50,
        "! GloDat4Hd
        glo_dat_4_hd         TYPE string,
        "! GloRef5Hd
        glo_ref_5_hd         TYPE c LENGTH 50,
        "! GloDat5Hd
        glo_dat_5_hd         TYPE string,
        "! GloBp1Hd
        glo_bp_1_hd          TYPE c LENGTH 10,
        "! GloBp2Hd
        glo_bp_2_hd          TYPE c LENGTH 10,
        "! EvPostngCtrl
        ev_postng_ctrl       TYPE c LENGTH 1,
        "! LedgerGroup
        ledger_group         TYPE c LENGTH 4,
        "! PlannedRevDate
        planned_rev_date     TYPE string,
        "! BusTransactionType
        bus_transaction_type TYPE c LENGTH 4,
        "! Closingstep
        closingstep          TYPE c LENGTH 3,
        "! Fulfilldate
        fulfilldate          TYPE string,
      END OF tys_documentheader,
      "! <p class="shorttext synchronized">List of DOCUMENTHEADER</p>
      tyt_documentheader TYPE STANDARD TABLE OF tys_documentheader WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">EXTENSION1</p>
      BEGIN OF tys_extension_1,
        "! <em>Key property</em> DateTime
        date_time TYPE string,
        "! Field1
        field_1   TYPE c LENGTH 250,
        "! Field2
        field_2   TYPE c LENGTH 250,
        "! Field3
        field_3   TYPE c LENGTH 250,
        "! Field4
        field_4   TYPE c LENGTH 250,
      END OF tys_extension_1,
      "! <p class="shorttext synchronized">List of EXTENSION1</p>
      tyt_extension_1 TYPE STANDARD TABLE OF tys_extension_1 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">EXTENSION2</p>
      BEGIN OF tys_extension_2,
        "! <em>Key property</em> DateTime
        date_time   TYPE string,
        "! Structure
        structure   TYPE c LENGTH 30,
        "! Valuepart1
        valuepart_1 TYPE c LENGTH 240,
        "! Valuepart2
        valuepart_2 TYPE c LENGTH 240,
        "! Valuepart3
        valuepart_3 TYPE c LENGTH 240,
        "! Valuepart4
        valuepart_4 TYPE c LENGTH 240,
      END OF tys_extension_2,
      "! <p class="shorttext synchronized">List of EXTENSION2</p>
      tyt_extension_2 TYPE STANDARD TABLE OF tys_extension_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Notification</p>
      BEGIN OF tys_notification,
        "! <em>Key property</em> ID
        id                  TYPE c LENGTH 32,
        "! collection
        collection          TYPE c LENGTH 40,
        "! title
        title               TYPE string,
        "! updated
        updated             TYPE timestamp,
        "! changeType
        change_type         TYPE c LENGTH 30,
        "! entriesOfInterest
        entries_of_interest TYPE int4,
        "! recipient
        recipient           TYPE c LENGTH 112,
      END OF tys_notification,
      "! <p class="shorttext synchronized">List of Notification</p>
      tyt_notification TYPE STANDARD TABLE OF tys_notification WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">PAYMENTCARD</p>
      BEGIN OF tys_paymentcard,
        "! <em>Key property</em> DateTime
        date_time        TYPE string,
        "! ItemnoAcc
        itemno_acc       TYPE c LENGTH 10,
        "! CcGlaccount
        cc_glaccount     TYPE c LENGTH 10,
        "! CcType
        cc_type          TYPE c LENGTH 4,
        "! CcNumber
        cc_number        TYPE c LENGTH 25,
        "! CcSeqNo
        cc_seq_no        TYPE c LENGTH 10,
        "! CcValidF
        cc_valid_f       TYPE string,
        "! CcValidT
        cc_valid_t       TYPE string,
        "! CcName
        cc_name          TYPE c LENGTH 40,
        "! Dataorigin
        dataorigin       TYPE c LENGTH 1,
        "! Authamount
        authamount       TYPE p LENGTH 12 DECIMALS 4,
        "! Currency
        currency         TYPE c LENGTH 5,
        "! CurrencyIso
        currency_iso     TYPE c LENGTH 3,
        "! CcAutthNo
        cc_autth_no      TYPE c LENGTH 10,
        "! AuthRefno
        auth_refno       TYPE c LENGTH 15,
        "! AuthDate
        auth_date        TYPE string,
        "! AuthTime
        auth_time        TYPE timn,
        "! Merchidcl
        merchidcl        TYPE c LENGTH 15,
        "! PointOfReceipt
        point_of_receipt TYPE c LENGTH 10,
        "! Terminal
        terminal         TYPE c LENGTH 10,
        "! Cctyp
        cctyp            TYPE c LENGTH 2,
        "! AuthamountLong
        authamount_long  TYPE p LENGTH 16 DECIMALS 8,
      END OF tys_paymentcard,
      "! <p class="shorttext synchronized">List of PAYMENTCARD</p>
      tyt_paymentcard TYPE STANDARD TABLE OF tys_paymentcard WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">REALESTATE</p>
      BEGIN OF tys_realestate,
        "! <em>Key property</em> DateTime
        date_time       TYPE string,
        "! ItemnoAcc
        itemno_acc      TYPE c LENGTH 10,
        "! BusinessEntity
        business_entity TYPE c LENGTH 8,
        "! Building
        building        TYPE c LENGTH 8,
        "! Property
        property        TYPE c LENGTH 8,
        "! RentalObject
        rental_object   TYPE c LENGTH 8,
        "! ServChargeKey
        serv_charge_key TYPE c LENGTH 4,
        "! SettlementUnit
        settlement_unit TYPE c LENGTH 5,
        "! ContractNo
        contract_no     TYPE c LENGTH 13,
        "! FlowType
        flow_type       TYPE c LENGTH 4,
        "! CorrItem
        corr_item       TYPE c LENGTH 10,
        "! RefDate
        ref_date        TYPE string,
        "! OptionRate
        option_rate     TYPE p LENGTH 5 DECIMALS 6,
      END OF tys_realestate,
      "! <p class="shorttext synchronized">List of REALESTATE</p>
      tyt_realestate TYPE STANDARD TABLE OF tys_realestate WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">RETURN</p>
      BEGIN OF tys_return,
        "! <em>Key property</em> DateTime
        date_time   TYPE string,
        "! Type
        type        TYPE c LENGTH 1,
        "! Id
        id          TYPE c LENGTH 20,
        "! Number
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
      "! <p class="shorttext synchronized">List of RETURN</p>
      tyt_return TYPE STANDARD TABLE OF tys_return WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Subscription</p>
      BEGIN OF tys_subscription,
        "! <em>Key property</em> ID
        id                    TYPE c LENGTH 32,
        "! user
        user                  TYPE c LENGTH 12,
        "! updated
        updated               TYPE timestamp,
        "! title
        title                 TYPE c LENGTH 255,
        "! deliveryAddress
        delivery_address      TYPE string,
        "! persistNotifications
        persist_notifications TYPE abap_bool,
        "! collection
        collection            TYPE c LENGTH 40,
        "! filter
        filter                TYPE string,
        "! select
        select                TYPE c LENGTH 255,
        "! changeType
        change_type           TYPE c LENGTH 30,
      END OF tys_subscription,
      "! <p class="shorttext synchronized">List of Subscription</p>
      tyt_subscription TYPE STANDARD TABLE OF tys_subscription WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">VALUEFIELD</p>
      BEGIN OF tys_valuefield,
        "! <em>Key property</em> DateTime
        date_time       TYPE string,
        "! ItemnoAcc
        itemno_acc      TYPE c LENGTH 10,
        "! Fieldname
        fieldname       TYPE c LENGTH 30,
        "! CurrType
        curr_type       TYPE c LENGTH 2,
        "! Currency
        currency        TYPE c LENGTH 5,
        "! CurrencyIso
        currency_iso    TYPE c LENGTH 3,
        "! AmtValcom
        amt_valcom      TYPE p LENGTH 12 DECIMALS 4,
        "! BaseUom
        base_uom        TYPE c LENGTH 3,
        "! BaseUomIso
        base_uom_iso    TYPE c LENGTH 3,
        "! QuaValcom
        qua_valcom      TYPE p LENGTH 8 DECIMALS 3,
        "! AmtValcomLong
        amt_valcom_long TYPE p LENGTH 16 DECIMALS 8,
      END OF tys_valuefield,
      "! <p class="shorttext synchronized">List of VALUEFIELD</p>
      tyt_valuefield TYPE STANDARD TABLE OF tys_valuefield WITH DEFAULT KEY.

      TYPES:
      "! <p class="shorttext synchronized">JEPost</p>
      BEGIN OF tys_jepost,
        "! <em>Key property</em> DateTime
        date_time TYPE string,
        "! OBJ_TYPE
        obj_type  TYPE string,
        "! OBJ_KEY
        obj_key   TYPE string,
        "! OBJ_SYS
        obj_sys   TYPE string,
        JEHeaderNav         TYPE TABLE OF tys_documentheader WITH DEFAULT KEY,
        JECustomerCPDNav    TYPE TABLE OF tys_customercpd WITH DEFAULT KEY,
        JEContractHeaderNav TYPE TABLE OF tys_contractheader WITH DEFAULT KEY,
        JEAccountAPNAV      TYPE TABLE OF tys_accountpayable WITH DEFAULT KEY,
        JEAccountARNav      TYPE TABLE OF tys_accountreceivable WITH DEFAULT KEY,
        JEAccountGLNav      TYPE TABLE OF tys_accountgl WITH DEFAULT KEY,
        JEAccountTaxNav     TYPE TABLE OF tys_accounttax WITH DEFAULT KEY,
        JEAccountWTNav      TYPE TABLE OF tys_accountwt WITH DEFAULT KEY,
        JEContractItemNav   TYPE TABLE OF tys_contractitem WITH DEFAULT KEY,
        JECriteriaNav       TYPE TABLE OF tys_criteria WITH DEFAULT KEY,
        JECurrencyAmountNav TYPE TABLE OF tys_currencyamount WITH DEFAULT KEY,
        JEExtension1Nav     TYPE TABLE OF tys_extension_1 WITH DEFAULT KEY,
        JEExtension2Nav     TYPE TABLE OF tys_extension_2 WITH DEFAULT KEY,
        JEPaymentCardNav    TYPE TABLE OF tys_paymentcard WITH DEFAULT KEY,
        JERealEstateNav     TYPE TABLE OF tys_realestate WITH DEFAULT KEY,
        JEReturnNav         TYPE TABLE OF tys_return WITH DEFAULT KEY,
        JEValueFieldNav     TYPE TABLE OF tys_valuefield WITH DEFAULT KEY,

      END OF tys_jepost,
      "! <p class="shorttext synchronized">List of JEPost</p>
      tyt_jepost TYPE STANDARD TABLE OF tys_jepost WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! ACCOUNTGLSet
        "! <br/> Collection of type 'ACCOUNTGL'
        accountglset            TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'ACCOUNTGLSET',
        "! ACCOUNTPAYABLESet
        "! <br/> Collection of type 'ACCOUNTPAYABLE'
        accountpayableset       TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'ACCOUNTPAYABLESET',
        "! ACCOUNTRECEIVABLESet
        "! <br/> Collection of type 'ACCOUNTRECEIVABLE'
        accountreceivableset    TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'ACCOUNTRECEIVABLESET',
        "! ACCOUNTTAXSet
        "! <br/> Collection of type 'ACCOUNTTAX'
        accounttaxset           TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'ACCOUNTTAXSET',
        "! ACCOUNTWTSet
        "! <br/> Collection of type 'ACCOUNTWT'
        accountwtset            TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'ACCOUNTWTSET',
        "! CONTRACTHEADERSet
        "! <br/> Collection of type 'CONTRACTHEADER'
        contractheaderset       TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'CONTRACTHEADERSET',
        "! CONTRACTITEMSet
        "! <br/> Collection of type 'CONTRACTITEM'
        contractitemset         TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'CONTRACTITEMSET',
        "! CRITERIASet
        "! <br/> Collection of type 'CRITERIA'
        criteriaset             TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'CRITERIASET',
        "! CURRENCYAMOUNTSet
        "! <br/> Collection of type 'CURRENCYAMOUNT'
        currencyamountset       TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'CURRENCYAMOUNTSET',
        "! CUSTOMERCPDSet
        "! <br/> Collection of type 'CUSTOMERCPD'
        customercpdset          TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'CUSTOMERCPDSET',
        "! DOCUMENTHEADERSet
        "! <br/> Collection of type 'DOCUMENTHEADER'
        documentheaderset       TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'DOCUMENTHEADERSET',
        "! EXTENSION1Set
        "! <br/> Collection of type 'EXTENSION1'
        extension_1_set         TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'EXTENSION_1_SET',
        "! EXTENSION2Set
        "! <br/> Collection of type 'EXTENSION2'
        extension_2_set         TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'EXTENSION_2_SET',
        "! JEPostSet
        "! <br/> Collection of type 'JEPost'
        jepost_set              TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'JEPOST_SET',
        "! NotificationCollection
        "! <br/> Collection of type 'Notification'
        notification_collection TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'NOTIFICATION_COLLECTION',
        "! PAYMENTCARDSet
        "! <br/> Collection of type 'PAYMENTCARD'
        paymentcardset          TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'PAYMENTCARDSET',
        "! REALESTATESet
        "! <br/> Collection of type 'REALESTATE'
        realestateset           TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'REALESTATESET',
        "! RETURNSet
        "! <br/> Collection of type 'RETURN'
        returnset               TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'RETURNSET',
        "! SubscriptionCollection
        "! <br/> Collection of type 'Subscription'
        subscription_collection TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SUBSCRIPTION_COLLECTION',
        "! VALUEFIELDSet
        "! <br/> Collection of type 'VALUEFIELD'
        valuefieldset           TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'VALUEFIELDSET',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for ACCOUNTGL</p>
        "! See also structure type {@link ..tys_accountgl}
        BEGIN OF accountgl,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF accountgl,
        "! <p class="shorttext synchronized">Internal names for ACCOUNTPAYABLE</p>
        "! See also structure type {@link ..tys_accountpayable}
        BEGIN OF accountpayable,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF accountpayable,
        "! <p class="shorttext synchronized">Internal names for ACCOUNTRECEIVABLE</p>
        "! See also structure type {@link ..tys_accountreceivable}
        BEGIN OF accountreceivable,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF accountreceivable,
        "! <p class="shorttext synchronized">Internal names for ACCOUNTTAX</p>
        "! See also structure type {@link ..tys_accounttax}
        BEGIN OF accounttax,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF accounttax,
        "! <p class="shorttext synchronized">Internal names for ACCOUNTWT</p>
        "! See also structure type {@link ..tys_accountwt}
        BEGIN OF accountwt,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF accountwt,
        "! <p class="shorttext synchronized">Internal names for CONTRACTHEADER</p>
        "! See also structure type {@link ..tys_contractheader}
        BEGIN OF contractheader,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF contractheader,
        "! <p class="shorttext synchronized">Internal names for CONTRACTITEM</p>
        "! See also structure type {@link ..tys_contractitem}
        BEGIN OF contractitem,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF contractitem,
        "! <p class="shorttext synchronized">Internal names for CRITERIA</p>
        "! See also structure type {@link ..tys_criteria}
        BEGIN OF criteria,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF criteria,
        "! <p class="shorttext synchronized">Internal names for CURRENCYAMOUNT</p>
        "! See also structure type {@link ..tys_currencyamount}
        BEGIN OF currencyamount,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF currencyamount,
        "! <p class="shorttext synchronized">Internal names for CUSTOMERCPD</p>
        "! See also structure type {@link ..tys_customercpd}
        BEGIN OF customercpd,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF customercpd,
        "! <p class="shorttext synchronized">Internal names for DOCUMENTHEADER</p>
        "! See also structure type {@link ..tys_documentheader}
        BEGIN OF documentheader,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF documentheader,
        "! <p class="shorttext synchronized">Internal names for EXTENSION1</p>
        "! See also structure type {@link ..tys_extension_1}
        BEGIN OF extension_1,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF extension_1,
        "! <p class="shorttext synchronized">Internal names for EXTENSION2</p>
        "! See also structure type {@link ..tys_extension_2}
        BEGIN OF extension_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF extension_2,
        "! <p class="shorttext synchronized">Internal names for JEPost</p>
        "! See also structure type {@link ..tys_jepost}
        BEGIN OF jepost,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! JEAccountAPNav
            jeaccountapnav       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'JEACCOUNTAPNAV',
            "! JEAccountARNav
            jeaccount_arnav       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'JEACCOUNTARNAV',
            "! JEAccountGLNav
            jeaccountglnav       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'JEACCOUNTGLNAV',
            "! JEAccountTaxNav
            jeaccounttaxnav     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'JEACCOUNTTAXNAV',
            "! JEAccountWTNav
            jeaccountwtnav       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'JEACCOUNTWTNAV',
            "! JEContractHeaderNav
            jecontractheadernav TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'JECONTRACTHEADERNAV',
            "! JEContractItemNav
            jecontractitemnav   TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'JECONTRACTITEMNAV',
            "! JECriteriaNav
            jecriterianav        TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'JECRITERIANAV',
            "! JECurrencyAmountNav
            jecurrencyamountnav TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'JECURRENCYAMOUNTNAV',
            "! JECustomerCPDNav
            jecustomercpdnav     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'JECUSTOMERCPDNAV',
            "! JEExtension1Nav
            jeextension1nav     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'JEEXTENSION1NAV',
            "! JEExtension2Nav
            jeextension2nav     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'JEEXTENSION2NAV',
            "! JEHeaderNav
            jeheadernav          TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'JEHEADERNAV',
            "! JEPaymentCardNav
            jepaymentcardnav    TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'JEPAYMENTCARDNAV',
            "! JERealEstateNav
            jerealestatenav     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'JEREALESTATENAV',
            "! JEReturnNav
            jereturnnav          TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'JERETURNNAV',
            "! JEValueFieldNav
            jevaluefieldnav     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'JEVALUEFIELDNAV',
          END OF navigation,
        END OF jepost,
        "! <p class="shorttext synchronized">Internal names for Notification</p>
        "! See also structure type {@link ..tys_notification}
        BEGIN OF notification,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF notification,
        "! <p class="shorttext synchronized">Internal names for PAYMENTCARD</p>
        "! See also structure type {@link ..tys_paymentcard}
        BEGIN OF paymentcard,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF paymentcard,
        "! <p class="shorttext synchronized">Internal names for REALESTATE</p>
        "! See also structure type {@link ..tys_realestate}
        BEGIN OF realestate,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF realestate,
        "! <p class="shorttext synchronized">Internal names for RETURN</p>
        "! See also structure type {@link ..tys_return}
        BEGIN OF return,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF return,
        "! <p class="shorttext synchronized">Internal names for Subscription</p>
        "! See also structure type {@link ..tys_subscription}
        BEGIN OF subscription,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF subscription,
        "! <p class="shorttext synchronized">Internal names for VALUEFIELD</p>
        "! See also structure type {@link ..tys_valuefield}
        BEGIN OF valuefield,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF valuefield,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define ACCOUNTGL</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_accountgl RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define ACCOUNTPAYABLE</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_accountpayable RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define ACCOUNTRECEIVABLE</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_accountreceivable RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define ACCOUNTTAX</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_accounttax RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define ACCOUNTWT</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_accountwt RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define CONTRACTHEADER</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_contractheader RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define CONTRACTITEM</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_contractitem RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define CRITERIA</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_criteria RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define CURRENCYAMOUNT</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_currencyamount RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define CUSTOMERCPD</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_customercpd RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define DOCUMENTHEADER</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_documentheader RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define EXTENSION1</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_extension_1 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define EXTENSION2</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_extension_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define JEPost</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_jepost RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Notification</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_notification RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define PAYMENTCARD</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_paymentcard RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define REALESTATE</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_realestate RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define RETURN</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_return RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Subscription</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_subscription RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define VALUEFIELD</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_valuefield RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSCM_ZFI_ACC_JE_POST IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'ZFI_ACC_JE_POST_SRV' ) ##NO_TEXT.

    def_accountgl( ).
    def_accountpayable( ).
    def_accountreceivable( ).
    def_accounttax( ).
    def_accountwt( ).
    def_contractheader( ).
    def_contractitem( ).
    def_criteria( ).
    def_currencyamount( ).
    def_customercpd( ).
    def_documentheader( ).
    def_extension_1( ).
    def_extension_2( ).
    def_jepost( ).
    def_notification( ).
    def_paymentcard( ).
    def_realestate( ).
    def_return( ).
    def_subscription( ).
    def_valuefield( ).

  ENDMETHOD.


  METHOD def_accountgl.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'ACCOUNTGL'
                                    is_structure              = VALUE tys_accountgl( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'ACCOUNTGL' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'ACCOUNTGLSET' ).
    lo_entity_set->set_edm_name( 'ACCOUNTGLSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEMNO_ACC' ).
    lo_primitive_property->set_edm_name( 'ItemnoAcc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GL_ACCOUNT' ).
    lo_primitive_property->set_edm_name( 'GlAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_TEXT' ).
    lo_primitive_property->set_edm_name( 'ItemText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STAT_CON' ).
    lo_primitive_property->set_edm_name( 'StatCon' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOG_PROC' ).
    lo_primitive_property->set_edm_name( 'LogProc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AC_DOC_NO' ).
    lo_primitive_property->set_edm_name( 'AcDocNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_KEY_1' ).
    lo_primitive_property->set_edm_name( 'RefKey1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_KEY_2' ).
    lo_primitive_property->set_edm_name( 'RefKey2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_KEY_3' ).
    lo_primitive_property->set_edm_name( 'RefKey3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCT_KEY' ).
    lo_primitive_property->set_edm_name( 'AcctKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCT_TYPE' ).
    lo_primitive_property->set_edm_name( 'AcctType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOC_TYPE' ).
    lo_primitive_property->set_edm_name( 'DocType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMP_CODE' ).
    lo_primitive_property->set_edm_name( 'CompCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUS_AREA' ).
    lo_primitive_property->set_edm_name( 'BusArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNC_AREA' ).
    lo_primitive_property->set_edm_name( 'FuncArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANT' ).
    lo_primitive_property->set_edm_name( 'Plant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIS_PERIOD' ).
    lo_primitive_property->set_edm_name( 'FisPeriod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISC_YEAR' ).
    lo_primitive_property->set_edm_name( 'FiscYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSTNG_DATE' ).
    lo_primitive_property->set_edm_name( 'PstngDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALUE_DATE' ).
    lo_primitive_property->set_edm_name( 'ValueDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FM_AREA' ).
    lo_primitive_property->set_edm_name( 'FmArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER' ).
    lo_primitive_property->set_edm_name( 'Customer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CSHDIS_IND' ).
    lo_primitive_property->set_edm_name( 'CshdisInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VENDOR_NO' ).
    lo_primitive_property->set_edm_name( 'VendorNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALLOC_NMBR' ).
    lo_primitive_property->set_edm_name( 'AllocNmbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXJURCODE' ).
    lo_primitive_property->set_edm_name( 'Taxjurcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_OBJECT_ID' ).
    lo_primitive_property->set_edm_name( 'ExtObjectId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 34 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUS_SCENARIO' ).
    lo_primitive_property->set_edm_name( 'BusScenario' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COSTOBJECT' ).
    lo_primitive_property->set_edm_name( 'Costobject' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COSTCENTER' ).
    lo_primitive_property->set_edm_name( 'Costcenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACTTYPE' ).
    lo_primitive_property->set_edm_name( 'Acttype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROFIT_CTR' ).
    lo_primitive_property->set_edm_name( 'ProfitCtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PART_PRCTR' ).
    lo_primitive_property->set_edm_name( 'PartPrctr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETWORK' ).
    lo_primitive_property->set_edm_name( 'Network' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WBS_ELEMENT' ).
    lo_primitive_property->set_edm_name( 'WbsElement' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDERID' ).
    lo_primitive_property->set_edm_name( 'Orderid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_ITNO' ).
    lo_primitive_property->set_edm_name( 'OrderItno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROUTING_NO' ).
    lo_primitive_property->set_edm_name( 'RoutingNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACTIVITY' ).
    lo_primitive_property->set_edm_name( 'Activity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COND_TYPE' ).
    lo_primitive_property->set_edm_name( 'CondType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COND_COUNT' ).
    lo_primitive_property->set_edm_name( 'CondCount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COND_ST_NO' ).
    lo_primitive_property->set_edm_name( 'CondStNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUND' ).
    lo_primitive_property->set_edm_name( 'Fund' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNDS_CTR' ).
    lo_primitive_property->set_edm_name( 'FundsCtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMMT_ITEM' ).
    lo_primitive_property->set_edm_name( 'CmmtItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CO_BUSPROC' ).
    lo_primitive_property->set_edm_name( 'CoBusproc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ASSET_NO' ).
    lo_primitive_property->set_edm_name( 'AssetNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUB_NUMBER' ).
    lo_primitive_property->set_edm_name( 'SubNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BILL_TYPE' ).
    lo_primitive_property->set_edm_name( 'BillType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORD' ).
    lo_primitive_property->set_edm_name( 'SalesOrd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SORD_ITEM' ).
    lo_primitive_property->set_edm_name( 'SOrdItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISTR_CHAN' ).
    lo_primitive_property->set_edm_name( 'DistrChan' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DIVISION' ).
    lo_primitive_property->set_edm_name( 'Division' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALESORG' ).
    lo_primitive_property->set_edm_name( 'Salesorg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_GRP' ).
    lo_primitive_property->set_edm_name( 'SalesGrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_OFF' ).
    lo_primitive_property->set_edm_name( 'SalesOff' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SOLD_TO' ).
    lo_primitive_property->set_edm_name( 'SoldTo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DE_CRE_IND' ).
    lo_primitive_property->set_edm_name( 'DeCreInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PEL_PRCTR' ).
    lo_primitive_property->set_edm_name( 'PElPrctr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XMFRW' ).
    lo_primitive_property->set_edm_name( 'Xmfrw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY' ).
    lo_primitive_property->set_edm_name( 'Quantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BASE_UOM' ).
    lo_primitive_property->set_edm_name( 'BaseUom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BASE_UOM_ISO' ).
    lo_primitive_property->set_edm_name( 'BaseUomIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INV_QTY' ).
    lo_primitive_property->set_edm_name( 'InvQty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INV_QTY_SU' ).
    lo_primitive_property->set_edm_name( 'InvQtySu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_UNIT' ).
    lo_primitive_property->set_edm_name( 'SalesUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_UNIT_ISO' ).
    lo_primitive_property->set_edm_name( 'SalesUnitIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_PR_QNT' ).
    lo_primitive_property->set_edm_name( 'PoPrQnt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_PR_UOM' ).
    lo_primitive_property->set_edm_name( 'PoPrUom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_PR_UOM_ISO' ).
    lo_primitive_property->set_edm_name( 'PoPrUomIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENTRY_QNT' ).
    lo_primitive_property->set_edm_name( 'EntryQnt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENTRY_UOM' ).
    lo_primitive_property->set_edm_name( 'EntryUom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENTRY_UOM_ISO' ).
    lo_primitive_property->set_edm_name( 'EntryUomIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLUME' ).
    lo_primitive_property->set_edm_name( 'Volume' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLUMEUNIT' ).
    lo_primitive_property->set_edm_name( 'Volumeunit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLUMEUNIT_ISO' ).
    lo_primitive_property->set_edm_name( 'VolumeunitIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GROSS_WT' ).
    lo_primitive_property->set_edm_name( 'GrossWt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_WEIGHT' ).
    lo_primitive_property->set_edm_name( 'NetWeight' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNIT_OF_WT' ).
    lo_primitive_property->set_edm_name( 'UnitOfWt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNIT_OF_WT_ISO' ).
    lo_primitive_property->set_edm_name( 'UnitOfWtIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_CAT' ).
    lo_primitive_property->set_edm_name( 'ItemCat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL' ).
    lo_primitive_property->set_edm_name( 'Material' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATL_TYPE' ).
    lo_primitive_property->set_edm_name( 'MatlType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVT_IND' ).
    lo_primitive_property->set_edm_name( 'MvtInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REVAL_IND' ).
    lo_primitive_property->set_edm_name( 'RevalInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORIG_GROUP' ).
    lo_primitive_property->set_edm_name( 'OrigGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORIG_MAT' ).
    lo_primitive_property->set_edm_name( 'OrigMat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERIAL_NO' ).
    lo_primitive_property->set_edm_name( 'SerialNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PART_ACCT' ).
    lo_primitive_property->set_edm_name( 'PartAcct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TR_PART_BA' ).
    lo_primitive_property->set_edm_name( 'TrPartBa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRADE_ID' ).
    lo_primitive_property->set_edm_name( 'TradeId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAL_AREA' ).
    lo_primitive_property->set_edm_name( 'ValArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAL_TYPE' ).
    lo_primitive_property->set_edm_name( 'ValType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ASVAL_DATE' ).
    lo_primitive_property->set_edm_name( 'AsvalDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_NUMBER' ).
    lo_primitive_property->set_edm_name( 'PoNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_ITEM' ).
    lo_primitive_property->set_edm_name( 'PoItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITM_NUMBER' ).
    lo_primitive_property->set_edm_name( 'ItmNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COND_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'CondCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNC_AREA_LONG' ).
    lo_primitive_property->set_edm_name( 'FuncAreaLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMMT_ITEM_LONG' ).
    lo_primitive_property->set_edm_name( 'CmmtItemLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRANT_NBR' ).
    lo_primitive_property->set_edm_name( 'GrantNbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CS_TRANS_T' ).
    lo_primitive_property->set_edm_name( 'CsTransT' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEASURE' ).
    lo_primitive_property->set_edm_name( 'Measure' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SEGMENT' ).
    lo_primitive_property->set_edm_name( 'Segment' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_SEGMENT' ).
    lo_primitive_property->set_edm_name( 'PartnerSegment' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RES_DOC' ).
    lo_primitive_property->set_edm_name( 'ResDoc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RES_ITEM' ).
    lo_primitive_property->set_edm_name( 'ResItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BILLING_PERIOD_START_DATE' ).
    lo_primitive_property->set_edm_name( 'BillingPeriodStartDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BILLING_PERIOD_END_DATE' ).
    lo_primitive_property->set_edm_name( 'BillingPeriodEndDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PPA_EX_IND' ).
    lo_primitive_property->set_edm_name( 'PpaExInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FASTPAY' ).
    lo_primitive_property->set_edm_name( 'Fastpay' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_GRANT_NBR' ).
    lo_primitive_property->set_edm_name( 'PartnerGrantNbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDGET_PERIOD' ).
    lo_primitive_property->set_edm_name( 'BudgetPeriod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_BUDGET_PERIOD' ).
    lo_primitive_property->set_edm_name( 'PartnerBudgetPeriod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_FUND' ).
    lo_primitive_property->set_edm_name( 'PartnerFund' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEMNO_TAX' ).
    lo_primitive_property->set_edm_name( 'ItemnoTax' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYMENT_TYPE' ).
    lo_primitive_property->set_edm_name( 'PaymentType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXPENSE_TYPE' ).
    lo_primitive_property->set_edm_name( 'ExpenseType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROGRAM_PROFILE' ).
    lo_primitive_property->set_edm_name( 'ProgramProfile' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_LONG' ).
    lo_primitive_property->set_edm_name( 'MaterialLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSEBANKID' ).
    lo_primitive_property->set_edm_name( 'Housebankid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSEBANKACCTID' ).
    lo_primitive_property->set_edm_name( 'Housebankacctid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERSON_NO' ).
    lo_primitive_property->set_edm_name( 'PersonNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACROBJ_TYPE' ).
    lo_primitive_property->set_edm_name( 'AcrobjType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACROBJ_ID' ).
    lo_primitive_property->set_edm_name( 'AcrobjId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACRSUBOBJ_ID' ).
    lo_primitive_property->set_edm_name( 'AcrsubobjId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACRITEM_TYPE' ).
    lo_primitive_property->set_edm_name( 'AcritemType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALOBJTYPE' ).
    lo_primitive_property->set_edm_name( 'Valobjtype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALOBJ_ID' ).
    lo_primitive_property->set_edm_name( 'ValobjId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALSUBOBJ_ID' ).
    lo_primitive_property->set_edm_name( 'ValsubobjId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CALC_DATE' ).
    lo_primitive_property->set_edm_name( 'TaxCalcDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CALC_DT_FROM' ).
    lo_primitive_property->set_edm_name( 'TaxCalcDtFrom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICE_DOC_TYPE' ).
    lo_primitive_property->set_edm_name( 'ServiceDocType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICE_DOC_ID' ).
    lo_primitive_property->set_edm_name( 'ServiceDocId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICE_DOC_ITEM_ID' ).
    lo_primitive_property->set_edm_name( 'ServiceDocItemId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BDGT_ACCOUNT' ).
    lo_primitive_property->set_edm_name( 'BdgtAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_1' ).
    lo_primitive_property->set_edm_name( 'GloRef1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACRLOGSYS' ).
    lo_primitive_property->set_edm_name( 'Acrlogsys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACRVALDAT' ).
    lo_primitive_property->set_edm_name( 'Acrvaldat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WORK_ITEM_ID' ).
    lo_primitive_property->set_edm_name( 'WorkItemId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESSPLACE' ).
    lo_primitive_property->set_edm_name( 'Businessplace' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JOINT_VENTURE' ).
    lo_primitive_property->set_edm_name( 'JointVenture' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RECOVERY_IND' ).
    lo_primitive_property->set_edm_name( 'RecoveryInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EQUITY_GROUP' ).
    lo_primitive_property->set_edm_name( 'EquityGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_accountpayable.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'ACCOUNTPAYABLE'
                                    is_structure              = VALUE tys_accountpayable( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'ACCOUNTPAYABLE' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'ACCOUNTPAYABLESET' ).
    lo_entity_set->set_edm_name( 'ACCOUNTPAYABLESet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEMNO_ACC' ).
    lo_primitive_property->set_edm_name( 'ItemnoAcc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VENDOR_NO' ).
    lo_primitive_property->set_edm_name( 'VendorNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GL_ACCOUNT' ).
    lo_primitive_property->set_edm_name( 'GlAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_KEY_1' ).
    lo_primitive_property->set_edm_name( 'RefKey1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_KEY_2' ).
    lo_primitive_property->set_edm_name( 'RefKey2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_KEY_3' ).
    lo_primitive_property->set_edm_name( 'RefKey3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMP_CODE' ).
    lo_primitive_property->set_edm_name( 'CompCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUS_AREA' ).
    lo_primitive_property->set_edm_name( 'BusArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PMNTTRMS' ).
    lo_primitive_property->set_edm_name( 'Pmnttrms' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLINE_DATE' ).
    lo_primitive_property->set_edm_name( 'BlineDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DSCT_DAYS_1' ).
    lo_primitive_property->set_edm_name( 'DsctDays1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DSCT_DAYS_2' ).
    lo_primitive_property->set_edm_name( 'DsctDays2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETTERMS' ).
    lo_primitive_property->set_edm_name( 'Netterms' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DSCT_PCT_1' ).
    lo_primitive_property->set_edm_name( 'DsctPct1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DSCT_PCT_2' ).
    lo_primitive_property->set_edm_name( 'DsctPct2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYMT_METH' ).
    lo_primitive_property->set_edm_name( 'PymtMeth' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PMTMTHSUPL' ).
    lo_primitive_property->set_edm_name( 'Pmtmthsupl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PMNT_BLOCK' ).
    lo_primitive_property->set_edm_name( 'PmntBlock' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCBANK_IND' ).
    lo_primitive_property->set_edm_name( 'ScbankInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPCOUNTRY' ).
    lo_primitive_property->set_edm_name( 'Supcountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPCOUNTRY_ISO' ).
    lo_primitive_property->set_edm_name( 'SupcountryIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLLSRV_IND' ).
    lo_primitive_property->set_edm_name( 'BllsrvInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALLOC_NMBR' ).
    lo_primitive_property->set_edm_name( 'AllocNmbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_TEXT' ).
    lo_primitive_property->set_edm_name( 'ItemText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_SUB_NO' ).
    lo_primitive_property->set_edm_name( 'PoSubNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_CHECKDG' ).
    lo_primitive_property->set_edm_name( 'PoCheckdg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_REF_NO' ).
    lo_primitive_property->set_edm_name( 'PoRefNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 27 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WTAX_CODE' ).
    lo_primitive_property->set_edm_name( 'WTaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESSPLACE' ).
    lo_primitive_property->set_edm_name( 'Businessplace' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SECTIONCODE' ).
    lo_primitive_property->set_edm_name( 'Sectioncode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INSTR_1' ).
    lo_primitive_property->set_edm_name( 'Instr1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INSTR_2' ).
    lo_primitive_property->set_edm_name( 'Instr2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INSTR_3' ).
    lo_primitive_property->set_edm_name( 'Instr3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INSTR_4' ).
    lo_primitive_property->set_edm_name( 'Instr4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRANCH' ).
    lo_primitive_property->set_edm_name( 'Branch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYMT_CUR' ).
    lo_primitive_property->set_edm_name( 'PymtCur' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYMT_AMT' ).
    lo_primitive_property->set_edm_name( 'PymtAmt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYMT_CUR_ISO' ).
    lo_primitive_property->set_edm_name( 'PymtCurIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SP_GL_IND' ).
    lo_primitive_property->set_edm_name( 'SpGlInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_DATE' ).
    lo_primitive_property->set_edm_name( 'TaxDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXJURCODE' ).
    lo_primitive_property->set_edm_name( 'Taxjurcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALT_PAYEE' ).
    lo_primitive_property->set_edm_name( 'AltPayee' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALT_PAYEE_BANK' ).
    lo_primitive_property->set_edm_name( 'AltPayeeBank' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_BK' ).
    lo_primitive_property->set_edm_name( 'PartnerBk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANK_ID' ).
    lo_primitive_property->set_edm_name( 'BankId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_GUID' ).
    lo_primitive_property->set_edm_name( 'PartnerGuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROFIT_CTR' ).
    lo_primitive_property->set_edm_name( 'ProfitCtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUND' ).
    lo_primitive_property->set_edm_name( 'Fund' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRANT_NBR' ).
    lo_primitive_property->set_edm_name( 'GrantNbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEASURE' ).
    lo_primitive_property->set_edm_name( 'Measure' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSEBANKACCTID' ).
    lo_primitive_property->set_edm_name( 'Housebankacctid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDGET_PERIOD' ).
    lo_primitive_property->set_edm_name( 'BudgetPeriod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PPA_EX_IND' ).
    lo_primitive_property->set_edm_name( 'PpaExInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PART_BUSINESSPLACE' ).
    lo_primitive_property->set_edm_name( 'PartBusinessplace' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYMT_REF' ).
    lo_primitive_property->set_edm_name( 'PaymtRef' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYMT_AMT_LONG' ).
    lo_primitive_property->set_edm_name( 'PymtAmtLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BDGT_ACCOUNT' ).
    lo_primitive_property->set_edm_name( 'BdgtAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_1' ).
    lo_primitive_property->set_edm_name( 'GloRef1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAT_REG_NO' ).
    lo_primitive_property->set_edm_name( 'VatRegNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYT_RSN' ).
    lo_primitive_property->set_edm_name( 'PaytRsn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JOINT_VENTURE' ).
    lo_primitive_property->set_edm_name( 'JointVenture' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RECOVERY_IND' ).
    lo_primitive_property->set_edm_name( 'RecoveryInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EQUITY_GROUP' ).
    lo_primitive_property->set_edm_name( 'EquityGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_accountreceivable.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'ACCOUNTRECEIVABLE'
                                    is_structure              = VALUE tys_accountreceivable( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'ACCOUNTRECEIVABLE' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'ACCOUNTRECEIVABLESET' ).
    lo_entity_set->set_edm_name( 'ACCOUNTRECEIVABLESet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEMNO_ACC' ).
    lo_primitive_property->set_edm_name( 'ItemnoAcc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER' ).
    lo_primitive_property->set_edm_name( 'Customer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GL_ACCOUNT' ).
    lo_primitive_property->set_edm_name( 'GlAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_KEY_1' ).
    lo_primitive_property->set_edm_name( 'RefKey1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_KEY_2' ).
    lo_primitive_property->set_edm_name( 'RefKey2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_KEY_3' ).
    lo_primitive_property->set_edm_name( 'RefKey3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMP_CODE' ).
    lo_primitive_property->set_edm_name( 'CompCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUS_AREA' ).
    lo_primitive_property->set_edm_name( 'BusArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PMNTTRMS' ).
    lo_primitive_property->set_edm_name( 'Pmnttrms' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLINE_DATE' ).
    lo_primitive_property->set_edm_name( 'BlineDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DSCT_DAYS_1' ).
    lo_primitive_property->set_edm_name( 'DsctDays1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DSCT_DAYS_2' ).
    lo_primitive_property->set_edm_name( 'DsctDays2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETTERMS' ).
    lo_primitive_property->set_edm_name( 'Netterms' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DSCT_PCT_1' ).
    lo_primitive_property->set_edm_name( 'DsctPct1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DSCT_PCT_2' ).
    lo_primitive_property->set_edm_name( 'DsctPct2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYMT_METH' ).
    lo_primitive_property->set_edm_name( 'PymtMeth' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PMTMTHSUPL' ).
    lo_primitive_property->set_edm_name( 'Pmtmthsupl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYMT_REF' ).
    lo_primitive_property->set_edm_name( 'PaymtRef' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUNN_KEY' ).
    lo_primitive_property->set_edm_name( 'DunnKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUNN_BLOCK' ).
    lo_primitive_property->set_edm_name( 'DunnBlock' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PMNT_BLOCK' ).
    lo_primitive_property->set_edm_name( 'PmntBlock' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAT_REG_NO' ).
    lo_primitive_property->set_edm_name( 'VatRegNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALLOC_NMBR' ).
    lo_primitive_property->set_edm_name( 'AllocNmbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_TEXT' ).
    lo_primitive_property->set_edm_name( 'ItemText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_BK' ).
    lo_primitive_property->set_edm_name( 'PartnerBk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCBANK_IND' ).
    lo_primitive_property->set_edm_name( 'ScbankInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESSPLACE' ).
    lo_primitive_property->set_edm_name( 'Businessplace' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SECTIONCODE' ).
    lo_primitive_property->set_edm_name( 'Sectioncode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRANCH' ).
    lo_primitive_property->set_edm_name( 'Branch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYMT_CUR' ).
    lo_primitive_property->set_edm_name( 'PymtCur' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYMT_CUR_ISO' ).
    lo_primitive_property->set_edm_name( 'PymtCurIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYMT_AMT' ).
    lo_primitive_property->set_edm_name( 'PymtAmt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CCTR_AREA' ).
    lo_primitive_property->set_edm_name( 'CCtrArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANK_ID' ).
    lo_primitive_property->set_edm_name( 'BankId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPCOUNTRY' ).
    lo_primitive_property->set_edm_name( 'Supcountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPCOUNTRY_ISO' ).
    lo_primitive_property->set_edm_name( 'SupcountryIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXJURCODE' ).
    lo_primitive_property->set_edm_name( 'Taxjurcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_DATE' ).
    lo_primitive_property->set_edm_name( 'TaxDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SP_GL_IND' ).
    lo_primitive_property->set_edm_name( 'SpGlInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_GUID' ).
    lo_primitive_property->set_edm_name( 'PartnerGuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALT_PAYEE' ).
    lo_primitive_property->set_edm_name( 'AltPayee' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALT_PAYEE_BANK' ).
    lo_primitive_property->set_edm_name( 'AltPayeeBank' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUNN_AREA' ).
    lo_primitive_property->set_edm_name( 'DunnArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CASE_GUID' ).
    lo_primitive_property->set_edm_name( 'CaseGuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROFIT_CTR' ).
    lo_primitive_property->set_edm_name( 'ProfitCtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUND' ).
    lo_primitive_property->set_edm_name( 'Fund' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRANT_NBR' ).
    lo_primitive_property->set_edm_name( 'GrantNbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEASURE' ).
    lo_primitive_property->set_edm_name( 'Measure' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSEBANKACCTID' ).
    lo_primitive_property->set_edm_name( 'Housebankacctid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RES_DOC' ).
    lo_primitive_property->set_edm_name( 'ResDoc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RES_ITEM' ).
    lo_primitive_property->set_edm_name( 'ResItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUND_LONG' ).
    lo_primitive_property->set_edm_name( 'FundLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISPUTE_IF_TYPE' ).
    lo_primitive_property->set_edm_name( 'DisputeIfType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDGET_PERIOD' ).
    lo_primitive_property->set_edm_name( 'BudgetPeriod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYS_PROV' ).
    lo_primitive_property->set_edm_name( 'PaysProv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYS_TRAN' ).
    lo_primitive_property->set_edm_name( 'PaysTran' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SEPA_MANDATE_ID' ).
    lo_primitive_property->set_edm_name( 'SepaMandateId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PART_BUSINESSPLACE' ).
    lo_primitive_property->set_edm_name( 'PartBusinessplace' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REP_COUNTRY_EU' ).
    lo_primitive_property->set_edm_name( 'RepCountryEu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYMT_AMT_LONG' ).
    lo_primitive_property->set_edm_name( 'PymtAmtLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORD' ).
    lo_primitive_property->set_edm_name( 'SalesOrd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SORD_ITEM' ).
    lo_primitive_property->set_edm_name( 'SOrdItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BDGT_ACCOUNT' ).
    lo_primitive_property->set_edm_name( 'BdgtAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_1' ).
    lo_primitive_property->set_edm_name( 'GloRef1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BILLING_IND' ).
    lo_primitive_property->set_edm_name( 'BillingInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYT_RSN' ).
    lo_primitive_property->set_edm_name( 'PaytRsn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EU_TRIANG_DEAL' ).
    lo_primitive_property->set_edm_name( 'EuTriangDeal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JOINT_VENTURE' ).
    lo_primitive_property->set_edm_name( 'JointVenture' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RECOVERY_IND' ).
    lo_primitive_property->set_edm_name( 'RecoveryInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EQUITY_GROUP' ).
    lo_primitive_property->set_edm_name( 'EquityGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_accounttax.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'ACCOUNTTAX'
                                    is_structure              = VALUE tys_accounttax( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'ACCOUNTTAX' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'ACCOUNTTAXSET' ).
    lo_entity_set->set_edm_name( 'ACCOUNTTAXSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEMNO_ACC' ).
    lo_primitive_property->set_edm_name( 'ItemnoAcc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GL_ACCOUNT' ).
    lo_primitive_property->set_edm_name( 'GlAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COND_KEY' ).
    lo_primitive_property->set_edm_name( 'CondKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCT_KEY' ).
    lo_primitive_property->set_edm_name( 'AcctKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_RATE' ).
    lo_primitive_property->set_edm_name( 'TaxRate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_DATE' ).
    lo_primitive_property->set_edm_name( 'TaxDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXJURCODE' ).
    lo_primitive_property->set_edm_name( 'Taxjurcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXJURCODE_DEEP' ).
    lo_primitive_property->set_edm_name( 'TaxjurcodeDeep' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXJURCODE_LEVEL' ).
    lo_primitive_property->set_edm_name( 'TaxjurcodeLevel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEMNO_TAX' ).
    lo_primitive_property->set_edm_name( 'ItemnoTax' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DIRECT_TAX' ).
    lo_primitive_property->set_edm_name( 'DirectTax' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CALC_DT_FROM' ).
    lo_primitive_property->set_edm_name( 'TaxCalcDtFrom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_accountwt.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'ACCOUNTWT'
                                    is_structure              = VALUE tys_accountwt( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'ACCOUNTWT' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'ACCOUNTWTSET' ).
    lo_entity_set->set_edm_name( 'ACCOUNTWTSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEMNO_ACC' ).
    lo_primitive_property->set_edm_name( 'ItemnoAcc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WT_TYPE' ).
    lo_primitive_property->set_edm_name( 'WtType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WT_CODE' ).
    lo_primitive_property->set_edm_name( 'WtCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BAS_AMT_LC' ).
    lo_primitive_property->set_edm_name( 'BasAmtLc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BAS_AMT_TC' ).
    lo_primitive_property->set_edm_name( 'BasAmtTc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BAS_AMT_L_2' ).
    lo_primitive_property->set_edm_name( 'BasAmtL2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BAS_AMT_L_3' ).
    lo_primitive_property->set_edm_name( 'BasAmtL3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAN_AMT_LC' ).
    lo_primitive_property->set_edm_name( 'ManAmtLc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAN_AMT_TC' ).
    lo_primitive_property->set_edm_name( 'ManAmtTc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAN_AMT_L_2' ).
    lo_primitive_property->set_edm_name( 'ManAmtL2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAN_AMT_L_3' ).
    lo_primitive_property->set_edm_name( 'ManAmtL3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AWH_AMT_LC' ).
    lo_primitive_property->set_edm_name( 'AwhAmtLc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AWH_AMT_TC' ).
    lo_primitive_property->set_edm_name( 'AwhAmtTc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AWH_AMT_L_2' ).
    lo_primitive_property->set_edm_name( 'AwhAmtL2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AWH_AMT_L_3' ).
    lo_primitive_property->set_edm_name( 'AwhAmtL3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BAS_AMT_IND' ).
    lo_primitive_property->set_edm_name( 'BasAmtInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAN_AMT_IND' ).
    lo_primitive_property->set_edm_name( 'ManAmtInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BAS_AMT_LC_LONG' ).
    lo_primitive_property->set_edm_name( 'BasAmtLcLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BAS_AMT_TC_LONG' ).
    lo_primitive_property->set_edm_name( 'BasAmtTcLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BAS_AMT_L_2_LONG' ).
    lo_primitive_property->set_edm_name( 'BasAmtL2Long' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BAS_AMT_L_3_LONG' ).
    lo_primitive_property->set_edm_name( 'BasAmtL3Long' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAN_AMT_LC_LONG' ).
    lo_primitive_property->set_edm_name( 'ManAmtLcLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAN_AMT_TC_LONG' ).
    lo_primitive_property->set_edm_name( 'ManAmtTcLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAN_AMT_L_2_LONG' ).
    lo_primitive_property->set_edm_name( 'ManAmtL2Long' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAN_AMT_L_3_LONG' ).
    lo_primitive_property->set_edm_name( 'ManAmtL3Long' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AWH_AMT_LC_LONG' ).
    lo_primitive_property->set_edm_name( 'AwhAmtLcLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AWH_AMT_TC_LONG' ).
    lo_primitive_property->set_edm_name( 'AwhAmtTcLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AWH_AMT_L_2_LONG' ).
    lo_primitive_property->set_edm_name( 'AwhAmtL2Long' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AWH_AMT_L_3_LONG' ).
    lo_primitive_property->set_edm_name( 'AwhAmtL3Long' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_contractheader.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'CONTRACTHEADER'
                                    is_structure              = VALUE tys_contractheader( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'CONTRACTHEADER' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'CONTRACTHEADERSET' ).
    lo_entity_set->set_edm_name( 'CONTRACTHEADERSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOC_NO' ).
    lo_primitive_property->set_edm_name( 'DocNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOC_TYPE_CA' ).
    lo_primitive_property->set_edm_name( 'DocTypeCa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RES_KEY' ).
    lo_primitive_property->set_edm_name( 'ResKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIKEY' ).
    lo_primitive_property->set_edm_name( 'Fikey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYMENT_FORM_REF' ).
    lo_primitive_property->set_edm_name( 'PaymentFormRef' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_contractitem.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'CONTRACTITEM'
                                    is_structure              = VALUE tys_contractitem( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'CONTRACTITEM' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'CONTRACTITEMSET' ).
    lo_entity_set->set_edm_name( 'CONTRACTITEMSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEMNO_ACC' ).
    lo_primitive_property->set_edm_name( 'ItemnoAcc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONT_ACCT' ).
    lo_primitive_property->set_edm_name( 'ContAcct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAIN_TRANS' ).
    lo_primitive_property->set_edm_name( 'MainTrans' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUB_TRANS' ).
    lo_primitive_property->set_edm_name( 'SubTrans' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNC_AREA' ).
    lo_primitive_property->set_edm_name( 'FuncArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FM_AREA' ).
    lo_primitive_property->set_edm_name( 'FmArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMMT_ITEM' ).
    lo_primitive_property->set_edm_name( 'CmmtItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNDS_CTR' ).
    lo_primitive_property->set_edm_name( 'FundsCtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUND' ).
    lo_primitive_property->set_edm_name( 'Fund' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AGREEMENT_GUID' ).
    lo_primitive_property->set_edm_name( 'AgreementGuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNC_AREA_LONG' ).
    lo_primitive_property->set_edm_name( 'FuncAreaLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMMT_ITEM_LONG' ).
    lo_primitive_property->set_edm_name( 'CmmtItemLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRANT_NBR' ).
    lo_primitive_property->set_edm_name( 'GrantNbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VTREF' ).
    lo_primitive_property->set_edm_name( 'Vtref' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VTREF_GUID' ).
    lo_primitive_property->set_edm_name( 'VtrefGuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_OBJECT_ID' ).
    lo_primitive_property->set_edm_name( 'ExtObjectId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 34 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUS_SCENARIO' ).
    lo_primitive_property->set_edm_name( 'BusScenario' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFERENCE_NO' ).
    lo_primitive_property->set_edm_name( 'ReferenceNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDGET_PERIOD' ).
    lo_primitive_property->set_edm_name( 'BudgetPeriod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_criteria.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'CRITERIA'
                                    is_structure              = VALUE tys_criteria( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'CRITERIA' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'CRITERIASET' ).
    lo_entity_set->set_edm_name( 'CRITERIASet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEMNO_ACC' ).
    lo_primitive_property->set_edm_name( 'ItemnoAcc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIELDNAME' ).
    lo_primitive_property->set_edm_name( 'Fieldname' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHARACTER' ).
    lo_primitive_property->set_edm_name( 'Character' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROD_NO_LONG' ).
    lo_primitive_property->set_edm_name( 'ProdNoLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUST_CHAR_VALUE_LONG' ).
    lo_primitive_property->set_edm_name( 'CustCharValueLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_currencyamount.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'CURRENCYAMOUNT'
                                    is_structure              = VALUE tys_currencyamount( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'CURRENCYAMOUNT' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'CURRENCYAMOUNTSET' ).
    lo_entity_set->set_edm_name( 'CURRENCYAMOUNTSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEMNO_ACC' ).
    lo_primitive_property->set_edm_name( 'ItemnoAcc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURR_TYPE' ).
    lo_primitive_property->set_edm_name( 'CurrType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURRENCY' ).
    lo_primitive_property->set_edm_name( 'Currency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURRENCY_ISO' ).
    lo_primitive_property->set_edm_name( 'CurrencyIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AMT_DOCCUR' ).
    lo_primitive_property->set_edm_name( 'AmtDoccur' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXCH_RATE' ).
    lo_primitive_property->set_edm_name( 'ExchRate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXCH_RATE_V' ).
    lo_primitive_property->set_edm_name( 'ExchRateV' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AMT_BASE' ).
    lo_primitive_property->set_edm_name( 'AmtBase' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISC_BASE' ).
    lo_primitive_property->set_edm_name( 'DiscBase' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISC_AMT' ).
    lo_primitive_property->set_edm_name( 'DiscAmt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_AMT' ).
    lo_primitive_property->set_edm_name( 'TaxAmt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AMT_DOCCUR_LONG' ).
    lo_primitive_property->set_edm_name( 'AmtDoccurLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AMT_BASE_LONG' ).
    lo_primitive_property->set_edm_name( 'AmtBaseLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISC_BASE_LONG' ).
    lo_primitive_property->set_edm_name( 'DiscBaseLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISC_AMT_LONG' ).
    lo_primitive_property->set_edm_name( 'DiscAmtLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_AMT_LONG' ).
    lo_primitive_property->set_edm_name( 'TaxAmtLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_customercpd.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'CUSTOMERCPD'
                                    is_structure              = VALUE tys_customercpd( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'CUSTOMERCPD' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'CUSTOMERCPDSET' ).
    lo_entity_set->set_edm_name( 'CUSTOMERCPDSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME' ).
    lo_primitive_property->set_edm_name( 'Name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_2' ).
    lo_primitive_property->set_edm_name( 'Name2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_3' ).
    lo_primitive_property->set_edm_name( 'Name3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_4' ).
    lo_primitive_property->set_edm_name( 'Name4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSTL_CODE' ).
    lo_primitive_property->set_edm_name( 'PostlCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CITY' ).
    lo_primitive_property->set_edm_name( 'City' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTRY' ).
    lo_primitive_property->set_edm_name( 'Country' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTRY_ISO' ).
    lo_primitive_property->set_edm_name( 'CountryIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET' ).
    lo_primitive_property->set_edm_name( 'Street' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_BOX' ).
    lo_primitive_property->set_edm_name( 'PoBox' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBX_PCD' ).
    lo_primitive_property->set_edm_name( 'PobxPcd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBK_CURAC' ).
    lo_primitive_property->set_edm_name( 'PobkCurac' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANK_ACCT' ).
    lo_primitive_property->set_edm_name( 'BankAcct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANK_NO' ).
    lo_primitive_property->set_edm_name( 'BankNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANK_CTRY' ).
    lo_primitive_property->set_edm_name( 'BankCtry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANK_CTRY_ISO' ).
    lo_primitive_property->set_edm_name( 'BankCtryIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_NO_1' ).
    lo_primitive_property->set_edm_name( 'TaxNo1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_NO_2' ).
    lo_primitive_property->set_edm_name( 'TaxNo2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX' ).
    lo_primitive_property->set_edm_name( 'Tax' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EQUAL_TAX' ).
    lo_primitive_property->set_edm_name( 'EqualTax' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REGION' ).
    lo_primitive_property->set_edm_name( 'Region' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CTRL_KEY' ).
    lo_primitive_property->set_edm_name( 'CtrlKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INSTR_KEY' ).
    lo_primitive_property->set_edm_name( 'InstrKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DME_IND' ).
    lo_primitive_property->set_edm_name( 'DmeInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANGU_ISO' ).
    lo_primitive_property->set_edm_name( 'LanguIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IBAN' ).
    lo_primitive_property->set_edm_name( 'Iban' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 34 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SWIFT_CODE' ).
    lo_primitive_property->set_edm_name( 'SwiftCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_NO_3' ).
    lo_primitive_property->set_edm_name( 'TaxNo3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_NO_4' ).
    lo_primitive_property->set_edm_name( 'TaxNo4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TITLE' ).
    lo_primitive_property->set_edm_name( 'Title' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_NO_5' ).
    lo_primitive_property->set_edm_name( 'TaxNo5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_RE_1_OT' ).
    lo_primitive_property->set_edm_name( 'GloRe1Ot' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 140 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SOLE_PROP' ).
    lo_primitive_property->set_edm_name( 'SoleProp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_NO_TY' ).
    lo_primitive_property->set_edm_name( 'TaxNoTy' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_documentheader.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'DOCUMENTHEADER'
                                    is_structure              = VALUE tys_documentheader( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'DOCUMENTHEADER' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'DOCUMENTHEADERSET' ).
    lo_entity_set->set_edm_name( 'DOCUMENTHEADERSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OBJ_TYPE' ).
    lo_primitive_property->set_edm_name( 'ObjType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OBJ_KEY' ).
    lo_primitive_property->set_edm_name( 'ObjKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OBJ_SYS' ).
    lo_primitive_property->set_edm_name( 'ObjSys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUS_ACT' ).
    lo_primitive_property->set_edm_name( 'BusAct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'USERNAME' ).
    lo_primitive_property->set_edm_name( 'Username' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HEADER_TXT' ).
    lo_primitive_property->set_edm_name( 'HeaderTxt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMP_CODE' ).
    lo_primitive_property->set_edm_name( 'CompCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOC_DATE' ).
    lo_primitive_property->set_edm_name( 'DocDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSTNG_DATE' ).
    lo_primitive_property->set_edm_name( 'PstngDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANS_DATE' ).
    lo_primitive_property->set_edm_name( 'TransDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISC_YEAR' ).
    lo_primitive_property->set_edm_name( 'FiscYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIS_PERIOD' ).
    lo_primitive_property->set_edm_name( 'FisPeriod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOC_TYPE' ).
    lo_primitive_property->set_edm_name( 'DocType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_DOC_NO' ).
    lo_primitive_property->set_edm_name( 'RefDocNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AC_DOC_NO' ).
    lo_primitive_property->set_edm_name( 'AcDocNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OBJ_KEY_R' ).
    lo_primitive_property->set_edm_name( 'ObjKeyR' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REASON_REV' ).
    lo_primitive_property->set_edm_name( 'ReasonRev' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPO_ACC' ).
    lo_primitive_property->set_edm_name( 'CompoAcc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_DOC_NO_LONG' ).
    lo_primitive_property->set_edm_name( 'RefDocNoLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACC_PRINCIPLE' ).
    lo_primitive_property->set_edm_name( 'AccPrinciple' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NEG_POSTNG' ).
    lo_primitive_property->set_edm_name( 'NegPostng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OBJ_KEY_INV' ).
    lo_primitive_property->set_edm_name( 'ObjKeyInv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BILL_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'BillCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VATDATE' ).
    lo_primitive_property->set_edm_name( 'Vatdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICE_REC_DATE' ).
    lo_primitive_property->set_edm_name( 'InvoiceRecDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ECS_ENV' ).
    lo_primitive_property->set_edm_name( 'EcsEnv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTIAL_REV' ).
    lo_primitive_property->set_edm_name( 'PartialRev' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOC_STATUS' ).
    lo_primitive_property->set_edm_name( 'DocStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CALC_DATE' ).
    lo_primitive_property->set_edm_name( 'TaxCalcDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_1_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef1Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_1_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat1Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_2_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef2Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_2_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat2Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_3_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef3Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_3_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat3Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_4_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef4Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_4_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat4Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_5_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef5Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_5_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat5Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_BP_1_HD' ).
    lo_primitive_property->set_edm_name( 'GloBp1Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_BP_2_HD' ).
    lo_primitive_property->set_edm_name( 'GloBp2Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EV_POSTNG_CTRL' ).
    lo_primitive_property->set_edm_name( 'EvPostngCtrl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LEDGER_GROUP' ).
    lo_primitive_property->set_edm_name( 'LedgerGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANNED_REV_DATE' ).
    lo_primitive_property->set_edm_name( 'PlannedRevDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUS_TRANSACTION_TYPE' ).
    lo_primitive_property->set_edm_name( 'BusTransactionType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CLOSINGSTEP' ).
    lo_primitive_property->set_edm_name( 'Closingstep' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FULFILLDATE' ).
    lo_primitive_property->set_edm_name( 'Fulfilldate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_extension_1.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'EXTENSION_1'
                                    is_structure              = VALUE tys_extension_1( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'EXTENSION1' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'EXTENSION_1_SET' ).
    lo_entity_set->set_edm_name( 'EXTENSION1Set' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIELD_1' ).
    lo_primitive_property->set_edm_name( 'Field1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 250 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIELD_2' ).
    lo_primitive_property->set_edm_name( 'Field2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 250 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIELD_3' ).
    lo_primitive_property->set_edm_name( 'Field3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 250 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIELD_4' ).
    lo_primitive_property->set_edm_name( 'Field4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 250 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_extension_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'EXTENSION_2'
                                    is_structure              = VALUE tys_extension_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'EXTENSION2' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'EXTENSION_2_SET' ).
    lo_entity_set->set_edm_name( 'EXTENSION2Set' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STRUCTURE' ).
    lo_primitive_property->set_edm_name( 'Structure' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALUEPART_1' ).
    lo_primitive_property->set_edm_name( 'Valuepart1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 240 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALUEPART_2' ).
    lo_primitive_property->set_edm_name( 'Valuepart2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 240 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALUEPART_3' ).
    lo_primitive_property->set_edm_name( 'Valuepart3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 240 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALUEPART_4' ).
    lo_primitive_property->set_edm_name( 'Valuepart4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 240 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_jepost.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'JEPOST'
                                    is_structure              = VALUE tys_jepost( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'JEPost' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'JEPOST_SET' ).
    lo_entity_set->set_edm_name( 'JEPostSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OBJ_TYPE' ).
    lo_primitive_property->set_edm_name( 'OBJ_TYPE' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OBJ_KEY' ).
    lo_primitive_property->set_edm_name( 'OBJ_KEY' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OBJ_SYS' ).
    lo_primitive_property->set_edm_name( 'OBJ_SYS' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'JEACCOUNTAPNAV' ).
    lo_navigation_property->set_edm_name( 'JEAccountAPNav' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'ACCOUNTPAYABLE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'JEACCOUNTARNAV' ).
    lo_navigation_property->set_edm_name( 'JEAccountARNav' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'ACCOUNTRECEIVABLE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'JEACCOUNTGLNAV' ).
    lo_navigation_property->set_edm_name( 'JEAccountGLNav' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'ACCOUNTGL' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'JEACCOUNTTAXNAV' ).
    lo_navigation_property->set_edm_name( 'JEAccountTaxNav' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'ACCOUNTTAX' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'JEACCOUNTWTNAV' ).
    lo_navigation_property->set_edm_name( 'JEAccountWTNav' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'ACCOUNTWT' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'JECONTRACTHEADERNAV' ).
    lo_navigation_property->set_edm_name( 'JEContractHeaderNav' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'CONTRACTHEADER' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'JECONTRACTITEMNAV' ).
    lo_navigation_property->set_edm_name( 'JEContractItemNav' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'CONTRACTITEM' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'JECRITERIANAV' ).
    lo_navigation_property->set_edm_name( 'JECriteriaNav' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'CRITERIA' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'JECURRENCYAMOUNTNAV' ).
    lo_navigation_property->set_edm_name( 'JECurrencyAmountNav' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'CURRENCYAMOUNT' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'JECUSTOMERCPDNAV' ).
    lo_navigation_property->set_edm_name( 'JECustomerCPDNav' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'CUSTOMERCPD' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'JEEXTENSION1NAV' ).
    lo_navigation_property->set_edm_name( 'JEExtension1Nav' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'EXTENSION_1' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'JEEXTENSION2NAV' ).
    lo_navigation_property->set_edm_name( 'JEExtension2Nav' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'EXTENSION_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'JEHEADERNAV' ).
    lo_navigation_property->set_edm_name( 'JEHeaderNav' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'DOCUMENTHEADER' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'JEPAYMENTCARDNAV' ).
    lo_navigation_property->set_edm_name( 'JEPaymentCardNav' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'PAYMENTCARD' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'JEREALESTATENAV' ).
    lo_navigation_property->set_edm_name( 'JERealEstateNav' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'REALESTATE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'JERETURNNAV' ).
    lo_navigation_property->set_edm_name( 'JEReturnNav' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'RETURN' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'JEVALUEFIELDNAV' ).
    lo_navigation_property->set_edm_name( 'JEValueFieldNav' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'VALUEFIELD' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


  METHOD def_notification.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'NOTIFICATION'
                                    is_structure              = VALUE tys_notification( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Notification' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'NOTIFICATION_COLLECTION' ).
    lo_entity_set->set_edm_name( 'NotificationCollection' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'ID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COLLECTION' ).
    lo_primitive_property->set_edm_name( 'collection' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TITLE' ).
    lo_primitive_property->set_edm_name( 'title' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPDATED' ).
    lo_primitive_property->set_edm_name( 'updated' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHANGE_TYPE' ).
    lo_primitive_property->set_edm_name( 'changeType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENTRIES_OF_INTEREST' ).
    lo_primitive_property->set_edm_name( 'entriesOfInterest' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RECIPIENT' ).
    lo_primitive_property->set_edm_name( 'recipient' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 112 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_paymentcard.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'PAYMENTCARD'
                                    is_structure              = VALUE tys_paymentcard( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'PAYMENTCARD' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'PAYMENTCARDSET' ).
    lo_entity_set->set_edm_name( 'PAYMENTCARDSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEMNO_ACC' ).
    lo_primitive_property->set_edm_name( 'ItemnoAcc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CC_GLACCOUNT' ).
    lo_primitive_property->set_edm_name( 'CcGlaccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CC_TYPE' ).
    lo_primitive_property->set_edm_name( 'CcType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CC_NUMBER' ).
    lo_primitive_property->set_edm_name( 'CcNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CC_SEQ_NO' ).
    lo_primitive_property->set_edm_name( 'CcSeqNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CC_VALID_F' ).
    lo_primitive_property->set_edm_name( 'CcValidF' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CC_VALID_T' ).
    lo_primitive_property->set_edm_name( 'CcValidT' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CC_NAME' ).
    lo_primitive_property->set_edm_name( 'CcName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATAORIGIN' ).
    lo_primitive_property->set_edm_name( 'Dataorigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUTHAMOUNT' ).
    lo_primitive_property->set_edm_name( 'Authamount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURRENCY' ).
    lo_primitive_property->set_edm_name( 'Currency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURRENCY_ISO' ).
    lo_primitive_property->set_edm_name( 'CurrencyIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CC_AUTTH_NO' ).
    lo_primitive_property->set_edm_name( 'CcAutthNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUTH_REFNO' ).
    lo_primitive_property->set_edm_name( 'AuthRefno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUTH_DATE' ).
    lo_primitive_property->set_edm_name( 'AuthDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUTH_TIME' ).
    lo_primitive_property->set_edm_name( 'AuthTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MERCHIDCL' ).
    lo_primitive_property->set_edm_name( 'Merchidcl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POINT_OF_RECEIPT' ).
    lo_primitive_property->set_edm_name( 'PointOfReceipt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TERMINAL' ).
    lo_primitive_property->set_edm_name( 'Terminal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CCTYP' ).
    lo_primitive_property->set_edm_name( 'Cctyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUTHAMOUNT_LONG' ).
    lo_primitive_property->set_edm_name( 'AuthamountLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_realestate.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'REALESTATE'
                                    is_structure              = VALUE tys_realestate( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'REALESTATE' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'REALESTATESET' ).
    lo_entity_set->set_edm_name( 'REALESTATESet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEMNO_ACC' ).
    lo_primitive_property->set_edm_name( 'ItemnoAcc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_ENTITY' ).
    lo_primitive_property->set_edm_name( 'BusinessEntity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUILDING' ).
    lo_primitive_property->set_edm_name( 'Building' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROPERTY' ).
    lo_primitive_property->set_edm_name( 'Property' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RENTAL_OBJECT' ).
    lo_primitive_property->set_edm_name( 'RentalObject' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERV_CHARGE_KEY' ).
    lo_primitive_property->set_edm_name( 'ServChargeKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SETTLEMENT_UNIT' ).
    lo_primitive_property->set_edm_name( 'SettlementUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTRACT_NO' ).
    lo_primitive_property->set_edm_name( 'ContractNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLOW_TYPE' ).
    lo_primitive_property->set_edm_name( 'FlowType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORR_ITEM' ).
    lo_primitive_property->set_edm_name( 'CorrItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_DATE' ).
    lo_primitive_property->set_edm_name( 'RefDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OPTION_RATE' ).
    lo_primitive_property->set_edm_name( 'OptionRate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

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

    lo_entity_type->set_edm_name( 'RETURN' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'RETURNSET' ).
    lo_entity_set->set_edm_name( 'RETURNSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TYPE' ).
    lo_primitive_property->set_edm_name( 'Type' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NUMBER' ).
    lo_primitive_property->set_edm_name( 'Number' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE' ).
    lo_primitive_property->set_edm_name( 'Message' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 220 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOG_NO' ).
    lo_primitive_property->set_edm_name( 'LogNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOG_MSG_NO' ).
    lo_primitive_property->set_edm_name( 'LogMsgNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE_V_1' ).
    lo_primitive_property->set_edm_name( 'MessageV1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE_V_2' ).
    lo_primitive_property->set_edm_name( 'MessageV2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE_V_3' ).
    lo_primitive_property->set_edm_name( 'MessageV3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE_V_4' ).
    lo_primitive_property->set_edm_name( 'MessageV4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARAMETER' ).
    lo_primitive_property->set_edm_name( 'Parameter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROW' ).
    lo_primitive_property->set_edm_name( 'Row' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIELD' ).
    lo_primitive_property->set_edm_name( 'Field' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SYSTEM' ).
    lo_primitive_property->set_edm_name( 'System' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_subscription.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SUBSCRIPTION'
                                    is_structure              = VALUE tys_subscription( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Subscription' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SUBSCRIPTION_COLLECTION' ).
    lo_entity_set->set_edm_name( 'SubscriptionCollection' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'ID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'USER' ).
    lo_primitive_property->set_edm_name( 'user' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPDATED' ).
    lo_primitive_property->set_edm_name( 'updated' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TITLE' ).
    lo_primitive_property->set_edm_name( 'title' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_ADDRESS' ).
    lo_primitive_property->set_edm_name( 'deliveryAddress' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERSIST_NOTIFICATIONS' ).
    lo_primitive_property->set_edm_name( 'persistNotifications' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COLLECTION' ).
    lo_primitive_property->set_edm_name( 'collection' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FILTER' ).
    lo_primitive_property->set_edm_name( 'filter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SELECT' ).
    lo_primitive_property->set_edm_name( 'select' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHANGE_TYPE' ).
    lo_primitive_property->set_edm_name( 'changeType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_valuefield.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'VALUEFIELD'
                                    is_structure              = VALUE tys_valuefield( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'VALUEFIELD' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'VALUEFIELDSET' ).
    lo_entity_set->set_edm_name( 'VALUEFIELDSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEMNO_ACC' ).
    lo_primitive_property->set_edm_name( 'ItemnoAcc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIELDNAME' ).
    lo_primitive_property->set_edm_name( 'Fieldname' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURR_TYPE' ).
    lo_primitive_property->set_edm_name( 'CurrType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURRENCY' ).
    lo_primitive_property->set_edm_name( 'Currency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURRENCY_ISO' ).
    lo_primitive_property->set_edm_name( 'CurrencyIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AMT_VALCOM' ).
    lo_primitive_property->set_edm_name( 'AmtValcom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BASE_UOM' ).
    lo_primitive_property->set_edm_name( 'BaseUom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BASE_UOM_ISO' ).
    lo_primitive_property->set_edm_name( 'BaseUomIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUA_VALCOM' ).
    lo_primitive_property->set_edm_name( 'QuaValcom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AMT_VALCOM_LONG' ).
    lo_primitive_property->set_edm_name( 'AmtValcomLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.
ENDCLASS.
