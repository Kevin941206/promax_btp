"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>cds_zsd_zvts_rfq_detail</em>
CLASS zscm_zvts_rfq_detail DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">SAP__FitToPage</p>
      BEGIN OF tys_sap_fit_to_page,
        "! ErrorRecoveryBehavior
        error_recovery_behavior TYPE c LENGTH 8,
        "! IsEnabled
        is_enabled              TYPE abap_bool,
        "! MinimumFontSize
        minimum_font_size       TYPE int4,
      END OF tys_sap_fit_to_page,
      "! <p class="shorttext synchronized">List of SAP__FitToPage</p>
      tyt_sap_fit_to_page TYPE STANDARD TABLE OF tys_sap_fit_to_page WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__CoverPage</p>
      BEGIN OF tys_sap_cover_page,
        "! <em>Key property</em> Title
        title TYPE c LENGTH 256,
        "! <em>Key property</em> Id
        id    TYPE sysuuid_x16,
        "! <em>Key property</em> Name
        name  TYPE c LENGTH 256,
        "! Value
        value TYPE c LENGTH 256,
      END OF tys_sap_cover_page,
      "! <p class="shorttext synchronized">List of SAP__CoverPage</p>
      tyt_sap_cover_page TYPE STANDARD TABLE OF tys_sap_cover_page WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__Currency</p>
      BEGIN OF tys_sap_currency,
        "! <em>Key property</em> CurrencyCode
        currency_code  TYPE c LENGTH 5,
        "! ISOCode
        isocode        TYPE c LENGTH 3,
        "! Text
        text           TYPE c LENGTH 15,
        "! DecimalPlaces
        decimal_places TYPE int1,
      END OF tys_sap_currency,
      "! <p class="shorttext synchronized">List of SAP__Currency</p>
      tyt_sap_currency TYPE STANDARD TABLE OF tys_sap_currency WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__DocumentDescription</p>
      BEGIN OF tys_sap_document_description,
        "! <em>Key property</em> Id
        id         TYPE sysuuid_x16,
        "! CreatedBy
        created_by TYPE c LENGTH 12,
        "! CreatedAt
        created_at TYPE timestamp,
        "! FileName
        file_name  TYPE c LENGTH 256,
        "! Title
        title      TYPE c LENGTH 256,
      END OF tys_sap_document_description,
      "! <p class="shorttext synchronized">List of SAP__DocumentDescription</p>
      tyt_sap_document_description TYPE STANDARD TABLE OF tys_sap_document_description WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__Format</p>
      BEGIN OF tys_sap_format,
        "! FitToPage
        fit_to_page TYPE tys_sap_fit_to_page,
        "! <em>Key property</em> Id
        id          TYPE sysuuid_x16,
        "! FontSize
        font_size   TYPE int4,
        "! Orientation
        orientation TYPE c LENGTH 10,
        "! PaperSize
        paper_size  TYPE c LENGTH 10,
        "! BorderSize
        border_size TYPE int4,
        "! MarginSize
        margin_size TYPE int4,
        "! FontName
        font_name   TYPE c LENGTH 255,
      END OF tys_sap_format,
      "! <p class="shorttext synchronized">List of SAP__Format</p>
      tyt_sap_format TYPE STANDARD TABLE OF tys_sap_format WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__PDFStandard</p>
      BEGIN OF tys_sap_pdfstandard,
        "! <em>Key property</em> Id
        id                      TYPE sysuuid_x16,
        "! UsePDFAConformance
        use_pdfaconformance     TYPE abap_bool,
        "! DoEnableAccessibility
        do_enable_accessibility TYPE abap_bool,
      END OF tys_sap_pdfstandard,
      "! <p class="shorttext synchronized">List of SAP__PDFStandard</p>
      tyt_sap_pdfstandard TYPE STANDARD TABLE OF tys_sap_pdfstandard WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__Signature</p>
      BEGIN OF tys_sap_signature,
        "! <em>Key property</em> Id
        id      TYPE sysuuid_x16,
        "! DoSign
        do_sign TYPE abap_bool,
        "! Reason
        reason  TYPE c LENGTH 256,
      END OF tys_sap_signature,
      "! <p class="shorttext synchronized">List of SAP__Signature</p>
      tyt_sap_signature TYPE STANDARD TABLE OF tys_sap_signature WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__TableColumns</p>
      BEGIN OF tys_sap_table_columns,
        "! <em>Key property</em> Id
        id                   TYPE sysuuid_x16,
        "! <em>Key property</em> Name
        name                 TYPE c LENGTH 256,
        "! <em>Key property</em> Header
        header               TYPE c LENGTH 256,
        "! HorizontalAlignment
        horizontal_alignment TYPE c LENGTH 10,
      END OF tys_sap_table_columns,
      "! <p class="shorttext synchronized">List of SAP__TableColumns</p>
      tyt_sap_table_columns TYPE STANDARD TABLE OF tys_sap_table_columns WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__UnitOfMeasure</p>
      BEGIN OF tys_sap_unit_of_measure,
        "! <em>Key property</em> UnitCode
        unit_code      TYPE c LENGTH 3,
        "! ISOCode
        isocode        TYPE c LENGTH 3,
        "! ExternalCode
        external_code  TYPE c LENGTH 3,
        "! Text
        text           TYPE c LENGTH 30,
        "! DecimalPlaces
        decimal_places TYPE int2,
      END OF tys_sap_unit_of_measure,
      "! <p class="shorttext synchronized">List of SAP__UnitOfMeasure</p>
      tyt_sap_unit_of_measure TYPE STANDARD TABLE OF tys_sap_unit_of_measure WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__ValueHelp</p>
      BEGIN OF tys_sap_value_help,
        "! <em>Key property</em> VALUEHELP
        valuehelp   TYPE string,
        "! FIELD_VALUE
        field_value TYPE c LENGTH 10,
        "! DESCRIPTION
        description TYPE string,
      END OF tys_sap_value_help,
      "! <p class="shorttext synchronized">List of SAP__ValueHelp</p>
      tyt_sap_value_help TYPE STANDARD TABLE OF tys_sap_value_help WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_EKETType</p>
      BEGIN OF tys_z_i_ekettype,
        "! <em>Key property</em> Ebeln
        ebeln            TYPE c LENGTH 10,
        "! <em>Key property</em> Ebelp
        ebelp            TYPE c LENGTH 5,
        "! <em>Key property</em> Etenr
        etenr            TYPE c LENGTH 4,
        "! Uniqueid
        uniqueid         TYPE c LENGTH 19,
        "! Eindt
        eindt            TYPE datn,
        "! Slfdt
        slfdt            TYPE datn,
        "! Lpein
        lpein            TYPE c LENGTH 1,
        "! Menge
        menge            TYPE p LENGTH 7 DECIMALS 3,
        "! Ameng
        ameng            TYPE p LENGTH 7 DECIMALS 3,
        "! Wemng
        wemng            TYPE p LENGTH 7 DECIMALS 3,
        "! Wamng
        wamng            TYPE p LENGTH 7 DECIMALS 3,
        "! Uzeit
        uzeit            TYPE timn,
        "! Banfn
        banfn            TYPE c LENGTH 10,
        "! Bnfpo
        bnfpo            TYPE c LENGTH 5,
        "! Estkz
        estkz            TYPE c LENGTH 1,
        "! Qunum
        qunum            TYPE c LENGTH 10,
        "! Qupos
        qupos            TYPE c LENGTH 3,
        "! Mahnz
        mahnz            TYPE p LENGTH 2 DECIMALS 0,
        "! Bedat
        bedat            TYPE datn,
        "! Rsnum
        rsnum            TYPE c LENGTH 10,
        "! Sernr
        sernr            TYPE c LENGTH 8,
        "! Fixkz
        fixkz            TYPE abap_bool,
        "! Glmng
        glmng            TYPE p LENGTH 7 DECIMALS 3,
        "! Dabmg
        dabmg            TYPE p LENGTH 7 DECIMALS 3,
        "! Charg
        charg            TYPE c LENGTH 10,
        "! Licha
        licha            TYPE c LENGTH 15,
        "! Chkom
        chkom            TYPE abap_bool,
        "! Verid
        verid            TYPE c LENGTH 4,
        "! Abart
        abart            TYPE c LENGTH 1,
        "! Mng02
        mng_02           TYPE p LENGTH 7 DECIMALS 3,
        "! Dat01
        dat_01           TYPE datn,
        "! Altdt
        altdt            TYPE datn,
        "! Aulwe
        aulwe            TYPE c LENGTH 10,
        "! Mbdat
        mbdat            TYPE datn,
        "! Mbuhr
        mbuhr            TYPE timn,
        "! Lddat
        lddat            TYPE datn,
        "! Lduhr
        lduhr            TYPE timn,
        "! Tddat
        tddat            TYPE datn,
        "! Tduhr
        tduhr            TYPE timn,
        "! Wadat
        wadat            TYPE datn,
        "! Wauhr
        wauhr            TYPE timn,
        "! Eldat
        eldat            TYPE datn,
        "! Eluhr
        eluhr            TYPE timn,
        "! Anzsn
        anzsn            TYPE int4,
        "! Nodisp
        nodisp           TYPE abap_bool,
        "! GeoRoute
        geo_route        TYPE c LENGTH 10,
        "! RouteGts
        route_gts        TYPE c LENGTH 10,
        "! GtsInd
        gts_ind          TYPE c LENGTH 2,
        "! Tsp
        tsp              TYPE c LENGTH 10,
        "! CdLocno
        cd_locno         TYPE c LENGTH 20,
        "! CdLoctype
        cd_loctype       TYPE c LENGTH 4,
        "! Handoverdate
        handoverdate     TYPE datn,
        "! Handovertime
        handovertime     TYPE timn,
        "! Wesbb
        wesbb            TYPE p LENGTH 7 DECIMALS 3,
        "! Startdate
        startdate        TYPE datn,
        "! Enddate
        enddate          TYPE datn,
        "! Dataaging
        dataaging        TYPE datn,
        "! xcwmxmenge
        xcwmxmenge       TYPE p LENGTH 7 DECIMALS 3,
        "! xcwmxdabmg
        xcwmxdabmg       TYPE p LENGTH 7 DECIMALS 3,
        "! xcwmxwemng
        xcwmxwemng       TYPE p LENGTH 7 DECIMALS 3,
        "! TmsRefUuid
        tms_ref_uuid     TYPE sysuuid_x16,
        "! ArunReqDlvdate
        arun_req_dlvdate TYPE datn,
        "! FshOsId
        fsh_os_id        TYPE c LENGTH 4,
        "! KeyId
        key_id           TYPE c LENGTH 16,
        "! OtbCurr
        otb_curr         TYPE c LENGTH 5,
        "! SprRsnProfile
        spr_rsn_profile  TYPE c LENGTH 4,
        "! BudgType
        budg_type        TYPE c LENGTH 2,
        "! OtbStatus
        otb_status       TYPE c LENGTH 1,
        "! OtbReason
        otb_reason       TYPE c LENGTH 3,
        "! CheckType
        check_type       TYPE c LENGTH 1,
        "! DlId
        dl_id            TYPE sysuuid_x16,
        "! NoScem
        no_scem          TYPE abap_bool,
        "! DngDate
        dng_date         TYPE datn,
        "! DngTime
        dng_time         TYPE timn,
        "! CnclAncmntDone
        cncl_ancmnt_done TYPE abap_bool,
        "! DateshiftNumber
        dateshift_number TYPE p LENGTH 2 DECIMALS 0,
      END OF tys_z_i_ekettype,
      "! <p class="shorttext synchronized">List of Z_I_EKETType</p>
      tyt_z_i_ekettype TYPE STANDARD TABLE OF tys_z_i_ekettype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_EKET_EBANType</p>
      BEGIN OF tys_z_i_eket_ebantype,
        "! <em>Key property</em> Banfn
        banfn                      TYPE c LENGTH 10,
        "! <em>Key property</em> Bnfpo
        bnfpo                      TYPE c LENGTH 5,
        "! <em>Key property</em> Ebeln
        ebeln                      TYPE c LENGTH 10,
        "! <em>Key property</em> Ebelp
        ebelp                      TYPE c LENGTH 5,
        "! <em>Key property</em> Etenr
        etenr                      TYPE c LENGTH 4,
        "! Bsart
        bsart                      TYPE c LENGTH 4,
        "! Bstyp
        bstyp                      TYPE c LENGTH 1,
        "! Bsakz
        bsakz                      TYPE c LENGTH 1,
        "! Loekz
        loekz                      TYPE c LENGTH 1,
        "! Statu
        statu                      TYPE c LENGTH 1,
        "! Estkz
        estkz                      TYPE c LENGTH 1,
        "! Frgkz
        frgkz                      TYPE c LENGTH 1,
        "! Frgzu
        frgzu                      TYPE c LENGTH 8,
        "! Frgst
        frgst                      TYPE c LENGTH 2,
        "! Ekgrp
        ekgrp                      TYPE c LENGTH 3,
        "! Ernam
        ernam                      TYPE c LENGTH 12,
        "! Erdat
        erdat                      TYPE datn,
        "! Afnam
        afnam                      TYPE c LENGTH 12,
        "! Txz01
        txz_01                     TYPE c LENGTH 40,
        "! Matnr
        matnr                      TYPE c LENGTH 18,
        "! Ematn
        ematn                      TYPE c LENGTH 18,
        "! Werks
        werks                      TYPE c LENGTH 4,
        "! Lgort
        lgort                      TYPE c LENGTH 4,
        "! Bednr
        bednr                      TYPE c LENGTH 10,
        "! Matkl
        matkl                      TYPE c LENGTH 9,
        "! Reswk
        reswk                      TYPE c LENGTH 4,
        "! Menge
        menge                      TYPE p LENGTH 7 DECIMALS 3,
        "! Meins
        meins                      TYPE c LENGTH 3,
        "! Bumng
        bumng                      TYPE p LENGTH 7 DECIMALS 3,
        "! Badat
        badat                      TYPE datn,
        "! Lpein
        lpein                      TYPE c LENGTH 1,
        "! Lfdat
        lfdat                      TYPE datn,
        "! Frgdt
        frgdt                      TYPE datn,
        "! Webaz
        webaz                      TYPE p LENGTH 2 DECIMALS 0,
        "! Preis
        preis                      TYPE p LENGTH 6 DECIMALS 3,
        "! Peinh
        peinh                      TYPE p LENGTH 3 DECIMALS 0,
        "! Pstyp
        pstyp                      TYPE c LENGTH 1,
        "! Knttp
        knttp                      TYPE c LENGTH 1,
        "! Kzvbr
        kzvbr                      TYPE c LENGTH 1,
        "! Kflag
        kflag                      TYPE abap_bool,
        "! Vrtkz
        vrtkz                      TYPE c LENGTH 1,
        "! Twrkz
        twrkz                      TYPE c LENGTH 1,
        "! Wepos
        wepos                      TYPE abap_bool,
        "! Weunb
        weunb                      TYPE abap_bool,
        "! Repos
        repos                      TYPE abap_bool,
        "! Lifnr
        lifnr                      TYPE c LENGTH 10,
        "! Flief
        flief                      TYPE c LENGTH 10,
        "! Ekorg
        ekorg                      TYPE c LENGTH 4,
        "! Vrtyp
        vrtyp                      TYPE c LENGTH 1,
        "! Konnr
        konnr                      TYPE c LENGTH 10,
        "! Ktpnr
        ktpnr                      TYPE c LENGTH 5,
        "! Infnr
        infnr                      TYPE c LENGTH 10,
        "! Zugba
        zugba                      TYPE abap_bool,
        "! Qunum
        qunum                      TYPE c LENGTH 10,
        "! Qupos
        qupos                      TYPE c LENGTH 3,
        "! Dispo
        dispo                      TYPE c LENGTH 3,
        "! Sernr
        sernr                      TYPE c LENGTH 8,
        "! Bvdat
        bvdat                      TYPE datn,
        "! Batol
        batol                      TYPE p LENGTH 2 DECIMALS 0,
        "! Bvdrk
        bvdrk                      TYPE p LENGTH 4 DECIMALS 0,
        "! Bedat
        bedat                      TYPE datn,
        "! Bsmng
        bsmng                      TYPE p LENGTH 7 DECIMALS 3,
        "! LimitConsumptionValue
        limit_consumption_value    TYPE p LENGTH 7 DECIMALS 3,
        "! Lblni
        lblni                      TYPE c LENGTH 10,
        "! Bwtar
        bwtar                      TYPE c LENGTH 10,
        "! Xoblr
        xoblr                      TYPE abap_bool,
        "! Ebakz
        ebakz                      TYPE abap_bool,
        "! Rsnum
        rsnum                      TYPE c LENGTH 10,
        "! Sobkz
        sobkz                      TYPE c LENGTH 1,
        "! Arsnr
        arsnr                      TYPE c LENGTH 10,
        "! Arsps
        arsps                      TYPE c LENGTH 4,
        "! Fixkz
        fixkz                      TYPE abap_bool,
        "! Bmein
        bmein                      TYPE c LENGTH 3,
        "! Revlv
        revlv                      TYPE c LENGTH 2,
        "! Vorab
        vorab                      TYPE abap_bool,
        "! Packno
        packno                     TYPE c LENGTH 10,
        "! Kanba
        kanba                      TYPE c LENGTH 1,
        "! Bpueb
        bpueb                      TYPE c LENGTH 1,
        "! Cuobj
        cuobj                      TYPE c LENGTH 18,
        "! Frggr
        frggr                      TYPE c LENGTH 2,
        "! Frgrl
        frgrl                      TYPE abap_bool,
        "! Aktnr
        aktnr                      TYPE c LENGTH 10,
        "! Charg
        charg                      TYPE c LENGTH 10,
        "! Umsok
        umsok                      TYPE c LENGTH 1,
        "! Verid
        verid                      TYPE c LENGTH 4,
        "! Fipos
        fipos                      TYPE c LENGTH 14,
        "! Fistl
        fistl                      TYPE c LENGTH 16,
        "! Geber
        geber                      TYPE c LENGTH 10,
        "! Kzkfg
        kzkfg                      TYPE c LENGTH 1,
        "! Satnr
        satnr                      TYPE c LENGTH 18,
        "! Mng02
        mng_02                     TYPE p LENGTH 7 DECIMALS 3,
        "! Dat01
        dat_01                     TYPE datn,
        "! Attyp
        attyp                      TYPE c LENGTH 2,
        "! Adrnr
        adrnr                      TYPE c LENGTH 10,
        "! Adrn2
        adrn_2                     TYPE c LENGTH 10,
        "! Kunnr
        kunnr                      TYPE c LENGTH 10,
        "! Emlif
        emlif                      TYPE c LENGTH 10,
        "! Lblkz
        lblkz                      TYPE abap_bool,
        "! Kzbws
        kzbws                      TYPE c LENGTH 1,
        "! Waers
        waers                      TYPE c LENGTH 5,
        "! Idnlf
        idnlf                      TYPE c LENGTH 35,
        "! Gsfrg
        gsfrg                      TYPE abap_bool,
        "! Mprof
        mprof                      TYPE c LENGTH 4,
        "! Kzfme
        kzfme                      TYPE c LENGTH 1,
        "! Spras
        spras                      TYPE c LENGTH 2,
        "! Techs
        techs                      TYPE c LENGTH 12,
        "! Mfrpn
        mfrpn                      TYPE c LENGTH 40,
        "! Mfrnr
        mfrnr                      TYPE c LENGTH 10,
        "! Emnfr
        emnfr                      TYPE c LENGTH 10,
        "! Fordn
        fordn                      TYPE c LENGTH 10,
        "! Fordp
        fordp                      TYPE c LENGTH 5,
        "! Plifz
        plifz                      TYPE p LENGTH 2 DECIMALS 0,
        "! Berid
        berid                      TYPE c LENGTH 10,
        "! Uzeit
        uzeit                      TYPE timn,
        "! Fkber
        fkber                      TYPE c LENGTH 16,
        "! GrantNbr
        grant_nbr                  TYPE c LENGTH 20,
        "! Memory
        memory                     TYPE abap_bool,
        "! Banpr
        banpr                      TYPE c LENGTH 2,
        "! Rlwrt
        rlwrt                      TYPE p LENGTH 8 DECIMALS 3,
        "! Blckd
        blckd                      TYPE c LENGTH 1,
        "! Revno
        revno                      TYPE c LENGTH 8,
        "! Blckt
        blckt                      TYPE c LENGTH 60,
        "! Beswk
        beswk                      TYPE c LENGTH 4,
        "! Eprofile
        eprofile                   TYPE c LENGTH 2,
        "! Eprefdoc
        eprefdoc                   TYPE c LENGTH 10,
        "! Eprefitm
        eprefitm                   TYPE c LENGTH 5,
        "! Gmmng
        gmmng                      TYPE p LENGTH 7 DECIMALS 3,
        "! Wrtkz
        wrtkz                      TYPE abap_bool,
        "! Reslo
        reslo                      TYPE c LENGTH 4,
        "! Kblnr
        kblnr                      TYPE c LENGTH 10,
        "! Kblpos
        kblpos                     TYPE c LENGTH 3,
        "! PrioUrg
        prio_urg                   TYPE c LENGTH 2,
        "! PrioReq
        prio_req                   TYPE c LENGTH 3,
        "! Memorytype
        memorytype                 TYPE c LENGTH 1,
        "! Anzsn
        anzsn                      TYPE int4,
        "! Mhdrz
        mhdrz                      TYPE p LENGTH 3 DECIMALS 0,
        "! Iprkz
        iprkz                      TYPE c LENGTH 1,
        "! Nodisp
        nodisp                     TYPE abap_bool,
        "! SrmContractId
        srm_contract_id            TYPE c LENGTH 10,
        "! SrmContractItm
        srm_contract_itm           TYPE c LENGTH 10,
        "! BudgetPd
        budget_pd                  TYPE c LENGTH 10,
        "! Eldat
        eldat                      TYPE datn,
        "! ExpertMode
        expert_mode                TYPE abap_bool,
        "! CentralPurreqnProc
        central_purreqn_proc       TYPE abap_bool,
        "! SpeCrmRefSo
        spe_crm_ref_so             TYPE c LENGTH 35,
        "! SpeCrmRefItem
        spe_crm_ref_item           TYPE c LENGTH 6,
        "! Indelegateapproval
        indelegateapproval         TYPE abap_bool,
        "! DummyEbanInclEewPs
        dummy_eban_incl_eew_ps     TYPE c LENGTH 1,
        "! Storenetworkid
        storenetworkid             TYPE c LENGTH 128,
        "! Storesupplierid
        storesupplierid            TYPE c LENGTH 64,
        "! Creationdate
        creationdate               TYPE datn,
        "! Creationtime
        creationtime               TYPE timn,
        "! Producttype
        producttype                TYPE c LENGTH 2,
        "! Serviceperformer
        serviceperformer           TYPE c LENGTH 10,
        "! Iseopblocked
        iseopblocked               TYPE c LENGTH 1,
        "! ExtRevTmstmp
        ext_rev_tmstmp             TYPE timestampl,
        "! FmfgusKey
        fmfgus_key                 TYPE sysuuid_x16,
        "! Startdate
        startdate                  TYPE datn,
        "! Enddate
        enddate                    TYPE datn,
        "! Extmaterialforpurg
        extmaterialforpurg         TYPE c LENGTH 18,
        "! Extfixedsupplierforpurg
        extfixedsupplierforpurg    TYPE c LENGTH 10,
        "! Extdesiredsupplierforpurg
        extdesiredsupplierforpurg  TYPE c LENGTH 10,
        "! Extcontractforpurg
        extcontractforpurg         TYPE c LENGTH 10,
        "! Extcontractitemforpurg
        extcontractitemforpurg     TYPE c LENGTH 5,
        "! Extinforecordforpurg
        extinforecordforpurg       TYPE c LENGTH 10,
        "! Extplantforpurg
        extplantforpurg            TYPE c LENGTH 4,
        "! Extstoragelocationforpurg
        extstoragelocationforpurg  TYPE c LENGTH 4,
        "! Extcompanycodeforpurg
        extcompanycodeforpurg      TYPE c LENGTH 4,
        "! Extpurgorgforpurg
        extpurgorgforpurg          TYPE c LENGTH 4,
        "! Extsourcesystem
        extsourcesystem            TYPE c LENGTH 60,
        "! ExtBeSourceSys
        ext_be_source_sys          TYPE c LENGTH 10,
        "! ExtBePrchangeindicator
        ext_be_prchangeindicator   TYPE abap_bool,
        "! Extdoctypeforpurg
        extdoctypeforpurg          TYPE c LENGTH 4,
        "! Iscrreplicationbeforeapproval
        iscrreplicationbeforeappro TYPE abap_bool,
        "! MmpurPrCenReqnAppRpldPr
        mmpur_pr_cen_reqn_app_rpld TYPE c LENGTH 2,
        "! Extapprovalstatus
        extapprovalstatus          TYPE c LENGTH 1,
        "! Stagingfldextapprovalstatus
        stagingfldextapprovalstatu TYPE c LENGTH 1,
        "! Purchasereqnitemuniqueid
        purchasereqnitemuniqueid   TYPE c LENGTH 15,
        "! Lastchangedatetime
        lastchangedatetime         TYPE timestampl,
        "! Isonbehalfcart
        isonbehalfcart             TYPE c LENGTH 1,
        "! SdmVersion
        sdm_version                TYPE c LENGTH 2,
        "! Sakto
        sakto                      TYPE c LENGTH 10,
        "! Kostl
        kostl                      TYPE c LENGTH 10,
        "! ExpectedValue
        expected_value             TYPE p LENGTH 7 DECIMALS 3,
        "! LimitAmount
        limit_amount               TYPE p LENGTH 7 DECIMALS 3,
        "! ContractForLimit
        contract_for_limit         TYPE c LENGTH 10,
        "! Deliveryaddrtype
        deliveryaddrtype           TYPE c LENGTH 1,
        "! Mwskz
        mwskz                      TYPE c LENGTH 2,
        "! Pfmtransdatafootprintuuid
        pfmtransdatafootprintuuid  TYPE sysuuid_x16,
        "! Hastradecomplianceissue
        hastradecomplianceissue    TYPE abap_bool,
        "! Purreqndescription
        purreqndescription         TYPE c LENGTH 40,
        "! Isoutline
        isoutline                  TYPE abap_bool,
        "! ParentItemNo
        parent_item_no             TYPE c LENGTH 5,
        "! OutlineType
        outline_type               TYPE c LENGTH 1,
        "! Exlin
        exlin                      TYPE c LENGTH 40,
        "! Exsnr
        exsnr                      TYPE c LENGTH 5,
        "! Advcode
        advcode                    TYPE c LENGTH 2,
        "! Stacode
        stacode                    TYPE c LENGTH 2,
        "! BanfnCs
        banfn_cs                   TYPE c LENGTH 10,
        "! BnfpoCs
        bnfpo_cs                   TYPE c LENGTH 5,
        "! ItemCs
        item_cs                    TYPE c LENGTH 1,
        "! NoMardData
        no_mard_data               TYPE abap_bool,
        "! Admoi
        admoi                      TYPE c LENGTH 4,
        "! Adpri
        adpri                      TYPE c LENGTH 3,
        "! Lprio
        lprio                      TYPE c LENGTH 2,
        "! Adacn
        adacn                      TYPE c LENGTH 10,
        "! Addns
        addns                      TYPE c LENGTH 1,
        "! Serru
        serru                      TYPE c LENGTH 1,
        "! DisubSobkz
        disub_sobkz                TYPE c LENGTH 1,
        "! DisubPspnr
        disub_pspnr                TYPE c LENGTH 8,
        "! DisubKunnr
        disub_kunnr                TYPE c LENGTH 10,
        "! DisubVbeln
        disub_vbeln                TYPE c LENGTH 10,
        "! DisubPosnr
        disub_posnr                TYPE c LENGTH 6,
        "! DisubOwner
        disub_owner                TYPE c LENGTH 10,
        "! Fldlogssupplyprocess
        fldlogssupplyprocess       TYPE c LENGTH 4,
        "! Fldlogsdelivisheldonshore
        fldlogsdelivisheldonshore  TYPE abap_bool,
        "! Fldlogsversion
        fldlogsversion             TYPE c LENGTH 3,
        "! FshSeasonYear
        fsh_season_year            TYPE c LENGTH 4,
        "! FshSeason
        fsh_season                 TYPE c LENGTH 10,
        "! FshCollection
        fsh_collection             TYPE c LENGTH 10,
        "! FshTheme
        fsh_theme                  TYPE c LENGTH 10,
        "! FshVasRel
        fsh_vas_rel                TYPE c LENGTH 1,
        "! FshVasPrntId
        fsh_vas_prnt_id            TYPE c LENGTH 5,
        "! FshTransaction
        fsh_transaction            TYPE c LENGTH 10,
        "! FshItemGroup
        fsh_item_group             TYPE c LENGTH 5,
        "! FshItem
        fsh_item                   TYPE c LENGTH 5,
        "! IuidRelevant
        iuid_relevant              TYPE c LENGTH 1,
        "! ScSrItemKey
        sc_sr_item_key             TYPE int4,
        "! ScCatalogid
        sc_catalogid               TYPE c LENGTH 20,
        "! ScCatalogitem
        sc_catalogitem             TYPE c LENGTH 40,
        "! ScRequestor
        sc_requestor               TYPE c LENGTH 60,
        "! ScAuthor
        sc_author                  TYPE c LENGTH 12,
        "! SgtScat
        sgt_scat                   TYPE c LENGTH 40,
        "! SgtRcat
        sgt_rcat                   TYPE c LENGTH 40,
        "! WrfCharstc1
        wrf_charstc_1              TYPE c LENGTH 18,
        "! WrfCharstc2
        wrf_charstc_2              TYPE c LENGTH 18,
        "! WrfCharstc3
        wrf_charstc_3              TYPE c LENGTH 18,
        "! Uniqueid
        uniqueid                   TYPE c LENGTH 19,
        "! Eindt
        eindt                      TYPE datn,
        "! Slfdt
        slfdt                      TYPE datn,
        "! Ameng
        ameng                      TYPE p LENGTH 7 DECIMALS 3,
        "! Wemng
        wemng                      TYPE p LENGTH 7 DECIMALS 3,
        "! Wamng
        wamng                      TYPE p LENGTH 7 DECIMALS 3,
        "! Mahnz
        mahnz                      TYPE p LENGTH 2 DECIMALS 0,
        "! Glmng
        glmng                      TYPE p LENGTH 7 DECIMALS 3,
        "! Dabmg
        dabmg                      TYPE p LENGTH 7 DECIMALS 3,
        "! Licha
        licha                      TYPE c LENGTH 15,
        "! Chkom
        chkom                      TYPE abap_bool,
        "! Abart
        abart                      TYPE c LENGTH 1,
        "! Altdt
        altdt                      TYPE datn,
        "! Aulwe
        aulwe                      TYPE c LENGTH 10,
        "! Mbdat
        mbdat                      TYPE datn,
        "! Mbuhr
        mbuhr                      TYPE timn,
        "! Lddat
        lddat                      TYPE datn,
        "! Lduhr
        lduhr                      TYPE timn,
        "! Tddat
        tddat                      TYPE datn,
        "! Tduhr
        tduhr                      TYPE timn,
        "! Wadat
        wadat                      TYPE datn,
        "! Wauhr
        wauhr                      TYPE timn,
        "! Eluhr
        eluhr                      TYPE timn,
        "! GeoRoute
        geo_route                  TYPE c LENGTH 10,
        "! RouteGts
        route_gts                  TYPE c LENGTH 10,
        "! GtsInd
        gts_ind                    TYPE c LENGTH 2,
        "! Tsp
        tsp                        TYPE c LENGTH 10,
        "! CdLocno
        cd_locno                   TYPE c LENGTH 20,
        "! CdLoctype
        cd_loctype                 TYPE c LENGTH 4,
        "! Handoverdate
        handoverdate               TYPE datn,
        "! Handovertime
        handovertime               TYPE timn,
        "! Wesbb
        wesbb                      TYPE p LENGTH 7 DECIMALS 3,
        "! Dataaging
        dataaging                  TYPE datn,
        "! xcwmxmenge
        xcwmxmenge                 TYPE p LENGTH 7 DECIMALS 3,
        "! xcwmxdabmg
        xcwmxdabmg                 TYPE p LENGTH 7 DECIMALS 3,
        "! xcwmxwemng
        xcwmxwemng                 TYPE p LENGTH 7 DECIMALS 3,
        "! TmsRefUuid
        tms_ref_uuid               TYPE sysuuid_x16,
        "! ArunReqDlvdate
        arun_req_dlvdate           TYPE datn,
        "! FshRallocQty
        fsh_ralloc_qty             TYPE p LENGTH 7 DECIMALS 3,
        "! FshSallocQty
        fsh_salloc_qty             TYPE p LENGTH 7 DECIMALS 3,
        "! FshOsId
        fsh_os_id                  TYPE c LENGTH 4,
        "! KeyId
        key_id                     TYPE c LENGTH 16,
        "! OtbValue
        otb_value                  TYPE p LENGTH 9 DECIMALS 3,
        "! OtbCurr
        otb_curr                   TYPE c LENGTH 5,
        "! OtbResValue
        otb_res_value              TYPE p LENGTH 9 DECIMALS 3,
        "! OtbSpecValue
        otb_spec_value             TYPE p LENGTH 9 DECIMALS 3,
        "! SprRsnProfile
        spr_rsn_profile            TYPE c LENGTH 4,
        "! BudgType
        budg_type                  TYPE c LENGTH 2,
        "! OtbStatus
        otb_status                 TYPE c LENGTH 1,
        "! OtbReason
        otb_reason                 TYPE c LENGTH 3,
        "! CheckType
        check_type                 TYPE c LENGTH 1,
        "! DlId
        dl_id                      TYPE sysuuid_x16,
        "! NoScem
        no_scem                    TYPE abap_bool,
        "! DngDate
        dng_date                   TYPE datn,
        "! DngTime
        dng_time                   TYPE timn,
        "! CnclAncmntDone
        cncl_ancmnt_done           TYPE abap_bool,
        "! DateshiftNumber
        dateshift_number           TYPE p LENGTH 2 DECIMALS 0,
      END OF tys_z_i_eket_ebantype,
      "! <p class="shorttext synchronized">List of Z_I_EKET_EBANType</p>
      tyt_z_i_eket_ebantype TYPE STANDARD TABLE OF tys_z_i_eket_ebantype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_EKKOType</p>
      BEGIN OF tys_z_i_ekkotype,
        "! Delete_mc
        delete_mc              TYPE abap_bool,
        "! Update_mc
        update_mc              TYPE abap_bool,
        "! <em>Key property</em> Ebeln
        ebeln                  TYPE c LENGTH 10,
        "! Bukrs
        bukrs                  TYPE c LENGTH 4,
        "! Bstyp
        bstyp                  TYPE c LENGTH 1,
        "! Bsart
        bsart                  TYPE c LENGTH 4,
        "! Bsakz
        bsakz                  TYPE c LENGTH 1,
        "! Loekz
        loekz                  TYPE c LENGTH 1,
        "! Statu
        statu                  TYPE c LENGTH 1,
        "! Aedat
        aedat                  TYPE datn,
        "! Ernam
        ernam                  TYPE c LENGTH 12,
        "! Lastchangedatetime
        lastchangedatetime     TYPE timestampl,
        "! Pincr
        pincr                  TYPE c LENGTH 5,
        "! Lponr
        lponr                  TYPE c LENGTH 5,
        "! Lifnr
        lifnr                  TYPE c LENGTH 10,
        "! Spras
        spras                  TYPE c LENGTH 2,
        "! Zterm
        zterm                  TYPE c LENGTH 4,
        "! Zbd1t
        zbd_1_t                TYPE p LENGTH 2 DECIMALS 0,
        "! Zbd2t
        zbd_2_t                TYPE p LENGTH 2 DECIMALS 0,
        "! Zbd3t
        zbd_3_t                TYPE p LENGTH 2 DECIMALS 0,
        "! Zbd1p
        zbd_1_p                TYPE p LENGTH 3 DECIMALS 3,
        "! Zbd2p
        zbd_2_p                TYPE p LENGTH 3 DECIMALS 3,
        "! Ekorg
        ekorg                  TYPE c LENGTH 4,
        "! Ekgrp
        ekgrp                  TYPE c LENGTH 3,
        "! Waers
        waers                  TYPE c LENGTH 5,
        "! Wkurs
        wkurs                  TYPE p LENGTH 5 DECIMALS 5,
        "! Kufix
        kufix                  TYPE abap_bool,
        "! Bedat
        bedat                  TYPE datn,
        "! Kdatb
        kdatb                  TYPE datn,
        "! Kdate
        kdate                  TYPE datn,
        "! Bwbdt
        bwbdt                  TYPE datn,
        "! Angdt
        angdt                  TYPE datn,
        "! Bnddt
        bnddt                  TYPE datn,
        "! Gwldt
        gwldt                  TYPE datn,
        "! Ausnr
        ausnr                  TYPE c LENGTH 10,
        "! Angnr
        angnr                  TYPE c LENGTH 10,
        "! Ihran
        ihran                  TYPE datn,
        "! Ihrez
        ihrez                  TYPE c LENGTH 12,
        "! Verkf
        verkf                  TYPE c LENGTH 30,
        "! Telf1
        telf_1                 TYPE c LENGTH 16,
        "! Llief
        llief                  TYPE c LENGTH 10,
        "! Kunnr
        kunnr                  TYPE c LENGTH 10,
        "! ActiveId
        active_id              TYPE c LENGTH 10,
        "! Konnr
        konnr                  TYPE c LENGTH 10,
        "! Abgru
        abgru                  TYPE c LENGTH 2,
        "! Autlf
        autlf                  TYPE abap_bool,
        "! Weakt
        weakt                  TYPE abap_bool,
        "! Reswk
        reswk                  TYPE c LENGTH 4,
        "! Lblif
        lblif                  TYPE c LENGTH 10,
        "! Inco1
        inco_1                 TYPE c LENGTH 3,
        "! Inco2
        inco_2                 TYPE c LENGTH 28,
        "! Ktwrt
        ktwrt                  TYPE p LENGTH 8 DECIMALS 3,
        "! Distributiontype
        distributiontype       TYPE c LENGTH 1,
        "! Submi
        submi                  TYPE c LENGTH 10,
        "! Knumv
        knumv                  TYPE c LENGTH 10,
        "! Kalsm
        kalsm                  TYPE c LENGTH 6,
        "! Stafo
        stafo                  TYPE c LENGTH 6,
        "! Lifre
        lifre                  TYPE c LENGTH 10,
        "! Exnum
        exnum                  TYPE c LENGTH 10,
        "! Unsez
        unsez                  TYPE c LENGTH 12,
        "! Logsy
        logsy                  TYPE c LENGTH 10,
        "! Upinc
        upinc                  TYPE c LENGTH 5,
        "! Stako
        stako                  TYPE abap_bool,
        "! Frggr
        frggr                  TYPE c LENGTH 2,
        "! Frgsx
        frgsx                  TYPE c LENGTH 2,
        "! Frgke
        frgke                  TYPE c LENGTH 1,
        "! Frgzu
        frgzu                  TYPE c LENGTH 8,
        "! Frgrl
        frgrl                  TYPE abap_bool,
        "! Lands
        lands                  TYPE c LENGTH 3,
        "! Lphis
        lphis                  TYPE abap_bool,
        "! Adrnr
        adrnr                  TYPE c LENGTH 10,
        "! StcegL
        stceg_l                TYPE c LENGTH 3,
        "! Stceg
        stceg                  TYPE c LENGTH 20,
        "! Absgr
        absgr                  TYPE c LENGTH 2,
        "! Addnr
        addnr                  TYPE c LENGTH 10,
        "! Kornr
        kornr                  TYPE c LENGTH 1,
        "! Memory
        memory                 TYPE abap_bool,
        "! Procstat
        procstat               TYPE c LENGTH 2,
        "! ProcessIndicator
        process_indicator      TYPE c LENGTH 3,
        "! Rlwrt
        rlwrt                  TYPE p LENGTH 8 DECIMALS 3,
        "! CrStat
        cr_stat                TYPE c LENGTH 2,
        "! Revno
        revno                  TYPE c LENGTH 8,
        "! Scmproc
        scmproc                TYPE c LENGTH 1,
        "! ReasonCode
        reason_code            TYPE c LENGTH 4,
        "! Memorytype
        memorytype             TYPE c LENGTH 1,
        "! Rettp
        rettp                  TYPE c LENGTH 1,
        "! Retpc
        retpc                  TYPE p LENGTH 3 DECIMALS 2,
        "! Dptyp
        dptyp                  TYPE c LENGTH 4,
        "! Dppct
        dppct                  TYPE p LENGTH 3 DECIMALS 2,
        "! Dpamt
        dpamt                  TYPE p LENGTH 6 DECIMALS 3,
        "! Dpdat
        dpdat                  TYPE datn,
        "! MsrId
        msr_id                 TYPE c LENGTH 10,
        "! HierarchyExists
        hierarchy_exists       TYPE abap_bool,
        "! GroupingId
        grouping_id            TYPE c LENGTH 3,
        "! ParentId
        parent_id              TYPE c LENGTH 10,
        "! ThresholdExists
        threshold_exists       TYPE abap_bool,
        "! LegalContract
        legal_contract         TYPE c LENGTH 40,
        "! Description
        description            TYPE c LENGTH 40,
        "! ReleaseDate
        release_date           TYPE datn,
        "! Vsart
        vsart                  TYPE c LENGTH 2,
        "! Handoverloc
        handoverloc            TYPE c LENGTH 10,
        "! Shipcond
        shipcond               TYPE c LENGTH 2,
        "! Incov
        incov                  TYPE c LENGTH 4,
        "! Inco2L
        inco_2_l               TYPE c LENGTH 70,
        "! Inco3L
        inco_3_l               TYPE c LENGTH 70,
        "! Grwcu
        grwcu                  TYPE c LENGTH 5,
        "! IntraRel
        intra_rel              TYPE abap_bool,
        "! IntraExcl
        intra_excl             TYPE abap_bool,
        "! TotalStatusPcs
        total_status_pcs       TYPE c LENGTH 1,
        "! TotalStatusPma
        total_status_pma       TYPE c LENGTH 1,
        "! TotalStatusDg
        total_status_dg        TYPE c LENGTH 1,
        "! TotalStatusSds
        total_status_sds       TYPE c LENGTH 1,
        "! QtnErlstSubmsnDate
        qtn_erlst_submsn_date  TYPE datn,
        "! FollowonDocCat
        followon_doc_cat       TYPE c LENGTH 1,
        "! FollowonDocType
        followon_doc_type      TYPE c LENGTH 4,
        "! DummyEkkoInclEewPs
        dummy_ekko_incl_eew_ps TYPE c LENGTH 1,
        "! Externalsystem
        externalsystem         TYPE c LENGTH 60,
        "! Externalreferenceid
        externalreferenceid    TYPE c LENGTH 70,
        "! ExtRevTmstmp
        ext_rev_tmstmp         TYPE timestampl,
        "! Iseopblocked
        iseopblocked           TYPE c LENGTH 1,
        "! Isaged
        isaged                 TYPE abap_bool,
        "! ForceId
        force_id               TYPE sysuuid_x16,
        "! ForceCnt
        force_cnt              TYPE c LENGTH 6,
        "! RelocId
        reloc_id               TYPE c LENGTH 10,
        "! RelocSeqId
        reloc_seq_id           TYPE c LENGTH 4,
        "! SourceLogsys
        source_logsys          TYPE c LENGTH 10,
        "! FshTransaction
        fsh_transaction        TYPE c LENGTH 10,
        "! FshItemGroup
        fsh_item_group         TYPE c LENGTH 5,
        "! FshVasLastItem
        fsh_vas_last_item      TYPE c LENGTH 5,
        "! FshOsStgChange
        fsh_os_stg_change      TYPE abap_bool,
        "! TmsRefUuid
        tms_ref_uuid           TYPE sysuuid_x16,
        "! xdmbexpaymentdeemed
        xdmbexpaymentdeemed    TYPE datn,
        "! xdmbexdealnumber
        xdmbexdealnumber       TYPE c LENGTH 12,
        "! xdmbexevgidrenewal
        xdmbexevgidrenewal     TYPE c LENGTH 4,
        "! xdmbexevgidcancel
        xdmbexevgidcancel      TYPE c LENGTH 4,
        "! Zapcgk
        zapcgk                 TYPE c LENGTH 4,
        "! ApcgkExtend
        apcgk_extend           TYPE c LENGTH 10,
        "! ZbasDate
        zbas_date              TYPE datn,
        "! Zadattyp
        zadattyp               TYPE c LENGTH 1,
        "! ZstartDat
        zstart_dat             TYPE datn,
        "! ZDev
        zdev                   TYPE p LENGTH 4 DECIMALS 3,
        "! Zindanx
        zindanx                TYPE abap_bool,
        "! ZlimitDat
        zlimit_dat             TYPE datn,
        "! Numerator
        numerator              TYPE c LENGTH 20,
        "! HashcalBdat
        hashcal_bdat           TYPE datn,
        "! Hashcal
        hashcal                TYPE c LENGTH 1,
        "! Negative
        negative               TYPE c LENGTH 1,
        "! HashcalExists
        hashcal_exists         TYPE c LENGTH 4,
        "! KnownIndex
        known_index            TYPE abap_bool,
        "! Postat
        postat                 TYPE abap_bool,
        "! Vzskz
        vzskz                  TYPE c LENGTH 2,
        "! FshSnstStatus
        fsh_snst_status        TYPE c LENGTH 2,
        "! Proce
        proce                  TYPE c LENGTH 9,
        "! Conc
        conc                   TYPE c LENGTH 5,
        "! Cont
        cont                   TYPE c LENGTH 5,
        "! Comp
        comp                   TYPE c LENGTH 5,
        "! Outr
        outr                   TYPE c LENGTH 5,
        "! Desp
        desp                   TYPE c LENGTH 100,
        "! DespDat
        desp_dat               TYPE datn,
        "! DespCargo
        desp_cargo             TYPE c LENGTH 5,
        "! Pare
        pare                   TYPE c LENGTH 100,
        "! PareDat
        pare_dat               TYPE datn,
        "! PareCargo
        pare_cargo             TYPE c LENGTH 5,
        "! PohfType
        pohf_type              TYPE c LENGTH 1,
        "! EqEindt
        eq_eindt               TYPE datn,
        "! EqWerks
        eq_werks               TYPE c LENGTH 4,
        "! Fixpo
        fixpo                  TYPE c LENGTH 1,
        "! EkgrpAllow
        ekgrp_allow            TYPE c LENGTH 1,
        "! WerksAllow
        werks_allow            TYPE c LENGTH 1,
        "! ContractAllow
        contract_allow         TYPE c LENGTH 1,
        "! PstypAllow
        pstyp_allow            TYPE c LENGTH 1,
        "! FixpoAllow
        fixpo_allow            TYPE c LENGTH 1,
        "! KeyIdAllow
        key_id_allow           TYPE c LENGTH 1,
        "! AurelAllow
        aurel_allow            TYPE c LENGTH 1,
        "! DelperAllow
        delper_allow           TYPE c LENGTH 1,
        "! EindtAllow
        eindt_allow            TYPE c LENGTH 1,
        "! LtsnrAllow
        ltsnr_allow            TYPE c LENGTH 1,
        "! OtbLevel
        otb_level              TYPE c LENGTH 1,
        "! OtbCondType
        otb_cond_type          TYPE c LENGTH 4,
        "! KeyId
        key_id                 TYPE c LENGTH 16,
        "! OtbCurr
        otb_curr               TYPE c LENGTH 5,
        "! SprRsnProfile
        spr_rsn_profile        TYPE c LENGTH 4,
        "! BudgType
        budg_type              TYPE c LENGTH 2,
        "! OtbStatus
        otb_status             TYPE c LENGTH 1,
        "! OtbReason
        otb_reason             TYPE c LENGTH 3,
        "! CheckType
        check_type             TYPE c LENGTH 1,
        "! ConOtbReq
        con_otb_req            TYPE abap_bool,
        "! ConPrebookLev
        con_prebook_lev        TYPE c LENGTH 1,
        "! ConDistrLev
        con_distr_lev          TYPE c LENGTH 1,
      END OF tys_z_i_ekkotype,
      "! <p class="shorttext synchronized">List of Z_I_EKKOType</p>
      tyt_z_i_ekkotype TYPE STANDARD TABLE OF tys_z_i_ekkotype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_EKPOType</p>
      BEGIN OF tys_z_i_ekpotype,
        "! Delete_mc
        delete_mc                  TYPE abap_bool,
        "! Update_mc
        update_mc                  TYPE abap_bool,
        "! <em>Key property</em> Ebeln
        ebeln                      TYPE c LENGTH 10,
        "! <em>Key property</em> Ebelp
        ebelp                      TYPE c LENGTH 5,
        "! Uniqueid
        uniqueid                   TYPE c LENGTH 15,
        "! Loekz
        loekz                      TYPE c LENGTH 1,
        "! Statu
        statu                      TYPE c LENGTH 1,
        "! Aedat
        aedat                      TYPE datn,
        "! Txz01
        txz_01                     TYPE c LENGTH 40,
        "! Matnr
        matnr                      TYPE c LENGTH 18,
        "! Ematn
        ematn                      TYPE c LENGTH 18,
        "! Bukrs
        bukrs                      TYPE c LENGTH 4,
        "! Werks
        werks                      TYPE c LENGTH 4,
        "! Lgort
        lgort                      TYPE c LENGTH 4,
        "! Bednr
        bednr                      TYPE c LENGTH 10,
        "! Matkl
        matkl                      TYPE c LENGTH 9,
        "! Infnr
        infnr                      TYPE c LENGTH 10,
        "! Idnlf
        idnlf                      TYPE c LENGTH 35,
        "! Ktmng
        ktmng                      TYPE p LENGTH 7 DECIMALS 3,
        "! Menge
        menge                      TYPE p LENGTH 7 DECIMALS 3,
        "! Meins
        meins                      TYPE c LENGTH 3,
        "! Bprme
        bprme                      TYPE c LENGTH 3,
        "! Bpumz
        bpumz                      TYPE p LENGTH 3 DECIMALS 0,
        "! Bpumn
        bpumn                      TYPE p LENGTH 3 DECIMALS 0,
        "! Umrez
        umrez                      TYPE p LENGTH 3 DECIMALS 0,
        "! Umren
        umren                      TYPE p LENGTH 3 DECIMALS 0,
        "! Netpr
        netpr                      TYPE p LENGTH 6 DECIMALS 2,
        "! Peinh
        peinh                      TYPE p LENGTH 3 DECIMALS 0,
        "! Netwr
        netwr                      TYPE p LENGTH 7 DECIMALS 2,
        "! Brtwr
        brtwr                      TYPE p LENGTH 7 DECIMALS 2,
        "! Agdat
        agdat                      TYPE datn,
        "! Webaz
        webaz                      TYPE p LENGTH 2 DECIMALS 0,
        "! Mwskz
        mwskz                      TYPE c LENGTH 2,
        "! TxdatFrom
        txdat_from                 TYPE datn,
        "! Txdat
        txdat                      TYPE datn,
        "! TaxCountry
        tax_country                TYPE c LENGTH 3,
        "! Bonus
        bonus                      TYPE c LENGTH 2,
        "! Insmk
        insmk                      TYPE c LENGTH 1,
        "! Spinf
        spinf                      TYPE c LENGTH 1,
        "! Prsdr
        prsdr                      TYPE abap_bool,
        "! Schpr
        schpr                      TYPE abap_bool,
        "! Mahnz
        mahnz                      TYPE p LENGTH 2 DECIMALS 0,
        "! Mahn1
        mahn_1                     TYPE p LENGTH 2 DECIMALS 0,
        "! Mahn2
        mahn_2                     TYPE p LENGTH 2 DECIMALS 0,
        "! Mahn3
        mahn_3                     TYPE p LENGTH 2 DECIMALS 0,
        "! Uebto
        uebto                      TYPE p LENGTH 2 DECIMALS 1,
        "! Uebtk
        uebtk                      TYPE abap_bool,
        "! Untto
        untto                      TYPE p LENGTH 2 DECIMALS 1,
        "! Bwtar
        bwtar                      TYPE c LENGTH 10,
        "! Bwtty
        bwtty                      TYPE c LENGTH 1,
        "! Abskz
        abskz                      TYPE abap_bool,
        "! Agmem
        agmem                      TYPE c LENGTH 3,
        "! Elikz
        elikz                      TYPE abap_bool,
        "! Erekz
        erekz                      TYPE abap_bool,
        "! Pstyp
        pstyp                      TYPE c LENGTH 1,
        "! Knttp
        knttp                      TYPE c LENGTH 1,
        "! Kzvbr
        kzvbr                      TYPE c LENGTH 1,
        "! Vrtkz
        vrtkz                      TYPE c LENGTH 1,
        "! Twrkz
        twrkz                      TYPE c LENGTH 1,
        "! Wepos
        wepos                      TYPE abap_bool,
        "! Weunb
        weunb                      TYPE abap_bool,
        "! Repos
        repos                      TYPE abap_bool,
        "! Webre
        webre                      TYPE abap_bool,
        "! Kzabs
        kzabs                      TYPE abap_bool,
        "! Labnr
        labnr                      TYPE c LENGTH 20,
        "! Konnr
        konnr                      TYPE c LENGTH 10,
        "! Ktpnr
        ktpnr                      TYPE c LENGTH 5,
        "! Abdat
        abdat                      TYPE datn,
        "! Abftz
        abftz                      TYPE p LENGTH 7 DECIMALS 3,
        "! Etfz1
        etfz_1                     TYPE p LENGTH 2 DECIMALS 0,
        "! Etfz2
        etfz_2                     TYPE p LENGTH 2 DECIMALS 0,
        "! Kzstu
        kzstu                      TYPE c LENGTH 1,
        "! Notkz
        notkz                      TYPE abap_bool,
        "! Lmein
        lmein                      TYPE c LENGTH 3,
        "! Evers
        evers                      TYPE c LENGTH 2,
        "! Zwert
        zwert                      TYPE p LENGTH 7 DECIMALS 2,
        "! Navnw
        navnw                      TYPE p LENGTH 7 DECIMALS 2,
        "! Abmng
        abmng                      TYPE p LENGTH 7 DECIMALS 3,
        "! Prdat
        prdat                      TYPE datn,
        "! Bstyp
        bstyp                      TYPE c LENGTH 1,
        "! Effwr
        effwr                      TYPE p LENGTH 7 DECIMALS 2,
        "! Xoblr
        xoblr                      TYPE abap_bool,
        "! Kunnr
        kunnr                      TYPE c LENGTH 10,
        "! Adrnr
        adrnr                      TYPE c LENGTH 10,
        "! Ekkol
        ekkol                      TYPE c LENGTH 4,
        "! Sktof
        sktof                      TYPE abap_bool,
        "! Stafo
        stafo                      TYPE c LENGTH 6,
        "! Plifz
        plifz                      TYPE p LENGTH 2 DECIMALS 0,
        "! Ntgew
        ntgew                      TYPE p LENGTH 7 DECIMALS 3,
        "! Gewei
        gewei                      TYPE c LENGTH 3,
        "! Txjcd
        txjcd                      TYPE c LENGTH 15,
        "! Etdrk
        etdrk                      TYPE c LENGTH 1,
        "! Sobkz
        sobkz                      TYPE c LENGTH 1,
        "! Arsnr
        arsnr                      TYPE c LENGTH 10,
        "! Arsps
        arsps                      TYPE c LENGTH 4,
        "! Insnc
        insnc                      TYPE abap_bool,
        "! Ssqss
        ssqss                      TYPE c LENGTH 8,
        "! Zgtyp
        zgtyp                      TYPE c LENGTH 4,
        "! Ean11
        ean_11                     TYPE c LENGTH 18,
        "! Bstae
        bstae                      TYPE c LENGTH 4,
        "! Revlv
        revlv                      TYPE c LENGTH 2,
        "! Geber
        geber                      TYPE c LENGTH 10,
        "! Fistl
        fistl                      TYPE c LENGTH 16,
        "! Fipos
        fipos                      TYPE c LENGTH 14,
        "! KoGsber
        ko_gsber                   TYPE c LENGTH 4,
        "! KoPargb
        ko_pargb                   TYPE c LENGTH 4,
        "! KoPrctr
        ko_prctr                   TYPE c LENGTH 10,
        "! KoPprctr
        ko_pprctr                  TYPE c LENGTH 10,
        "! Meprf
        meprf                      TYPE c LENGTH 1,
        "! Brgew
        brgew                      TYPE p LENGTH 7 DECIMALS 3,
        "! Volum
        volum                      TYPE p LENGTH 7 DECIMALS 3,
        "! Voleh
        voleh                      TYPE c LENGTH 3,
        "! Inco1
        inco_1                     TYPE c LENGTH 3,
        "! Inco2
        inco_2                     TYPE c LENGTH 28,
        "! Vorab
        vorab                      TYPE abap_bool,
        "! Kolif
        kolif                      TYPE c LENGTH 10,
        "! Ltsnr
        ltsnr                      TYPE c LENGTH 6,
        "! Packno
        packno                     TYPE c LENGTH 10,
        "! Fplnr
        fplnr                      TYPE c LENGTH 10,
        "! Stapo
        stapo                      TYPE abap_bool,
        "! Uebpo
        uebpo                      TYPE c LENGTH 5,
        "! Lewed
        lewed                      TYPE datn,
        "! Emlif
        emlif                      TYPE c LENGTH 10,
        "! Lblkz
        lblkz                      TYPE abap_bool,
        "! Satnr
        satnr                      TYPE c LENGTH 18,
        "! Attyp
        attyp                      TYPE c LENGTH 2,
        "! Vsart
        vsart                      TYPE c LENGTH 2,
        "! Handoverloc
        handoverloc                TYPE c LENGTH 10,
        "! Kanba
        kanba                      TYPE c LENGTH 1,
        "! Adrn2
        adrn_2                     TYPE c LENGTH 10,
        "! DeliveryAddressType
        delivery_address_type      TYPE c LENGTH 1,
        "! Cuobj
        cuobj                      TYPE c LENGTH 18,
        "! Xersy
        xersy                      TYPE abap_bool,
        "! Eildt
        eildt                      TYPE datn,
        "! Drdat
        drdat                      TYPE datn,
        "! Druhr
        druhr                      TYPE timn,
        "! Drunr
        drunr                      TYPE c LENGTH 4,
        "! Aktnr
        aktnr                      TYPE c LENGTH 10,
        "! Abeln
        abeln                      TYPE c LENGTH 10,
        "! Abelp
        abelp                      TYPE c LENGTH 5,
        "! Punei
        punei                      TYPE c LENGTH 3,
        "! Saiso
        saiso                      TYPE c LENGTH 4,
        "! Saisj
        saisj                      TYPE c LENGTH 4,
        "! Ebon2
        ebon_2                     TYPE c LENGTH 2,
        "! Ebon3
        ebon_3                     TYPE c LENGTH 2,
        "! Ebonf
        ebonf                      TYPE abap_bool,
        "! Mlmaa
        mlmaa                      TYPE abap_bool,
        "! Mhdrz
        mhdrz                      TYPE p LENGTH 3 DECIMALS 0,
        "! Anfnr
        anfnr                      TYPE c LENGTH 10,
        "! Anfps
        anfps                      TYPE c LENGTH 5,
        "! Kzkfg
        kzkfg                      TYPE c LENGTH 1,
        "! Usequ
        usequ                      TYPE c LENGTH 1,
        "! Umsok
        umsok                      TYPE c LENGTH 1,
        "! Banfn
        banfn                      TYPE c LENGTH 10,
        "! Bnfpo
        bnfpo                      TYPE c LENGTH 5,
        "! Mtart
        mtart                      TYPE c LENGTH 4,
        "! Uptyp
        uptyp                      TYPE c LENGTH 1,
        "! Upvor
        upvor                      TYPE c LENGTH 1,
        "! Sikgr
        sikgr                      TYPE c LENGTH 3,
        "! Retpo
        retpo                      TYPE abap_bool,
        "! Aurel
        aurel                      TYPE c LENGTH 1,
        "! Bsgru
        bsgru                      TYPE c LENGTH 3,
        "! Lfret
        lfret                      TYPE c LENGTH 4,
        "! Mfrgr
        mfrgr                      TYPE c LENGTH 8,
        "! Nrfhg
        nrfhg                      TYPE c LENGTH 1,
        "! J1bnbm
        j_1_bnbm                   TYPE c LENGTH 16,
        "! J1bmatuse
        j_1_bmatuse                TYPE c LENGTH 1,
        "! J1bmatorg
        j_1_bmatorg                TYPE c LENGTH 1,
        "! J1bownpro
        j_1_bownpro                TYPE abap_bool,
        "! J1bindust
        j_1_bindust                TYPE c LENGTH 2,
        "! Abueb
        abueb                      TYPE c LENGTH 4,
        "! Nlabd
        nlabd                      TYPE datn,
        "! Nfabd
        nfabd                      TYPE datn,
        "! Kzbws
        kzbws                      TYPE c LENGTH 1,
        "! Fabkz
        fabkz                      TYPE c LENGTH 1,
        "! Loadingpoint
        loadingpoint               TYPE c LENGTH 20,
        "! J1aindxp
        j_1_aindxp                 TYPE c LENGTH 5,
        "! J1aidatep
        j_1_aidatep                TYPE datn,
        "! Mprof
        mprof                      TYPE c LENGTH 4,
        "! Eglkz
        eglkz                      TYPE abap_bool,
        "! Kztlf
        kztlf                      TYPE c LENGTH 1,
        "! Kzfme
        kzfme                      TYPE c LENGTH 1,
        "! Rdprf
        rdprf                      TYPE c LENGTH 4,
        "! Techs
        techs                      TYPE c LENGTH 12,
        "! ChgSrv
        chg_srv                    TYPE abap_bool,
        "! ChgFplnr
        chg_fplnr                  TYPE abap_bool,
        "! Mfrpn
        mfrpn                      TYPE c LENGTH 40,
        "! Mfrnr
        mfrnr                      TYPE c LENGTH 10,
        "! Emnfr
        emnfr                      TYPE c LENGTH 10,
        "! Novet
        novet                      TYPE abap_bool,
        "! Afnam
        afnam                      TYPE c LENGTH 12,
        "! Tzonrc
        tzonrc                     TYPE c LENGTH 6,
        "! Iprkz
        iprkz                      TYPE c LENGTH 1,
        "! Lebre
        lebre                      TYPE abap_bool,
        "! Berid
        berid                      TYPE c LENGTH 10,
        "! Xconditions
        xconditions                TYPE c LENGTH 1,
        "! Apoms
        apoms                      TYPE c LENGTH 1,
        "! Ccomp
        ccomp                      TYPE c LENGTH 1,
        "! GrantNbr
        grant_nbr                  TYPE c LENGTH 20,
        "! Fkber
        fkber                      TYPE c LENGTH 16,
        "! Status
        status                     TYPE c LENGTH 1,
        "! Reslo
        reslo                      TYPE c LENGTH 4,
        "! Kblnr
        kblnr                      TYPE c LENGTH 10,
        "! Kblpos
        kblpos                     TYPE c LENGTH 3,
        "! PsPspPnr
        ps_psp_pnr                 TYPE c LENGTH 8,
        "! Kostl
        kostl                      TYPE c LENGTH 10,
        "! Sakto
        sakto                      TYPE c LENGTH 10,
        "! Weora
        weora                      TYPE abap_bool,
        "! SrvBasCom
        srv_bas_com                TYPE abap_bool,
        "! PrioUrg
        prio_urg                   TYPE c LENGTH 2,
        "! PrioReq
        prio_req                   TYPE c LENGTH 3,
        "! Empst
        empst                      TYPE c LENGTH 25,
        "! DiffInvoice
        diff_invoice               TYPE c LENGTH 2,
        "! TrmriskRelevant
        trmrisk_relevant           TYPE c LENGTH 2,
        "! Creationdate
        creationdate               TYPE datn,
        "! Creationtime
        creationtime               TYPE timn,
        "! VcmChainCategory
        vcm_chain_category         TYPE c LENGTH 4,
        "! SpeAbgru
        spe_abgru                  TYPE c LENGTH 2,
        "! SpeCrmSo
        spe_crm_so                 TYPE c LENGTH 10,
        "! SpeCrmSoItem
        spe_crm_so_item            TYPE c LENGTH 6,
        "! SpeCrmRefSo
        spe_crm_ref_so             TYPE c LENGTH 35,
        "! SpeCrmRefItem
        spe_crm_ref_item           TYPE c LENGTH 6,
        "! SpeCrmFkrel
        spe_crm_fkrel              TYPE c LENGTH 1,
        "! SpeChngSys
        spe_chng_sys               TYPE c LENGTH 1,
        "! SpeInsmkSrc
        spe_insmk_src              TYPE c LENGTH 1,
        "! SpeCqCtrltype
        spe_cq_ctrltype            TYPE c LENGTH 1,
        "! SpeCqNocq
        spe_cq_nocq                TYPE abap_bool,
        "! ReasonCode
        reason_code                TYPE c LENGTH 4,
        "! Anzsn
        anzsn                      TYPE int4,
        "! SpeEwmDtc
        spe_ewm_dtc                TYPE abap_bool,
        "! Exlin
        exlin                      TYPE c LENGTH 40,
        "! Exsnr
        exsnr                      TYPE c LENGTH 5,
        "! Ehtyp
        ehtyp                      TYPE c LENGTH 4,
        "! Retpc
        retpc                      TYPE p LENGTH 3 DECIMALS 2,
        "! Dptyp
        dptyp                      TYPE c LENGTH 4,
        "! Dppct
        dppct                      TYPE p LENGTH 3 DECIMALS 2,
        "! Dpdat
        dpdat                      TYPE datn,
        "! FlsRsto
        fls_rsto                   TYPE abap_bool,
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
        "! GoodsCountCorrection
        goods_count_correction     TYPE abap_bool,
        "! Lifex
        lifex                      TYPE c LENGTH 35,
        "! Lifexpos
        lifexpos                   TYPE c LENGTH 6,
        "! BlkReasonId
        blk_reason_id              TYPE c LENGTH 4,
        "! BlkReasonTxt
        blk_reason_txt             TYPE c LENGTH 40,
        "! Itcons
        itcons                     TYPE abap_bool,
        "! Fixmg
        fixmg                      TYPE c LENGTH 1,
        "! Wabwe
        wabwe                      TYPE abap_bool,
        "! CmplDlvItm
        cmpl_dlv_itm               TYPE abap_bool,
        "! Inco2L
        inco_2_l                   TYPE c LENGTH 70,
        "! Inco3L
        inco_3_l                   TYPE c LENGTH 70,
        "! Inco2Key
        inco_2_key                 TYPE sysuuid_x16,
        "! Inco3Key
        inco_3_key                 TYPE sysuuid_x16,
        "! Inco4Key
        inco_4_key                 TYPE sysuuid_x16,
        "! Stawn
        stawn                      TYPE c LENGTH 30,
        "! Isvco
        isvco                      TYPE c LENGTH 30,
        "! Serviceperformer
        serviceperformer           TYPE c LENGTH 10,
        "! Producttype
        producttype                TYPE c LENGTH 2,
        "! GrBySes
        gr_by_ses                  TYPE abap_bool,
        "! PriceChangeInSesAllowed
        price_change_in_ses_allowe TYPE abap_bool,
        "! Requestforquotation
        requestforquotation        TYPE c LENGTH 10,
        "! Requestforquotationitem
        requestforquotationitem    TYPE c LENGTH 5,
        "! RenegotiationStatus
        renegotiation_status       TYPE c LENGTH 1,
        "! StatusPcs
        status_pcs                 TYPE c LENGTH 1,
        "! StatusPma
        status_pma                 TYPE c LENGTH 1,
        "! StatusDg
        status_dg                  TYPE c LENGTH 1,
        "! StatusSds
        status_sds                 TYPE c LENGTH 1,
        "! Extmaterialforpurg
        extmaterialforpurg         TYPE c LENGTH 18,
        "! ProcmtHubSourceSystem
        procmt_hub_source_system   TYPE c LENGTH 10,
        "! Externalreferenceid
        externalreferenceid        TYPE c LENGTH 70,
        "! TcAutDet
        tc_aut_det                 TYPE c LENGTH 2,
        "! ManualTcReason
        manual_tc_reason           TYPE c LENGTH 2,
        "! FiscalIncentive
        fiscal_incentive           TYPE c LENGTH 4,
        "! TaxSubjectSt
        tax_subject_st             TYPE c LENGTH 1,
        "! FiscalIncentiveId
        fiscal_incentive_id        TYPE c LENGTH 4,
        "! SfTxjcd
        sf_txjcd                   TYPE c LENGTH 15,
        "! DummyEkpoInclEewPs
        dummy_ekpo_incl_eew_ps     TYPE c LENGTH 1,
        "! ContractForLimit
        contract_for_limit         TYPE c LENGTH 10,
        "! EnhDate1
        enh_date_1                 TYPE datn,
        "! EnhDate2
        enh_date_2                 TYPE datn,
        "! EnhPercent
        enh_percent                TYPE p LENGTH 3 DECIMALS 2,
        "! EnhNumc1
        enh_numc_1                 TYPE c LENGTH 10,
        "! Dataaging
        dataaging                  TYPE datn,
        "! Cupit
        cupit                      TYPE c LENGTH 10,
        "! Cigit
        cigit                      TYPE c LENGTH 10,
        "! Mgoit
        mgoit                      TYPE c LENGTH 2,
        "! TxsBusinessTransaction
        txs_business_transaction   TYPE c LENGTH 4,
        "! TxsMaterialUsage
        txs_material_usage         TYPE c LENGTH 1,
        "! TxsUsagePurpose
        txs_usage_purpose          TYPE c LENGTH 25,
        "! xbev1xnegenItem
        xbev_1_xnegen_item         TYPE abap_bool,
        "! xbev1xnedepfree
        xbev_1_xnedepfree          TYPE abap_bool,
        "! xbev1xnestruccat
        xbev_1_xnestruccat         TYPE c LENGTH 1,
        "! Advcode
        advcode                    TYPE c LENGTH 2,
        "! BudgetPd
        budget_pd                  TYPE c LENGTH 10,
        "! Excpe
        excpe                      TYPE c LENGTH 2,
        "! FmfgusKey
        fmfgus_key                 TYPE sysuuid_x16,
        "! IuidRelevant
        iuid_relevant              TYPE c LENGTH 1,
        "! Mrpind
        mrpind                     TYPE c LENGTH 1,
        "! SgtScat
        sgt_scat                   TYPE c LENGTH 40,
        "! SgtRcat
        sgt_rcat                   TYPE c LENGTH 40,
        "! TmsRefUuid
        tms_ref_uuid               TYPE sysuuid_x16,
        "! TmsSrcLocKey
        tms_src_loc_key            TYPE sysuuid_x16,
        "! TmsDesLocKey
        tms_des_loc_key            TYPE sysuuid_x16,
        "! WrfCharstc1
        wrf_charstc_1              TYPE c LENGTH 18,
        "! WrfCharstc2
        wrf_charstc_2              TYPE c LENGTH 18,
        "! WrfCharstc3
        wrf_charstc_3              TYPE c LENGTH 18,
        "! Refsite
        refsite                    TYPE c LENGTH 4,
        "! xdmbexoptionalitykey
        xdmbexoptionalitykey       TYPE c LENGTH 4,
        "! xdmbexoptionalityfor
        xdmbexoptionalityfor       TYPE c LENGTH 4,
        "! xdmbexcimax2
        xdmbexcimax_2              TYPE c LENGTH 5,
        "! xdmbexitemType
        xdmbexitem_type            TYPE c LENGTH 1,
        "! xdmbexeffectivedatefrom
        xdmbexeffectivedatefrom    TYPE datn,
        "! xdmbexeffectivedateto
        xdmbexeffectivedateto      TYPE datn,
        "! xdmbexoptionof
        xdmbexoptionof             TYPE c LENGTH 5,
        "! xdmbexaccountingType
        xdmbexaccounting_type      TYPE c LENGTH 2,
        "! xdmbexfasCode
        xdmbexfas_code             TYPE c LENGTH 4,
        "! xdmbexschedulingDesk
        xdmbexscheduling_desk      TYPE c LENGTH 6,
        "! xdmbexcomponentfor
        xdmbexcomponentfor         TYPE c LENGTH 4,
        "! xdmbexmixedproduct
        xdmbexmixedproduct         TYPE c LENGTH 18,
        "! xdmbexposteddate
        xdmbexposteddate           TYPE datn,
        "! xdmbexdealPosted
        xdmbexdeal_posted          TYPE abap_bool,
        "! xdmbexinvoiceuom
        xdmbexinvoiceuom           TYPE c LENGTH 3,
        "! Zapcgk
        zapcgk                     TYPE c LENGTH 4,
        "! ApcgkExtend
        apcgk_extend               TYPE c LENGTH 10,
        "! ZbasDate
        zbas_date                  TYPE datn,
        "! Zadattyp
        zadattyp                   TYPE c LENGTH 1,
        "! ZstartDat
        zstart_dat                 TYPE datn,
        "! ZDev
        zdev                       TYPE p LENGTH 4 DECIMALS 3,
        "! Zindanx
        zindanx                    TYPE abap_bool,
        "! ZlimitDat
        zlimit_dat                 TYPE datn,
        "! Numerator
        numerator                  TYPE c LENGTH 20,
        "! HashcalBdat
        hashcal_bdat               TYPE datn,
        "! Hashcal
        hashcal                    TYPE c LENGTH 1,
        "! Negative
        negative                   TYPE c LENGTH 1,
        "! HashcalExists
        hashcal_exists             TYPE c LENGTH 4,
        "! KnownIndex
        known_index                TYPE abap_bool,
        "! xsapmpxgpose
        xsapmpxgpose               TYPE c LENGTH 5,
        "! Angpn
        angpn                      TYPE c LENGTH 6,
        "! Admoi
        admoi                      TYPE c LENGTH 4,
        "! Adpri
        adpri                      TYPE c LENGTH 3,
        "! Lprio
        lprio                      TYPE c LENGTH 2,
        "! Adacn
        adacn                      TYPE c LENGTH 10,
        "! Afpnr
        afpnr                      TYPE c LENGTH 6,
        "! Bsark
        bsark                      TYPE c LENGTH 4,
        "! Audat
        audat                      TYPE datn,
        "! Angnr
        angnr                      TYPE c LENGTH 20,
        "! Pnstat
        pnstat                     TYPE abap_bool,
        "! Addns
        addns                      TYPE c LENGTH 1,
        "! AssignmentPriority
        assignment_priority        TYPE c LENGTH 10,
        "! ArunGroupPrio
        arun_group_prio            TYPE c LENGTH 10,
        "! ArunOrderPrio
        arun_order_prio            TYPE int4,
        "! Serru
        serru                      TYPE c LENGTH 1,
        "! Sernp
        sernp                      TYPE c LENGTH 4,
        "! DisubSobkz
        disub_sobkz                TYPE c LENGTH 1,
        "! DisubPspnr
        disub_pspnr                TYPE c LENGTH 8,
        "! DisubKunnr
        disub_kunnr                TYPE c LENGTH 10,
        "! DisubVbeln
        disub_vbeln                TYPE c LENGTH 10,
        "! DisubPosnr
        disub_posnr                TYPE c LENGTH 6,
        "! DisubOwner
        disub_owner                TYPE c LENGTH 10,
        "! FshSeasonYear
        fsh_season_year            TYPE c LENGTH 4,
        "! FshSeason
        fsh_season                 TYPE c LENGTH 10,
        "! FshCollection
        fsh_collection             TYPE c LENGTH 10,
        "! FshTheme
        fsh_theme                  TYPE c LENGTH 10,
        "! FshAtpDate
        fsh_atp_date               TYPE datn,
        "! FshVasRel
        fsh_vas_rel                TYPE c LENGTH 1,
        "! FshVasPrntId
        fsh_vas_prnt_id            TYPE c LENGTH 5,
        "! FshTransaction
        fsh_transaction            TYPE c LENGTH 10,
        "! FshItemGroup
        fsh_item_group             TYPE c LENGTH 5,
        "! FshItem
        fsh_item                   TYPE c LENGTH 5,
        "! FshSs
        fsh_ss                     TYPE c LENGTH 3,
        "! FshGridCondRec
        fsh_grid_cond_rec          TYPE c LENGTH 32,
        "! FshPsmPfmSplit
        fsh_psm_pfm_split          TYPE c LENGTH 15,
        "! FshPqrUepos
        fsh_pqr_uepos              TYPE c LENGTH 6,
        "! RfmDiversion
        rfm_diversion              TYPE c LENGTH 1,
        "! RfmSccIndicator
        rfm_scc_indicator          TYPE c LENGTH 1,
        "! Stpac
        stpac                      TYPE c LENGTH 1,
        "! Lgbzo
        lgbzo                      TYPE c LENGTH 10,
        "! LgbzoB
        lgbzo_b                    TYPE c LENGTH 10,
        "! Addrnum
        addrnum                    TYPE c LENGTH 10,
        "! Consnum
        consnum                    TYPE c LENGTH 3,
        "! BorgrMiss
        borgr_miss                 TYPE c LENGTH 1,
        "! DepId
        dep_id                     TYPE c LENGTH 12,
        "! Belnr
        belnr                      TYPE c LENGTH 10,
        "! KblposCab
        kblpos_cab                 TYPE c LENGTH 3,
        "! KblnrComp
        kblnr_comp                 TYPE c LENGTH 10,
        "! KblposComp
        kblpos_comp                TYPE c LENGTH 3,
        "! WbsElement
        wbs_element                TYPE c LENGTH 8,
        "! RfmPsstRule
        rfm_psst_rule              TYPE c LENGTH 4,
        "! RfmPsstGroup
        rfm_psst_group             TYPE c LENGTH 10,
        "! RfmRefDoc
        rfm_ref_doc                TYPE c LENGTH 10,
        "! RfmRefItem
        rfm_ref_item               TYPE c LENGTH 6,
        "! RfmRefAction
        rfm_ref_action             TYPE c LENGTH 1,
        "! RfmRefSlitem
        rfm_ref_slitem             TYPE c LENGTH 4,
        "! RefItem
        ref_item                   TYPE c LENGTH 5,
        "! SourceId
        source_id                  TYPE c LENGTH 3,
        "! SourceKey
        source_key                 TYPE c LENGTH 32,
        "! PutBack
        put_back                   TYPE abap_bool,
        "! PolId
        pol_id                     TYPE c LENGTH 10,
        "! ConsOrder
        cons_order                 TYPE c LENGTH 1,
      END OF tys_z_i_ekpotype,
      "! <p class="shorttext synchronized">List of Z_I_EKPOType</p>
      tyt_z_i_ekpotype TYPE STANDARD TABLE OF tys_z_i_ekpotype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_ESLLType</p>
      BEGIN OF tys_z_i_eslltype,
        "! <em>Key property</em> Packno
        packno          TYPE c LENGTH 10,
        "! <em>Key property</em> Introw
        introw          TYPE c LENGTH 10,
        "! Extrow
        extrow          TYPE c LENGTH 10,
        "! Del
        del             TYPE c LENGTH 1,
        "! Srvpos
        srvpos          TYPE c LENGTH 18,
        "! Rang
        rang            TYPE int1,
        "! Extgroup
        extgroup        TYPE c LENGTH 8,
        "! Package2
        package_2       TYPE c LENGTH 1,
        "! SubPackno
        sub_packno      TYPE c LENGTH 10,
        "! Lbnum
        lbnum           TYPE c LENGTH 3,
        "! Ausgb
        ausgb           TYPE c LENGTH 4,
        "! Stlvpos
        stlvpos         TYPE c LENGTH 18,
        "! Extsrvno
        extsrvno        TYPE c LENGTH 18,
        "! Menge
        menge           TYPE p LENGTH 7 DECIMALS 3,
        "! Meins
        meins           TYPE c LENGTH 3,
        "! Uebto
        uebto           TYPE p LENGTH 2 DECIMALS 1,
        "! Uebtk
        uebtk           TYPE abap_bool,
        "! WithLim
        with_lim        TYPE c LENGTH 1,
        "! Spinf
        spinf           TYPE abap_bool,
        "! Peinh
        peinh           TYPE p LENGTH 3 DECIMALS 0,
        "! Brtwr
        brtwr           TYPE p LENGTH 6 DECIMALS 2,
        "! Netwr
        netwr           TYPE p LENGTH 6 DECIMALS 2,
        "! Frompos
        frompos         TYPE c LENGTH 6,
        "! Topos
        topos           TYPE c LENGTH 6,
        "! Ktext1
        ktext_1         TYPE c LENGTH 40,
        "! Vrtkz
        vrtkz           TYPE c LENGTH 1,
        "! Twrkz
        twrkz           TYPE c LENGTH 1,
        "! Pernr
        pernr           TYPE c LENGTH 8,
        "! Molga
        molga           TYPE c LENGTH 2,
        "! Lgart
        lgart           TYPE c LENGTH 4,
        "! Lgtxt
        lgtxt           TYPE c LENGTH 25,
        "! Stell
        stell           TYPE c LENGTH 8,
        "! Iftnr
        iftnr           TYPE c LENGTH 10,
        "! Budat
        budat           TYPE datn,
        "! Insdt
        insdt           TYPE datn,
        "! PlnPackno
        pln_packno      TYPE c LENGTH 10,
        "! PlnIntrow
        pln_introw      TYPE c LENGTH 10,
        "! KntPackno
        knt_packno      TYPE c LENGTH 10,
        "! KntIntrow
        knt_introw      TYPE c LENGTH 10,
        "! TmpPackno
        tmp_packno      TYPE c LENGTH 10,
        "! TmpIntrow
        tmp_introw      TYPE c LENGTH 10,
        "! StlvLim
        stlv_lim        TYPE abap_bool,
        "! LimitRow
        limit_row       TYPE c LENGTH 10,
        "! ActMenge
        act_menge       TYPE p LENGTH 7 DECIMALS 3,
        "! ActWert
        act_wert        TYPE p LENGTH 6 DECIMALS 2,
        "! KntWert
        knt_wert        TYPE p LENGTH 6 DECIMALS 2,
        "! KntMenge
        knt_menge       TYPE p LENGTH 7 DECIMALS 3,
        "! Zielwert
        zielwert        TYPE p LENGTH 6 DECIMALS 2,
        "! UngWert
        ung_wert        TYPE p LENGTH 6 DECIMALS 2,
        "! UngMenge
        ung_menge       TYPE p LENGTH 7 DECIMALS 3,
        "! AltIntrow
        alt_introw      TYPE c LENGTH 10,
        "! Basic
        basic           TYPE c LENGTH 1,
        "! Alternat
        alternat        TYPE c LENGTH 1,
        "! Bidder
        bidder          TYPE c LENGTH 1,
        "! Supple
        supple          TYPE c LENGTH 1,
        "! Freeqty
        freeqty         TYPE c LENGTH 1,
        "! Inform
        inform          TYPE c LENGTH 1,
        "! Pausch
        pausch          TYPE c LENGTH 1,
        "! Eventual
        eventual        TYPE c LENGTH 1,
        "! Mwskz
        mwskz           TYPE c LENGTH 2,
        "! Txjcd
        txjcd           TYPE c LENGTH 15,
        "! Txdat
        txdat           TYPE datn,
        "! PrsChg
        prs_chg         TYPE abap_bool,
        "! Matkl
        matkl           TYPE c LENGTH 9,
        "! Tbtwr
        tbtwr           TYPE p LENGTH 6 DECIMALS 2,
        "! Navnw
        navnw           TYPE p LENGTH 6 DECIMALS 2,
        "! Baswr
        baswr           TYPE p LENGTH 6 DECIMALS 2,
        "! Kknumv
        kknumv          TYPE c LENGTH 10,
        "! Iwein
        iwein           TYPE c LENGTH 3,
        "! IntWork
        int_work        TYPE p LENGTH 5 DECIMALS 2,
        "! Externalid
        externalid      TYPE c LENGTH 40,
        "! Kstar
        kstar           TYPE c LENGTH 10,
        "! ActWork
        act_work        TYPE p LENGTH 5 DECIMALS 2,
        "! Mapno
        mapno           TYPE c LENGTH 4,
        "! Srvmapkey
        srvmapkey       TYPE c LENGTH 10,
        "! Taxtariffcode
        taxtariffcode   TYPE c LENGTH 16,
        "! Sdate
        sdate           TYPE datn,
        "! Begtime
        begtime         TYPE timn,
        "! Endtime
        endtime         TYPE timn,
        "! Persext
        persext         TYPE c LENGTH 40,
        "! Catscounte
        catscounte      TYPE c LENGTH 12,
        "! Stokz
        stokz           TYPE abap_bool,
        "! Belnr
        belnr           TYPE c LENGTH 10,
        "! Formelnr
        formelnr        TYPE c LENGTH 10,
        "! Frmval1
        frmval_1        TYPE p LENGTH 7 DECIMALS 3,
        "! Frmval2
        frmval_2        TYPE p LENGTH 7 DECIMALS 3,
        "! Frmval3
        frmval_3        TYPE p LENGTH 7 DECIMALS 3,
        "! Frmval4
        frmval_4        TYPE p LENGTH 7 DECIMALS 3,
        "! Frmval5
        frmval_5        TYPE p LENGTH 7 DECIMALS 3,
        "! Userf1Num
        userf_1_num     TYPE c LENGTH 10,
        "! Userf2Num
        userf_2_num     TYPE p LENGTH 7 DECIMALS 3,
        "! Userf1Txt
        userf_1_txt     TYPE c LENGTH 40,
        "! Userf2Txt
        userf_2_txt     TYPE c LENGTH 10,
        "! Knobj
        knobj           TYPE c LENGTH 18,
        "! Chgtext
        chgtext         TYPE abap_bool,
        "! Kalnr
        kalnr           TYPE c LENGTH 12,
        "! Klvar
        klvar           TYPE c LENGTH 4,
        "! Extdes
        extdes          TYPE c LENGTH 10,
        "! Bosinter
        bosinter        TYPE c LENGTH 1,
        "! Bosgrp
        bosgrp          TYPE c LENGTH 4,
        "! BosRisk
        bos_risk        TYPE c LENGTH 1,
        "! BosEcp
        bos_ecp         TYPE abap_bool,
        "! Chgltext
        chgltext        TYPE abap_bool,
        "! Bosgruppenr
        bosgruppenr     TYPE c LENGTH 3,
        "! Boslfdnr
        boslfdnr        TYPE c LENGTH 1,
        "! Bosdrukz
        bosdrukz        TYPE c LENGTH 1,
        "! Bossuppleno
        bossuppleno     TYPE c LENGTH 3,
        "! Bossupplestatus
        bossupplestatus TYPE c LENGTH 1,
        "! xsapboqxobjtype
        xsapboqxobjtype TYPE c LENGTH 1,
        "! xsapboqxsposnr
        xsapboqxsposnr  TYPE c LENGTH 4,
        "! xsapboqxmintrow
        xsapboqxmintrow TYPE c LENGTH 10,
        "! xsapboqxqtRel
        xsapboqxqt_rel  TYPE c LENGTH 1,
        "! xsapboqxckQty
        xsapboqxck_qty  TYPE abap_bool,
        "! xsapboqxmFrate
        xsapboqxm_frate TYPE abap_bool,
        "! Extrefkey
        extrefkey       TYPE c LENGTH 40,
        "! InvMenge
        inv_menge       TYPE p LENGTH 7 DECIMALS 3,
        "! Dataaging
        dataaging       TYPE datn,
        "! PerSdate
        per_sdate       TYPE datn,
        "! PerEdate
        per_edate       TYPE datn,
      END OF tys_z_i_eslltype,
      "! <p class="shorttext synchronized">List of Z_I_ESLLType</p>
      tyt_z_i_eslltype TYPE STANDARD TABLE OF tys_z_i_eslltype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_LFM1Type</p>
      BEGIN OF tys_z_i_lfm_1_type,
        "! <em>Key property</em> Lifnr
        lifnr           TYPE c LENGTH 10,
        "! <em>Key property</em> Ekorg
        ekorg           TYPE c LENGTH 4,
        "! Erdat
        erdat           TYPE datn,
        "! Ernam
        ernam           TYPE c LENGTH 12,
        "! Sperm
        sperm           TYPE abap_bool,
        "! Loevm
        loevm           TYPE abap_bool,
        "! Lfabc
        lfabc           TYPE c LENGTH 1,
        "! Waers
        waers           TYPE c LENGTH 5,
        "! Verkf
        verkf           TYPE c LENGTH 30,
        "! Telf1
        telf_1          TYPE c LENGTH 16,
        "! Minbw
        minbw           TYPE p LENGTH 7 DECIMALS 3,
        "! Zterm
        zterm           TYPE c LENGTH 4,
        "! Inco1
        inco_1          TYPE c LENGTH 3,
        "! Inco2
        inco_2          TYPE c LENGTH 28,
        "! Webre
        webre           TYPE abap_bool,
        "! Kzabs
        kzabs           TYPE abap_bool,
        "! Kalsk
        kalsk           TYPE c LENGTH 2,
        "! Kzaut
        kzaut           TYPE abap_bool,
        "! Expvz
        expvz           TYPE c LENGTH 1,
        "! Zolla
        zolla           TYPE c LENGTH 6,
        "! Meprf
        meprf           TYPE c LENGTH 1,
        "! Ekgrp
        ekgrp           TYPE c LENGTH 3,
        "! Xersy
        xersy           TYPE abap_bool,
        "! Plifz
        plifz           TYPE p LENGTH 2 DECIMALS 0,
        "! Mrppp
        mrppp           TYPE c LENGTH 3,
        "! Lfrhy
        lfrhy           TYPE c LENGTH 3,
        "! Libes
        libes           TYPE c LENGTH 1,
        "! Lipre
        lipre           TYPE c LENGTH 2,
        "! Liser
        liser           TYPE c LENGTH 1,
        "! Incov
        incov           TYPE c LENGTH 4,
        "! Inco2L
        inco_2_l        TYPE c LENGTH 70,
        "! Inco3L
        inco_3_l        TYPE c LENGTH 70,
        "! Weora
        weora           TYPE abap_bool,
        "! Prfre
        prfre           TYPE abap_bool,
        "! Nrgew
        nrgew           TYPE c LENGTH 1,
        "! Boind
        boind           TYPE abap_bool,
        "! Blind
        blind           TYPE abap_bool,
        "! Kzret
        kzret           TYPE abap_bool,
        "! Skrit
        skrit           TYPE c LENGTH 1,
        "! Bstae
        bstae           TYPE c LENGTH 4,
        "! Rdprf
        rdprf           TYPE c LENGTH 4,
        "! Megru
        megru           TYPE c LENGTH 4,
        "! Vensl
        vensl           TYPE p LENGTH 3 DECIMALS 1,
        "! Bopnr
        bopnr           TYPE c LENGTH 4,
        "! Xersr
        xersr           TYPE abap_bool,
        "! Eikto
        eikto           TYPE c LENGTH 12,
        "! Abueb
        abueb           TYPE c LENGTH 4,
        "! Paprf
        paprf           TYPE c LENGTH 4,
        "! Agrel
        agrel           TYPE abap_bool,
        "! Xnbwy
        xnbwy           TYPE abap_bool,
        "! Vsbed
        vsbed           TYPE c LENGTH 2,
        "! Lebre
        lebre           TYPE abap_bool,
        "! Bolre
        bolre           TYPE abap_bool,
        "! Umsae
        umsae           TYPE abap_bool,
        "! VendorRmaReq
        vendor_rma_req  TYPE c LENGTH 1,
        "! Lfm1EewPs
        lfm_1_eew_ps    TYPE c LENGTH 1,
        "! J1nboesl
        j_1_nboesl      TYPE c LENGTH 3,
        "! Aubel
        aubel           TYPE abap_bool,
        "! ValidPro
        valid_pro       TYPE c LENGTH 4,
        "! Hscpe
        hscpe           TYPE p LENGTH 3 DECIMALS 2,
        "! FshScCid
        fsh_sc_cid      TYPE c LENGTH 2,
        "! FshVasDetc
        fsh_vas_detc    TYPE c LENGTH 1,
        "! Upprs
        upprs           TYPE c LENGTH 1,
        "! ActivityProfil
        activity_profil TYPE c LENGTH 4,
        "! StagingTime
        staging_time    TYPE p LENGTH 2 DECIMALS 0,
      END OF tys_z_i_lfm_1_type,
      "! <p class="shorttext synchronized">List of Z_I_LFM1Type</p>
      tyt_z_i_lfm_1_type TYPE STANDARD TABLE OF tys_z_i_lfm_1_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_T001WType</p>
      BEGIN OF tys_z_i_t_001_wtype,
        "! <em>Key property</em> Werks
        werks                      TYPE c LENGTH 4,
        "! Name1
        name_1                     TYPE c LENGTH 30,
        "! Bwkey
        bwkey                      TYPE c LENGTH 4,
        "! Kunnr
        kunnr                      TYPE c LENGTH 10,
        "! Lifnr
        lifnr                      TYPE c LENGTH 10,
        "! Fabkl
        fabkl                      TYPE c LENGTH 2,
        "! Name2
        name_2                     TYPE c LENGTH 30,
        "! Stras
        stras                      TYPE c LENGTH 30,
        "! Pfach
        pfach                      TYPE c LENGTH 10,
        "! Pstlz
        pstlz                      TYPE c LENGTH 10,
        "! Ort01
        ort_01                     TYPE c LENGTH 25,
        "! Ekorg
        ekorg                      TYPE c LENGTH 4,
        "! Vkorg
        vkorg                      TYPE c LENGTH 4,
        "! Chazv
        chazv                      TYPE abap_bool,
        "! Kkowk
        kkowk                      TYPE c LENGTH 1,
        "! Kordb
        kordb                      TYPE abap_bool,
        "! Bedpl
        bedpl                      TYPE abap_bool,
        "! Land1
        land_1                     TYPE c LENGTH 3,
        "! Regio
        regio                      TYPE c LENGTH 3,
        "! Counc
        counc                      TYPE c LENGTH 3,
        "! Cityc
        cityc                      TYPE c LENGTH 4,
        "! Adrnr
        adrnr                      TYPE c LENGTH 10,
        "! Iwerk
        iwerk                      TYPE c LENGTH 4,
        "! Txjcd
        txjcd                      TYPE c LENGTH 15,
        "! Vtweg
        vtweg                      TYPE c LENGTH 2,
        "! Spart
        spart                      TYPE c LENGTH 2,
        "! Spras
        spras                      TYPE c LENGTH 2,
        "! Wksop
        wksop                      TYPE abap_bool,
        "! Awsls
        awsls                      TYPE c LENGTH 6,
        "! ChazvOld
        chazv_old                  TYPE abap_bool,
        "! Vlfkz
        vlfkz                      TYPE c LENGTH 1,
        "! Bzirk
        bzirk                      TYPE c LENGTH 6,
        "! Zone1
        zone_1                     TYPE c LENGTH 10,
        "! Taxiw
        taxiw                      TYPE c LENGTH 1,
        "! Bzqhl
        bzqhl                      TYPE abap_bool,
        "! Let01
        let_01                     TYPE p LENGTH 2 DECIMALS 0,
        "! Let02
        let_02                     TYPE p LENGTH 2 DECIMALS 0,
        "! Let03
        let_03                     TYPE p LENGTH 2 DECIMALS 0,
        "! TxnamMa1
        txnam_ma_1                 TYPE c LENGTH 16,
        "! TxnamMa2
        txnam_ma_2                 TYPE c LENGTH 16,
        "! TxnamMa3
        txnam_ma_3                 TYPE c LENGTH 16,
        "! Betol
        betol                      TYPE c LENGTH 3,
        "! J1bbranch
        j_1_bbranch                TYPE c LENGTH 4,
        "! Vtbfi
        vtbfi                      TYPE c LENGTH 2,
        "! Fprfw
        fprfw                      TYPE c LENGTH 3,
        "! Achvm
        achvm                      TYPE abap_bool,
        "! Dvsart
        dvsart                     TYPE c LENGTH 1,
        "! Nodetype
        nodetype                   TYPE c LENGTH 3,
        "! Nschema
        nschema                    TYPE c LENGTH 4,
        "! Pkosa
        pkosa                      TYPE abap_bool,
        "! Misch
        misch                      TYPE abap_bool,
        "! Mgvupd
        mgvupd                     TYPE abap_bool,
        "! Vstel
        vstel                      TYPE c LENGTH 4,
        "! Mgvlaupd
        mgvlaupd                   TYPE c LENGTH 1,
        "! Mgvlareval
        mgvlareval                 TYPE c LENGTH 1,
        "! Sourcing
        sourcing                   TYPE c LENGTH 1,
        "! NoDefaultBatchManagement
        no_default_batch_managemen TYPE abap_bool,
        "! FshMgArunReq
        fsh_mg_arun_req            TYPE c LENGTH 1,
        "! FshSeaim
        fsh_seaim                  TYPE abap_bool,
        "! FshBomMaintenance
        fsh_bom_maintenance        TYPE c LENGTH 1,
        "! FshGroupPr
        fsh_group_pr               TYPE c LENGTH 1,
        "! ArunFixBatch
        arun_fix_batch             TYPE c LENGTH 1,
        "! Oilival
        oilival                    TYPE c LENGTH 1,
        "! Oihvtype
        oihvtype                   TYPE c LENGTH 1,
        "! Oihcredipi
        oihcredipi                 TYPE c LENGTH 1,
        "! Storetype
        storetype                  TYPE c LENGTH 1,
        "! DepStore
        dep_store                  TYPE c LENGTH 4,
      END OF tys_z_i_t_001_wtype,
      "! <p class="shorttext synchronized">List of Z_I_T001WType</p>
      tyt_z_i_t_001_wtype TYPE STANDARD TABLE OF tys_z_i_t_001_wtype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_T024Type</p>
      BEGIN OF tys_z_i_t_024_type,
        "! <em>Key property</em> Ekgrp
        ekgrp      TYPE c LENGTH 3,
        "! Eknam
        eknam      TYPE c LENGTH 18,
        "! Ektel
        ektel      TYPE c LENGTH 12,
        "! Ldest
        ldest      TYPE c LENGTH 4,
        "! Telfx
        telfx      TYPE c LENGTH 31,
        "! TelNumber
        tel_number TYPE c LENGTH 30,
        "! TelExtens
        tel_extens TYPE c LENGTH 10,
        "! SmtpAddr
        smtp_addr  TYPE c LENGTH 241,
      END OF tys_z_i_t_024_type,
      "! <p class="shorttext synchronized">List of Z_I_T024Type</p>
      tyt_z_i_t_024_type TYPE STANDARD TABLE OF tys_z_i_t_024_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">z_i_t163yType</p>
      BEGIN OF tys_z_i_t_163_y_type,
        "! <em>Key property</em> Spras
        spras TYPE c LENGTH 2,
        "! <em>Key property</em> Pstyp
        pstyp TYPE c LENGTH 1,
        "! Ptext
        ptext TYPE c LENGTH 20,
        "! Epstp
        epstp TYPE c LENGTH 1,
      END OF tys_z_i_t_163_y_type,
      "! <p class="shorttext synchronized">List of z_i_t163yType</p>
      tyt_z_i_t_163_y_type TYPE STANDARD TABLE OF tys_z_i_t_163_y_type WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! SAP__CoverPageSet
        "! <br/> Collection of type 'SAP__CoverPage'
        sap_cover_page_set         TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_COVER_PAGE_SET',
        "! SAP__Currencies
        "! <br/> Collection of type 'SAP__Currency'
        sap_currencies             TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_CURRENCIES',
        "! SAP__FormatSet
        "! <br/> Collection of type 'SAP__Format'
        sap_format_set             TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_FORMAT_SET',
        "! SAP__MyDocumentDescriptions
        "! <br/> Collection of type 'SAP__DocumentDescription'
        sap_my_document_descriptio TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_MY_DOCUMENT_DESCRIPTIO',
        "! SAP__PDFStandardSet
        "! <br/> Collection of type 'SAP__PDFStandard'
        sap_pdfstandard_set        TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_PDFSTANDARD_SET',
        "! SAP__SignatureSet
        "! <br/> Collection of type 'SAP__Signature'
        sap_signature_set          TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_SIGNATURE_SET',
        "! SAP__TableColumnsSet
        "! <br/> Collection of type 'SAP__TableColumns'
        sap_table_columns_set      TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_TABLE_COLUMNS_SET',
        "! SAP__UnitsOfMeasure
        "! <br/> Collection of type 'SAP__UnitOfMeasure'
        sap_units_of_measure       TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_UNITS_OF_MEASURE',
        "! SAP__ValueHelpSet
        "! <br/> Collection of type 'SAP__ValueHelp'
        sap_value_help_set         TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_VALUE_HELP_SET',
        "! Z_I_EKET
        "! <br/> Collection of type 'Z_I_EKETType'
        z_i_eket                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_EKET',
        "! Z_I_EKET_EBAN
        "! <br/> Collection of type 'Z_I_EKET_EBANType'
        z_i_eket_eban              TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_EKET_EBAN',
        "! Z_I_EKKO
        "! <br/> Collection of type 'Z_I_EKKOType'
        z_i_ekko                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_EKKO',
        "! Z_I_EKPO
        "! <br/> Collection of type 'Z_I_EKPOType'
        z_i_ekpo                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_EKPO',
        "! Z_I_ESLL
        "! <br/> Collection of type 'Z_I_ESLLType'
        z_i_esll                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_ESLL',
        "! Z_I_LFM1
        "! <br/> Collection of type 'Z_I_LFM1Type'
        z_i_lfm_1                  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_LFM_1',
        "! Z_I_T001W
        "! <br/> Collection of type 'Z_I_T001WType'
        z_i_t_001_w                TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_T_001_W',
        "! Z_I_T024
        "! <br/> Collection of type 'Z_I_T024Type'
        z_i_t_024                  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_T_024',
        "! z_i_t163y
        "! <br/> Collection of type 'z_i_t163yType'
        z_i_t_163_y                TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_T_163_Y',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for complex types</p>
      BEGIN OF gcs_complex_type,
        "! <p class="shorttext synchronized">Internal names for SAP__FitToPage</p>
        "! See also structure type {@link ..tys_sap_fit_to_page}
        BEGIN OF sap_fit_to_page,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_fit_to_page,
      END OF gcs_complex_type.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for SAP__CoverPage</p>
        "! See also structure type {@link ..tys_sap_cover_page}
        BEGIN OF sap_cover_page,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_cover_page,
        "! <p class="shorttext synchronized">Internal names for SAP__Currency</p>
        "! See also structure type {@link ..tys_sap_currency}
        BEGIN OF sap_currency,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_currency,
        "! <p class="shorttext synchronized">Internal names for SAP__DocumentDescription</p>
        "! See also structure type {@link ..tys_sap_document_description}
        BEGIN OF sap_document_description,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! CoverPage
            cover_page    TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'COVER_PAGE',
            "! Format
            format        TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'FORMAT',
            "! PDFStandard
            pdfstandard   TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PDFSTANDARD',
            "! Signature
            signature     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'SIGNATURE',
            "! TableColumns
            table_columns TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TABLE_COLUMNS',
          END OF navigation,
        END OF sap_document_description,
        "! <p class="shorttext synchronized">Internal names for SAP__Format</p>
        "! See also structure type {@link ..tys_sap_format}
        BEGIN OF sap_format,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_format,
        "! <p class="shorttext synchronized">Internal names for SAP__PDFStandard</p>
        "! See also structure type {@link ..tys_sap_pdfstandard}
        BEGIN OF sap_pdfstandard,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_pdfstandard,
        "! <p class="shorttext synchronized">Internal names for SAP__Signature</p>
        "! See also structure type {@link ..tys_sap_signature}
        BEGIN OF sap_signature,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_signature,
        "! <p class="shorttext synchronized">Internal names for SAP__TableColumns</p>
        "! See also structure type {@link ..tys_sap_table_columns}
        BEGIN OF sap_table_columns,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_table_columns,
        "! <p class="shorttext synchronized">Internal names for SAP__UnitOfMeasure</p>
        "! See also structure type {@link ..tys_sap_unit_of_measure}
        BEGIN OF sap_unit_of_measure,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_unit_of_measure,
        "! <p class="shorttext synchronized">Internal names for SAP__ValueHelp</p>
        "! See also structure type {@link ..tys_sap_value_help}
        BEGIN OF sap_value_help,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_value_help,
        "! <p class="shorttext synchronized">Internal names for Z_I_EKETType</p>
        "! See also structure type {@link ..tys_z_i_ekettype}
        BEGIN OF z_i_ekettype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_ekettype,
        "! <p class="shorttext synchronized">Internal names for Z_I_EKET_EBANType</p>
        "! See also structure type {@link ..tys_z_i_eket_ebantype}
        BEGIN OF z_i_eket_ebantype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_eket_ebantype,
        "! <p class="shorttext synchronized">Internal names for Z_I_EKKOType</p>
        "! See also structure type {@link ..tys_z_i_ekkotype}
        BEGIN OF z_i_ekkotype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_ekkotype,
        "! <p class="shorttext synchronized">Internal names for Z_I_EKPOType</p>
        "! See also structure type {@link ..tys_z_i_ekpotype}
        BEGIN OF z_i_ekpotype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_ekpotype,
        "! <p class="shorttext synchronized">Internal names for Z_I_ESLLType</p>
        "! See also structure type {@link ..tys_z_i_eslltype}
        BEGIN OF z_i_eslltype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_eslltype,
        "! <p class="shorttext synchronized">Internal names for Z_I_LFM1Type</p>
        "! See also structure type {@link ..tys_z_i_lfm_1_type}
        BEGIN OF z_i_lfm_1_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_lfm_1_type,
        "! <p class="shorttext synchronized">Internal names for Z_I_T001WType</p>
        "! See also structure type {@link ..tys_z_i_t_001_wtype}
        BEGIN OF z_i_t_001_wtype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_t_001_wtype,
        "! <p class="shorttext synchronized">Internal names for Z_I_T024Type</p>
        "! See also structure type {@link ..tys_z_i_t_024_type}
        BEGIN OF z_i_t_024_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_t_024_type,
        "! <p class="shorttext synchronized">Internal names for z_i_t163yType</p>
        "! See also structure type {@link ..tys_z_i_t_163_y_type}
        BEGIN OF z_i_t_163_y_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_t_163_y_type,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define SAP__FitToPage</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_fit_to_page RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__CoverPage</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_cover_page RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__Currency</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_currency RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__DocumentDescription</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_document_description RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__Format</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_format RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__PDFStandard</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_pdfstandard RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__Signature</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_signature RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__TableColumns</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_table_columns RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__UnitOfMeasure</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_unit_of_measure RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__ValueHelp</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_value_help RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_EKETType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_ekettype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_EKET_EBANType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_eket_ebantype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_EKKOType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_ekkotype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_EKPOType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_ekpotype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_ESLLType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_eslltype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_LFM1Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_lfm_1_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_T001WType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_t_001_wtype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_T024Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_t_024_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define z_i_t163yType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_t_163_y_type RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSCM_ZVTS_RFQ_DETAIL IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'cds_zsd_zvts_rfq_detail' ) ##NO_TEXT.

    def_sap_fit_to_page( ).
    def_sap_cover_page( ).
    def_sap_currency( ).
    def_sap_document_description( ).
    def_sap_format( ).
    def_sap_pdfstandard( ).
    def_sap_signature( ).
    def_sap_table_columns( ).
    def_sap_unit_of_measure( ).
    def_sap_value_help( ).
    def_z_i_ekettype( ).
    def_z_i_eket_ebantype( ).
    def_z_i_ekkotype( ).
    def_z_i_ekpotype( ).
    def_z_i_eslltype( ).
    def_z_i_lfm_1_type( ).
    def_z_i_t_001_wtype( ).
    def_z_i_t_024_type( ).
    def_z_i_t_163_y_type( ).

  ENDMETHOD.


  METHOD def_sap_cover_page.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_COVER_PAGE'
                                    is_structure              = VALUE tys_sap_cover_page( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__CoverPage' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_COVER_PAGE_SET' ).
    lo_entity_set->set_edm_name( 'SAP__CoverPageSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'TITLE' ).
    lo_primitive_property->set_edm_name( 'Title' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 256 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME' ).
    lo_primitive_property->set_edm_name( 'Name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 256 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALUE' ).
    lo_primitive_property->set_edm_name( 'Value' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 256 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_sap_currency.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_CURRENCY'
                                    is_structure              = VALUE tys_sap_currency( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__Currency' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_CURRENCIES' ).
    lo_entity_set->set_edm_name( 'SAP__Currencies' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURRENCY_CODE' ).
    lo_primitive_property->set_edm_name( 'CurrencyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ISOCODE' ).
    lo_primitive_property->set_edm_name( 'ISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEXT' ).
    lo_primitive_property->set_edm_name( 'Text' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DECIMAL_PLACES' ).
    lo_primitive_property->set_edm_name( 'DecimalPlaces' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Byte' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_sap_document_description.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_DOCUMENT_DESCRIPTION'
                                    is_structure              = VALUE tys_sap_document_description( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__DocumentDescription' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_MY_DOCUMENT_DESCRIPTIO' ).
    lo_entity_set->set_edm_name( 'SAP__MyDocumentDescriptions' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY' ).
    lo_primitive_property->set_edm_name( 'CreatedBy' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_AT' ).
    lo_primitive_property->set_edm_name( 'CreatedAt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FILE_NAME' ).
    lo_primitive_property->set_edm_name( 'FileName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 256 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TITLE' ).
    lo_primitive_property->set_edm_name( 'Title' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 256 ) ##NUMBER_OK.

    lo_navigation_property = lo_entity_type->create_navigation_property( 'COVER_PAGE' ).
    lo_navigation_property->set_edm_name( 'CoverPage' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SAP_COVER_PAGE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'FORMAT' ).
    lo_navigation_property->set_edm_name( 'Format' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SAP_FORMAT' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PDFSTANDARD' ).
    lo_navigation_property->set_edm_name( 'PDFStandard' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SAP_PDFSTANDARD' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'SIGNATURE' ).
    lo_navigation_property->set_edm_name( 'Signature' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SAP_SIGNATURE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TABLE_COLUMNS' ).
    lo_navigation_property->set_edm_name( 'TableColumns' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SAP_TABLE_COLUMNS' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


  METHOD def_sap_fit_to_page.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'SAP_FIT_TO_PAGE'
                                    is_structure              = VALUE tys_sap_fit_to_page( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'SAP__FitToPage' ) ##NO_TEXT.


    lo_primitive_property = lo_complex_type->get_primitive_property( 'ERROR_RECOVERY_BEHAVIOR' ).
    lo_primitive_property->set_edm_name( 'ErrorRecoveryBehavior' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'IS_ENABLED' ).
    lo_primitive_property->set_edm_name( 'IsEnabled' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'MINIMUM_FONT_SIZE' ).
    lo_primitive_property->set_edm_name( 'MinimumFontSize' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_sap_format.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_FORMAT'
                                    is_structure              = VALUE tys_sap_format( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__Format' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_FORMAT_SET' ).
    lo_entity_set->set_edm_name( 'SAP__FormatSet' ) ##NO_TEXT.


    lo_complex_property = lo_entity_type->create_complex_property( 'FIT_TO_PAGE' ).
    lo_complex_property->set_edm_name( 'FitToPage' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_FIT_TO_PAGE' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FONT_SIZE' ).
    lo_primitive_property->set_edm_name( 'FontSize' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORIENTATION' ).
    lo_primitive_property->set_edm_name( 'Orientation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAPER_SIZE' ).
    lo_primitive_property->set_edm_name( 'PaperSize' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BORDER_SIZE' ).
    lo_primitive_property->set_edm_name( 'BorderSize' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MARGIN_SIZE' ).
    lo_primitive_property->set_edm_name( 'MarginSize' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FONT_NAME' ).
    lo_primitive_property->set_edm_name( 'FontName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_sap_pdfstandard.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_PDFSTANDARD'
                                    is_structure              = VALUE tys_sap_pdfstandard( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__PDFStandard' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_PDFSTANDARD_SET' ).
    lo_entity_set->set_edm_name( 'SAP__PDFStandardSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'USE_PDFACONFORMANCE' ).
    lo_primitive_property->set_edm_name( 'UsePDFAConformance' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DO_ENABLE_ACCESSIBILITY' ).
    lo_primitive_property->set_edm_name( 'DoEnableAccessibility' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_sap_signature.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_SIGNATURE'
                                    is_structure              = VALUE tys_sap_signature( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__Signature' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_SIGNATURE_SET' ).
    lo_entity_set->set_edm_name( 'SAP__SignatureSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DO_SIGN' ).
    lo_primitive_property->set_edm_name( 'DoSign' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REASON' ).
    lo_primitive_property->set_edm_name( 'Reason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 256 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_sap_table_columns.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_TABLE_COLUMNS'
                                    is_structure              = VALUE tys_sap_table_columns( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__TableColumns' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_TABLE_COLUMNS_SET' ).
    lo_entity_set->set_edm_name( 'SAP__TableColumnsSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME' ).
    lo_primitive_property->set_edm_name( 'Name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 256 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HEADER' ).
    lo_primitive_property->set_edm_name( 'Header' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 256 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HORIZONTAL_ALIGNMENT' ).
    lo_primitive_property->set_edm_name( 'HorizontalAlignment' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_sap_unit_of_measure.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_UNIT_OF_MEASURE'
                                    is_structure              = VALUE tys_sap_unit_of_measure( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__UnitOfMeasure' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_UNITS_OF_MEASURE' ).
    lo_entity_set->set_edm_name( 'SAP__UnitsOfMeasure' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNIT_CODE' ).
    lo_primitive_property->set_edm_name( 'UnitCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ISOCODE' ).
    lo_primitive_property->set_edm_name( 'ISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTERNAL_CODE' ).
    lo_primitive_property->set_edm_name( 'ExternalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEXT' ).
    lo_primitive_property->set_edm_name( 'Text' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DECIMAL_PLACES' ).
    lo_primitive_property->set_edm_name( 'DecimalPlaces' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int16' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_sap_value_help.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_VALUE_HELP'
                                    is_structure              = VALUE tys_sap_value_help( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__ValueHelp' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_VALUE_HELP_SET' ).
    lo_entity_set->set_edm_name( 'SAP__ValueHelpSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALUEHELP' ).
    lo_primitive_property->set_edm_name( 'VALUEHELP' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIELD_VALUE' ).
    lo_primitive_property->set_edm_name( 'FIELD_VALUE' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DESCRIPTION' ).
    lo_primitive_property->set_edm_name( 'DESCRIPTION' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_ekettype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_EKETTYPE'
                                    is_structure              = VALUE tys_z_i_ekettype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_EKETType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_EKET' ).
    lo_entity_set->set_edm_name( 'Z_I_EKET' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'EBELN' ).
    lo_primitive_property->set_edm_name( 'Ebeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EBELP' ).
    lo_primitive_property->set_edm_name( 'Ebelp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETENR' ).
    lo_primitive_property->set_edm_name( 'Etenr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNIQUEID' ).
    lo_primitive_property->set_edm_name( 'Uniqueid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 19 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EINDT' ).
    lo_primitive_property->set_edm_name( 'Eindt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SLFDT' ).
    lo_primitive_property->set_edm_name( 'Slfdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LPEIN' ).
    lo_primitive_property->set_edm_name( 'Lpein' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MENGE' ).
    lo_primitive_property->set_edm_name( 'Menge' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AMENG' ).
    lo_primitive_property->set_edm_name( 'Ameng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEMNG' ).
    lo_primitive_property->set_edm_name( 'Wemng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAMNG' ).
    lo_primitive_property->set_edm_name( 'Wamng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UZEIT' ).
    lo_primitive_property->set_edm_name( 'Uzeit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANFN' ).
    lo_primitive_property->set_edm_name( 'Banfn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BNFPO' ).
    lo_primitive_property->set_edm_name( 'Bnfpo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ESTKZ' ).
    lo_primitive_property->set_edm_name( 'Estkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUNUM' ).
    lo_primitive_property->set_edm_name( 'Qunum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUPOS' ).
    lo_primitive_property->set_edm_name( 'Qupos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAHNZ' ).
    lo_primitive_property->set_edm_name( 'Mahnz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BEDAT' ).
    lo_primitive_property->set_edm_name( 'Bedat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RSNUM' ).
    lo_primitive_property->set_edm_name( 'Rsnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERNR' ).
    lo_primitive_property->set_edm_name( 'Sernr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIXKZ' ).
    lo_primitive_property->set_edm_name( 'Fixkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLMNG' ).
    lo_primitive_property->set_edm_name( 'Glmng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DABMG' ).
    lo_primitive_property->set_edm_name( 'Dabmg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHARG' ).
    lo_primitive_property->set_edm_name( 'Charg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LICHA' ).
    lo_primitive_property->set_edm_name( 'Licha' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHKOM' ).
    lo_primitive_property->set_edm_name( 'Chkom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VERID' ).
    lo_primitive_property->set_edm_name( 'Verid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABART' ).
    lo_primitive_property->set_edm_name( 'Abart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MNG_02' ).
    lo_primitive_property->set_edm_name( 'Mng02' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DAT_01' ).
    lo_primitive_property->set_edm_name( 'Dat01' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALTDT' ).
    lo_primitive_property->set_edm_name( 'Altdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AULWE' ).
    lo_primitive_property->set_edm_name( 'Aulwe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MBDAT' ).
    lo_primitive_property->set_edm_name( 'Mbdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MBUHR' ).
    lo_primitive_property->set_edm_name( 'Mbuhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LDDAT' ).
    lo_primitive_property->set_edm_name( 'Lddat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LDUHR' ).
    lo_primitive_property->set_edm_name( 'Lduhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TDDAT' ).
    lo_primitive_property->set_edm_name( 'Tddat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TDUHR' ).
    lo_primitive_property->set_edm_name( 'Tduhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WADAT' ).
    lo_primitive_property->set_edm_name( 'Wadat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAUHR' ).
    lo_primitive_property->set_edm_name( 'Wauhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELDAT' ).
    lo_primitive_property->set_edm_name( 'Eldat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELUHR' ).
    lo_primitive_property->set_edm_name( 'Eluhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANZSN' ).
    lo_primitive_property->set_edm_name( 'Anzsn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NODISP' ).
    lo_primitive_property->set_edm_name( 'Nodisp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GEO_ROUTE' ).
    lo_primitive_property->set_edm_name( 'GeoRoute' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROUTE_GTS' ).
    lo_primitive_property->set_edm_name( 'RouteGts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GTS_IND' ).
    lo_primitive_property->set_edm_name( 'GtsInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TSP' ).
    lo_primitive_property->set_edm_name( 'Tsp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CD_LOCNO' ).
    lo_primitive_property->set_edm_name( 'CdLocno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CD_LOCTYPE' ).
    lo_primitive_property->set_edm_name( 'CdLoctype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HANDOVERDATE' ).
    lo_primitive_property->set_edm_name( 'Handoverdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HANDOVERTIME' ).
    lo_primitive_property->set_edm_name( 'Handovertime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WESBB' ).
    lo_primitive_property->set_edm_name( 'Wesbb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STARTDATE' ).
    lo_primitive_property->set_edm_name( 'Startdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENDDATE' ).
    lo_primitive_property->set_edm_name( 'Enddate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATAAGING' ).
    lo_primitive_property->set_edm_name( 'Dataaging' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCWMXMENGE' ).
    lo_primitive_property->set_edm_name( 'xcwmxmenge' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCWMXDABMG' ).
    lo_primitive_property->set_edm_name( 'xcwmxdabmg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCWMXWEMNG' ).
    lo_primitive_property->set_edm_name( 'xcwmxwemng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TMS_REF_UUID' ).
    lo_primitive_property->set_edm_name( 'TmsRefUuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARUN_REQ_DLVDATE' ).
    lo_primitive_property->set_edm_name( 'ArunReqDlvdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_OS_ID' ).
    lo_primitive_property->set_edm_name( 'FshOsId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KEY_ID' ).
    lo_primitive_property->set_edm_name( 'KeyId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OTB_CURR' ).
    lo_primitive_property->set_edm_name( 'OtbCurr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPR_RSN_PROFILE' ).
    lo_primitive_property->set_edm_name( 'SprRsnProfile' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDG_TYPE' ).
    lo_primitive_property->set_edm_name( 'BudgType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OTB_STATUS' ).
    lo_primitive_property->set_edm_name( 'OtbStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OTB_REASON' ).
    lo_primitive_property->set_edm_name( 'OtbReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHECK_TYPE' ).
    lo_primitive_property->set_edm_name( 'CheckType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DL_ID' ).
    lo_primitive_property->set_edm_name( 'DlId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NO_SCEM' ).
    lo_primitive_property->set_edm_name( 'NoScem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DNG_DATE' ).
    lo_primitive_property->set_edm_name( 'DngDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DNG_TIME' ).
    lo_primitive_property->set_edm_name( 'DngTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CNCL_ANCMNT_DONE' ).
    lo_primitive_property->set_edm_name( 'CnclAncmntDone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATESHIFT_NUMBER' ).
    lo_primitive_property->set_edm_name( 'DateshiftNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_eket_ebantype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_EKET_EBANTYPE'
                                    is_structure              = VALUE tys_z_i_eket_ebantype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_EKET_EBANType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_EKET_EBAN' ).
    lo_entity_set->set_edm_name( 'Z_I_EKET_EBAN' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANFN' ).
    lo_primitive_property->set_edm_name( 'Banfn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BNFPO' ).
    lo_primitive_property->set_edm_name( 'Bnfpo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EBELN' ).
    lo_primitive_property->set_edm_name( 'Ebeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EBELP' ).
    lo_primitive_property->set_edm_name( 'Ebelp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETENR' ).
    lo_primitive_property->set_edm_name( 'Etenr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BSART' ).
    lo_primitive_property->set_edm_name( 'Bsart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BSTYP' ).
    lo_primitive_property->set_edm_name( 'Bstyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BSAKZ' ).
    lo_primitive_property->set_edm_name( 'Bsakz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOEKZ' ).
    lo_primitive_property->set_edm_name( 'Loekz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STATU' ).
    lo_primitive_property->set_edm_name( 'Statu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ESTKZ' ).
    lo_primitive_property->set_edm_name( 'Estkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRGKZ' ).
    lo_primitive_property->set_edm_name( 'Frgkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRGZU' ).
    lo_primitive_property->set_edm_name( 'Frgzu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRGST' ).
    lo_primitive_property->set_edm_name( 'Frgst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EKGRP' ).
    lo_primitive_property->set_edm_name( 'Ekgrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERNAM' ).
    lo_primitive_property->set_edm_name( 'Ernam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERDAT' ).
    lo_primitive_property->set_edm_name( 'Erdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AFNAM' ).
    lo_primitive_property->set_edm_name( 'Afnam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXZ_01' ).
    lo_primitive_property->set_edm_name( 'Txz01' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATNR' ).
    lo_primitive_property->set_edm_name( 'Matnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMATN' ).
    lo_primitive_property->set_edm_name( 'Ematn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WERKS' ).
    lo_primitive_property->set_edm_name( 'Werks' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGORT' ).
    lo_primitive_property->set_edm_name( 'Lgort' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BEDNR' ).
    lo_primitive_property->set_edm_name( 'Bednr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATKL' ).
    lo_primitive_property->set_edm_name( 'Matkl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RESWK' ).
    lo_primitive_property->set_edm_name( 'Reswk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MENGE' ).
    lo_primitive_property->set_edm_name( 'Menge' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEINS' ).
    lo_primitive_property->set_edm_name( 'Meins' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUMNG' ).
    lo_primitive_property->set_edm_name( 'Bumng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BADAT' ).
    lo_primitive_property->set_edm_name( 'Badat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LPEIN' ).
    lo_primitive_property->set_edm_name( 'Lpein' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFDAT' ).
    lo_primitive_property->set_edm_name( 'Lfdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRGDT' ).
    lo_primitive_property->set_edm_name( 'Frgdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEBAZ' ).
    lo_primitive_property->set_edm_name( 'Webaz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PREIS' ).
    lo_primitive_property->set_edm_name( 'Preis' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PEINH' ).
    lo_primitive_property->set_edm_name( 'Peinh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSTYP' ).
    lo_primitive_property->set_edm_name( 'Pstyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNTTP' ).
    lo_primitive_property->set_edm_name( 'Knttp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZVBR' ).
    lo_primitive_property->set_edm_name( 'Kzvbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KFLAG' ).
    lo_primitive_property->set_edm_name( 'Kflag' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VRTKZ' ).
    lo_primitive_property->set_edm_name( 'Vrtkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TWRKZ' ).
    lo_primitive_property->set_edm_name( 'Twrkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEPOS' ).
    lo_primitive_property->set_edm_name( 'Wepos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEUNB' ).
    lo_primitive_property->set_edm_name( 'Weunb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REPOS' ).
    lo_primitive_property->set_edm_name( 'Repos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFNR' ).
    lo_primitive_property->set_edm_name( 'Lifnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLIEF' ).
    lo_primitive_property->set_edm_name( 'Flief' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EKORG' ).
    lo_primitive_property->set_edm_name( 'Ekorg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VRTYP' ).
    lo_primitive_property->set_edm_name( 'Vrtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KONNR' ).
    lo_primitive_property->set_edm_name( 'Konnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KTPNR' ).
    lo_primitive_property->set_edm_name( 'Ktpnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INFNR' ).
    lo_primitive_property->set_edm_name( 'Infnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZUGBA' ).
    lo_primitive_property->set_edm_name( 'Zugba' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUNUM' ).
    lo_primitive_property->set_edm_name( 'Qunum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUPOS' ).
    lo_primitive_property->set_edm_name( 'Qupos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISPO' ).
    lo_primitive_property->set_edm_name( 'Dispo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERNR' ).
    lo_primitive_property->set_edm_name( 'Sernr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BVDAT' ).
    lo_primitive_property->set_edm_name( 'Bvdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BATOL' ).
    lo_primitive_property->set_edm_name( 'Batol' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BVDRK' ).
    lo_primitive_property->set_edm_name( 'Bvdrk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BEDAT' ).
    lo_primitive_property->set_edm_name( 'Bedat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BSMNG' ).
    lo_primitive_property->set_edm_name( 'Bsmng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIMIT_CONSUMPTION_VALUE' ).
    lo_primitive_property->set_edm_name( 'LimitConsumptionValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LBLNI' ).
    lo_primitive_property->set_edm_name( 'Lblni' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BWTAR' ).
    lo_primitive_property->set_edm_name( 'Bwtar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XOBLR' ).
    lo_primitive_property->set_edm_name( 'Xoblr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EBAKZ' ).
    lo_primitive_property->set_edm_name( 'Ebakz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RSNUM' ).
    lo_primitive_property->set_edm_name( 'Rsnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SOBKZ' ).
    lo_primitive_property->set_edm_name( 'Sobkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARSNR' ).
    lo_primitive_property->set_edm_name( 'Arsnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARSPS' ).
    lo_primitive_property->set_edm_name( 'Arsps' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIXKZ' ).
    lo_primitive_property->set_edm_name( 'Fixkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BMEIN' ).
    lo_primitive_property->set_edm_name( 'Bmein' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REVLV' ).
    lo_primitive_property->set_edm_name( 'Revlv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VORAB' ).
    lo_primitive_property->set_edm_name( 'Vorab' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PACKNO' ).
    lo_primitive_property->set_edm_name( 'Packno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KANBA' ).
    lo_primitive_property->set_edm_name( 'Kanba' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BPUEB' ).
    lo_primitive_property->set_edm_name( 'Bpueb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUOBJ' ).
    lo_primitive_property->set_edm_name( 'Cuobj' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRGGR' ).
    lo_primitive_property->set_edm_name( 'Frggr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRGRL' ).
    lo_primitive_property->set_edm_name( 'Frgrl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AKTNR' ).
    lo_primitive_property->set_edm_name( 'Aktnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHARG' ).
    lo_primitive_property->set_edm_name( 'Charg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMSOK' ).
    lo_primitive_property->set_edm_name( 'Umsok' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VERID' ).
    lo_primitive_property->set_edm_name( 'Verid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIPOS' ).
    lo_primitive_property->set_edm_name( 'Fipos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISTL' ).
    lo_primitive_property->set_edm_name( 'Fistl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GEBER' ).
    lo_primitive_property->set_edm_name( 'Geber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZKFG' ).
    lo_primitive_property->set_edm_name( 'Kzkfg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SATNR' ).
    lo_primitive_property->set_edm_name( 'Satnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MNG_02' ).
    lo_primitive_property->set_edm_name( 'Mng02' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DAT_01' ).
    lo_primitive_property->set_edm_name( 'Dat01' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ATTYP' ).
    lo_primitive_property->set_edm_name( 'Attyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADRNR' ).
    lo_primitive_property->set_edm_name( 'Adrnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADRN_2' ).
    lo_primitive_property->set_edm_name( 'Adrn2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUNNR' ).
    lo_primitive_property->set_edm_name( 'Kunnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMLIF' ).
    lo_primitive_property->set_edm_name( 'Emlif' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LBLKZ' ).
    lo_primitive_property->set_edm_name( 'Lblkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZBWS' ).
    lo_primitive_property->set_edm_name( 'Kzbws' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAERS' ).
    lo_primitive_property->set_edm_name( 'Waers' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDNLF' ).
    lo_primitive_property->set_edm_name( 'Idnlf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GSFRG' ).
    lo_primitive_property->set_edm_name( 'Gsfrg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MPROF' ).
    lo_primitive_property->set_edm_name( 'Mprof' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZFME' ).
    lo_primitive_property->set_edm_name( 'Kzfme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPRAS' ).
    lo_primitive_property->set_edm_name( 'Spras' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TECHS' ).
    lo_primitive_property->set_edm_name( 'Techs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MFRPN' ).
    lo_primitive_property->set_edm_name( 'Mfrpn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MFRNR' ).
    lo_primitive_property->set_edm_name( 'Mfrnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMNFR' ).
    lo_primitive_property->set_edm_name( 'Emnfr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FORDN' ).
    lo_primitive_property->set_edm_name( 'Fordn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FORDP' ).
    lo_primitive_property->set_edm_name( 'Fordp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLIFZ' ).
    lo_primitive_property->set_edm_name( 'Plifz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BERID' ).
    lo_primitive_property->set_edm_name( 'Berid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UZEIT' ).
    lo_primitive_property->set_edm_name( 'Uzeit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKBER' ).
    lo_primitive_property->set_edm_name( 'Fkber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRANT_NBR' ).
    lo_primitive_property->set_edm_name( 'GrantNbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEMORY' ).
    lo_primitive_property->set_edm_name( 'Memory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANPR' ).
    lo_primitive_property->set_edm_name( 'Banpr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RLWRT' ).
    lo_primitive_property->set_edm_name( 'Rlwrt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLCKD' ).
    lo_primitive_property->set_edm_name( 'Blckd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REVNO' ).
    lo_primitive_property->set_edm_name( 'Revno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLCKT' ).
    lo_primitive_property->set_edm_name( 'Blckt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BESWK' ).
    lo_primitive_property->set_edm_name( 'Beswk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EPROFILE' ).
    lo_primitive_property->set_edm_name( 'Eprofile' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EPREFDOC' ).
    lo_primitive_property->set_edm_name( 'Eprefdoc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EPREFITM' ).
    lo_primitive_property->set_edm_name( 'Eprefitm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GMMNG' ).
    lo_primitive_property->set_edm_name( 'Gmmng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WRTKZ' ).
    lo_primitive_property->set_edm_name( 'Wrtkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RESLO' ).
    lo_primitive_property->set_edm_name( 'Reslo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KBLNR' ).
    lo_primitive_property->set_edm_name( 'Kblnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KBLPOS' ).
    lo_primitive_property->set_edm_name( 'Kblpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRIO_URG' ).
    lo_primitive_property->set_edm_name( 'PrioUrg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRIO_REQ' ).
    lo_primitive_property->set_edm_name( 'PrioReq' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEMORYTYPE' ).
    lo_primitive_property->set_edm_name( 'Memorytype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANZSN' ).
    lo_primitive_property->set_edm_name( 'Anzsn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MHDRZ' ).
    lo_primitive_property->set_edm_name( 'Mhdrz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IPRKZ' ).
    lo_primitive_property->set_edm_name( 'Iprkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NODISP' ).
    lo_primitive_property->set_edm_name( 'Nodisp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SRM_CONTRACT_ID' ).
    lo_primitive_property->set_edm_name( 'SrmContractId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SRM_CONTRACT_ITM' ).
    lo_primitive_property->set_edm_name( 'SrmContractItm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDGET_PD' ).
    lo_primitive_property->set_edm_name( 'BudgetPd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELDAT' ).
    lo_primitive_property->set_edm_name( 'Eldat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXPERT_MODE' ).
    lo_primitive_property->set_edm_name( 'ExpertMode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CENTRAL_PURREQN_PROC' ).
    lo_primitive_property->set_edm_name( 'CentralPurreqnProc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_CRM_REF_SO' ).
    lo_primitive_property->set_edm_name( 'SpeCrmRefSo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_CRM_REF_ITEM' ).
    lo_primitive_property->set_edm_name( 'SpeCrmRefItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INDELEGATEAPPROVAL' ).
    lo_primitive_property->set_edm_name( 'Indelegateapproval' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUMMY_EBAN_INCL_EEW_PS' ).
    lo_primitive_property->set_edm_name( 'DummyEbanInclEewPs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STORENETWORKID' ).
    lo_primitive_property->set_edm_name( 'Storenetworkid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 128 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STORESUPPLIERID' ).
    lo_primitive_property->set_edm_name( 'Storesupplierid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 64 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATIONDATE' ).
    lo_primitive_property->set_edm_name( 'Creationdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATIONTIME' ).
    lo_primitive_property->set_edm_name( 'Creationtime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCTTYPE' ).
    lo_primitive_property->set_edm_name( 'Producttype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICEPERFORMER' ).
    lo_primitive_property->set_edm_name( 'Serviceperformer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ISEOPBLOCKED' ).
    lo_primitive_property->set_edm_name( 'Iseopblocked' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_REV_TMSTMP' ).
    lo_primitive_property->set_edm_name( 'ExtRevTmstmp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FMFGUS_KEY' ).
    lo_primitive_property->set_edm_name( 'FmfgusKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STARTDATE' ).
    lo_primitive_property->set_edm_name( 'Startdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENDDATE' ).
    lo_primitive_property->set_edm_name( 'Enddate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTMATERIALFORPURG' ).
    lo_primitive_property->set_edm_name( 'Extmaterialforpurg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTFIXEDSUPPLIERFORPURG' ).
    lo_primitive_property->set_edm_name( 'Extfixedsupplierforpurg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTDESIREDSUPPLIERFORPURG' ).
    lo_primitive_property->set_edm_name( 'Extdesiredsupplierforpurg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTCONTRACTFORPURG' ).
    lo_primitive_property->set_edm_name( 'Extcontractforpurg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTCONTRACTITEMFORPURG' ).
    lo_primitive_property->set_edm_name( 'Extcontractitemforpurg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTINFORECORDFORPURG' ).
    lo_primitive_property->set_edm_name( 'Extinforecordforpurg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTPLANTFORPURG' ).
    lo_primitive_property->set_edm_name( 'Extplantforpurg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTSTORAGELOCATIONFORPURG' ).
    lo_primitive_property->set_edm_name( 'Extstoragelocationforpurg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTCOMPANYCODEFORPURG' ).
    lo_primitive_property->set_edm_name( 'Extcompanycodeforpurg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTPURGORGFORPURG' ).
    lo_primitive_property->set_edm_name( 'Extpurgorgforpurg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTSOURCESYSTEM' ).
    lo_primitive_property->set_edm_name( 'Extsourcesystem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_BE_SOURCE_SYS' ).
    lo_primitive_property->set_edm_name( 'ExtBeSourceSys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_BE_PRCHANGEINDICATOR' ).
    lo_primitive_property->set_edm_name( 'ExtBePrchangeindicator' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTDOCTYPEFORPURG' ).
    lo_primitive_property->set_edm_name( 'Extdoctypeforpurg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ISCRREPLICATIONBEFOREAPPRO' ).
    lo_primitive_property->set_edm_name( 'Iscrreplicationbeforeapproval' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MMPUR_PR_CEN_REQN_APP_RPLD' ).
    lo_primitive_property->set_edm_name( 'MmpurPrCenReqnAppRpldPr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTAPPROVALSTATUS' ).
    lo_primitive_property->set_edm_name( 'Extapprovalstatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STAGINGFLDEXTAPPROVALSTATU' ).
    lo_primitive_property->set_edm_name( 'Stagingfldextapprovalstatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASEREQNITEMUNIQUEID' ).
    lo_primitive_property->set_edm_name( 'Purchasereqnitemuniqueid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LASTCHANGEDATETIME' ).
    lo_primitive_property->set_edm_name( 'Lastchangedatetime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ISONBEHALFCART' ).
    lo_primitive_property->set_edm_name( 'Isonbehalfcart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDM_VERSION' ).
    lo_primitive_property->set_edm_name( 'SdmVersion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAKTO' ).
    lo_primitive_property->set_edm_name( 'Sakto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOSTL' ).
    lo_primitive_property->set_edm_name( 'Kostl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXPECTED_VALUE' ).
    lo_primitive_property->set_edm_name( 'ExpectedValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIMIT_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'LimitAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTRACT_FOR_LIMIT' ).
    lo_primitive_property->set_edm_name( 'ContractForLimit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERYADDRTYPE' ).
    lo_primitive_property->set_edm_name( 'Deliveryaddrtype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MWSKZ' ).
    lo_primitive_property->set_edm_name( 'Mwskz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PFMTRANSDATAFOOTPRINTUUID' ).
    lo_primitive_property->set_edm_name( 'Pfmtransdatafootprintuuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HASTRADECOMPLIANCEISSUE' ).
    lo_primitive_property->set_edm_name( 'Hastradecomplianceissue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURREQNDESCRIPTION' ).
    lo_primitive_property->set_edm_name( 'Purreqndescription' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ISOUTLINE' ).
    lo_primitive_property->set_edm_name( 'Isoutline' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARENT_ITEM_NO' ).
    lo_primitive_property->set_edm_name( 'ParentItemNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OUTLINE_TYPE' ).
    lo_primitive_property->set_edm_name( 'OutlineType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXLIN' ).
    lo_primitive_property->set_edm_name( 'Exlin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXSNR' ).
    lo_primitive_property->set_edm_name( 'Exsnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADVCODE' ).
    lo_primitive_property->set_edm_name( 'Advcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STACODE' ).
    lo_primitive_property->set_edm_name( 'Stacode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANFN_CS' ).
    lo_primitive_property->set_edm_name( 'BanfnCs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BNFPO_CS' ).
    lo_primitive_property->set_edm_name( 'BnfpoCs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_CS' ).
    lo_primitive_property->set_edm_name( 'ItemCs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NO_MARD_DATA' ).
    lo_primitive_property->set_edm_name( 'NoMardData' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADMOI' ).
    lo_primitive_property->set_edm_name( 'Admoi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADPRI' ).
    lo_primitive_property->set_edm_name( 'Adpri' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LPRIO' ).
    lo_primitive_property->set_edm_name( 'Lprio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADACN' ).
    lo_primitive_property->set_edm_name( 'Adacn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDNS' ).
    lo_primitive_property->set_edm_name( 'Addns' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERRU' ).
    lo_primitive_property->set_edm_name( 'Serru' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISUB_SOBKZ' ).
    lo_primitive_property->set_edm_name( 'DisubSobkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISUB_PSPNR' ).
    lo_primitive_property->set_edm_name( 'DisubPspnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISUB_KUNNR' ).
    lo_primitive_property->set_edm_name( 'DisubKunnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISUB_VBELN' ).
    lo_primitive_property->set_edm_name( 'DisubVbeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISUB_POSNR' ).
    lo_primitive_property->set_edm_name( 'DisubPosnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISUB_OWNER' ).
    lo_primitive_property->set_edm_name( 'DisubOwner' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLDLOGSSUPPLYPROCESS' ).
    lo_primitive_property->set_edm_name( 'Fldlogssupplyprocess' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLDLOGSDELIVISHELDONSHORE' ).
    lo_primitive_property->set_edm_name( 'Fldlogsdelivisheldonshore' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLDLOGSVERSION' ).
    lo_primitive_property->set_edm_name( 'Fldlogsversion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_SEASON_YEAR' ).
    lo_primitive_property->set_edm_name( 'FshSeasonYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_SEASON' ).
    lo_primitive_property->set_edm_name( 'FshSeason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_COLLECTION' ).
    lo_primitive_property->set_edm_name( 'FshCollection' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_THEME' ).
    lo_primitive_property->set_edm_name( 'FshTheme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_VAS_REL' ).
    lo_primitive_property->set_edm_name( 'FshVasRel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_VAS_PRNT_ID' ).
    lo_primitive_property->set_edm_name( 'FshVasPrntId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_TRANSACTION' ).
    lo_primitive_property->set_edm_name( 'FshTransaction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_ITEM_GROUP' ).
    lo_primitive_property->set_edm_name( 'FshItemGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_ITEM' ).
    lo_primitive_property->set_edm_name( 'FshItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IUID_RELEVANT' ).
    lo_primitive_property->set_edm_name( 'IuidRelevant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SC_SR_ITEM_KEY' ).
    lo_primitive_property->set_edm_name( 'ScSrItemKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SC_CATALOGID' ).
    lo_primitive_property->set_edm_name( 'ScCatalogid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SC_CATALOGITEM' ).
    lo_primitive_property->set_edm_name( 'ScCatalogitem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SC_REQUESTOR' ).
    lo_primitive_property->set_edm_name( 'ScRequestor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SC_AUTHOR' ).
    lo_primitive_property->set_edm_name( 'ScAuthor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SGT_SCAT' ).
    lo_primitive_property->set_edm_name( 'SgtScat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SGT_RCAT' ).
    lo_primitive_property->set_edm_name( 'SgtRcat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WRF_CHARSTC_1' ).
    lo_primitive_property->set_edm_name( 'WrfCharstc1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WRF_CHARSTC_2' ).
    lo_primitive_property->set_edm_name( 'WrfCharstc2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WRF_CHARSTC_3' ).
    lo_primitive_property->set_edm_name( 'WrfCharstc3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNIQUEID' ).
    lo_primitive_property->set_edm_name( 'Uniqueid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 19 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EINDT' ).
    lo_primitive_property->set_edm_name( 'Eindt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SLFDT' ).
    lo_primitive_property->set_edm_name( 'Slfdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AMENG' ).
    lo_primitive_property->set_edm_name( 'Ameng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEMNG' ).
    lo_primitive_property->set_edm_name( 'Wemng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAMNG' ).
    lo_primitive_property->set_edm_name( 'Wamng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAHNZ' ).
    lo_primitive_property->set_edm_name( 'Mahnz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLMNG' ).
    lo_primitive_property->set_edm_name( 'Glmng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DABMG' ).
    lo_primitive_property->set_edm_name( 'Dabmg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LICHA' ).
    lo_primitive_property->set_edm_name( 'Licha' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHKOM' ).
    lo_primitive_property->set_edm_name( 'Chkom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABART' ).
    lo_primitive_property->set_edm_name( 'Abart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALTDT' ).
    lo_primitive_property->set_edm_name( 'Altdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AULWE' ).
    lo_primitive_property->set_edm_name( 'Aulwe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MBDAT' ).
    lo_primitive_property->set_edm_name( 'Mbdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MBUHR' ).
    lo_primitive_property->set_edm_name( 'Mbuhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LDDAT' ).
    lo_primitive_property->set_edm_name( 'Lddat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LDUHR' ).
    lo_primitive_property->set_edm_name( 'Lduhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TDDAT' ).
    lo_primitive_property->set_edm_name( 'Tddat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TDUHR' ).
    lo_primitive_property->set_edm_name( 'Tduhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WADAT' ).
    lo_primitive_property->set_edm_name( 'Wadat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAUHR' ).
    lo_primitive_property->set_edm_name( 'Wauhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELUHR' ).
    lo_primitive_property->set_edm_name( 'Eluhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GEO_ROUTE' ).
    lo_primitive_property->set_edm_name( 'GeoRoute' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROUTE_GTS' ).
    lo_primitive_property->set_edm_name( 'RouteGts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GTS_IND' ).
    lo_primitive_property->set_edm_name( 'GtsInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TSP' ).
    lo_primitive_property->set_edm_name( 'Tsp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CD_LOCNO' ).
    lo_primitive_property->set_edm_name( 'CdLocno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CD_LOCTYPE' ).
    lo_primitive_property->set_edm_name( 'CdLoctype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HANDOVERDATE' ).
    lo_primitive_property->set_edm_name( 'Handoverdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HANDOVERTIME' ).
    lo_primitive_property->set_edm_name( 'Handovertime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WESBB' ).
    lo_primitive_property->set_edm_name( 'Wesbb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATAAGING' ).
    lo_primitive_property->set_edm_name( 'Dataaging' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCWMXMENGE' ).
    lo_primitive_property->set_edm_name( 'xcwmxmenge' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCWMXDABMG' ).
    lo_primitive_property->set_edm_name( 'xcwmxdabmg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCWMXWEMNG' ).
    lo_primitive_property->set_edm_name( 'xcwmxwemng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TMS_REF_UUID' ).
    lo_primitive_property->set_edm_name( 'TmsRefUuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARUN_REQ_DLVDATE' ).
    lo_primitive_property->set_edm_name( 'ArunReqDlvdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_RALLOC_QTY' ).
    lo_primitive_property->set_edm_name( 'FshRallocQty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_SALLOC_QTY' ).
    lo_primitive_property->set_edm_name( 'FshSallocQty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_OS_ID' ).
    lo_primitive_property->set_edm_name( 'FshOsId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KEY_ID' ).
    lo_primitive_property->set_edm_name( 'KeyId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OTB_VALUE' ).
    lo_primitive_property->set_edm_name( 'OtbValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 17 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OTB_CURR' ).
    lo_primitive_property->set_edm_name( 'OtbCurr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OTB_RES_VALUE' ).
    lo_primitive_property->set_edm_name( 'OtbResValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 17 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OTB_SPEC_VALUE' ).
    lo_primitive_property->set_edm_name( 'OtbSpecValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 17 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPR_RSN_PROFILE' ).
    lo_primitive_property->set_edm_name( 'SprRsnProfile' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDG_TYPE' ).
    lo_primitive_property->set_edm_name( 'BudgType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OTB_STATUS' ).
    lo_primitive_property->set_edm_name( 'OtbStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OTB_REASON' ).
    lo_primitive_property->set_edm_name( 'OtbReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHECK_TYPE' ).
    lo_primitive_property->set_edm_name( 'CheckType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DL_ID' ).
    lo_primitive_property->set_edm_name( 'DlId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NO_SCEM' ).
    lo_primitive_property->set_edm_name( 'NoScem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DNG_DATE' ).
    lo_primitive_property->set_edm_name( 'DngDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DNG_TIME' ).
    lo_primitive_property->set_edm_name( 'DngTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CNCL_ANCMNT_DONE' ).
    lo_primitive_property->set_edm_name( 'CnclAncmntDone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATESHIFT_NUMBER' ).
    lo_primitive_property->set_edm_name( 'DateshiftNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_ekkotype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_EKKOTYPE'
                                    is_structure              = VALUE tys_z_i_ekkotype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_EKKOType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_EKKO' ).
    lo_entity_set->set_edm_name( 'Z_I_EKKO' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELETE_MC' ).
    lo_primitive_property->set_edm_name( 'Delete_mc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPDATE_MC' ).
    lo_primitive_property->set_edm_name( 'Update_mc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EBELN' ).
    lo_primitive_property->set_edm_name( 'Ebeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUKRS' ).
    lo_primitive_property->set_edm_name( 'Bukrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BSTYP' ).
    lo_primitive_property->set_edm_name( 'Bstyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BSART' ).
    lo_primitive_property->set_edm_name( 'Bsart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BSAKZ' ).
    lo_primitive_property->set_edm_name( 'Bsakz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOEKZ' ).
    lo_primitive_property->set_edm_name( 'Loekz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STATU' ).
    lo_primitive_property->set_edm_name( 'Statu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AEDAT' ).
    lo_primitive_property->set_edm_name( 'Aedat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERNAM' ).
    lo_primitive_property->set_edm_name( 'Ernam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LASTCHANGEDATETIME' ).
    lo_primitive_property->set_edm_name( 'Lastchangedatetime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PINCR' ).
    lo_primitive_property->set_edm_name( 'Pincr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LPONR' ).
    lo_primitive_property->set_edm_name( 'Lponr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFNR' ).
    lo_primitive_property->set_edm_name( 'Lifnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPRAS' ).
    lo_primitive_property->set_edm_name( 'Spras' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZTERM' ).
    lo_primitive_property->set_edm_name( 'Zterm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZBD_1_T' ).
    lo_primitive_property->set_edm_name( 'Zbd1t' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZBD_2_T' ).
    lo_primitive_property->set_edm_name( 'Zbd2t' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZBD_3_T' ).
    lo_primitive_property->set_edm_name( 'Zbd3t' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZBD_1_P' ).
    lo_primitive_property->set_edm_name( 'Zbd1p' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZBD_2_P' ).
    lo_primitive_property->set_edm_name( 'Zbd2p' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EKORG' ).
    lo_primitive_property->set_edm_name( 'Ekorg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EKGRP' ).
    lo_primitive_property->set_edm_name( 'Ekgrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAERS' ).
    lo_primitive_property->set_edm_name( 'Waers' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WKURS' ).
    lo_primitive_property->set_edm_name( 'Wkurs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUFIX' ).
    lo_primitive_property->set_edm_name( 'Kufix' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BEDAT' ).
    lo_primitive_property->set_edm_name( 'Bedat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KDATB' ).
    lo_primitive_property->set_edm_name( 'Kdatb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KDATE' ).
    lo_primitive_property->set_edm_name( 'Kdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BWBDT' ).
    lo_primitive_property->set_edm_name( 'Bwbdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANGDT' ).
    lo_primitive_property->set_edm_name( 'Angdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BNDDT' ).
    lo_primitive_property->set_edm_name( 'Bnddt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GWLDT' ).
    lo_primitive_property->set_edm_name( 'Gwldt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUSNR' ).
    lo_primitive_property->set_edm_name( 'Ausnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANGNR' ).
    lo_primitive_property->set_edm_name( 'Angnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IHRAN' ).
    lo_primitive_property->set_edm_name( 'Ihran' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IHREZ' ).
    lo_primitive_property->set_edm_name( 'Ihrez' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VERKF' ).
    lo_primitive_property->set_edm_name( 'Verkf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TELF_1' ).
    lo_primitive_property->set_edm_name( 'Telf1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LLIEF' ).
    lo_primitive_property->set_edm_name( 'Llief' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUNNR' ).
    lo_primitive_property->set_edm_name( 'Kunnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACTIVE_ID' ).
    lo_primitive_property->set_edm_name( 'ActiveId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KONNR' ).
    lo_primitive_property->set_edm_name( 'Konnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABGRU' ).
    lo_primitive_property->set_edm_name( 'Abgru' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUTLF' ).
    lo_primitive_property->set_edm_name( 'Autlf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEAKT' ).
    lo_primitive_property->set_edm_name( 'Weakt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RESWK' ).
    lo_primitive_property->set_edm_name( 'Reswk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LBLIF' ).
    lo_primitive_property->set_edm_name( 'Lblif' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_1' ).
    lo_primitive_property->set_edm_name( 'Inco1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_2' ).
    lo_primitive_property->set_edm_name( 'Inco2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 28 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KTWRT' ).
    lo_primitive_property->set_edm_name( 'Ktwrt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISTRIBUTIONTYPE' ).
    lo_primitive_property->set_edm_name( 'Distributiontype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBMI' ).
    lo_primitive_property->set_edm_name( 'Submi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNUMV' ).
    lo_primitive_property->set_edm_name( 'Knumv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KALSM' ).
    lo_primitive_property->set_edm_name( 'Kalsm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STAFO' ).
    lo_primitive_property->set_edm_name( 'Stafo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFRE' ).
    lo_primitive_property->set_edm_name( 'Lifre' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXNUM' ).
    lo_primitive_property->set_edm_name( 'Exnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNSEZ' ).
    lo_primitive_property->set_edm_name( 'Unsez' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOGSY' ).
    lo_primitive_property->set_edm_name( 'Logsy' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPINC' ).
    lo_primitive_property->set_edm_name( 'Upinc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STAKO' ).
    lo_primitive_property->set_edm_name( 'Stako' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRGGR' ).
    lo_primitive_property->set_edm_name( 'Frggr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRGSX' ).
    lo_primitive_property->set_edm_name( 'Frgsx' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRGKE' ).
    lo_primitive_property->set_edm_name( 'Frgke' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRGZU' ).
    lo_primitive_property->set_edm_name( 'Frgzu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRGRL' ).
    lo_primitive_property->set_edm_name( 'Frgrl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANDS' ).
    lo_primitive_property->set_edm_name( 'Lands' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LPHIS' ).
    lo_primitive_property->set_edm_name( 'Lphis' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADRNR' ).
    lo_primitive_property->set_edm_name( 'Adrnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STCEG_L' ).
    lo_primitive_property->set_edm_name( 'StcegL' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STCEG' ).
    lo_primitive_property->set_edm_name( 'Stceg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABSGR' ).
    lo_primitive_property->set_edm_name( 'Absgr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDNR' ).
    lo_primitive_property->set_edm_name( 'Addnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KORNR' ).
    lo_primitive_property->set_edm_name( 'Kornr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEMORY' ).
    lo_primitive_property->set_edm_name( 'Memory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROCSTAT' ).
    lo_primitive_property->set_edm_name( 'Procstat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROCESS_INDICATOR' ).
    lo_primitive_property->set_edm_name( 'ProcessIndicator' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RLWRT' ).
    lo_primitive_property->set_edm_name( 'Rlwrt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CR_STAT' ).
    lo_primitive_property->set_edm_name( 'CrStat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REVNO' ).
    lo_primitive_property->set_edm_name( 'Revno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCMPROC' ).
    lo_primitive_property->set_edm_name( 'Scmproc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REASON_CODE' ).
    lo_primitive_property->set_edm_name( 'ReasonCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEMORYTYPE' ).
    lo_primitive_property->set_edm_name( 'Memorytype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETTP' ).
    lo_primitive_property->set_edm_name( 'Rettp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETPC' ).
    lo_primitive_property->set_edm_name( 'Retpc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DPTYP' ).
    lo_primitive_property->set_edm_name( 'Dptyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DPPCT' ).
    lo_primitive_property->set_edm_name( 'Dppct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DPAMT' ).
    lo_primitive_property->set_edm_name( 'Dpamt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DPDAT' ).
    lo_primitive_property->set_edm_name( 'Dpdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSR_ID' ).
    lo_primitive_property->set_edm_name( 'MsrId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HIERARCHY_EXISTS' ).
    lo_primitive_property->set_edm_name( 'HierarchyExists' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GROUPING_ID' ).
    lo_primitive_property->set_edm_name( 'GroupingId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARENT_ID' ).
    lo_primitive_property->set_edm_name( 'ParentId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'THRESHOLD_EXISTS' ).
    lo_primitive_property->set_edm_name( 'ThresholdExists' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LEGAL_CONTRACT' ).
    lo_primitive_property->set_edm_name( 'LegalContract' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DESCRIPTION' ).
    lo_primitive_property->set_edm_name( 'Description' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RELEASE_DATE' ).
    lo_primitive_property->set_edm_name( 'ReleaseDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSART' ).
    lo_primitive_property->set_edm_name( 'Vsart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HANDOVERLOC' ).
    lo_primitive_property->set_edm_name( 'Handoverloc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHIPCOND' ).
    lo_primitive_property->set_edm_name( 'Shipcond' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOV' ).
    lo_primitive_property->set_edm_name( 'Incov' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_2_L' ).
    lo_primitive_property->set_edm_name( 'Inco2L' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_3_L' ).
    lo_primitive_property->set_edm_name( 'Inco3L' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRWCU' ).
    lo_primitive_property->set_edm_name( 'Grwcu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTRA_REL' ).
    lo_primitive_property->set_edm_name( 'IntraRel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTRA_EXCL' ).
    lo_primitive_property->set_edm_name( 'IntraExcl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOTAL_STATUS_PCS' ).
    lo_primitive_property->set_edm_name( 'TotalStatusPcs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOTAL_STATUS_PMA' ).
    lo_primitive_property->set_edm_name( 'TotalStatusPma' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOTAL_STATUS_DG' ).
    lo_primitive_property->set_edm_name( 'TotalStatusDg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOTAL_STATUS_SDS' ).
    lo_primitive_property->set_edm_name( 'TotalStatusSds' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QTN_ERLST_SUBMSN_DATE' ).
    lo_primitive_property->set_edm_name( 'QtnErlstSubmsnDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FOLLOWON_DOC_CAT' ).
    lo_primitive_property->set_edm_name( 'FollowonDocCat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FOLLOWON_DOC_TYPE' ).
    lo_primitive_property->set_edm_name( 'FollowonDocType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUMMY_EKKO_INCL_EEW_PS' ).
    lo_primitive_property->set_edm_name( 'DummyEkkoInclEewPs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTERNALSYSTEM' ).
    lo_primitive_property->set_edm_name( 'Externalsystem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTERNALREFERENCEID' ).
    lo_primitive_property->set_edm_name( 'Externalreferenceid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_REV_TMSTMP' ).
    lo_primitive_property->set_edm_name( 'ExtRevTmstmp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ISEOPBLOCKED' ).
    lo_primitive_property->set_edm_name( 'Iseopblocked' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ISAGED' ).
    lo_primitive_property->set_edm_name( 'Isaged' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FORCE_ID' ).
    lo_primitive_property->set_edm_name( 'ForceId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FORCE_CNT' ).
    lo_primitive_property->set_edm_name( 'ForceCnt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RELOC_ID' ).
    lo_primitive_property->set_edm_name( 'RelocId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RELOC_SEQ_ID' ).
    lo_primitive_property->set_edm_name( 'RelocSeqId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SOURCE_LOGSYS' ).
    lo_primitive_property->set_edm_name( 'SourceLogsys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_TRANSACTION' ).
    lo_primitive_property->set_edm_name( 'FshTransaction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_ITEM_GROUP' ).
    lo_primitive_property->set_edm_name( 'FshItemGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_VAS_LAST_ITEM' ).
    lo_primitive_property->set_edm_name( 'FshVasLastItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_OS_STG_CHANGE' ).
    lo_primitive_property->set_edm_name( 'FshOsStgChange' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TMS_REF_UUID' ).
    lo_primitive_property->set_edm_name( 'TmsRefUuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDMBEXPAYMENTDEEMED' ).
    lo_primitive_property->set_edm_name( 'xdmbexpaymentdeemed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDMBEXDEALNUMBER' ).
    lo_primitive_property->set_edm_name( 'xdmbexdealnumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDMBEXEVGIDRENEWAL' ).
    lo_primitive_property->set_edm_name( 'xdmbexevgidrenewal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDMBEXEVGIDCANCEL' ).
    lo_primitive_property->set_edm_name( 'xdmbexevgidcancel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZAPCGK' ).
    lo_primitive_property->set_edm_name( 'Zapcgk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'APCGK_EXTEND' ).
    lo_primitive_property->set_edm_name( 'ApcgkExtend' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZBAS_DATE' ).
    lo_primitive_property->set_edm_name( 'ZbasDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZADATTYP' ).
    lo_primitive_property->set_edm_name( 'Zadattyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZSTART_DAT' ).
    lo_primitive_property->set_edm_name( 'ZstartDat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZDEV' ).
    lo_primitive_property->set_edm_name( 'ZDev' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZINDANX' ).
    lo_primitive_property->set_edm_name( 'Zindanx' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZLIMIT_DAT' ).
    lo_primitive_property->set_edm_name( 'ZlimitDat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NUMERATOR' ).
    lo_primitive_property->set_edm_name( 'Numerator' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HASHCAL_BDAT' ).
    lo_primitive_property->set_edm_name( 'HashcalBdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HASHCAL' ).
    lo_primitive_property->set_edm_name( 'Hashcal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NEGATIVE' ).
    lo_primitive_property->set_edm_name( 'Negative' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HASHCAL_EXISTS' ).
    lo_primitive_property->set_edm_name( 'HashcalExists' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNOWN_INDEX' ).
    lo_primitive_property->set_edm_name( 'KnownIndex' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSTAT' ).
    lo_primitive_property->set_edm_name( 'Postat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VZSKZ' ).
    lo_primitive_property->set_edm_name( 'Vzskz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_SNST_STATUS' ).
    lo_primitive_property->set_edm_name( 'FshSnstStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROCE' ).
    lo_primitive_property->set_edm_name( 'Proce' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONC' ).
    lo_primitive_property->set_edm_name( 'Conc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONT' ).
    lo_primitive_property->set_edm_name( 'Cont' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMP' ).
    lo_primitive_property->set_edm_name( 'Comp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OUTR' ).
    lo_primitive_property->set_edm_name( 'Outr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DESP' ).
    lo_primitive_property->set_edm_name( 'Desp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 100 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DESP_DAT' ).
    lo_primitive_property->set_edm_name( 'DespDat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DESP_CARGO' ).
    lo_primitive_property->set_edm_name( 'DespCargo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARE' ).
    lo_primitive_property->set_edm_name( 'Pare' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 100 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARE_DAT' ).
    lo_primitive_property->set_edm_name( 'PareDat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARE_CARGO' ).
    lo_primitive_property->set_edm_name( 'PareCargo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POHF_TYPE' ).
    lo_primitive_property->set_edm_name( 'PohfType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EQ_EINDT' ).
    lo_primitive_property->set_edm_name( 'EqEindt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EQ_WERKS' ).
    lo_primitive_property->set_edm_name( 'EqWerks' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIXPO' ).
    lo_primitive_property->set_edm_name( 'Fixpo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EKGRP_ALLOW' ).
    lo_primitive_property->set_edm_name( 'EkgrpAllow' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WERKS_ALLOW' ).
    lo_primitive_property->set_edm_name( 'WerksAllow' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTRACT_ALLOW' ).
    lo_primitive_property->set_edm_name( 'ContractAllow' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSTYP_ALLOW' ).
    lo_primitive_property->set_edm_name( 'PstypAllow' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIXPO_ALLOW' ).
    lo_primitive_property->set_edm_name( 'FixpoAllow' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KEY_ID_ALLOW' ).
    lo_primitive_property->set_edm_name( 'KeyIdAllow' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUREL_ALLOW' ).
    lo_primitive_property->set_edm_name( 'AurelAllow' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELPER_ALLOW' ).
    lo_primitive_property->set_edm_name( 'DelperAllow' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EINDT_ALLOW' ).
    lo_primitive_property->set_edm_name( 'EindtAllow' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LTSNR_ALLOW' ).
    lo_primitive_property->set_edm_name( 'LtsnrAllow' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OTB_LEVEL' ).
    lo_primitive_property->set_edm_name( 'OtbLevel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OTB_COND_TYPE' ).
    lo_primitive_property->set_edm_name( 'OtbCondType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KEY_ID' ).
    lo_primitive_property->set_edm_name( 'KeyId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OTB_CURR' ).
    lo_primitive_property->set_edm_name( 'OtbCurr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPR_RSN_PROFILE' ).
    lo_primitive_property->set_edm_name( 'SprRsnProfile' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDG_TYPE' ).
    lo_primitive_property->set_edm_name( 'BudgType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OTB_STATUS' ).
    lo_primitive_property->set_edm_name( 'OtbStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OTB_REASON' ).
    lo_primitive_property->set_edm_name( 'OtbReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHECK_TYPE' ).
    lo_primitive_property->set_edm_name( 'CheckType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CON_OTB_REQ' ).
    lo_primitive_property->set_edm_name( 'ConOtbReq' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CON_PREBOOK_LEV' ).
    lo_primitive_property->set_edm_name( 'ConPrebookLev' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CON_DISTR_LEV' ).
    lo_primitive_property->set_edm_name( 'ConDistrLev' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_ekpotype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_EKPOTYPE'
                                    is_structure              = VALUE tys_z_i_ekpotype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_EKPOType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_EKPO' ).
    lo_entity_set->set_edm_name( 'Z_I_EKPO' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELETE_MC' ).
    lo_primitive_property->set_edm_name( 'Delete_mc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPDATE_MC' ).
    lo_primitive_property->set_edm_name( 'Update_mc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EBELN' ).
    lo_primitive_property->set_edm_name( 'Ebeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EBELP' ).
    lo_primitive_property->set_edm_name( 'Ebelp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNIQUEID' ).
    lo_primitive_property->set_edm_name( 'Uniqueid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOEKZ' ).
    lo_primitive_property->set_edm_name( 'Loekz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STATU' ).
    lo_primitive_property->set_edm_name( 'Statu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AEDAT' ).
    lo_primitive_property->set_edm_name( 'Aedat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXZ_01' ).
    lo_primitive_property->set_edm_name( 'Txz01' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATNR' ).
    lo_primitive_property->set_edm_name( 'Matnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMATN' ).
    lo_primitive_property->set_edm_name( 'Ematn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUKRS' ).
    lo_primitive_property->set_edm_name( 'Bukrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WERKS' ).
    lo_primitive_property->set_edm_name( 'Werks' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGORT' ).
    lo_primitive_property->set_edm_name( 'Lgort' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BEDNR' ).
    lo_primitive_property->set_edm_name( 'Bednr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATKL' ).
    lo_primitive_property->set_edm_name( 'Matkl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INFNR' ).
    lo_primitive_property->set_edm_name( 'Infnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDNLF' ).
    lo_primitive_property->set_edm_name( 'Idnlf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KTMNG' ).
    lo_primitive_property->set_edm_name( 'Ktmng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MENGE' ).
    lo_primitive_property->set_edm_name( 'Menge' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEINS' ).
    lo_primitive_property->set_edm_name( 'Meins' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BPRME' ).
    lo_primitive_property->set_edm_name( 'Bprme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BPUMZ' ).
    lo_primitive_property->set_edm_name( 'Bpumz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BPUMN' ).
    lo_primitive_property->set_edm_name( 'Bpumn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMREZ' ).
    lo_primitive_property->set_edm_name( 'Umrez' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMREN' ).
    lo_primitive_property->set_edm_name( 'Umren' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETPR' ).
    lo_primitive_property->set_edm_name( 'Netpr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PEINH' ).
    lo_primitive_property->set_edm_name( 'Peinh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETWR' ).
    lo_primitive_property->set_edm_name( 'Netwr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRTWR' ).
    lo_primitive_property->set_edm_name( 'Brtwr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AGDAT' ).
    lo_primitive_property->set_edm_name( 'Agdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEBAZ' ).
    lo_primitive_property->set_edm_name( 'Webaz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MWSKZ' ).
    lo_primitive_property->set_edm_name( 'Mwskz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXDAT_FROM' ).
    lo_primitive_property->set_edm_name( 'TxdatFrom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXDAT' ).
    lo_primitive_property->set_edm_name( 'Txdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BONUS' ).
    lo_primitive_property->set_edm_name( 'Bonus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INSMK' ).
    lo_primitive_property->set_edm_name( 'Insmk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPINF' ).
    lo_primitive_property->set_edm_name( 'Spinf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRSDR' ).
    lo_primitive_property->set_edm_name( 'Prsdr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCHPR' ).
    lo_primitive_property->set_edm_name( 'Schpr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAHNZ' ).
    lo_primitive_property->set_edm_name( 'Mahnz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAHN_1' ).
    lo_primitive_property->set_edm_name( 'Mahn1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAHN_2' ).
    lo_primitive_property->set_edm_name( 'Mahn2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAHN_3' ).
    lo_primitive_property->set_edm_name( 'Mahn3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UEBTO' ).
    lo_primitive_property->set_edm_name( 'Uebto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UEBTK' ).
    lo_primitive_property->set_edm_name( 'Uebtk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNTTO' ).
    lo_primitive_property->set_edm_name( 'Untto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BWTAR' ).
    lo_primitive_property->set_edm_name( 'Bwtar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BWTTY' ).
    lo_primitive_property->set_edm_name( 'Bwtty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABSKZ' ).
    lo_primitive_property->set_edm_name( 'Abskz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AGMEM' ).
    lo_primitive_property->set_edm_name( 'Agmem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELIKZ' ).
    lo_primitive_property->set_edm_name( 'Elikz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EREKZ' ).
    lo_primitive_property->set_edm_name( 'Erekz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSTYP' ).
    lo_primitive_property->set_edm_name( 'Pstyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNTTP' ).
    lo_primitive_property->set_edm_name( 'Knttp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZVBR' ).
    lo_primitive_property->set_edm_name( 'Kzvbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VRTKZ' ).
    lo_primitive_property->set_edm_name( 'Vrtkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TWRKZ' ).
    lo_primitive_property->set_edm_name( 'Twrkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEPOS' ).
    lo_primitive_property->set_edm_name( 'Wepos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEUNB' ).
    lo_primitive_property->set_edm_name( 'Weunb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REPOS' ).
    lo_primitive_property->set_edm_name( 'Repos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEBRE' ).
    lo_primitive_property->set_edm_name( 'Webre' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZABS' ).
    lo_primitive_property->set_edm_name( 'Kzabs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LABNR' ).
    lo_primitive_property->set_edm_name( 'Labnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KONNR' ).
    lo_primitive_property->set_edm_name( 'Konnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KTPNR' ).
    lo_primitive_property->set_edm_name( 'Ktpnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABDAT' ).
    lo_primitive_property->set_edm_name( 'Abdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABFTZ' ).
    lo_primitive_property->set_edm_name( 'Abftz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETFZ_1' ).
    lo_primitive_property->set_edm_name( 'Etfz1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETFZ_2' ).
    lo_primitive_property->set_edm_name( 'Etfz2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZSTU' ).
    lo_primitive_property->set_edm_name( 'Kzstu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NOTKZ' ).
    lo_primitive_property->set_edm_name( 'Notkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LMEIN' ).
    lo_primitive_property->set_edm_name( 'Lmein' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EVERS' ).
    lo_primitive_property->set_edm_name( 'Evers' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZWERT' ).
    lo_primitive_property->set_edm_name( 'Zwert' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAVNW' ).
    lo_primitive_property->set_edm_name( 'Navnw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABMNG' ).
    lo_primitive_property->set_edm_name( 'Abmng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRDAT' ).
    lo_primitive_property->set_edm_name( 'Prdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BSTYP' ).
    lo_primitive_property->set_edm_name( 'Bstyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EFFWR' ).
    lo_primitive_property->set_edm_name( 'Effwr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XOBLR' ).
    lo_primitive_property->set_edm_name( 'Xoblr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUNNR' ).
    lo_primitive_property->set_edm_name( 'Kunnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADRNR' ).
    lo_primitive_property->set_edm_name( 'Adrnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EKKOL' ).
    lo_primitive_property->set_edm_name( 'Ekkol' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SKTOF' ).
    lo_primitive_property->set_edm_name( 'Sktof' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STAFO' ).
    lo_primitive_property->set_edm_name( 'Stafo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLIFZ' ).
    lo_primitive_property->set_edm_name( 'Plifz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NTGEW' ).
    lo_primitive_property->set_edm_name( 'Ntgew' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GEWEI' ).
    lo_primitive_property->set_edm_name( 'Gewei' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXJCD' ).
    lo_primitive_property->set_edm_name( 'Txjcd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETDRK' ).
    lo_primitive_property->set_edm_name( 'Etdrk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SOBKZ' ).
    lo_primitive_property->set_edm_name( 'Sobkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARSNR' ).
    lo_primitive_property->set_edm_name( 'Arsnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARSPS' ).
    lo_primitive_property->set_edm_name( 'Arsps' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INSNC' ).
    lo_primitive_property->set_edm_name( 'Insnc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SSQSS' ).
    lo_primitive_property->set_edm_name( 'Ssqss' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZGTYP' ).
    lo_primitive_property->set_edm_name( 'Zgtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EAN_11' ).
    lo_primitive_property->set_edm_name( 'Ean11' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BSTAE' ).
    lo_primitive_property->set_edm_name( 'Bstae' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REVLV' ).
    lo_primitive_property->set_edm_name( 'Revlv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GEBER' ).
    lo_primitive_property->set_edm_name( 'Geber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISTL' ).
    lo_primitive_property->set_edm_name( 'Fistl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIPOS' ).
    lo_primitive_property->set_edm_name( 'Fipos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KO_GSBER' ).
    lo_primitive_property->set_edm_name( 'KoGsber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KO_PARGB' ).
    lo_primitive_property->set_edm_name( 'KoPargb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KO_PRCTR' ).
    lo_primitive_property->set_edm_name( 'KoPrctr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KO_PPRCTR' ).
    lo_primitive_property->set_edm_name( 'KoPprctr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEPRF' ).
    lo_primitive_property->set_edm_name( 'Meprf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRGEW' ).
    lo_primitive_property->set_edm_name( 'Brgew' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLUM' ).
    lo_primitive_property->set_edm_name( 'Volum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLEH' ).
    lo_primitive_property->set_edm_name( 'Voleh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_1' ).
    lo_primitive_property->set_edm_name( 'Inco1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_2' ).
    lo_primitive_property->set_edm_name( 'Inco2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 28 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VORAB' ).
    lo_primitive_property->set_edm_name( 'Vorab' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOLIF' ).
    lo_primitive_property->set_edm_name( 'Kolif' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LTSNR' ).
    lo_primitive_property->set_edm_name( 'Ltsnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PACKNO' ).
    lo_primitive_property->set_edm_name( 'Packno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FPLNR' ).
    lo_primitive_property->set_edm_name( 'Fplnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STAPO' ).
    lo_primitive_property->set_edm_name( 'Stapo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UEBPO' ).
    lo_primitive_property->set_edm_name( 'Uebpo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LEWED' ).
    lo_primitive_property->set_edm_name( 'Lewed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMLIF' ).
    lo_primitive_property->set_edm_name( 'Emlif' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LBLKZ' ).
    lo_primitive_property->set_edm_name( 'Lblkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SATNR' ).
    lo_primitive_property->set_edm_name( 'Satnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ATTYP' ).
    lo_primitive_property->set_edm_name( 'Attyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSART' ).
    lo_primitive_property->set_edm_name( 'Vsart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HANDOVERLOC' ).
    lo_primitive_property->set_edm_name( 'Handoverloc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KANBA' ).
    lo_primitive_property->set_edm_name( 'Kanba' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADRN_2' ).
    lo_primitive_property->set_edm_name( 'Adrn2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_ADDRESS_TYPE' ).
    lo_primitive_property->set_edm_name( 'DeliveryAddressType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUOBJ' ).
    lo_primitive_property->set_edm_name( 'Cuobj' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XERSY' ).
    lo_primitive_property->set_edm_name( 'Xersy' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EILDT' ).
    lo_primitive_property->set_edm_name( 'Eildt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DRDAT' ).
    lo_primitive_property->set_edm_name( 'Drdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DRUHR' ).
    lo_primitive_property->set_edm_name( 'Druhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DRUNR' ).
    lo_primitive_property->set_edm_name( 'Drunr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AKTNR' ).
    lo_primitive_property->set_edm_name( 'Aktnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABELN' ).
    lo_primitive_property->set_edm_name( 'Abeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABELP' ).
    lo_primitive_property->set_edm_name( 'Abelp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUNEI' ).
    lo_primitive_property->set_edm_name( 'Punei' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAISO' ).
    lo_primitive_property->set_edm_name( 'Saiso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAISJ' ).
    lo_primitive_property->set_edm_name( 'Saisj' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EBON_2' ).
    lo_primitive_property->set_edm_name( 'Ebon2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EBON_3' ).
    lo_primitive_property->set_edm_name( 'Ebon3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EBONF' ).
    lo_primitive_property->set_edm_name( 'Ebonf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MLMAA' ).
    lo_primitive_property->set_edm_name( 'Mlmaa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MHDRZ' ).
    lo_primitive_property->set_edm_name( 'Mhdrz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANFNR' ).
    lo_primitive_property->set_edm_name( 'Anfnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANFPS' ).
    lo_primitive_property->set_edm_name( 'Anfps' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZKFG' ).
    lo_primitive_property->set_edm_name( 'Kzkfg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'USEQU' ).
    lo_primitive_property->set_edm_name( 'Usequ' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMSOK' ).
    lo_primitive_property->set_edm_name( 'Umsok' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANFN' ).
    lo_primitive_property->set_edm_name( 'Banfn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BNFPO' ).
    lo_primitive_property->set_edm_name( 'Bnfpo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MTART' ).
    lo_primitive_property->set_edm_name( 'Mtart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPTYP' ).
    lo_primitive_property->set_edm_name( 'Uptyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPVOR' ).
    lo_primitive_property->set_edm_name( 'Upvor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SIKGR' ).
    lo_primitive_property->set_edm_name( 'Sikgr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETPO' ).
    lo_primitive_property->set_edm_name( 'Retpo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUREL' ).
    lo_primitive_property->set_edm_name( 'Aurel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BSGRU' ).
    lo_primitive_property->set_edm_name( 'Bsgru' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFRET' ).
    lo_primitive_property->set_edm_name( 'Lfret' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MFRGR' ).
    lo_primitive_property->set_edm_name( 'Mfrgr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NRFHG' ).
    lo_primitive_property->set_edm_name( 'Nrfhg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_BNBM' ).
    lo_primitive_property->set_edm_name( 'J1bnbm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_BMATUSE' ).
    lo_primitive_property->set_edm_name( 'J1bmatuse' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_BMATORG' ).
    lo_primitive_property->set_edm_name( 'J1bmatorg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_BOWNPRO' ).
    lo_primitive_property->set_edm_name( 'J1bownpro' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_BINDUST' ).
    lo_primitive_property->set_edm_name( 'J1bindust' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABUEB' ).
    lo_primitive_property->set_edm_name( 'Abueb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NLABD' ).
    lo_primitive_property->set_edm_name( 'Nlabd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NFABD' ).
    lo_primitive_property->set_edm_name( 'Nfabd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZBWS' ).
    lo_primitive_property->set_edm_name( 'Kzbws' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FABKZ' ).
    lo_primitive_property->set_edm_name( 'Fabkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOADINGPOINT' ).
    lo_primitive_property->set_edm_name( 'Loadingpoint' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_AINDXP' ).
    lo_primitive_property->set_edm_name( 'J1aindxp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_AIDATEP' ).
    lo_primitive_property->set_edm_name( 'J1aidatep' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MPROF' ).
    lo_primitive_property->set_edm_name( 'Mprof' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EGLKZ' ).
    lo_primitive_property->set_edm_name( 'Eglkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZTLF' ).
    lo_primitive_property->set_edm_name( 'Kztlf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZFME' ).
    lo_primitive_property->set_edm_name( 'Kzfme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RDPRF' ).
    lo_primitive_property->set_edm_name( 'Rdprf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TECHS' ).
    lo_primitive_property->set_edm_name( 'Techs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHG_SRV' ).
    lo_primitive_property->set_edm_name( 'ChgSrv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHG_FPLNR' ).
    lo_primitive_property->set_edm_name( 'ChgFplnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MFRPN' ).
    lo_primitive_property->set_edm_name( 'Mfrpn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MFRNR' ).
    lo_primitive_property->set_edm_name( 'Mfrnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMNFR' ).
    lo_primitive_property->set_edm_name( 'Emnfr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NOVET' ).
    lo_primitive_property->set_edm_name( 'Novet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AFNAM' ).
    lo_primitive_property->set_edm_name( 'Afnam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TZONRC' ).
    lo_primitive_property->set_edm_name( 'Tzonrc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IPRKZ' ).
    lo_primitive_property->set_edm_name( 'Iprkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LEBRE' ).
    lo_primitive_property->set_edm_name( 'Lebre' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BERID' ).
    lo_primitive_property->set_edm_name( 'Berid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCONDITIONS' ).
    lo_primitive_property->set_edm_name( 'Xconditions' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'APOMS' ).
    lo_primitive_property->set_edm_name( 'Apoms' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CCOMP' ).
    lo_primitive_property->set_edm_name( 'Ccomp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRANT_NBR' ).
    lo_primitive_property->set_edm_name( 'GrantNbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKBER' ).
    lo_primitive_property->set_edm_name( 'Fkber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STATUS' ).
    lo_primitive_property->set_edm_name( 'Status' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RESLO' ).
    lo_primitive_property->set_edm_name( 'Reslo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KBLNR' ).
    lo_primitive_property->set_edm_name( 'Kblnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KBLPOS' ).
    lo_primitive_property->set_edm_name( 'Kblpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PS_PSP_PNR' ).
    lo_primitive_property->set_edm_name( 'PsPspPnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOSTL' ).
    lo_primitive_property->set_edm_name( 'Kostl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAKTO' ).
    lo_primitive_property->set_edm_name( 'Sakto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEORA' ).
    lo_primitive_property->set_edm_name( 'Weora' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SRV_BAS_COM' ).
    lo_primitive_property->set_edm_name( 'SrvBasCom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRIO_URG' ).
    lo_primitive_property->set_edm_name( 'PrioUrg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRIO_REQ' ).
    lo_primitive_property->set_edm_name( 'PrioReq' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMPST' ).
    lo_primitive_property->set_edm_name( 'Empst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DIFF_INVOICE' ).
    lo_primitive_property->set_edm_name( 'DiffInvoice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRMRISK_RELEVANT' ).
    lo_primitive_property->set_edm_name( 'TrmriskRelevant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATIONDATE' ).
    lo_primitive_property->set_edm_name( 'Creationdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATIONTIME' ).
    lo_primitive_property->set_edm_name( 'Creationtime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VCM_CHAIN_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'VcmChainCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_ABGRU' ).
    lo_primitive_property->set_edm_name( 'SpeAbgru' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_CRM_SO' ).
    lo_primitive_property->set_edm_name( 'SpeCrmSo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_CRM_SO_ITEM' ).
    lo_primitive_property->set_edm_name( 'SpeCrmSoItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_CRM_REF_SO' ).
    lo_primitive_property->set_edm_name( 'SpeCrmRefSo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_CRM_REF_ITEM' ).
    lo_primitive_property->set_edm_name( 'SpeCrmRefItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_CRM_FKREL' ).
    lo_primitive_property->set_edm_name( 'SpeCrmFkrel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_CHNG_SYS' ).
    lo_primitive_property->set_edm_name( 'SpeChngSys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_INSMK_SRC' ).
    lo_primitive_property->set_edm_name( 'SpeInsmkSrc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_CQ_CTRLTYPE' ).
    lo_primitive_property->set_edm_name( 'SpeCqCtrltype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_CQ_NOCQ' ).
    lo_primitive_property->set_edm_name( 'SpeCqNocq' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REASON_CODE' ).
    lo_primitive_property->set_edm_name( 'ReasonCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANZSN' ).
    lo_primitive_property->set_edm_name( 'Anzsn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_EWM_DTC' ).
    lo_primitive_property->set_edm_name( 'SpeEwmDtc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXLIN' ).
    lo_primitive_property->set_edm_name( 'Exlin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXSNR' ).
    lo_primitive_property->set_edm_name( 'Exsnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EHTYP' ).
    lo_primitive_property->set_edm_name( 'Ehtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETPC' ).
    lo_primitive_property->set_edm_name( 'Retpc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DPTYP' ).
    lo_primitive_property->set_edm_name( 'Dptyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DPPCT' ).
    lo_primitive_property->set_edm_name( 'Dppct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DPDAT' ).
    lo_primitive_property->set_edm_name( 'Dpdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLS_RSTO' ).
    lo_primitive_property->set_edm_name( 'FlsRsto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_RFX_NUMBER' ).
    lo_primitive_property->set_edm_name( 'ExtRfxNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_RFX_ITEM' ).
    lo_primitive_property->set_edm_name( 'ExtRfxItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_RFX_SYSTEM' ).
    lo_primitive_property->set_edm_name( 'ExtRfxSystem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SRM_CONTRACT_ID' ).
    lo_primitive_property->set_edm_name( 'SrmContractId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SRM_CONTRACT_ITM' ).
    lo_primitive_property->set_edm_name( 'SrmContractItm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GOODS_COUNT_CORRECTION' ).
    lo_primitive_property->set_edm_name( 'GoodsCountCorrection' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFEX' ).
    lo_primitive_property->set_edm_name( 'Lifex' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFEXPOS' ).
    lo_primitive_property->set_edm_name( 'Lifexpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLK_REASON_ID' ).
    lo_primitive_property->set_edm_name( 'BlkReasonId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLK_REASON_TXT' ).
    lo_primitive_property->set_edm_name( 'BlkReasonTxt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITCONS' ).
    lo_primitive_property->set_edm_name( 'Itcons' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIXMG' ).
    lo_primitive_property->set_edm_name( 'Fixmg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WABWE' ).
    lo_primitive_property->set_edm_name( 'Wabwe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMPL_DLV_ITM' ).
    lo_primitive_property->set_edm_name( 'CmplDlvItm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_2_L' ).
    lo_primitive_property->set_edm_name( 'Inco2L' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_3_L' ).
    lo_primitive_property->set_edm_name( 'Inco3L' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_2_KEY' ).
    lo_primitive_property->set_edm_name( 'Inco2Key' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_3_KEY' ).
    lo_primitive_property->set_edm_name( 'Inco3Key' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_4_KEY' ).
    lo_primitive_property->set_edm_name( 'Inco4Key' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STAWN' ).
    lo_primitive_property->set_edm_name( 'Stawn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ISVCO' ).
    lo_primitive_property->set_edm_name( 'Isvco' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICEPERFORMER' ).
    lo_primitive_property->set_edm_name( 'Serviceperformer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCTTYPE' ).
    lo_primitive_property->set_edm_name( 'Producttype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GR_BY_SES' ).
    lo_primitive_property->set_edm_name( 'GrBySes' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICE_CHANGE_IN_SES_ALLOWE' ).
    lo_primitive_property->set_edm_name( 'PriceChangeInSesAllowed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQUESTFORQUOTATION' ).
    lo_primitive_property->set_edm_name( 'Requestforquotation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQUESTFORQUOTATIONITEM' ).
    lo_primitive_property->set_edm_name( 'Requestforquotationitem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RENEGOTIATION_STATUS' ).
    lo_primitive_property->set_edm_name( 'RenegotiationStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STATUS_PCS' ).
    lo_primitive_property->set_edm_name( 'StatusPcs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STATUS_PMA' ).
    lo_primitive_property->set_edm_name( 'StatusPma' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STATUS_DG' ).
    lo_primitive_property->set_edm_name( 'StatusDg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STATUS_SDS' ).
    lo_primitive_property->set_edm_name( 'StatusSds' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTMATERIALFORPURG' ).
    lo_primitive_property->set_edm_name( 'Extmaterialforpurg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROCMT_HUB_SOURCE_SYSTEM' ).
    lo_primitive_property->set_edm_name( 'ProcmtHubSourceSystem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTERNALREFERENCEID' ).
    lo_primitive_property->set_edm_name( 'Externalreferenceid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TC_AUT_DET' ).
    lo_primitive_property->set_edm_name( 'TcAutDet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MANUAL_TC_REASON' ).
    lo_primitive_property->set_edm_name( 'ManualTcReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_INCENTIVE' ).
    lo_primitive_property->set_edm_name( 'FiscalIncentive' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_SUBJECT_ST' ).
    lo_primitive_property->set_edm_name( 'TaxSubjectSt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_INCENTIVE_ID' ).
    lo_primitive_property->set_edm_name( 'FiscalIncentiveId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SF_TXJCD' ).
    lo_primitive_property->set_edm_name( 'SfTxjcd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUMMY_EKPO_INCL_EEW_PS' ).
    lo_primitive_property->set_edm_name( 'DummyEkpoInclEewPs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTRACT_FOR_LIMIT' ).
    lo_primitive_property->set_edm_name( 'ContractForLimit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENH_DATE_1' ).
    lo_primitive_property->set_edm_name( 'EnhDate1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENH_DATE_2' ).
    lo_primitive_property->set_edm_name( 'EnhDate2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENH_PERCENT' ).
    lo_primitive_property->set_edm_name( 'EnhPercent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENH_NUMC_1' ).
    lo_primitive_property->set_edm_name( 'EnhNumc1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATAAGING' ).
    lo_primitive_property->set_edm_name( 'Dataaging' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUPIT' ).
    lo_primitive_property->set_edm_name( 'Cupit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CIGIT' ).
    lo_primitive_property->set_edm_name( 'Cigit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MGOIT' ).
    lo_primitive_property->set_edm_name( 'Mgoit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXS_BUSINESS_TRANSACTION' ).
    lo_primitive_property->set_edm_name( 'TxsBusinessTransaction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXS_MATERIAL_USAGE' ).
    lo_primitive_property->set_edm_name( 'TxsMaterialUsage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXS_USAGE_PURPOSE' ).
    lo_primitive_property->set_edm_name( 'TxsUsagePurpose' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBEV_1_XNEGEN_ITEM' ).
    lo_primitive_property->set_edm_name( 'xbev1xnegenItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBEV_1_XNEDEPFREE' ).
    lo_primitive_property->set_edm_name( 'xbev1xnedepfree' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBEV_1_XNESTRUCCAT' ).
    lo_primitive_property->set_edm_name( 'xbev1xnestruccat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADVCODE' ).
    lo_primitive_property->set_edm_name( 'Advcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDGET_PD' ).
    lo_primitive_property->set_edm_name( 'BudgetPd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXCPE' ).
    lo_primitive_property->set_edm_name( 'Excpe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FMFGUS_KEY' ).
    lo_primitive_property->set_edm_name( 'FmfgusKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IUID_RELEVANT' ).
    lo_primitive_property->set_edm_name( 'IuidRelevant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MRPIND' ).
    lo_primitive_property->set_edm_name( 'Mrpind' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SGT_SCAT' ).
    lo_primitive_property->set_edm_name( 'SgtScat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SGT_RCAT' ).
    lo_primitive_property->set_edm_name( 'SgtRcat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TMS_REF_UUID' ).
    lo_primitive_property->set_edm_name( 'TmsRefUuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TMS_SRC_LOC_KEY' ).
    lo_primitive_property->set_edm_name( 'TmsSrcLocKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TMS_DES_LOC_KEY' ).
    lo_primitive_property->set_edm_name( 'TmsDesLocKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WRF_CHARSTC_1' ).
    lo_primitive_property->set_edm_name( 'WrfCharstc1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WRF_CHARSTC_2' ).
    lo_primitive_property->set_edm_name( 'WrfCharstc2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WRF_CHARSTC_3' ).
    lo_primitive_property->set_edm_name( 'WrfCharstc3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFSITE' ).
    lo_primitive_property->set_edm_name( 'Refsite' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDMBEXOPTIONALITYKEY' ).
    lo_primitive_property->set_edm_name( 'xdmbexoptionalitykey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDMBEXOPTIONALITYFOR' ).
    lo_primitive_property->set_edm_name( 'xdmbexoptionalityfor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDMBEXCIMAX_2' ).
    lo_primitive_property->set_edm_name( 'xdmbexcimax2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDMBEXITEM_TYPE' ).
    lo_primitive_property->set_edm_name( 'xdmbexitemType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDMBEXEFFECTIVEDATEFROM' ).
    lo_primitive_property->set_edm_name( 'xdmbexeffectivedatefrom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDMBEXEFFECTIVEDATETO' ).
    lo_primitive_property->set_edm_name( 'xdmbexeffectivedateto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDMBEXOPTIONOF' ).
    lo_primitive_property->set_edm_name( 'xdmbexoptionof' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDMBEXACCOUNTING_TYPE' ).
    lo_primitive_property->set_edm_name( 'xdmbexaccountingType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDMBEXFAS_CODE' ).
    lo_primitive_property->set_edm_name( 'xdmbexfasCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDMBEXSCHEDULING_DESK' ).
    lo_primitive_property->set_edm_name( 'xdmbexschedulingDesk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDMBEXCOMPONENTFOR' ).
    lo_primitive_property->set_edm_name( 'xdmbexcomponentfor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDMBEXMIXEDPRODUCT' ).
    lo_primitive_property->set_edm_name( 'xdmbexmixedproduct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDMBEXPOSTEDDATE' ).
    lo_primitive_property->set_edm_name( 'xdmbexposteddate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDMBEXDEAL_POSTED' ).
    lo_primitive_property->set_edm_name( 'xdmbexdealPosted' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDMBEXINVOICEUOM' ).
    lo_primitive_property->set_edm_name( 'xdmbexinvoiceuom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZAPCGK' ).
    lo_primitive_property->set_edm_name( 'Zapcgk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'APCGK_EXTEND' ).
    lo_primitive_property->set_edm_name( 'ApcgkExtend' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZBAS_DATE' ).
    lo_primitive_property->set_edm_name( 'ZbasDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZADATTYP' ).
    lo_primitive_property->set_edm_name( 'Zadattyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZSTART_DAT' ).
    lo_primitive_property->set_edm_name( 'ZstartDat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZDEV' ).
    lo_primitive_property->set_edm_name( 'ZDev' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZINDANX' ).
    lo_primitive_property->set_edm_name( 'Zindanx' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZLIMIT_DAT' ).
    lo_primitive_property->set_edm_name( 'ZlimitDat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NUMERATOR' ).
    lo_primitive_property->set_edm_name( 'Numerator' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HASHCAL_BDAT' ).
    lo_primitive_property->set_edm_name( 'HashcalBdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HASHCAL' ).
    lo_primitive_property->set_edm_name( 'Hashcal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NEGATIVE' ).
    lo_primitive_property->set_edm_name( 'Negative' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HASHCAL_EXISTS' ).
    lo_primitive_property->set_edm_name( 'HashcalExists' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNOWN_INDEX' ).
    lo_primitive_property->set_edm_name( 'KnownIndex' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XSAPMPXGPOSE' ).
    lo_primitive_property->set_edm_name( 'xsapmpxgpose' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANGPN' ).
    lo_primitive_property->set_edm_name( 'Angpn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADMOI' ).
    lo_primitive_property->set_edm_name( 'Admoi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADPRI' ).
    lo_primitive_property->set_edm_name( 'Adpri' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LPRIO' ).
    lo_primitive_property->set_edm_name( 'Lprio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADACN' ).
    lo_primitive_property->set_edm_name( 'Adacn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AFPNR' ).
    lo_primitive_property->set_edm_name( 'Afpnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BSARK' ).
    lo_primitive_property->set_edm_name( 'Bsark' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUDAT' ).
    lo_primitive_property->set_edm_name( 'Audat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANGNR' ).
    lo_primitive_property->set_edm_name( 'Angnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PNSTAT' ).
    lo_primitive_property->set_edm_name( 'Pnstat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDNS' ).
    lo_primitive_property->set_edm_name( 'Addns' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ASSIGNMENT_PRIORITY' ).
    lo_primitive_property->set_edm_name( 'AssignmentPriority' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARUN_GROUP_PRIO' ).
    lo_primitive_property->set_edm_name( 'ArunGroupPrio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARUN_ORDER_PRIO' ).
    lo_primitive_property->set_edm_name( 'ArunOrderPrio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERRU' ).
    lo_primitive_property->set_edm_name( 'Serru' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERNP' ).
    lo_primitive_property->set_edm_name( 'Sernp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISUB_SOBKZ' ).
    lo_primitive_property->set_edm_name( 'DisubSobkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISUB_PSPNR' ).
    lo_primitive_property->set_edm_name( 'DisubPspnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISUB_KUNNR' ).
    lo_primitive_property->set_edm_name( 'DisubKunnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISUB_VBELN' ).
    lo_primitive_property->set_edm_name( 'DisubVbeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISUB_POSNR' ).
    lo_primitive_property->set_edm_name( 'DisubPosnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISUB_OWNER' ).
    lo_primitive_property->set_edm_name( 'DisubOwner' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_SEASON_YEAR' ).
    lo_primitive_property->set_edm_name( 'FshSeasonYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_SEASON' ).
    lo_primitive_property->set_edm_name( 'FshSeason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_COLLECTION' ).
    lo_primitive_property->set_edm_name( 'FshCollection' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_THEME' ).
    lo_primitive_property->set_edm_name( 'FshTheme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_ATP_DATE' ).
    lo_primitive_property->set_edm_name( 'FshAtpDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_VAS_REL' ).
    lo_primitive_property->set_edm_name( 'FshVasRel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_VAS_PRNT_ID' ).
    lo_primitive_property->set_edm_name( 'FshVasPrntId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_TRANSACTION' ).
    lo_primitive_property->set_edm_name( 'FshTransaction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_ITEM_GROUP' ).
    lo_primitive_property->set_edm_name( 'FshItemGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_ITEM' ).
    lo_primitive_property->set_edm_name( 'FshItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_SS' ).
    lo_primitive_property->set_edm_name( 'FshSs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_GRID_COND_REC' ).
    lo_primitive_property->set_edm_name( 'FshGridCondRec' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_PSM_PFM_SPLIT' ).
    lo_primitive_property->set_edm_name( 'FshPsmPfmSplit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_PQR_UEPOS' ).
    lo_primitive_property->set_edm_name( 'FshPqrUepos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFM_DIVERSION' ).
    lo_primitive_property->set_edm_name( 'RfmDiversion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFM_SCC_INDICATOR' ).
    lo_primitive_property->set_edm_name( 'RfmSccIndicator' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STPAC' ).
    lo_primitive_property->set_edm_name( 'Stpac' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGBZO' ).
    lo_primitive_property->set_edm_name( 'Lgbzo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGBZO_B' ).
    lo_primitive_property->set_edm_name( 'LgbzoB' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRNUM' ).
    lo_primitive_property->set_edm_name( 'Addrnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONSNUM' ).
    lo_primitive_property->set_edm_name( 'Consnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BORGR_MISS' ).
    lo_primitive_property->set_edm_name( 'BorgrMiss' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEP_ID' ).
    lo_primitive_property->set_edm_name( 'DepId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BELNR' ).
    lo_primitive_property->set_edm_name( 'Belnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KBLPOS_CAB' ).
    lo_primitive_property->set_edm_name( 'KblposCab' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KBLNR_COMP' ).
    lo_primitive_property->set_edm_name( 'KblnrComp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KBLPOS_COMP' ).
    lo_primitive_property->set_edm_name( 'KblposComp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WBS_ELEMENT' ).
    lo_primitive_property->set_edm_name( 'WbsElement' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFM_PSST_RULE' ).
    lo_primitive_property->set_edm_name( 'RfmPsstRule' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFM_PSST_GROUP' ).
    lo_primitive_property->set_edm_name( 'RfmPsstGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFM_REF_DOC' ).
    lo_primitive_property->set_edm_name( 'RfmRefDoc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFM_REF_ITEM' ).
    lo_primitive_property->set_edm_name( 'RfmRefItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFM_REF_ACTION' ).
    lo_primitive_property->set_edm_name( 'RfmRefAction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFM_REF_SLITEM' ).
    lo_primitive_property->set_edm_name( 'RfmRefSlitem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REF_ITEM' ).
    lo_primitive_property->set_edm_name( 'RefItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SOURCE_ID' ).
    lo_primitive_property->set_edm_name( 'SourceId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SOURCE_KEY' ).
    lo_primitive_property->set_edm_name( 'SourceKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUT_BACK' ).
    lo_primitive_property->set_edm_name( 'PutBack' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POL_ID' ).
    lo_primitive_property->set_edm_name( 'PolId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONS_ORDER' ).
    lo_primitive_property->set_edm_name( 'ConsOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_eslltype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_ESLLTYPE'
                                    is_structure              = VALUE tys_z_i_eslltype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_ESLLType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_ESLL' ).
    lo_entity_set->set_edm_name( 'Z_I_ESLL' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PACKNO' ).
    lo_primitive_property->set_edm_name( 'Packno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTROW' ).
    lo_primitive_property->set_edm_name( 'Introw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTROW' ).
    lo_primitive_property->set_edm_name( 'Extrow' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEL' ).
    lo_primitive_property->set_edm_name( 'Del' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SRVPOS' ).
    lo_primitive_property->set_edm_name( 'Srvpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RANG' ).
    lo_primitive_property->set_edm_name( 'Rang' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Byte' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTGROUP' ).
    lo_primitive_property->set_edm_name( 'Extgroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PACKAGE_2' ).
    lo_primitive_property->set_edm_name( 'Package2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUB_PACKNO' ).
    lo_primitive_property->set_edm_name( 'SubPackno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LBNUM' ).
    lo_primitive_property->set_edm_name( 'Lbnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUSGB' ).
    lo_primitive_property->set_edm_name( 'Ausgb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STLVPOS' ).
    lo_primitive_property->set_edm_name( 'Stlvpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTSRVNO' ).
    lo_primitive_property->set_edm_name( 'Extsrvno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MENGE' ).
    lo_primitive_property->set_edm_name( 'Menge' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEINS' ).
    lo_primitive_property->set_edm_name( 'Meins' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UEBTO' ).
    lo_primitive_property->set_edm_name( 'Uebto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UEBTK' ).
    lo_primitive_property->set_edm_name( 'Uebtk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WITH_LIM' ).
    lo_primitive_property->set_edm_name( 'WithLim' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPINF' ).
    lo_primitive_property->set_edm_name( 'Spinf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PEINH' ).
    lo_primitive_property->set_edm_name( 'Peinh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRTWR' ).
    lo_primitive_property->set_edm_name( 'Brtwr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETWR' ).
    lo_primitive_property->set_edm_name( 'Netwr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FROMPOS' ).
    lo_primitive_property->set_edm_name( 'Frompos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOPOS' ).
    lo_primitive_property->set_edm_name( 'Topos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KTEXT_1' ).
    lo_primitive_property->set_edm_name( 'Ktext1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VRTKZ' ).
    lo_primitive_property->set_edm_name( 'Vrtkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TWRKZ' ).
    lo_primitive_property->set_edm_name( 'Twrkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERNR' ).
    lo_primitive_property->set_edm_name( 'Pernr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MOLGA' ).
    lo_primitive_property->set_edm_name( 'Molga' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGART' ).
    lo_primitive_property->set_edm_name( 'Lgart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGTXT' ).
    lo_primitive_property->set_edm_name( 'Lgtxt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STELL' ).
    lo_primitive_property->set_edm_name( 'Stell' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IFTNR' ).
    lo_primitive_property->set_edm_name( 'Iftnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDAT' ).
    lo_primitive_property->set_edm_name( 'Budat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INSDT' ).
    lo_primitive_property->set_edm_name( 'Insdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLN_PACKNO' ).
    lo_primitive_property->set_edm_name( 'PlnPackno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLN_INTROW' ).
    lo_primitive_property->set_edm_name( 'PlnIntrow' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNT_PACKNO' ).
    lo_primitive_property->set_edm_name( 'KntPackno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNT_INTROW' ).
    lo_primitive_property->set_edm_name( 'KntIntrow' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TMP_PACKNO' ).
    lo_primitive_property->set_edm_name( 'TmpPackno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TMP_INTROW' ).
    lo_primitive_property->set_edm_name( 'TmpIntrow' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STLV_LIM' ).
    lo_primitive_property->set_edm_name( 'StlvLim' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIMIT_ROW' ).
    lo_primitive_property->set_edm_name( 'LimitRow' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACT_MENGE' ).
    lo_primitive_property->set_edm_name( 'ActMenge' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACT_WERT' ).
    lo_primitive_property->set_edm_name( 'ActWert' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNT_WERT' ).
    lo_primitive_property->set_edm_name( 'KntWert' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNT_MENGE' ).
    lo_primitive_property->set_edm_name( 'KntMenge' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZIELWERT' ).
    lo_primitive_property->set_edm_name( 'Zielwert' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNG_WERT' ).
    lo_primitive_property->set_edm_name( 'UngWert' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNG_MENGE' ).
    lo_primitive_property->set_edm_name( 'UngMenge' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALT_INTROW' ).
    lo_primitive_property->set_edm_name( 'AltIntrow' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BASIC' ).
    lo_primitive_property->set_edm_name( 'Basic' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALTERNAT' ).
    lo_primitive_property->set_edm_name( 'Alternat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BIDDER' ).
    lo_primitive_property->set_edm_name( 'Bidder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLE' ).
    lo_primitive_property->set_edm_name( 'Supple' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FREEQTY' ).
    lo_primitive_property->set_edm_name( 'Freeqty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INFORM' ).
    lo_primitive_property->set_edm_name( 'Inform' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAUSCH' ).
    lo_primitive_property->set_edm_name( 'Pausch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EVENTUAL' ).
    lo_primitive_property->set_edm_name( 'Eventual' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MWSKZ' ).
    lo_primitive_property->set_edm_name( 'Mwskz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXJCD' ).
    lo_primitive_property->set_edm_name( 'Txjcd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXDAT' ).
    lo_primitive_property->set_edm_name( 'Txdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRS_CHG' ).
    lo_primitive_property->set_edm_name( 'PrsChg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATKL' ).
    lo_primitive_property->set_edm_name( 'Matkl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TBTWR' ).
    lo_primitive_property->set_edm_name( 'Tbtwr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAVNW' ).
    lo_primitive_property->set_edm_name( 'Navnw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BASWR' ).
    lo_primitive_property->set_edm_name( 'Baswr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KKNUMV' ).
    lo_primitive_property->set_edm_name( 'Kknumv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IWEIN' ).
    lo_primitive_property->set_edm_name( 'Iwein' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INT_WORK' ).
    lo_primitive_property->set_edm_name( 'IntWork' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTERNALID' ).
    lo_primitive_property->set_edm_name( 'Externalid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KSTAR' ).
    lo_primitive_property->set_edm_name( 'Kstar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACT_WORK' ).
    lo_primitive_property->set_edm_name( 'ActWork' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAPNO' ).
    lo_primitive_property->set_edm_name( 'Mapno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SRVMAPKEY' ).
    lo_primitive_property->set_edm_name( 'Srvmapkey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXTARIFFCODE' ).
    lo_primitive_property->set_edm_name( 'Taxtariffcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDATE' ).
    lo_primitive_property->set_edm_name( 'Sdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BEGTIME' ).
    lo_primitive_property->set_edm_name( 'Begtime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENDTIME' ).
    lo_primitive_property->set_edm_name( 'Endtime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERSEXT' ).
    lo_primitive_property->set_edm_name( 'Persext' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CATSCOUNTE' ).
    lo_primitive_property->set_edm_name( 'Catscounte' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STOKZ' ).
    lo_primitive_property->set_edm_name( 'Stokz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BELNR' ).
    lo_primitive_property->set_edm_name( 'Belnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FORMELNR' ).
    lo_primitive_property->set_edm_name( 'Formelnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRMVAL_1' ).
    lo_primitive_property->set_edm_name( 'Frmval1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRMVAL_2' ).
    lo_primitive_property->set_edm_name( 'Frmval2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRMVAL_3' ).
    lo_primitive_property->set_edm_name( 'Frmval3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRMVAL_4' ).
    lo_primitive_property->set_edm_name( 'Frmval4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRMVAL_5' ).
    lo_primitive_property->set_edm_name( 'Frmval5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'USERF_1_NUM' ).
    lo_primitive_property->set_edm_name( 'Userf1Num' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'USERF_2_NUM' ).
    lo_primitive_property->set_edm_name( 'Userf2Num' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'USERF_1_TXT' ).
    lo_primitive_property->set_edm_name( 'Userf1Txt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'USERF_2_TXT' ).
    lo_primitive_property->set_edm_name( 'Userf2Txt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNOBJ' ).
    lo_primitive_property->set_edm_name( 'Knobj' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHGTEXT' ).
    lo_primitive_property->set_edm_name( 'Chgtext' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KALNR' ).
    lo_primitive_property->set_edm_name( 'Kalnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KLVAR' ).
    lo_primitive_property->set_edm_name( 'Klvar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTDES' ).
    lo_primitive_property->set_edm_name( 'Extdes' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOSINTER' ).
    lo_primitive_property->set_edm_name( 'Bosinter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOSGRP' ).
    lo_primitive_property->set_edm_name( 'Bosgrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOS_RISK' ).
    lo_primitive_property->set_edm_name( 'BosRisk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOS_ECP' ).
    lo_primitive_property->set_edm_name( 'BosEcp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHGLTEXT' ).
    lo_primitive_property->set_edm_name( 'Chgltext' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOSGRUPPENR' ).
    lo_primitive_property->set_edm_name( 'Bosgruppenr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOSLFDNR' ).
    lo_primitive_property->set_edm_name( 'Boslfdnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOSDRUKZ' ).
    lo_primitive_property->set_edm_name( 'Bosdrukz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOSSUPPLENO' ).
    lo_primitive_property->set_edm_name( 'Bossuppleno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOSSUPPLESTATUS' ).
    lo_primitive_property->set_edm_name( 'Bossupplestatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XSAPBOQXOBJTYPE' ).
    lo_primitive_property->set_edm_name( 'xsapboqxobjtype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XSAPBOQXSPOSNR' ).
    lo_primitive_property->set_edm_name( 'xsapboqxsposnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XSAPBOQXMINTROW' ).
    lo_primitive_property->set_edm_name( 'xsapboqxmintrow' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XSAPBOQXQT_REL' ).
    lo_primitive_property->set_edm_name( 'xsapboqxqtRel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XSAPBOQXCK_QTY' ).
    lo_primitive_property->set_edm_name( 'xsapboqxckQty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XSAPBOQXM_FRATE' ).
    lo_primitive_property->set_edm_name( 'xsapboqxmFrate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTREFKEY' ).
    lo_primitive_property->set_edm_name( 'Extrefkey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INV_MENGE' ).
    lo_primitive_property->set_edm_name( 'InvMenge' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATAAGING' ).
    lo_primitive_property->set_edm_name( 'Dataaging' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PER_SDATE' ).
    lo_primitive_property->set_edm_name( 'PerSdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PER_EDATE' ).
    lo_primitive_property->set_edm_name( 'PerEdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_z_i_lfm_1_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_LFM_1_TYPE'
                                    is_structure              = VALUE tys_z_i_lfm_1_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_LFM1Type' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_LFM_1' ).
    lo_entity_set->set_edm_name( 'Z_I_LFM1' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFNR' ).
    lo_primitive_property->set_edm_name( 'Lifnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EKORG' ).
    lo_primitive_property->set_edm_name( 'Ekorg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERDAT' ).
    lo_primitive_property->set_edm_name( 'Erdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERNAM' ).
    lo_primitive_property->set_edm_name( 'Ernam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPERM' ).
    lo_primitive_property->set_edm_name( 'Sperm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOEVM' ).
    lo_primitive_property->set_edm_name( 'Loevm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFABC' ).
    lo_primitive_property->set_edm_name( 'Lfabc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAERS' ).
    lo_primitive_property->set_edm_name( 'Waers' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VERKF' ).
    lo_primitive_property->set_edm_name( 'Verkf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TELF_1' ).
    lo_primitive_property->set_edm_name( 'Telf1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MINBW' ).
    lo_primitive_property->set_edm_name( 'Minbw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZTERM' ).
    lo_primitive_property->set_edm_name( 'Zterm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_1' ).
    lo_primitive_property->set_edm_name( 'Inco1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_2' ).
    lo_primitive_property->set_edm_name( 'Inco2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 28 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEBRE' ).
    lo_primitive_property->set_edm_name( 'Webre' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZABS' ).
    lo_primitive_property->set_edm_name( 'Kzabs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KALSK' ).
    lo_primitive_property->set_edm_name( 'Kalsk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZAUT' ).
    lo_primitive_property->set_edm_name( 'Kzaut' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXPVZ' ).
    lo_primitive_property->set_edm_name( 'Expvz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZOLLA' ).
    lo_primitive_property->set_edm_name( 'Zolla' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEPRF' ).
    lo_primitive_property->set_edm_name( 'Meprf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EKGRP' ).
    lo_primitive_property->set_edm_name( 'Ekgrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XERSY' ).
    lo_primitive_property->set_edm_name( 'Xersy' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLIFZ' ).
    lo_primitive_property->set_edm_name( 'Plifz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MRPPP' ).
    lo_primitive_property->set_edm_name( 'Mrppp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFRHY' ).
    lo_primitive_property->set_edm_name( 'Lfrhy' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIBES' ).
    lo_primitive_property->set_edm_name( 'Libes' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIPRE' ).
    lo_primitive_property->set_edm_name( 'Lipre' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LISER' ).
    lo_primitive_property->set_edm_name( 'Liser' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOV' ).
    lo_primitive_property->set_edm_name( 'Incov' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_2_L' ).
    lo_primitive_property->set_edm_name( 'Inco2L' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_3_L' ).
    lo_primitive_property->set_edm_name( 'Inco3L' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEORA' ).
    lo_primitive_property->set_edm_name( 'Weora' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRFRE' ).
    lo_primitive_property->set_edm_name( 'Prfre' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NRGEW' ).
    lo_primitive_property->set_edm_name( 'Nrgew' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOIND' ).
    lo_primitive_property->set_edm_name( 'Boind' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLIND' ).
    lo_primitive_property->set_edm_name( 'Blind' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZRET' ).
    lo_primitive_property->set_edm_name( 'Kzret' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SKRIT' ).
    lo_primitive_property->set_edm_name( 'Skrit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BSTAE' ).
    lo_primitive_property->set_edm_name( 'Bstae' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RDPRF' ).
    lo_primitive_property->set_edm_name( 'Rdprf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEGRU' ).
    lo_primitive_property->set_edm_name( 'Megru' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VENSL' ).
    lo_primitive_property->set_edm_name( 'Vensl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOPNR' ).
    lo_primitive_property->set_edm_name( 'Bopnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XERSR' ).
    lo_primitive_property->set_edm_name( 'Xersr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EIKTO' ).
    lo_primitive_property->set_edm_name( 'Eikto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABUEB' ).
    lo_primitive_property->set_edm_name( 'Abueb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAPRF' ).
    lo_primitive_property->set_edm_name( 'Paprf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AGREL' ).
    lo_primitive_property->set_edm_name( 'Agrel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XNBWY' ).
    lo_primitive_property->set_edm_name( 'Xnbwy' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSBED' ).
    lo_primitive_property->set_edm_name( 'Vsbed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LEBRE' ).
    lo_primitive_property->set_edm_name( 'Lebre' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOLRE' ).
    lo_primitive_property->set_edm_name( 'Bolre' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMSAE' ).
    lo_primitive_property->set_edm_name( 'Umsae' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VENDOR_RMA_REQ' ).
    lo_primitive_property->set_edm_name( 'VendorRmaReq' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFM_1_EEW_PS' ).
    lo_primitive_property->set_edm_name( 'Lfm1EewPs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_NBOESL' ).
    lo_primitive_property->set_edm_name( 'J1nboesl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUBEL' ).
    lo_primitive_property->set_edm_name( 'Aubel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALID_PRO' ).
    lo_primitive_property->set_edm_name( 'ValidPro' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HSCPE' ).
    lo_primitive_property->set_edm_name( 'Hscpe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_SC_CID' ).
    lo_primitive_property->set_edm_name( 'FshScCid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_VAS_DETC' ).
    lo_primitive_property->set_edm_name( 'FshVasDetc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPPRS' ).
    lo_primitive_property->set_edm_name( 'Upprs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACTIVITY_PROFIL' ).
    lo_primitive_property->set_edm_name( 'ActivityProfil' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STAGING_TIME' ).
    lo_primitive_property->set_edm_name( 'StagingTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_t_001_wtype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_T_001_WTYPE'
                                    is_structure              = VALUE tys_z_i_t_001_wtype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_T001WType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_T_001_W' ).
    lo_entity_set->set_edm_name( 'Z_I_T001W' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'WERKS' ).
    lo_primitive_property->set_edm_name( 'Werks' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_1' ).
    lo_primitive_property->set_edm_name( 'Name1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BWKEY' ).
    lo_primitive_property->set_edm_name( 'Bwkey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUNNR' ).
    lo_primitive_property->set_edm_name( 'Kunnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFNR' ).
    lo_primitive_property->set_edm_name( 'Lifnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FABKL' ).
    lo_primitive_property->set_edm_name( 'Fabkl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_2' ).
    lo_primitive_property->set_edm_name( 'Name2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STRAS' ).
    lo_primitive_property->set_edm_name( 'Stras' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PFACH' ).
    lo_primitive_property->set_edm_name( 'Pfach' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSTLZ' ).
    lo_primitive_property->set_edm_name( 'Pstlz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORT_01' ).
    lo_primitive_property->set_edm_name( 'Ort01' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EKORG' ).
    lo_primitive_property->set_edm_name( 'Ekorg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VKORG' ).
    lo_primitive_property->set_edm_name( 'Vkorg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHAZV' ).
    lo_primitive_property->set_edm_name( 'Chazv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KKOWK' ).
    lo_primitive_property->set_edm_name( 'Kkowk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KORDB' ).
    lo_primitive_property->set_edm_name( 'Kordb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BEDPL' ).
    lo_primitive_property->set_edm_name( 'Bedpl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAND_1' ).
    lo_primitive_property->set_edm_name( 'Land1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REGIO' ).
    lo_primitive_property->set_edm_name( 'Regio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNC' ).
    lo_primitive_property->set_edm_name( 'Counc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CITYC' ).
    lo_primitive_property->set_edm_name( 'Cityc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADRNR' ).
    lo_primitive_property->set_edm_name( 'Adrnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IWERK' ).
    lo_primitive_property->set_edm_name( 'Iwerk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXJCD' ).
    lo_primitive_property->set_edm_name( 'Txjcd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VTWEG' ).
    lo_primitive_property->set_edm_name( 'Vtweg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPART' ).
    lo_primitive_property->set_edm_name( 'Spart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPRAS' ).
    lo_primitive_property->set_edm_name( 'Spras' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WKSOP' ).
    lo_primitive_property->set_edm_name( 'Wksop' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AWSLS' ).
    lo_primitive_property->set_edm_name( 'Awsls' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHAZV_OLD' ).
    lo_primitive_property->set_edm_name( 'ChazvOld' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VLFKZ' ).
    lo_primitive_property->set_edm_name( 'Vlfkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BZIRK' ).
    lo_primitive_property->set_edm_name( 'Bzirk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZONE_1' ).
    lo_primitive_property->set_edm_name( 'Zone1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXIW' ).
    lo_primitive_property->set_edm_name( 'Taxiw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BZQHL' ).
    lo_primitive_property->set_edm_name( 'Bzqhl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LET_01' ).
    lo_primitive_property->set_edm_name( 'Let01' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LET_02' ).
    lo_primitive_property->set_edm_name( 'Let02' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LET_03' ).
    lo_primitive_property->set_edm_name( 'Let03' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXNAM_MA_1' ).
    lo_primitive_property->set_edm_name( 'TxnamMa1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXNAM_MA_2' ).
    lo_primitive_property->set_edm_name( 'TxnamMa2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXNAM_MA_3' ).
    lo_primitive_property->set_edm_name( 'TxnamMa3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BETOL' ).
    lo_primitive_property->set_edm_name( 'Betol' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_BBRANCH' ).
    lo_primitive_property->set_edm_name( 'J1bbranch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VTBFI' ).
    lo_primitive_property->set_edm_name( 'Vtbfi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FPRFW' ).
    lo_primitive_property->set_edm_name( 'Fprfw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACHVM' ).
    lo_primitive_property->set_edm_name( 'Achvm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DVSART' ).
    lo_primitive_property->set_edm_name( 'Dvsart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NODETYPE' ).
    lo_primitive_property->set_edm_name( 'Nodetype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NSCHEMA' ).
    lo_primitive_property->set_edm_name( 'Nschema' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PKOSA' ).
    lo_primitive_property->set_edm_name( 'Pkosa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MISCH' ).
    lo_primitive_property->set_edm_name( 'Misch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MGVUPD' ).
    lo_primitive_property->set_edm_name( 'Mgvupd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSTEL' ).
    lo_primitive_property->set_edm_name( 'Vstel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MGVLAUPD' ).
    lo_primitive_property->set_edm_name( 'Mgvlaupd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MGVLAREVAL' ).
    lo_primitive_property->set_edm_name( 'Mgvlareval' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SOURCING' ).
    lo_primitive_property->set_edm_name( 'Sourcing' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NO_DEFAULT_BATCH_MANAGEMEN' ).
    lo_primitive_property->set_edm_name( 'NoDefaultBatchManagement' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_MG_ARUN_REQ' ).
    lo_primitive_property->set_edm_name( 'FshMgArunReq' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_SEAIM' ).
    lo_primitive_property->set_edm_name( 'FshSeaim' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_BOM_MAINTENANCE' ).
    lo_primitive_property->set_edm_name( 'FshBomMaintenance' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_GROUP_PR' ).
    lo_primitive_property->set_edm_name( 'FshGroupPr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARUN_FIX_BATCH' ).
    lo_primitive_property->set_edm_name( 'ArunFixBatch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OILIVAL' ).
    lo_primitive_property->set_edm_name( 'Oilival' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OIHVTYPE' ).
    lo_primitive_property->set_edm_name( 'Oihvtype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OIHCREDIPI' ).
    lo_primitive_property->set_edm_name( 'Oihcredipi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STORETYPE' ).
    lo_primitive_property->set_edm_name( 'Storetype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEP_STORE' ).
    lo_primitive_property->set_edm_name( 'DepStore' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_t_024_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_T_024_TYPE'
                                    is_structure              = VALUE tys_z_i_t_024_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_T024Type' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_T_024' ).
    lo_entity_set->set_edm_name( 'Z_I_T024' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'EKGRP' ).
    lo_primitive_property->set_edm_name( 'Ekgrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EKNAM' ).
    lo_primitive_property->set_edm_name( 'Eknam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EKTEL' ).
    lo_primitive_property->set_edm_name( 'Ektel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LDEST' ).
    lo_primitive_property->set_edm_name( 'Ldest' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TELFX' ).
    lo_primitive_property->set_edm_name( 'Telfx' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEL_NUMBER' ).
    lo_primitive_property->set_edm_name( 'TelNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEL_EXTENS' ).
    lo_primitive_property->set_edm_name( 'TelExtens' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SMTP_ADDR' ).
    lo_primitive_property->set_edm_name( 'SmtpAddr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 241 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_t_163_y_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_T_163_Y_TYPE'
                                    is_structure              = VALUE tys_z_i_t_163_y_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'z_i_t163yType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_T_163_Y' ).
    lo_entity_set->set_edm_name( 'z_i_t163y' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPRAS' ).
    lo_primitive_property->set_edm_name( 'Spras' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSTYP' ).
    lo_primitive_property->set_edm_name( 'Pstyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PTEXT' ).
    lo_primitive_property->set_edm_name( 'Ptext' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EPSTP' ).
    lo_primitive_property->set_edm_name( 'Epstp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.
ENDCLASS.
