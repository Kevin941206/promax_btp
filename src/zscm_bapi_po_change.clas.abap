"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>ZFM_BAPI_PO_CHANGE_SRV</em>
CLASS zscm_bapi_po_change DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">header</p>
      BEGIN OF tys_header,
        "! <em>Key property</em> Ebeln
        ebeln TYPE string,
      END OF tys_header,
      "! <p class="shorttext synchronized">List of header</p>
      tyt_header TYPE STANDARD TABLE OF tys_header WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">item</p>
      BEGIN OF tys_item,
        "! <em>Key property</em> Ebeln
        ebeln                      TYPE string,
        "! PoItem
        po_item                    TYPE c LENGTH 5,
        "! DeleteInd
        delete_ind                 TYPE c LENGTH 1,
        "! ShortText
        short_text                 TYPE c LENGTH 40,
        "! Material
        material                   TYPE c LENGTH 18,
        "! MaterialExternal
        material_external          TYPE c LENGTH 40,
        "! MaterialGuid
        material_guid              TYPE c LENGTH 32,
        "! MaterialVersion
        material_version           TYPE c LENGTH 10,
        "! Ematerial
        ematerial                  TYPE c LENGTH 18,
        "! EmaterialExternal
        ematerial_external         TYPE c LENGTH 40,
        "! EmaterialGuid
        ematerial_guid             TYPE c LENGTH 32,
        "! EmaterialVersion
        ematerial_version          TYPE c LENGTH 10,
        "! Plant
        plant                      TYPE c LENGTH 4,
        "! StgeLoc
        stge_loc                   TYPE c LENGTH 4,
        "! Trackingno
        trackingno                 TYPE c LENGTH 10,
        "! MatlGroup
        matl_group                 TYPE c LENGTH 9,
        "! InfoRec
        info_rec                   TYPE c LENGTH 10,
        "! VendMat
        vend_mat                   TYPE c LENGTH 35,
        "! Quantity
        quantity                   TYPE p LENGTH 7 DECIMALS 3,
        "! PoUnit
        po_unit                    TYPE c LENGTH 3,
        "! PoUnitIso
        po_unit_iso                TYPE c LENGTH 3,
        "! OrderprUn
        orderpr_un                 TYPE c LENGTH 3,
        "! OrderprUnIso
        orderpr_un_iso             TYPE c LENGTH 3,
        "! ConvNum1
        conv_num_1                 TYPE p LENGTH 3 DECIMALS 0,
        "! ConvDen1
        conv_den_1                 TYPE p LENGTH 3 DECIMALS 0,
        "! NetPrice
        net_price                  TYPE p LENGTH 15 DECIMALS 9,
        "! PriceUnit
        price_unit                 TYPE p LENGTH 3 DECIMALS 0,
        "! GrPrTime
        gr_pr_time                 TYPE p LENGTH 2 DECIMALS 0,
        "! TaxCode
        tax_code                   TYPE c LENGTH 2,
        "! BonGrp1
        bon_grp_1                  TYPE c LENGTH 2,
        "! QualInsp
        qual_insp                  TYPE c LENGTH 1,
        "! InfoUpd
        info_upd                   TYPE c LENGTH 1,
        "! PrntPrice
        prnt_price                 TYPE abap_bool,
        "! EstPrice
        est_price                  TYPE abap_bool,
        "! Reminder1
        reminder_1                 TYPE p LENGTH 2 DECIMALS 0,
        "! Reminder2
        reminder_2                 TYPE p LENGTH 2 DECIMALS 0,
        "! Reminder3
        reminder_3                 TYPE p LENGTH 2 DECIMALS 0,
        "! OverDlvTol
        over_dlv_tol               TYPE p LENGTH 2 DECIMALS 1,
        "! UnlimitedDlv
        unlimited_dlv              TYPE abap_bool,
        "! UnderDlvTol
        under_dlv_tol              TYPE p LENGTH 2 DECIMALS 1,
        "! ValType
        val_type                   TYPE c LENGTH 10,
        "! NoMoreGr
        no_more_gr                 TYPE abap_bool,
        "! FinalInv
        final_inv                  TYPE abap_bool,
        "! ItemCat
        item_cat                   TYPE c LENGTH 1,
        "! Acctasscat
        acctasscat                 TYPE c LENGTH 1,
        "! Distrib
        distrib                    TYPE c LENGTH 1,
        "! PartInv
        part_inv                   TYPE c LENGTH 1,
        "! GrInd
        gr_ind                     TYPE abap_bool,
        "! GrNonVal
        gr_non_val                 TYPE abap_bool,
        "! IrInd
        ir_ind                     TYPE abap_bool,
        "! FreeItem
        free_item                  TYPE abap_bool,
        "! GrBasediv
        gr_basediv                 TYPE abap_bool,
        "! AcknReqd
        ackn_reqd                  TYPE abap_bool,
        "! AcknowlNo
        acknowl_no                 TYPE c LENGTH 20,
        "! Agreement
        agreement                  TYPE c LENGTH 10,
        "! AgmtItem
        agmt_item                  TYPE c LENGTH 5,
        "! Shipping
        shipping                   TYPE c LENGTH 2,
        "! Customer
        customer                   TYPE c LENGTH 10,
        "! CondGroup
        cond_group                 TYPE c LENGTH 4,
        "! NoDisct
        no_disct                   TYPE abap_bool,
        "! PlanDel
        plan_del                   TYPE p LENGTH 2 DECIMALS 0,
        "! NetWeight
        net_weight                 TYPE p LENGTH 7 DECIMALS 3,
        "! Weightunit
        weightunit                 TYPE c LENGTH 3,
        "! WeightunitIso
        weightunit_iso             TYPE c LENGTH 3,
        "! Taxjurcode
        taxjurcode                 TYPE c LENGTH 15,
        "! CtrlKey
        ctrl_key                   TYPE c LENGTH 8,
        "! ConfCtrl
        conf_ctrl                  TYPE c LENGTH 4,
        "! RevLev
        rev_lev                    TYPE c LENGTH 2,
        "! Fund
        fund                       TYPE c LENGTH 10,
        "! FundsCtr
        funds_ctr                  TYPE c LENGTH 16,
        "! CmmtItem
        cmmt_item                  TYPE c LENGTH 24,
        "! Pricedate
        pricedate                  TYPE c LENGTH 1,
        "! PriceDate
        price_date                 TYPE timestampl,
        "! GrossWt
        gross_wt                   TYPE p LENGTH 7 DECIMALS 3,
        "! Volume
        volume                     TYPE p LENGTH 7 DECIMALS 3,
        "! Volumeunit
        volumeunit                 TYPE c LENGTH 3,
        "! VolumeunitIso
        volumeunit_iso             TYPE c LENGTH 3,
        "! Incoterms1
        incoterms_1                TYPE c LENGTH 3,
        "! Incoterms2
        incoterms_2                TYPE c LENGTH 28,
        "! PreVendor
        pre_vendor                 TYPE c LENGTH 10,
        "! VendPart
        vend_part                  TYPE c LENGTH 6,
        "! HlItem
        hl_item                    TYPE c LENGTH 5,
        "! GrToDate
        gr_to_date                 TYPE timestampl,
        "! SuppVendor
        supp_vendor                TYPE c LENGTH 10,
        "! ScVendor
        sc_vendor                  TYPE abap_bool,
        "! KanbanInd
        kanban_ind                 TYPE c LENGTH 1,
        "! Ers
        ers                        TYPE abap_bool,
        "! RPromo
        rpromo                     TYPE c LENGTH 10,
        "! Points
        points                     TYPE p LENGTH 7 DECIMALS 3,
        "! PointUnit
        point_unit                 TYPE c LENGTH 3,
        "! PointUnitIso
        point_unit_iso             TYPE c LENGTH 3,
        "! Season
        season                     TYPE c LENGTH 4,
        "! SeasonYr
        season_yr                  TYPE c LENGTH 4,
        "! BonGrp2
        bon_grp_2                  TYPE c LENGTH 2,
        "! BonGrp3
        bon_grp_3                  TYPE c LENGTH 2,
        "! SettItem
        sett_item                  TYPE abap_bool,
        "! Minremlife
        minremlife                 TYPE p LENGTH 3 DECIMALS 0,
        "! RfqNo
        rfq_no                     TYPE c LENGTH 10,
        "! RfqItem
        rfq_item                   TYPE c LENGTH 5,
        "! PreqNo
        preq_no                    TYPE c LENGTH 10,
        "! PreqItem
        preq_item                  TYPE c LENGTH 5,
        "! RefDoc
        ref_doc                    TYPE c LENGTH 10,
        "! RefItem
        ref_item                   TYPE c LENGTH 5,
        "! SiCat
        si_cat                     TYPE c LENGTH 1,
        "! RetItem
        ret_item                   TYPE abap_bool,
        "! AtRelev
        at_relev                   TYPE c LENGTH 1,
        "! OrderReason
        order_reason               TYPE c LENGTH 3,
        "! BrasNbm
        bras_nbm                   TYPE c LENGTH 16,
        "! MatlUsage
        matl_usage                 TYPE c LENGTH 1,
        "! MatOrigin
        mat_origin                 TYPE c LENGTH 1,
        "! InHouse
        in_house                   TYPE abap_bool,
        "! Indus3
        indus_3                    TYPE c LENGTH 2,
        "! InfIndex
        inf_index                  TYPE c LENGTH 5,
        "! UntilDate
        until_date                 TYPE timestampl,
        "! DelivCompl
        deliv_compl                TYPE abap_bool,
        "! PartDeliv
        part_deliv                 TYPE c LENGTH 1,
        "! ShipBlocked
        ship_blocked               TYPE abap_bool,
        "! PreqName
        preq_name                  TYPE c LENGTH 12,
        "! PeriodIndExpirationDate
        period_ind_expiration_date TYPE c LENGTH 1,
        "! IntObjNo
        int_obj_no                 TYPE c LENGTH 18,
        "! PckgNo
        pckg_no                    TYPE c LENGTH 10,
        "! Batch
        batch                      TYPE c LENGTH 10,
        "! Vendrbatch
        vendrbatch                 TYPE c LENGTH 15,
        "! Calctype
        calctype                   TYPE c LENGTH 1,
        "! GrantNbr
        grant_nbr                  TYPE c LENGTH 20,
        "! CmmtItemLong
        cmmt_item_long             TYPE c LENGTH 24,
        "! FuncAreaLong
        func_area_long             TYPE c LENGTH 16,
        "! NoRounding
        no_rounding                TYPE abap_bool,
        "! PoPrice
        po_price                   TYPE c LENGTH 1,
        "! SupplStloc
        suppl_stloc                TYPE c LENGTH 4,
        "! SrvBasedIv
        srv_based_iv               TYPE abap_bool,
        "! FundsRes
        funds_res                  TYPE c LENGTH 10,
        "! ResItem
        res_item                   TYPE c LENGTH 3,
        "! OrigAccept
        orig_accept                TYPE abap_bool,
        "! AllocTbl
        alloc_tbl                  TYPE c LENGTH 10,
        "! AllocTblItem
        alloc_tbl_item             TYPE c LENGTH 5,
        "! SrcStockType
        src_stock_type             TYPE c LENGTH 1,
        "! ReasonRej
        reason_rej                 TYPE c LENGTH 2,
        "! CrmSalesOrderNo
        crm_sales_order_no         TYPE c LENGTH 10,
        "! CrmSalesOrderItemNo
        crm_sales_order_item_no    TYPE c LENGTH 6,
        "! CrmRefSalesOrderNo
        crm_ref_sales_order_no     TYPE c LENGTH 35,
        "! CrmRefSoItemNo
        crm_ref_so_item_no         TYPE c LENGTH 6,
        "! PrioUrgency
        prio_urgency               TYPE c LENGTH 2,
        "! PrioRequirement
        prio_requirement           TYPE c LENGTH 3,
        "! ReasonCode
        reason_code                TYPE c LENGTH 4,
        "! FundLong
        fund_long                  TYPE c LENGTH 20,
        "! LongItemNumber
        long_item_number           TYPE c LENGTH 40,
        "! ExternalSortNumber
        external_sort_number       TYPE c LENGTH 5,
        "! ExternalHierarchyType
        external_hierarchy_type    TYPE c LENGTH 4,
        "! RetentionPercentage
        retention_percentage       TYPE p LENGTH 3 DECIMALS 2,
        "! DownpayType
        downpay_type               TYPE c LENGTH 4,
        "! DownpayAmount
        downpay_amount             TYPE p LENGTH 12 DECIMALS 4,
        "! DownpayPercent
        downpay_percent            TYPE p LENGTH 3 DECIMALS 2,
        "! DownpayDuedate
        downpay_duedate            TYPE timestampl,
        "! ExtRfxNumber
        ext_rfx_number             TYPE c LENGTH 35,
        "! ExtRfxItem
        ext_rfx_item               TYPE c LENGTH 10,
        "! ExtRfxSystem
        ext_rfx_system             TYPE c LENGTH 10,
        "! SrmContractId
        srm_contract_id            TYPE c LENGTH 10,
        "! SrmContractItm
        srm_contract_itm           TYPE c LENGTH 10,
        "! BudgetPeriod
        budget_period              TYPE c LENGTH 10,
        "! BlockReasonId
        block_reason_id            TYPE c LENGTH 4,
        "! BlockReasonText
        block_reason_text          TYPE c LENGTH 40,
        "! SpeCrmFkrel
        spe_crm_fkrel              TYPE c LENGTH 1,
        "! DateQtyFixed
        date_qty_fixed             TYPE c LENGTH 1,
        "! GiBasedGr
        gi_based_gr                TYPE abap_bool,
        "! Shiptype
        shiptype                   TYPE c LENGTH 2,
        "! Handoverloc
        handoverloc                TYPE c LENGTH 10,
        "! TcAutDet
        tc_aut_det                 TYPE c LENGTH 2,
        "! ManualTcReason
        manual_tc_reason           TYPE c LENGTH 2,
        "! FiscalIncentive
        fiscal_incentive           TYPE c LENGTH 4,
        "! FiscalIncentiveId
        fiscal_incentive_id        TYPE c LENGTH 4,
        "! TaxSubjectSt
        tax_subject_st             TYPE c LENGTH 1,
        "! ReqSegment
        req_segment                TYPE c LENGTH 16,
        "! StkSegment
        stk_segment                TYPE c LENGTH 16,
        "! SfTxjcd
        sf_txjcd                   TYPE c LENGTH 15,
        "! Incoterms2l
        incoterms_2_l              TYPE c LENGTH 70,
        "! Incoterms3l
        incoterms_3_l              TYPE c LENGTH 70,
        "! MaterialLong
        material_long              TYPE c LENGTH 40,
        "! EmaterialLong
        ematerial_long             TYPE c LENGTH 40,
        "! Serviceperformer
        serviceperformer           TYPE c LENGTH 10,
        "! Producttype
        producttype                TYPE c LENGTH 2,
        "! Startdate
        startdate                  TYPE timestampl,
        "! Enddate
        enddate                    TYPE timestampl,
        "! ReqSegLong
        req_seg_long               TYPE c LENGTH 40,
        "! StkSegLong
        stk_seg_long               TYPE c LENGTH 40,
        "! ExpectedValue
        expected_value             TYPE p LENGTH 15 DECIMALS 9,
        "! LimitAmount
        limit_amount               TYPE p LENGTH 15 DECIMALS 9,
        "! ExtRef
        ext_ref                    TYPE c LENGTH 70,
        "! GlAccount
        gl_account                 TYPE c LENGTH 10,
        "! Costcenter
        costcenter                 TYPE c LENGTH 10,
        "! WbsElement
        wbs_element                TYPE c LENGTH 24,
        "! CommodityCode
        commodity_code             TYPE c LENGTH 30,
        "! IntrastatServiceCode
        intrastat_service_code     TYPE c LENGTH 30,
        "! ContractForLimit
        contract_for_limit         TYPE c LENGTH 10,
        "! Taxcalcdate
        taxcalcdate                TYPE timestampl,
        "! Taxcountry
        taxcountry                 TYPE c LENGTH 3,
        "! StatusPcs
        status_pcs                 TYPE c LENGTH 1,
        "! StatusPma
        status_pma                 TYPE c LENGTH 1,
        "! StatusDg
        status_dg                  TYPE c LENGTH 1,
        "! StatusSds
        status_sds                 TYPE c LENGTH 1,
        "! TxsBusinessTransaction
        txs_business_transaction   TYPE c LENGTH 4,
        "! TxsUsagePurpose
        txs_usage_purpose          TYPE c LENGTH 25,
      END OF tys_item,
      "! <p class="shorttext synchronized">List of item</p>
      tyt_item TYPE STANDARD TABLE OF tys_item WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">itemx</p>
      BEGIN OF tys_itemx,
        "! <em>Key property</em> Ebeln
        ebeln                      TYPE string,
        "! PoItem
        po_item                    TYPE c LENGTH 5,
        "! PoItemx
        po_itemx                   TYPE c LENGTH 1,
        "! DeleteInd
        delete_ind                 TYPE c LENGTH 1,
        "! ShortText
        short_text                 TYPE c LENGTH 1,
        "! Material
        material                   TYPE c LENGTH 1,
        "! MaterialExternal
        material_external          TYPE c LENGTH 1,
        "! MaterialGuid
        material_guid              TYPE c LENGTH 1,
        "! MaterialVersion
        material_version           TYPE c LENGTH 1,
        "! Ematerial
        ematerial                  TYPE c LENGTH 1,
        "! EmaterialExternal
        ematerial_external         TYPE c LENGTH 1,
        "! EmaterialGuid
        ematerial_guid             TYPE c LENGTH 1,
        "! EmaterialVersion
        ematerial_version          TYPE c LENGTH 1,
        "! Plant
        plant                      TYPE c LENGTH 1,
        "! StgeLoc
        stge_loc                   TYPE c LENGTH 1,
        "! Trackingno
        trackingno                 TYPE c LENGTH 1,
        "! MatlGroup
        matl_group                 TYPE c LENGTH 1,
        "! InfoRec
        info_rec                   TYPE c LENGTH 1,
        "! VendMat
        vend_mat                   TYPE c LENGTH 1,
        "! Quantity
        quantity                   TYPE c LENGTH 1,
        "! PoUnit
        po_unit                    TYPE c LENGTH 1,
        "! PoUnitIso
        po_unit_iso                TYPE c LENGTH 1,
        "! OrderprUn
        orderpr_un                 TYPE c LENGTH 1,
        "! OrderprUnIso
        orderpr_un_iso             TYPE c LENGTH 1,
        "! ConvNum1
        conv_num_1                 TYPE c LENGTH 1,
        "! ConvDen1
        conv_den_1                 TYPE c LENGTH 1,
        "! NetPrice
        net_price                  TYPE c LENGTH 1,
        "! PriceUnit
        price_unit                 TYPE c LENGTH 1,
        "! GrPrTime
        gr_pr_time                 TYPE c LENGTH 1,
        "! TaxCode
        tax_code                   TYPE c LENGTH 1,
        "! BonGrp1
        bon_grp_1                  TYPE c LENGTH 1,
        "! QualInsp
        qual_insp                  TYPE c LENGTH 1,
        "! InfoUpd
        info_upd                   TYPE c LENGTH 1,
        "! PrntPrice
        prnt_price                 TYPE c LENGTH 1,
        "! EstPrice
        est_price                  TYPE c LENGTH 1,
        "! Reminder1
        reminder_1                 TYPE c LENGTH 1,
        "! Reminder2
        reminder_2                 TYPE c LENGTH 1,
        "! Reminder3
        reminder_3                 TYPE c LENGTH 1,
        "! OverDlvTol
        over_dlv_tol               TYPE c LENGTH 1,
        "! UnlimitedDlv
        unlimited_dlv              TYPE c LENGTH 1,
        "! UnderDlvTol
        under_dlv_tol              TYPE c LENGTH 1,
        "! ValType
        val_type                   TYPE c LENGTH 1,
        "! NoMoreGr
        no_more_gr                 TYPE c LENGTH 1,
        "! FinalInv
        final_inv                  TYPE c LENGTH 1,
        "! ItemCat
        item_cat                   TYPE c LENGTH 1,
        "! Acctasscat
        acctasscat                 TYPE c LENGTH 1,
        "! Distrib
        distrib                    TYPE c LENGTH 1,
        "! PartInv
        part_inv                   TYPE c LENGTH 1,
        "! GrInd
        gr_ind                     TYPE c LENGTH 1,
        "! GrNonVal
        gr_non_val                 TYPE c LENGTH 1,
        "! IrInd
        ir_ind                     TYPE c LENGTH 1,
        "! FreeItem
        free_item                  TYPE c LENGTH 1,
        "! GrBasediv
        gr_basediv                 TYPE c LENGTH 1,
        "! AcknReqd
        ackn_reqd                  TYPE c LENGTH 1,
        "! AcknowlNo
        acknowl_no                 TYPE c LENGTH 1,
        "! Agreement
        agreement                  TYPE c LENGTH 1,
        "! AgmtItem
        agmt_item                  TYPE c LENGTH 1,
        "! Shipping
        shipping                   TYPE c LENGTH 1,
        "! Customer
        customer                   TYPE c LENGTH 1,
        "! CondGroup
        cond_group                 TYPE c LENGTH 1,
        "! NoDisct
        no_disct                   TYPE c LENGTH 1,
        "! PlanDel
        plan_del                   TYPE c LENGTH 1,
        "! NetWeight
        net_weight                 TYPE c LENGTH 1,
        "! Weightunit
        weightunit                 TYPE c LENGTH 1,
        "! WeightunitIso
        weightunit_iso             TYPE c LENGTH 1,
        "! Taxjurcode
        taxjurcode                 TYPE c LENGTH 1,
        "! CtrlKey
        ctrl_key                   TYPE c LENGTH 1,
        "! ConfCtrl
        conf_ctrl                  TYPE c LENGTH 1,
        "! RevLev
        rev_lev                    TYPE c LENGTH 1,
        "! Fund
        fund                       TYPE c LENGTH 1,
        "! FundsCtr
        funds_ctr                  TYPE c LENGTH 1,
        "! CmmtItem
        cmmt_item                  TYPE c LENGTH 1,
        "! Pricedate
        pricedate                  TYPE c LENGTH 1,
        "! PriceDate
        price_date                 TYPE c LENGTH 1,
        "! GrossWt
        gross_wt                   TYPE c LENGTH 1,
        "! Volume
        volume                     TYPE c LENGTH 1,
        "! Volumeunit
        volumeunit                 TYPE c LENGTH 1,
        "! VolumeunitIso
        volumeunit_iso             TYPE c LENGTH 1,
        "! Incoterms1
        incoterms_1                TYPE c LENGTH 1,
        "! Incoterms2
        incoterms_2                TYPE c LENGTH 1,
        "! PreVendor
        pre_vendor                 TYPE c LENGTH 1,
        "! VendPart
        vend_part                  TYPE c LENGTH 1,
        "! HlItem
        hl_item                    TYPE c LENGTH 1,
        "! GrToDate
        gr_to_date                 TYPE c LENGTH 1,
        "! SuppVendor
        supp_vendor                TYPE c LENGTH 1,
        "! ScVendor
        sc_vendor                  TYPE c LENGTH 1,
        "! KanbanInd
        kanban_ind                 TYPE c LENGTH 1,
        "! Ers
        ers                        TYPE c LENGTH 1,
        "! RPromo
        rpromo                     TYPE c LENGTH 1,
        "! Points
        points                     TYPE c LENGTH 1,
        "! PointUnit
        point_unit                 TYPE c LENGTH 1,
        "! PointUnitIso
        point_unit_iso             TYPE c LENGTH 1,
        "! Season
        season                     TYPE c LENGTH 1,
        "! SeasonYr
        season_yr                  TYPE c LENGTH 1,
        "! BonGrp2
        bon_grp_2                  TYPE c LENGTH 1,
        "! BonGrp3
        bon_grp_3                  TYPE c LENGTH 1,
        "! SettItem
        sett_item                  TYPE c LENGTH 1,
        "! Minremlife
        minremlife                 TYPE c LENGTH 1,
        "! RfqNo
        rfq_no                     TYPE c LENGTH 1,
        "! RfqItem
        rfq_item                   TYPE c LENGTH 1,
        "! PreqNo
        preq_no                    TYPE c LENGTH 1,
        "! PreqItem
        preq_item                  TYPE c LENGTH 1,
        "! RefDoc
        ref_doc                    TYPE c LENGTH 1,
        "! RefItem
        ref_item                   TYPE c LENGTH 1,
        "! SiCat
        si_cat                     TYPE c LENGTH 1,
        "! RetItem
        ret_item                   TYPE c LENGTH 1,
        "! AtRelev
        at_relev                   TYPE c LENGTH 1,
        "! OrderReason
        order_reason               TYPE c LENGTH 1,
        "! BrasNbm
        bras_nbm                   TYPE c LENGTH 1,
        "! MatlUsage
        matl_usage                 TYPE c LENGTH 1,
        "! MatOrigin
        mat_origin                 TYPE c LENGTH 1,
        "! InHouse
        in_house                   TYPE c LENGTH 1,
        "! Indus3
        indus_3                    TYPE c LENGTH 1,
        "! InfIndex
        inf_index                  TYPE c LENGTH 1,
        "! UntilDate
        until_date                 TYPE c LENGTH 1,
        "! DelivCompl
        deliv_compl                TYPE c LENGTH 1,
        "! PartDeliv
        part_deliv                 TYPE c LENGTH 1,
        "! ShipBlocked
        ship_blocked               TYPE c LENGTH 1,
        "! PreqName
        preq_name                  TYPE c LENGTH 1,
        "! PeriodIndExpirationDate
        period_ind_expiration_date TYPE c LENGTH 1,
        "! IntObjNo
        int_obj_no                 TYPE c LENGTH 1,
        "! PckgNo
        pckg_no                    TYPE c LENGTH 1,
        "! Batch
        batch                      TYPE c LENGTH 1,
        "! Vendrbatch
        vendrbatch                 TYPE c LENGTH 1,
        "! Calctype
        calctype                   TYPE c LENGTH 1,
        "! NoRounding
        no_rounding                TYPE c LENGTH 1,
        "! PoPrice
        po_price                   TYPE c LENGTH 1,
        "! SupplStloc
        suppl_stloc                TYPE c LENGTH 1,
        "! SrvBasedIv
        srv_based_iv               TYPE c LENGTH 1,
        "! FundsRes
        funds_res                  TYPE c LENGTH 1,
        "! ResItem
        res_item                   TYPE c LENGTH 1,
        "! GrantNbr
        grant_nbr                  TYPE c LENGTH 1,
        "! FuncAreaLong
        func_area_long             TYPE c LENGTH 1,
        "! OrigAccept
        orig_accept                TYPE c LENGTH 1,
        "! AllocTbl
        alloc_tbl                  TYPE c LENGTH 1,
        "! AllocTblItem
        alloc_tbl_item             TYPE c LENGTH 1,
        "! SrcStockType
        src_stock_type             TYPE c LENGTH 1,
        "! ReasonRej
        reason_rej                 TYPE c LENGTH 1,
        "! CrmSalesOrderNo
        crm_sales_order_no         TYPE c LENGTH 1,
        "! CrmSalesOrderItemNo
        crm_sales_order_item_no    TYPE c LENGTH 1,
        "! CrmRefSalesOrderNo
        crm_ref_sales_order_no     TYPE c LENGTH 1,
        "! CrmRefSoItemNo
        crm_ref_so_item_no         TYPE c LENGTH 1,
        "! PrioUrgency
        prio_urgency               TYPE c LENGTH 1,
        "! PrioRequirement
        prio_requirement           TYPE c LENGTH 1,
        "! ReasonCode
        reason_code                TYPE c LENGTH 1,
        "! LongItemNumber
        long_item_number           TYPE c LENGTH 1,
        "! ExternalSortNumber
        external_sort_number       TYPE c LENGTH 1,
        "! ExternalHierarchyType
        external_hierarchy_type    TYPE c LENGTH 1,
        "! RetentionPercentage
        retention_percentage       TYPE c LENGTH 1,
        "! DownpayType
        downpay_type               TYPE c LENGTH 1,
        "! DownpayAmount
        downpay_amount             TYPE c LENGTH 1,
        "! DownpayPercent
        downpay_percent            TYPE c LENGTH 1,
        "! DownpayDuedate
        downpay_duedate            TYPE c LENGTH 1,
        "! ExtRfxNumber
        ext_rfx_number             TYPE c LENGTH 1,
        "! ExtRfxItem
        ext_rfx_item               TYPE c LENGTH 1,
        "! ExtRfxSystem
        ext_rfx_system             TYPE c LENGTH 1,
        "! SrmContractId
        srm_contract_id            TYPE c LENGTH 1,
        "! SrmContractItm
        srm_contract_itm           TYPE c LENGTH 1,
        "! BudgetPeriod
        budget_period              TYPE c LENGTH 1,
        "! BlockReasonId
        block_reason_id            TYPE c LENGTH 1,
        "! BlockReasonText
        block_reason_text          TYPE c LENGTH 1,
        "! SpeCrmFkrel
        spe_crm_fkrel              TYPE c LENGTH 1,
        "! DateQtyFixed
        date_qty_fixed             TYPE c LENGTH 1,
        "! GiBasedGr
        gi_based_gr                TYPE c LENGTH 1,
        "! Shiptype
        shiptype                   TYPE c LENGTH 1,
        "! Handoverloc
        handoverloc                TYPE c LENGTH 1,
        "! TcAutDet
        tc_aut_det                 TYPE c LENGTH 1,
        "! ManualTcReason
        manual_tc_reason           TYPE c LENGTH 1,
        "! FiscalIncentive
        fiscal_incentive           TYPE c LENGTH 1,
        "! FiscalIncentiveId
        fiscal_incentive_id        TYPE c LENGTH 1,
        "! TaxSubjectSt
        tax_subject_st             TYPE c LENGTH 1,
        "! ReqSegment
        req_segment                TYPE c LENGTH 1,
        "! StkSegment
        stk_segment                TYPE c LENGTH 1,
        "! SfTxjcd
        sf_txjcd                   TYPE c LENGTH 1,
        "! Incoterms2l
        incoterms_2_l              TYPE c LENGTH 1,
        "! Incoterms3l
        incoterms_3_l              TYPE c LENGTH 1,
        "! MaterialLong
        material_long              TYPE c LENGTH 1,
        "! EmaterialLong
        ematerial_long             TYPE c LENGTH 1,
        "! Serviceperformer
        serviceperformer           TYPE c LENGTH 1,
        "! Producttype
        producttype                TYPE c LENGTH 1,
        "! Startdate
        startdate                  TYPE c LENGTH 1,
        "! Enddate
        enddate                    TYPE c LENGTH 1,
        "! ReqSegLong
        req_seg_long               TYPE c LENGTH 1,
        "! StkSegLong
        stk_seg_long               TYPE c LENGTH 1,
        "! ExpectedValue
        expected_value             TYPE c LENGTH 1,
        "! LimitAmount
        limit_amount               TYPE c LENGTH 1,
        "! ExtRef
        ext_ref                    TYPE c LENGTH 1,
        "! GlAccount
        gl_account                 TYPE c LENGTH 1,
        "! Costcenter
        costcenter                 TYPE c LENGTH 1,
        "! WbsElement
        wbs_element                TYPE c LENGTH 1,
        "! CommodityCode
        commodity_code             TYPE c LENGTH 1,
        "! IntrastatServiceCode
        intrastat_service_code     TYPE c LENGTH 1,
        "! ContractForLimit
        contract_for_limit         TYPE c LENGTH 1,
        "! Taxcalcdate
        taxcalcdate                TYPE c LENGTH 1,
        "! Taxcountry
        taxcountry                 TYPE c LENGTH 1,
        "! TxsBusinessTransaction
        txs_business_transaction   TYPE c LENGTH 1,
        "! TxsUsagePurpose
        txs_usage_purpose          TYPE c LENGTH 1,
      END OF tys_itemx,
      "! <p class="shorttext synchronized">List of itemx</p>
      tyt_itemx TYPE STANDARD TABLE OF tys_itemx WITH DEFAULT KEY.

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

    TYPES: BEGIN OF ty_deep,
             ebeln            TYPE string,
             headertoitemnav  TYPE TABLE OF tys_item WITH DEFAULT KEY,
             headertoitemxnav TYPE TABLE OF tys_itemx WITH DEFAULT KEY,
             headertoreturn   TYPE TABLE OF tys_return WITH DEFAULT KEY,
           END OF ty_deep.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! headerSet
        "! <br/> Collection of type 'header'
        header_set TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'HEADER_SET',
        "! itemxSet
        "! <br/> Collection of type 'itemx'
        itemx_set  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'ITEMX_SET',
        "! itemSet
        "! <br/> Collection of type 'item'
        item_set   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'ITEM_SET',
        "! returnSet
        "! <br/> Collection of type 'return'
        return_set TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'RETURN_SET',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for header</p>
        "! See also structure type {@link ..tys_header}
        BEGIN OF header,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! HEADERTOITEMNAV
            headertoitemnav  TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOITEMNAV',
            "! HEADERTOITEMXNAV
            headertoitemxnav TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOITEMXNAV',
            "! HEADERTORETURN
            headertoreturn   TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTORETURN',
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
        "! <p class="shorttext synchronized">Internal names for itemx</p>
        "! See also structure type {@link ..tys_itemx}
        BEGIN OF itemx,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF itemx,
        "! <p class="shorttext synchronized">Internal names for return</p>
        "! See also structure type {@link ..tys_return}
        BEGIN OF return,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF return,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define header</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_header RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define item</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_item RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define itemx</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_itemx RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define return</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_return RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSCM_BAPI_PO_CHANGE IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'ZFM_BAPI_PO_CHANGE_SRV' ) ##NO_TEXT.

    def_header( ).
    def_item( ).
    def_itemx( ).
    def_return( ).

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


    lo_primitive_property = lo_entity_type->get_primitive_property( 'EBELN' ).
    lo_primitive_property->set_edm_name( 'Ebeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOITEMNAV' ).
    lo_navigation_property->set_edm_name( 'HEADERTOITEMNAV' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'ITEM' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOITEMXNAV' ).
    lo_navigation_property->set_edm_name( 'HEADERTOITEMXNAV' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'ITEMX' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTORETURN' ).
    lo_navigation_property->set_edm_name( 'HEADERTORETURN' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'RETURN' ).
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


    lo_primitive_property = lo_entity_type->get_primitive_property( 'EBELN' ).
    lo_primitive_property->set_edm_name( 'Ebeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_ITEM' ).
    lo_primitive_property->set_edm_name( 'PoItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELETE_IND' ).
    lo_primitive_property->set_edm_name( 'DeleteInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHORT_TEXT' ).
    lo_primitive_property->set_edm_name( 'ShortText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL' ).
    lo_primitive_property->set_edm_name( 'Material' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_EXTERNAL' ).
    lo_primitive_property->set_edm_name( 'MaterialExternal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_GUID' ).
    lo_primitive_property->set_edm_name( 'MaterialGuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_VERSION' ).
    lo_primitive_property->set_edm_name( 'MaterialVersion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMATERIAL' ).
    lo_primitive_property->set_edm_name( 'Ematerial' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMATERIAL_EXTERNAL' ).
    lo_primitive_property->set_edm_name( 'EmaterialExternal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMATERIAL_GUID' ).
    lo_primitive_property->set_edm_name( 'EmaterialGuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMATERIAL_VERSION' ).
    lo_primitive_property->set_edm_name( 'EmaterialVersion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANT' ).
    lo_primitive_property->set_edm_name( 'Plant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STGE_LOC' ).
    lo_primitive_property->set_edm_name( 'StgeLoc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRACKINGNO' ).
    lo_primitive_property->set_edm_name( 'Trackingno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATL_GROUP' ).
    lo_primitive_property->set_edm_name( 'MatlGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 9 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INFO_REC' ).
    lo_primitive_property->set_edm_name( 'InfoRec' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VEND_MAT' ).
    lo_primitive_property->set_edm_name( 'VendMat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDERPR_UN' ).
    lo_primitive_property->set_edm_name( 'OrderprUn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDERPR_UN_ISO' ).
    lo_primitive_property->set_edm_name( 'OrderprUnIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONV_NUM_1' ).
    lo_primitive_property->set_edm_name( 'ConvNum1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONV_DEN_1' ).
    lo_primitive_property->set_edm_name( 'ConvDen1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_PRICE' ).
    lo_primitive_property->set_edm_name( 'NetPrice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 28 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICE_UNIT' ).
    lo_primitive_property->set_edm_name( 'PriceUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GR_PR_TIME' ).
    lo_primitive_property->set_edm_name( 'GrPrTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BON_GRP_1' ).
    lo_primitive_property->set_edm_name( 'BonGrp1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUAL_INSP' ).
    lo_primitive_property->set_edm_name( 'QualInsp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INFO_UPD' ).
    lo_primitive_property->set_edm_name( 'InfoUpd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRNT_PRICE' ).
    lo_primitive_property->set_edm_name( 'PrntPrice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EST_PRICE' ).
    lo_primitive_property->set_edm_name( 'EstPrice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REMINDER_1' ).
    lo_primitive_property->set_edm_name( 'Reminder1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REMINDER_2' ).
    lo_primitive_property->set_edm_name( 'Reminder2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REMINDER_3' ).
    lo_primitive_property->set_edm_name( 'Reminder3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVER_DLV_TOL' ).
    lo_primitive_property->set_edm_name( 'OverDlvTol' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNLIMITED_DLV' ).
    lo_primitive_property->set_edm_name( 'UnlimitedDlv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNDER_DLV_TOL' ).
    lo_primitive_property->set_edm_name( 'UnderDlvTol' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAL_TYPE' ).
    lo_primitive_property->set_edm_name( 'ValType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NO_MORE_GR' ).
    lo_primitive_property->set_edm_name( 'NoMoreGr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FINAL_INV' ).
    lo_primitive_property->set_edm_name( 'FinalInv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_CAT' ).
    lo_primitive_property->set_edm_name( 'ItemCat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCTASSCAT' ).
    lo_primitive_property->set_edm_name( 'Acctasscat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISTRIB' ).
    lo_primitive_property->set_edm_name( 'Distrib' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PART_INV' ).
    lo_primitive_property->set_edm_name( 'PartInv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GR_IND' ).
    lo_primitive_property->set_edm_name( 'GrInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GR_NON_VAL' ).
    lo_primitive_property->set_edm_name( 'GrNonVal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IR_IND' ).
    lo_primitive_property->set_edm_name( 'IrInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FREE_ITEM' ).
    lo_primitive_property->set_edm_name( 'FreeItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GR_BASEDIV' ).
    lo_primitive_property->set_edm_name( 'GrBasediv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACKN_REQD' ).
    lo_primitive_property->set_edm_name( 'AcknReqd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACKNOWL_NO' ).
    lo_primitive_property->set_edm_name( 'AcknowlNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AGREEMENT' ).
    lo_primitive_property->set_edm_name( 'Agreement' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AGMT_ITEM' ).
    lo_primitive_property->set_edm_name( 'AgmtItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHIPPING' ).
    lo_primitive_property->set_edm_name( 'Shipping' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER' ).
    lo_primitive_property->set_edm_name( 'Customer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COND_GROUP' ).
    lo_primitive_property->set_edm_name( 'CondGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NO_DISCT' ).
    lo_primitive_property->set_edm_name( 'NoDisct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLAN_DEL' ).
    lo_primitive_property->set_edm_name( 'PlanDel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_WEIGHT' ).
    lo_primitive_property->set_edm_name( 'NetWeight' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEIGHTUNIT' ).
    lo_primitive_property->set_edm_name( 'Weightunit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEIGHTUNIT_ISO' ).
    lo_primitive_property->set_edm_name( 'WeightunitIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXJURCODE' ).
    lo_primitive_property->set_edm_name( 'Taxjurcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CTRL_KEY' ).
    lo_primitive_property->set_edm_name( 'CtrlKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONF_CTRL' ).
    lo_primitive_property->set_edm_name( 'ConfCtrl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REV_LEV' ).
    lo_primitive_property->set_edm_name( 'RevLev' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUND' ).
    lo_primitive_property->set_edm_name( 'Fund' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNDS_CTR' ).
    lo_primitive_property->set_edm_name( 'FundsCtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMMT_ITEM' ).
    lo_primitive_property->set_edm_name( 'CmmtItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICEDATE' ).
    lo_primitive_property->set_edm_name( 'Pricedate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICE_DATE' ).
    lo_primitive_property->set_edm_name( 'PriceDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GROSS_WT' ).
    lo_primitive_property->set_edm_name( 'GrossWt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLUME' ).
    lo_primitive_property->set_edm_name( 'Volume' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLUMEUNIT' ).
    lo_primitive_property->set_edm_name( 'Volumeunit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLUMEUNIT_ISO' ).
    lo_primitive_property->set_edm_name( 'VolumeunitIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_1' ).
    lo_primitive_property->set_edm_name( 'Incoterms1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_2' ).
    lo_primitive_property->set_edm_name( 'Incoterms2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 28 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRE_VENDOR' ).
    lo_primitive_property->set_edm_name( 'PreVendor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VEND_PART' ).
    lo_primitive_property->set_edm_name( 'VendPart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HL_ITEM' ).
    lo_primitive_property->set_edm_name( 'HlItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GR_TO_DATE' ).
    lo_primitive_property->set_edm_name( 'GrToDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPP_VENDOR' ).
    lo_primitive_property->set_edm_name( 'SuppVendor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SC_VENDOR' ).
    lo_primitive_property->set_edm_name( 'ScVendor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KANBAN_IND' ).
    lo_primitive_property->set_edm_name( 'KanbanInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERS' ).
    lo_primitive_property->set_edm_name( 'Ers' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RPROMO' ).
    lo_primitive_property->set_edm_name( 'RPromo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POINTS' ).
    lo_primitive_property->set_edm_name( 'Points' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POINT_UNIT' ).
    lo_primitive_property->set_edm_name( 'PointUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POINT_UNIT_ISO' ).
    lo_primitive_property->set_edm_name( 'PointUnitIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SEASON' ).
    lo_primitive_property->set_edm_name( 'Season' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SEASON_YR' ).
    lo_primitive_property->set_edm_name( 'SeasonYr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BON_GRP_2' ).
    lo_primitive_property->set_edm_name( 'BonGrp2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BON_GRP_3' ).
    lo_primitive_property->set_edm_name( 'BonGrp3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SETT_ITEM' ).
    lo_primitive_property->set_edm_name( 'SettItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MINREMLIFE' ).
    lo_primitive_property->set_edm_name( 'Minremlife' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFQ_NO' ).
    lo_primitive_property->set_edm_name( 'RfqNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFQ_ITEM' ).
    lo_primitive_property->set_edm_name( 'RfqItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PREQ_NO' ).
    lo_primitive_property->set_edm_name( 'PreqNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PREQ_ITEM' ).
    lo_primitive_property->set_edm_name( 'PreqItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_DOC' ).
    lo_primitive_property->set_edm_name( 'RefDoc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_ITEM' ).
    lo_primitive_property->set_edm_name( 'RefItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SI_CAT' ).
    lo_primitive_property->set_edm_name( 'SiCat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RET_ITEM' ).
    lo_primitive_property->set_edm_name( 'RetItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AT_RELEV' ).
    lo_primitive_property->set_edm_name( 'AtRelev' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_REASON' ).
    lo_primitive_property->set_edm_name( 'OrderReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRAS_NBM' ).
    lo_primitive_property->set_edm_name( 'BrasNbm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATL_USAGE' ).
    lo_primitive_property->set_edm_name( 'MatlUsage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAT_ORIGIN' ).
    lo_primitive_property->set_edm_name( 'MatOrigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IN_HOUSE' ).
    lo_primitive_property->set_edm_name( 'InHouse' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INDUS_3' ).
    lo_primitive_property->set_edm_name( 'Indus3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INF_INDEX' ).
    lo_primitive_property->set_edm_name( 'InfIndex' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNTIL_DATE' ).
    lo_primitive_property->set_edm_name( 'UntilDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIV_COMPL' ).
    lo_primitive_property->set_edm_name( 'DelivCompl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PART_DELIV' ).
    lo_primitive_property->set_edm_name( 'PartDeliv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHIP_BLOCKED' ).
    lo_primitive_property->set_edm_name( 'ShipBlocked' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PREQ_NAME' ).
    lo_primitive_property->set_edm_name( 'PreqName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERIOD_IND_EXPIRATION_DATE' ).
    lo_primitive_property->set_edm_name( 'PeriodIndExpirationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INT_OBJ_NO' ).
    lo_primitive_property->set_edm_name( 'IntObjNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PCKG_NO' ).
    lo_primitive_property->set_edm_name( 'PckgNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BATCH' ).
    lo_primitive_property->set_edm_name( 'Batch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VENDRBATCH' ).
    lo_primitive_property->set_edm_name( 'Vendrbatch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CALCTYPE' ).
    lo_primitive_property->set_edm_name( 'Calctype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NO_ROUNDING' ).
    lo_primitive_property->set_edm_name( 'NoRounding' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_PRICE' ).
    lo_primitive_property->set_edm_name( 'PoPrice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPL_STLOC' ).
    lo_primitive_property->set_edm_name( 'SupplStloc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SRV_BASED_IV' ).
    lo_primitive_property->set_edm_name( 'SrvBasedIv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNDS_RES' ).
    lo_primitive_property->set_edm_name( 'FundsRes' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RES_ITEM' ).
    lo_primitive_property->set_edm_name( 'ResItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORIG_ACCEPT' ).
    lo_primitive_property->set_edm_name( 'OrigAccept' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALLOC_TBL' ).
    lo_primitive_property->set_edm_name( 'AllocTbl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALLOC_TBL_ITEM' ).
    lo_primitive_property->set_edm_name( 'AllocTblItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SRC_STOCK_TYPE' ).
    lo_primitive_property->set_edm_name( 'SrcStockType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REASON_REJ' ).
    lo_primitive_property->set_edm_name( 'ReasonRej' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CRM_SALES_ORDER_NO' ).
    lo_primitive_property->set_edm_name( 'CrmSalesOrderNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CRM_SALES_ORDER_ITEM_NO' ).
    lo_primitive_property->set_edm_name( 'CrmSalesOrderItemNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CRM_REF_SALES_ORDER_NO' ).
    lo_primitive_property->set_edm_name( 'CrmRefSalesOrderNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CRM_REF_SO_ITEM_NO' ).
    lo_primitive_property->set_edm_name( 'CrmRefSoItemNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRIO_URGENCY' ).
    lo_primitive_property->set_edm_name( 'PrioUrgency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRIO_REQUIREMENT' ).
    lo_primitive_property->set_edm_name( 'PrioRequirement' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REASON_CODE' ).
    lo_primitive_property->set_edm_name( 'ReasonCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUND_LONG' ).
    lo_primitive_property->set_edm_name( 'FundLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LONG_ITEM_NUMBER' ).
    lo_primitive_property->set_edm_name( 'LongItemNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTERNAL_SORT_NUMBER' ).
    lo_primitive_property->set_edm_name( 'ExternalSortNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTERNAL_HIERARCHY_TYPE' ).
    lo_primitive_property->set_edm_name( 'ExternalHierarchyType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETENTION_PERCENTAGE' ).
    lo_primitive_property->set_edm_name( 'RetentionPercentage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWNPAY_TYPE' ).
    lo_primitive_property->set_edm_name( 'DownpayType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWNPAY_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'DownpayAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWNPAY_PERCENT' ).
    lo_primitive_property->set_edm_name( 'DownpayPercent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWNPAY_DUEDATE' ).
    lo_primitive_property->set_edm_name( 'DownpayDuedate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_RFX_NUMBER' ).
    lo_primitive_property->set_edm_name( 'ExtRfxNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_RFX_ITEM' ).
    lo_primitive_property->set_edm_name( 'ExtRfxItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_RFX_SYSTEM' ).
    lo_primitive_property->set_edm_name( 'ExtRfxSystem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SRM_CONTRACT_ID' ).
    lo_primitive_property->set_edm_name( 'SrmContractId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SRM_CONTRACT_ITM' ).
    lo_primitive_property->set_edm_name( 'SrmContractItm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDGET_PERIOD' ).
    lo_primitive_property->set_edm_name( 'BudgetPeriod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLOCK_REASON_ID' ).
    lo_primitive_property->set_edm_name( 'BlockReasonId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLOCK_REASON_TEXT' ).
    lo_primitive_property->set_edm_name( 'BlockReasonText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_CRM_FKREL' ).
    lo_primitive_property->set_edm_name( 'SpeCrmFkrel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_QTY_FIXED' ).
    lo_primitive_property->set_edm_name( 'DateQtyFixed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GI_BASED_GR' ).
    lo_primitive_property->set_edm_name( 'GiBasedGr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHIPTYPE' ).
    lo_primitive_property->set_edm_name( 'Shiptype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HANDOVERLOC' ).
    lo_primitive_property->set_edm_name( 'Handoverloc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TC_AUT_DET' ).
    lo_primitive_property->set_edm_name( 'TcAutDet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MANUAL_TC_REASON' ).
    lo_primitive_property->set_edm_name( 'ManualTcReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_INCENTIVE' ).
    lo_primitive_property->set_edm_name( 'FiscalIncentive' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_INCENTIVE_ID' ).
    lo_primitive_property->set_edm_name( 'FiscalIncentiveId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_SUBJECT_ST' ).
    lo_primitive_property->set_edm_name( 'TaxSubjectSt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQ_SEGMENT' ).
    lo_primitive_property->set_edm_name( 'ReqSegment' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STK_SEGMENT' ).
    lo_primitive_property->set_edm_name( 'StkSegment' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SF_TXJCD' ).
    lo_primitive_property->set_edm_name( 'SfTxjcd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_2_L' ).
    lo_primitive_property->set_edm_name( 'Incoterms2l' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_3_L' ).
    lo_primitive_property->set_edm_name( 'Incoterms3l' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_LONG' ).
    lo_primitive_property->set_edm_name( 'MaterialLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMATERIAL_LONG' ).
    lo_primitive_property->set_edm_name( 'EmaterialLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICEPERFORMER' ).
    lo_primitive_property->set_edm_name( 'Serviceperformer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCTTYPE' ).
    lo_primitive_property->set_edm_name( 'Producttype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STARTDATE' ).
    lo_primitive_property->set_edm_name( 'Startdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENDDATE' ).
    lo_primitive_property->set_edm_name( 'Enddate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQ_SEG_LONG' ).
    lo_primitive_property->set_edm_name( 'ReqSegLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STK_SEG_LONG' ).
    lo_primitive_property->set_edm_name( 'StkSegLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXPECTED_VALUE' ).
    lo_primitive_property->set_edm_name( 'ExpectedValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 28 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIMIT_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'LimitAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 28 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_REF' ).
    lo_primitive_property->set_edm_name( 'ExtRef' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GL_ACCOUNT' ).
    lo_primitive_property->set_edm_name( 'GlAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COSTCENTER' ).
    lo_primitive_property->set_edm_name( 'Costcenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WBS_ELEMENT' ).
    lo_primitive_property->set_edm_name( 'WbsElement' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMMODITY_CODE' ).
    lo_primitive_property->set_edm_name( 'CommodityCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTRASTAT_SERVICE_CODE' ).
    lo_primitive_property->set_edm_name( 'IntrastatServiceCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTRACT_FOR_LIMIT' ).
    lo_primitive_property->set_edm_name( 'ContractForLimit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXCALCDATE' ).
    lo_primitive_property->set_edm_name( 'Taxcalcdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXCOUNTRY' ).
    lo_primitive_property->set_edm_name( 'Taxcountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STATUS_PCS' ).
    lo_primitive_property->set_edm_name( 'StatusPcs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STATUS_PMA' ).
    lo_primitive_property->set_edm_name( 'StatusPma' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STATUS_DG' ).
    lo_primitive_property->set_edm_name( 'StatusDg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STATUS_SDS' ).
    lo_primitive_property->set_edm_name( 'StatusSds' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXS_BUSINESS_TRANSACTION' ).
    lo_primitive_property->set_edm_name( 'TxsBusinessTransaction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXS_USAGE_PURPOSE' ).
    lo_primitive_property->set_edm_name( 'TxsUsagePurpose' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_itemx.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'ITEMX'
                                    is_structure              = VALUE tys_itemx( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'itemx' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'ITEMX_SET' ).
    lo_entity_set->set_edm_name( 'itemxSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'EBELN' ).
    lo_primitive_property->set_edm_name( 'Ebeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_ITEM' ).
    lo_primitive_property->set_edm_name( 'PoItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_ITEMX' ).
    lo_primitive_property->set_edm_name( 'PoItemx' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELETE_IND' ).
    lo_primitive_property->set_edm_name( 'DeleteInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHORT_TEXT' ).
    lo_primitive_property->set_edm_name( 'ShortText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL' ).
    lo_primitive_property->set_edm_name( 'Material' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_EXTERNAL' ).
    lo_primitive_property->set_edm_name( 'MaterialExternal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_GUID' ).
    lo_primitive_property->set_edm_name( 'MaterialGuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_VERSION' ).
    lo_primitive_property->set_edm_name( 'MaterialVersion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMATERIAL' ).
    lo_primitive_property->set_edm_name( 'Ematerial' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMATERIAL_EXTERNAL' ).
    lo_primitive_property->set_edm_name( 'EmaterialExternal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMATERIAL_GUID' ).
    lo_primitive_property->set_edm_name( 'EmaterialGuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMATERIAL_VERSION' ).
    lo_primitive_property->set_edm_name( 'EmaterialVersion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANT' ).
    lo_primitive_property->set_edm_name( 'Plant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STGE_LOC' ).
    lo_primitive_property->set_edm_name( 'StgeLoc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRACKINGNO' ).
    lo_primitive_property->set_edm_name( 'Trackingno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATL_GROUP' ).
    lo_primitive_property->set_edm_name( 'MatlGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INFO_REC' ).
    lo_primitive_property->set_edm_name( 'InfoRec' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VEND_MAT' ).
    lo_primitive_property->set_edm_name( 'VendMat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY' ).
    lo_primitive_property->set_edm_name( 'Quantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_UNIT' ).
    lo_primitive_property->set_edm_name( 'PoUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_UNIT_ISO' ).
    lo_primitive_property->set_edm_name( 'PoUnitIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDERPR_UN' ).
    lo_primitive_property->set_edm_name( 'OrderprUn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDERPR_UN_ISO' ).
    lo_primitive_property->set_edm_name( 'OrderprUnIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONV_NUM_1' ).
    lo_primitive_property->set_edm_name( 'ConvNum1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONV_DEN_1' ).
    lo_primitive_property->set_edm_name( 'ConvDen1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_PRICE' ).
    lo_primitive_property->set_edm_name( 'NetPrice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICE_UNIT' ).
    lo_primitive_property->set_edm_name( 'PriceUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GR_PR_TIME' ).
    lo_primitive_property->set_edm_name( 'GrPrTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BON_GRP_1' ).
    lo_primitive_property->set_edm_name( 'BonGrp1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUAL_INSP' ).
    lo_primitive_property->set_edm_name( 'QualInsp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INFO_UPD' ).
    lo_primitive_property->set_edm_name( 'InfoUpd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRNT_PRICE' ).
    lo_primitive_property->set_edm_name( 'PrntPrice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EST_PRICE' ).
    lo_primitive_property->set_edm_name( 'EstPrice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REMINDER_1' ).
    lo_primitive_property->set_edm_name( 'Reminder1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REMINDER_2' ).
    lo_primitive_property->set_edm_name( 'Reminder2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REMINDER_3' ).
    lo_primitive_property->set_edm_name( 'Reminder3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVER_DLV_TOL' ).
    lo_primitive_property->set_edm_name( 'OverDlvTol' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNLIMITED_DLV' ).
    lo_primitive_property->set_edm_name( 'UnlimitedDlv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNDER_DLV_TOL' ).
    lo_primitive_property->set_edm_name( 'UnderDlvTol' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAL_TYPE' ).
    lo_primitive_property->set_edm_name( 'ValType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NO_MORE_GR' ).
    lo_primitive_property->set_edm_name( 'NoMoreGr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FINAL_INV' ).
    lo_primitive_property->set_edm_name( 'FinalInv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_CAT' ).
    lo_primitive_property->set_edm_name( 'ItemCat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCTASSCAT' ).
    lo_primitive_property->set_edm_name( 'Acctasscat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISTRIB' ).
    lo_primitive_property->set_edm_name( 'Distrib' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PART_INV' ).
    lo_primitive_property->set_edm_name( 'PartInv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GR_IND' ).
    lo_primitive_property->set_edm_name( 'GrInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GR_NON_VAL' ).
    lo_primitive_property->set_edm_name( 'GrNonVal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IR_IND' ).
    lo_primitive_property->set_edm_name( 'IrInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FREE_ITEM' ).
    lo_primitive_property->set_edm_name( 'FreeItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GR_BASEDIV' ).
    lo_primitive_property->set_edm_name( 'GrBasediv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACKN_REQD' ).
    lo_primitive_property->set_edm_name( 'AcknReqd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACKNOWL_NO' ).
    lo_primitive_property->set_edm_name( 'AcknowlNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AGREEMENT' ).
    lo_primitive_property->set_edm_name( 'Agreement' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AGMT_ITEM' ).
    lo_primitive_property->set_edm_name( 'AgmtItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHIPPING' ).
    lo_primitive_property->set_edm_name( 'Shipping' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER' ).
    lo_primitive_property->set_edm_name( 'Customer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COND_GROUP' ).
    lo_primitive_property->set_edm_name( 'CondGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NO_DISCT' ).
    lo_primitive_property->set_edm_name( 'NoDisct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLAN_DEL' ).
    lo_primitive_property->set_edm_name( 'PlanDel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_WEIGHT' ).
    lo_primitive_property->set_edm_name( 'NetWeight' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEIGHTUNIT' ).
    lo_primitive_property->set_edm_name( 'Weightunit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEIGHTUNIT_ISO' ).
    lo_primitive_property->set_edm_name( 'WeightunitIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXJURCODE' ).
    lo_primitive_property->set_edm_name( 'Taxjurcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CTRL_KEY' ).
    lo_primitive_property->set_edm_name( 'CtrlKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONF_CTRL' ).
    lo_primitive_property->set_edm_name( 'ConfCtrl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REV_LEV' ).
    lo_primitive_property->set_edm_name( 'RevLev' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUND' ).
    lo_primitive_property->set_edm_name( 'Fund' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNDS_CTR' ).
    lo_primitive_property->set_edm_name( 'FundsCtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMMT_ITEM' ).
    lo_primitive_property->set_edm_name( 'CmmtItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICEDATE' ).
    lo_primitive_property->set_edm_name( 'Pricedate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICE_DATE' ).
    lo_primitive_property->set_edm_name( 'PriceDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GROSS_WT' ).
    lo_primitive_property->set_edm_name( 'GrossWt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLUME' ).
    lo_primitive_property->set_edm_name( 'Volume' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLUMEUNIT' ).
    lo_primitive_property->set_edm_name( 'Volumeunit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLUMEUNIT_ISO' ).
    lo_primitive_property->set_edm_name( 'VolumeunitIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_1' ).
    lo_primitive_property->set_edm_name( 'Incoterms1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_2' ).
    lo_primitive_property->set_edm_name( 'Incoterms2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRE_VENDOR' ).
    lo_primitive_property->set_edm_name( 'PreVendor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VEND_PART' ).
    lo_primitive_property->set_edm_name( 'VendPart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HL_ITEM' ).
    lo_primitive_property->set_edm_name( 'HlItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GR_TO_DATE' ).
    lo_primitive_property->set_edm_name( 'GrToDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPP_VENDOR' ).
    lo_primitive_property->set_edm_name( 'SuppVendor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SC_VENDOR' ).
    lo_primitive_property->set_edm_name( 'ScVendor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KANBAN_IND' ).
    lo_primitive_property->set_edm_name( 'KanbanInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERS' ).
    lo_primitive_property->set_edm_name( 'Ers' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RPROMO' ).
    lo_primitive_property->set_edm_name( 'RPromo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POINTS' ).
    lo_primitive_property->set_edm_name( 'Points' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POINT_UNIT' ).
    lo_primitive_property->set_edm_name( 'PointUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POINT_UNIT_ISO' ).
    lo_primitive_property->set_edm_name( 'PointUnitIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SEASON' ).
    lo_primitive_property->set_edm_name( 'Season' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SEASON_YR' ).
    lo_primitive_property->set_edm_name( 'SeasonYr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BON_GRP_2' ).
    lo_primitive_property->set_edm_name( 'BonGrp2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BON_GRP_3' ).
    lo_primitive_property->set_edm_name( 'BonGrp3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SETT_ITEM' ).
    lo_primitive_property->set_edm_name( 'SettItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MINREMLIFE' ).
    lo_primitive_property->set_edm_name( 'Minremlife' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFQ_NO' ).
    lo_primitive_property->set_edm_name( 'RfqNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFQ_ITEM' ).
    lo_primitive_property->set_edm_name( 'RfqItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PREQ_NO' ).
    lo_primitive_property->set_edm_name( 'PreqNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PREQ_ITEM' ).
    lo_primitive_property->set_edm_name( 'PreqItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_DOC' ).
    lo_primitive_property->set_edm_name( 'RefDoc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_ITEM' ).
    lo_primitive_property->set_edm_name( 'RefItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SI_CAT' ).
    lo_primitive_property->set_edm_name( 'SiCat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RET_ITEM' ).
    lo_primitive_property->set_edm_name( 'RetItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AT_RELEV' ).
    lo_primitive_property->set_edm_name( 'AtRelev' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_REASON' ).
    lo_primitive_property->set_edm_name( 'OrderReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRAS_NBM' ).
    lo_primitive_property->set_edm_name( 'BrasNbm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATL_USAGE' ).
    lo_primitive_property->set_edm_name( 'MatlUsage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAT_ORIGIN' ).
    lo_primitive_property->set_edm_name( 'MatOrigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IN_HOUSE' ).
    lo_primitive_property->set_edm_name( 'InHouse' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INDUS_3' ).
    lo_primitive_property->set_edm_name( 'Indus3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INF_INDEX' ).
    lo_primitive_property->set_edm_name( 'InfIndex' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNTIL_DATE' ).
    lo_primitive_property->set_edm_name( 'UntilDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIV_COMPL' ).
    lo_primitive_property->set_edm_name( 'DelivCompl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PART_DELIV' ).
    lo_primitive_property->set_edm_name( 'PartDeliv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHIP_BLOCKED' ).
    lo_primitive_property->set_edm_name( 'ShipBlocked' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PREQ_NAME' ).
    lo_primitive_property->set_edm_name( 'PreqName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERIOD_IND_EXPIRATION_DATE' ).
    lo_primitive_property->set_edm_name( 'PeriodIndExpirationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INT_OBJ_NO' ).
    lo_primitive_property->set_edm_name( 'IntObjNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PCKG_NO' ).
    lo_primitive_property->set_edm_name( 'PckgNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BATCH' ).
    lo_primitive_property->set_edm_name( 'Batch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VENDRBATCH' ).
    lo_primitive_property->set_edm_name( 'Vendrbatch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CALCTYPE' ).
    lo_primitive_property->set_edm_name( 'Calctype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NO_ROUNDING' ).
    lo_primitive_property->set_edm_name( 'NoRounding' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_PRICE' ).
    lo_primitive_property->set_edm_name( 'PoPrice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPL_STLOC' ).
    lo_primitive_property->set_edm_name( 'SupplStloc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SRV_BASED_IV' ).
    lo_primitive_property->set_edm_name( 'SrvBasedIv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNDS_RES' ).
    lo_primitive_property->set_edm_name( 'FundsRes' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RES_ITEM' ).
    lo_primitive_property->set_edm_name( 'ResItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRANT_NBR' ).
    lo_primitive_property->set_edm_name( 'GrantNbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNC_AREA_LONG' ).
    lo_primitive_property->set_edm_name( 'FuncAreaLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORIG_ACCEPT' ).
    lo_primitive_property->set_edm_name( 'OrigAccept' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALLOC_TBL' ).
    lo_primitive_property->set_edm_name( 'AllocTbl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALLOC_TBL_ITEM' ).
    lo_primitive_property->set_edm_name( 'AllocTblItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SRC_STOCK_TYPE' ).
    lo_primitive_property->set_edm_name( 'SrcStockType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REASON_REJ' ).
    lo_primitive_property->set_edm_name( 'ReasonRej' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CRM_SALES_ORDER_NO' ).
    lo_primitive_property->set_edm_name( 'CrmSalesOrderNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CRM_SALES_ORDER_ITEM_NO' ).
    lo_primitive_property->set_edm_name( 'CrmSalesOrderItemNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CRM_REF_SALES_ORDER_NO' ).
    lo_primitive_property->set_edm_name( 'CrmRefSalesOrderNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CRM_REF_SO_ITEM_NO' ).
    lo_primitive_property->set_edm_name( 'CrmRefSoItemNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRIO_URGENCY' ).
    lo_primitive_property->set_edm_name( 'PrioUrgency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRIO_REQUIREMENT' ).
    lo_primitive_property->set_edm_name( 'PrioRequirement' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REASON_CODE' ).
    lo_primitive_property->set_edm_name( 'ReasonCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LONG_ITEM_NUMBER' ).
    lo_primitive_property->set_edm_name( 'LongItemNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTERNAL_SORT_NUMBER' ).
    lo_primitive_property->set_edm_name( 'ExternalSortNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTERNAL_HIERARCHY_TYPE' ).
    lo_primitive_property->set_edm_name( 'ExternalHierarchyType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETENTION_PERCENTAGE' ).
    lo_primitive_property->set_edm_name( 'RetentionPercentage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWNPAY_TYPE' ).
    lo_primitive_property->set_edm_name( 'DownpayType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWNPAY_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'DownpayAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWNPAY_PERCENT' ).
    lo_primitive_property->set_edm_name( 'DownpayPercent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOWNPAY_DUEDATE' ).
    lo_primitive_property->set_edm_name( 'DownpayDuedate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_RFX_NUMBER' ).
    lo_primitive_property->set_edm_name( 'ExtRfxNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_RFX_ITEM' ).
    lo_primitive_property->set_edm_name( 'ExtRfxItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_RFX_SYSTEM' ).
    lo_primitive_property->set_edm_name( 'ExtRfxSystem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SRM_CONTRACT_ID' ).
    lo_primitive_property->set_edm_name( 'SrmContractId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SRM_CONTRACT_ITM' ).
    lo_primitive_property->set_edm_name( 'SrmContractItm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDGET_PERIOD' ).
    lo_primitive_property->set_edm_name( 'BudgetPeriod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLOCK_REASON_ID' ).
    lo_primitive_property->set_edm_name( 'BlockReasonId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLOCK_REASON_TEXT' ).
    lo_primitive_property->set_edm_name( 'BlockReasonText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_CRM_FKREL' ).
    lo_primitive_property->set_edm_name( 'SpeCrmFkrel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_QTY_FIXED' ).
    lo_primitive_property->set_edm_name( 'DateQtyFixed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GI_BASED_GR' ).
    lo_primitive_property->set_edm_name( 'GiBasedGr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHIPTYPE' ).
    lo_primitive_property->set_edm_name( 'Shiptype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HANDOVERLOC' ).
    lo_primitive_property->set_edm_name( 'Handoverloc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TC_AUT_DET' ).
    lo_primitive_property->set_edm_name( 'TcAutDet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MANUAL_TC_REASON' ).
    lo_primitive_property->set_edm_name( 'ManualTcReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_INCENTIVE' ).
    lo_primitive_property->set_edm_name( 'FiscalIncentive' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_INCENTIVE_ID' ).
    lo_primitive_property->set_edm_name( 'FiscalIncentiveId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_SUBJECT_ST' ).
    lo_primitive_property->set_edm_name( 'TaxSubjectSt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQ_SEGMENT' ).
    lo_primitive_property->set_edm_name( 'ReqSegment' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STK_SEGMENT' ).
    lo_primitive_property->set_edm_name( 'StkSegment' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SF_TXJCD' ).
    lo_primitive_property->set_edm_name( 'SfTxjcd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_2_L' ).
    lo_primitive_property->set_edm_name( 'Incoterms2l' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_3_L' ).
    lo_primitive_property->set_edm_name( 'Incoterms3l' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_LONG' ).
    lo_primitive_property->set_edm_name( 'MaterialLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMATERIAL_LONG' ).
    lo_primitive_property->set_edm_name( 'EmaterialLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICEPERFORMER' ).
    lo_primitive_property->set_edm_name( 'Serviceperformer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCTTYPE' ).
    lo_primitive_property->set_edm_name( 'Producttype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STARTDATE' ).
    lo_primitive_property->set_edm_name( 'Startdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENDDATE' ).
    lo_primitive_property->set_edm_name( 'Enddate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQ_SEG_LONG' ).
    lo_primitive_property->set_edm_name( 'ReqSegLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STK_SEG_LONG' ).
    lo_primitive_property->set_edm_name( 'StkSegLong' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXPECTED_VALUE' ).
    lo_primitive_property->set_edm_name( 'ExpectedValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIMIT_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'LimitAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_REF' ).
    lo_primitive_property->set_edm_name( 'ExtRef' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GL_ACCOUNT' ).
    lo_primitive_property->set_edm_name( 'GlAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COSTCENTER' ).
    lo_primitive_property->set_edm_name( 'Costcenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WBS_ELEMENT' ).
    lo_primitive_property->set_edm_name( 'WbsElement' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMMODITY_CODE' ).
    lo_primitive_property->set_edm_name( 'CommodityCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTRASTAT_SERVICE_CODE' ).
    lo_primitive_property->set_edm_name( 'IntrastatServiceCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTRACT_FOR_LIMIT' ).
    lo_primitive_property->set_edm_name( 'ContractForLimit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXCALCDATE' ).
    lo_primitive_property->set_edm_name( 'Taxcalcdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXCOUNTRY' ).
    lo_primitive_property->set_edm_name( 'Taxcountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXS_BUSINESS_TRANSACTION' ).
    lo_primitive_property->set_edm_name( 'TxsBusinessTransaction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXS_USAGE_PURPOSE' ).
    lo_primitive_property->set_edm_name( 'TxsUsagePurpose' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

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
ENDCLASS.
