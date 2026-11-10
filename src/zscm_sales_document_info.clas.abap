"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>cds_zsd_sales_document_info</em>
CLASS zscm_sales_document_info DEFINITION
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
      "! <p class="shorttext synchronized">Z_I_KNA1Type</p>
      BEGIN OF tys_z_i_kna_1_type,
        "! <em>Key property</em> Kunnr
        kunnr               TYPE c LENGTH 10,
        "! Land1
        land_1              TYPE c LENGTH 3,
        "! Name1
        name_1              TYPE c LENGTH 35,
        "! Name2
        name_2              TYPE c LENGTH 35,
        "! Ort01
        ort_01              TYPE c LENGTH 35,
        "! Pstlz
        pstlz               TYPE c LENGTH 10,
        "! Regio
        regio               TYPE c LENGTH 3,
        "! Sortl
        sortl               TYPE c LENGTH 10,
        "! Stras
        stras               TYPE c LENGTH 35,
        "! Telf1
        telf_1              TYPE c LENGTH 16,
        "! Telfx
        telfx               TYPE c LENGTH 31,
        "! Xcpdk
        xcpdk               TYPE abap_bool,
        "! Adrnr
        adrnr               TYPE c LENGTH 10,
        "! Mcod1
        mcod_1              TYPE c LENGTH 25,
        "! Mcod2
        mcod_2              TYPE c LENGTH 25,
        "! Mcod3
        mcod_3              TYPE c LENGTH 25,
        "! Anred
        anred               TYPE c LENGTH 15,
        "! Aufsd
        aufsd               TYPE c LENGTH 2,
        "! Bahne
        bahne               TYPE c LENGTH 25,
        "! Bahns
        bahns               TYPE c LENGTH 25,
        "! Bbbnr
        bbbnr               TYPE c LENGTH 7,
        "! Bbsnr
        bbsnr               TYPE c LENGTH 5,
        "! Begru
        begru               TYPE c LENGTH 4,
        "! Brsch
        brsch               TYPE c LENGTH 4,
        "! Bubkz
        bubkz               TYPE c LENGTH 1,
        "! Datlt
        datlt               TYPE c LENGTH 14,
        "! Erdat
        erdat               TYPE datn,
        "! Ernam
        ernam               TYPE c LENGTH 12,
        "! Exabl
        exabl               TYPE abap_bool,
        "! Faksd
        faksd               TYPE c LENGTH 2,
        "! Fiskn
        fiskn               TYPE c LENGTH 10,
        "! Knazk
        knazk               TYPE c LENGTH 2,
        "! Knrza
        knrza               TYPE c LENGTH 10,
        "! Konzs
        konzs               TYPE c LENGTH 10,
        "! Ktokd
        ktokd               TYPE c LENGTH 4,
        "! Kukla
        kukla               TYPE c LENGTH 2,
        "! Lifnr
        lifnr               TYPE c LENGTH 10,
        "! Lifsd
        lifsd               TYPE c LENGTH 2,
        "! Locco
        locco               TYPE c LENGTH 10,
        "! Loevm
        loevm               TYPE abap_bool,
        "! Name3
        name_3              TYPE c LENGTH 35,
        "! Name4
        name_4              TYPE c LENGTH 35,
        "! Niels
        niels               TYPE c LENGTH 2,
        "! Ort02
        ort_02              TYPE c LENGTH 35,
        "! Pfach
        pfach               TYPE c LENGTH 10,
        "! Pstl2
        pstl_2              TYPE c LENGTH 10,
        "! Counc
        counc               TYPE c LENGTH 3,
        "! Cityc
        cityc               TYPE c LENGTH 4,
        "! Rpmkr
        rpmkr               TYPE c LENGTH 5,
        "! Sperr
        sperr               TYPE abap_bool,
        "! Spras
        spras               TYPE c LENGTH 2,
        "! Stcd1
        stcd_1              TYPE c LENGTH 16,
        "! Stcd2
        stcd_2              TYPE c LENGTH 11,
        "! Stkza
        stkza               TYPE c LENGTH 1,
        "! Stkzu
        stkzu               TYPE abap_bool,
        "! Telbx
        telbx               TYPE c LENGTH 15,
        "! Telf2
        telf_2              TYPE c LENGTH 16,
        "! Teltx
        teltx               TYPE c LENGTH 30,
        "! Telx1
        telx_1              TYPE c LENGTH 30,
        "! Lzone
        lzone               TYPE c LENGTH 10,
        "! Xzemp
        xzemp               TYPE abap_bool,
        "! Vbund
        vbund               TYPE c LENGTH 6,
        "! Stceg
        stceg               TYPE c LENGTH 20,
        "! Dear1
        dear_1              TYPE abap_bool,
        "! Dear2
        dear_2              TYPE abap_bool,
        "! Dear3
        dear_3              TYPE c LENGTH 1,
        "! Dear4
        dear_4              TYPE abap_bool,
        "! Dear5
        dear_5              TYPE abap_bool,
        "! Gform
        gform               TYPE c LENGTH 2,
        "! Bran1
        bran_1              TYPE c LENGTH 10,
        "! Bran2
        bran_2              TYPE c LENGTH 10,
        "! Bran3
        bran_3              TYPE c LENGTH 10,
        "! Bran4
        bran_4              TYPE c LENGTH 10,
        "! Bran5
        bran_5              TYPE c LENGTH 10,
        "! Ekont
        ekont               TYPE c LENGTH 10,
        "! Umjah
        umjah               TYPE c LENGTH 4,
        "! Uwaer
        uwaer               TYPE c LENGTH 5,
        "! Jmzah
        jmzah               TYPE c LENGTH 6,
        "! Jmjah
        jmjah               TYPE c LENGTH 4,
        "! Katr1
        katr_1              TYPE c LENGTH 2,
        "! Katr2
        katr_2              TYPE c LENGTH 2,
        "! Katr3
        katr_3              TYPE c LENGTH 2,
        "! Katr4
        katr_4              TYPE c LENGTH 2,
        "! Katr5
        katr_5              TYPE c LENGTH 2,
        "! Katr6
        katr_6              TYPE c LENGTH 3,
        "! Katr7
        katr_7              TYPE c LENGTH 3,
        "! Katr8
        katr_8              TYPE c LENGTH 3,
        "! Katr9
        katr_9              TYPE c LENGTH 3,
        "! Katr10
        katr_10             TYPE c LENGTH 3,
        "! Stkzn
        stkzn               TYPE c LENGTH 1,
        "! Txjcd
        txjcd               TYPE c LENGTH 15,
        "! Periv
        periv               TYPE c LENGTH 2,
        "! Abrvw
        abrvw               TYPE c LENGTH 3,
        "! Inspbydebi
        inspbydebi          TYPE c LENGTH 1,
        "! Inspatdebi
        inspatdebi          TYPE c LENGTH 1,
        "! Ktocd
        ktocd               TYPE c LENGTH 4,
        "! Pfort
        pfort               TYPE c LENGTH 35,
        "! Werks
        werks               TYPE c LENGTH 4,
        "! Dtams
        dtams               TYPE c LENGTH 1,
        "! Dtaws
        dtaws               TYPE c LENGTH 2,
        "! Duefl
        duefl               TYPE c LENGTH 1,
        "! Hzuor
        hzuor               TYPE c LENGTH 2,
        "! Sperz
        sperz               TYPE abap_bool,
        "! Etikg
        etikg               TYPE c LENGTH 10,
        "! Civve
        civve               TYPE abap_bool,
        "! Milve
        milve               TYPE abap_bool,
        "! Kdkg1
        kdkg_1              TYPE c LENGTH 2,
        "! Kdkg2
        kdkg_2              TYPE c LENGTH 2,
        "! Kdkg3
        kdkg_3              TYPE c LENGTH 2,
        "! Kdkg4
        kdkg_4              TYPE c LENGTH 2,
        "! Kdkg5
        kdkg_5              TYPE c LENGTH 2,
        "! Xknza
        xknza               TYPE abap_bool,
        "! Fityp
        fityp               TYPE c LENGTH 2,
        "! Stcdt
        stcdt               TYPE c LENGTH 2,
        "! Stcd3
        stcd_3              TYPE c LENGTH 18,
        "! Stcd4
        stcd_4              TYPE c LENGTH 18,
        "! Stcd5
        stcd_5              TYPE c LENGTH 60,
        "! Stcd6
        stcd_6              TYPE c LENGTH 20,
        "! Xicms
        xicms               TYPE abap_bool,
        "! Xxipi
        xxipi               TYPE abap_bool,
        "! Xsubt
        xsubt               TYPE c LENGTH 3,
        "! Cfopc
        cfopc               TYPE c LENGTH 2,
        "! Txlw1
        txlw_1              TYPE c LENGTH 3,
        "! Txlw2
        txlw_2              TYPE c LENGTH 3,
        "! Ccc01
        ccc_01              TYPE abap_bool,
        "! Ccc02
        ccc_02              TYPE abap_bool,
        "! Ccc03
        ccc_03              TYPE abap_bool,
        "! Ccc04
        ccc_04              TYPE abap_bool,
        "! BondedAreaConfirm
        bonded_area_confirm TYPE c LENGTH 1,
        "! DonateMark
        donate_mark         TYPE c LENGTH 1,
        "! ConsolidateInvoice
        consolidate_invoice TYPE c LENGTH 1,
        "! AllowanceType
        allowance_type      TYPE c LENGTH 1,
        "! EinvoiceMode
        einvoice_mode       TYPE c LENGTH 1,
        "! B2cIndicator
        b_2_c_indicator     TYPE abap_bool,
        "! Cassd
        cassd               TYPE c LENGTH 2,
        "! Knurl
        knurl               TYPE c LENGTH 132,
        "! J1kfrepre
        j_1_kfrepre         TYPE c LENGTH 10,
        "! J1kftbus
        j_1_kftbus          TYPE c LENGTH 30,
        "! J1kftind
        j_1_kftind          TYPE c LENGTH 30,
        "! Confs
        confs               TYPE c LENGTH 1,
        "! Updat
        updat               TYPE datn,
        "! Uptim
        uptim               TYPE timn,
        "! Nodel
        nodel               TYPE abap_bool,
        "! Dear6
        dear_6              TYPE abap_bool,
        "! DeliveryDateRule
        delivery_date_rule  TYPE c LENGTH 1,
        "! CvpXblck
        cvp_xblck           TYPE c LENGTH 1,
        "! Suframa
        suframa             TYPE c LENGTH 9,
        "! Rg
        rg                  TYPE c LENGTH 11,
        "! Exp
        exp                 TYPE c LENGTH 3,
        "! Uf
        uf                  TYPE c LENGTH 2,
        "! Rgdate
        rgdate              TYPE datn,
        "! Ric
        ric                 TYPE c LENGTH 11,
        "! Rne
        rne                 TYPE c LENGTH 10,
        "! Rnedate
        rnedate             TYPE datn,
        "! Cnae
        cnae                TYPE c LENGTH 7,
        "! Legalnat
        legalnat            TYPE c LENGTH 4,
        "! Crtn
        crtn                TYPE c LENGTH 1,
        "! Icmstaxpay
        icmstaxpay          TYPE c LENGTH 2,
        "! Indtyp
        indtyp              TYPE c LENGTH 2,
        "! Tdt
        tdt                 TYPE c LENGTH 2,
        "! Comsize
        comsize             TYPE c LENGTH 2,
        "! Decregpc
        decregpc            TYPE c LENGTH 2,
        "! PhBizStyle
        ph_biz_style        TYPE c LENGTH 140,
        "! Paytrsn
        paytrsn             TYPE c LENGTH 4,
        "! Kna1EewCust
        kna_1_eew_cust      TYPE c LENGTH 1,
        "! RuleExclusion
        rule_exclusion      TYPE abap_bool,
        "! Kna1AddrEewCust
        kna_1_addr_eew_cust TYPE c LENGTH 1,
        "! xvsoxrPalUl
        xvsoxr_pal_ul       TYPE c LENGTH 3,
        "! xvsoxrPkMat
        xvsoxr_pk_mat       TYPE c LENGTH 1,
        "! xvsoxrMatpal
        xvsoxr_matpal       TYPE c LENGTH 18,
        "! xvsoxrINoLyr
        xvsoxr_ino_lyr      TYPE c LENGTH 2,
        "! xvsoxrOneMat
        xvsoxr_one_mat      TYPE c LENGTH 1,
        "! xvsoxrOneSort
        xvsoxr_one_sort     TYPE c LENGTH 1,
        "! xvsoxrUldSide
        xvsoxr_uld_side     TYPE c LENGTH 1,
        "! xvsoxrLoadPref
        xvsoxr_load_pref    TYPE c LENGTH 1,
        "! xvsoxrDpoint
        xvsoxr_dpoint       TYPE c LENGTH 10,
        "! Alc
        alc                 TYPE c LENGTH 8,
        "! PmtOffice
        pmt_office          TYPE c LENGTH 5,
        "! FeeSchedule
        fee_schedule        TYPE c LENGTH 4,
        "! Duns
        duns                TYPE c LENGTH 9,
        "! Duns4
        duns_4              TYPE c LENGTH 4,
        "! SamUeId
        sam_ue_id           TYPE c LENGTH 12,
        "! SamEftInd
        sam_eft_ind         TYPE c LENGTH 4,
        "! Psofg
        psofg               TYPE c LENGTH 10,
        "! Psois
        psois               TYPE c LENGTH 20,
        "! Pson1
        pson_1              TYPE c LENGTH 35,
        "! Pson2
        pson_2              TYPE c LENGTH 35,
        "! Pson3
        pson_3              TYPE c LENGTH 35,
        "! Psovn
        psovn               TYPE c LENGTH 35,
        "! Psotl
        psotl               TYPE c LENGTH 20,
        "! Psohs
        psohs               TYPE c LENGTH 6,
        "! Psost
        psost               TYPE c LENGTH 28,
        "! Psoo1
        psoo_1              TYPE c LENGTH 50,
        "! Psoo2
        psoo_2              TYPE c LENGTH 50,
        "! Psoo3
        psoo_3              TYPE c LENGTH 50,
        "! Psoo4
        psoo_4              TYPE c LENGTH 50,
        "! Psoo5
        psoo_5              TYPE c LENGTH 50,
        "! J1iexcd
        j_1_iexcd           TYPE c LENGTH 40,
        "! J1iexrn
        j_1_iexrn           TYPE c LENGTH 40,
        "! J1iexrg
        j_1_iexrg           TYPE c LENGTH 60,
        "! J1iexdi
        j_1_iexdi           TYPE c LENGTH 60,
        "! J1iexco
        j_1_iexco           TYPE c LENGTH 60,
        "! J1icstno
        j_1_icstno          TYPE c LENGTH 40,
        "! J1ilstno
        j_1_ilstno          TYPE c LENGTH 40,
        "! J1ipanno
        j_1_ipanno          TYPE c LENGTH 40,
        "! J1iexcicu
        j_1_iexcicu         TYPE c LENGTH 1,
        "! Aedat
        aedat               TYPE datn,
        "! Usnam
        usnam               TYPE c LENGTH 12,
        "! J1isern
        j_1_isern           TYPE c LENGTH 40,
        "! J1ipanref
        j_1_ipanref         TYPE c LENGTH 40,
        "! GstTds
        gst_tds             TYPE c LENGTH 18,
        "! J3getyp
        j_3_getyp           TYPE c LENGTH 2,
        "! J3greftyp
        j_3_greftyp         TYPE c LENGTH 2,
        "! Coaufnr
        coaufnr             TYPE c LENGTH 12,
        "! J3gagext
        j_3_gagext          TYPE c LENGTH 10,
        "! J3gagint
        j_3_gagint          TYPE c LENGTH 10,
        "! J3gagdumi
        j_3_gagdumi         TYPE c LENGTH 10,
        "! J3gagstdi
        j_3_gagstdi         TYPE c LENGTH 10,
        "! Lgort
        lgort               TYPE c LENGTH 4,
        "! Kokrs
        kokrs               TYPE c LENGTH 4,
        "! Kostl
        kostl               TYPE c LENGTH 10,
        "! J3gabglg
        j_3_gabglg          TYPE abap_bool,
        "! J3gabgvg
        j_3_gabgvg          TYPE abap_bool,
        "! J3gabrart
        j_3_gabrart         TYPE c LENGTH 1,
        "! J3gstdmon
        j_3_gstdmon         TYPE p LENGTH 3 DECIMALS 2,
        "! J3gstdtag
        j_3_gstdtag         TYPE p LENGTH 3 DECIMALS 2,
        "! J3gtagmon
        j_3_gtagmon         TYPE p LENGTH 3 DECIMALS 2,
        "! J3gzugtag
        j_3_gzugtag         TYPE abap_bool,
        "! J3gmaschb
        j_3_gmaschb         TYPE c LENGTH 1,
        "! J3gmeinsa
        j_3_gmeinsa         TYPE abap_bool,
        "! J3gkeinsa
        j_3_gkeinsa         TYPE abap_bool,
        "! J3gblsper
        j_3_gblsper         TYPE abap_bool,
        "! J3gkleivo
        j_3_gkleivo         TYPE abap_bool,
        "! J3gcalid
        j_3_gcalid          TYPE c LENGTH 2,
        "! J3gvmonat
        j_3_gvmonat         TYPE c LENGTH 1,
        "! J3gabrken
        j_3_gabrken         TYPE c LENGTH 1,
        "! J3glabrech
        j_3_glabrech        TYPE datn,
        "! J3gaabrech
        j_3_gaabrech        TYPE datn,
        "! J3gzutvhlg
        j_3_gzutvhlg        TYPE abap_bool,
        "! J3gnegmen
        j_3_gnegmen         TYPE abap_bool,
        "! J3gfristlo
        j_3_gfristlo        TYPE abap_bool,
        "! J3geminbe
        j_3_geminbe         TYPE c LENGTH 5,
        "! J3gfmgue
        j_3_gfmgue          TYPE c LENGTH 5,
        "! J3gzuschue
        j_3_gzuschue        TYPE c LENGTH 5,
        "! J3gschprs
        j_3_gschprs         TYPE abap_bool,
        "! J3ginvsta
        j_3_ginvsta         TYPE c LENGTH 1,
        "! xsapcemxdber
        xsapcemxdber        TYPE c LENGTH 8,
        "! xsapcemxkvmeq
        xsapcemxkvmeq       TYPE c LENGTH 1,
      END OF tys_z_i_kna_1_type,
      "! <p class="shorttext synchronized">List of Z_I_KNA1Type</p>
      tyt_z_i_kna_1_type TYPE STANDARD TABLE OF tys_z_i_kna_1_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_LIKPType</p>
      BEGIN OF tys_z_i_likptype,
        "! <em>Key property</em> Vbeln
        vbeln                      TYPE c LENGTH 10,
        "! Ernam
        ernam                      TYPE c LENGTH 12,
        "! Erzet
        erzet                      TYPE timn,
        "! Erdat
        erdat                      TYPE datn,
        "! Bzirk
        bzirk                      TYPE c LENGTH 6,
        "! Vstel
        vstel                      TYPE c LENGTH 4,
        "! Vkorg
        vkorg                      TYPE c LENGTH 4,
        "! Lfart
        lfart                      TYPE c LENGTH 4,
        "! Autlf
        autlf                      TYPE abap_bool,
        "! Kzazu
        kzazu                      TYPE abap_bool,
        "! Wadat
        wadat                      TYPE datn,
        "! Lddat
        lddat                      TYPE datn,
        "! Tddat
        tddat                      TYPE datn,
        "! Lfdat
        lfdat                      TYPE datn,
        "! Kodat
        kodat                      TYPE datn,
        "! Ablad
        ablad                      TYPE c LENGTH 25,
        "! Inco1
        inco_1                     TYPE c LENGTH 3,
        "! Inco2
        inco_2                     TYPE c LENGTH 28,
        "! Expkz
        expkz                      TYPE c LENGTH 1,
        "! Route
        route                      TYPE c LENGTH 6,
        "! Faksk
        faksk                      TYPE c LENGTH 2,
        "! Lifsk
        lifsk                      TYPE c LENGTH 2,
        "! Vbtyp
        vbtyp                      TYPE c LENGTH 4,
        "! Knfak
        knfak                      TYPE c LENGTH 2,
        "! Tpqua
        tpqua                      TYPE c LENGTH 1,
        "! Tpgrp
        tpgrp                      TYPE c LENGTH 2,
        "! Lprio
        lprio                      TYPE c LENGTH 2,
        "! Vsbed
        vsbed                      TYPE c LENGTH 2,
        "! Kunnr
        kunnr                      TYPE c LENGTH 10,
        "! Kunag
        kunag                      TYPE c LENGTH 10,
        "! Kdgrp
        kdgrp                      TYPE c LENGTH 2,
        "! Stzkl
        stzkl                      TYPE p LENGTH 2 DECIMALS 2,
        "! Stzzu
        stzzu                      TYPE p LENGTH 2 DECIMALS 0,
        "! Btgew
        btgew                      TYPE p LENGTH 8 DECIMALS 3,
        "! Ntgew
        ntgew                      TYPE p LENGTH 8 DECIMALS 3,
        "! Gewei
        gewei                      TYPE c LENGTH 3,
        "! Volum
        volum                      TYPE p LENGTH 8 DECIMALS 3,
        "! Voleh
        voleh                      TYPE c LENGTH 3,
        "! Anzpk
        anzpk                      TYPE c LENGTH 5,
        "! Berot
        berot                      TYPE c LENGTH 20,
        "! Lfuhr
        lfuhr                      TYPE timn,
        "! Grulg
        grulg                      TYPE c LENGTH 4,
        "! Lstel
        lstel                      TYPE c LENGTH 2,
        "! Tragr
        tragr                      TYPE c LENGTH 4,
        "! Fkarv
        fkarv                      TYPE c LENGTH 4,
        "! Fkdat
        fkdat                      TYPE datn,
        "! Perfk
        perfk                      TYPE c LENGTH 2,
        "! Routa
        routa                      TYPE c LENGTH 6,
        "! Stafo
        stafo                      TYPE c LENGTH 6,
        "! Kalsm
        kalsm                      TYPE c LENGTH 6,
        "! Knumv
        knumv                      TYPE c LENGTH 10,
        "! Waerk
        waerk                      TYPE c LENGTH 5,
        "! Vkbur
        vkbur                      TYPE c LENGTH 4,
        "! Vbeak
        vbeak                      TYPE p LENGTH 4 DECIMALS 2,
        "! Zukrl
        zukrl                      TYPE c LENGTH 40,
        "! Verur
        verur                      TYPE c LENGTH 35,
        "! Commn
        commn                      TYPE c LENGTH 5,
        "! Stwae
        stwae                      TYPE c LENGTH 5,
        "! Exnum
        exnum                      TYPE c LENGTH 10,
        "! Aenam
        aenam                      TYPE c LENGTH 12,
        "! Aedat
        aedat                      TYPE datn,
        "! Lgnum
        lgnum                      TYPE c LENGTH 3,
        "! Lispl
        lispl                      TYPE c LENGTH 1,
        "! Vkoiv
        vkoiv                      TYPE c LENGTH 4,
        "! Vtwiv
        vtwiv                      TYPE c LENGTH 2,
        "! Spaiv
        spaiv                      TYPE c LENGTH 2,
        "! Fkaiv
        fkaiv                      TYPE c LENGTH 4,
        "! Pioiv
        pioiv                      TYPE c LENGTH 2,
        "! Fkdiv
        fkdiv                      TYPE datn,
        "! Kuniv
        kuniv                      TYPE c LENGTH 10,
        "! Kkber
        kkber                      TYPE c LENGTH 4,
        "! Knkli
        knkli                      TYPE c LENGTH 10,
        "! Grupp
        grupp                      TYPE c LENGTH 4,
        "! Sbgrp
        sbgrp                      TYPE c LENGTH 3,
        "! Ctlpc
        ctlpc                      TYPE c LENGTH 3,
        "! Cmwae
        cmwae                      TYPE c LENGTH 5,
        "! Amtbl
        amtbl                      TYPE p LENGTH 8 DECIMALS 3,
        "! Bolnr
        bolnr                      TYPE c LENGTH 35,
        "! Lifnr
        lifnr                      TYPE c LENGTH 10,
        "! Traty
        traty                      TYPE c LENGTH 4,
        "! Traid
        traid                      TYPE c LENGTH 20,
        "! Cmfre
        cmfre                      TYPE datn,
        "! Cmngv
        cmngv                      TYPE datn,
        "! Xabln
        xabln                      TYPE c LENGTH 10,
        "! Bldat
        bldat                      TYPE datn,
        "! WadatIst
        wadat_ist                  TYPE datn,
        "! Trspg
        trspg                      TYPE c LENGTH 2,
        "! Tpsid
        tpsid                      TYPE c LENGTH 5,
        "! Lifex
        lifex                      TYPE c LENGTH 35,
        "! Ternr
        ternr                      TYPE c LENGTH 12,
        "! KalsmCh
        kalsm_ch                   TYPE c LENGTH 6,
        "! Klief
        klief                      TYPE abap_bool,
        "! Kalsp
        kalsp                      TYPE c LENGTH 6,
        "! Knump
        knump                      TYPE c LENGTH 10,
        "! Netwr
        netwr                      TYPE p LENGTH 8 DECIMALS 3,
        "! Aulwe
        aulwe                      TYPE c LENGTH 10,
        "! Werks
        werks                      TYPE c LENGTH 4,
        "! Lcnum
        lcnum                      TYPE c LENGTH 10,
        "! Abssc
        abssc                      TYPE c LENGTH 6,
        "! Kouhr
        kouhr                      TYPE timn,
        "! Tduhr
        tduhr                      TYPE timn,
        "! Lduhr
        lduhr                      TYPE timn,
        "! Wauhr
        wauhr                      TYPE timn,
        "! Lgtor
        lgtor                      TYPE c LENGTH 3,
        "! Lgbzo
        lgbzo                      TYPE c LENGTH 10,
        "! Akwae
        akwae                      TYPE c LENGTH 5,
        "! Akprz
        akprz                      TYPE p LENGTH 3 DECIMALS 2,
        "! Proli
        proli                      TYPE c LENGTH 3,
        "! Xblnr
        xblnr                      TYPE c LENGTH 16,
        "! Handle
        handle                     TYPE sysuuid_x16,
        "! Tsegfl
        tsegfl                     TYPE abap_bool,
        "! Tzonis
        tzonis                     TYPE c LENGTH 6,
        "! Tzonrc
        tzonrc                     TYPE c LENGTH 6,
        "! ContDg
        cont_dg                    TYPE abap_bool,
        "! Verursys
        verursys                   TYPE c LENGTH 10,
        "! Kzwab
        kzwab                      TYPE c LENGTH 1,
        "! Tcode
        tcode                      TYPE c LENGTH 20,
        "! Vsart
        vsart                      TYPE c LENGTH 2,
        "! Trmtyp
        trmtyp                     TYPE c LENGTH 18,
        "! Sdabw
        sdabw                      TYPE c LENGTH 4,
        "! Vbund
        vbund                      TYPE c LENGTH 6,
        "! Xwoff
        xwoff                      TYPE abap_bool,
        "! Dirta
        dirta                      TYPE abap_bool,
        "! Prvbe
        prvbe                      TYPE c LENGTH 10,
        "! Folar
        folar                      TYPE c LENGTH 4,
        "! Podat
        podat                      TYPE datn,
        "! Potim
        potim                      TYPE timn,
        "! Vganz
        vganz                      TYPE int4,
        "! Imwrk
        imwrk                      TYPE abap_bool,
        "! SpeLoekz
        spe_loekz                  TYPE abap_bool,
        "! SpeLocSeq
        spe_loc_seq                TYPE c LENGTH 3,
        "! SpeAccAppSts
        spe_acc_app_sts            TYPE c LENGTH 1,
        "! SpeShpInfSts
        spe_shp_inf_sts            TYPE c LENGTH 1,
        "! SpeRetCanc
        spe_ret_canc               TYPE abap_bool,
        "! SpeWauhrIst
        spe_wauhr_ist              TYPE timn,
        "! SpeWazoneIst
        spe_wazone_ist             TYPE c LENGTH 6,
        "! SpeRevVlstk
        spe_rev_vlstk              TYPE c LENGTH 1,
        "! SpeLeScenario
        spe_le_scenario            TYPE c LENGTH 1,
        "! SpeOrigSys
        spe_orig_sys               TYPE c LENGTH 1,
        "! SpeChngSys
        spe_chng_sys               TYPE c LENGTH 1,
        "! SpeGeoroute
        spe_georoute               TYPE c LENGTH 10,
        "! SpeGeorouteind
        spe_georouteind            TYPE c LENGTH 1,
        "! SpeCarrierInd
        spe_carrier_ind            TYPE c LENGTH 1,
        "! SpeGtsRel
        spe_gts_rel                TYPE c LENGTH 2,
        "! SpeGtsRtCde
        spe_gts_rt_cde             TYPE c LENGTH 10,
        "! SpeRelTmstmp
        spe_rel_tmstmp             TYPE timestamp,
        "! SpeUnitSystem
        spe_unit_system            TYPE c LENGTH 10,
        "! SpeInvBfrGi
        spe_inv_bfr_gi             TYPE c LENGTH 1,
        "! SpeQiStatus
        spe_qi_status              TYPE c LENGTH 1,
        "! SpeRedInd
        spe_red_ind                TYPE c LENGTH 1,
        "! Sakes
        sakes                      TYPE c LENGTH 1,
        "! SpeLifexType
        spe_lifex_type             TYPE c LENGTH 1,
        "! SpeTtype
        spe_ttype                  TYPE c LENGTH 10,
        "! SpeProNumber
        spe_pro_number             TYPE c LENGTH 35,
        "! LocGuid
        loc_guid                   TYPE sysuuid_x16,
        "! SpeBillingInd
        spe_billing_ind            TYPE c LENGTH 1,
        "! PrinterProfile
        printer_profile            TYPE c LENGTH 10,
        "! MsrActive
        msr_active                 TYPE c LENGTH 1,
        "! Prtnr
        prtnr                      TYPE c LENGTH 10,
        "! StgeLocChange
        stge_loc_change            TYPE c LENGTH 1,
        "! TmCtrlKey
        tm_ctrl_key                TYPE c LENGTH 4,
        "! DlvSplitInitia
        dlv_split_initia           TYPE c LENGTH 1,
        "! DlvVersion
        dlv_version                TYPE c LENGTH 4,
        "! Dataaging
        dataaging                  TYPE datn,
        "! GtsVorpa
        gts_vorpa                  TYPE c LENGTH 10,
        "! GtsVornu
        gts_vornu                  TYPE c LENGTH 25,
        "! GtsExpvz
        gts_expvz                  TYPE c LENGTH 1,
        "! GtsPorti
        gts_porti                  TYPE c LENGTH 4,
        "! ItmExpvz
        itm_expvz                  TYPE c LENGTH 2,
        "! ItmStgbe
        itm_stgbe                  TYPE c LENGTH 3,
        "! ItmKzgbe
        itm_kzgbe                  TYPE c LENGTH 30,
        "! ItmVygid
        itm_vygid                  TYPE c LENGTH 35,
        "! ItmIever
        itm_iever                  TYPE c LENGTH 2,
        "! ItmStabe
        itm_stabe                  TYPE c LENGTH 3,
        "! ItmKzabe
        itm_kzabe                  TYPE c LENGTH 30,
        "! Handoverloc
        handoverloc                TYPE c LENGTH 10,
        "! Handoverdate
        handoverdate               TYPE datn,
        "! Handovertime
        handovertime               TYPE timn,
        "! Handovertzone
        handovertzone              TYPE c LENGTH 6,
        "! Bestk
        bestk                      TYPE c LENGTH 1,
        "! Cmpsc
        cmpsc                      TYPE c LENGTH 1,
        "! Cmpsd
        cmpsd                      TYPE c LENGTH 1,
        "! Cmpsi
        cmpsi                      TYPE c LENGTH 1,
        "! Cmpsj
        cmpsj                      TYPE c LENGTH 1,
        "! Cmpsk
        cmpsk                      TYPE c LENGTH 1,
        "! CmpsCm
        cmps_cm                    TYPE c LENGTH 1,
        "! CmpsTe
        cmps_te                    TYPE c LENGTH 1,
        "! Cmgst
        cmgst                      TYPE c LENGTH 1,
        "! Fkivk
        fkivk                      TYPE c LENGTH 1,
        "! Fkstk
        fkstk                      TYPE c LENGTH 1,
        "! Gbstk
        gbstk                      TYPE c LENGTH 1,
        "! Hdall
        hdall                      TYPE abap_bool,
        "! Hdals
        hdals                      TYPE abap_bool,
        "! Koquk
        koquk                      TYPE c LENGTH 1,
        "! Kostk
        kostk                      TYPE c LENGTH 1,
        "! KostkWh
        kostk_wh                   TYPE c LENGTH 1,
        "! Lvstk
        lvstk                      TYPE c LENGTH 1,
        "! Pdstk
        pdstk                      TYPE c LENGTH 1,
        "! Pkstk
        pkstk                      TYPE c LENGTH 1,
        "! SpeTmpid
        spe_tmpid                  TYPE c LENGTH 1,
        "! Spstg
        spstg                      TYPE c LENGTH 1,
        "! Trsta
        trsta                      TYPE c LENGTH 1,
        "! Uvall
        uvall                      TYPE c LENGTH 1,
        "! Uvals
        uvals                      TYPE c LENGTH 1,
        "! Uvfak
        uvfak                      TYPE c LENGTH 1,
        "! Uvfas
        uvfas                      TYPE c LENGTH 1,
        "! Uvpak
        uvpak                      TYPE c LENGTH 1,
        "! Uvpas
        uvpas                      TYPE c LENGTH 1,
        "! Uvpik
        uvpik                      TYPE c LENGTH 1,
        "! Uvpis
        uvpis                      TYPE c LENGTH 1,
        "! Uvvlk
        uvvlk                      TYPE c LENGTH 1,
        "! Uvvls
        uvvls                      TYPE c LENGTH 1,
        "! Uvwak
        uvwak                      TYPE c LENGTH 1,
        "! Uvwas
        uvwas                      TYPE c LENGTH 1,
        "! Vestk
        vestk                      TYPE c LENGTH 1,
        "! Vlstk
        vlstk                      TYPE c LENGTH 1,
        "! Wbstk
        wbstk                      TYPE c LENGTH 1,
        "! Uvk01
        uvk_01                     TYPE c LENGTH 1,
        "! Uvk02
        uvk_02                     TYPE c LENGTH 1,
        "! Uvk03
        uvk_03                     TYPE c LENGTH 1,
        "! Uvk04
        uvk_04                     TYPE c LENGTH 1,
        "! Uvk05
        uvk_05                     TYPE c LENGTH 1,
        "! Uvs01
        uvs_01                     TYPE c LENGTH 1,
        "! Uvs02
        uvs_02                     TYPE c LENGTH 1,
        "! Uvs03
        uvs_03                     TYPE c LENGTH 1,
        "! Uvs04
        uvs_04                     TYPE c LENGTH 1,
        "! Uvs05
        uvs_05                     TYPE c LENGTH 1,
        "! TotalPcsta
        total_pcsta                TYPE c LENGTH 1,
        "! TotalDgsta
        total_dgsta                TYPE c LENGTH 1,
        "! TotalSdssta
        total_sdssta               TYPE c LENGTH 1,
        "! TotalArcStatus
        total_arc_status           TYPE c LENGTH 1,
        "! IcoFkivk
        ico_fkivk                  TYPE c LENGTH 1,
        "! TotalEmcst
        total_emcst                TYPE c LENGTH 1,
        "! TotalSlcst
        total_slcst                TYPE c LENGTH 1,
        "! TotalLccst
        total_lccst                TYPE c LENGTH 1,
        "! xsapmpxlbask
        xsapmpxlbask               TYPE c LENGTH 1,
        "! Incov
        incov                      TYPE c LENGTH 4,
        "! Inco2L
        inco_2_l                   TYPE c LENGTH 70,
        "! Inco3L
        inco_3_l                   TYPE c LENGTH 70,
        "! OidExtbol
        oid_extbol                 TYPE c LENGTH 16,
        "! OidMiscdl
        oid_miscdl                 TYPE c LENGTH 16,
        "! ExtBusSystId
        ext_bus_syst_id            TYPE c LENGTH 60,
        "! SitkzDb
        sitkz_db                   TYPE c LENGTH 1,
        "! TmAdvShipRecv
        tm_adv_ship_recv           TYPE c LENGTH 1,
        "! TmWhseExec
        tm_whse_exec               TYPE c LENGTH 1,
        "! TmWhseBlock
        tm_whse_block              TYPE c LENGTH 2,
        "! LglcLicInd
        lglc_lic_ind               TYPE c LENGTH 1,
        "! CreationTs
        creation_ts                TYPE timestampl,
        "! ChangedTs
        changed_ts                 TYPE timestampl,
        "! CorrInd
        corr_ind                   TYPE c LENGTH 1,
        "! DummyDeliveryInclEewPs
        dummy_delivery_incl_eew_ps TYPE c LENGTH 1,
        "! xbev1xluleinh
        xbev_1_xluleinh            TYPE c LENGTH 8,
        "! xbev1xrpfaess
        xbev_1_xrpfaess            TYPE p LENGTH 4 DECIMALS 0,
        "! xbev1xrpkist
        xbev_1_xrpkist             TYPE p LENGTH 4 DECIMALS 0,
        "! xbev1xrpcont
        xbev_1_xrpcont             TYPE p LENGTH 4 DECIMALS 0,
        "! xbev1xrpsonst
        xbev_1_xrpsonst            TYPE p LENGTH 4 DECIMALS 0,
        "! xbev1xrpflgnr
        xbev_1_xrpflgnr            TYPE c LENGTH 5,
        "! IdtCurEvtloc
        idt_cur_evtloc             TYPE c LENGTH 10,
        "! IdtCurEvtqua
        idt_cur_evtqua             TYPE c LENGTH 1,
        "! IdtCurEvttst
        idt_cur_evttst             TYPE timestamp,
        "! IdtCurEstloc
        idt_cur_estloc             TYPE c LENGTH 10,
        "! IdtCurEstqua
        idt_cur_estqua             TYPE c LENGTH 1,
        "! IdtCurEsttst
        idt_cur_esttst             TYPE timestamp,
        "! IdtCurWrkqua
        idt_cur_wrkqua             TYPE c LENGTH 10,
        "! IdtPreEvtloc
        idt_pre_evtloc             TYPE c LENGTH 10,
        "! IdtPreEvtqua
        idt_pre_evtqua             TYPE c LENGTH 1,
        "! IdtPreEvttst
        idt_pre_evttst             TYPE timestamp,
        "! IdtPreEstloc
        idt_pre_estloc             TYPE c LENGTH 10,
        "! IdtPreEstqua
        idt_pre_estqua             TYPE c LENGTH 1,
        "! IdtPreEsttst
        idt_pre_esttst             TYPE timestamp,
        "! IdtPreWrkqua
        idt_pre_wrkqua             TYPE c LENGTH 10,
        "! IdtRefEstloc
        idt_ref_estloc             TYPE c LENGTH 10,
        "! IdtRefEstqua
        idt_ref_estqua             TYPE c LENGTH 1,
        "! IdtRefEsttst
        idt_ref_esttst             TYPE timestamp,
        "! IdtFirmLfdat
        idt_firm_lfdat             TYPE c LENGTH 2,
        "! IdtDocnum
        idt_docnum                 TYPE c LENGTH 16,
        "! BorgrGrp
        borgr_grp                  TYPE c LENGTH 35,
        "! Kbnkz
        kbnkz                      TYPE c LENGTH 1,
        "! FshTransaction
        fsh_transaction            TYPE c LENGTH 10,
        "! FshVasLastItem
        fsh_vas_last_item          TYPE c LENGTH 5,
        "! FshVasCg
        fsh_vas_cg                 TYPE c LENGTH 3,
        "! RfmPsstGroup
        rfm_psst_group             TYPE c LENGTH 10,
        "! ExtActDateTocd
        ext_act_date_tocd          TYPE timestamp,
        "! ExtPlanDateTocd
        ext_plan_date_tocd         TYPE timestamp,
        "! ExtTzoneTocd
        ext_tzone_tocd             TYPE c LENGTH 6,
        "! IntActDateTocd
        int_act_date_tocd          TYPE timestamp,
        "! IntPlanDateTocd
        int_plan_date_tocd         TYPE timestamp,
        "! IntTzoneTocd
        int_tzone_tocd             TYPE c LENGTH 6,
        "! JitRlvnt
        jit_rlvnt                  TYPE abap_bool,
      END OF tys_z_i_likptype,
      "! <p class="shorttext synchronized">List of Z_I_LIKPType</p>
      tyt_z_i_likptype TYPE STANDARD TABLE OF tys_z_i_likptype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_LIPSType</p>
      BEGIN OF tys_z_i_lipstype,
        "! <em>Key property</em> Vbeln
        vbeln                      TYPE c LENGTH 10,
        "! <em>Key property</em> Posnr
        posnr                      TYPE c LENGTH 6,
        "! Pstyv
        pstyv                      TYPE c LENGTH 4,
        "! Ernam
        ernam                      TYPE c LENGTH 12,
        "! Erzet
        erzet                      TYPE timn,
        "! Erdat
        erdat                      TYPE datn,
        "! Matnr
        matnr                      TYPE c LENGTH 18,
        "! Matwa
        matwa                      TYPE c LENGTH 18,
        "! Matkl
        matkl                      TYPE c LENGTH 9,
        "! Werks
        werks                      TYPE c LENGTH 4,
        "! Lgort
        lgort                      TYPE c LENGTH 4,
        "! Charg
        charg                      TYPE c LENGTH 10,
        "! Lichn
        lichn                      TYPE c LENGTH 15,
        "! Kdmat
        kdmat                      TYPE c LENGTH 35,
        "! Prodh
        prodh                      TYPE c LENGTH 18,
        "! PrdhUniBatdetParntNodid
        prdh_uni_batdet_parnt_nodi TYPE c LENGTH 40,
        "! Lfimg
        lfimg                      TYPE p LENGTH 7 DECIMALS 3,
        "! Meins
        meins                      TYPE c LENGTH 3,
        "! Vrkme
        vrkme                      TYPE c LENGTH 3,
        "! Umvkz
        umvkz                      TYPE p LENGTH 3 DECIMALS 0,
        "! Umvkn
        umvkn                      TYPE p LENGTH 3 DECIMALS 0,
        "! Ntgew
        ntgew                      TYPE p LENGTH 8 DECIMALS 3,
        "! Brgew
        brgew                      TYPE p LENGTH 8 DECIMALS 3,
        "! Gewei
        gewei                      TYPE c LENGTH 3,
        "! Volum
        volum                      TYPE p LENGTH 8 DECIMALS 3,
        "! Voleh
        voleh                      TYPE c LENGTH 3,
        "! Kztlf
        kztlf                      TYPE c LENGTH 1,
        "! Uebtk
        uebtk                      TYPE abap_bool,
        "! Uebto
        uebto                      TYPE p LENGTH 2 DECIMALS 1,
        "! Untto
        untto                      TYPE p LENGTH 2 DECIMALS 1,
        "! Chspl
        chspl                      TYPE abap_bool,
        "! Faksp
        faksp                      TYPE c LENGTH 2,
        "! Mbdat
        mbdat                      TYPE datn,
        "! Lgmng
        lgmng                      TYPE p LENGTH 7 DECIMALS 3,
        "! Arktx
        arktx                      TYPE c LENGTH 40,
        "! Lgpbe
        lgpbe                      TYPE c LENGTH 10,
        "! Vbelv
        vbelv                      TYPE c LENGTH 10,
        "! Posnv
        posnv                      TYPE c LENGTH 6,
        "! Vbtyv
        vbtyv                      TYPE c LENGTH 4,
        "! Vgsys
        vgsys                      TYPE c LENGTH 10,
        "! Vgbel
        vgbel                      TYPE c LENGTH 10,
        "! Vgpos
        vgpos                      TYPE c LENGTH 6,
        "! Upflu
        upflu                      TYPE c LENGTH 1,
        "! Uepos
        uepos                      TYPE c LENGTH 6,
        "! Fkrel
        fkrel                      TYPE c LENGTH 1,
        "! BatchBillingVariant
        batch_billing_variant      TYPE c LENGTH 1,
        "! Ladgr
        ladgr                      TYPE c LENGTH 4,
        "! Tragr
        tragr                      TYPE c LENGTH 4,
        "! Komkz
        komkz                      TYPE c LENGTH 1,
        "! Lgnum
        lgnum                      TYPE c LENGTH 3,
        "! Lispl
        lispl                      TYPE c LENGTH 1,
        "! Lgtyp
        lgtyp                      TYPE c LENGTH 3,
        "! Lgpla
        lgpla                      TYPE c LENGTH 10,
        "! Bwtex
        bwtex                      TYPE abap_bool,
        "! Ettyp
        ettyp                      TYPE c LENGTH 2,
        "! Bwart
        bwart                      TYPE c LENGTH 3,
        "! Bwlvs
        bwlvs                      TYPE c LENGTH 3,
        "! Kzdlg
        kzdlg                      TYPE abap_bool,
        "! Bdart
        bdart                      TYPE c LENGTH 2,
        "! Plart
        plart                      TYPE c LENGTH 1,
        "! Mtart
        mtart                      TYPE c LENGTH 4,
        "! Xchpf
        xchpf                      TYPE abap_bool,
        "! Xchar
        xchar                      TYPE abap_bool,
        "! Vgref
        vgref                      TYPE abap_bool,
        "! Posar
        posar                      TYPE c LENGTH 1,
        "! Bwtar
        bwtar                      TYPE c LENGTH 10,
        "! Sumbd
        sumbd                      TYPE c LENGTH 1,
        "! Mtvfp
        mtvfp                      TYPE c LENGTH 2,
        "! Eannr
        eannr                      TYPE c LENGTH 13,
        "! Gsber
        gsber                      TYPE c LENGTH 4,
        "! Vkbur
        vkbur                      TYPE c LENGTH 4,
        "! Vkgrp
        vkgrp                      TYPE c LENGTH 3,
        "! Vtweg
        vtweg                      TYPE c LENGTH 2,
        "! Spart
        spart                      TYPE c LENGTH 2,
        "! Grkor
        grkor                      TYPE c LENGTH 3,
        "! Fmeng
        fmeng                      TYPE abap_bool,
        "! Antlf
        antlf                      TYPE p LENGTH 1 DECIMALS 0,
        "! Vbeaf
        vbeaf                      TYPE p LENGTH 3 DECIMALS 2,
        "! Vbeav
        vbeav                      TYPE p LENGTH 3 DECIMALS 2,
        "! Stafo
        stafo                      TYPE c LENGTH 6,
        "! Sobkz
        sobkz                      TYPE c LENGTH 1,
        "! Aedat
        aedat                      TYPE datn,
        "! Ean11
        ean_11                     TYPE c LENGTH 18,
        "! Kvgr1
        kvgr_1                     TYPE c LENGTH 3,
        "! Kvgr2
        kvgr_2                     TYPE c LENGTH 3,
        "! Kvgr3
        kvgr_3                     TYPE c LENGTH 3,
        "! Kvgr4
        kvgr_4                     TYPE c LENGTH 3,
        "! Kvgr5
        kvgr_5                     TYPE c LENGTH 3,
        "! Mvgr1
        mvgr_1                     TYPE c LENGTH 3,
        "! Mvgr2
        mvgr_2                     TYPE c LENGTH 3,
        "! Mvgr3
        mvgr_3                     TYPE c LENGTH 3,
        "! Mvgr4
        mvgr_4                     TYPE c LENGTH 3,
        "! Mvgr5
        mvgr_5                     TYPE c LENGTH 3,
        "! Vpzuo
        vpzuo                      TYPE c LENGTH 1,
        "! Vgtyp
        vgtyp                      TYPE c LENGTH 4,
        "! Rfvgtyp
        rfvgtyp                    TYPE c LENGTH 4,
        "! Kostl
        kostl                      TYPE c LENGTH 10,
        "! Kokrs
        kokrs                      TYPE c LENGTH 4,
        "! Paobjnr
        paobjnr                    TYPE c LENGTH 10,
        "! Prctr
        prctr                      TYPE c LENGTH 10,
        "! Aufnr
        aufnr                      TYPE c LENGTH 12,
        "! PosnrPp
        posnr_pp                   TYPE c LENGTH 4,
        "! RecipientLocationCode
        recipient_location_code    TYPE c LENGTH 15,
        "! Aufpl
        aufpl                      TYPE c LENGTH 10,
        "! Aplzl
        aplzl                      TYPE c LENGTH 8,
        "! Kdauf
        kdauf                      TYPE c LENGTH 10,
        "! Kdpos
        kdpos                      TYPE c LENGTH 6,
        "! Vpmat
        vpmat                      TYPE c LENGTH 18,
        "! Vpwrk
        vpwrk                      TYPE c LENGTH 4,
        "! Prbme
        prbme                      TYPE c LENGTH 3,
        "! Umref
        umref                      TYPE /iwbep/v4_float,
        "! Knttp
        knttp                      TYPE c LENGTH 1,
        "! Kzvbr
        kzvbr                      TYPE c LENGTH 1,
        "! Fistl
        fistl                      TYPE c LENGTH 16,
        "! Geber
        geber                      TYPE c LENGTH 10,
        "! Pckpf
        pckpf                      TYPE c LENGTH 1,
        "! BedarLf
        bedar_lf                   TYPE c LENGTH 3,
        "! Cmpnt
        cmpnt                      TYPE abap_bool,
        "! Kcmeng
        kcmeng                     TYPE p LENGTH 8 DECIMALS 3,
        "! Kcbrgew
        kcbrgew                    TYPE p LENGTH 8 DECIMALS 3,
        "! Kcntgew
        kcntgew                    TYPE p LENGTH 8 DECIMALS 3,
        "! Kcvolum
        kcvolum                    TYPE p LENGTH 8 DECIMALS 3,
        "! Uecha
        uecha                      TYPE c LENGTH 6,
        "! Cuobj
        cuobj                      TYPE c LENGTH 18,
        "! CuobjCh
        cuobj_ch                   TYPE c LENGTH 18,
        "! Anzsn
        anzsn                      TYPE int4,
        "! Serail
        serail                     TYPE c LENGTH 4,
        "! Kcgewei
        kcgewei                    TYPE c LENGTH 3,
        "! Kcvoleh
        kcvoleh                    TYPE c LENGTH 3,
        "! Sernr
        sernr                      TYPE c LENGTH 8,
        "! Abrli
        abrli                      TYPE c LENGTH 4,
        "! Abart
        abart                      TYPE c LENGTH 1,
        "! Abrvw
        abrvw                      TYPE c LENGTH 3,
        "! Qplos
        qplos                      TYPE c LENGTH 12,
        "! Qtlos
        qtlos                      TYPE c LENGTH 6,
        "! Nachl
        nachl                      TYPE abap_bool,
        "! Magrv
        magrv                      TYPE c LENGTH 4,
        "! Objko
        objko                      TYPE c LENGTH 22,
        "! Objpo
        objpo                      TYPE c LENGTH 22,
        "! Aeskd
        aeskd                      TYPE c LENGTH 17,
        "! Shkzg
        shkzg                      TYPE c LENGTH 1,
        "! Prosa
        prosa                      TYPE c LENGTH 1,
        "! Uepvw
        uepvw                      TYPE c LENGTH 1,
        "! Empst
        empst                      TYPE c LENGTH 25,
        "! Abtnr
        abtnr                      TYPE c LENGTH 4,
        "! Koqui
        koqui                      TYPE abap_bool,
        "! Stadat
        stadat                     TYPE datn,
        "! Aktnr
        aktnr                      TYPE c LENGTH 10,
        "! KnumhCh
        knumh_ch                   TYPE c LENGTH 10,
        "! Prefe
        prefe                      TYPE c LENGTH 1,
        "! Exart
        exart                      TYPE c LENGTH 2,
        "! Clint
        clint                      TYPE c LENGTH 10,
        "! Chmvs
        chmvs                      TYPE c LENGTH 3,
        "! Abeln
        abeln                      TYPE c LENGTH 10,
        "! Abelp
        abelp                      TYPE c LENGTH 5,
        "! LfimgFlo
        lfimg_flo                  TYPE /iwbep/v4_float,
        "! LgmngFlo
        lgmng_flo                  TYPE /iwbep/v4_float,
        "! KcmengFlo
        kcmeng_flo                 TYPE /iwbep/v4_float,
        "! Kzumw
        kzumw                      TYPE abap_bool,
        "! Kmpmg
        kmpmg                      TYPE p LENGTH 7 DECIMALS 3,
        "! Aurel
        aurel                      TYPE c LENGTH 1,
        "! Kpein
        kpein                      TYPE p LENGTH 3 DECIMALS 0,
        "! Kmein
        kmein                      TYPE c LENGTH 3,
        "! Netwr
        netwr                      TYPE p LENGTH 8 DECIMALS 2,
        "! Kowrr
        kowrr                      TYPE c LENGTH 1,
        "! Kzbew
        kzbew                      TYPE c LENGTH 1,
        "! Mfrgr
        mfrgr                      TYPE c LENGTH 8,
        "! Chhpv
        chhpv                      TYPE abap_bool,
        "! Abfor
        abfor                      TYPE c LENGTH 2,
        "! Abges
        abges                      TYPE /iwbep/v4_float,
        "! Mbuhr
        mbuhr                      TYPE timn,
        "! Wktnr
        wktnr                      TYPE c LENGTH 10,
        "! Wktps
        wktps                      TYPE c LENGTH 6,
        "! Situa
        situa                      TYPE c LENGTH 2,
        "! Rsnum
        rsnum                      TYPE c LENGTH 10,
        "! Rspos
        rspos                      TYPE c LENGTH 4,
        "! Rsart
        rsart                      TYPE c LENGTH 1,
        "! Kannr
        kannr                      TYPE c LENGTH 35,
        "! Kzfme
        kzfme                      TYPE c LENGTH 1,
        "! Profl
        profl                      TYPE c LENGTH 3,
        "! Fksta
        fksta                      TYPE c LENGTH 1,
      END OF tys_z_i_lipstype,
      "! <p class="shorttext synchronized">List of Z_I_LIPSType</p>
      tyt_z_i_lipstype TYPE STANDARD TABLE OF tys_z_i_lipstype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_VBAK_KNVVType</p>
      BEGIN OF tys_z_i_vbak_knvvtype,
        "! <em>Key property</em> Vbeln
        vbeln TYPE c LENGTH 10,
        "! Erdat
        erdat TYPE datn,
        "! Waerk
        waerk TYPE c LENGTH 5,
        "! Vkorg
        vkorg TYPE c LENGTH 4,
        "! Vtweg
        vtweg TYPE c LENGTH 2,
        "! Spart
        spart TYPE c LENGTH 2,
        "! Kunnr
        kunnr TYPE c LENGTH 10,
        "! Bzirk
        bzirk TYPE c LENGTH 6,
      END OF tys_z_i_vbak_knvvtype,
      "! <p class="shorttext synchronized">List of Z_I_VBAK_KNVVType</p>
      tyt_z_i_vbak_knvvtype TYPE STANDARD TABLE OF tys_z_i_vbak_knvvtype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_VBAPType</p>
      BEGIN OF tys_z_i_vbaptype,
        "! <em>Key property</em> Vbeln
        vbeln                      TYPE c LENGTH 10,
        "! <em>Key property</em> Posnr
        posnr                      TYPE c LENGTH 6,
        "! Matnr
        matnr                      TYPE c LENGTH 18,
        "! Matwa
        matwa                      TYPE c LENGTH 18,
        "! Pmatn
        pmatn                      TYPE c LENGTH 18,
        "! Charg
        charg                      TYPE c LENGTH 10,
        "! Matkl
        matkl                      TYPE c LENGTH 9,
        "! Arktx
        arktx                      TYPE c LENGTH 40,
        "! Pstyv
        pstyv                      TYPE c LENGTH 4,
        "! Posar
        posar                      TYPE c LENGTH 1,
        "! ProcessCode
        process_code               TYPE c LENGTH 1,
        "! Lfrel
        lfrel                      TYPE abap_bool,
        "! Fkrel
        fkrel                      TYPE c LENGTH 1,
        "! Uepos
        uepos                      TYPE c LENGTH 6,
        "! Grpos
        grpos                      TYPE c LENGTH 6,
        "! Abgru
        abgru                      TYPE c LENGTH 2,
        "! Prodh
        prodh                      TYPE c LENGTH 18,
        "! DiscontinuedDate
        discontinued_date          TYPE datn,
        "! DiscontinuedTime
        discontinued_time          TYPE timn,
        "! FollowUpItem
        follow_up_item             TYPE c LENGTH 6,
        "! PickHuInd
        pick_hu_ind                TYPE c LENGTH 1,
        "! ProdhUnivSalesParntNodid
        prodh_univ_sales_parnt_nod TYPE c LENGTH 40,
        "! ProdhUnivSalesDetOrigin
        prodh_univ_sales_det_origi TYPE c LENGTH 2,
        "! ProdhUnivBatdetParntNodid
        prodh_univ_batdet_parnt_no TYPE c LENGTH 40,
        "! ProdhUnivBatdetDetOrigin
        prodh_univ_batdet_det_orig TYPE c LENGTH 2,
        "! Zieme
        zieme                      TYPE c LENGTH 3,
        "! Umziz
        umziz                      TYPE p LENGTH 3 DECIMALS 0,
        "! Umzin
        umzin                      TYPE p LENGTH 3 DECIMALS 0,
        "! Meins
        meins                      TYPE c LENGTH 3,
        "! SubstnNumerator
        substn_numerator           TYPE int2,
        "! SubstnDenominator
        substn_denominator         TYPE int2,
        "! Abdat
        abdat                      TYPE datn,
        "! Posex
        posex                      TYPE c LENGTH 6,
        "! Kdmat
        kdmat                      TYPE c LENGTH 35,
        "! Kbver
        kbver                      TYPE p LENGTH 2 DECIMALS 0,
        "! Kever
        kever                      TYPE p LENGTH 2 DECIMALS 0,
        "! Vkgru
        vkgru                      TYPE c LENGTH 3,
        "! Vkaus
        vkaus                      TYPE c LENGTH 3,
        "! Grkor
        grkor                      TYPE c LENGTH 3,
        "! Fmeng
        fmeng                      TYPE abap_bool,
        "! Uebtk
        uebtk                      TYPE abap_bool,
        "! Uebto
        uebto                      TYPE p LENGTH 2 DECIMALS 1,
        "! Untto
        untto                      TYPE p LENGTH 2 DECIMALS 1,
        "! Faksp
        faksp                      TYPE c LENGTH 2,
        "! Atpkz
        atpkz                      TYPE c LENGTH 1,
        "! Rkfkf
        rkfkf                      TYPE c LENGTH 1,
        "! Spart
        spart                      TYPE c LENGTH 2,
        "! Gsber
        gsber                      TYPE c LENGTH 4,
        "! Netwr
        netwr                      TYPE p LENGTH 8 DECIMALS 2,
        "! Waerk
        waerk                      TYPE c LENGTH 5,
        "! Antlf
        antlf                      TYPE p LENGTH 1 DECIMALS 0,
        "! Kztlf
        kztlf                      TYPE c LENGTH 1,
        "! ResourceId
        resource_id                TYPE c LENGTH 40,
        "! Chspl
        chspl                      TYPE abap_bool,
        "! Kwmeng
        kwmeng                     TYPE p LENGTH 8 DECIMALS 3,
        "! Vrkme
        vrkme                      TYPE c LENGTH 3,
        "! Umvkz
        umvkz                      TYPE p LENGTH 3 DECIMALS 0,
        "! Umvkn
        umvkn                      TYPE p LENGTH 3 DECIMALS 0,
        "! Gewei
        gewei                      TYPE c LENGTH 3,
        "! Voleh
        voleh                      TYPE c LENGTH 3,
        "! Vbelv
        vbelv                      TYPE c LENGTH 10,
        "! Posnv
        posnv                      TYPE c LENGTH 6,
        "! Vgbel
        vgbel                      TYPE c LENGTH 10,
        "! Vgpos
        vgpos                      TYPE c LENGTH 6,
        "! Voref
        voref                      TYPE abap_bool,
        "! Upflu
        upflu                      TYPE c LENGTH 1,
        "! Erlre
        erlre                      TYPE c LENGTH 1,
        "! Lprio
        lprio                      TYPE c LENGTH 2,
        "! Werks
        werks                      TYPE c LENGTH 4,
        "! Lgort
        lgort                      TYPE c LENGTH 4,
        "! Vstel
        vstel                      TYPE c LENGTH 4,
        "! Route
        route                      TYPE c LENGTH 6,
        "! Stkey
        stkey                      TYPE c LENGTH 1,
        "! Stdat
        stdat                      TYPE datn,
        "! Stpos
        stpos                      TYPE p LENGTH 3 DECIMALS 0,
        "! Awahr
        awahr                      TYPE c LENGTH 3,
        "! Erdat
        erdat                      TYPE datn,
        "! Ernam
        ernam                      TYPE c LENGTH 12,
        "! Erzet
        erzet                      TYPE timn,
        "! Taxm1
        taxm_1                     TYPE c LENGTH 1,
        "! Taxm2
        taxm_2                     TYPE c LENGTH 1,
        "! Taxm3
        taxm_3                     TYPE c LENGTH 1,
        "! Taxm4
        taxm_4                     TYPE c LENGTH 1,
        "! Taxm5
        taxm_5                     TYPE c LENGTH 1,
        "! Taxm6
        taxm_6                     TYPE c LENGTH 1,
        "! Taxm7
        taxm_7                     TYPE c LENGTH 1,
        "! Taxm8
        taxm_8                     TYPE c LENGTH 1,
        "! Taxm9
        taxm_9                     TYPE c LENGTH 1,
        "! Vbeaf
        vbeaf                      TYPE p LENGTH 3 DECIMALS 2,
        "! Vbeav
        vbeav                      TYPE p LENGTH 3 DECIMALS 2,
        "! Vgref
        vgref                      TYPE abap_bool,
        "! Netpr
        netpr                      TYPE p LENGTH 6 DECIMALS 3,
        "! Kpein
        kpein                      TYPE p LENGTH 3 DECIMALS 0,
        "! Kmein
        kmein                      TYPE c LENGTH 3,
        "! Shkzg
        shkzg                      TYPE abap_bool,
        "! Sktof
        sktof                      TYPE abap_bool,
        "! Mtvfp
        mtvfp                      TYPE c LENGTH 2,
        "! Sumbd
        sumbd                      TYPE c LENGTH 1,
        "! Kondm
        kondm                      TYPE c LENGTH 2,
        "! Ktgrm
        ktgrm                      TYPE c LENGTH 2,
        "! Bonus
        bonus                      TYPE c LENGTH 2,
        "! Provg
        provg                      TYPE c LENGTH 2,
        "! Eannr
        eannr                      TYPE c LENGTH 13,
        "! Prsok
        prsok                      TYPE abap_bool,
        "! Bwtar
        bwtar                      TYPE c LENGTH 10,
        "! Bwtex
        bwtex                      TYPE abap_bool,
        "! Xchpf
        xchpf                      TYPE abap_bool,
        "! Xchar
        xchar                      TYPE abap_bool,
        "! BatchBillingVariant
        batch_billing_variant      TYPE c LENGTH 1,
        "! Stafo
        stafo                      TYPE c LENGTH 6,
        "! Aedat
        aedat                      TYPE datn,
        "! Ean11
        ean_11                     TYPE c LENGTH 18,
        "! Fixmg
        fixmg                      TYPE abap_bool,
        "! Prctr
        prctr                      TYPE c LENGTH 10,
        "! Mvgr1
        mvgr_1                     TYPE c LENGTH 3,
        "! Mvgr2
        mvgr_2                     TYPE c LENGTH 3,
        "! Mvgr3
        mvgr_3                     TYPE c LENGTH 3,
        "! Mvgr4
        mvgr_4                     TYPE c LENGTH 3,
        "! Mvgr5
        mvgr_5                     TYPE c LENGTH 3,
        "! Sugrd
        sugrd                      TYPE c LENGTH 4,
        "! Sobkz
        sobkz                      TYPE c LENGTH 1,
        "! Vpzuo
        vpzuo                      TYPE c LENGTH 1,
        "! BobFgId
        bob_fg_id                  TYPE int8,
        "! BobPromotionId
        bob_promotion_id           TYPE int8,
        "! Paobjnr
        paobjnr                    TYPE c LENGTH 10,
        "! FreezePaobjnr
        freeze_paobjnr             TYPE abap_bool,
        "! Aufnr
        aufnr                      TYPE c LENGTH 12,
        "! Vpmat
        vpmat                      TYPE c LENGTH 18,
        "! Vpwrk
        vpwrk                      TYPE c LENGTH 4,
        "! Prbme
        prbme                      TYPE c LENGTH 3,
        "! Umref
        umref                      TYPE /iwbep/v4_float,
        "! Knttp
        knttp                      TYPE c LENGTH 1,
        "! Kzvbr
        kzvbr                      TYPE c LENGTH 1,
        "! Sernr
        sernr                      TYPE c LENGTH 8,
        "! Objnr
        objnr                      TYPE c LENGTH 22,
        "! Abgrs
        abgrs                      TYPE c LENGTH 6,
        "! Bedae
        bedae                      TYPE c LENGTH 4,
        "! Cmtfg
        cmtfg                      TYPE abap_bool,
        "! Cmpnt
        cmpnt                      TYPE abap_bool,
        "! Cuobj
        cuobj                      TYPE c LENGTH 18,
        "! CuobjCh
        cuobj_ch                   TYPE c LENGTH 18,
        "! Cepok
        cepok                      TYPE c LENGTH 1,
        "! Koupd
        koupd                      TYPE abap_bool,
        "! Serail
        serail                     TYPE c LENGTH 4,
        "! Anzsn
        anzsn                      TYPE int4,
        "! Nachl
        nachl                      TYPE abap_bool,
        "! Magrv
        magrv                      TYPE c LENGTH 4,
        "! Mprok
        mprok                      TYPE c LENGTH 1,
        "! Vgtyp
        vgtyp                      TYPE c LENGTH 4,
        "! Prosa
        prosa                      TYPE c LENGTH 1,
        "! Uepvw
        uepvw                      TYPE c LENGTH 1,
        "! Kalnr
        kalnr                      TYPE c LENGTH 12,
        "! Klvar
        klvar                      TYPE c LENGTH 4,
        "! Kowrr
        kowrr                      TYPE c LENGTH 1,
        "! Stadat
        stadat                     TYPE datn,
        "! Exart
        exart                      TYPE c LENGTH 2,
        "! Prefe
        prefe                      TYPE c LENGTH 1,
        "! Knumh
        knumh                      TYPE c LENGTH 10,
        "! Clint
        clint                      TYPE c LENGTH 10,
        "! Chmvs
        chmvs                      TYPE c LENGTH 3,
        "! Stlty
        stlty                      TYPE c LENGTH 1,
        "! Stlkn
        stlkn                      TYPE c LENGTH 8,
        "! Stpoz
        stpoz                      TYPE c LENGTH 8,
        "! Stman
        stman                      TYPE abap_bool,
        "! ZschlK
        zschl_k                    TYPE c LENGTH 6,
        "! KalsmK
        kalsm_k                    TYPE c LENGTH 6,
        "! Kalvar
        kalvar                     TYPE c LENGTH 4,
        "! Kosch
        kosch                      TYPE c LENGTH 18,
        "! Upmat
        upmat                      TYPE c LENGTH 18,
        "! Ukonm
        ukonm                      TYPE c LENGTH 2,
        "! Mfrgr
        mfrgr                      TYPE c LENGTH 8,
        "! Plavo
        plavo                      TYPE c LENGTH 4,
        "! Kannr
        kannr                      TYPE c LENGTH 35,
        "! CmpreFlt
        cmpre_flt                  TYPE /iwbep/v4_float,
        "! Abfor
        abfor                      TYPE c LENGTH 2,
        "! Abges
        abges                      TYPE /iwbep/v4_float,
        "! Wktnr
        wktnr                      TYPE c LENGTH 10,
        "! Wktps
        wktps                      TYPE c LENGTH 6,
        "! Skopf
        skopf                      TYPE c LENGTH 18,
        "! Kzbws
        kzbws                      TYPE c LENGTH 1,
        "! Wgru1
        wgru_1                     TYPE c LENGTH 18,
        "! Wgru2
        wgru_2                     TYPE c LENGTH 18,
        "! KnumaPi
        knuma_pi                   TYPE c LENGTH 10,
        "! KnumaAg
        knuma_ag                   TYPE c LENGTH 10,
        "! Kzfme
        kzfme                      TYPE c LENGTH 1,
        "! Lstanr
        lstanr                     TYPE c LENGTH 1,
        "! Techs
        techs                      TYPE c LENGTH 12,
        "! Mwsbp
        mwsbp                      TYPE p LENGTH 7 DECIMALS 2,
        "! Berid
        berid                      TYPE c LENGTH 10,
        "! Pctrf
        pctrf                      TYPE c LENGTH 10,
        "! LogsysExt
        logsys_ext                 TYPE c LENGTH 10,
        "! Stockloc
        stockloc                   TYPE c LENGTH 20,
        "! Sloctype
        sloctype                   TYPE c LENGTH 4,
        "! MsrRetReason
        msr_ret_reason             TYPE c LENGTH 3,
        "! MsrRefundCode
        msr_refund_code            TYPE c LENGTH 3,
        "! MsrApprovBlock
        msr_approv_block           TYPE c LENGTH 1,
        "! NrabKnumh
        nrab_knumh                 TYPE c LENGTH 10,
        "! TrmriskRelevant
        trmrisk_relevant           TYPE c LENGTH 2,
        "! SgtRcat
        sgt_rcat                   TYPE c LENGTH 40,
        "! VbkdPosnr
        vbkd_posnr                 TYPE c LENGTH 6,
        "! VedaPosnr
        veda_posnr                 TYPE c LENGTH 6,
        "! Handoverloc
        handoverloc                TYPE c LENGTH 10,
        "! ExtRefItemId
        ext_ref_item_id            TYPE c LENGTH 40,
        "! Handoverdate
        handoverdate               TYPE datn,
        "! Handovertime
        handovertime               TYPE timn,
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
        "! Spcsto
        spcsto                     TYPE c LENGTH 2,
        "! RevaccRefid
        revacc_refid               TYPE c LENGTH 30,
        "! RevaccReftype
        revacc_reftype             TYPE c LENGTH 3,
        "! Dataaging
        dataaging                  TYPE datn,
        "! Absta
        absta                      TYPE c LENGTH 1,
        "! Besta
        besta                      TYPE c LENGTH 1,
        "! Cmppi
        cmppi                      TYPE c LENGTH 1,
        "! Cmppj
        cmppj                      TYPE c LENGTH 1,
        "! Costa
        costa                      TYPE c LENGTH 1,
        "! Dcsta
        dcsta                      TYPE c LENGTH 1,
        "! Fksaa
        fksaa                      TYPE c LENGTH 1,
        "! Fssta
        fssta                      TYPE c LENGTH 1,
        "! Gbsta
        gbsta                      TYPE c LENGTH 1,
        "! Lfgsa
        lfgsa                      TYPE c LENGTH 1,
        "! Lfsta
        lfsta                      TYPE c LENGTH 1,
        "! Lssta
        lssta                      TYPE c LENGTH 1,
        "! Manek
        manek                      TYPE c LENGTH 1,
        "! Rfgsa
        rfgsa                      TYPE c LENGTH 1,
        "! Rfsta
        rfsta                      TYPE c LENGTH 1,
        "! Uvall
        uvall                      TYPE c LENGTH 1,
        "! Uvfak
        uvfak                      TYPE c LENGTH 1,
        "! Uvprs
        uvprs                      TYPE c LENGTH 1,
        "! Uvvlk
        uvvlk                      TYPE c LENGTH 1,
        "! Uvp01
        uvp_01                     TYPE c LENGTH 1,
        "! Uvp02
        uvp_02                     TYPE c LENGTH 1,
        "! Uvp03
        uvp_03                     TYPE c LENGTH 1,
        "! Uvp04
        uvp_04                     TYPE c LENGTH 1,
        "! Uvp05
        uvp_05                     TYPE c LENGTH 1,
        "! Wbsta
        wbsta                      TYPE c LENGTH 1,
        "! Emcst
        emcst                      TYPE c LENGTH 1,
        "! Slcst
        slcst                      TYPE c LENGTH 1,
        "! TotalLccst
        total_lccst                TYPE c LENGTH 1,
        "! Pcsta
        pcsta                      TYPE c LENGTH 1,
        "! Dgsta
        dgsta                      TYPE c LENGTH 1,
        "! Sdssta
        sdssta                     TYPE c LENGTH 1,
      END OF tys_z_i_vbaptype,
      "! <p class="shorttext synchronized">List of Z_I_VBAPType</p>
      tyt_z_i_vbaptype TYPE STANDARD TABLE OF tys_z_i_vbaptype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_VBRKType</p>
      BEGIN OF tys_z_i_vbrktype,
        "! <em>Key property</em> Vbeln
        vbeln  TYPE c LENGTH 10,
        "! Fkart
        fkart  TYPE c LENGTH 4,
        "! Fktyp
        fktyp  TYPE c LENGTH 1,
        "! Vbtyp
        vbtyp  TYPE c LENGTH 4,
        "! Waerk
        waerk  TYPE c LENGTH 5,
        "! Vkorg
        vkorg  TYPE c LENGTH 4,
        "! Vtweg
        vtweg  TYPE c LENGTH 2,
        "! Kalsm
        kalsm  TYPE c LENGTH 6,
        "! Knumv
        knumv  TYPE c LENGTH 10,
        "! Vsbed
        vsbed  TYPE c LENGTH 2,
        "! Fkdat
        fkdat  TYPE datn,
        "! Belnr
        belnr  TYPE c LENGTH 10,
        "! Gjahr
        gjahr  TYPE c LENGTH 4,
        "! Poper
        poper  TYPE c LENGTH 3,
        "! Konda
        konda  TYPE c LENGTH 2,
        "! Kdgrp
        kdgrp  TYPE c LENGTH 2,
        "! Bzirk
        bzirk  TYPE c LENGTH 6,
        "! Pltyp
        pltyp  TYPE c LENGTH 2,
        "! Inco1
        inco_1 TYPE c LENGTH 3,
        "! Inco2
        inco_2 TYPE c LENGTH 28,
        "! Rfbsk
        rfbsk  TYPE c LENGTH 1,
        "! Mrnkz
        mrnkz  TYPE abap_bool,
        "! Cpkur
        cpkur  TYPE abap_bool,
        "! Valtg
        valtg  TYPE c LENGTH 2,
        "! Valdt
        valdt  TYPE datn,
        "! Zterm
        zterm  TYPE c LENGTH 4,
        "! Zlsch
        zlsch  TYPE c LENGTH 1,
        "! Ktgrd
        ktgrd  TYPE c LENGTH 2,
        "! Land1
        land_1 TYPE c LENGTH 3,
        "! Regio
        regio  TYPE c LENGTH 3,
        "! Counc
        counc  TYPE c LENGTH 3,
        "! Cityc
        cityc  TYPE c LENGTH 4,
        "! Bukrs
        bukrs  TYPE c LENGTH 4,
        "! Taxk1
        taxk_1 TYPE c LENGTH 1,
        "! Taxk2
        taxk_2 TYPE c LENGTH 1,
        "! Taxk3
        taxk_3 TYPE c LENGTH 1,
        "! Taxk4
        taxk_4 TYPE c LENGTH 1,
        "! Taxk5
        taxk_5 TYPE c LENGTH 1,
        "! Taxk6
        taxk_6 TYPE c LENGTH 1,
        "! Taxk7
        taxk_7 TYPE c LENGTH 1,
        "! Taxk8
        taxk_8 TYPE c LENGTH 1,
        "! Taxk9
        taxk_9 TYPE c LENGTH 1,
        "! Netwr
        netwr  TYPE p LENGTH 8 DECIMALS 3,
        "! Zukri
        zukri  TYPE c LENGTH 40,
        "! Ernam
        ernam  TYPE c LENGTH 12,
        "! Erzet
        erzet  TYPE timn,
        "! Erdat
        erdat  TYPE datn,
        "! Stafo
        stafo  TYPE c LENGTH 6,
        "! Kunrg
        kunrg  TYPE c LENGTH 10,
        "! Kunag
        kunag  TYPE c LENGTH 10,
        "! Maber
        maber  TYPE c LENGTH 2,
        "! Stwae
        stwae  TYPE c LENGTH 5,
        "! Stceg
        stceg  TYPE c LENGTH 20,
        "! Aedat
        aedat  TYPE datn,
        "! Sfakn
        sfakn  TYPE c LENGTH 10,
        "! Knuma
        knuma  TYPE c LENGTH 10,
        "! Fksto
        fksto  TYPE abap_bool,
      END OF tys_z_i_vbrktype,
      "! <p class="shorttext synchronized">List of Z_I_VBRKType</p>
      tyt_z_i_vbrktype TYPE STANDARD TABLE OF tys_z_i_vbrktype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_VBRPType</p>
      BEGIN OF tys_z_i_vbrptype,
        "! <em>Key property</em> Vbeln
        vbeln                 TYPE c LENGTH 10,
        "! <em>Key property</em> Posnr
        posnr                 TYPE c LENGTH 6,
        "! Uepos
        uepos                 TYPE c LENGTH 6,
        "! Fkimg
        fkimg                 TYPE p LENGTH 7 DECIMALS 3,
        "! Vrkme
        vrkme                 TYPE c LENGTH 3,
        "! Umvkz
        umvkz                 TYPE p LENGTH 3 DECIMALS 0,
        "! Umvkn
        umvkn                 TYPE p LENGTH 3 DECIMALS 0,
        "! Meins
        meins                 TYPE c LENGTH 3,
        "! Smeng
        smeng                 TYPE p LENGTH 7 DECIMALS 3,
        "! Fklmg
        fklmg                 TYPE p LENGTH 7 DECIMALS 3,
        "! Lmeng
        lmeng                 TYPE p LENGTH 7 DECIMALS 3,
        "! Ntgew
        ntgew                 TYPE p LENGTH 8 DECIMALS 3,
        "! Brgew
        brgew                 TYPE p LENGTH 8 DECIMALS 3,
        "! Gewei
        gewei                 TYPE c LENGTH 3,
        "! Volum
        volum                 TYPE p LENGTH 8 DECIMALS 3,
        "! Voleh
        voleh                 TYPE c LENGTH 3,
        "! Gsber
        gsber                 TYPE c LENGTH 4,
        "! Prsdt
        prsdt                 TYPE datn,
        "! Fbuda
        fbuda                 TYPE datn,
        "! Netwr
        netwr                 TYPE p LENGTH 8 DECIMALS 3,
        "! Vbelv
        vbelv                 TYPE c LENGTH 10,
        "! Posnv
        posnv                 TYPE c LENGTH 6,
        "! Vgbel
        vgbel                 TYPE c LENGTH 10,
        "! Vgpos
        vgpos                 TYPE c LENGTH 6,
        "! Vgtyp
        vgtyp                 TYPE c LENGTH 4,
        "! Aubel
        aubel                 TYPE c LENGTH 10,
        "! Aupos
        aupos                 TYPE c LENGTH 6,
        "! Auref
        auref                 TYPE abap_bool,
        "! Matnr
        matnr                 TYPE c LENGTH 18,
        "! Arktx
        arktx                 TYPE c LENGTH 40,
        "! Pmatn
        pmatn                 TYPE c LENGTH 18,
        "! Charg
        charg                 TYPE c LENGTH 10,
        "! Matkl
        matkl                 TYPE c LENGTH 9,
        "! Pstyv
        pstyv                 TYPE c LENGTH 4,
        "! Posar
        posar                 TYPE c LENGTH 1,
        "! Prodh
        prodh                 TYPE c LENGTH 18,
        "! Vstel
        vstel                 TYPE c LENGTH 4,
        "! Atpkz
        atpkz                 TYPE c LENGTH 1,
        "! Spart
        spart                 TYPE c LENGTH 2,
        "! Pospa
        pospa                 TYPE c LENGTH 6,
        "! Werks
        werks                 TYPE c LENGTH 4,
        "! Aland
        aland                 TYPE c LENGTH 3,
        "! Wkreg
        wkreg                 TYPE c LENGTH 3,
        "! Wkcou
        wkcou                 TYPE c LENGTH 3,
        "! Wkcty
        wkcty                 TYPE c LENGTH 4,
        "! Taxm1
        taxm_1                TYPE c LENGTH 1,
        "! Taxm2
        taxm_2                TYPE c LENGTH 1,
        "! Taxm3
        taxm_3                TYPE c LENGTH 1,
        "! Taxm4
        taxm_4                TYPE c LENGTH 1,
        "! Taxm5
        taxm_5                TYPE c LENGTH 1,
        "! Taxm6
        taxm_6                TYPE c LENGTH 1,
        "! Taxm7
        taxm_7                TYPE c LENGTH 1,
        "! Taxm8
        taxm_8                TYPE c LENGTH 1,
        "! Taxm9
        taxm_9                TYPE c LENGTH 1,
        "! Kowrr
        kowrr                 TYPE c LENGTH 1,
        "! Prsfd
        prsfd                 TYPE c LENGTH 1,
        "! Sktof
        sktof                 TYPE abap_bool,
        "! Skfbp
        skfbp                 TYPE p LENGTH 7 DECIMALS 3,
        "! Kondm
        kondm                 TYPE c LENGTH 2,
        "! Ktgrm
        ktgrm                 TYPE c LENGTH 2,
        "! Kostl
        kostl                 TYPE c LENGTH 10,
        "! Bonus
        bonus                 TYPE c LENGTH 2,
        "! Provg
        provg                 TYPE c LENGTH 2,
        "! Eannr
        eannr                 TYPE c LENGTH 13,
        "! Vkgrp
        vkgrp                 TYPE c LENGTH 3,
        "! Vkbur
        vkbur                 TYPE c LENGTH 4,
        "! Spara
        spara                 TYPE c LENGTH 2,
        "! Shkzg
        shkzg                 TYPE c LENGTH 1,
        "! Ernam
        ernam                 TYPE c LENGTH 12,
        "! Erdat
        erdat                 TYPE datn,
        "! Erzet
        erzet                 TYPE timn,
        "! Bwtar
        bwtar                 TYPE c LENGTH 10,
        "! Lgort
        lgort                 TYPE c LENGTH 4,
        "! Stafo
        stafo                 TYPE c LENGTH 6,
        "! Wavwr
        wavwr                 TYPE p LENGTH 7 DECIMALS 3,
        "! Kzwi1
        kzwi_1                TYPE p LENGTH 7 DECIMALS 3,
        "! Kzwi2
        kzwi_2                TYPE p LENGTH 7 DECIMALS 3,
        "! Kzwi3
        kzwi_3                TYPE p LENGTH 7 DECIMALS 3,
        "! Kzwi4
        kzwi_4                TYPE p LENGTH 7 DECIMALS 3,
        "! Kzwi5
        kzwi_5                TYPE p LENGTH 7 DECIMALS 3,
        "! Kzwi6
        kzwi_6                TYPE p LENGTH 7 DECIMALS 3,
        "! Uvprs
        uvprs                 TYPE abap_bool,
        "! Uvall
        uvall                 TYPE abap_bool,
        "! Ean11
        ean_11                TYPE c LENGTH 18,
        "! Prctr
        prctr                 TYPE c LENGTH 10,
        "! Kvgr1
        kvgr_1                TYPE c LENGTH 3,
        "! Kvgr2
        kvgr_2                TYPE c LENGTH 3,
        "! Kvgr3
        kvgr_3                TYPE c LENGTH 3,
        "! Kvgr4
        kvgr_4                TYPE c LENGTH 3,
        "! Kvgr5
        kvgr_5                TYPE c LENGTH 3,
        "! Mvgr1
        mvgr_1                TYPE c LENGTH 3,
        "! Mvgr2
        mvgr_2                TYPE c LENGTH 3,
        "! Mvgr3
        mvgr_3                TYPE c LENGTH 3,
        "! Mvgr4
        mvgr_4                TYPE c LENGTH 3,
        "! Mvgr5
        mvgr_5                TYPE c LENGTH 3,
        "! Matwa
        matwa                 TYPE c LENGTH 18,
        "! Bonba
        bonba                 TYPE p LENGTH 7 DECIMALS 3,
        "! Kokrs
        kokrs                 TYPE c LENGTH 4,
        "! Paobjnr
        paobjnr               TYPE c LENGTH 10,
        "! Aufnr
        aufnr                 TYPE c LENGTH 12,
        "! Txjcd
        txjcd                 TYPE c LENGTH 15,
        "! Cmpre
        cmpre                 TYPE p LENGTH 6 DECIMALS 3,
        "! Cmpnt
        cmpnt                 TYPE abap_bool,
        "! Cuobj
        cuobj                 TYPE c LENGTH 18,
        "! CuobjCh
        cuobj_ch              TYPE c LENGTH 18,
        "! Koupd
        koupd                 TYPE abap_bool,
        "! Uecha
        uecha                 TYPE c LENGTH 6,
        "! Xchar
        xchar                 TYPE abap_bool,
        "! BatchBillingVariant
        batch_billing_variant TYPE c LENGTH 1,
        "! Abrvw
        abrvw                 TYPE c LENGTH 3,
        "! Sernr
        sernr                 TYPE c LENGTH 8,
        "! BzirkAuft
        bzirk_auft            TYPE c LENGTH 6,
        "! KdgrpAuft
        kdgrp_auft            TYPE c LENGTH 2,
        "! KondaAuft
        konda_auft            TYPE c LENGTH 2,
        "! LlandAuft
        lland_auft            TYPE c LENGTH 3,
        "! Mprok
        mprok                 TYPE c LENGTH 1,
        "! PltypAuft
        pltyp_auft            TYPE c LENGTH 2,
        "! RegioAuft
        regio_auft            TYPE c LENGTH 3,
        "! VkorgAuft
        vkorg_auft            TYPE c LENGTH 4,
        "! VtwegAuft
        vtweg_auft            TYPE c LENGTH 2,
        "! Abrbg
        abrbg                 TYPE datn,
        "! Prosa
        prosa                 TYPE c LENGTH 1,
        "! Uepvw
        uepvw                 TYPE c LENGTH 1,
        "! Autyp
        autyp                 TYPE c LENGTH 4,
        "! Stadat
        stadat                TYPE datn,
        "! Fplnr
        fplnr                 TYPE c LENGTH 10,
        "! Fpltr
        fpltr                 TYPE c LENGTH 6,
        "! Aktnr
        aktnr                 TYPE c LENGTH 10,
        "! KnumaPi
        knuma_pi              TYPE c LENGTH 10,
        "! KnumaAg
        knuma_ag              TYPE c LENGTH 10,
        "! Mwsbp
        mwsbp                 TYPE p LENGTH 7 DECIMALS 3,
        "! AugruAuft
        augru_auft            TYPE c LENGTH 3,
        "! Fareg
        fareg                 TYPE c LENGTH 1,
        "! Upmat
        upmat                 TYPE c LENGTH 18,
        "! Ukonm
        ukonm                 TYPE c LENGTH 2,
        "! CmpreFlt
        cmpre_flt             TYPE /iwbep/v4_float,
        "! Abfor
        abfor                 TYPE c LENGTH 2,
        "! Abges
        abges                 TYPE /iwbep/v4_float,
        "! Waerk
        waerk                 TYPE c LENGTH 5,
      END OF tys_z_i_vbrptype,
      "! <p class="shorttext synchronized">List of Z_I_VBRPType</p>
      tyt_z_i_vbrptype TYPE STANDARD TABLE OF tys_z_i_vbrptype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_VTTK_LFA1Type</p>
      BEGIN OF tys_z_i_vttk_lfa_1_type,
        "! <em>Key property</em> Tknum
        tknum  TYPE c LENGTH 10,
        "! Tdlnr
        tdlnr  TYPE c LENGTH 10,
        "! Lifnr
        lifnr  TYPE c LENGTH 10,
        "! Name1
        name_1 TYPE c LENGTH 35,
      END OF tys_z_i_vttk_lfa_1_type,
      "! <p class="shorttext synchronized">List of Z_I_VTTK_LFA1Type</p>
      tyt_z_i_vttk_lfa_1_type TYPE STANDARD TABLE OF tys_z_i_vttk_lfa_1_type WITH DEFAULT KEY.


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
        "! Z_I_KNA1
        "! <br/> Collection of type 'Z_I_KNA1Type'
        z_i_kna_1                  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_KNA_1',
        "! Z_I_LIKP
        "! <br/> Collection of type 'Z_I_LIKPType'
        z_i_likp                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_LIKP',
        "! Z_I_LIPS
        "! <br/> Collection of type 'Z_I_LIPSType'
        z_i_lips                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_LIPS',
        "! Z_I_VBAK_KNVV
        "! <br/> Collection of type 'Z_I_VBAK_KNVVType'
        z_i_vbak_knvv              TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_VBAK_KNVV',
        "! Z_I_VBAP
        "! <br/> Collection of type 'Z_I_VBAPType'
        z_i_vbap                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_VBAP',
        "! Z_I_VBRK
        "! <br/> Collection of type 'Z_I_VBRKType'
        z_i_vbrk                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_VBRK',
        "! Z_I_VBRP
        "! <br/> Collection of type 'Z_I_VBRPType'
        z_i_vbrp                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_VBRP',
        "! Z_I_VTTK_LFA1
        "! <br/> Collection of type 'Z_I_VTTK_LFA1Type'
        z_i_vttk_lfa_1             TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_VTTK_LFA_1',
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
        "! <p class="shorttext synchronized">Internal names for Z_I_KNA1Type</p>
        "! See also structure type {@link ..tys_z_i_kna_1_type}
        BEGIN OF z_i_kna_1_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_kna_1_type,
        "! <p class="shorttext synchronized">Internal names for Z_I_LIKPType</p>
        "! See also structure type {@link ..tys_z_i_likptype}
        BEGIN OF z_i_likptype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_likptype,
        "! <p class="shorttext synchronized">Internal names for Z_I_LIPSType</p>
        "! See also structure type {@link ..tys_z_i_lipstype}
        BEGIN OF z_i_lipstype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_lipstype,
        "! <p class="shorttext synchronized">Internal names for Z_I_VBAK_KNVVType</p>
        "! See also structure type {@link ..tys_z_i_vbak_knvvtype}
        BEGIN OF z_i_vbak_knvvtype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_vbak_knvvtype,
        "! <p class="shorttext synchronized">Internal names for Z_I_VBAPType</p>
        "! See also structure type {@link ..tys_z_i_vbaptype}
        BEGIN OF z_i_vbaptype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_vbaptype,
        "! <p class="shorttext synchronized">Internal names for Z_I_VBRKType</p>
        "! See also structure type {@link ..tys_z_i_vbrktype}
        BEGIN OF z_i_vbrktype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_vbrktype,
        "! <p class="shorttext synchronized">Internal names for Z_I_VBRPType</p>
        "! See also structure type {@link ..tys_z_i_vbrptype}
        BEGIN OF z_i_vbrptype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_vbrptype,
        "! <p class="shorttext synchronized">Internal names for Z_I_VTTK_LFA1Type</p>
        "! See also structure type {@link ..tys_z_i_vttk_lfa_1_type}
        BEGIN OF z_i_vttk_lfa_1_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_vttk_lfa_1_type,
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

    "! <p class="shorttext synchronized">Define Z_I_KNA1Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_kna_1_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_LIKPType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_likptype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_LIPSType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_lipstype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_VBAK_KNVVType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_vbak_knvvtype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_VBAPType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_vbaptype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_VBRKType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_vbrktype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_VBRPType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_vbrptype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_VTTK_LFA1Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_vttk_lfa_1_type RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSCM_SALES_DOCUMENT_INFO IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'cds_zsd_sales_document_info' ) ##NO_TEXT.

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
    def_z_i_kna_1_type( ).
    def_z_i_likptype( ).
    def_z_i_lipstype( ).
    def_z_i_vbak_knvvtype( ).
    def_z_i_vbaptype( ).
    def_z_i_vbrktype( ).
    def_z_i_vbrptype( ).
    def_z_i_vttk_lfa_1_type( ).

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


  METHOD def_z_i_kna_1_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_KNA_1_TYPE'
                                    is_structure              = VALUE tys_z_i_kna_1_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_KNA1Type' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_KNA_1' ).
    lo_entity_set->set_edm_name( 'Z_I_KNA1' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUNNR' ).
    lo_primitive_property->set_edm_name( 'Kunnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAND_1' ).
    lo_primitive_property->set_edm_name( 'Land1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_1' ).
    lo_primitive_property->set_edm_name( 'Name1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_2' ).
    lo_primitive_property->set_edm_name( 'Name2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORT_01' ).
    lo_primitive_property->set_edm_name( 'Ort01' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSTLZ' ).
    lo_primitive_property->set_edm_name( 'Pstlz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REGIO' ).
    lo_primitive_property->set_edm_name( 'Regio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SORTL' ).
    lo_primitive_property->set_edm_name( 'Sortl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STRAS' ).
    lo_primitive_property->set_edm_name( 'Stras' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TELF_1' ).
    lo_primitive_property->set_edm_name( 'Telf1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TELFX' ).
    lo_primitive_property->set_edm_name( 'Telfx' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 31 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCPDK' ).
    lo_primitive_property->set_edm_name( 'Xcpdk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADRNR' ).
    lo_primitive_property->set_edm_name( 'Adrnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MCOD_1' ).
    lo_primitive_property->set_edm_name( 'Mcod1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MCOD_2' ).
    lo_primitive_property->set_edm_name( 'Mcod2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MCOD_3' ).
    lo_primitive_property->set_edm_name( 'Mcod3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANRED' ).
    lo_primitive_property->set_edm_name( 'Anred' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUFSD' ).
    lo_primitive_property->set_edm_name( 'Aufsd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BAHNE' ).
    lo_primitive_property->set_edm_name( 'Bahne' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BAHNS' ).
    lo_primitive_property->set_edm_name( 'Bahns' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BBBNR' ).
    lo_primitive_property->set_edm_name( 'Bbbnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BBSNR' ).
    lo_primitive_property->set_edm_name( 'Bbsnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BEGRU' ).
    lo_primitive_property->set_edm_name( 'Begru' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRSCH' ).
    lo_primitive_property->set_edm_name( 'Brsch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUBKZ' ).
    lo_primitive_property->set_edm_name( 'Bubkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATLT' ).
    lo_primitive_property->set_edm_name( 'Datlt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXABL' ).
    lo_primitive_property->set_edm_name( 'Exabl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAKSD' ).
    lo_primitive_property->set_edm_name( 'Faksd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISKN' ).
    lo_primitive_property->set_edm_name( 'Fiskn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNAZK' ).
    lo_primitive_property->set_edm_name( 'Knazk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNRZA' ).
    lo_primitive_property->set_edm_name( 'Knrza' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KONZS' ).
    lo_primitive_property->set_edm_name( 'Konzs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KTOKD' ).
    lo_primitive_property->set_edm_name( 'Ktokd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUKLA' ).
    lo_primitive_property->set_edm_name( 'Kukla' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFNR' ).
    lo_primitive_property->set_edm_name( 'Lifnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFSD' ).
    lo_primitive_property->set_edm_name( 'Lifsd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOCCO' ).
    lo_primitive_property->set_edm_name( 'Locco' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOEVM' ).
    lo_primitive_property->set_edm_name( 'Loevm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NIELS' ).
    lo_primitive_property->set_edm_name( 'Niels' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORT_02' ).
    lo_primitive_property->set_edm_name( 'Ort02' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PFACH' ).
    lo_primitive_property->set_edm_name( 'Pfach' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSTL_2' ).
    lo_primitive_property->set_edm_name( 'Pstl2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RPMKR' ).
    lo_primitive_property->set_edm_name( 'Rpmkr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPERR' ).
    lo_primitive_property->set_edm_name( 'Sperr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPRAS' ).
    lo_primitive_property->set_edm_name( 'Spras' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STCD_1' ).
    lo_primitive_property->set_edm_name( 'Stcd1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STCD_2' ).
    lo_primitive_property->set_edm_name( 'Stcd2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STKZA' ).
    lo_primitive_property->set_edm_name( 'Stkza' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STKZU' ).
    lo_primitive_property->set_edm_name( 'Stkzu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TELBX' ).
    lo_primitive_property->set_edm_name( 'Telbx' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TELF_2' ).
    lo_primitive_property->set_edm_name( 'Telf2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TELTX' ).
    lo_primitive_property->set_edm_name( 'Teltx' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TELX_1' ).
    lo_primitive_property->set_edm_name( 'Telx1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LZONE' ).
    lo_primitive_property->set_edm_name( 'Lzone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XZEMP' ).
    lo_primitive_property->set_edm_name( 'Xzemp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBUND' ).
    lo_primitive_property->set_edm_name( 'Vbund' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STCEG' ).
    lo_primitive_property->set_edm_name( 'Stceg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEAR_1' ).
    lo_primitive_property->set_edm_name( 'Dear1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEAR_2' ).
    lo_primitive_property->set_edm_name( 'Dear2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEAR_3' ).
    lo_primitive_property->set_edm_name( 'Dear3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEAR_4' ).
    lo_primitive_property->set_edm_name( 'Dear4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEAR_5' ).
    lo_primitive_property->set_edm_name( 'Dear5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GFORM' ).
    lo_primitive_property->set_edm_name( 'Gform' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRAN_1' ).
    lo_primitive_property->set_edm_name( 'Bran1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRAN_2' ).
    lo_primitive_property->set_edm_name( 'Bran2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRAN_3' ).
    lo_primitive_property->set_edm_name( 'Bran3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRAN_4' ).
    lo_primitive_property->set_edm_name( 'Bran4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRAN_5' ).
    lo_primitive_property->set_edm_name( 'Bran5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EKONT' ).
    lo_primitive_property->set_edm_name( 'Ekont' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMJAH' ).
    lo_primitive_property->set_edm_name( 'Umjah' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UWAER' ).
    lo_primitive_property->set_edm_name( 'Uwaer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JMZAH' ).
    lo_primitive_property->set_edm_name( 'Jmzah' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JMJAH' ).
    lo_primitive_property->set_edm_name( 'Jmjah' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KATR_1' ).
    lo_primitive_property->set_edm_name( 'Katr1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KATR_2' ).
    lo_primitive_property->set_edm_name( 'Katr2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KATR_3' ).
    lo_primitive_property->set_edm_name( 'Katr3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KATR_4' ).
    lo_primitive_property->set_edm_name( 'Katr4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KATR_5' ).
    lo_primitive_property->set_edm_name( 'Katr5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KATR_6' ).
    lo_primitive_property->set_edm_name( 'Katr6' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KATR_7' ).
    lo_primitive_property->set_edm_name( 'Katr7' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KATR_8' ).
    lo_primitive_property->set_edm_name( 'Katr8' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KATR_9' ).
    lo_primitive_property->set_edm_name( 'Katr9' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KATR_10' ).
    lo_primitive_property->set_edm_name( 'Katr10' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STKZN' ).
    lo_primitive_property->set_edm_name( 'Stkzn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXJCD' ).
    lo_primitive_property->set_edm_name( 'Txjcd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERIV' ).
    lo_primitive_property->set_edm_name( 'Periv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABRVW' ).
    lo_primitive_property->set_edm_name( 'Abrvw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INSPBYDEBI' ).
    lo_primitive_property->set_edm_name( 'Inspbydebi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INSPATDEBI' ).
    lo_primitive_property->set_edm_name( 'Inspatdebi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KTOCD' ).
    lo_primitive_property->set_edm_name( 'Ktocd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PFORT' ).
    lo_primitive_property->set_edm_name( 'Pfort' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WERKS' ).
    lo_primitive_property->set_edm_name( 'Werks' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DTAMS' ).
    lo_primitive_property->set_edm_name( 'Dtams' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DTAWS' ).
    lo_primitive_property->set_edm_name( 'Dtaws' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUEFL' ).
    lo_primitive_property->set_edm_name( 'Duefl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HZUOR' ).
    lo_primitive_property->set_edm_name( 'Hzuor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPERZ' ).
    lo_primitive_property->set_edm_name( 'Sperz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETIKG' ).
    lo_primitive_property->set_edm_name( 'Etikg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CIVVE' ).
    lo_primitive_property->set_edm_name( 'Civve' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MILVE' ).
    lo_primitive_property->set_edm_name( 'Milve' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KDKG_1' ).
    lo_primitive_property->set_edm_name( 'Kdkg1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KDKG_2' ).
    lo_primitive_property->set_edm_name( 'Kdkg2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KDKG_3' ).
    lo_primitive_property->set_edm_name( 'Kdkg3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KDKG_4' ).
    lo_primitive_property->set_edm_name( 'Kdkg4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KDKG_5' ).
    lo_primitive_property->set_edm_name( 'Kdkg5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XKNZA' ).
    lo_primitive_property->set_edm_name( 'Xknza' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FITYP' ).
    lo_primitive_property->set_edm_name( 'Fityp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STCDT' ).
    lo_primitive_property->set_edm_name( 'Stcdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STCD_3' ).
    lo_primitive_property->set_edm_name( 'Stcd3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STCD_4' ).
    lo_primitive_property->set_edm_name( 'Stcd4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STCD_5' ).
    lo_primitive_property->set_edm_name( 'Stcd5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STCD_6' ).
    lo_primitive_property->set_edm_name( 'Stcd6' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XICMS' ).
    lo_primitive_property->set_edm_name( 'Xicms' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XXIPI' ).
    lo_primitive_property->set_edm_name( 'Xxipi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XSUBT' ).
    lo_primitive_property->set_edm_name( 'Xsubt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CFOPC' ).
    lo_primitive_property->set_edm_name( 'Cfopc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXLW_1' ).
    lo_primitive_property->set_edm_name( 'Txlw1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXLW_2' ).
    lo_primitive_property->set_edm_name( 'Txlw2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CCC_01' ).
    lo_primitive_property->set_edm_name( 'Ccc01' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CCC_02' ).
    lo_primitive_property->set_edm_name( 'Ccc02' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CCC_03' ).
    lo_primitive_property->set_edm_name( 'Ccc03' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CCC_04' ).
    lo_primitive_property->set_edm_name( 'Ccc04' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BONDED_AREA_CONFIRM' ).
    lo_primitive_property->set_edm_name( 'BondedAreaConfirm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DONATE_MARK' ).
    lo_primitive_property->set_edm_name( 'DonateMark' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONSOLIDATE_INVOICE' ).
    lo_primitive_property->set_edm_name( 'ConsolidateInvoice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALLOWANCE_TYPE' ).
    lo_primitive_property->set_edm_name( 'AllowanceType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EINVOICE_MODE' ).
    lo_primitive_property->set_edm_name( 'EinvoiceMode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'B_2_C_INDICATOR' ).
    lo_primitive_property->set_edm_name( 'B2cIndicator' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CASSD' ).
    lo_primitive_property->set_edm_name( 'Cassd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNURL' ).
    lo_primitive_property->set_edm_name( 'Knurl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 132 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_KFREPRE' ).
    lo_primitive_property->set_edm_name( 'J1kfrepre' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_KFTBUS' ).
    lo_primitive_property->set_edm_name( 'J1kftbus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_KFTIND' ).
    lo_primitive_property->set_edm_name( 'J1kftind' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONFS' ).
    lo_primitive_property->set_edm_name( 'Confs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPDAT' ).
    lo_primitive_property->set_edm_name( 'Updat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPTIM' ).
    lo_primitive_property->set_edm_name( 'Uptim' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NODEL' ).
    lo_primitive_property->set_edm_name( 'Nodel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEAR_6' ).
    lo_primitive_property->set_edm_name( 'Dear6' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_DATE_RULE' ).
    lo_primitive_property->set_edm_name( 'DeliveryDateRule' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CVP_XBLCK' ).
    lo_primitive_property->set_edm_name( 'CvpXblck' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUFRAMA' ).
    lo_primitive_property->set_edm_name( 'Suframa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RG' ).
    lo_primitive_property->set_edm_name( 'Rg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXP' ).
    lo_primitive_property->set_edm_name( 'Exp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UF' ).
    lo_primitive_property->set_edm_name( 'Uf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RGDATE' ).
    lo_primitive_property->set_edm_name( 'Rgdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RIC' ).
    lo_primitive_property->set_edm_name( 'Ric' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RNE' ).
    lo_primitive_property->set_edm_name( 'Rne' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RNEDATE' ).
    lo_primitive_property->set_edm_name( 'Rnedate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CNAE' ).
    lo_primitive_property->set_edm_name( 'Cnae' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LEGALNAT' ).
    lo_primitive_property->set_edm_name( 'Legalnat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CRTN' ).
    lo_primitive_property->set_edm_name( 'Crtn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ICMSTAXPAY' ).
    lo_primitive_property->set_edm_name( 'Icmstaxpay' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INDTYP' ).
    lo_primitive_property->set_edm_name( 'Indtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TDT' ).
    lo_primitive_property->set_edm_name( 'Tdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMSIZE' ).
    lo_primitive_property->set_edm_name( 'Comsize' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DECREGPC' ).
    lo_primitive_property->set_edm_name( 'Decregpc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PH_BIZ_STYLE' ).
    lo_primitive_property->set_edm_name( 'PhBizStyle' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 140 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYTRSN' ).
    lo_primitive_property->set_edm_name( 'Paytrsn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNA_1_EEW_CUST' ).
    lo_primitive_property->set_edm_name( 'Kna1EewCust' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RULE_EXCLUSION' ).
    lo_primitive_property->set_edm_name( 'RuleExclusion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNA_1_ADDR_EEW_CUST' ).
    lo_primitive_property->set_edm_name( 'Kna1AddrEewCust' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XVSOXR_PAL_UL' ).
    lo_primitive_property->set_edm_name( 'xvsoxrPalUl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XVSOXR_PK_MAT' ).
    lo_primitive_property->set_edm_name( 'xvsoxrPkMat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XVSOXR_MATPAL' ).
    lo_primitive_property->set_edm_name( 'xvsoxrMatpal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XVSOXR_INO_LYR' ).
    lo_primitive_property->set_edm_name( 'xvsoxrINoLyr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XVSOXR_ONE_MAT' ).
    lo_primitive_property->set_edm_name( 'xvsoxrOneMat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XVSOXR_ONE_SORT' ).
    lo_primitive_property->set_edm_name( 'xvsoxrOneSort' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XVSOXR_ULD_SIDE' ).
    lo_primitive_property->set_edm_name( 'xvsoxrUldSide' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XVSOXR_LOAD_PREF' ).
    lo_primitive_property->set_edm_name( 'xvsoxrLoadPref' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XVSOXR_DPOINT' ).
    lo_primitive_property->set_edm_name( 'xvsoxrDpoint' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALC' ).
    lo_primitive_property->set_edm_name( 'Alc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PMT_OFFICE' ).
    lo_primitive_property->set_edm_name( 'PmtOffice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FEE_SCHEDULE' ).
    lo_primitive_property->set_edm_name( 'FeeSchedule' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUNS' ).
    lo_primitive_property->set_edm_name( 'Duns' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUNS_4' ).
    lo_primitive_property->set_edm_name( 'Duns4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAM_UE_ID' ).
    lo_primitive_property->set_edm_name( 'SamUeId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAM_EFT_IND' ).
    lo_primitive_property->set_edm_name( 'SamEftInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSOFG' ).
    lo_primitive_property->set_edm_name( 'Psofg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSOIS' ).
    lo_primitive_property->set_edm_name( 'Psois' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSON_1' ).
    lo_primitive_property->set_edm_name( 'Pson1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSON_2' ).
    lo_primitive_property->set_edm_name( 'Pson2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSON_3' ).
    lo_primitive_property->set_edm_name( 'Pson3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSOVN' ).
    lo_primitive_property->set_edm_name( 'Psovn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSOTL' ).
    lo_primitive_property->set_edm_name( 'Psotl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSOHS' ).
    lo_primitive_property->set_edm_name( 'Psohs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSOST' ).
    lo_primitive_property->set_edm_name( 'Psost' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 28 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSOO_1' ).
    lo_primitive_property->set_edm_name( 'Psoo1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSOO_2' ).
    lo_primitive_property->set_edm_name( 'Psoo2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSOO_3' ).
    lo_primitive_property->set_edm_name( 'Psoo3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSOO_4' ).
    lo_primitive_property->set_edm_name( 'Psoo4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSOO_5' ).
    lo_primitive_property->set_edm_name( 'Psoo5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_IEXCD' ).
    lo_primitive_property->set_edm_name( 'J1iexcd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_IEXRN' ).
    lo_primitive_property->set_edm_name( 'J1iexrn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_IEXRG' ).
    lo_primitive_property->set_edm_name( 'J1iexrg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_IEXDI' ).
    lo_primitive_property->set_edm_name( 'J1iexdi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_IEXCO' ).
    lo_primitive_property->set_edm_name( 'J1iexco' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_ICSTNO' ).
    lo_primitive_property->set_edm_name( 'J1icstno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_ILSTNO' ).
    lo_primitive_property->set_edm_name( 'J1ilstno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_IPANNO' ).
    lo_primitive_property->set_edm_name( 'J1ipanno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_IEXCICU' ).
    lo_primitive_property->set_edm_name( 'J1iexcicu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AEDAT' ).
    lo_primitive_property->set_edm_name( 'Aedat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'USNAM' ).
    lo_primitive_property->set_edm_name( 'Usnam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_ISERN' ).
    lo_primitive_property->set_edm_name( 'J1isern' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_IPANREF' ).
    lo_primitive_property->set_edm_name( 'J1ipanref' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GST_TDS' ).
    lo_primitive_property->set_edm_name( 'GstTds' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GETYP' ).
    lo_primitive_property->set_edm_name( 'J3getyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GREFTYP' ).
    lo_primitive_property->set_edm_name( 'J3greftyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COAUFNR' ).
    lo_primitive_property->set_edm_name( 'Coaufnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GAGEXT' ).
    lo_primitive_property->set_edm_name( 'J3gagext' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GAGINT' ).
    lo_primitive_property->set_edm_name( 'J3gagint' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GAGDUMI' ).
    lo_primitive_property->set_edm_name( 'J3gagdumi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GAGSTDI' ).
    lo_primitive_property->set_edm_name( 'J3gagstdi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGORT' ).
    lo_primitive_property->set_edm_name( 'Lgort' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOKRS' ).
    lo_primitive_property->set_edm_name( 'Kokrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOSTL' ).
    lo_primitive_property->set_edm_name( 'Kostl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GABGLG' ).
    lo_primitive_property->set_edm_name( 'J3gabglg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GABGVG' ).
    lo_primitive_property->set_edm_name( 'J3gabgvg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GABRART' ).
    lo_primitive_property->set_edm_name( 'J3gabrart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GSTDMON' ).
    lo_primitive_property->set_edm_name( 'J3gstdmon' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GSTDTAG' ).
    lo_primitive_property->set_edm_name( 'J3gstdtag' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GTAGMON' ).
    lo_primitive_property->set_edm_name( 'J3gtagmon' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GZUGTAG' ).
    lo_primitive_property->set_edm_name( 'J3gzugtag' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GMASCHB' ).
    lo_primitive_property->set_edm_name( 'J3gmaschb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GMEINSA' ).
    lo_primitive_property->set_edm_name( 'J3gmeinsa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GKEINSA' ).
    lo_primitive_property->set_edm_name( 'J3gkeinsa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GBLSPER' ).
    lo_primitive_property->set_edm_name( 'J3gblsper' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GKLEIVO' ).
    lo_primitive_property->set_edm_name( 'J3gkleivo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GCALID' ).
    lo_primitive_property->set_edm_name( 'J3gcalid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GVMONAT' ).
    lo_primitive_property->set_edm_name( 'J3gvmonat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GABRKEN' ).
    lo_primitive_property->set_edm_name( 'J3gabrken' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GLABRECH' ).
    lo_primitive_property->set_edm_name( 'J3glabrech' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GAABRECH' ).
    lo_primitive_property->set_edm_name( 'J3gaabrech' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GZUTVHLG' ).
    lo_primitive_property->set_edm_name( 'J3gzutvhlg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GNEGMEN' ).
    lo_primitive_property->set_edm_name( 'J3gnegmen' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GFRISTLO' ).
    lo_primitive_property->set_edm_name( 'J3gfristlo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GEMINBE' ).
    lo_primitive_property->set_edm_name( 'J3geminbe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GFMGUE' ).
    lo_primitive_property->set_edm_name( 'J3gfmgue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GZUSCHUE' ).
    lo_primitive_property->set_edm_name( 'J3gzuschue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GSCHPRS' ).
    lo_primitive_property->set_edm_name( 'J3gschprs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_3_GINVSTA' ).
    lo_primitive_property->set_edm_name( 'J3ginvsta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XSAPCEMXDBER' ).
    lo_primitive_property->set_edm_name( 'xsapcemxdber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XSAPCEMXKVMEQ' ).
    lo_primitive_property->set_edm_name( 'xsapcemxkvmeq' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_likptype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_LIKPTYPE'
                                    is_structure              = VALUE tys_z_i_likptype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_LIKPType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_LIKP' ).
    lo_entity_set->set_edm_name( 'Z_I_LIKP' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELN' ).
    lo_primitive_property->set_edm_name( 'Vbeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERNAM' ).
    lo_primitive_property->set_edm_name( 'Ernam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERZET' ).
    lo_primitive_property->set_edm_name( 'Erzet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERDAT' ).
    lo_primitive_property->set_edm_name( 'Erdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BZIRK' ).
    lo_primitive_property->set_edm_name( 'Bzirk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSTEL' ).
    lo_primitive_property->set_edm_name( 'Vstel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VKORG' ).
    lo_primitive_property->set_edm_name( 'Vkorg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFART' ).
    lo_primitive_property->set_edm_name( 'Lfart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUTLF' ).
    lo_primitive_property->set_edm_name( 'Autlf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZAZU' ).
    lo_primitive_property->set_edm_name( 'Kzazu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WADAT' ).
    lo_primitive_property->set_edm_name( 'Wadat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LDDAT' ).
    lo_primitive_property->set_edm_name( 'Lddat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TDDAT' ).
    lo_primitive_property->set_edm_name( 'Tddat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFDAT' ).
    lo_primitive_property->set_edm_name( 'Lfdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KODAT' ).
    lo_primitive_property->set_edm_name( 'Kodat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABLAD' ).
    lo_primitive_property->set_edm_name( 'Ablad' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXPKZ' ).
    lo_primitive_property->set_edm_name( 'Expkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROUTE' ).
    lo_primitive_property->set_edm_name( 'Route' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAKSK' ).
    lo_primitive_property->set_edm_name( 'Faksk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFSK' ).
    lo_primitive_property->set_edm_name( 'Lifsk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBTYP' ).
    lo_primitive_property->set_edm_name( 'Vbtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNFAK' ).
    lo_primitive_property->set_edm_name( 'Knfak' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TPQUA' ).
    lo_primitive_property->set_edm_name( 'Tpqua' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TPGRP' ).
    lo_primitive_property->set_edm_name( 'Tpgrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LPRIO' ).
    lo_primitive_property->set_edm_name( 'Lprio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSBED' ).
    lo_primitive_property->set_edm_name( 'Vsbed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUNNR' ).
    lo_primitive_property->set_edm_name( 'Kunnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUNAG' ).
    lo_primitive_property->set_edm_name( 'Kunag' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KDGRP' ).
    lo_primitive_property->set_edm_name( 'Kdgrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STZKL' ).
    lo_primitive_property->set_edm_name( 'Stzkl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STZZU' ).
    lo_primitive_property->set_edm_name( 'Stzzu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BTGEW' ).
    lo_primitive_property->set_edm_name( 'Btgew' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NTGEW' ).
    lo_primitive_property->set_edm_name( 'Ntgew' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GEWEI' ).
    lo_primitive_property->set_edm_name( 'Gewei' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLUM' ).
    lo_primitive_property->set_edm_name( 'Volum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLEH' ).
    lo_primitive_property->set_edm_name( 'Voleh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANZPK' ).
    lo_primitive_property->set_edm_name( 'Anzpk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BEROT' ).
    lo_primitive_property->set_edm_name( 'Berot' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFUHR' ).
    lo_primitive_property->set_edm_name( 'Lfuhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRULG' ).
    lo_primitive_property->set_edm_name( 'Grulg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LSTEL' ).
    lo_primitive_property->set_edm_name( 'Lstel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRAGR' ).
    lo_primitive_property->set_edm_name( 'Tragr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKARV' ).
    lo_primitive_property->set_edm_name( 'Fkarv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKDAT' ).
    lo_primitive_property->set_edm_name( 'Fkdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERFK' ).
    lo_primitive_property->set_edm_name( 'Perfk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROUTA' ).
    lo_primitive_property->set_edm_name( 'Routa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STAFO' ).
    lo_primitive_property->set_edm_name( 'Stafo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KALSM' ).
    lo_primitive_property->set_edm_name( 'Kalsm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNUMV' ).
    lo_primitive_property->set_edm_name( 'Knumv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAERK' ).
    lo_primitive_property->set_edm_name( 'Waerk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VKBUR' ).
    lo_primitive_property->set_edm_name( 'Vkbur' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBEAK' ).
    lo_primitive_property->set_edm_name( 'Vbeak' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZUKRL' ).
    lo_primitive_property->set_edm_name( 'Zukrl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VERUR' ).
    lo_primitive_property->set_edm_name( 'Verur' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMMN' ).
    lo_primitive_property->set_edm_name( 'Commn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STWAE' ).
    lo_primitive_property->set_edm_name( 'Stwae' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXNUM' ).
    lo_primitive_property->set_edm_name( 'Exnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AENAM' ).
    lo_primitive_property->set_edm_name( 'Aenam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AEDAT' ).
    lo_primitive_property->set_edm_name( 'Aedat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGNUM' ).
    lo_primitive_property->set_edm_name( 'Lgnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LISPL' ).
    lo_primitive_property->set_edm_name( 'Lispl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VKOIV' ).
    lo_primitive_property->set_edm_name( 'Vkoiv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VTWIV' ).
    lo_primitive_property->set_edm_name( 'Vtwiv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPAIV' ).
    lo_primitive_property->set_edm_name( 'Spaiv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKAIV' ).
    lo_primitive_property->set_edm_name( 'Fkaiv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PIOIV' ).
    lo_primitive_property->set_edm_name( 'Pioiv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKDIV' ).
    lo_primitive_property->set_edm_name( 'Fkdiv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUNIV' ).
    lo_primitive_property->set_edm_name( 'Kuniv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KKBER' ).
    lo_primitive_property->set_edm_name( 'Kkber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNKLI' ).
    lo_primitive_property->set_edm_name( 'Knkli' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRUPP' ).
    lo_primitive_property->set_edm_name( 'Grupp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SBGRP' ).
    lo_primitive_property->set_edm_name( 'Sbgrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CTLPC' ).
    lo_primitive_property->set_edm_name( 'Ctlpc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMWAE' ).
    lo_primitive_property->set_edm_name( 'Cmwae' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AMTBL' ).
    lo_primitive_property->set_edm_name( 'Amtbl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOLNR' ).
    lo_primitive_property->set_edm_name( 'Bolnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFNR' ).
    lo_primitive_property->set_edm_name( 'Lifnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRATY' ).
    lo_primitive_property->set_edm_name( 'Traty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRAID' ).
    lo_primitive_property->set_edm_name( 'Traid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMFRE' ).
    lo_primitive_property->set_edm_name( 'Cmfre' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMNGV' ).
    lo_primitive_property->set_edm_name( 'Cmngv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XABLN' ).
    lo_primitive_property->set_edm_name( 'Xabln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLDAT' ).
    lo_primitive_property->set_edm_name( 'Bldat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WADAT_IST' ).
    lo_primitive_property->set_edm_name( 'WadatIst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRSPG' ).
    lo_primitive_property->set_edm_name( 'Trspg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TPSID' ).
    lo_primitive_property->set_edm_name( 'Tpsid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFEX' ).
    lo_primitive_property->set_edm_name( 'Lifex' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TERNR' ).
    lo_primitive_property->set_edm_name( 'Ternr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KALSM_CH' ).
    lo_primitive_property->set_edm_name( 'KalsmCh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KLIEF' ).
    lo_primitive_property->set_edm_name( 'Klief' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KALSP' ).
    lo_primitive_property->set_edm_name( 'Kalsp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNUMP' ).
    lo_primitive_property->set_edm_name( 'Knump' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETWR' ).
    lo_primitive_property->set_edm_name( 'Netwr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AULWE' ).
    lo_primitive_property->set_edm_name( 'Aulwe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WERKS' ).
    lo_primitive_property->set_edm_name( 'Werks' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LCNUM' ).
    lo_primitive_property->set_edm_name( 'Lcnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABSSC' ).
    lo_primitive_property->set_edm_name( 'Abssc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOUHR' ).
    lo_primitive_property->set_edm_name( 'Kouhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TDUHR' ).
    lo_primitive_property->set_edm_name( 'Tduhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LDUHR' ).
    lo_primitive_property->set_edm_name( 'Lduhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAUHR' ).
    lo_primitive_property->set_edm_name( 'Wauhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGTOR' ).
    lo_primitive_property->set_edm_name( 'Lgtor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGBZO' ).
    lo_primitive_property->set_edm_name( 'Lgbzo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AKWAE' ).
    lo_primitive_property->set_edm_name( 'Akwae' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AKPRZ' ).
    lo_primitive_property->set_edm_name( 'Akprz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROLI' ).
    lo_primitive_property->set_edm_name( 'Proli' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBLNR' ).
    lo_primitive_property->set_edm_name( 'Xblnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HANDLE' ).
    lo_primitive_property->set_edm_name( 'Handle' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TSEGFL' ).
    lo_primitive_property->set_edm_name( 'Tsegfl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TZONIS' ).
    lo_primitive_property->set_edm_name( 'Tzonis' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TZONRC' ).
    lo_primitive_property->set_edm_name( 'Tzonrc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONT_DG' ).
    lo_primitive_property->set_edm_name( 'ContDg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VERURSYS' ).
    lo_primitive_property->set_edm_name( 'Verursys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZWAB' ).
    lo_primitive_property->set_edm_name( 'Kzwab' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TCODE' ).
    lo_primitive_property->set_edm_name( 'Tcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSART' ).
    lo_primitive_property->set_edm_name( 'Vsart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRMTYP' ).
    lo_primitive_property->set_edm_name( 'Trmtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDABW' ).
    lo_primitive_property->set_edm_name( 'Sdabw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBUND' ).
    lo_primitive_property->set_edm_name( 'Vbund' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XWOFF' ).
    lo_primitive_property->set_edm_name( 'Xwoff' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DIRTA' ).
    lo_primitive_property->set_edm_name( 'Dirta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRVBE' ).
    lo_primitive_property->set_edm_name( 'Prvbe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FOLAR' ).
    lo_primitive_property->set_edm_name( 'Folar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PODAT' ).
    lo_primitive_property->set_edm_name( 'Podat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POTIM' ).
    lo_primitive_property->set_edm_name( 'Potim' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGANZ' ).
    lo_primitive_property->set_edm_name( 'Vganz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IMWRK' ).
    lo_primitive_property->set_edm_name( 'Imwrk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_LOEKZ' ).
    lo_primitive_property->set_edm_name( 'SpeLoekz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_LOC_SEQ' ).
    lo_primitive_property->set_edm_name( 'SpeLocSeq' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_ACC_APP_STS' ).
    lo_primitive_property->set_edm_name( 'SpeAccAppSts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_SHP_INF_STS' ).
    lo_primitive_property->set_edm_name( 'SpeShpInfSts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_RET_CANC' ).
    lo_primitive_property->set_edm_name( 'SpeRetCanc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_WAUHR_IST' ).
    lo_primitive_property->set_edm_name( 'SpeWauhrIst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_WAZONE_IST' ).
    lo_primitive_property->set_edm_name( 'SpeWazoneIst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_REV_VLSTK' ).
    lo_primitive_property->set_edm_name( 'SpeRevVlstk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_LE_SCENARIO' ).
    lo_primitive_property->set_edm_name( 'SpeLeScenario' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_ORIG_SYS' ).
    lo_primitive_property->set_edm_name( 'SpeOrigSys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_CHNG_SYS' ).
    lo_primitive_property->set_edm_name( 'SpeChngSys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_GEOROUTE' ).
    lo_primitive_property->set_edm_name( 'SpeGeoroute' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_GEOROUTEIND' ).
    lo_primitive_property->set_edm_name( 'SpeGeorouteind' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_CARRIER_IND' ).
    lo_primitive_property->set_edm_name( 'SpeCarrierInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_GTS_REL' ).
    lo_primitive_property->set_edm_name( 'SpeGtsRel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_GTS_RT_CDE' ).
    lo_primitive_property->set_edm_name( 'SpeGtsRtCde' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_REL_TMSTMP' ).
    lo_primitive_property->set_edm_name( 'SpeRelTmstmp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_UNIT_SYSTEM' ).
    lo_primitive_property->set_edm_name( 'SpeUnitSystem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_INV_BFR_GI' ).
    lo_primitive_property->set_edm_name( 'SpeInvBfrGi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_QI_STATUS' ).
    lo_primitive_property->set_edm_name( 'SpeQiStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_RED_IND' ).
    lo_primitive_property->set_edm_name( 'SpeRedInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAKES' ).
    lo_primitive_property->set_edm_name( 'Sakes' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_LIFEX_TYPE' ).
    lo_primitive_property->set_edm_name( 'SpeLifexType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_TTYPE' ).
    lo_primitive_property->set_edm_name( 'SpeTtype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_PRO_NUMBER' ).
    lo_primitive_property->set_edm_name( 'SpeProNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOC_GUID' ).
    lo_primitive_property->set_edm_name( 'LocGuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_BILLING_IND' ).
    lo_primitive_property->set_edm_name( 'SpeBillingInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRINTER_PROFILE' ).
    lo_primitive_property->set_edm_name( 'PrinterProfile' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSR_ACTIVE' ).
    lo_primitive_property->set_edm_name( 'MsrActive' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRTNR' ).
    lo_primitive_property->set_edm_name( 'Prtnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STGE_LOC_CHANGE' ).
    lo_primitive_property->set_edm_name( 'StgeLocChange' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TM_CTRL_KEY' ).
    lo_primitive_property->set_edm_name( 'TmCtrlKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DLV_SPLIT_INITIA' ).
    lo_primitive_property->set_edm_name( 'DlvSplitInitia' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DLV_VERSION' ).
    lo_primitive_property->set_edm_name( 'DlvVersion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATAAGING' ).
    lo_primitive_property->set_edm_name( 'Dataaging' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GTS_VORPA' ).
    lo_primitive_property->set_edm_name( 'GtsVorpa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GTS_VORNU' ).
    lo_primitive_property->set_edm_name( 'GtsVornu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GTS_EXPVZ' ).
    lo_primitive_property->set_edm_name( 'GtsExpvz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GTS_PORTI' ).
    lo_primitive_property->set_edm_name( 'GtsPorti' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITM_EXPVZ' ).
    lo_primitive_property->set_edm_name( 'ItmExpvz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITM_STGBE' ).
    lo_primitive_property->set_edm_name( 'ItmStgbe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITM_KZGBE' ).
    lo_primitive_property->set_edm_name( 'ItmKzgbe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITM_VYGID' ).
    lo_primitive_property->set_edm_name( 'ItmVygid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITM_IEVER' ).
    lo_primitive_property->set_edm_name( 'ItmIever' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITM_STABE' ).
    lo_primitive_property->set_edm_name( 'ItmStabe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITM_KZABE' ).
    lo_primitive_property->set_edm_name( 'ItmKzabe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HANDOVERLOC' ).
    lo_primitive_property->set_edm_name( 'Handoverloc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HANDOVERTZONE' ).
    lo_primitive_property->set_edm_name( 'Handovertzone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BESTK' ).
    lo_primitive_property->set_edm_name( 'Bestk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMPSC' ).
    lo_primitive_property->set_edm_name( 'Cmpsc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMPSD' ).
    lo_primitive_property->set_edm_name( 'Cmpsd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMPSI' ).
    lo_primitive_property->set_edm_name( 'Cmpsi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMPSJ' ).
    lo_primitive_property->set_edm_name( 'Cmpsj' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMPSK' ).
    lo_primitive_property->set_edm_name( 'Cmpsk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMPS_CM' ).
    lo_primitive_property->set_edm_name( 'CmpsCm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMPS_TE' ).
    lo_primitive_property->set_edm_name( 'CmpsTe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMGST' ).
    lo_primitive_property->set_edm_name( 'Cmgst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKIVK' ).
    lo_primitive_property->set_edm_name( 'Fkivk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKSTK' ).
    lo_primitive_property->set_edm_name( 'Fkstk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GBSTK' ).
    lo_primitive_property->set_edm_name( 'Gbstk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HDALL' ).
    lo_primitive_property->set_edm_name( 'Hdall' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HDALS' ).
    lo_primitive_property->set_edm_name( 'Hdals' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOQUK' ).
    lo_primitive_property->set_edm_name( 'Koquk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOSTK' ).
    lo_primitive_property->set_edm_name( 'Kostk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOSTK_WH' ).
    lo_primitive_property->set_edm_name( 'KostkWh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LVSTK' ).
    lo_primitive_property->set_edm_name( 'Lvstk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PDSTK' ).
    lo_primitive_property->set_edm_name( 'Pdstk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PKSTK' ).
    lo_primitive_property->set_edm_name( 'Pkstk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_TMPID' ).
    lo_primitive_property->set_edm_name( 'SpeTmpid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPSTG' ).
    lo_primitive_property->set_edm_name( 'Spstg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRSTA' ).
    lo_primitive_property->set_edm_name( 'Trsta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVALL' ).
    lo_primitive_property->set_edm_name( 'Uvall' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVALS' ).
    lo_primitive_property->set_edm_name( 'Uvals' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVFAK' ).
    lo_primitive_property->set_edm_name( 'Uvfak' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVFAS' ).
    lo_primitive_property->set_edm_name( 'Uvfas' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVPAK' ).
    lo_primitive_property->set_edm_name( 'Uvpak' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVPAS' ).
    lo_primitive_property->set_edm_name( 'Uvpas' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVPIK' ).
    lo_primitive_property->set_edm_name( 'Uvpik' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVPIS' ).
    lo_primitive_property->set_edm_name( 'Uvpis' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVVLK' ).
    lo_primitive_property->set_edm_name( 'Uvvlk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVVLS' ).
    lo_primitive_property->set_edm_name( 'Uvvls' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVWAK' ).
    lo_primitive_property->set_edm_name( 'Uvwak' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVWAS' ).
    lo_primitive_property->set_edm_name( 'Uvwas' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VESTK' ).
    lo_primitive_property->set_edm_name( 'Vestk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VLSTK' ).
    lo_primitive_property->set_edm_name( 'Vlstk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WBSTK' ).
    lo_primitive_property->set_edm_name( 'Wbstk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVK_01' ).
    lo_primitive_property->set_edm_name( 'Uvk01' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVK_02' ).
    lo_primitive_property->set_edm_name( 'Uvk02' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVK_03' ).
    lo_primitive_property->set_edm_name( 'Uvk03' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVK_04' ).
    lo_primitive_property->set_edm_name( 'Uvk04' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVK_05' ).
    lo_primitive_property->set_edm_name( 'Uvk05' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVS_01' ).
    lo_primitive_property->set_edm_name( 'Uvs01' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVS_02' ).
    lo_primitive_property->set_edm_name( 'Uvs02' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVS_03' ).
    lo_primitive_property->set_edm_name( 'Uvs03' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVS_04' ).
    lo_primitive_property->set_edm_name( 'Uvs04' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVS_05' ).
    lo_primitive_property->set_edm_name( 'Uvs05' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOTAL_PCSTA' ).
    lo_primitive_property->set_edm_name( 'TotalPcsta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOTAL_DGSTA' ).
    lo_primitive_property->set_edm_name( 'TotalDgsta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOTAL_SDSSTA' ).
    lo_primitive_property->set_edm_name( 'TotalSdssta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOTAL_ARC_STATUS' ).
    lo_primitive_property->set_edm_name( 'TotalArcStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ICO_FKIVK' ).
    lo_primitive_property->set_edm_name( 'IcoFkivk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOTAL_EMCST' ).
    lo_primitive_property->set_edm_name( 'TotalEmcst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOTAL_SLCST' ).
    lo_primitive_property->set_edm_name( 'TotalSlcst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOTAL_LCCST' ).
    lo_primitive_property->set_edm_name( 'TotalLccst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XSAPMPXLBASK' ).
    lo_primitive_property->set_edm_name( 'xsapmpxlbask' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OID_EXTBOL' ).
    lo_primitive_property->set_edm_name( 'OidExtbol' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OID_MISCDL' ).
    lo_primitive_property->set_edm_name( 'OidMiscdl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_BUS_SYST_ID' ).
    lo_primitive_property->set_edm_name( 'ExtBusSystId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SITKZ_DB' ).
    lo_primitive_property->set_edm_name( 'SitkzDb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TM_ADV_SHIP_RECV' ).
    lo_primitive_property->set_edm_name( 'TmAdvShipRecv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TM_WHSE_EXEC' ).
    lo_primitive_property->set_edm_name( 'TmWhseExec' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TM_WHSE_BLOCK' ).
    lo_primitive_property->set_edm_name( 'TmWhseBlock' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGLC_LIC_IND' ).
    lo_primitive_property->set_edm_name( 'LglcLicInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATION_TS' ).
    lo_primitive_property->set_edm_name( 'CreationTs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHANGED_TS' ).
    lo_primitive_property->set_edm_name( 'ChangedTs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORR_IND' ).
    lo_primitive_property->set_edm_name( 'CorrInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUMMY_DELIVERY_INCL_EEW_PS' ).
    lo_primitive_property->set_edm_name( 'DummyDeliveryInclEewPs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBEV_1_XLULEINH' ).
    lo_primitive_property->set_edm_name( 'xbev1xluleinh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBEV_1_XRPFAESS' ).
    lo_primitive_property->set_edm_name( 'xbev1xrpfaess' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBEV_1_XRPKIST' ).
    lo_primitive_property->set_edm_name( 'xbev1xrpkist' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBEV_1_XRPCONT' ).
    lo_primitive_property->set_edm_name( 'xbev1xrpcont' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBEV_1_XRPSONST' ).
    lo_primitive_property->set_edm_name( 'xbev1xrpsonst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBEV_1_XRPFLGNR' ).
    lo_primitive_property->set_edm_name( 'xbev1xrpflgnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDT_CUR_EVTLOC' ).
    lo_primitive_property->set_edm_name( 'IdtCurEvtloc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDT_CUR_EVTQUA' ).
    lo_primitive_property->set_edm_name( 'IdtCurEvtqua' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDT_CUR_EVTTST' ).
    lo_primitive_property->set_edm_name( 'IdtCurEvttst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDT_CUR_ESTLOC' ).
    lo_primitive_property->set_edm_name( 'IdtCurEstloc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDT_CUR_ESTQUA' ).
    lo_primitive_property->set_edm_name( 'IdtCurEstqua' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDT_CUR_ESTTST' ).
    lo_primitive_property->set_edm_name( 'IdtCurEsttst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDT_CUR_WRKQUA' ).
    lo_primitive_property->set_edm_name( 'IdtCurWrkqua' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDT_PRE_EVTLOC' ).
    lo_primitive_property->set_edm_name( 'IdtPreEvtloc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDT_PRE_EVTQUA' ).
    lo_primitive_property->set_edm_name( 'IdtPreEvtqua' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDT_PRE_EVTTST' ).
    lo_primitive_property->set_edm_name( 'IdtPreEvttst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDT_PRE_ESTLOC' ).
    lo_primitive_property->set_edm_name( 'IdtPreEstloc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDT_PRE_ESTQUA' ).
    lo_primitive_property->set_edm_name( 'IdtPreEstqua' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDT_PRE_ESTTST' ).
    lo_primitive_property->set_edm_name( 'IdtPreEsttst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDT_PRE_WRKQUA' ).
    lo_primitive_property->set_edm_name( 'IdtPreWrkqua' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDT_REF_ESTLOC' ).
    lo_primitive_property->set_edm_name( 'IdtRefEstloc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDT_REF_ESTQUA' ).
    lo_primitive_property->set_edm_name( 'IdtRefEstqua' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDT_REF_ESTTST' ).
    lo_primitive_property->set_edm_name( 'IdtRefEsttst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDT_FIRM_LFDAT' ).
    lo_primitive_property->set_edm_name( 'IdtFirmLfdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDT_DOCNUM' ).
    lo_primitive_property->set_edm_name( 'IdtDocnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BORGR_GRP' ).
    lo_primitive_property->set_edm_name( 'BorgrGrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KBNKZ' ).
    lo_primitive_property->set_edm_name( 'Kbnkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_TRANSACTION' ).
    lo_primitive_property->set_edm_name( 'FshTransaction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_VAS_LAST_ITEM' ).
    lo_primitive_property->set_edm_name( 'FshVasLastItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_VAS_CG' ).
    lo_primitive_property->set_edm_name( 'FshVasCg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFM_PSST_GROUP' ).
    lo_primitive_property->set_edm_name( 'RfmPsstGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_ACT_DATE_TOCD' ).
    lo_primitive_property->set_edm_name( 'ExtActDateTocd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_PLAN_DATE_TOCD' ).
    lo_primitive_property->set_edm_name( 'ExtPlanDateTocd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_TZONE_TOCD' ).
    lo_primitive_property->set_edm_name( 'ExtTzoneTocd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INT_ACT_DATE_TOCD' ).
    lo_primitive_property->set_edm_name( 'IntActDateTocd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INT_PLAN_DATE_TOCD' ).
    lo_primitive_property->set_edm_name( 'IntPlanDateTocd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INT_TZONE_TOCD' ).
    lo_primitive_property->set_edm_name( 'IntTzoneTocd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JIT_RLVNT' ).
    lo_primitive_property->set_edm_name( 'JitRlvnt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_lipstype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_LIPSTYPE'
                                    is_structure              = VALUE tys_z_i_lipstype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_LIPSType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_LIPS' ).
    lo_entity_set->set_edm_name( 'Z_I_LIPS' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELN' ).
    lo_primitive_property->set_edm_name( 'Vbeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSNR' ).
    lo_primitive_property->set_edm_name( 'Posnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSTYV' ).
    lo_primitive_property->set_edm_name( 'Pstyv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERNAM' ).
    lo_primitive_property->set_edm_name( 'Ernam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERZET' ).
    lo_primitive_property->set_edm_name( 'Erzet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERDAT' ).
    lo_primitive_property->set_edm_name( 'Erdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATNR' ).
    lo_primitive_property->set_edm_name( 'Matnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATWA' ).
    lo_primitive_property->set_edm_name( 'Matwa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATKL' ).
    lo_primitive_property->set_edm_name( 'Matkl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 9 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHARG' ).
    lo_primitive_property->set_edm_name( 'Charg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LICHN' ).
    lo_primitive_property->set_edm_name( 'Lichn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KDMAT' ).
    lo_primitive_property->set_edm_name( 'Kdmat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODH' ).
    lo_primitive_property->set_edm_name( 'Prodh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRDH_UNI_BATDET_PARNT_NODI' ).
    lo_primitive_property->set_edm_name( 'PrdhUniBatdetParntNodid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFIMG' ).
    lo_primitive_property->set_edm_name( 'Lfimg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEINS' ).
    lo_primitive_property->set_edm_name( 'Meins' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VRKME' ).
    lo_primitive_property->set_edm_name( 'Vrkme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMVKZ' ).
    lo_primitive_property->set_edm_name( 'Umvkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMVKN' ).
    lo_primitive_property->set_edm_name( 'Umvkn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NTGEW' ).
    lo_primitive_property->set_edm_name( 'Ntgew' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRGEW' ).
    lo_primitive_property->set_edm_name( 'Brgew' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GEWEI' ).
    lo_primitive_property->set_edm_name( 'Gewei' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLUM' ).
    lo_primitive_property->set_edm_name( 'Volum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLEH' ).
    lo_primitive_property->set_edm_name( 'Voleh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZTLF' ).
    lo_primitive_property->set_edm_name( 'Kztlf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UEBTK' ).
    lo_primitive_property->set_edm_name( 'Uebtk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UEBTO' ).
    lo_primitive_property->set_edm_name( 'Uebto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNTTO' ).
    lo_primitive_property->set_edm_name( 'Untto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHSPL' ).
    lo_primitive_property->set_edm_name( 'Chspl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAKSP' ).
    lo_primitive_property->set_edm_name( 'Faksp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MBDAT' ).
    lo_primitive_property->set_edm_name( 'Mbdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGMNG' ).
    lo_primitive_property->set_edm_name( 'Lgmng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARKTX' ).
    lo_primitive_property->set_edm_name( 'Arktx' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGPBE' ).
    lo_primitive_property->set_edm_name( 'Lgpbe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELV' ).
    lo_primitive_property->set_edm_name( 'Vbelv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSNV' ).
    lo_primitive_property->set_edm_name( 'Posnv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBTYV' ).
    lo_primitive_property->set_edm_name( 'Vbtyv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGSYS' ).
    lo_primitive_property->set_edm_name( 'Vgsys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGBEL' ).
    lo_primitive_property->set_edm_name( 'Vgbel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGPOS' ).
    lo_primitive_property->set_edm_name( 'Vgpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPFLU' ).
    lo_primitive_property->set_edm_name( 'Upflu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UEPOS' ).
    lo_primitive_property->set_edm_name( 'Uepos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKREL' ).
    lo_primitive_property->set_edm_name( 'Fkrel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BATCH_BILLING_VARIANT' ).
    lo_primitive_property->set_edm_name( 'BatchBillingVariant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LADGR' ).
    lo_primitive_property->set_edm_name( 'Ladgr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRAGR' ).
    lo_primitive_property->set_edm_name( 'Tragr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOMKZ' ).
    lo_primitive_property->set_edm_name( 'Komkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGNUM' ).
    lo_primitive_property->set_edm_name( 'Lgnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LISPL' ).
    lo_primitive_property->set_edm_name( 'Lispl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGTYP' ).
    lo_primitive_property->set_edm_name( 'Lgtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGPLA' ).
    lo_primitive_property->set_edm_name( 'Lgpla' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BWTEX' ).
    lo_primitive_property->set_edm_name( 'Bwtex' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETTYP' ).
    lo_primitive_property->set_edm_name( 'Ettyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BWART' ).
    lo_primitive_property->set_edm_name( 'Bwart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BWLVS' ).
    lo_primitive_property->set_edm_name( 'Bwlvs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZDLG' ).
    lo_primitive_property->set_edm_name( 'Kzdlg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BDART' ).
    lo_primitive_property->set_edm_name( 'Bdart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLART' ).
    lo_primitive_property->set_edm_name( 'Plart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MTART' ).
    lo_primitive_property->set_edm_name( 'Mtart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCHPF' ).
    lo_primitive_property->set_edm_name( 'Xchpf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCHAR' ).
    lo_primitive_property->set_edm_name( 'Xchar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGREF' ).
    lo_primitive_property->set_edm_name( 'Vgref' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSAR' ).
    lo_primitive_property->set_edm_name( 'Posar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BWTAR' ).
    lo_primitive_property->set_edm_name( 'Bwtar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUMBD' ).
    lo_primitive_property->set_edm_name( 'Sumbd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MTVFP' ).
    lo_primitive_property->set_edm_name( 'Mtvfp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EANNR' ).
    lo_primitive_property->set_edm_name( 'Eannr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GSBER' ).
    lo_primitive_property->set_edm_name( 'Gsber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VKBUR' ).
    lo_primitive_property->set_edm_name( 'Vkbur' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VKGRP' ).
    lo_primitive_property->set_edm_name( 'Vkgrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRKOR' ).
    lo_primitive_property->set_edm_name( 'Grkor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FMENG' ).
    lo_primitive_property->set_edm_name( 'Fmeng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANTLF' ).
    lo_primitive_property->set_edm_name( 'Antlf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBEAF' ).
    lo_primitive_property->set_edm_name( 'Vbeaf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBEAV' ).
    lo_primitive_property->set_edm_name( 'Vbeav' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STAFO' ).
    lo_primitive_property->set_edm_name( 'Stafo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SOBKZ' ).
    lo_primitive_property->set_edm_name( 'Sobkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AEDAT' ).
    lo_primitive_property->set_edm_name( 'Aedat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EAN_11' ).
    lo_primitive_property->set_edm_name( 'Ean11' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KVGR_1' ).
    lo_primitive_property->set_edm_name( 'Kvgr1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KVGR_2' ).
    lo_primitive_property->set_edm_name( 'Kvgr2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KVGR_3' ).
    lo_primitive_property->set_edm_name( 'Kvgr3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KVGR_4' ).
    lo_primitive_property->set_edm_name( 'Kvgr4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KVGR_5' ).
    lo_primitive_property->set_edm_name( 'Kvgr5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_1' ).
    lo_primitive_property->set_edm_name( 'Mvgr1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_2' ).
    lo_primitive_property->set_edm_name( 'Mvgr2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_3' ).
    lo_primitive_property->set_edm_name( 'Mvgr3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_4' ).
    lo_primitive_property->set_edm_name( 'Mvgr4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_5' ).
    lo_primitive_property->set_edm_name( 'Mvgr5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VPZUO' ).
    lo_primitive_property->set_edm_name( 'Vpzuo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGTYP' ).
    lo_primitive_property->set_edm_name( 'Vgtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFVGTYP' ).
    lo_primitive_property->set_edm_name( 'Rfvgtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOSTL' ).
    lo_primitive_property->set_edm_name( 'Kostl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOKRS' ).
    lo_primitive_property->set_edm_name( 'Kokrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAOBJNR' ).
    lo_primitive_property->set_edm_name( 'Paobjnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRCTR' ).
    lo_primitive_property->set_edm_name( 'Prctr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUFNR' ).
    lo_primitive_property->set_edm_name( 'Aufnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSNR_PP' ).
    lo_primitive_property->set_edm_name( 'PosnrPp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RECIPIENT_LOCATION_CODE' ).
    lo_primitive_property->set_edm_name( 'RecipientLocationCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUFPL' ).
    lo_primitive_property->set_edm_name( 'Aufpl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'APLZL' ).
    lo_primitive_property->set_edm_name( 'Aplzl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KDAUF' ).
    lo_primitive_property->set_edm_name( 'Kdauf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KDPOS' ).
    lo_primitive_property->set_edm_name( 'Kdpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VPMAT' ).
    lo_primitive_property->set_edm_name( 'Vpmat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VPWRK' ).
    lo_primitive_property->set_edm_name( 'Vpwrk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRBME' ).
    lo_primitive_property->set_edm_name( 'Prbme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMREF' ).
    lo_primitive_property->set_edm_name( 'Umref' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PCKPF' ).
    lo_primitive_property->set_edm_name( 'Pckpf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BEDAR_LF' ).
    lo_primitive_property->set_edm_name( 'BedarLf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMPNT' ).
    lo_primitive_property->set_edm_name( 'Cmpnt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KCMENG' ).
    lo_primitive_property->set_edm_name( 'Kcmeng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KCBRGEW' ).
    lo_primitive_property->set_edm_name( 'Kcbrgew' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KCNTGEW' ).
    lo_primitive_property->set_edm_name( 'Kcntgew' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KCVOLUM' ).
    lo_primitive_property->set_edm_name( 'Kcvolum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UECHA' ).
    lo_primitive_property->set_edm_name( 'Uecha' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUOBJ' ).
    lo_primitive_property->set_edm_name( 'Cuobj' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUOBJ_CH' ).
    lo_primitive_property->set_edm_name( 'CuobjCh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANZSN' ).
    lo_primitive_property->set_edm_name( 'Anzsn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERAIL' ).
    lo_primitive_property->set_edm_name( 'Serail' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KCGEWEI' ).
    lo_primitive_property->set_edm_name( 'Kcgewei' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KCVOLEH' ).
    lo_primitive_property->set_edm_name( 'Kcvoleh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERNR' ).
    lo_primitive_property->set_edm_name( 'Sernr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABRLI' ).
    lo_primitive_property->set_edm_name( 'Abrli' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABART' ).
    lo_primitive_property->set_edm_name( 'Abart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABRVW' ).
    lo_primitive_property->set_edm_name( 'Abrvw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QPLOS' ).
    lo_primitive_property->set_edm_name( 'Qplos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QTLOS' ).
    lo_primitive_property->set_edm_name( 'Qtlos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NACHL' ).
    lo_primitive_property->set_edm_name( 'Nachl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAGRV' ).
    lo_primitive_property->set_edm_name( 'Magrv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OBJKO' ).
    lo_primitive_property->set_edm_name( 'Objko' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 22 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OBJPO' ).
    lo_primitive_property->set_edm_name( 'Objpo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 22 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AESKD' ).
    lo_primitive_property->set_edm_name( 'Aeskd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 17 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHKZG' ).
    lo_primitive_property->set_edm_name( 'Shkzg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROSA' ).
    lo_primitive_property->set_edm_name( 'Prosa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UEPVW' ).
    lo_primitive_property->set_edm_name( 'Uepvw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMPST' ).
    lo_primitive_property->set_edm_name( 'Empst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABTNR' ).
    lo_primitive_property->set_edm_name( 'Abtnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOQUI' ).
    lo_primitive_property->set_edm_name( 'Koqui' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STADAT' ).
    lo_primitive_property->set_edm_name( 'Stadat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AKTNR' ).
    lo_primitive_property->set_edm_name( 'Aktnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNUMH_CH' ).
    lo_primitive_property->set_edm_name( 'KnumhCh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PREFE' ).
    lo_primitive_property->set_edm_name( 'Prefe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXART' ).
    lo_primitive_property->set_edm_name( 'Exart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CLINT' ).
    lo_primitive_property->set_edm_name( 'Clint' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHMVS' ).
    lo_primitive_property->set_edm_name( 'Chmvs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFIMG_FLO' ).
    lo_primitive_property->set_edm_name( 'LfimgFlo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGMNG_FLO' ).
    lo_primitive_property->set_edm_name( 'LgmngFlo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KCMENG_FLO' ).
    lo_primitive_property->set_edm_name( 'KcmengFlo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZUMW' ).
    lo_primitive_property->set_edm_name( 'Kzumw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KMPMG' ).
    lo_primitive_property->set_edm_name( 'Kmpmg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUREL' ).
    lo_primitive_property->set_edm_name( 'Aurel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KPEIN' ).
    lo_primitive_property->set_edm_name( 'Kpein' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KMEIN' ).
    lo_primitive_property->set_edm_name( 'Kmein' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETWR' ).
    lo_primitive_property->set_edm_name( 'Netwr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOWRR' ).
    lo_primitive_property->set_edm_name( 'Kowrr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZBEW' ).
    lo_primitive_property->set_edm_name( 'Kzbew' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MFRGR' ).
    lo_primitive_property->set_edm_name( 'Mfrgr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHHPV' ).
    lo_primitive_property->set_edm_name( 'Chhpv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABFOR' ).
    lo_primitive_property->set_edm_name( 'Abfor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABGES' ).
    lo_primitive_property->set_edm_name( 'Abges' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MBUHR' ).
    lo_primitive_property->set_edm_name( 'Mbuhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WKTNR' ).
    lo_primitive_property->set_edm_name( 'Wktnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WKTPS' ).
    lo_primitive_property->set_edm_name( 'Wktps' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SITUA' ).
    lo_primitive_property->set_edm_name( 'Situa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RSNUM' ).
    lo_primitive_property->set_edm_name( 'Rsnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RSPOS' ).
    lo_primitive_property->set_edm_name( 'Rspos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RSART' ).
    lo_primitive_property->set_edm_name( 'Rsart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KANNR' ).
    lo_primitive_property->set_edm_name( 'Kannr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZFME' ).
    lo_primitive_property->set_edm_name( 'Kzfme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROFL' ).
    lo_primitive_property->set_edm_name( 'Profl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKSTA' ).
    lo_primitive_property->set_edm_name( 'Fksta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_vbak_knvvtype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_VBAK_KNVVTYPE'
                                    is_structure              = VALUE tys_z_i_vbak_knvvtype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_VBAK_KNVVType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_VBAK_KNVV' ).
    lo_entity_set->set_edm_name( 'Z_I_VBAK_KNVV' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELN' ).
    lo_primitive_property->set_edm_name( 'Vbeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERDAT' ).
    lo_primitive_property->set_edm_name( 'Erdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAERK' ).
    lo_primitive_property->set_edm_name( 'Waerk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VKORG' ).
    lo_primitive_property->set_edm_name( 'Vkorg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUNNR' ).
    lo_primitive_property->set_edm_name( 'Kunnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BZIRK' ).
    lo_primitive_property->set_edm_name( 'Bzirk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_vbaptype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_VBAPTYPE'
                                    is_structure              = VALUE tys_z_i_vbaptype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_VBAPType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_VBAP' ).
    lo_entity_set->set_edm_name( 'Z_I_VBAP' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELN' ).
    lo_primitive_property->set_edm_name( 'Vbeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSNR' ).
    lo_primitive_property->set_edm_name( 'Posnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATNR' ).
    lo_primitive_property->set_edm_name( 'Matnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATWA' ).
    lo_primitive_property->set_edm_name( 'Matwa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PMATN' ).
    lo_primitive_property->set_edm_name( 'Pmatn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHARG' ).
    lo_primitive_property->set_edm_name( 'Charg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATKL' ).
    lo_primitive_property->set_edm_name( 'Matkl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARKTX' ).
    lo_primitive_property->set_edm_name( 'Arktx' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSTYV' ).
    lo_primitive_property->set_edm_name( 'Pstyv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSAR' ).
    lo_primitive_property->set_edm_name( 'Posar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROCESS_CODE' ).
    lo_primitive_property->set_edm_name( 'ProcessCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFREL' ).
    lo_primitive_property->set_edm_name( 'Lfrel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKREL' ).
    lo_primitive_property->set_edm_name( 'Fkrel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UEPOS' ).
    lo_primitive_property->set_edm_name( 'Uepos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRPOS' ).
    lo_primitive_property->set_edm_name( 'Grpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABGRU' ).
    lo_primitive_property->set_edm_name( 'Abgru' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODH' ).
    lo_primitive_property->set_edm_name( 'Prodh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISCONTINUED_DATE' ).
    lo_primitive_property->set_edm_name( 'DiscontinuedDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISCONTINUED_TIME' ).
    lo_primitive_property->set_edm_name( 'DiscontinuedTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FOLLOW_UP_ITEM' ).
    lo_primitive_property->set_edm_name( 'FollowUpItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PICK_HU_IND' ).
    lo_primitive_property->set_edm_name( 'PickHuInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODH_UNIV_SALES_PARNT_NOD' ).
    lo_primitive_property->set_edm_name( 'ProdhUnivSalesParntNodid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODH_UNIV_SALES_DET_ORIGI' ).
    lo_primitive_property->set_edm_name( 'ProdhUnivSalesDetOrigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODH_UNIV_BATDET_PARNT_NO' ).
    lo_primitive_property->set_edm_name( 'ProdhUnivBatdetParntNodid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODH_UNIV_BATDET_DET_ORIG' ).
    lo_primitive_property->set_edm_name( 'ProdhUnivBatdetDetOrigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZIEME' ).
    lo_primitive_property->set_edm_name( 'Zieme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMZIZ' ).
    lo_primitive_property->set_edm_name( 'Umziz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMZIN' ).
    lo_primitive_property->set_edm_name( 'Umzin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEINS' ).
    lo_primitive_property->set_edm_name( 'Meins' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBSTN_NUMERATOR' ).
    lo_primitive_property->set_edm_name( 'SubstnNumerator' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int16' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBSTN_DENOMINATOR' ).
    lo_primitive_property->set_edm_name( 'SubstnDenominator' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int16' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABDAT' ).
    lo_primitive_property->set_edm_name( 'Abdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSEX' ).
    lo_primitive_property->set_edm_name( 'Posex' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KDMAT' ).
    lo_primitive_property->set_edm_name( 'Kdmat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KBVER' ).
    lo_primitive_property->set_edm_name( 'Kbver' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KEVER' ).
    lo_primitive_property->set_edm_name( 'Kever' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VKGRU' ).
    lo_primitive_property->set_edm_name( 'Vkgru' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VKAUS' ).
    lo_primitive_property->set_edm_name( 'Vkaus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRKOR' ).
    lo_primitive_property->set_edm_name( 'Grkor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FMENG' ).
    lo_primitive_property->set_edm_name( 'Fmeng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UEBTK' ).
    lo_primitive_property->set_edm_name( 'Uebtk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UEBTO' ).
    lo_primitive_property->set_edm_name( 'Uebto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNTTO' ).
    lo_primitive_property->set_edm_name( 'Untto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAKSP' ).
    lo_primitive_property->set_edm_name( 'Faksp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ATPKZ' ).
    lo_primitive_property->set_edm_name( 'Atpkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RKFKF' ).
    lo_primitive_property->set_edm_name( 'Rkfkf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPART' ).
    lo_primitive_property->set_edm_name( 'Spart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GSBER' ).
    lo_primitive_property->set_edm_name( 'Gsber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETWR' ).
    lo_primitive_property->set_edm_name( 'Netwr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAERK' ).
    lo_primitive_property->set_edm_name( 'Waerk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANTLF' ).
    lo_primitive_property->set_edm_name( 'Antlf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZTLF' ).
    lo_primitive_property->set_edm_name( 'Kztlf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RESOURCE_ID' ).
    lo_primitive_property->set_edm_name( 'ResourceId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHSPL' ).
    lo_primitive_property->set_edm_name( 'Chspl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KWMENG' ).
    lo_primitive_property->set_edm_name( 'Kwmeng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VRKME' ).
    lo_primitive_property->set_edm_name( 'Vrkme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMVKZ' ).
    lo_primitive_property->set_edm_name( 'Umvkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMVKN' ).
    lo_primitive_property->set_edm_name( 'Umvkn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GEWEI' ).
    lo_primitive_property->set_edm_name( 'Gewei' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLEH' ).
    lo_primitive_property->set_edm_name( 'Voleh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELV' ).
    lo_primitive_property->set_edm_name( 'Vbelv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSNV' ).
    lo_primitive_property->set_edm_name( 'Posnv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGBEL' ).
    lo_primitive_property->set_edm_name( 'Vgbel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGPOS' ).
    lo_primitive_property->set_edm_name( 'Vgpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOREF' ).
    lo_primitive_property->set_edm_name( 'Voref' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPFLU' ).
    lo_primitive_property->set_edm_name( 'Upflu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERLRE' ).
    lo_primitive_property->set_edm_name( 'Erlre' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LPRIO' ).
    lo_primitive_property->set_edm_name( 'Lprio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSTEL' ).
    lo_primitive_property->set_edm_name( 'Vstel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROUTE' ).
    lo_primitive_property->set_edm_name( 'Route' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STKEY' ).
    lo_primitive_property->set_edm_name( 'Stkey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STDAT' ).
    lo_primitive_property->set_edm_name( 'Stdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STPOS' ).
    lo_primitive_property->set_edm_name( 'Stpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AWAHR' ).
    lo_primitive_property->set_edm_name( 'Awahr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERZET' ).
    lo_primitive_property->set_edm_name( 'Erzet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXM_1' ).
    lo_primitive_property->set_edm_name( 'Taxm1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXM_2' ).
    lo_primitive_property->set_edm_name( 'Taxm2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXM_3' ).
    lo_primitive_property->set_edm_name( 'Taxm3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXM_4' ).
    lo_primitive_property->set_edm_name( 'Taxm4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXM_5' ).
    lo_primitive_property->set_edm_name( 'Taxm5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXM_6' ).
    lo_primitive_property->set_edm_name( 'Taxm6' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXM_7' ).
    lo_primitive_property->set_edm_name( 'Taxm7' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXM_8' ).
    lo_primitive_property->set_edm_name( 'Taxm8' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXM_9' ).
    lo_primitive_property->set_edm_name( 'Taxm9' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBEAF' ).
    lo_primitive_property->set_edm_name( 'Vbeaf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBEAV' ).
    lo_primitive_property->set_edm_name( 'Vbeav' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGREF' ).
    lo_primitive_property->set_edm_name( 'Vgref' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETPR' ).
    lo_primitive_property->set_edm_name( 'Netpr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KPEIN' ).
    lo_primitive_property->set_edm_name( 'Kpein' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KMEIN' ).
    lo_primitive_property->set_edm_name( 'Kmein' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHKZG' ).
    lo_primitive_property->set_edm_name( 'Shkzg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SKTOF' ).
    lo_primitive_property->set_edm_name( 'Sktof' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MTVFP' ).
    lo_primitive_property->set_edm_name( 'Mtvfp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUMBD' ).
    lo_primitive_property->set_edm_name( 'Sumbd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KONDM' ).
    lo_primitive_property->set_edm_name( 'Kondm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KTGRM' ).
    lo_primitive_property->set_edm_name( 'Ktgrm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BONUS' ).
    lo_primitive_property->set_edm_name( 'Bonus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROVG' ).
    lo_primitive_property->set_edm_name( 'Provg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EANNR' ).
    lo_primitive_property->set_edm_name( 'Eannr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRSOK' ).
    lo_primitive_property->set_edm_name( 'Prsok' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BWTAR' ).
    lo_primitive_property->set_edm_name( 'Bwtar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BWTEX' ).
    lo_primitive_property->set_edm_name( 'Bwtex' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCHPF' ).
    lo_primitive_property->set_edm_name( 'Xchpf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCHAR' ).
    lo_primitive_property->set_edm_name( 'Xchar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BATCH_BILLING_VARIANT' ).
    lo_primitive_property->set_edm_name( 'BatchBillingVariant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STAFO' ).
    lo_primitive_property->set_edm_name( 'Stafo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AEDAT' ).
    lo_primitive_property->set_edm_name( 'Aedat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EAN_11' ).
    lo_primitive_property->set_edm_name( 'Ean11' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIXMG' ).
    lo_primitive_property->set_edm_name( 'Fixmg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRCTR' ).
    lo_primitive_property->set_edm_name( 'Prctr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_1' ).
    lo_primitive_property->set_edm_name( 'Mvgr1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_2' ).
    lo_primitive_property->set_edm_name( 'Mvgr2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_3' ).
    lo_primitive_property->set_edm_name( 'Mvgr3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_4' ).
    lo_primitive_property->set_edm_name( 'Mvgr4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_5' ).
    lo_primitive_property->set_edm_name( 'Mvgr5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUGRD' ).
    lo_primitive_property->set_edm_name( 'Sugrd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SOBKZ' ).
    lo_primitive_property->set_edm_name( 'Sobkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VPZUO' ).
    lo_primitive_property->set_edm_name( 'Vpzuo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOB_FG_ID' ).
    lo_primitive_property->set_edm_name( 'BobFgId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int64' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOB_PROMOTION_ID' ).
    lo_primitive_property->set_edm_name( 'BobPromotionId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int64' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAOBJNR' ).
    lo_primitive_property->set_edm_name( 'Paobjnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FREEZE_PAOBJNR' ).
    lo_primitive_property->set_edm_name( 'FreezePaobjnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUFNR' ).
    lo_primitive_property->set_edm_name( 'Aufnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VPMAT' ).
    lo_primitive_property->set_edm_name( 'Vpmat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VPWRK' ).
    lo_primitive_property->set_edm_name( 'Vpwrk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRBME' ).
    lo_primitive_property->set_edm_name( 'Prbme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMREF' ).
    lo_primitive_property->set_edm_name( 'Umref' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERNR' ).
    lo_primitive_property->set_edm_name( 'Sernr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OBJNR' ).
    lo_primitive_property->set_edm_name( 'Objnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 22 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABGRS' ).
    lo_primitive_property->set_edm_name( 'Abgrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BEDAE' ).
    lo_primitive_property->set_edm_name( 'Bedae' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMTFG' ).
    lo_primitive_property->set_edm_name( 'Cmtfg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMPNT' ).
    lo_primitive_property->set_edm_name( 'Cmpnt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUOBJ' ).
    lo_primitive_property->set_edm_name( 'Cuobj' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUOBJ_CH' ).
    lo_primitive_property->set_edm_name( 'CuobjCh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CEPOK' ).
    lo_primitive_property->set_edm_name( 'Cepok' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOUPD' ).
    lo_primitive_property->set_edm_name( 'Koupd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERAIL' ).
    lo_primitive_property->set_edm_name( 'Serail' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANZSN' ).
    lo_primitive_property->set_edm_name( 'Anzsn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NACHL' ).
    lo_primitive_property->set_edm_name( 'Nachl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAGRV' ).
    lo_primitive_property->set_edm_name( 'Magrv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MPROK' ).
    lo_primitive_property->set_edm_name( 'Mprok' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGTYP' ).
    lo_primitive_property->set_edm_name( 'Vgtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROSA' ).
    lo_primitive_property->set_edm_name( 'Prosa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UEPVW' ).
    lo_primitive_property->set_edm_name( 'Uepvw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOWRR' ).
    lo_primitive_property->set_edm_name( 'Kowrr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STADAT' ).
    lo_primitive_property->set_edm_name( 'Stadat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXART' ).
    lo_primitive_property->set_edm_name( 'Exart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PREFE' ).
    lo_primitive_property->set_edm_name( 'Prefe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNUMH' ).
    lo_primitive_property->set_edm_name( 'Knumh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CLINT' ).
    lo_primitive_property->set_edm_name( 'Clint' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHMVS' ).
    lo_primitive_property->set_edm_name( 'Chmvs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STLTY' ).
    lo_primitive_property->set_edm_name( 'Stlty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STLKN' ).
    lo_primitive_property->set_edm_name( 'Stlkn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STPOZ' ).
    lo_primitive_property->set_edm_name( 'Stpoz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STMAN' ).
    lo_primitive_property->set_edm_name( 'Stman' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZSCHL_K' ).
    lo_primitive_property->set_edm_name( 'ZschlK' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KALSM_K' ).
    lo_primitive_property->set_edm_name( 'KalsmK' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KALVAR' ).
    lo_primitive_property->set_edm_name( 'Kalvar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOSCH' ).
    lo_primitive_property->set_edm_name( 'Kosch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPMAT' ).
    lo_primitive_property->set_edm_name( 'Upmat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UKONM' ).
    lo_primitive_property->set_edm_name( 'Ukonm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MFRGR' ).
    lo_primitive_property->set_edm_name( 'Mfrgr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLAVO' ).
    lo_primitive_property->set_edm_name( 'Plavo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KANNR' ).
    lo_primitive_property->set_edm_name( 'Kannr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMPRE_FLT' ).
    lo_primitive_property->set_edm_name( 'CmpreFlt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABFOR' ).
    lo_primitive_property->set_edm_name( 'Abfor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABGES' ).
    lo_primitive_property->set_edm_name( 'Abges' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WKTNR' ).
    lo_primitive_property->set_edm_name( 'Wktnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WKTPS' ).
    lo_primitive_property->set_edm_name( 'Wktps' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SKOPF' ).
    lo_primitive_property->set_edm_name( 'Skopf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZBWS' ).
    lo_primitive_property->set_edm_name( 'Kzbws' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WGRU_1' ).
    lo_primitive_property->set_edm_name( 'Wgru1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WGRU_2' ).
    lo_primitive_property->set_edm_name( 'Wgru2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNUMA_PI' ).
    lo_primitive_property->set_edm_name( 'KnumaPi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNUMA_AG' ).
    lo_primitive_property->set_edm_name( 'KnumaAg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZFME' ).
    lo_primitive_property->set_edm_name( 'Kzfme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LSTANR' ).
    lo_primitive_property->set_edm_name( 'Lstanr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TECHS' ).
    lo_primitive_property->set_edm_name( 'Techs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MWSBP' ).
    lo_primitive_property->set_edm_name( 'Mwsbp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BERID' ).
    lo_primitive_property->set_edm_name( 'Berid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PCTRF' ).
    lo_primitive_property->set_edm_name( 'Pctrf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOGSYS_EXT' ).
    lo_primitive_property->set_edm_name( 'LogsysExt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STOCKLOC' ).
    lo_primitive_property->set_edm_name( 'Stockloc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SLOCTYPE' ).
    lo_primitive_property->set_edm_name( 'Sloctype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSR_RET_REASON' ).
    lo_primitive_property->set_edm_name( 'MsrRetReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSR_REFUND_CODE' ).
    lo_primitive_property->set_edm_name( 'MsrRefundCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSR_APPROV_BLOCK' ).
    lo_primitive_property->set_edm_name( 'MsrApprovBlock' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NRAB_KNUMH' ).
    lo_primitive_property->set_edm_name( 'NrabKnumh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRMRISK_RELEVANT' ).
    lo_primitive_property->set_edm_name( 'TrmriskRelevant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SGT_RCAT' ).
    lo_primitive_property->set_edm_name( 'SgtRcat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBKD_POSNR' ).
    lo_primitive_property->set_edm_name( 'VbkdPosnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VEDA_POSNR' ).
    lo_primitive_property->set_edm_name( 'VedaPosnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HANDOVERLOC' ).
    lo_primitive_property->set_edm_name( 'Handoverloc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_REF_ITEM_ID' ).
    lo_primitive_property->set_edm_name( 'ExtRefItemId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPCSTO' ).
    lo_primitive_property->set_edm_name( 'Spcsto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REVACC_REFID' ).
    lo_primitive_property->set_edm_name( 'RevaccRefid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REVACC_REFTYPE' ).
    lo_primitive_property->set_edm_name( 'RevaccReftype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATAAGING' ).
    lo_primitive_property->set_edm_name( 'Dataaging' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABSTA' ).
    lo_primitive_property->set_edm_name( 'Absta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BESTA' ).
    lo_primitive_property->set_edm_name( 'Besta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMPPI' ).
    lo_primitive_property->set_edm_name( 'Cmppi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMPPJ' ).
    lo_primitive_property->set_edm_name( 'Cmppj' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COSTA' ).
    lo_primitive_property->set_edm_name( 'Costa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DCSTA' ).
    lo_primitive_property->set_edm_name( 'Dcsta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKSAA' ).
    lo_primitive_property->set_edm_name( 'Fksaa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSSTA' ).
    lo_primitive_property->set_edm_name( 'Fssta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GBSTA' ).
    lo_primitive_property->set_edm_name( 'Gbsta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFGSA' ).
    lo_primitive_property->set_edm_name( 'Lfgsa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFSTA' ).
    lo_primitive_property->set_edm_name( 'Lfsta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LSSTA' ).
    lo_primitive_property->set_edm_name( 'Lssta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MANEK' ).
    lo_primitive_property->set_edm_name( 'Manek' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFGSA' ).
    lo_primitive_property->set_edm_name( 'Rfgsa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFSTA' ).
    lo_primitive_property->set_edm_name( 'Rfsta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVALL' ).
    lo_primitive_property->set_edm_name( 'Uvall' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVFAK' ).
    lo_primitive_property->set_edm_name( 'Uvfak' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVPRS' ).
    lo_primitive_property->set_edm_name( 'Uvprs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVVLK' ).
    lo_primitive_property->set_edm_name( 'Uvvlk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVP_01' ).
    lo_primitive_property->set_edm_name( 'Uvp01' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVP_02' ).
    lo_primitive_property->set_edm_name( 'Uvp02' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVP_03' ).
    lo_primitive_property->set_edm_name( 'Uvp03' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVP_04' ).
    lo_primitive_property->set_edm_name( 'Uvp04' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVP_05' ).
    lo_primitive_property->set_edm_name( 'Uvp05' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WBSTA' ).
    lo_primitive_property->set_edm_name( 'Wbsta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMCST' ).
    lo_primitive_property->set_edm_name( 'Emcst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SLCST' ).
    lo_primitive_property->set_edm_name( 'Slcst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOTAL_LCCST' ).
    lo_primitive_property->set_edm_name( 'TotalLccst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PCSTA' ).
    lo_primitive_property->set_edm_name( 'Pcsta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DGSTA' ).
    lo_primitive_property->set_edm_name( 'Dgsta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDSSTA' ).
    lo_primitive_property->set_edm_name( 'Sdssta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_vbrktype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_VBRKTYPE'
                                    is_structure              = VALUE tys_z_i_vbrktype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_VBRKType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_VBRK' ).
    lo_entity_set->set_edm_name( 'Z_I_VBRK' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELN' ).
    lo_primitive_property->set_edm_name( 'Vbeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKART' ).
    lo_primitive_property->set_edm_name( 'Fkart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKTYP' ).
    lo_primitive_property->set_edm_name( 'Fktyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBTYP' ).
    lo_primitive_property->set_edm_name( 'Vbtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAERK' ).
    lo_primitive_property->set_edm_name( 'Waerk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VKORG' ).
    lo_primitive_property->set_edm_name( 'Vkorg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VTWEG' ).
    lo_primitive_property->set_edm_name( 'Vtweg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KALSM' ).
    lo_primitive_property->set_edm_name( 'Kalsm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNUMV' ).
    lo_primitive_property->set_edm_name( 'Knumv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSBED' ).
    lo_primitive_property->set_edm_name( 'Vsbed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKDAT' ).
    lo_primitive_property->set_edm_name( 'Fkdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BELNR' ).
    lo_primitive_property->set_edm_name( 'Belnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GJAHR' ).
    lo_primitive_property->set_edm_name( 'Gjahr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POPER' ).
    lo_primitive_property->set_edm_name( 'Poper' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KONDA' ).
    lo_primitive_property->set_edm_name( 'Konda' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KDGRP' ).
    lo_primitive_property->set_edm_name( 'Kdgrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BZIRK' ).
    lo_primitive_property->set_edm_name( 'Bzirk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLTYP' ).
    lo_primitive_property->set_edm_name( 'Pltyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFBSK' ).
    lo_primitive_property->set_edm_name( 'Rfbsk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MRNKZ' ).
    lo_primitive_property->set_edm_name( 'Mrnkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CPKUR' ).
    lo_primitive_property->set_edm_name( 'Cpkur' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALTG' ).
    lo_primitive_property->set_edm_name( 'Valtg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALDT' ).
    lo_primitive_property->set_edm_name( 'Valdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZTERM' ).
    lo_primitive_property->set_edm_name( 'Zterm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZLSCH' ).
    lo_primitive_property->set_edm_name( 'Zlsch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KTGRD' ).
    lo_primitive_property->set_edm_name( 'Ktgrd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUKRS' ).
    lo_primitive_property->set_edm_name( 'Bukrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXK_1' ).
    lo_primitive_property->set_edm_name( 'Taxk1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXK_2' ).
    lo_primitive_property->set_edm_name( 'Taxk2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXK_3' ).
    lo_primitive_property->set_edm_name( 'Taxk3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXK_4' ).
    lo_primitive_property->set_edm_name( 'Taxk4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXK_5' ).
    lo_primitive_property->set_edm_name( 'Taxk5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXK_6' ).
    lo_primitive_property->set_edm_name( 'Taxk6' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXK_7' ).
    lo_primitive_property->set_edm_name( 'Taxk7' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXK_8' ).
    lo_primitive_property->set_edm_name( 'Taxk8' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXK_9' ).
    lo_primitive_property->set_edm_name( 'Taxk9' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETWR' ).
    lo_primitive_property->set_edm_name( 'Netwr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZUKRI' ).
    lo_primitive_property->set_edm_name( 'Zukri' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERNAM' ).
    lo_primitive_property->set_edm_name( 'Ernam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERZET' ).
    lo_primitive_property->set_edm_name( 'Erzet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERDAT' ).
    lo_primitive_property->set_edm_name( 'Erdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STAFO' ).
    lo_primitive_property->set_edm_name( 'Stafo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUNRG' ).
    lo_primitive_property->set_edm_name( 'Kunrg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUNAG' ).
    lo_primitive_property->set_edm_name( 'Kunag' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MABER' ).
    lo_primitive_property->set_edm_name( 'Maber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STWAE' ).
    lo_primitive_property->set_edm_name( 'Stwae' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STCEG' ).
    lo_primitive_property->set_edm_name( 'Stceg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AEDAT' ).
    lo_primitive_property->set_edm_name( 'Aedat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SFAKN' ).
    lo_primitive_property->set_edm_name( 'Sfakn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNUMA' ).
    lo_primitive_property->set_edm_name( 'Knuma' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKSTO' ).
    lo_primitive_property->set_edm_name( 'Fksto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_vbrptype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_VBRPTYPE'
                                    is_structure              = VALUE tys_z_i_vbrptype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_VBRPType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_VBRP' ).
    lo_entity_set->set_edm_name( 'Z_I_VBRP' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELN' ).
    lo_primitive_property->set_edm_name( 'Vbeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSNR' ).
    lo_primitive_property->set_edm_name( 'Posnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UEPOS' ).
    lo_primitive_property->set_edm_name( 'Uepos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKIMG' ).
    lo_primitive_property->set_edm_name( 'Fkimg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VRKME' ).
    lo_primitive_property->set_edm_name( 'Vrkme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMVKZ' ).
    lo_primitive_property->set_edm_name( 'Umvkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMVKN' ).
    lo_primitive_property->set_edm_name( 'Umvkn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEINS' ).
    lo_primitive_property->set_edm_name( 'Meins' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SMENG' ).
    lo_primitive_property->set_edm_name( 'Smeng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKLMG' ).
    lo_primitive_property->set_edm_name( 'Fklmg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LMENG' ).
    lo_primitive_property->set_edm_name( 'Lmeng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NTGEW' ).
    lo_primitive_property->set_edm_name( 'Ntgew' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRGEW' ).
    lo_primitive_property->set_edm_name( 'Brgew' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GEWEI' ).
    lo_primitive_property->set_edm_name( 'Gewei' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLUM' ).
    lo_primitive_property->set_edm_name( 'Volum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLEH' ).
    lo_primitive_property->set_edm_name( 'Voleh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GSBER' ).
    lo_primitive_property->set_edm_name( 'Gsber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRSDT' ).
    lo_primitive_property->set_edm_name( 'Prsdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FBUDA' ).
    lo_primitive_property->set_edm_name( 'Fbuda' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETWR' ).
    lo_primitive_property->set_edm_name( 'Netwr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELV' ).
    lo_primitive_property->set_edm_name( 'Vbelv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSNV' ).
    lo_primitive_property->set_edm_name( 'Posnv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGBEL' ).
    lo_primitive_property->set_edm_name( 'Vgbel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGPOS' ).
    lo_primitive_property->set_edm_name( 'Vgpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGTYP' ).
    lo_primitive_property->set_edm_name( 'Vgtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUBEL' ).
    lo_primitive_property->set_edm_name( 'Aubel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUPOS' ).
    lo_primitive_property->set_edm_name( 'Aupos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUREF' ).
    lo_primitive_property->set_edm_name( 'Auref' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATNR' ).
    lo_primitive_property->set_edm_name( 'Matnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARKTX' ).
    lo_primitive_property->set_edm_name( 'Arktx' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PMATN' ).
    lo_primitive_property->set_edm_name( 'Pmatn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHARG' ).
    lo_primitive_property->set_edm_name( 'Charg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATKL' ).
    lo_primitive_property->set_edm_name( 'Matkl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSTYV' ).
    lo_primitive_property->set_edm_name( 'Pstyv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSAR' ).
    lo_primitive_property->set_edm_name( 'Posar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODH' ).
    lo_primitive_property->set_edm_name( 'Prodh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSTEL' ).
    lo_primitive_property->set_edm_name( 'Vstel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ATPKZ' ).
    lo_primitive_property->set_edm_name( 'Atpkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPART' ).
    lo_primitive_property->set_edm_name( 'Spart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSPA' ).
    lo_primitive_property->set_edm_name( 'Pospa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WERKS' ).
    lo_primitive_property->set_edm_name( 'Werks' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALAND' ).
    lo_primitive_property->set_edm_name( 'Aland' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WKREG' ).
    lo_primitive_property->set_edm_name( 'Wkreg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WKCOU' ).
    lo_primitive_property->set_edm_name( 'Wkcou' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WKCTY' ).
    lo_primitive_property->set_edm_name( 'Wkcty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXM_1' ).
    lo_primitive_property->set_edm_name( 'Taxm1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXM_2' ).
    lo_primitive_property->set_edm_name( 'Taxm2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXM_3' ).
    lo_primitive_property->set_edm_name( 'Taxm3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXM_4' ).
    lo_primitive_property->set_edm_name( 'Taxm4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXM_5' ).
    lo_primitive_property->set_edm_name( 'Taxm5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXM_6' ).
    lo_primitive_property->set_edm_name( 'Taxm6' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXM_7' ).
    lo_primitive_property->set_edm_name( 'Taxm7' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXM_8' ).
    lo_primitive_property->set_edm_name( 'Taxm8' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXM_9' ).
    lo_primitive_property->set_edm_name( 'Taxm9' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOWRR' ).
    lo_primitive_property->set_edm_name( 'Kowrr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRSFD' ).
    lo_primitive_property->set_edm_name( 'Prsfd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SKTOF' ).
    lo_primitive_property->set_edm_name( 'Sktof' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SKFBP' ).
    lo_primitive_property->set_edm_name( 'Skfbp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KONDM' ).
    lo_primitive_property->set_edm_name( 'Kondm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KTGRM' ).
    lo_primitive_property->set_edm_name( 'Ktgrm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOSTL' ).
    lo_primitive_property->set_edm_name( 'Kostl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BONUS' ).
    lo_primitive_property->set_edm_name( 'Bonus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROVG' ).
    lo_primitive_property->set_edm_name( 'Provg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EANNR' ).
    lo_primitive_property->set_edm_name( 'Eannr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VKGRP' ).
    lo_primitive_property->set_edm_name( 'Vkgrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VKBUR' ).
    lo_primitive_property->set_edm_name( 'Vkbur' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPARA' ).
    lo_primitive_property->set_edm_name( 'Spara' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHKZG' ).
    lo_primitive_property->set_edm_name( 'Shkzg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERZET' ).
    lo_primitive_property->set_edm_name( 'Erzet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BWTAR' ).
    lo_primitive_property->set_edm_name( 'Bwtar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGORT' ).
    lo_primitive_property->set_edm_name( 'Lgort' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STAFO' ).
    lo_primitive_property->set_edm_name( 'Stafo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAVWR' ).
    lo_primitive_property->set_edm_name( 'Wavwr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZWI_1' ).
    lo_primitive_property->set_edm_name( 'Kzwi1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZWI_2' ).
    lo_primitive_property->set_edm_name( 'Kzwi2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZWI_3' ).
    lo_primitive_property->set_edm_name( 'Kzwi3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZWI_4' ).
    lo_primitive_property->set_edm_name( 'Kzwi4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZWI_5' ).
    lo_primitive_property->set_edm_name( 'Kzwi5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZWI_6' ).
    lo_primitive_property->set_edm_name( 'Kzwi6' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVPRS' ).
    lo_primitive_property->set_edm_name( 'Uvprs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UVALL' ).
    lo_primitive_property->set_edm_name( 'Uvall' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EAN_11' ).
    lo_primitive_property->set_edm_name( 'Ean11' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRCTR' ).
    lo_primitive_property->set_edm_name( 'Prctr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KVGR_1' ).
    lo_primitive_property->set_edm_name( 'Kvgr1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KVGR_2' ).
    lo_primitive_property->set_edm_name( 'Kvgr2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KVGR_3' ).
    lo_primitive_property->set_edm_name( 'Kvgr3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KVGR_4' ).
    lo_primitive_property->set_edm_name( 'Kvgr4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KVGR_5' ).
    lo_primitive_property->set_edm_name( 'Kvgr5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_1' ).
    lo_primitive_property->set_edm_name( 'Mvgr1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_2' ).
    lo_primitive_property->set_edm_name( 'Mvgr2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_3' ).
    lo_primitive_property->set_edm_name( 'Mvgr3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_4' ).
    lo_primitive_property->set_edm_name( 'Mvgr4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_5' ).
    lo_primitive_property->set_edm_name( 'Mvgr5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATWA' ).
    lo_primitive_property->set_edm_name( 'Matwa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BONBA' ).
    lo_primitive_property->set_edm_name( 'Bonba' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOKRS' ).
    lo_primitive_property->set_edm_name( 'Kokrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAOBJNR' ).
    lo_primitive_property->set_edm_name( 'Paobjnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUFNR' ).
    lo_primitive_property->set_edm_name( 'Aufnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXJCD' ).
    lo_primitive_property->set_edm_name( 'Txjcd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMPRE' ).
    lo_primitive_property->set_edm_name( 'Cmpre' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMPNT' ).
    lo_primitive_property->set_edm_name( 'Cmpnt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUOBJ' ).
    lo_primitive_property->set_edm_name( 'Cuobj' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUOBJ_CH' ).
    lo_primitive_property->set_edm_name( 'CuobjCh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOUPD' ).
    lo_primitive_property->set_edm_name( 'Koupd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UECHA' ).
    lo_primitive_property->set_edm_name( 'Uecha' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCHAR' ).
    lo_primitive_property->set_edm_name( 'Xchar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BATCH_BILLING_VARIANT' ).
    lo_primitive_property->set_edm_name( 'BatchBillingVariant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABRVW' ).
    lo_primitive_property->set_edm_name( 'Abrvw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERNR' ).
    lo_primitive_property->set_edm_name( 'Sernr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BZIRK_AUFT' ).
    lo_primitive_property->set_edm_name( 'BzirkAuft' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KDGRP_AUFT' ).
    lo_primitive_property->set_edm_name( 'KdgrpAuft' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KONDA_AUFT' ).
    lo_primitive_property->set_edm_name( 'KondaAuft' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LLAND_AUFT' ).
    lo_primitive_property->set_edm_name( 'LlandAuft' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MPROK' ).
    lo_primitive_property->set_edm_name( 'Mprok' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLTYP_AUFT' ).
    lo_primitive_property->set_edm_name( 'PltypAuft' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REGIO_AUFT' ).
    lo_primitive_property->set_edm_name( 'RegioAuft' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VKORG_AUFT' ).
    lo_primitive_property->set_edm_name( 'VkorgAuft' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VTWEG_AUFT' ).
    lo_primitive_property->set_edm_name( 'VtwegAuft' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABRBG' ).
    lo_primitive_property->set_edm_name( 'Abrbg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROSA' ).
    lo_primitive_property->set_edm_name( 'Prosa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UEPVW' ).
    lo_primitive_property->set_edm_name( 'Uepvw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUTYP' ).
    lo_primitive_property->set_edm_name( 'Autyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STADAT' ).
    lo_primitive_property->set_edm_name( 'Stadat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FPLNR' ).
    lo_primitive_property->set_edm_name( 'Fplnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FPLTR' ).
    lo_primitive_property->set_edm_name( 'Fpltr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AKTNR' ).
    lo_primitive_property->set_edm_name( 'Aktnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNUMA_PI' ).
    lo_primitive_property->set_edm_name( 'KnumaPi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNUMA_AG' ).
    lo_primitive_property->set_edm_name( 'KnumaAg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MWSBP' ).
    lo_primitive_property->set_edm_name( 'Mwsbp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUGRU_AUFT' ).
    lo_primitive_property->set_edm_name( 'AugruAuft' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAREG' ).
    lo_primitive_property->set_edm_name( 'Fareg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPMAT' ).
    lo_primitive_property->set_edm_name( 'Upmat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UKONM' ).
    lo_primitive_property->set_edm_name( 'Ukonm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CMPRE_FLT' ).
    lo_primitive_property->set_edm_name( 'CmpreFlt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABFOR' ).
    lo_primitive_property->set_edm_name( 'Abfor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABGES' ).
    lo_primitive_property->set_edm_name( 'Abges' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAERK' ).
    lo_primitive_property->set_edm_name( 'Waerk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_vttk_lfa_1_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_VTTK_LFA_1_TYPE'
                                    is_structure              = VALUE tys_z_i_vttk_lfa_1_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_VTTK_LFA1Type' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_VTTK_LFA_1' ).
    lo_entity_set->set_edm_name( 'Z_I_VTTK_LFA1' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'TKNUM' ).
    lo_primitive_property->set_edm_name( 'Tknum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TDLNR' ).
    lo_primitive_property->set_edm_name( 'Tdlnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFNR' ).
    lo_primitive_property->set_edm_name( 'Lifnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_1' ).
    lo_primitive_property->set_edm_name( 'Name1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.
ENDCLASS.
