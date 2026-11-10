"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>cds_zsd_zverifica_factura</em>
CLASS zscm_zverifica_factura DEFINITION
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
      "! <p class="shorttext synchronized">SAP__HeaderFooterField</p>
      BEGIN OF tys_sap_header_footer_field,
        "! Type
        type TYPE c LENGTH 256,
      END OF tys_sap_header_footer_field,
      "! <p class="shorttext synchronized">List of SAP__HeaderFooterField</p>
      tyt_sap_header_footer_field TYPE STANDARD TABLE OF tys_sap_header_footer_field WITH DEFAULT KEY.

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
        "! Padding
        padding     TYPE int4,
      END OF tys_sap_format,
      "! <p class="shorttext synchronized">List of SAP__Format</p>
      tyt_sap_format TYPE STANDARD TABLE OF tys_sap_format WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__Hierarchy</p>
      BEGIN OF tys_sap_hierarchy,
        "! <em>Key property</em> Id
        id                         TYPE sysuuid_x16,
        "! DistanceFromRootElement
        distance_from_root_element TYPE c LENGTH 256,
        "! DrillStateElement
        drill_state_element        TYPE c LENGTH 256,
      END OF tys_sap_hierarchy,
      "! <p class="shorttext synchronized">List of SAP__Hierarchy</p>
      tyt_sap_hierarchy TYPE STANDARD TABLE OF tys_sap_hierarchy WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__PDFFooter</p>
      BEGIN OF tys_sap_pdffooter,
        "! Right
        right  TYPE tys_sap_header_footer_field,
        "! Left
        left   TYPE tys_sap_header_footer_field,
        "! Center
        center TYPE tys_sap_header_footer_field,
        "! <em>Key property</em> Id
        id     TYPE sysuuid_x16,
      END OF tys_sap_pdffooter,
      "! <p class="shorttext synchronized">List of SAP__PDFFooter</p>
      tyt_sap_pdffooter TYPE STANDARD TABLE OF tys_sap_pdffooter WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SAP__PDFHeader</p>
      BEGIN OF tys_sap_pdfheader,
        "! Right
        right  TYPE tys_sap_header_footer_field,
        "! Left
        left   TYPE tys_sap_header_footer_field,
        "! Center
        center TYPE tys_sap_header_footer_field,
        "! <em>Key property</em> Id
        id     TYPE sysuuid_x16,
      END OF tys_sap_pdfheader,
      "! <p class="shorttext synchronized">List of SAP__PDFHeader</p>
      tyt_sap_pdfheader TYPE STANDARD TABLE OF tys_sap_pdfheader WITH DEFAULT KEY.

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
      "! <p class="shorttext synchronized">Z_I_ADRCType</p>
      BEGIN OF tys_z_i_adrctype,
        "! <em>Key property</em> Addrnumber
        addrnumber       TYPE c LENGTH 10,
        "! DateFrom
        date_from        TYPE datn,
        "! Nation
        nation           TYPE c LENGTH 1,
        "! DateTo
        date_to          TYPE datn,
        "! Title
        title            TYPE c LENGTH 4,
        "! Name1
        name_1           TYPE c LENGTH 40,
        "! Name2
        name_2           TYPE c LENGTH 40,
        "! Name3
        name_3           TYPE c LENGTH 40,
        "! Name4
        name_4           TYPE c LENGTH 40,
        "! NameText
        name_text        TYPE c LENGTH 50,
        "! NameCo
        name_co          TYPE c LENGTH 40,
        "! City1
        city_1           TYPE c LENGTH 40,
        "! City2
        city_2           TYPE c LENGTH 40,
        "! CityCode
        city_code        TYPE c LENGTH 12,
        "! CitypCode
        cityp_code       TYPE c LENGTH 8,
        "! HomeCity
        home_city        TYPE c LENGTH 40,
        "! CityhCode
        cityh_code       TYPE c LENGTH 12,
        "! Chckstatus
        chckstatus       TYPE c LENGTH 1,
        "! Regiogroup
        regiogroup       TYPE c LENGTH 8,
        "! PostCode1
        post_code_1      TYPE c LENGTH 10,
        "! PostCode2
        post_code_2      TYPE c LENGTH 10,
        "! PostCode3
        post_code_3      TYPE c LENGTH 10,
        "! Pcode1Ext
        pcode_1_ext      TYPE c LENGTH 10,
        "! Pcode2Ext
        pcode_2_ext      TYPE c LENGTH 10,
        "! Pcode3Ext
        pcode_3_ext      TYPE c LENGTH 10,
        "! PoBox
        po_box           TYPE c LENGTH 10,
        "! DontUseP
        dont_use_p       TYPE c LENGTH 4,
        "! PoBoxNum
        po_box_num       TYPE abap_bool,
        "! PoBoxLoc
        po_box_loc       TYPE c LENGTH 40,
        "! CityCode2
        city_code_2      TYPE c LENGTH 12,
        "! PoBoxReg
        po_box_reg       TYPE c LENGTH 3,
        "! PoBoxCty
        po_box_cty       TYPE c LENGTH 3,
        "! Postalarea
        postalarea       TYPE c LENGTH 15,
        "! Transpzone
        transpzone       TYPE c LENGTH 10,
        "! Street
        street           TYPE c LENGTH 60,
        "! DontUseS
        dont_use_s       TYPE c LENGTH 4,
        "! Streetcode
        streetcode       TYPE c LENGTH 12,
        "! Streetabbr
        streetabbr       TYPE c LENGTH 2,
        "! HouseNum1
        house_num_1      TYPE c LENGTH 10,
        "! HouseNum2
        house_num_2      TYPE c LENGTH 10,
        "! HouseNum3
        house_num_3      TYPE c LENGTH 10,
        "! StrSuppl1
        str_suppl_1      TYPE c LENGTH 40,
        "! StrSuppl2
        str_suppl_2      TYPE c LENGTH 40,
        "! StrSuppl3
        str_suppl_3      TYPE c LENGTH 40,
        "! Location
        location         TYPE c LENGTH 40,
        "! Building
        building         TYPE c LENGTH 20,
        "! Floor
        floor            TYPE c LENGTH 10,
        "! Roomnumber
        roomnumber       TYPE c LENGTH 10,
        "! Country
        country          TYPE c LENGTH 3,
        "! Langu
        langu            TYPE c LENGTH 2,
        "! Region
        region           TYPE c LENGTH 3,
        "! AddrGroup
        addr_group       TYPE c LENGTH 4,
        "! Flaggroups
        flaggroups       TYPE abap_bool,
        "! PersAddr
        pers_addr        TYPE abap_bool,
        "! Sort1
        sort_1           TYPE c LENGTH 20,
        "! Sort2
        sort_2           TYPE c LENGTH 20,
        "! SortPhn
        sort_phn         TYPE c LENGTH 20,
        "! DefltComm
        deflt_comm       TYPE c LENGTH 3,
        "! TelNumber
        tel_number       TYPE c LENGTH 30,
        "! TelExtens
        tel_extens       TYPE c LENGTH 10,
        "! FaxNumber
        fax_number       TYPE c LENGTH 30,
        "! FaxExtens
        fax_extens       TYPE c LENGTH 10,
        "! Flagcomm2
        flagcomm_2       TYPE abap_bool,
        "! Flagcomm3
        flagcomm_3       TYPE abap_bool,
        "! Flagcomm4
        flagcomm_4       TYPE abap_bool,
        "! Flagcomm5
        flagcomm_5       TYPE abap_bool,
        "! Flagcomm6
        flagcomm_6       TYPE abap_bool,
        "! Flagcomm7
        flagcomm_7       TYPE abap_bool,
        "! Flagcomm8
        flagcomm_8       TYPE abap_bool,
        "! Flagcomm9
        flagcomm_9       TYPE abap_bool,
        "! Flagcomm10
        flagcomm_10      TYPE abap_bool,
        "! Flagcomm11
        flagcomm_11      TYPE abap_bool,
        "! Flagcomm12
        flagcomm_12      TYPE abap_bool,
        "! Flagcomm13
        flagcomm_13      TYPE abap_bool,
        "! Addrorigin
        addrorigin       TYPE c LENGTH 4,
        "! McName1
        mc_name_1        TYPE c LENGTH 25,
        "! McCity1
        mc_city_1        TYPE c LENGTH 25,
        "! McStreet
        mc_street        TYPE c LENGTH 25,
        "! Extension1
        extension_1      TYPE c LENGTH 40,
        "! Extension2
        extension_2      TYPE c LENGTH 40,
        "! Time_Zone
        time_zone        TYPE c LENGTH 6,
        "! Taxjurcode
        taxjurcode       TYPE c LENGTH 15,
        "! AddressId
        address_id       TYPE c LENGTH 10,
        "! LanguCrea
        langu_crea       TYPE c LENGTH 2,
        "! AdrcUuid
        adrc_uuid        TYPE sysuuid_x16,
        "! UuidBelated
        uuid_belated     TYPE c LENGTH 1,
        "! IdCategory
        id_category      TYPE c LENGTH 1,
        "! AdrcErrStatus
        adrc_err_status  TYPE c LENGTH 1,
        "! PoBoxLobby
        po_box_lobby     TYPE c LENGTH 40,
        "! DeliServType
        deli_serv_type   TYPE c LENGTH 4,
        "! DeliServNumber
        deli_serv_number TYPE c LENGTH 10,
        "! CountyCode
        county_code      TYPE c LENGTH 8,
        "! County
        county           TYPE c LENGTH 40,
        "! TownshipCode
        township_code    TYPE c LENGTH 8,
        "! Township
        township         TYPE c LENGTH 40,
        "! McCounty
        mc_county        TYPE c LENGTH 25,
        "! McTownship
        mc_township      TYPE c LENGTH 25,
        "! Xpcpt
        xpcpt            TYPE c LENGTH 1,
        "! Dataaging
        dataaging        TYPE datn,
        "! Duns
        duns             TYPE c LENGTH 9,
        "! Dunsp4
        dunsp_4          TYPE c LENGTH 4,
      END OF tys_z_i_adrctype,
      "! <p class="shorttext synchronized">List of Z_I_ADRCType</p>
      tyt_z_i_adrctype TYPE STANDARD TABLE OF tys_z_i_adrctype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_BKPFType</p>
      BEGIN OF tys_z_i_bkpftype,
        "! <em>Key property</em> Bukrs
        bukrs                    TYPE c LENGTH 4,
        "! <em>Key property</em> Belnr
        belnr                    TYPE c LENGTH 10,
        "! <em>Key property</em> Gjahr
        gjahr                    TYPE c LENGTH 4,
        "! Blart
        blart                    TYPE c LENGTH 2,
        "! Bldat
        bldat                    TYPE datn,
        "! Budat
        budat                    TYPE datn,
        "! Monat
        monat                    TYPE c LENGTH 2,
        "! Cpudt
        cpudt                    TYPE datn,
        "! Cputm
        cputm                    TYPE timn,
        "! Aedat
        aedat                    TYPE datn,
        "! Upddt
        upddt                    TYPE datn,
        "! Wwert
        wwert                    TYPE datn,
        "! Usnam
        usnam                    TYPE c LENGTH 12,
        "! Tcode
        tcode                    TYPE c LENGTH 20,
        "! Bvorg
        bvorg                    TYPE c LENGTH 16,
        "! Xblnr
        xblnr                    TYPE c LENGTH 16,
        "! Dbblg
        dbblg                    TYPE c LENGTH 10,
        "! DbblgGjahr
        dbblg_gjahr              TYPE c LENGTH 4,
        "! DbblgBukrs
        dbblg_bukrs              TYPE c LENGTH 4,
        "! Stblg
        stblg                    TYPE c LENGTH 10,
        "! Stjah
        stjah                    TYPE c LENGTH 4,
        "! Bktxt
        bktxt                    TYPE c LENGTH 25,
        "! Waers
        waers                    TYPE c LENGTH 5,
        "! Kursf
        kursf                    TYPE p LENGTH 5 DECIMALS 5,
        "! Kzwrs
        kzwrs                    TYPE c LENGTH 5,
        "! Bstat
        bstat                    TYPE c LENGTH 1,
        "! Xnetb
        xnetb                    TYPE abap_bool,
        "! Xrueb
        xrueb                    TYPE abap_bool,
        "! Glvor
        glvor                    TYPE c LENGTH 4,
        "! Grpid
        grpid                    TYPE c LENGTH 12,
        "! Dokid
        dokid                    TYPE c LENGTH 40,
        "! Arcid
        arcid                    TYPE c LENGTH 10,
        "! Iblar
        iblar                    TYPE c LENGTH 2,
        "! Awtyp
        awtyp                    TYPE c LENGTH 5,
        "! Awkey
        awkey                    TYPE c LENGTH 20,
        "! Fikrs
        fikrs                    TYPE c LENGTH 4,
        "! Hwaer
        hwaer                    TYPE c LENGTH 5,
        "! Hwae2
        hwae_2                   TYPE c LENGTH 5,
        "! Hwae3
        hwae_3                   TYPE c LENGTH 5,
        "! Basw2
        basw_2                   TYPE c LENGTH 1,
        "! Basw3
        basw_3                   TYPE c LENGTH 1,
        "! Umrd2
        umrd_2                   TYPE c LENGTH 1,
        "! Umrd3
        umrd_3                   TYPE c LENGTH 1,
        "! Xstov
        xstov                    TYPE abap_bool,
        "! Stodt
        stodt                    TYPE datn,
        "! Xmwst
        xmwst                    TYPE abap_bool,
        "! Curt2
        curt_2                   TYPE c LENGTH 2,
        "! Curt3
        curt_3                   TYPE c LENGTH 2,
        "! Kuty2
        kuty_2                   TYPE c LENGTH 4,
        "! Kuty3
        kuty_3                   TYPE c LENGTH 4,
        "! Xsnet
        xsnet                    TYPE abap_bool,
        "! Ausbk
        ausbk                    TYPE c LENGTH 4,
        "! Xusvr
        xusvr                    TYPE abap_bool,
        "! Duefl
        duefl                    TYPE c LENGTH 1,
        "! Awsys
        awsys                    TYPE c LENGTH 10,
        "! Lotkz
        lotkz                    TYPE c LENGTH 10,
        "! Xwvof
        xwvof                    TYPE abap_bool,
        "! Stgrd
        stgrd                    TYPE c LENGTH 2,
        "! Ppnam
        ppnam                    TYPE c LENGTH 12,
        "! Ppdat
        ppdat                    TYPE datn,
        "! Pptme
        pptme                    TYPE timn,
        "! Pptcod
        pptcod                   TYPE c LENGTH 20,
        "! Brnch
        brnch                    TYPE c LENGTH 4,
        "! Numpg
        numpg                    TYPE c LENGTH 3,
        "! Adisc
        adisc                    TYPE c LENGTH 1,
        "! Xref1Hd
        xref_1_hd                TYPE c LENGTH 20,
        "! Xref2Hd
        xref_2_hd                TYPE c LENGTH 20,
        "! Xreversal
        xreversal                TYPE c LENGTH 1,
        "! Reindat
        reindat                  TYPE datn,
        "! Rldnr
        rldnr                    TYPE c LENGTH 2,
        "! Ldgrp
        ldgrp                    TYPE c LENGTH 4,
        "! Vatdate
        vatdate                  TYPE datn,
        "! Fulfilldate
        fulfilldate              TYPE datn,
        "! Doccat
        doccat                   TYPE c LENGTH 6,
        "! Xsplit
        xsplit                   TYPE abap_bool,
        "! CashAlloc
        cash_alloc               TYPE abap_bool,
        "! FollowOn
        follow_on                TYPE c LENGTH 1,
        "! Xreorg
        xreorg                   TYPE abap_bool,
        "! Subset
        subset                   TYPE c LENGTH 4,
        "! Kurst
        kurst                    TYPE c LENGTH 4,
        "! Xmca
        xmca                     TYPE abap_bool,
        "! Resubmission
        resubmission             TYPE datn,
        "! LogsystemSender
        logsystem_sender         TYPE c LENGTH 10,
        "! BukrsSender
        bukrs_sender             TYPE c LENGTH 4,
        "! BelnrSender
        belnr_sender             TYPE c LENGTH 10,
        "! GjahrSender
        gjahr_sender             TYPE c LENGTH 4,
        "! Intsubid
        intsubid                 TYPE c LENGTH 6,
        "! AworgRev
        aworg_rev                TYPE c LENGTH 10,
        "! AwrefRev
        awref_rev                TYPE c LENGTH 10,
        "! Xreversing
        xreversing               TYPE abap_bool,
        "! Xreversed
        xreversed                TYPE abap_bool,
        "! Glbtgrp
        glbtgrp                  TYPE c LENGTH 1,
        "! CoVrgng
        co_vrgng                 TYPE c LENGTH 4,
        "! CoRefbt
        co_refbt                 TYPE c LENGTH 1,
        "! CoAlebn
        co_alebn                 TYPE c LENGTH 10,
        "! CoValdt
        co_valdt                 TYPE datn,
        "! CoBelnrSender
        co_belnr_sender          TYPE c LENGTH 10,
        "! KokrsSender
        kokrs_sender             TYPE c LENGTH 4,
        "! AccPrinciple
        acc_principle            TYPE c LENGTH 4,
        "! Dataaging
        dataaging                TYPE datn,
        "! TravaPn
        trava_pn                 TYPE c LENGTH 4,
        "! LdgrpspecPn
        ldgrpspec_pn             TYPE abap_bool,
        "! AfabespecPn
        afabespec_pn             TYPE abap_bool,
        "! Xsecondary
        xsecondary               TYPE abap_bool,
        "! ReprocessingStatusCode
        reprocessing_status_code TYPE c LENGTH 1,
        "! TrrPartialInd
        trr_partial_ind          TYPE c LENGTH 1,
        "! ItemRemovalStatus
        item_removal_status      TYPE c LENGTH 1,
        "! Penrc
        penrc                    TYPE c LENGTH 2,
        "! GloRef1Hd
        glo_ref_1_hd             TYPE c LENGTH 80,
        "! GloDat1Hd
        glo_dat_1_hd             TYPE datn,
        "! GloRef2Hd
        glo_ref_2_hd             TYPE c LENGTH 25,
        "! GloDat2Hd
        glo_dat_2_hd             TYPE datn,
        "! GloRef3Hd
        glo_ref_3_hd             TYPE c LENGTH 25,
        "! GloDat3Hd
        glo_dat_3_hd             TYPE datn,
        "! GloRef4Hd
        glo_ref_4_hd             TYPE c LENGTH 50,
        "! GloDat4Hd
        glo_dat_4_hd             TYPE datn,
        "! GloRef5Hd
        glo_ref_5_hd             TYPE c LENGTH 50,
        "! GloDat5Hd
        glo_dat_5_hd             TYPE datn,
        "! GloBp1Hd
        glo_bp_1_hd              TYPE c LENGTH 10,
        "! GloBp2Hd
        glo_bp_2_hd              TYPE c LENGTH 10,
        "! EvPostngCtrl
        ev_postng_ctrl           TYPE c LENGTH 1,
        "! Whtdate
        whtdate                  TYPE datn,
        "! Cbttype
        cbttype                  TYPE c LENGTH 4,
        "! Closingstep
        closingstep              TYPE c LENGTH 3,
        "! Xdiffledgervalues
        xdiffledgervalues        TYPE abap_bool,
        "! Xledgermissing
        xledgermissing           TYPE abap_bool,
        "! Xuniquecvtyps
        xuniquecvtyps            TYPE abap_bool,
        "! TaxCountryHd
        tax_country_hd           TYPE c LENGTH 3,
        "! Anxtype
        anxtype                  TYPE abap_bool,
        "! Anxperc
        anxperc                  TYPE p LENGTH 4 DECIMALS 3,
        "! ZvatIndc
        zvat_indc                TYPE datn,
        "! xsapf15xstatus
        xsapf_15_xstatus         TYPE c LENGTH 1,
        "! Psoty
        psoty                    TYPE c LENGTH 2,
        "! Psoak
        psoak                    TYPE c LENGTH 10,
        "! Psoks
        psoks                    TYPE c LENGTH 10,
        "! Psosg
        psosg                    TYPE c LENGTH 1,
        "! Psofn
        psofn                    TYPE c LENGTH 30,
        "! Intform
        intform                  TYPE c LENGTH 4,
        "! Intdate
        intdate                  TYPE datn,
        "! Psobt
        psobt                    TYPE datn,
        "! Psozl
        psozl                    TYPE abap_bool,
        "! Psodt
        psodt                    TYPE datn,
        "! Psotm
        psotm                    TYPE timn,
        "! FmUmart
        fm_umart                 TYPE c LENGTH 1,
        "! Ccins
        ccins                    TYPE c LENGTH 4,
        "! Ccnum
        ccnum                    TYPE c LENGTH 25,
        "! Ssblk
        ssblk                    TYPE c LENGTH 1,
        "! Batch
        batch                    TYPE c LENGTH 10,
        "! Sname
        sname                    TYPE c LENGTH 12,
        "! Sampled
        sampled                  TYPE c LENGTH 1,
        "! ExcludeFlag
        exclude_flag             TYPE abap_bool,
        "! Blind
        blind                    TYPE c LENGTH 1,
        "! OffsetStatus
        offset_status            TYPE c LENGTH 2,
        "! OffsetReferDat
        offset_refer_dat         TYPE datn,
        "! Knumv
        knumv                    TYPE c LENGTH 10,
        "! Blo
        blo                      TYPE c LENGTH 1,
        "! Cnt
        cnt                      TYPE c LENGTH 10,
        "! Pybastyp
        pybastyp                 TYPE c LENGTH 2,
        "! Pybasno
        pybasno                  TYPE c LENGTH 16,
        "! Pybasdat
        pybasdat                 TYPE datn,
        "! Pyiban
        pyiban                   TYPE c LENGTH 34,
        "! InwardnoHd
        inwardno_hd              TYPE c LENGTH 30,
        "! InwarddtHd
        inwarddt_hd              TYPE datn,
      END OF tys_z_i_bkpftype,
      "! <p class="shorttext synchronized">List of Z_I_BKPFType</p>
      tyt_z_i_bkpftype TYPE STANDARD TABLE OF tys_z_i_bkpftype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">z_i_but000Type</p>
      BEGIN OF tys_z_i_but_000_type,
        "! <em>Key property</em> Partner
        partner          TYPE c LENGTH 10,
        "! Type
        type             TYPE c LENGTH 1,
        "! Bpkind
        bpkind           TYPE c LENGTH 4,
        "! BuGroup
        bu_group         TYPE c LENGTH 4,
        "! Bpext
        bpext            TYPE c LENGTH 20,
        "! BuSort1
        bu_sort_1        TYPE c LENGTH 20,
        "! BuSort2
        bu_sort_2        TYPE c LENGTH 20,
        "! Source
        source           TYPE c LENGTH 4,
        "! Title
        title            TYPE c LENGTH 4,
        "! Xdele
        xdele            TYPE abap_bool,
        "! Xblck
        xblck            TYPE abap_bool,
        "! Augrp
        augrp            TYPE c LENGTH 4,
        "! TitleLet
        title_let        TYPE c LENGTH 50,
        "! BuLogsys
        bu_logsys        TYPE c LENGTH 10,
        "! Contact
        contact          TYPE c LENGTH 1,
        "! NotReleased
        not_released     TYPE abap_bool,
        "! NotLgCompetent
        not_lg_competent TYPE abap_bool,
        "! PrintMode
        print_mode       TYPE c LENGTH 1,
        "! BpEewDummy
        bp_eew_dummy     TYPE c LENGTH 1,
        "! Rate
        rate             TYPE c LENGTH 15,
        "! NameOrg1
        name_org_1       TYPE c LENGTH 40,
        "! NameOrg2
        name_org_2       TYPE c LENGTH 40,
        "! NameOrg3
        name_org_3       TYPE c LENGTH 40,
        "! NameOrg4
        name_org_4       TYPE c LENGTH 40,
        "! LegalEnty
        legal_enty       TYPE c LENGTH 2,
        "! IndSector
        ind_sector       TYPE c LENGTH 10,
        "! LegalOrg
        legal_org        TYPE c LENGTH 2,
        "! FoundDat
        found_dat        TYPE datn,
        "! LiquidDat
        liquid_dat       TYPE datn,
        "! Location1
        location_1       TYPE c LENGTH 7,
        "! Location2
        location_2       TYPE c LENGTH 5,
        "! Location3
        location_3       TYPE c LENGTH 1,
        "! NameLast
        name_last        TYPE c LENGTH 40,
        "! NameFirst
        name_first       TYPE c LENGTH 40,
        "! NameLst2
        name_lst_2       TYPE c LENGTH 40,
        "! NameLast2
        name_last_2      TYPE c LENGTH 40,
        "! Namemiddle
        namemiddle       TYPE c LENGTH 40,
        "! TitleAca1
        title_aca_1      TYPE c LENGTH 4,
        "! TitleAca2
        title_aca_2      TYPE c LENGTH 4,
        "! TitleRoyl
        title_royl       TYPE c LENGTH 4,
        "! Prefix1
        prefix_1         TYPE c LENGTH 4,
        "! Prefix2
        prefix_2         TYPE c LENGTH 4,
        "! Name1Text
        name_1_text      TYPE c LENGTH 80,
        "! Nickname
        nickname         TYPE c LENGTH 40,
        "! Initials
        initials         TYPE c LENGTH 10,
        "! Nameformat
        nameformat       TYPE c LENGTH 2,
        "! Namcountry
        namcountry       TYPE c LENGTH 3,
        "! LanguCorr
        langu_corr       TYPE c LENGTH 2,
        "! Xsexm
        xsexm            TYPE abap_bool,
        "! Xsexf
        xsexf            TYPE abap_bool,
        "! Birthpl
        birthpl          TYPE c LENGTH 40,
        "! Marst
        marst            TYPE c LENGTH 1,
        "! Emplo
        emplo            TYPE c LENGTH 35,
        "! Jobgr
        jobgr            TYPE c LENGTH 4,
        "! Natio
        natio            TYPE c LENGTH 3,
        "! Cntax
        cntax            TYPE c LENGTH 3,
        "! Cndsc
        cndsc            TYPE c LENGTH 3,
        "! Persnumber
        persnumber       TYPE c LENGTH 10,
        "! Xsexu
        xsexu            TYPE abap_bool,
        "! Xubname
        xubname          TYPE c LENGTH 12,
        "! BuLangu
        bu_langu         TYPE c LENGTH 2,
        "! Gender
        gender           TYPE c LENGTH 1,
        "! Birthdt
        birthdt          TYPE datn,
        "! Deathdt
        deathdt          TYPE datn,
        "! Perno
        perno            TYPE c LENGTH 8,
        "! Children
        children         TYPE c LENGTH 2,
        "! MemHouse
        mem_house        TYPE p LENGTH 2 DECIMALS 0,
        "! BirthdtStatus
        birthdt_status   TYPE c LENGTH 1,
        "! Partgrptyp
        partgrptyp       TYPE c LENGTH 4,
        "! NameGrp1
        name_grp_1       TYPE c LENGTH 40,
        "! NameGrp2
        name_grp_2       TYPE c LENGTH 40,
        "! McName1
        mc_name_1        TYPE c LENGTH 35,
        "! McName2
        mc_name_2        TYPE c LENGTH 35,
        "! Crusr
        crusr            TYPE c LENGTH 12,
        "! Crdat
        crdat            TYPE datn,
        "! Crtim
        crtim            TYPE timn,
        "! Chusr
        chusr            TYPE c LENGTH 12,
        "! Chdat
        chdat            TYPE datn,
        "! Chtim
        chtim            TYPE timn,
        "! PartnerGuid
        partner_guid     TYPE sysuuid_x16,
        "! Addrcomm
        addrcomm         TYPE c LENGTH 10,
        "! TdSwitch
        td_switch        TYPE c LENGTH 1,
        "! IsOrgCentre
        is_org_centre    TYPE c LENGTH 1,
        "! DbKey
        db_key           TYPE sysuuid_x16,
        "! ValidFrom
        valid_from       TYPE timestamp,
        "! ValidTo
        valid_to         TYPE timestamp,
        "! Xpcpt
        xpcpt            TYPE c LENGTH 1,
        "! BankArea
        bank_area        TYPE c LENGTH 4,
        "! Natpers
        natpers          TYPE c LENGTH 1,
        "! Milve
        milve            TYPE abap_bool,
        "! NucSec
        nuc_sec          TYPE c LENGTH 1,
        "! ParRel
        par_rel          TYPE c LENGTH 1,
        "! BpSort
        bp_sort          TYPE c LENGTH 20,
        "! Kbanks
        kbanks           TYPE c LENGTH 3,
        "! Kbankl
        kbankl           TYPE c LENGTH 15,
      END OF tys_z_i_but_000_type,
      "! <p class="shorttext synchronized">List of z_i_but000Type</p>
      tyt_z_i_but_000_type TYPE STANDARD TABLE OF tys_z_i_but_000_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_EKBEType</p>
      BEGIN OF tys_z_i_ekbetype,
        "! Delete_mc
        delete_mc       TYPE abap_bool,
        "! Update_mc
        update_mc       TYPE abap_bool,
        "! <em>Key property</em> Ebeln
        ebeln           TYPE c LENGTH 10,
        "! <em>Key property</em> Ebelp
        ebelp           TYPE c LENGTH 5,
        "! <em>Key property</em> Zekkn
        zekkn           TYPE c LENGTH 2,
        "! <em>Key property</em> Vgabe
        vgabe           TYPE c LENGTH 1,
        "! <em>Key property</em> Gjahr
        gjahr           TYPE c LENGTH 4,
        "! <em>Key property</em> Belnr
        belnr           TYPE c LENGTH 10,
        "! <em>Key property</em> Buzei
        buzei           TYPE c LENGTH 4,
        "! Bewtp
        bewtp           TYPE c LENGTH 1,
        "! Bwart
        bwart           TYPE c LENGTH 3,
        "! Budat
        budat           TYPE datn,
        "! Menge
        menge           TYPE p LENGTH 7 DECIMALS 3,
        "! Bpmng
        bpmng           TYPE p LENGTH 7 DECIMALS 3,
        "! Dmbtr
        dmbtr           TYPE p LENGTH 7 DECIMALS 3,
        "! Wrbtr
        wrbtr           TYPE p LENGTH 7 DECIMALS 3,
        "! Waers
        waers           TYPE c LENGTH 5,
        "! Arewr
        arewr           TYPE p LENGTH 7 DECIMALS 3,
        "! Wesbs
        wesbs           TYPE p LENGTH 7 DECIMALS 3,
        "! Bpwes
        bpwes           TYPE p LENGTH 7 DECIMALS 3,
        "! Shkzg
        shkzg           TYPE c LENGTH 1,
        "! Bwtar
        bwtar           TYPE c LENGTH 10,
        "! Elikz
        elikz           TYPE abap_bool,
        "! Xblnr
        xblnr           TYPE c LENGTH 16,
        "! Lfgja
        lfgja           TYPE c LENGTH 4,
        "! Lfbnr
        lfbnr           TYPE c LENGTH 10,
        "! Lfpos
        lfpos           TYPE c LENGTH 4,
        "! Grund
        grund           TYPE c LENGTH 4,
        "! Cpudt
        cpudt           TYPE datn,
        "! Cputm
        cputm           TYPE timn,
        "! Reewr
        reewr           TYPE p LENGTH 7 DECIMALS 3,
        "! Evere
        evere           TYPE c LENGTH 2,
        "! Refwr
        refwr           TYPE p LENGTH 7 DECIMALS 3,
        "! Matnr
        matnr           TYPE c LENGTH 18,
        "! Werks
        werks           TYPE c LENGTH 4,
        "! Xwsbr
        xwsbr           TYPE abap_bool,
        "! Etens
        etens           TYPE c LENGTH 4,
        "! Knumv
        knumv           TYPE c LENGTH 10,
        "! Mwskz
        mwskz           TYPE c LENGTH 2,
        "! TaxCountry
        tax_country     TYPE c LENGTH 3,
        "! Lsmeh
        lsmeh           TYPE c LENGTH 3,
        "! Ematn
        ematn           TYPE c LENGTH 18,
        "! Hswae
        hswae           TYPE c LENGTH 5,
        "! Charg
        charg           TYPE c LENGTH 10,
        "! Bldat
        bldat           TYPE datn,
        "! Xwoff
        xwoff           TYPE abap_bool,
        "! Xunpl
        xunpl           TYPE abap_bool,
        "! Ernam
        ernam           TYPE c LENGTH 12,
        "! Srvpos
        srvpos          TYPE c LENGTH 18,
        "! Packno
        packno          TYPE c LENGTH 10,
        "! Introw
        introw          TYPE c LENGTH 10,
        "! Bekkn
        bekkn           TYPE c LENGTH 2,
        "! Lemin
        lemin           TYPE abap_bool,
        "! Saprl
        saprl           TYPE c LENGTH 4,
        "! Weora
        weora           TYPE abap_bool,
        "! Xmacc
        xmacc           TYPE c LENGTH 1,
        "! Wkurs
        wkurs           TYPE p LENGTH 5 DECIMALS 5,
        "! InvItemOrigin
        inv_item_origin TYPE c LENGTH 1,
        "! VbelnSt
        vbeln_st        TYPE c LENGTH 10,
        "! VbelpSt
        vbelp_st        TYPE c LENGTH 6,
        "! SgtScat
        sgt_scat        TYPE c LENGTH 40,
        "! Dataaging
        dataaging       TYPE datn,
        "! Sesuom
        sesuom          TYPE c LENGTH 3,
        "! Logsy
        logsy           TYPE c LENGTH 10,
        "! EtUpd
        et_upd          TYPE c LENGTH 1,
        "! xcwmxty2tq
        xcwmxty_2_tq    TYPE c LENGTH 1,
        "! JScDieCompF
        jsc_die_comp_f  TYPE c LENGTH 1,
        "! FshSeasonYear
        fsh_season_year TYPE c LENGTH 4,
        "! FshSeason
        fsh_season      TYPE c LENGTH 10,
        "! FshCollection
        fsh_collection  TYPE c LENGTH 10,
        "! FshTheme
        fsh_theme       TYPE c LENGTH 10,
        "! WrfCharstc1
        wrf_charstc_1   TYPE c LENGTH 18,
        "! WrfCharstc2
        wrf_charstc_2   TYPE c LENGTH 18,
        "! WrfCharstc3
        wrf_charstc_3   TYPE c LENGTH 18,
      END OF tys_z_i_ekbetype,
      "! <p class="shorttext synchronized">List of Z_I_EKBEType</p>
      tyt_z_i_ekbetype TYPE STANDARD TABLE OF tys_z_i_ekbetype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">z_i_EKBZType</p>
      BEGIN OF tys_z_i_ekbztype,
        "! <em>Key property</em> Ebeln
        ebeln        TYPE c LENGTH 10,
        "! <em>Key property</em> Ebelp
        ebelp        TYPE c LENGTH 5,
        "! <em>Key property</em> Stunr
        stunr        TYPE c LENGTH 3,
        "! <em>Key property</em> Zaehk
        zaehk        TYPE c LENGTH 3,
        "! <em>Key property</em> Vgabe
        vgabe        TYPE c LENGTH 1,
        "! <em>Key property</em> Gjahr
        gjahr        TYPE c LENGTH 4,
        "! <em>Key property</em> Belnr
        belnr        TYPE c LENGTH 10,
        "! <em>Key property</em> Buzei
        buzei        TYPE c LENGTH 4,
        "! Bewtp
        bewtp        TYPE c LENGTH 1,
        "! Budat
        budat        TYPE datn,
        "! Menge
        menge        TYPE p LENGTH 7 DECIMALS 3,
        "! Dmbtr
        dmbtr        TYPE p LENGTH 8 DECIMALS 3,
        "! Wrbtr
        wrbtr        TYPE p LENGTH 8 DECIMALS 3,
        "! Waers
        waers        TYPE c LENGTH 5,
        "! Arewr
        arewr        TYPE p LENGTH 8 DECIMALS 3,
        "! Shkzg
        shkzg        TYPE c LENGTH 1,
        "! Xblnr
        xblnr        TYPE c LENGTH 16,
        "! Frbnr
        frbnr        TYPE c LENGTH 16,
        "! Lifnr
        lifnr        TYPE c LENGTH 10,
        "! Cpudt
        cpudt        TYPE datn,
        "! Cputm
        cputm        TYPE timn,
        "! Reewr
        reewr        TYPE p LENGTH 8 DECIMALS 3,
        "! Refwr
        refwr        TYPE p LENGTH 8 DECIMALS 3,
        "! Bwtar
        bwtar        TYPE c LENGTH 10,
        "! Kschl
        kschl        TYPE c LENGTH 4,
        "! Bpmng
        bpmng        TYPE p LENGTH 7 DECIMALS 3,
        "! Areww
        areww        TYPE p LENGTH 8 DECIMALS 3,
        "! Hswae
        hswae        TYPE c LENGTH 5,
        "! Vnetw
        vnetw        TYPE p LENGTH 8 DECIMALS 3,
        "! Ernam
        ernam        TYPE c LENGTH 12,
        "! Shkko
        shkko        TYPE c LENGTH 1,
        "! Arewb
        arewb        TYPE p LENGTH 8 DECIMALS 3,
        "! Rewrb
        rewrb        TYPE p LENGTH 8 DECIMALS 3,
        "! Saprl
        saprl        TYPE c LENGTH 4,
        "! MengePop
        menge_pop    TYPE p LENGTH 7 DECIMALS 3,
        "! DmbtrPop
        dmbtr_pop    TYPE p LENGTH 8 DECIMALS 3,
        "! WrbtrPop
        wrbtr_pop    TYPE p LENGTH 8 DECIMALS 3,
        "! BpmngPop
        bpmng_pop    TYPE p LENGTH 7 DECIMALS 3,
        "! ArewrPop
        arewr_pop    TYPE p LENGTH 8 DECIMALS 3,
        "! Kudif
        kudif        TYPE p LENGTH 8 DECIMALS 3,
        "! Xmacc
        xmacc        TYPE c LENGTH 1,
        "! Wkurs
        wkurs        TYPE p LENGTH 5 DECIMALS 5,
        "! Dataaging
        dataaging    TYPE datn,
        "! xcwmxbamng
        xcwmxbamng   TYPE p LENGTH 7 DECIMALS 3,
        "! xcwmxwesbs
        xcwmxwesbs   TYPE p LENGTH 7 DECIMALS 3,
        "! xcwmxty2tq
        xcwmxty_2_tq TYPE c LENGTH 1,
      END OF tys_z_i_ekbztype,
      "! <p class="shorttext synchronized">List of z_i_EKBZType</p>
      tyt_z_i_ekbztype TYPE STANDARD TABLE OF tys_z_i_ekbztype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_EKKNType</p>
      BEGIN OF tys_z_i_ekkntype,
        "! <em>Key property</em> Ebeln
        ebeln               TYPE c LENGTH 10,
        "! <em>Key property</em> Ebelp
        ebelp               TYPE c LENGTH 5,
        "! <em>Key property</em> Zekkn
        zekkn               TYPE c LENGTH 2,
        "! Loekz
        loekz               TYPE abap_bool,
        "! Aedat
        aedat               TYPE datn,
        "! Kflag
        kflag               TYPE abap_bool,
        "! Menge
        menge               TYPE p LENGTH 7 DECIMALS 3,
        "! Vproz
        vproz               TYPE p LENGTH 2 DECIMALS 1,
        "! Netwr
        netwr               TYPE p LENGTH 7 DECIMALS 2,
        "! Sakto
        sakto               TYPE c LENGTH 10,
        "! Gsber
        gsber               TYPE c LENGTH 4,
        "! Kostl
        kostl               TYPE c LENGTH 10,
        "! Projn
        projn               TYPE c LENGTH 16,
        "! Vbeln
        vbeln               TYPE c LENGTH 10,
        "! Vbelp
        vbelp               TYPE c LENGTH 6,
        "! Veten
        veten               TYPE c LENGTH 4,
        "! Kzbrb
        kzbrb               TYPE c LENGTH 1,
        "! Anln1
        anln_1              TYPE c LENGTH 12,
        "! Anln2
        anln_2              TYPE c LENGTH 4,
        "! Aufnr
        aufnr               TYPE c LENGTH 12,
        "! Wempf
        wempf               TYPE c LENGTH 12,
        "! Ablad
        ablad               TYPE c LENGTH 25,
        "! Kokrs
        kokrs               TYPE c LENGTH 4,
        "! Xbkst
        xbkst               TYPE abap_bool,
        "! Xbauf
        xbauf               TYPE abap_bool,
        "! Xbpro
        xbpro               TYPE abap_bool,
        "! Erekz
        erekz               TYPE abap_bool,
        "! Kstrg
        kstrg               TYPE c LENGTH 12,
        "! Paobjnr
        paobjnr             TYPE c LENGTH 10,
        "! Prctr
        prctr               TYPE c LENGTH 10,
        "! PsPspPnr
        ps_psp_pnr          TYPE c LENGTH 8,
        "! Nplnr
        nplnr               TYPE c LENGTH 12,
        "! Aufpl
        aufpl               TYPE c LENGTH 10,
        "! Imkey
        imkey               TYPE c LENGTH 8,
        "! Aplzl
        aplzl               TYPE c LENGTH 8,
        "! Vptnr
        vptnr               TYPE c LENGTH 10,
        "! Fipos
        fipos               TYPE c LENGTH 14,
        "! Recid
        recid               TYPE c LENGTH 2,
        "! ServiceDocType
        service_doc_type    TYPE c LENGTH 4,
        "! ServiceDocId
        service_doc_id      TYPE c LENGTH 10,
        "! ServiceDocItemId
        service_doc_item_id TYPE c LENGTH 6,
        "! DummyInclEewCobl
        dummy_incl_eew_cobl TYPE c LENGTH 1,
        "! Fistl
        fistl               TYPE c LENGTH 16,
        "! Geber
        geber               TYPE c LENGTH 10,
        "! Fkber
        fkber               TYPE c LENGTH 16,
        "! Dabrz
        dabrz               TYPE datn,
        "! AufplOrd
        aufpl_ord           TYPE c LENGTH 10,
        "! AplzlOrd
        aplzl_ord           TYPE c LENGTH 8,
        "! Mwskz
        mwskz               TYPE c LENGTH 2,
        "! Txjcd
        txjcd               TYPE c LENGTH 15,
        "! Navnw
        navnw               TYPE p LENGTH 7 DECIMALS 2,
        "! Kblnr
        kblnr               TYPE c LENGTH 10,
        "! Kblpos
        kblpos              TYPE c LENGTH 3,
        "! Lstar
        lstar               TYPE c LENGTH 6,
        "! Prznr
        prznr               TYPE c LENGTH 12,
        "! GrantNbr
        grant_nbr           TYPE c LENGTH 20,
        "! BudgetPd
        budget_pd           TYPE c LENGTH 10,
        "! FmSplitBatch
        fm_split_batch      TYPE c LENGTH 3,
        "! FmSplitBegru
        fm_split_begru      TYPE c LENGTH 4,
        "! AaFinalInd
        aa_final_ind        TYPE abap_bool,
        "! AaFinalReason
        aa_final_reason     TYPE c LENGTH 2,
        "! AaFinalQty
        aa_final_qty        TYPE p LENGTH 7 DECIMALS 3,
        "! AaFinalQtyF
        aa_final_qty_f      TYPE /iwbep/v4_float,
        "! MengeF
        menge_f             TYPE /iwbep/v4_float,
        "! FmfgusKey
        fmfgus_key          TYPE sysuuid_x16,
        "! Dataaging
        dataaging           TYPE datn,
        "! Egrup
        egrup               TYPE c LENGTH 3,
        "! Vname
        vname               TYPE c LENGTH 6,
        "! KblnrCab
        kblnr_cab           TYPE c LENGTH 10,
        "! KblposCab
        kblpos_cab          TYPE c LENGTH 3,
        "! Tcobjnr
        tcobjnr             TYPE c LENGTH 22,
        "! Dateofservice
        dateofservice       TYPE datn,
        "! Notaxcorr
        notaxcorr           TYPE abap_bool,
        "! Diffoptrate
        diffoptrate         TYPE p LENGTH 5 DECIMALS 6,
        "! Hasdiffoptrate
        hasdiffoptrate      TYPE abap_bool,
      END OF tys_z_i_ekkntype,
      "! <p class="shorttext synchronized">List of Z_I_EKKNType</p>
      tyt_z_i_ekkntype TYPE STANDARD TABLE OF tys_z_i_ekkntype WITH DEFAULT KEY.

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
        cupit                      TYPE c LENGTH 15,
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
      "! <p class="shorttext synchronized">Z_I_ESKNType</p>
      BEGIN OF tys_z_i_eskntype,
        "! <em>Key property</em> Packno
        packno              TYPE c LENGTH 10,
        "! <em>Key property</em> Zekkn
        zekkn               TYPE c LENGTH 2,
        "! Bekkn
        bekkn               TYPE c LENGTH 2,
        "! Loekz
        loekz               TYPE abap_bool,
        "! Aedat
        aedat               TYPE datn,
        "! Kflag
        kflag               TYPE abap_bool,
        "! Wproz
        wproz               TYPE p LENGTH 3 DECIMALS 1,
        "! Netwr
        netwr               TYPE p LENGTH 7 DECIMALS 3,
        "! Sakto
        sakto               TYPE c LENGTH 10,
        "! Gsber
        gsber               TYPE c LENGTH 4,
        "! Kostl
        kostl               TYPE c LENGTH 10,
        "! Vbeln
        vbeln               TYPE c LENGTH 10,
        "! Vbelp
        vbelp               TYPE c LENGTH 6,
        "! Veten
        veten               TYPE c LENGTH 4,
        "! Anln1
        anln_1              TYPE c LENGTH 12,
        "! Anln2
        anln_2              TYPE c LENGTH 4,
        "! Aufnr
        aufnr               TYPE c LENGTH 12,
        "! Kokrs
        kokrs               TYPE c LENGTH 4,
        "! Xbkst
        xbkst               TYPE abap_bool,
        "! Xbauf
        xbauf               TYPE abap_bool,
        "! Xbpro
        xbpro               TYPE abap_bool,
        "! Erekz
        erekz               TYPE abap_bool,
        "! Kstrg
        kstrg               TYPE c LENGTH 12,
        "! Paobjnr
        paobjnr             TYPE c LENGTH 10,
        "! Prctr
        prctr               TYPE c LENGTH 10,
        "! PsPspPnr
        ps_psp_pnr          TYPE c LENGTH 8,
        "! Nplnr
        nplnr               TYPE c LENGTH 12,
        "! Aufpl
        aufpl               TYPE c LENGTH 10,
        "! Imkey
        imkey               TYPE c LENGTH 8,
        "! Aplzl
        aplzl               TYPE c LENGTH 8,
        "! Vptnr
        vptnr               TYPE c LENGTH 10,
        "! Fipos
        fipos               TYPE c LENGTH 14,
        "! Recid
        recid               TYPE c LENGTH 2,
        "! DummyInclEewCobl
        dummy_incl_eew_cobl TYPE c LENGTH 1,
        "! Fistl
        fistl               TYPE c LENGTH 16,
        "! Geber
        geber               TYPE c LENGTH 10,
        "! Fkber
        fkber               TYPE c LENGTH 16,
        "! Mwskz
        mwskz               TYPE c LENGTH 2,
        "! Txjcd
        txjcd               TYPE c LENGTH 15,
        "! Navnw
        navnw               TYPE p LENGTH 7 DECIMALS 3,
        "! Kblnr
        kblnr               TYPE c LENGTH 10,
        "! Kblpos
        kblpos              TYPE c LENGTH 3,
        "! Dabrz
        dabrz               TYPE datn,
        "! Lstar
        lstar               TYPE c LENGTH 6,
        "! Prznr
        prznr               TYPE c LENGTH 12,
        "! GrantNbr
        grant_nbr           TYPE c LENGTH 20,
        "! FmSplitBatch
        fm_split_batch      TYPE c LENGTH 3,
        "! FmSplitBegru
        fm_split_begru      TYPE c LENGTH 4,
        "! BudgetPd
        budget_pd           TYPE c LENGTH 10,
        "! FmfgusKey
        fmfgus_key          TYPE sysuuid_x16,
        "! Dataaging
        dataaging           TYPE datn,
        "! Tcobjnr
        tcobjnr             TYPE c LENGTH 22,
        "! Dateofservice
        dateofservice       TYPE datn,
        "! Notaxcorr
        notaxcorr           TYPE abap_bool,
        "! Diffoptrate
        diffoptrate         TYPE p LENGTH 5 DECIMALS 6,
        "! Hasdiffoptrate
        hasdiffoptrate      TYPE abap_bool,
      END OF tys_z_i_eskntype,
      "! <p class="shorttext synchronized">List of Z_I_ESKNType</p>
      tyt_z_i_eskntype TYPE STANDARD TABLE OF tys_z_i_eskntype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_ESLLType</p>
      BEGIN OF tys_z_i_eslltype,
        "! <em>Key property</em> Packno
        packno          TYPE c LENGTH 10,
        "! Introw
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
      "! <p class="shorttext synchronized">Z_I_LFA1Type</p>
      BEGIN OF tys_z_i_lfa_1_type,
        "! <em>Key property</em> Lifnr
        lifnr                    TYPE c LENGTH 10,
        "! Land1
        land_1                   TYPE c LENGTH 3,
        "! Name1
        name_1                   TYPE c LENGTH 35,
        "! Name2
        name_2                   TYPE c LENGTH 35,
        "! Name3
        name_3                   TYPE c LENGTH 35,
        "! Name4
        name_4                   TYPE c LENGTH 35,
        "! Ort01
        ort_01                   TYPE c LENGTH 35,
        "! Ort02
        ort_02                   TYPE c LENGTH 35,
        "! Pfach
        pfach                    TYPE c LENGTH 10,
        "! Pstl2
        pstl_2                   TYPE c LENGTH 10,
        "! Pstlz
        pstlz                    TYPE c LENGTH 10,
        "! Regio
        regio                    TYPE c LENGTH 3,
        "! Sortl
        sortl                    TYPE c LENGTH 10,
        "! Stras
        stras                    TYPE c LENGTH 35,
        "! Adrnr
        adrnr                    TYPE c LENGTH 10,
        "! Mcod1
        mcod_1                   TYPE c LENGTH 25,
        "! Mcod2
        mcod_2                   TYPE c LENGTH 25,
        "! Mcod3
        mcod_3                   TYPE c LENGTH 25,
        "! Anred
        anred                    TYPE c LENGTH 15,
        "! Bahns
        bahns                    TYPE c LENGTH 25,
        "! Bbbnr
        bbbnr                    TYPE c LENGTH 7,
        "! Bbsnr
        bbsnr                    TYPE c LENGTH 5,
        "! Begru
        begru                    TYPE c LENGTH 4,
        "! Brsch
        brsch                    TYPE c LENGTH 4,
        "! Bubkz
        bubkz                    TYPE c LENGTH 1,
        "! Datlt
        datlt                    TYPE c LENGTH 14,
        "! Dtams
        dtams                    TYPE c LENGTH 1,
        "! Dtaws
        dtaws                    TYPE c LENGTH 2,
        "! Erdat
        erdat                    TYPE datn,
        "! Ernam
        ernam                    TYPE c LENGTH 12,
        "! Esrnr
        esrnr                    TYPE c LENGTH 11,
        "! Konzs
        konzs                    TYPE c LENGTH 10,
        "! Ktokk
        ktokk                    TYPE c LENGTH 4,
        "! Kunnr
        kunnr                    TYPE c LENGTH 10,
        "! Lnrza
        lnrza                    TYPE c LENGTH 10,
        "! Loevm
        loevm                    TYPE abap_bool,
        "! Sperr
        sperr                    TYPE abap_bool,
        "! Sperm
        sperm                    TYPE abap_bool,
        "! Spras
        spras                    TYPE c LENGTH 2,
        "! Stcd1
        stcd_1                   TYPE c LENGTH 16,
        "! Stcd2
        stcd_2                   TYPE c LENGTH 11,
        "! Stkza
        stkza                    TYPE c LENGTH 1,
        "! Stkzu
        stkzu                    TYPE abap_bool,
        "! Telbx
        telbx                    TYPE c LENGTH 15,
        "! Telf1
        telf_1                   TYPE c LENGTH 16,
        "! Telf2
        telf_2                   TYPE c LENGTH 16,
        "! Telfx
        telfx                    TYPE c LENGTH 31,
        "! Teltx
        teltx                    TYPE c LENGTH 30,
        "! Telx1
        telx_1                   TYPE c LENGTH 30,
        "! Xcpdk
        xcpdk                    TYPE abap_bool,
        "! Xzemp
        xzemp                    TYPE abap_bool,
        "! Vbund
        vbund                    TYPE c LENGTH 6,
        "! Fiskn
        fiskn                    TYPE c LENGTH 10,
        "! Stceg
        stceg                    TYPE c LENGTH 20,
        "! Stkzn
        stkzn                    TYPE c LENGTH 1,
        "! Sperq
        sperq                    TYPE c LENGTH 2,
        "! Gbort
        gbort                    TYPE c LENGTH 25,
        "! Gbdat
        gbdat                    TYPE datn,
        "! Sexkz
        sexkz                    TYPE c LENGTH 1,
        "! Kraus
        kraus                    TYPE c LENGTH 11,
        "! Revdb
        revdb                    TYPE datn,
        "! Qssys
        qssys                    TYPE c LENGTH 4,
        "! Ktock
        ktock                    TYPE c LENGTH 4,
        "! Pfort
        pfort                    TYPE c LENGTH 35,
        "! Werks
        werks                    TYPE c LENGTH 4,
        "! Ltsna
        ltsna                    TYPE abap_bool,
        "! Werkr
        werkr                    TYPE abap_bool,
        "! Plkal
        plkal                    TYPE c LENGTH 2,
        "! Duefl
        duefl                    TYPE c LENGTH 1,
        "! Txjcd
        txjcd                    TYPE c LENGTH 15,
        "! Sperz
        sperz                    TYPE abap_bool,
        "! Scacd
        scacd                    TYPE c LENGTH 4,
        "! Sfrgr
        sfrgr                    TYPE c LENGTH 4,
        "! Lzone
        lzone                    TYPE c LENGTH 10,
        "! Xlfza
        xlfza                    TYPE abap_bool,
        "! Dlgrp
        dlgrp                    TYPE c LENGTH 4,
        "! Fityp
        fityp                    TYPE c LENGTH 2,
        "! Stcdt
        stcdt                    TYPE c LENGTH 2,
        "! Regss
        regss                    TYPE abap_bool,
        "! Actss
        actss                    TYPE c LENGTH 3,
        "! Stcd3
        stcd_3                   TYPE c LENGTH 18,
        "! Stcd4
        stcd_4                   TYPE c LENGTH 18,
        "! Stcd5
        stcd_5                   TYPE c LENGTH 60,
        "! Stcd6
        stcd_6                   TYPE c LENGTH 20,
        "! Ipisp
        ipisp                    TYPE abap_bool,
        "! Taxbs
        taxbs                    TYPE c LENGTH 1,
        "! Profs
        profs                    TYPE c LENGTH 30,
        "! Stgdl
        stgdl                    TYPE c LENGTH 2,
        "! Emnfr
        emnfr                    TYPE c LENGTH 10,
        "! Lfurl
        lfurl                    TYPE c LENGTH 132,
        "! J1kfrepre
        j_1_kfrepre              TYPE c LENGTH 10,
        "! J1kftbus
        j_1_kftbus               TYPE c LENGTH 30,
        "! J1kftind
        j_1_kftind               TYPE c LENGTH 30,
        "! Confs
        confs                    TYPE c LENGTH 1,
        "! Updat
        updat                    TYPE datn,
        "! Uptim
        uptim                    TYPE timn,
        "! Nodel
        nodel                    TYPE abap_bool,
        "! Qssysdat
        qssysdat                 TYPE datn,
        "! Podkzb
        podkzb                   TYPE c LENGTH 1,
        "! Fisku
        fisku                    TYPE c LENGTH 10,
        "! Stenr
        stenr                    TYPE c LENGTH 18,
        "! CarrierConf
        carrier_conf             TYPE c LENGTH 1,
        "! MinComp
        min_comp                 TYPE abap_bool,
        "! TermLi
        term_li                  TYPE abap_bool,
        "! CrcNum
        crc_num                  TYPE c LENGTH 25,
        "! CvpXblck
        cvp_xblck                TYPE c LENGTH 1,
        "! Weora
        weora                    TYPE abap_bool,
        "! Rg
        rg                       TYPE c LENGTH 11,
        "! Exp
        exp                      TYPE c LENGTH 3,
        "! Uf
        uf                       TYPE c LENGTH 2,
        "! Rgdate
        rgdate                   TYPE datn,
        "! Ric
        ric                      TYPE c LENGTH 11,
        "! Rne
        rne                      TYPE c LENGTH 10,
        "! Rnedate
        rnedate                  TYPE datn,
        "! Cnae
        cnae                     TYPE c LENGTH 7,
        "! Legalnat
        legalnat                 TYPE c LENGTH 4,
        "! Crtn
        crtn                     TYPE c LENGTH 1,
        "! Icmstaxpay
        icmstaxpay               TYPE c LENGTH 2,
        "! Indtyp
        indtyp                   TYPE c LENGTH 2,
        "! Tdt
        tdt                      TYPE c LENGTH 2,
        "! Comsize
        comsize                  TYPE c LENGTH 2,
        "! Decregpc
        decregpc                 TYPE c LENGTH 2,
        "! AllowanceType
        allowance_type           TYPE c LENGTH 1,
        "! Paytrsn
        paytrsn                  TYPE c LENGTH 4,
        "! Lfa1EewSupp
        lfa_1_eew_supp           TYPE c LENGTH 1,
        "! JScCurrency
        jsc_currency             TYPE c LENGTH 5,
        "! Alc
        alc                      TYPE c LENGTH 8,
        "! PmtOffice
        pmt_office               TYPE c LENGTH 5,
        "! PpaRelevant
        ppa_relevant             TYPE abap_bool,
        "! SamUeId
        sam_ue_id                TYPE c LENGTH 12,
        "! SamEftInd
        sam_eft_ind              TYPE c LENGTH 4,
        "! Psofg
        psofg                    TYPE c LENGTH 10,
        "! Psois
        psois                    TYPE c LENGTH 20,
        "! Pson1
        pson_1                   TYPE c LENGTH 35,
        "! Pson2
        pson_2                   TYPE c LENGTH 35,
        "! Pson3
        pson_3                   TYPE c LENGTH 35,
        "! Psovn
        psovn                    TYPE c LENGTH 35,
        "! Psotl
        psotl                    TYPE c LENGTH 20,
        "! Psohs
        psohs                    TYPE c LENGTH 6,
        "! Psost
        psost                    TYPE c LENGTH 28,
        "! BorgrDatun
        borgr_datun              TYPE datn,
        "! BorgrYeaun
        borgr_yeaun              TYPE abap_bool,
        "! AuCarryingEnt
        au_carrying_ent          TYPE abap_bool,
        "! AuIndUnder18
        au_ind_under_18          TYPE abap_bool,
        "! AuPaymentNotExceed75
        au_payment_not_exceed_75 TYPE abap_bool,
        "! AuWhollyInpTaxed
        au_wholly_inp_taxed      TYPE abap_bool,
        "! AuPartnerWithoutGain
        au_partner_without_gain  TYPE abap_bool,
        "! AuNotEntitledAbn
        au_not_entitled_abn      TYPE abap_bool,
        "! AuPaymentExempt
        au_payment_exempt        TYPE abap_bool,
        "! AuPrivateHobby
        au_private_hobby         TYPE abap_bool,
        "! AuDomesticNature
        au_domestic_nature       TYPE abap_bool,
        "! Addr2Street
        addr_2_street            TYPE c LENGTH 60,
        "! Addr2HouseNum
        addr_2_house_num         TYPE c LENGTH 10,
        "! Addr2Post
        addr_2_post              TYPE c LENGTH 10,
        "! Addr2City
        addr_2_city              TYPE c LENGTH 40,
        "! Addr2Country
        addr_2_country           TYPE c LENGTH 3,
        "! Categ
        categ                    TYPE c LENGTH 12,
        "! PartnerName
        partner_name             TYPE c LENGTH 30,
        "! PartnerUtr
        partner_utr              TYPE c LENGTH 20,
        "! Status
        status                   TYPE c LENGTH 3,
        "! Vfnum
        vfnum                    TYPE c LENGTH 20,
        "! Vfnid
        vfnid                    TYPE c LENGTH 1,
        "! Crn
        crn                      TYPE c LENGTH 8,
        "! FrOccupation
        fr_occupation            TYPE c LENGTH 50,
        "! J1iexcd
        j_1_iexcd                TYPE c LENGTH 40,
        "! J1iexrn
        j_1_iexrn                TYPE c LENGTH 40,
        "! J1iexrg
        j_1_iexrg                TYPE c LENGTH 60,
        "! J1iexdi
        j_1_iexdi                TYPE c LENGTH 60,
        "! J1iexco
        j_1_iexco                TYPE c LENGTH 60,
        "! J1icstno
        j_1_icstno               TYPE c LENGTH 40,
        "! J1ilstno
        j_1_ilstno               TYPE c LENGTH 40,
        "! J1ipanno
        j_1_ipanno               TYPE c LENGTH 40,
        "! J1iexcive
        j_1_iexcive              TYPE c LENGTH 1,
        "! J1issist
        j_1_issist               TYPE c LENGTH 1,
        "! J1ivtyp
        j_1_ivtyp                TYPE c LENGTH 2,
        "! J1ivencre
        j_1_ivencre              TYPE abap_bool,
        "! Aedat
        aedat                    TYPE datn,
        "! Usnam
        usnam                    TYPE c LENGTH 12,
        "! J1isern
        j_1_isern                TYPE c LENGTH 40,
        "! J1ipanref
        j_1_ipanref              TYPE c LENGTH 40,
        "! J1ipanvaldt
        j_1_ipanvaldt            TYPE datn,
        "! J1iCustoms
        j_1_i_customs            TYPE abap_bool,
        "! J1idedref
        j_1_idedref              TYPE c LENGTH 10,
        "! VenClass
        ven_class                TYPE c LENGTH 1,
        "! Entpub
        entpub                   TYPE abap_bool,
        "! Escrit
        escrit                   TYPE c LENGTH 80,
        "! Dvalss
        dvalss                   TYPE datn,
        "! Frmcss
        frmcss                   TYPE c LENGTH 50,
        "! Codcae
        codcae                   TYPE c LENGTH 5,
        "! Ausdiv
        ausdiv                   TYPE abap_bool,
        "! ScCurrency
        sc_currency              TYPE c LENGTH 5,
        "! TransportChain
        transport_chain          TYPE c LENGTH 10,
        "! StagingTime
        staging_time             TYPE p LENGTH 2 DECIMALS 0,
        "! SchedulingType
        scheduling_type          TYPE c LENGTH 1,
        "! SubmiRelevant
        submi_relevant           TYPE abap_bool,
      END OF tys_z_i_lfa_1_type,
      "! <p class="shorttext synchronized">List of Z_I_LFA1Type</p>
      tyt_z_i_lfa_1_type TYPE STANDARD TABLE OF tys_z_i_lfa_1_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_LFBWType</p>
      BEGIN OF tys_z_i_lfbwtype,
        "! Delete_mc
        delete_mc TYPE abap_bool,
        "! Update_mc
        update_mc TYPE abap_bool,
        "! <em>Key property</em> Lifnr
        lifnr     TYPE c LENGTH 10,
        "! <em>Key property</em> Bukrs
        bukrs     TYPE c LENGTH 4,
        "! <em>Key property</em> Witht
        witht     TYPE c LENGTH 2,
        "! WtSubjct
        wt_subjct TYPE abap_bool,
        "! Qsrec
        qsrec     TYPE c LENGTH 2,
        "! WtWtstcd
        wt_wtstcd TYPE c LENGTH 16,
        "! WtWithcd
        wt_withcd TYPE c LENGTH 2,
        "! WtExnr
        wt_exnr   TYPE c LENGTH 25,
        "! WtExrt
        wt_exrt   TYPE p LENGTH 3 DECIMALS 2,
        "! WtExdf
        wt_exdf   TYPE datn,
        "! WtExdt
        wt_exdt   TYPE datn,
        "! WtWtexrs
        wt_wtexrs TYPE c LENGTH 2,
      END OF tys_z_i_lfbwtype,
      "! <p class="shorttext synchronized">List of Z_I_LFBWType</p>
      tyt_z_i_lfbwtype TYPE STANDARD TABLE OF tys_z_i_lfbwtype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_RBKPType</p>
      BEGIN OF tys_z_i_rbkptype,
        "! Delete_mc
        delete_mc                  TYPE abap_bool,
        "! Update_mc
        update_mc                  TYPE abap_bool,
        "! <em>Key property</em> Belnr
        belnr                      TYPE c LENGTH 10,
        "! <em>Key property</em> Gjahr
        gjahr                      TYPE c LENGTH 4,
        "! Blart
        blart                      TYPE c LENGTH 2,
        "! Bldat
        bldat                      TYPE datn,
        "! Budat
        budat                      TYPE datn,
        "! Usnam
        usnam                      TYPE c LENGTH 12,
        "! Tcode
        tcode                      TYPE c LENGTH 20,
        "! Cpudt
        cpudt                      TYPE datn,
        "! Cputm
        cputm                      TYPE timn,
        "! Vgart
        vgart                      TYPE c LENGTH 2,
        "! Xblnr
        xblnr                      TYPE c LENGTH 16,
        "! Bukrs
        bukrs                      TYPE c LENGTH 4,
        "! Lifnr
        lifnr                      TYPE c LENGTH 10,
        "! Waers
        waers                      TYPE c LENGTH 5,
        "! Kursf
        kursf                      TYPE p LENGTH 5 DECIMALS 5,
        "! Txdat
        txdat                      TYPE datn,
        "! TxdatFrom
        txdat_from                 TYPE datn,
        "! Mwskz1
        mwskz_1                    TYPE c LENGTH 2,
        "! Mwskz2
        mwskz_2                    TYPE c LENGTH 2,
        "! Zterm
        zterm                      TYPE c LENGTH 4,
        "! Zbd1t
        zbd_1_t                    TYPE p LENGTH 2 DECIMALS 0,
        "! Zbd1p
        zbd_1_p                    TYPE p LENGTH 3 DECIMALS 3,
        "! Zbd2t
        zbd_2_t                    TYPE p LENGTH 2 DECIMALS 0,
        "! Zbd2p
        zbd_2_p                    TYPE p LENGTH 3 DECIMALS 3,
        "! Zbd3t
        zbd_3_t                    TYPE p LENGTH 2 DECIMALS 0,
        "! Xrech
        xrech                      TYPE c LENGTH 1,
        "! Bktxt
        bktxt                      TYPE c LENGTH 25,
        "! Saprl
        saprl                      TYPE c LENGTH 4,
        "! Logsys
        logsys                     TYPE c LENGTH 10,
        "! Xmwst
        xmwst                      TYPE abap_bool,
        "! Stblg
        stblg                      TYPE c LENGTH 10,
        "! Stjah
        stjah                      TYPE c LENGTH 4,
        "! MwskzBnk
        mwskz_bnk                  TYPE c LENGTH 2,
        "! TxjcdBnk
        txjcd_bnk                  TYPE c LENGTH 15,
        "! Ivtyp
        ivtyp                      TYPE c LENGTH 1,
        "! Xrbtx
        xrbtx                      TYPE abap_bool,
        "! Repart
        repart                     TYPE c LENGTH 1,
        "! Rbstat
        rbstat                     TYPE c LENGTH 1,
        "! Knumve
        knumve                     TYPE c LENGTH 10,
        "! Knumvl
        knumvl                     TYPE c LENGTH 10,
        "! Xautakz
        xautakz                    TYPE abap_bool,
        "! Esrnr
        esrnr                      TYPE c LENGTH 11,
        "! Esrpz
        esrpz                      TYPE c LENGTH 2,
        "! Esrre
        esrre                      TYPE c LENGTH 27,
        "! Qsskz
        qsskz                      TYPE c LENGTH 2,
        "! Diekz
        diekz                      TYPE c LENGTH 1,
        "! Landl
        landl                      TYPE c LENGTH 3,
        "! Lzbkz
        lzbkz                      TYPE c LENGTH 3,
        "! Txkrs
        txkrs                      TYPE p LENGTH 5 DECIMALS 5,
        "! Ctxkrs
        ctxkrs                     TYPE p LENGTH 5 DECIMALS 5,
        "! Empfb
        empfb                      TYPE c LENGTH 10,
        "! Bvtyp
        bvtyp                      TYPE c LENGTH 4,
        "! Hbkid
        hbkid                      TYPE c LENGTH 5,
        "! Hktid
        hktid                      TYPE c LENGTH 5,
        "! Zuonr
        zuonr                      TYPE c LENGTH 18,
        "! Zlspr
        zlspr                      TYPE c LENGTH 1,
        "! Zlsch
        zlsch                      TYPE c LENGTH 1,
        "! Zfbdt
        zfbdt                      TYPE datn,
        "! Kidno
        kidno                      TYPE c LENGTH 30,
        "! Rebzg
        rebzg                      TYPE c LENGTH 10,
        "! Rebzj
        rebzj                      TYPE c LENGTH 4,
        "! Xinve
        xinve                      TYPE abap_bool,
        "! Egmld
        egmld                      TYPE c LENGTH 3,
        "! Xegdr
        xegdr                      TYPE abap_bool,
        "! Vatdate
        vatdate                    TYPE datn,
        "! Hkont
        hkont                      TYPE c LENGTH 10,
        "! Monat
        monat                      TYPE c LENGTH 2,
        "! J1bnftype
        j_1_bnftype                TYPE c LENGTH 2,
        "! Brnch
        brnch                      TYPE c LENGTH 4,
        "! Erfpr
        erfpr                      TYPE c LENGTH 12,
        "! Secco
        secco                      TYPE c LENGTH 4,
        "! Name1
        name_1                     TYPE c LENGTH 35,
        "! Name2
        name_2                     TYPE c LENGTH 35,
        "! Name3
        name_3                     TYPE c LENGTH 35,
        "! Name4
        name_4                     TYPE c LENGTH 35,
        "! Pstlz
        pstlz                      TYPE c LENGTH 10,
        "! Ort01
        ort_01                     TYPE c LENGTH 35,
        "! Land1
        land_1                     TYPE c LENGTH 3,
        "! Stras
        stras                      TYPE c LENGTH 35,
        "! Pfach
        pfach                      TYPE c LENGTH 10,
        "! Pstl2
        pstl_2                     TYPE c LENGTH 10,
        "! Pskto
        pskto                      TYPE c LENGTH 16,
        "! Bankn
        bankn                      TYPE c LENGTH 18,
        "! Bankl
        bankl                      TYPE c LENGTH 15,
        "! Banks
        banks                      TYPE c LENGTH 3,
        "! Stcd1
        stcd_1                     TYPE c LENGTH 16,
        "! Stcd2
        stcd_2                     TYPE c LENGTH 11,
        "! Stkzu
        stkzu                      TYPE abap_bool,
        "! Stkza
        stkza                      TYPE c LENGTH 1,
        "! Regio
        regio                      TYPE c LENGTH 3,
        "! Bkont
        bkont                      TYPE c LENGTH 2,
        "! Dtaws
        dtaws                      TYPE c LENGTH 2,
        "! Dtams
        dtams                      TYPE c LENGTH 1,
        "! Spras
        spras                      TYPE c LENGTH 1,
        "! Xcpdk
        xcpdk                      TYPE abap_bool,
        "! Empfg
        empfg                      TYPE c LENGTH 16,
        "! Fityp
        fityp                      TYPE c LENGTH 2,
        "! Stcdt
        stcdt                      TYPE c LENGTH 2,
        "! Stkzn
        stkzn                      TYPE c LENGTH 1,
        "! Stcd3
        stcd_3                     TYPE c LENGTH 18,
        "! Stcd4
        stcd_4                     TYPE c LENGTH 18,
        "! Bkref
        bkref                      TYPE c LENGTH 20,
        "! J1kfrepre
        j_1_kfrepre                TYPE c LENGTH 10,
        "! J1kftbus
        j_1_kftbus                 TYPE c LENGTH 30,
        "! J1kftind
        j_1_kftind                 TYPE c LENGTH 30,
        "! Anred
        anred                      TYPE c LENGTH 15,
        "! Stceg
        stceg                      TYPE c LENGTH 20,
        "! Stcd5
        stcd_5                     TYPE c LENGTH 60,
        "! Intad
        intad                      TYPE c LENGTH 130,
        "! GloRe1Ot
        glo_re_1_ot                TYPE c LENGTH 140,
        "! Ername
        ername                     TYPE c LENGTH 12,
        "! Reindat
        reindat                    TYPE datn,
        "! Uzawe
        uzawe                      TYPE c LENGTH 2,
        "! Fdlev
        fdlev                      TYPE c LENGTH 2,
        "! Fdtag
        fdtag                      TYPE datn,
        "! Zbfix
        zbfix                      TYPE c LENGTH 1,
        "! Frgkz
        frgkz                      TYPE abap_bool,
        "! Erfnam
        erfnam                     TYPE c LENGTH 12,
        "! Bupla
        bupla                      TYPE c LENGTH 4,
        "! Filkd
        filkd                      TYPE c LENGTH 10,
        "! Gsber
        gsber                      TYPE c LENGTH 4,
        "! Lotkz
        lotkz                      TYPE c LENGTH 10,
        "! Sgtxt
        sgtxt                      TYPE c LENGTH 50,
        "! InvTran
        inv_tran                   TYPE c LENGTH 1,
        "! PrepayStatus
        prepay_status              TYPE c LENGTH 1,
        "! PrepayAwkey
        prepay_awkey               TYPE c LENGTH 20,
        "! AssignStatus
        assign_status              TYPE c LENGTH 1,
        "! AssignNextDate
        assign_next_date           TYPE datn,
        "! AssignEndDate
        assign_end_date            TYPE datn,
        "! CopyByBelnr
        copy_by_belnr              TYPE c LENGTH 10,
        "! CopyByYear
        copy_by_year               TYPE c LENGTH 4,
        "! CopyToBelnr
        copy_to_belnr              TYPE c LENGTH 10,
        "! CopyToYear
        copy_to_year               TYPE c LENGTH 4,
        "! CopyUser
        copy_user                  TYPE c LENGTH 12,
        "! Kursx
        kursx                      TYPE p LENGTH 15 DECIMALS 14,
        "! Wwert
        wwert                      TYPE datn,
        "! Xref3
        xref_3                     TYPE c LENGTH 20,
        "! DummyMmivSiSHeaderEewPs
        dummy_mmiv_si_sheader_eew  TYPE c LENGTH 1,
        "! BusinessNetworkOrigin
        business_network_origin    TYPE c LENGTH 2,
        "! Iseopblocked
        iseopblocked               TYPE c LENGTH 1,
        "! Lastchangedatetime
        lastchangedatetime         TYPE p LENGTH 11 DECIMALS 7,
        "! GloRef1Hd
        glo_ref_1_hd               TYPE c LENGTH 80,
        "! GloDat1Hd
        glo_dat_1_hd               TYPE datn,
        "! GloRef2Hd
        glo_ref_2_hd               TYPE c LENGTH 25,
        "! GloDat2Hd
        glo_dat_2_hd               TYPE datn,
        "! GloRef3Hd
        glo_ref_3_hd               TYPE c LENGTH 25,
        "! GloDat3Hd
        glo_dat_3_hd               TYPE datn,
        "! GloRef4Hd
        glo_ref_4_hd               TYPE c LENGTH 50,
        "! GloDat4Hd
        glo_dat_4_hd               TYPE datn,
        "! GloRef5Hd
        glo_ref_5_hd               TYPE c LENGTH 50,
        "! GloDat5Hd
        glo_dat_5_hd               TYPE datn,
        "! GloBp1Hd
        glo_bp_1_hd                TYPE c LENGTH 10,
        "! GloBp2Hd
        glo_bp_2_hd                TYPE c LENGTH 10,
        "! CimReplicationtimestamp
        cim_replicationtimestamp   TYPE p LENGTH 11 DECIMALS 7,
        "! Tmtype
        tmtype                     TYPE c LENGTH 1,
        "! TaxCountry
        tax_country                TYPE c LENGTH 3,
        "! TaxCountryBnk
        tax_country_bnk            TYPE c LENGTH 3,
        "! Fulfilldate
        fulfilldate                TYPE datn,
        "! BusinessobjectidVcm
        businessobjectid_vcm       TYPE c LENGTH 35,
        "! Specialtaxhandlingisrequired
        specialtaxhandlingisrequir TYPE abap_bool,
        "! NodeKey
        node_key                   TYPE sysuuid_x16,
        "! ParentKey
        parent_key                 TYPE sysuuid_x16,
        "! RootKey
        root_key                   TYPE sysuuid_x16,
        "! J1tpbupl
        j_1_tpbupl                 TYPE c LENGTH 5,
        "! LogmxUuid
        logmx_uuid                 TYPE c LENGTH 36,
        "! Anxtype
        anxtype                    TYPE abap_bool,
        "! Anxperc
        anxperc                    TYPE p LENGTH 4 DECIMALS 3,
        "! ZvatIndc
        zvat_indc                  TYPE datn,
        "! xilexpark
        xilexpark                  TYPE c LENGTH 1,
        "! xilexhold
        xilexhold                  TYPE c LENGTH 1,
        "! xilexbapiSave
        xilexbapi_save             TYPE c LENGTH 1,
        "! GstPart
        gst_part                   TYPE c LENGTH 10,
        "! PlcSup
        plc_sup                    TYPE c LENGTH 3,
        "! Irn
        irn                        TYPE c LENGTH 64,
        "! Pybastyp
        pybastyp                   TYPE c LENGTH 2,
        "! Pybasno
        pybasno                    TYPE c LENGTH 16,
        "! Pybasdat
        pybasdat                   TYPE datn,
        "! Pyiban
        pyiban                     TYPE c LENGTH 34,
        "! InwardnoHd
        inwardno_hd                TYPE c LENGTH 30,
        "! InwarddtHd
        inwarddt_hd                TYPE datn,
      END OF tys_z_i_rbkptype,
      "! <p class="shorttext synchronized">List of Z_I_RBKPType</p>
      tyt_z_i_rbkptype TYPE STANDARD TABLE OF tys_z_i_rbkptype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_T006Type</p>
      BEGIN OF tys_z_i_t_006_type,
        "! <em>Key property</em> Msehi
        msehi      TYPE c LENGTH 3,
        "! Kzex3
        kzex_3     TYPE abap_bool,
        "! Kzex6
        kzex_6     TYPE abap_bool,
        "! Andec
        andec      TYPE int2,
        "! Kzkeh
        kzkeh      TYPE abap_bool,
        "! Kzwob
        kzwob      TYPE abap_bool,
        "! Kz1eh
        kz_1_eh    TYPE abap_bool,
        "! Kz2eh
        kz_2_eh    TYPE abap_bool,
        "! Dimid
        dimid      TYPE c LENGTH 6,
        "! Zaehl
        zaehl      TYPE int4,
        "! Nennr
        nennr      TYPE int4,
        "! Exp10
        exp_10     TYPE int2,
        "! Addko
        addko      TYPE p LENGTH 5 DECIMALS 6,
        "! Expon
        expon      TYPE int2,
        "! Decan
        decan      TYPE int2,
        "! Isocode
        isocode    TYPE c LENGTH 3,
        "! Primary1
        primary_1  TYPE abap_bool,
        "! TempValue
        temp_value TYPE /iwbep/v4_float,
        "! TempUnit
        temp_unit  TYPE c LENGTH 3,
        "! Famunit
        famunit    TYPE c LENGTH 1,
        "! PressVal
        press_val  TYPE /iwbep/v4_float,
        "! PressUnit
        press_unit TYPE c LENGTH 3,
      END OF tys_z_i_t_006_type,
      "! <p class="shorttext synchronized">List of Z_I_T006Type</p>
      tyt_z_i_t_006_type TYPE STANDARD TABLE OF tys_z_i_t_006_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_VFKPType</p>
      BEGIN OF tys_z_i_vfkptype,
        "! <em>Key property</em> Fknum
        fknum     TYPE c LENGTH 10,
        "! <em>Key property</em> Fkpos
        fkpos     TYPE c LENGTH 6,
        "! Fkpty
        fkpty     TYPE c LENGTH 4,
        "! Bukrs
        bukrs     TYPE c LENGTH 4,
        "! Netwr
        netwr     TYPE p LENGTH 8 DECIMALS 3,
        "! Mwsbp
        mwsbp     TYPE p LENGTH 7 DECIMALS 3,
        "! Waers
        waers     TYPE c LENGTH 5,
        "! Mwskz
        mwskz     TYPE c LENGTH 2,
        "! Prsdt
        prsdt     TYPE datn,
        "! Budat
        budat     TYPE datn,
        "! Exti1
        exti_1    TYPE c LENGTH 20,
        "! Exti2
        exti_2    TYPE c LENGTH 20,
        "! Tplst
        tplst     TYPE c LENGTH 4,
        "! Vsart
        vsart     TYPE c LENGTH 2,
        "! Kalsm
        kalsm     TYPE c LENGTH 6,
        "! Knumv
        knumv     TYPE c LENGTH 10,
        "! Werks
        werks     TYPE c LENGTH 4,
        "! Ekorg
        ekorg     TYPE c LENGTH 4,
        "! Ekgrp
        ekgrp     TYPE c LENGTH 3,
        "! Ebeln
        ebeln     TYPE c LENGTH 10,
        "! Ebelp
        ebelp     TYPE c LENGTH 5,
        "! Lblni
        lblni     TYPE c LENGTH 10,
        "! Parvw
        parvw     TYPE c LENGTH 2,
        "! Tdlnr
        tdlnr     TYPE c LENGTH 10,
        "! Rechs
        rechs     TYPE c LENGTH 10,
        "! Kurst
        kurst     TYPE c LENGTH 4,
        "! Kosty
        kosty     TYPE c LENGTH 1,
        "! Refty
        refty     TYPE c LENGTH 4,
        "! Rebel
        rebel     TYPE c LENGTH 10,
        "! Repos
        repos     TYPE c LENGTH 6,
        "! Postx
        postx     TYPE c LENGTH 40,
        "! Knttp
        knttp     TYPE c LENGTH 1,
        "! Bklas
        bklas     TYPE c LENGTH 4,
        "! Stber
        stber     TYPE c LENGTH 1,
        "! Dtber
        dtber     TYPE datn,
        "! Uzber
        uzber     TYPE timn,
        "! Stfre
        stfre     TYPE c LENGTH 1,
        "! Dtfre
        dtfre     TYPE datn,
        "! Uzfre
        uzfre     TYPE timn,
        "! Stabr
        stabr     TYPE c LENGTH 1,
        "! Dtabr
        dtabr     TYPE datn,
        "! Uzabr
        uzabr     TYPE timn,
        "! Ernam
        ernam     TYPE c LENGTH 12,
        "! Erdat
        erdat     TYPE datn,
        "! Erzet
        erzet     TYPE timn,
        "! Aenam
        aenam     TYPE c LENGTH 12,
        "! Aedat
        aedat     TYPE datn,
        "! Aezet
        aezet     TYPE timn,
        "! Logsys
        logsys    TYPE c LENGTH 10,
        "! Kstau
        kstau     TYPE c LENGTH 1,
        "! Trfzna
        trfzna    TYPE c LENGTH 10,
        "! Trfznz
        trfznz    TYPE c LENGTH 10,
        "! Txjcd
        txjcd     TYPE c LENGTH 15,
        "! Baswr
        baswr     TYPE p LENGTH 8 DECIMALS 3,
        "! Sland1A
        sland_1_a TYPE c LENGTH 3,
        "! Sland1Z
        sland_1_z TYPE c LENGTH 3,
        "! Fksto
        fksto     TYPE abap_bool,
        "! Kzwi1
        kzwi_1    TYPE p LENGTH 7 DECIMALS 3,
        "! Kzwi2
        kzwi_2    TYPE p LENGTH 7 DECIMALS 3,
        "! Kzwi3
        kzwi_3    TYPE p LENGTH 7 DECIMALS 3,
        "! Kzwi4
        kzwi_4    TYPE p LENGTH 7 DECIMALS 3,
        "! Kzwi5
        kzwi_5    TYPE p LENGTH 7 DECIMALS 3,
        "! Kzwi6
        kzwi_6    TYPE p LENGTH 7 DECIMALS 3,
      END OF tys_z_i_vfkptype,
      "! <p class="shorttext synchronized">List of Z_I_VFKPType</p>
      tyt_z_i_vfkptype TYPE STANDARD TABLE OF tys_z_i_vfkptype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_VTTKType</p>
      BEGIN OF tys_z_i_vttktype,
        "! <em>Key property</em> Tknum
        tknum           TYPE c LENGTH 10,
        "! Vbtyp
        vbtyp           TYPE c LENGTH 4,
        "! Shtyp
        shtyp           TYPE c LENGTH 4,
        "! Tplst
        tplst           TYPE c LENGTH 4,
        "! Ernam
        ernam           TYPE c LENGTH 12,
        "! Erdat
        erdat           TYPE datn,
        "! Erzet
        erzet           TYPE timn,
        "! Aenam
        aenam           TYPE c LENGTH 12,
        "! Aedat
        aedat           TYPE datn,
        "! Aezet
        aezet           TYPE timn,
        "! Sterm
        sterm           TYPE c LENGTH 1,
        "! Abfer
        abfer           TYPE c LENGTH 1,
        "! Abwst
        abwst           TYPE c LENGTH 1,
        "! Bfart
        bfart           TYPE c LENGTH 1,
        "! Vsart
        vsart           TYPE c LENGTH 2,
        "! Vsavl
        vsavl           TYPE c LENGTH 2,
        "! Vsanl
        vsanl           TYPE c LENGTH 2,
        "! Laufk
        laufk           TYPE c LENGTH 1,
        "! Vsbed
        vsbed           TYPE c LENGTH 2,
        "! Route
        route           TYPE c LENGTH 6,
        "! Signi
        signi           TYPE c LENGTH 20,
        "! Exti1
        exti_1          TYPE c LENGTH 20,
        "! Exti2
        exti_2          TYPE c LENGTH 20,
        "! Tpbez
        tpbez           TYPE c LENGTH 20,
        "! Stdis
        stdis           TYPE c LENGTH 1,
        "! Dtdis
        dtdis           TYPE datn,
        "! Uzdis
        uzdis           TYPE timn,
        "! Streg
        streg           TYPE c LENGTH 1,
        "! Dpreg
        dpreg           TYPE datn,
        "! Upreg
        upreg           TYPE timn,
        "! Dareg
        dareg           TYPE datn,
        "! Uareg
        uareg           TYPE timn,
        "! Stlbg
        stlbg           TYPE c LENGTH 1,
        "! Dplbg
        dplbg           TYPE datn,
        "! Uplbg
        uplbg           TYPE timn,
        "! Dalbg
        dalbg           TYPE datn,
        "! Ualbg
        ualbg           TYPE timn,
        "! Stlad
        stlad           TYPE c LENGTH 1,
        "! Dplen
        dplen           TYPE datn,
        "! Uplen
        uplen           TYPE timn,
        "! Dalen
        dalen           TYPE datn,
        "! Ualen
        ualen           TYPE timn,
        "! Stabf
        stabf           TYPE c LENGTH 1,
        "! Dpabf
        dpabf           TYPE datn,
        "! Upabf
        upabf           TYPE timn,
        "! Dtabf
        dtabf           TYPE datn,
        "! Uzabf
        uzabf           TYPE timn,
        "! Sttbg
        sttbg           TYPE c LENGTH 1,
        "! Dptbg
        dptbg           TYPE datn,
        "! Uptbg
        uptbg           TYPE timn,
        "! Datbg
        datbg           TYPE datn,
        "! Uatbg
        uatbg           TYPE timn,
        "! Stten
        stten           TYPE c LENGTH 1,
        "! Dpten
        dpten           TYPE datn,
        "! Upten
        upten           TYPE timn,
        "! Daten
        daten           TYPE datn,
        "! Uaten
        uaten           TYPE timn,
        "! Sttrg
        sttrg           TYPE c LENGTH 1,
        "! Tdlnr
        tdlnr           TYPE c LENGTH 10,
        "! Ternr
        ternr           TYPE c LENGTH 12,
        "! Pkstk
        pkstk           TYPE abap_bool,
        "! Dtmeg
        dtmeg           TYPE c LENGTH 3,
        "! Dtmev
        dtmev           TYPE c LENGTH 3,
        "! Medst
        medst           TYPE c LENGTH 3,
        "! Meizt
        meizt           TYPE c LENGTH 3,
        "! Stafo
        stafo           TYPE c LENGTH 6,
        "! Fbsta
        fbsta           TYPE c LENGTH 1,
        "! Fbgst
        fbgst           TYPE c LENGTH 1,
        "! Arsta
        arsta           TYPE c LENGTH 1,
        "! Argst
        argst           TYPE c LENGTH 1,
        "! StermDone
        sterm_done      TYPE c LENGTH 1,
        "! VseFrk
        vse_frk         TYPE c LENGTH 1,
        "! Kkalsm
        kkalsm          TYPE c LENGTH 6,
        "! Sdabw
        sdabw           TYPE c LENGTH 4,
        "! Frkrl
        frkrl           TYPE c LENGTH 1,
        "! Gesztd
        gesztd          TYPE p LENGTH 8 DECIMALS 0,
        "! Fahztd
        fahztd          TYPE p LENGTH 8 DECIMALS 0,
        "! Gesztda
        gesztda         TYPE p LENGTH 8 DECIMALS 0,
        "! Fahztda
        fahztda         TYPE p LENGTH 8 DECIMALS 0,
        "! RocpyDone
        rocpy_done      TYPE c LENGTH 1,
        "! Handle
        handle          TYPE sysuuid_x16,
        "! Tsegfl
        tsegfl          TYPE abap_bool,
        "! Tsegtp
        tsegtp          TYPE c LENGTH 10,
        "! Add01
        add_01          TYPE c LENGTH 10,
        "! Add02
        add_02          TYPE c LENGTH 10,
        "! Add03
        add_03          TYPE c LENGTH 10,
        "! Add04
        add_04          TYPE c LENGTH 10,
        "! Text1
        text_1          TYPE c LENGTH 40,
        "! Text2
        text_2          TYPE c LENGTH 40,
        "! Text3
        text_3          TYPE c LENGTH 40,
        "! Text4
        text_4          TYPE c LENGTH 40,
        "! Proli
        proli           TYPE c LENGTH 3,
        "! Dgtlock
        dgtlock         TYPE abap_bool,
        "! Dgmddat
        dgmddat         TYPE datn,
        "! ContDg
        cont_dg         TYPE abap_bool,
        "! Warztd
        warztd          TYPE c LENGTH 20,
        "! Warztda
        warztda         TYPE c LENGTH 20,
        "! Aulwe
        aulwe           TYPE c LENGTH 10,
        "! Tndrst
        tndrst          TYPE c LENGTH 2,
        "! Tndrrc
        tndrrc          TYPE c LENGTH 2,
        "! TndrText
        tndr_text       TYPE c LENGTH 80,
        "! Tndrdat
        tndrdat         TYPE datn,
        "! Tndrzet
        tndrzet         TYPE timn,
        "! TndrMaxc
        tndr_maxc       TYPE c LENGTH 5,
        "! TndrActc
        tndr_actc       TYPE c LENGTH 5,
        "! TndrCarr
        tndr_carr       TYPE c LENGTH 10,
        "! TndrCrnm
        tndr_crnm       TYPE c LENGTH 35,
        "! TndrTrkid
        tndr_trkid      TYPE c LENGTH 35,
        "! TndrExpd
        tndr_expd       TYPE datn,
        "! TndrExpt
        tndr_expt       TYPE timn,
        "! TndrErpd
        tndr_erpd       TYPE datn,
        "! TndrErpt
        tndr_erpt       TYPE timn,
        "! TndrLtpd
        tndr_ltpd       TYPE datn,
        "! TndrLtpt
        tndr_ltpt       TYPE timn,
        "! TndrErdd
        tndr_erdd       TYPE datn,
        "! TndrErdt
        tndr_erdt       TYPE timn,
        "! TndrLtdd
        tndr_ltdd       TYPE datn,
        "! TndrLtdt
        tndr_ltdt       TYPE timn,
        "! TndrLdlu
        tndr_ldlu       TYPE c LENGTH 3,
        "! Kzhulfr
        kzhulfr         TYPE c LENGTH 1,
        "! Vlstk
        vlstk           TYPE c LENGTH 1,
        "! Verursys
        verursys        TYPE c LENGTH 10,
        "! CmIdent
        cm_ident        TYPE c LENGTH 12,
        "! CmSequence
        cm_sequence     TYPE c LENGTH 4,
        "! ExtFreightOrd
        ext_freight_ord TYPE c LENGTH 20,
        "! ExtTmSys
        ext_tm_sys      TYPE c LENGTH 60,
        "! xbev1xrpfar1
        xbev_1_xrpfar_1 TYPE c LENGTH 10,
        "! xbev1xrpfar2
        xbev_1_xrpfar_2 TYPE c LENGTH 10,
        "! xbev1xrpmowa
        xbev_1_xrpmowa  TYPE c LENGTH 18,
        "! xbev1xrpanhae
        xbev_1_xrpanhae TYPE c LENGTH 18,
        "! xbev1xrpflgnr
        xbev_1_xrpflgnr TYPE c LENGTH 5,
        "! xvsoxrStatus
        xvsoxr_status   TYPE c LENGTH 1,
      END OF tys_z_i_vttktype,
      "! <p class="shorttext synchronized">List of Z_I_VTTKType</p>
      tyt_z_i_vttktype TYPE STANDARD TABLE OF tys_z_i_vttktype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_VTTSType</p>
      BEGIN OF tys_z_i_vttstype,
        "! <em>Key property</em> Tknum
        tknum    TYPE c LENGTH 10,
        "! Tsnum
        tsnum    TYPE c LENGTH 4,
        "! Tstyp
        tstyp    TYPE c LENGTH 1,
        "! Tsrfo
        tsrfo    TYPE c LENGTH 4,
        "! Elupd
        elupd    TYPE c LENGTH 1,
        "! Ernam
        ernam    TYPE c LENGTH 12,
        "! Erdat
        erdat    TYPE datn,
        "! Erzet
        erzet    TYPE timn,
        "! Aenam
        aenam    TYPE c LENGTH 12,
        "! Aedat
        aedat    TYPE datn,
        "! Aezet
        aezet    TYPE timn,
        "! Route
        route    TYPE c LENGTH 6,
        "! Vsart
        vsart    TYPE c LENGTH 2,
        "! Inco1
        inco_1   TYPE c LENGTH 3,
        "! Laufk
        laufk    TYPE c LENGTH 1,
        "! Adrna
        adrna    TYPE c LENGTH 10,
        "! Knota
        knota    TYPE c LENGTH 10,
        "! Vstel
        vstel    TYPE c LENGTH 4,
        "! Lstel
        lstel    TYPE c LENGTH 2,
        "! Werka
        werka    TYPE c LENGTH 4,
        "! Lgorta
        lgorta   TYPE c LENGTH 4,
        "! Kunna
        kunna    TYPE c LENGTH 10,
        "! Lifna
        lifna    TYPE c LENGTH 10,
        "! Belad
        belad    TYPE c LENGTH 25,
        "! Adrnz
        adrnz    TYPE c LENGTH 10,
        "! Knotz
        knotz    TYPE c LENGTH 10,
        "! Vstez
        vstez    TYPE c LENGTH 4,
        "! Lstez
        lstez    TYPE c LENGTH 2,
        "! Werkz
        werkz    TYPE c LENGTH 4,
        "! Lgortz
        lgortz   TYPE c LENGTH 4,
        "! Kunnz
        kunnz    TYPE c LENGTH 10,
        "! Lifnz
        lifnz    TYPE c LENGTH 10,
        "! Ablad
        ablad    TYPE c LENGTH 25,
        "! Dptbg
        dptbg    TYPE datn,
        "! Uptbg
        uptbg    TYPE timn,
        "! Datbg
        datbg    TYPE datn,
        "! Uatbg
        uatbg    TYPE timn,
        "! Dpten
        dpten    TYPE datn,
        "! Upten
        upten    TYPE timn,
        "! Daten
        daten    TYPE datn,
        "! Uaten
        uaten    TYPE timn,
        "! Tdlnr
        tdlnr    TYPE c LENGTH 10,
        "! Distz
        distz    TYPE p LENGTH 7 DECIMALS 3,
        "! Medst
        medst    TYPE c LENGTH 3,
        "! Fahzt
        fahzt    TYPE p LENGTH 3 DECIMALS 2,
        "! Geszt
        geszt    TYPE p LENGTH 3 DECIMALS 2,
        "! Meizt
        meizt    TYPE c LENGTH 3,
        "! Lgnuma
        lgnuma   TYPE c LENGTH 3,
        "! Tora
        tora     TYPE c LENGTH 3,
        "! Adrknza
        adrknza  TYPE c LENGTH 1,
        "! Kunabla
        kunabla  TYPE c LENGTH 25,
        "! Lgnumz
        lgnumz   TYPE c LENGTH 3,
        "! Torz
        torz     TYPE c LENGTH 3,
        "! Adrknzz
        adrknzz  TYPE c LENGTH 1,
        "! Kunablz
        kunablz  TYPE c LENGTH 25,
        "! Gesztd
        gesztd   TYPE p LENGTH 6 DECIMALS 0,
        "! Fahztd
        fahztd   TYPE p LENGTH 6 DECIMALS 0,
        "! Gesztda
        gesztda  TYPE p LENGTH 6 DECIMALS 0,
        "! Fahztda
        fahztda  TYPE p LENGTH 6 DECIMALS 0,
        "! Sdabw
        sdabw    TYPE c LENGTH 4,
        "! Frkrl
        frkrl    TYPE c LENGTH 1,
        "! Skalsm
        skalsm   TYPE c LENGTH 6,
        "! Fbsta
        fbsta    TYPE c LENGTH 1,
        "! Arsta
        arsta    TYPE c LENGTH 1,
        "! Stafo
        stafo    TYPE c LENGTH 6,
        "! ContDg
        cont_dg  TYPE abap_bool,
        "! Warztd
        warztd   TYPE p LENGTH 6 DECIMALS 0,
        "! Warztda
        warztda  TYPE p LENGTH 6 DECIMALS 0,
        "! Abland1
        abland_1 TYPE c LENGTH 3,
        "! Abpstlz
        abpstlz  TYPE c LENGTH 10,
        "! Abort01
        abort_01 TYPE c LENGTH 35,
        "! Edland1
        edland_1 TYPE c LENGTH 3,
        "! Edpstlz
        edpstlz  TYPE c LENGTH 10,
        "! Edort01
        edort_01 TYPE c LENGTH 35,
      END OF tys_z_i_vttstype,
      "! <p class="shorttext synchronized">List of Z_I_VTTSType</p>
      tyt_z_i_vttstype TYPE STANDARD TABLE OF tys_z_i_vttstype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Z_I_ZINV_SPOOLType</p>
      BEGIN OF tys_z_i_zinv_spooltype,
        "! <em>Key property</em> Nofact
        nofact     TYPE c LENGTH 16,
        "! <em>Key property</em> Doctyp
        doctyp     TYPE c LENGTH 1,
        "! <em>Key property</em> Ebeln
        ebeln      TYPE c LENGTH 10,
        "! <em>Key property</em> Lifnr
        lifnr      TYPE c LENGTH 10,
        "! <em>Key property</em> Folio
        folio      TYPE c LENGTH 10,
        "! <em>Key property</em> Fecha
        fecha      TYPE datn,
        "! <em>Key property</em> Hora
        hora       TYPE timn,
        "! RfcEmisor
        rfc_emisor TYPE c LENGTH 16,
        "! Cocode
        cocode     TYPE c LENGTH 4,
        "! Fefact
        fefact     TYPE datn,
        "! Waers
        waers      TYPE c LENGTH 5,
        "! Taxcode
        taxcode    TYPE c LENGTH 2,
        "! Impbrt
        impbrt     TYPE p LENGTH 8 DECIMALS 3,
        "! Impiva
        impiva     TYPE p LENGTH 8 DECIMALS 3,
        "! Impnet
        impnet     TYPE p LENGTH 8 DECIMALS 3,
        "! Zuser
        zuser      TYPE c LENGTH 12,
        "! InvoiceMm
        invoice_mm TYPE c LENGTH 10,
        "! YearMm
        year_mm    TYPE c LENGTH 4,
        "! InvoiceFi
        invoice_fi TYPE c LENGTH 10,
        "! YearFi
        year_fi    TYPE c LENGTH 4,
        "! ErrorFlag
        error_flag TYPE c LENGTH 1,
        "! Message
        message    TYPE c LENGTH 220,
      END OF tys_z_i_zinv_spooltype,
      "! <p class="shorttext synchronized">List of Z_I_ZINV_SPOOLType</p>
      tyt_z_i_zinv_spooltype TYPE STANDARD TABLE OF tys_z_i_zinv_spooltype WITH DEFAULT KEY.


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
        "! SAP__HierarchySet
        "! <br/> Collection of type 'SAP__Hierarchy'
        sap_hierarchy_set          TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_HIERARCHY_SET',
        "! SAP__MyDocumentDescriptions
        "! <br/> Collection of type 'SAP__DocumentDescription'
        sap_my_document_descriptio TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_MY_DOCUMENT_DESCRIPTIO',
        "! SAP__PDFFooterSet
        "! <br/> Collection of type 'SAP__PDFFooter'
        sap_pdffooter_set          TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_PDFFOOTER_SET',
        "! SAP__PDFHeaderSet
        "! <br/> Collection of type 'SAP__PDFHeader'
        sap_pdfheader_set          TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SAP_PDFHEADER_SET',
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
        "! Z_I_ADRC
        "! <br/> Collection of type 'Z_I_ADRCType'
        z_i_adrc                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_ADRC',
        "! Z_I_BKPF
        "! <br/> Collection of type 'Z_I_BKPFType'
        z_i_bkpf                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_BKPF',
        "! z_i_but000
        "! <br/> Collection of type 'z_i_but000Type'
        z_i_but_000                TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_BUT_000',
        "! Z_I_EKBE
        "! <br/> Collection of type 'Z_I_EKBEType'
        z_i_ekbe                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_EKBE',
        "! z_i_EKBZ
        "! <br/> Collection of type 'z_i_EKBZType'
        z_i_ekbz                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_EKBZ',
        "! Z_I_EKKN
        "! <br/> Collection of type 'Z_I_EKKNType'
        z_i_ekkn                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_EKKN',
        "! Z_I_EKKO
        "! <br/> Collection of type 'Z_I_EKKOType'
        z_i_ekko                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_EKKO',
        "! Z_I_EKPO
        "! <br/> Collection of type 'Z_I_EKPOType'
        z_i_ekpo                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_EKPO',
        "! Z_I_ESKN
        "! <br/> Collection of type 'Z_I_ESKNType'
        z_i_eskn                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_ESKN',
        "! Z_I_ESLL
        "! <br/> Collection of type 'Z_I_ESLLType'
        z_i_esll                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_ESLL',
        "! Z_I_LFA1
        "! <br/> Collection of type 'Z_I_LFA1Type'
        z_i_lfa_1                  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_LFA_1',
        "! Z_I_LFBW
        "! <br/> Collection of type 'Z_I_LFBWType'
        z_i_lfbw                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_LFBW',
        "! Z_I_RBKP
        "! <br/> Collection of type 'Z_I_RBKPType'
        z_i_rbkp                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_RBKP',
        "! Z_I_T006
        "! <br/> Collection of type 'Z_I_T006Type'
        z_i_t_006                  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_T_006',
        "! Z_I_VFKP
        "! <br/> Collection of type 'Z_I_VFKPType'
        z_i_vfkp                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_VFKP',
        "! Z_I_VTTK
        "! <br/> Collection of type 'Z_I_VTTKType'
        z_i_vttk                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_VTTK',
        "! Z_I_VTTS
        "! <br/> Collection of type 'Z_I_VTTSType'
        z_i_vtts                   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_VTTS',
        "! Z_I_ZINV_SPOOL
        "! <br/> Collection of type 'Z_I_ZINV_SPOOLType'
        z_i_zinv_spool             TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'Z_I_ZINV_SPOOL',
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
        "! <p class="shorttext synchronized">Internal names for SAP__HeaderFooterField</p>
        "! See also structure type {@link ..tys_sap_header_footer_field}
        BEGIN OF sap_header_footer_field,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_header_footer_field,
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
            "! Footer
            footer        TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'FOOTER',
            "! Format
            format        TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'FORMAT',
            "! Header
            header        TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADER',
            "! Hierarchy
            hierarchy     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HIERARCHY',
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
        "! <p class="shorttext synchronized">Internal names for SAP__Hierarchy</p>
        "! See also structure type {@link ..tys_sap_hierarchy}
        BEGIN OF sap_hierarchy,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_hierarchy,
        "! <p class="shorttext synchronized">Internal names for SAP__PDFFooter</p>
        "! See also structure type {@link ..tys_sap_pdffooter}
        BEGIN OF sap_pdffooter,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_pdffooter,
        "! <p class="shorttext synchronized">Internal names for SAP__PDFHeader</p>
        "! See also structure type {@link ..tys_sap_pdfheader}
        BEGIN OF sap_pdfheader,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_pdfheader,
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
        "! <p class="shorttext synchronized">Internal names for Z_I_ADRCType</p>
        "! See also structure type {@link ..tys_z_i_adrctype}
        BEGIN OF z_i_adrctype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_adrctype,
        "! <p class="shorttext synchronized">Internal names for Z_I_BKPFType</p>
        "! See also structure type {@link ..tys_z_i_bkpftype}
        BEGIN OF z_i_bkpftype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_bkpftype,
        "! <p class="shorttext synchronized">Internal names for z_i_but000Type</p>
        "! See also structure type {@link ..tys_z_i_but_000_type}
        BEGIN OF z_i_but_000_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_but_000_type,
        "! <p class="shorttext synchronized">Internal names for Z_I_EKBEType</p>
        "! See also structure type {@link ..tys_z_i_ekbetype}
        BEGIN OF z_i_ekbetype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_ekbetype,
        "! <p class="shorttext synchronized">Internal names for z_i_EKBZType</p>
        "! See also structure type {@link ..tys_z_i_ekbztype}
        BEGIN OF z_i_ekbztype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_ekbztype,
        "! <p class="shorttext synchronized">Internal names for Z_I_EKKNType</p>
        "! See also structure type {@link ..tys_z_i_ekkntype}
        BEGIN OF z_i_ekkntype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_ekkntype,
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
        "! <p class="shorttext synchronized">Internal names for Z_I_ESKNType</p>
        "! See also structure type {@link ..tys_z_i_eskntype}
        BEGIN OF z_i_eskntype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_eskntype,
        "! <p class="shorttext synchronized">Internal names for Z_I_ESLLType</p>
        "! See also structure type {@link ..tys_z_i_eslltype}
        BEGIN OF z_i_eslltype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_eslltype,
        "! <p class="shorttext synchronized">Internal names for Z_I_LFA1Type</p>
        "! See also structure type {@link ..tys_z_i_lfa_1_type}
        BEGIN OF z_i_lfa_1_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_lfa_1_type,
        "! <p class="shorttext synchronized">Internal names for Z_I_LFBWType</p>
        "! See also structure type {@link ..tys_z_i_lfbwtype}
        BEGIN OF z_i_lfbwtype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_lfbwtype,
        "! <p class="shorttext synchronized">Internal names for Z_I_RBKPType</p>
        "! See also structure type {@link ..tys_z_i_rbkptype}
        BEGIN OF z_i_rbkptype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_rbkptype,
        "! <p class="shorttext synchronized">Internal names for Z_I_T006Type</p>
        "! See also structure type {@link ..tys_z_i_t_006_type}
        BEGIN OF z_i_t_006_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_t_006_type,
        "! <p class="shorttext synchronized">Internal names for Z_I_VFKPType</p>
        "! See also structure type {@link ..tys_z_i_vfkptype}
        BEGIN OF z_i_vfkptype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_vfkptype,
        "! <p class="shorttext synchronized">Internal names for Z_I_VTTKType</p>
        "! See also structure type {@link ..tys_z_i_vttktype}
        BEGIN OF z_i_vttktype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_vttktype,
        "! <p class="shorttext synchronized">Internal names for Z_I_VTTSType</p>
        "! See also structure type {@link ..tys_z_i_vttstype}
        BEGIN OF z_i_vttstype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_vttstype,
        "! <p class="shorttext synchronized">Internal names for Z_I_ZINV_SPOOLType</p>
        "! See also structure type {@link ..tys_z_i_zinv_spooltype}
        BEGIN OF z_i_zinv_spooltype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF z_i_zinv_spooltype,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define SAP__FitToPage</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_fit_to_page RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__HeaderFooterField</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_header_footer_field RAISING /iwbep/cx_gateway.

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

    "! <p class="shorttext synchronized">Define SAP__Hierarchy</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_hierarchy RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__PDFFooter</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_pdffooter RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__PDFHeader</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_pdfheader RAISING /iwbep/cx_gateway.

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

    "! <p class="shorttext synchronized">Define Z_I_ADRCType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_adrctype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_BKPFType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_bkpftype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define z_i_but000Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_but_000_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_EKBEType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_ekbetype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define z_i_EKBZType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_ekbztype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_EKKNType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_ekkntype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_EKKOType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_ekkotype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_EKPOType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_ekpotype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_ESKNType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_eskntype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_ESLLType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_eslltype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_LFA1Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_lfa_1_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_LFBWType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_lfbwtype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_RBKPType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_rbkptype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_T006Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_t_006_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_VFKPType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_vfkptype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_VTTKType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_vttktype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_VTTSType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_vttstype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Z_I_ZINV_SPOOLType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_z_i_zinv_spooltype RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSCM_ZVERIFICA_FACTURA IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'cds_zsd_zverifica_factura' ) ##NO_TEXT.

    def_sap_fit_to_page( ).
    def_sap_header_footer_field( ).
    def_sap_cover_page( ).
    def_sap_currency( ).
    def_sap_document_description( ).
    def_sap_format( ).
    def_sap_hierarchy( ).
    def_sap_pdffooter( ).
    def_sap_pdfheader( ).
    def_sap_pdfstandard( ).
    def_sap_signature( ).
    def_sap_table_columns( ).
    def_sap_unit_of_measure( ).
    def_sap_value_help( ).
    def_z_i_adrctype( ).
    def_z_i_bkpftype( ).
    def_z_i_but_000_type( ).
    def_z_i_ekbetype( ).
    def_z_i_ekbztype( ).
    def_z_i_ekkntype( ).
    def_z_i_ekkotype( ).
    def_z_i_ekpotype( ).
    def_z_i_eskntype( ).
    def_z_i_eslltype( ).
    def_z_i_lfa_1_type( ).
    def_z_i_lfbwtype( ).
    def_z_i_rbkptype( ).
    def_z_i_t_006_type( ).
    def_z_i_vfkptype( ).
    def_z_i_vttktype( ).
    def_z_i_vttstype( ).
    def_z_i_zinv_spooltype( ).

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

    lo_navigation_property = lo_entity_type->create_navigation_property( 'FOOTER' ).
    lo_navigation_property->set_edm_name( 'Footer' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SAP_PDFFOOTER' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'FORMAT' ).
    lo_navigation_property->set_edm_name( 'Format' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SAP_FORMAT' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADER' ).
    lo_navigation_property->set_edm_name( 'Header' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SAP_PDFHEADER' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HIERARCHY' ).
    lo_navigation_property->set_edm_name( 'Hierarchy' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SAP_HIERARCHY' ).
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PADDING' ).
    lo_primitive_property->set_edm_name( 'Padding' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_sap_header_footer_field.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'SAP_HEADER_FOOTER_FIELD'
                                    is_structure              = VALUE tys_sap_header_footer_field( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'SAP__HeaderFooterField' ) ##NO_TEXT.


    lo_primitive_property = lo_complex_type->get_primitive_property( 'TYPE' ).
    lo_primitive_property->set_edm_name( 'Type' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 256 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_sap_hierarchy.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_HIERARCHY'
                                    is_structure              = VALUE tys_sap_hierarchy( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__Hierarchy' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_HIERARCHY_SET' ).
    lo_entity_set->set_edm_name( 'SAP__HierarchySet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISTANCE_FROM_ROOT_ELEMENT' ).
    lo_primitive_property->set_edm_name( 'DistanceFromRootElement' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 256 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DRILL_STATE_ELEMENT' ).
    lo_primitive_property->set_edm_name( 'DrillStateElement' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 256 ) ##NUMBER_OK.

  ENDMETHOD.


  METHOD def_sap_pdffooter.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_PDFFOOTER'
                                    is_structure              = VALUE tys_sap_pdffooter( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__PDFFooter' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_PDFFOOTER_SET' ).
    lo_entity_set->set_edm_name( 'SAP__PDFFooterSet' ) ##NO_TEXT.


    lo_complex_property = lo_entity_type->create_complex_property( 'RIGHT' ).
    lo_complex_property->set_edm_name( 'Right' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_HEADER_FOOTER_FIELD' ).

    lo_complex_property = lo_entity_type->create_complex_property( 'LEFT' ).
    lo_complex_property->set_edm_name( 'Left' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_HEADER_FOOTER_FIELD' ).

    lo_complex_property = lo_entity_type->create_complex_property( 'CENTER' ).
    lo_complex_property->set_edm_name( 'Center' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_HEADER_FOOTER_FIELD' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

  ENDMETHOD.


  METHOD def_sap_pdfheader.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SAP_PDFHEADER'
                                    is_structure              = VALUE tys_sap_pdfheader( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SAP__PDFHeader' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SAP_PDFHEADER_SET' ).
    lo_entity_set->set_edm_name( 'SAP__PDFHeaderSet' ) ##NO_TEXT.


    lo_complex_property = lo_entity_type->create_complex_property( 'RIGHT' ).
    lo_complex_property->set_edm_name( 'Right' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_HEADER_FOOTER_FIELD' ).

    lo_complex_property = lo_entity_type->create_complex_property( 'LEFT' ).
    lo_complex_property->set_edm_name( 'Left' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_HEADER_FOOTER_FIELD' ).

    lo_complex_property = lo_entity_type->create_complex_property( 'CENTER' ).
    lo_complex_property->set_edm_name( 'Center' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_HEADER_FOOTER_FIELD' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

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


  METHOD def_z_i_adrctype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_ADRCTYPE'
                                    is_structure              = VALUE tys_z_i_adrctype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_ADRCType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_ADRC' ).
    lo_entity_set->set_edm_name( 'Z_I_ADRC' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRNUMBER' ).
    lo_primitive_property->set_edm_name( 'Addrnumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_FROM' ).
    lo_primitive_property->set_edm_name( 'DateFrom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NATION' ).
    lo_primitive_property->set_edm_name( 'Nation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TO' ).
    lo_primitive_property->set_edm_name( 'DateTo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TITLE' ).
    lo_primitive_property->set_edm_name( 'Title' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_1' ).
    lo_primitive_property->set_edm_name( 'Name1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_2' ).
    lo_primitive_property->set_edm_name( 'Name2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_3' ).
    lo_primitive_property->set_edm_name( 'Name3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_4' ).
    lo_primitive_property->set_edm_name( 'Name4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_TEXT' ).
    lo_primitive_property->set_edm_name( 'NameText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_CO' ).
    lo_primitive_property->set_edm_name( 'NameCo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CITY_1' ).
    lo_primitive_property->set_edm_name( 'City1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CITY_2' ).
    lo_primitive_property->set_edm_name( 'City2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CITY_CODE' ).
    lo_primitive_property->set_edm_name( 'CityCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CITYP_CODE' ).
    lo_primitive_property->set_edm_name( 'CitypCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOME_CITY' ).
    lo_primitive_property->set_edm_name( 'HomeCity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CITYH_CODE' ).
    lo_primitive_property->set_edm_name( 'CityhCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHCKSTATUS' ).
    lo_primitive_property->set_edm_name( 'Chckstatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REGIOGROUP' ).
    lo_primitive_property->set_edm_name( 'Regiogroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POST_CODE_1' ).
    lo_primitive_property->set_edm_name( 'PostCode1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POST_CODE_2' ).
    lo_primitive_property->set_edm_name( 'PostCode2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POST_CODE_3' ).
    lo_primitive_property->set_edm_name( 'PostCode3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PCODE_1_EXT' ).
    lo_primitive_property->set_edm_name( 'Pcode1Ext' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PCODE_2_EXT' ).
    lo_primitive_property->set_edm_name( 'Pcode2Ext' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PCODE_3_EXT' ).
    lo_primitive_property->set_edm_name( 'Pcode3Ext' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_BOX' ).
    lo_primitive_property->set_edm_name( 'PoBox' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DONT_USE_P' ).
    lo_primitive_property->set_edm_name( 'DontUseP' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_BOX_NUM' ).
    lo_primitive_property->set_edm_name( 'PoBoxNum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_BOX_LOC' ).
    lo_primitive_property->set_edm_name( 'PoBoxLoc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CITY_CODE_2' ).
    lo_primitive_property->set_edm_name( 'CityCode2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_BOX_REG' ).
    lo_primitive_property->set_edm_name( 'PoBoxReg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_BOX_CTY' ).
    lo_primitive_property->set_edm_name( 'PoBoxCty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSTALAREA' ).
    lo_primitive_property->set_edm_name( 'Postalarea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANSPZONE' ).
    lo_primitive_property->set_edm_name( 'Transpzone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET' ).
    lo_primitive_property->set_edm_name( 'Street' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DONT_USE_S' ).
    lo_primitive_property->set_edm_name( 'DontUseS' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREETCODE' ).
    lo_primitive_property->set_edm_name( 'Streetcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREETABBR' ).
    lo_primitive_property->set_edm_name( 'Streetabbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSE_NUM_1' ).
    lo_primitive_property->set_edm_name( 'HouseNum1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSE_NUM_2' ).
    lo_primitive_property->set_edm_name( 'HouseNum2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSE_NUM_3' ).
    lo_primitive_property->set_edm_name( 'HouseNum3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STR_SUPPL_1' ).
    lo_primitive_property->set_edm_name( 'StrSuppl1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STR_SUPPL_2' ).
    lo_primitive_property->set_edm_name( 'StrSuppl2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STR_SUPPL_3' ).
    lo_primitive_property->set_edm_name( 'StrSuppl3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOCATION' ).
    lo_primitive_property->set_edm_name( 'Location' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUILDING' ).
    lo_primitive_property->set_edm_name( 'Building' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLOOR' ).
    lo_primitive_property->set_edm_name( 'Floor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROOMNUMBER' ).
    lo_primitive_property->set_edm_name( 'Roomnumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTRY' ).
    lo_primitive_property->set_edm_name( 'Country' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANGU' ).
    lo_primitive_property->set_edm_name( 'Langu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REGION' ).
    lo_primitive_property->set_edm_name( 'Region' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDR_GROUP' ).
    lo_primitive_property->set_edm_name( 'AddrGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLAGGROUPS' ).
    lo_primitive_property->set_edm_name( 'Flaggroups' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERS_ADDR' ).
    lo_primitive_property->set_edm_name( 'PersAddr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SORT_1' ).
    lo_primitive_property->set_edm_name( 'Sort1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SORT_2' ).
    lo_primitive_property->set_edm_name( 'Sort2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SORT_PHN' ).
    lo_primitive_property->set_edm_name( 'SortPhn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEFLT_COMM' ).
    lo_primitive_property->set_edm_name( 'DefltComm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAX_NUMBER' ).
    lo_primitive_property->set_edm_name( 'FaxNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAX_EXTENS' ).
    lo_primitive_property->set_edm_name( 'FaxExtens' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLAGCOMM_2' ).
    lo_primitive_property->set_edm_name( 'Flagcomm2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLAGCOMM_3' ).
    lo_primitive_property->set_edm_name( 'Flagcomm3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLAGCOMM_4' ).
    lo_primitive_property->set_edm_name( 'Flagcomm4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLAGCOMM_5' ).
    lo_primitive_property->set_edm_name( 'Flagcomm5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLAGCOMM_6' ).
    lo_primitive_property->set_edm_name( 'Flagcomm6' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLAGCOMM_7' ).
    lo_primitive_property->set_edm_name( 'Flagcomm7' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLAGCOMM_8' ).
    lo_primitive_property->set_edm_name( 'Flagcomm8' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLAGCOMM_9' ).
    lo_primitive_property->set_edm_name( 'Flagcomm9' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLAGCOMM_10' ).
    lo_primitive_property->set_edm_name( 'Flagcomm10' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLAGCOMM_11' ).
    lo_primitive_property->set_edm_name( 'Flagcomm11' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLAGCOMM_12' ).
    lo_primitive_property->set_edm_name( 'Flagcomm12' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLAGCOMM_13' ).
    lo_primitive_property->set_edm_name( 'Flagcomm13' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRORIGIN' ).
    lo_primitive_property->set_edm_name( 'Addrorigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MC_NAME_1' ).
    lo_primitive_property->set_edm_name( 'McName1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MC_CITY_1' ).
    lo_primitive_property->set_edm_name( 'McCity1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MC_STREET' ).
    lo_primitive_property->set_edm_name( 'McStreet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTENSION_1' ).
    lo_primitive_property->set_edm_name( 'Extension1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTENSION_2' ).
    lo_primitive_property->set_edm_name( 'Extension2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TIME_ZONE' ).
    lo_primitive_property->set_edm_name( 'Time_Zone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXJURCODE' ).
    lo_primitive_property->set_edm_name( 'Taxjurcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_ID' ).
    lo_primitive_property->set_edm_name( 'AddressId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANGU_CREA' ).
    lo_primitive_property->set_edm_name( 'LanguCrea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADRC_UUID' ).
    lo_primitive_property->set_edm_name( 'AdrcUuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UUID_BELATED' ).
    lo_primitive_property->set_edm_name( 'UuidBelated' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'IdCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADRC_ERR_STATUS' ).
    lo_primitive_property->set_edm_name( 'AdrcErrStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_BOX_LOBBY' ).
    lo_primitive_property->set_edm_name( 'PoBoxLobby' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELI_SERV_TYPE' ).
    lo_primitive_property->set_edm_name( 'DeliServType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELI_SERV_NUMBER' ).
    lo_primitive_property->set_edm_name( 'DeliServNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTY_CODE' ).
    lo_primitive_property->set_edm_name( 'CountyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTY' ).
    lo_primitive_property->set_edm_name( 'County' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOWNSHIP_CODE' ).
    lo_primitive_property->set_edm_name( 'TownshipCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOWNSHIP' ).
    lo_primitive_property->set_edm_name( 'Township' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MC_COUNTY' ).
    lo_primitive_property->set_edm_name( 'McCounty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MC_TOWNSHIP' ).
    lo_primitive_property->set_edm_name( 'McTownship' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XPCPT' ).
    lo_primitive_property->set_edm_name( 'Xpcpt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATAAGING' ).
    lo_primitive_property->set_edm_name( 'Dataaging' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUNS' ).
    lo_primitive_property->set_edm_name( 'Duns' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUNSP_4' ).
    lo_primitive_property->set_edm_name( 'Dunsp4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_bkpftype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_BKPFTYPE'
                                    is_structure              = VALUE tys_z_i_bkpftype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_BKPFType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_BKPF' ).
    lo_entity_set->set_edm_name( 'Z_I_BKPF' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUKRS' ).
    lo_primitive_property->set_edm_name( 'Bukrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BELNR' ).
    lo_primitive_property->set_edm_name( 'Belnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GJAHR' ).
    lo_primitive_property->set_edm_name( 'Gjahr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLART' ).
    lo_primitive_property->set_edm_name( 'Blart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLDAT' ).
    lo_primitive_property->set_edm_name( 'Bldat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDAT' ).
    lo_primitive_property->set_edm_name( 'Budat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MONAT' ).
    lo_primitive_property->set_edm_name( 'Monat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CPUDT' ).
    lo_primitive_property->set_edm_name( 'Cpudt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CPUTM' ).
    lo_primitive_property->set_edm_name( 'Cputm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AEDAT' ).
    lo_primitive_property->set_edm_name( 'Aedat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPDDT' ).
    lo_primitive_property->set_edm_name( 'Upddt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WWERT' ).
    lo_primitive_property->set_edm_name( 'Wwert' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'USNAM' ).
    lo_primitive_property->set_edm_name( 'Usnam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TCODE' ).
    lo_primitive_property->set_edm_name( 'Tcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BVORG' ).
    lo_primitive_property->set_edm_name( 'Bvorg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBLNR' ).
    lo_primitive_property->set_edm_name( 'Xblnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DBBLG' ).
    lo_primitive_property->set_edm_name( 'Dbblg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DBBLG_GJAHR' ).
    lo_primitive_property->set_edm_name( 'DbblgGjahr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DBBLG_BUKRS' ).
    lo_primitive_property->set_edm_name( 'DbblgBukrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STBLG' ).
    lo_primitive_property->set_edm_name( 'Stblg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STJAH' ).
    lo_primitive_property->set_edm_name( 'Stjah' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BKTXT' ).
    lo_primitive_property->set_edm_name( 'Bktxt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAERS' ).
    lo_primitive_property->set_edm_name( 'Waers' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KURSF' ).
    lo_primitive_property->set_edm_name( 'Kursf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZWRS' ).
    lo_primitive_property->set_edm_name( 'Kzwrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BSTAT' ).
    lo_primitive_property->set_edm_name( 'Bstat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XNETB' ).
    lo_primitive_property->set_edm_name( 'Xnetb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XRUEB' ).
    lo_primitive_property->set_edm_name( 'Xrueb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLVOR' ).
    lo_primitive_property->set_edm_name( 'Glvor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRPID' ).
    lo_primitive_property->set_edm_name( 'Grpid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOKID' ).
    lo_primitive_property->set_edm_name( 'Dokid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARCID' ).
    lo_primitive_property->set_edm_name( 'Arcid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IBLAR' ).
    lo_primitive_property->set_edm_name( 'Iblar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AWTYP' ).
    lo_primitive_property->set_edm_name( 'Awtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AWKEY' ).
    lo_primitive_property->set_edm_name( 'Awkey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIKRS' ).
    lo_primitive_property->set_edm_name( 'Fikrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HWAER' ).
    lo_primitive_property->set_edm_name( 'Hwaer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HWAE_2' ).
    lo_primitive_property->set_edm_name( 'Hwae2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HWAE_3' ).
    lo_primitive_property->set_edm_name( 'Hwae3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BASW_2' ).
    lo_primitive_property->set_edm_name( 'Basw2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BASW_3' ).
    lo_primitive_property->set_edm_name( 'Basw3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMRD_2' ).
    lo_primitive_property->set_edm_name( 'Umrd2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMRD_3' ).
    lo_primitive_property->set_edm_name( 'Umrd3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XSTOV' ).
    lo_primitive_property->set_edm_name( 'Xstov' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STODT' ).
    lo_primitive_property->set_edm_name( 'Stodt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XMWST' ).
    lo_primitive_property->set_edm_name( 'Xmwst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURT_2' ).
    lo_primitive_property->set_edm_name( 'Curt2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURT_3' ).
    lo_primitive_property->set_edm_name( 'Curt3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUTY_2' ).
    lo_primitive_property->set_edm_name( 'Kuty2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUTY_3' ).
    lo_primitive_property->set_edm_name( 'Kuty3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XSNET' ).
    lo_primitive_property->set_edm_name( 'Xsnet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUSBK' ).
    lo_primitive_property->set_edm_name( 'Ausbk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XUSVR' ).
    lo_primitive_property->set_edm_name( 'Xusvr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUEFL' ).
    lo_primitive_property->set_edm_name( 'Duefl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AWSYS' ).
    lo_primitive_property->set_edm_name( 'Awsys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOTKZ' ).
    lo_primitive_property->set_edm_name( 'Lotkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XWVOF' ).
    lo_primitive_property->set_edm_name( 'Xwvof' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STGRD' ).
    lo_primitive_property->set_edm_name( 'Stgrd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PPNAM' ).
    lo_primitive_property->set_edm_name( 'Ppnam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PPDAT' ).
    lo_primitive_property->set_edm_name( 'Ppdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PPTME' ).
    lo_primitive_property->set_edm_name( 'Pptme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PPTCOD' ).
    lo_primitive_property->set_edm_name( 'Pptcod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRNCH' ).
    lo_primitive_property->set_edm_name( 'Brnch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NUMPG' ).
    lo_primitive_property->set_edm_name( 'Numpg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADISC' ).
    lo_primitive_property->set_edm_name( 'Adisc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XREF_1_HD' ).
    lo_primitive_property->set_edm_name( 'Xref1Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XREF_2_HD' ).
    lo_primitive_property->set_edm_name( 'Xref2Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XREVERSAL' ).
    lo_primitive_property->set_edm_name( 'Xreversal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REINDAT' ).
    lo_primitive_property->set_edm_name( 'Reindat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RLDNR' ).
    lo_primitive_property->set_edm_name( 'Rldnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LDGRP' ).
    lo_primitive_property->set_edm_name( 'Ldgrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VATDATE' ).
    lo_primitive_property->set_edm_name( 'Vatdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FULFILLDATE' ).
    lo_primitive_property->set_edm_name( 'Fulfilldate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCCAT' ).
    lo_primitive_property->set_edm_name( 'Doccat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XSPLIT' ).
    lo_primitive_property->set_edm_name( 'Xsplit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CASH_ALLOC' ).
    lo_primitive_property->set_edm_name( 'CashAlloc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FOLLOW_ON' ).
    lo_primitive_property->set_edm_name( 'FollowOn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XREORG' ).
    lo_primitive_property->set_edm_name( 'Xreorg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBSET' ).
    lo_primitive_property->set_edm_name( 'Subset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KURST' ).
    lo_primitive_property->set_edm_name( 'Kurst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XMCA' ).
    lo_primitive_property->set_edm_name( 'Xmca' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RESUBMISSION' ).
    lo_primitive_property->set_edm_name( 'Resubmission' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOGSYSTEM_SENDER' ).
    lo_primitive_property->set_edm_name( 'LogsystemSender' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUKRS_SENDER' ).
    lo_primitive_property->set_edm_name( 'BukrsSender' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BELNR_SENDER' ).
    lo_primitive_property->set_edm_name( 'BelnrSender' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GJAHR_SENDER' ).
    lo_primitive_property->set_edm_name( 'GjahrSender' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTSUBID' ).
    lo_primitive_property->set_edm_name( 'Intsubid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AWORG_REV' ).
    lo_primitive_property->set_edm_name( 'AworgRev' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AWREF_REV' ).
    lo_primitive_property->set_edm_name( 'AwrefRev' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XREVERSING' ).
    lo_primitive_property->set_edm_name( 'Xreversing' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XREVERSED' ).
    lo_primitive_property->set_edm_name( 'Xreversed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLBTGRP' ).
    lo_primitive_property->set_edm_name( 'Glbtgrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CO_VRGNG' ).
    lo_primitive_property->set_edm_name( 'CoVrgng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CO_REFBT' ).
    lo_primitive_property->set_edm_name( 'CoRefbt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CO_ALEBN' ).
    lo_primitive_property->set_edm_name( 'CoAlebn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CO_VALDT' ).
    lo_primitive_property->set_edm_name( 'CoValdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CO_BELNR_SENDER' ).
    lo_primitive_property->set_edm_name( 'CoBelnrSender' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOKRS_SENDER' ).
    lo_primitive_property->set_edm_name( 'KokrsSender' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACC_PRINCIPLE' ).
    lo_primitive_property->set_edm_name( 'AccPrinciple' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATAAGING' ).
    lo_primitive_property->set_edm_name( 'Dataaging' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRAVA_PN' ).
    lo_primitive_property->set_edm_name( 'TravaPn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LDGRPSPEC_PN' ).
    lo_primitive_property->set_edm_name( 'LdgrpspecPn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AFABESPEC_PN' ).
    lo_primitive_property->set_edm_name( 'AfabespecPn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XSECONDARY' ).
    lo_primitive_property->set_edm_name( 'Xsecondary' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REPROCESSING_STATUS_CODE' ).
    lo_primitive_property->set_edm_name( 'ReprocessingStatusCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRR_PARTIAL_IND' ).
    lo_primitive_property->set_edm_name( 'TrrPartialInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_REMOVAL_STATUS' ).
    lo_primitive_property->set_edm_name( 'ItemRemovalStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PENRC' ).
    lo_primitive_property->set_edm_name( 'Penrc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_1_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef1Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_1_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat1Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_2_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef2Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_2_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat2Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_3_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef3Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_3_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat3Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_4_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef4Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_4_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat4Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_5_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef5Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_5_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat5Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WHTDATE' ).
    lo_primitive_property->set_edm_name( 'Whtdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CBTTYPE' ).
    lo_primitive_property->set_edm_name( 'Cbttype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CLOSINGSTEP' ).
    lo_primitive_property->set_edm_name( 'Closingstep' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDIFFLEDGERVALUES' ).
    lo_primitive_property->set_edm_name( 'Xdiffledgervalues' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XLEDGERMISSING' ).
    lo_primitive_property->set_edm_name( 'Xledgermissing' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XUNIQUECVTYPS' ).
    lo_primitive_property->set_edm_name( 'Xuniquecvtyps' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY_HD' ).
    lo_primitive_property->set_edm_name( 'TaxCountryHd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANXTYPE' ).
    lo_primitive_property->set_edm_name( 'Anxtype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANXPERC' ).
    lo_primitive_property->set_edm_name( 'Anxperc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZVAT_INDC' ).
    lo_primitive_property->set_edm_name( 'ZvatIndc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XSAPF_15_XSTATUS' ).
    lo_primitive_property->set_edm_name( 'xsapf15xstatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSOTY' ).
    lo_primitive_property->set_edm_name( 'Psoty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSOAK' ).
    lo_primitive_property->set_edm_name( 'Psoak' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSOKS' ).
    lo_primitive_property->set_edm_name( 'Psoks' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSOSG' ).
    lo_primitive_property->set_edm_name( 'Psosg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSOFN' ).
    lo_primitive_property->set_edm_name( 'Psofn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTFORM' ).
    lo_primitive_property->set_edm_name( 'Intform' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTDATE' ).
    lo_primitive_property->set_edm_name( 'Intdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSOBT' ).
    lo_primitive_property->set_edm_name( 'Psobt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSOZL' ).
    lo_primitive_property->set_edm_name( 'Psozl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSODT' ).
    lo_primitive_property->set_edm_name( 'Psodt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSOTM' ).
    lo_primitive_property->set_edm_name( 'Psotm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FM_UMART' ).
    lo_primitive_property->set_edm_name( 'FmUmart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CCINS' ).
    lo_primitive_property->set_edm_name( 'Ccins' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CCNUM' ).
    lo_primitive_property->set_edm_name( 'Ccnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SSBLK' ).
    lo_primitive_property->set_edm_name( 'Ssblk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BATCH' ).
    lo_primitive_property->set_edm_name( 'Batch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SNAME' ).
    lo_primitive_property->set_edm_name( 'Sname' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAMPLED' ).
    lo_primitive_property->set_edm_name( 'Sampled' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXCLUDE_FLAG' ).
    lo_primitive_property->set_edm_name( 'ExcludeFlag' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLIND' ).
    lo_primitive_property->set_edm_name( 'Blind' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OFFSET_STATUS' ).
    lo_primitive_property->set_edm_name( 'OffsetStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OFFSET_REFER_DAT' ).
    lo_primitive_property->set_edm_name( 'OffsetReferDat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNUMV' ).
    lo_primitive_property->set_edm_name( 'Knumv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLO' ).
    lo_primitive_property->set_edm_name( 'Blo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CNT' ).
    lo_primitive_property->set_edm_name( 'Cnt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYBASTYP' ).
    lo_primitive_property->set_edm_name( 'Pybastyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYBASNO' ).
    lo_primitive_property->set_edm_name( 'Pybasno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYBASDAT' ).
    lo_primitive_property->set_edm_name( 'Pybasdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYIBAN' ).
    lo_primitive_property->set_edm_name( 'Pyiban' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 34 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INWARDNO_HD' ).
    lo_primitive_property->set_edm_name( 'InwardnoHd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INWARDDT_HD' ).
    lo_primitive_property->set_edm_name( 'InwarddtHd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_z_i_but_000_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_BUT_000_TYPE'
                                    is_structure              = VALUE tys_z_i_but_000_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'z_i_but000Type' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_BUT_000' ).
    lo_entity_set->set_edm_name( 'z_i_but000' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER' ).
    lo_primitive_property->set_edm_name( 'Partner' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TYPE' ).
    lo_primitive_property->set_edm_name( 'Type' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BPKIND' ).
    lo_primitive_property->set_edm_name( 'Bpkind' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BU_GROUP' ).
    lo_primitive_property->set_edm_name( 'BuGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BPEXT' ).
    lo_primitive_property->set_edm_name( 'Bpext' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BU_SORT_1' ).
    lo_primitive_property->set_edm_name( 'BuSort1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BU_SORT_2' ).
    lo_primitive_property->set_edm_name( 'BuSort2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SOURCE' ).
    lo_primitive_property->set_edm_name( 'Source' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TITLE' ).
    lo_primitive_property->set_edm_name( 'Title' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XDELE' ).
    lo_primitive_property->set_edm_name( 'Xdele' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBLCK' ).
    lo_primitive_property->set_edm_name( 'Xblck' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUGRP' ).
    lo_primitive_property->set_edm_name( 'Augrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TITLE_LET' ).
    lo_primitive_property->set_edm_name( 'TitleLet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BU_LOGSYS' ).
    lo_primitive_property->set_edm_name( 'BuLogsys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTACT' ).
    lo_primitive_property->set_edm_name( 'Contact' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NOT_RELEASED' ).
    lo_primitive_property->set_edm_name( 'NotReleased' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NOT_LG_COMPETENT' ).
    lo_primitive_property->set_edm_name( 'NotLgCompetent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRINT_MODE' ).
    lo_primitive_property->set_edm_name( 'PrintMode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BP_EEW_DUMMY' ).
    lo_primitive_property->set_edm_name( 'BpEewDummy' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RATE' ).
    lo_primitive_property->set_edm_name( 'Rate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_ORG_1' ).
    lo_primitive_property->set_edm_name( 'NameOrg1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_ORG_2' ).
    lo_primitive_property->set_edm_name( 'NameOrg2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_ORG_3' ).
    lo_primitive_property->set_edm_name( 'NameOrg3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_ORG_4' ).
    lo_primitive_property->set_edm_name( 'NameOrg4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LEGAL_ENTY' ).
    lo_primitive_property->set_edm_name( 'LegalEnty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IND_SECTOR' ).
    lo_primitive_property->set_edm_name( 'IndSector' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LEGAL_ORG' ).
    lo_primitive_property->set_edm_name( 'LegalOrg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FOUND_DAT' ).
    lo_primitive_property->set_edm_name( 'FoundDat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIQUID_DAT' ).
    lo_primitive_property->set_edm_name( 'LiquidDat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOCATION_1' ).
    lo_primitive_property->set_edm_name( 'Location1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOCATION_2' ).
    lo_primitive_property->set_edm_name( 'Location2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOCATION_3' ).
    lo_primitive_property->set_edm_name( 'Location3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_LAST' ).
    lo_primitive_property->set_edm_name( 'NameLast' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_FIRST' ).
    lo_primitive_property->set_edm_name( 'NameFirst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_LST_2' ).
    lo_primitive_property->set_edm_name( 'NameLst2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_LAST_2' ).
    lo_primitive_property->set_edm_name( 'NameLast2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAMEMIDDLE' ).
    lo_primitive_property->set_edm_name( 'Namemiddle' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TITLE_ACA_1' ).
    lo_primitive_property->set_edm_name( 'TitleAca1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TITLE_ACA_2' ).
    lo_primitive_property->set_edm_name( 'TitleAca2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TITLE_ROYL' ).
    lo_primitive_property->set_edm_name( 'TitleRoyl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PREFIX_1' ).
    lo_primitive_property->set_edm_name( 'Prefix1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PREFIX_2' ).
    lo_primitive_property->set_edm_name( 'Prefix2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_1_TEXT' ).
    lo_primitive_property->set_edm_name( 'Name1Text' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NICKNAME' ).
    lo_primitive_property->set_edm_name( 'Nickname' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INITIALS' ).
    lo_primitive_property->set_edm_name( 'Initials' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAMEFORMAT' ).
    lo_primitive_property->set_edm_name( 'Nameformat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAMCOUNTRY' ).
    lo_primitive_property->set_edm_name( 'Namcountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANGU_CORR' ).
    lo_primitive_property->set_edm_name( 'LanguCorr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XSEXM' ).
    lo_primitive_property->set_edm_name( 'Xsexm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XSEXF' ).
    lo_primitive_property->set_edm_name( 'Xsexf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BIRTHPL' ).
    lo_primitive_property->set_edm_name( 'Birthpl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MARST' ).
    lo_primitive_property->set_edm_name( 'Marst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMPLO' ).
    lo_primitive_property->set_edm_name( 'Emplo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JOBGR' ).
    lo_primitive_property->set_edm_name( 'Jobgr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NATIO' ).
    lo_primitive_property->set_edm_name( 'Natio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CNTAX' ).
    lo_primitive_property->set_edm_name( 'Cntax' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CNDSC' ).
    lo_primitive_property->set_edm_name( 'Cndsc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERSNUMBER' ).
    lo_primitive_property->set_edm_name( 'Persnumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XSEXU' ).
    lo_primitive_property->set_edm_name( 'Xsexu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XUBNAME' ).
    lo_primitive_property->set_edm_name( 'Xubname' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BU_LANGU' ).
    lo_primitive_property->set_edm_name( 'BuLangu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GENDER' ).
    lo_primitive_property->set_edm_name( 'Gender' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BIRTHDT' ).
    lo_primitive_property->set_edm_name( 'Birthdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEATHDT' ).
    lo_primitive_property->set_edm_name( 'Deathdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERNO' ).
    lo_primitive_property->set_edm_name( 'Perno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHILDREN' ).
    lo_primitive_property->set_edm_name( 'Children' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEM_HOUSE' ).
    lo_primitive_property->set_edm_name( 'MemHouse' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BIRTHDT_STATUS' ).
    lo_primitive_property->set_edm_name( 'BirthdtStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTGRPTYP' ).
    lo_primitive_property->set_edm_name( 'Partgrptyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_GRP_1' ).
    lo_primitive_property->set_edm_name( 'NameGrp1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_GRP_2' ).
    lo_primitive_property->set_edm_name( 'NameGrp2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MC_NAME_1' ).
    lo_primitive_property->set_edm_name( 'McName1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MC_NAME_2' ).
    lo_primitive_property->set_edm_name( 'McName2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CRUSR' ).
    lo_primitive_property->set_edm_name( 'Crusr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CRDAT' ).
    lo_primitive_property->set_edm_name( 'Crdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CRTIM' ).
    lo_primitive_property->set_edm_name( 'Crtim' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHUSR' ).
    lo_primitive_property->set_edm_name( 'Chusr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHDAT' ).
    lo_primitive_property->set_edm_name( 'Chdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHTIM' ).
    lo_primitive_property->set_edm_name( 'Chtim' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_GUID' ).
    lo_primitive_property->set_edm_name( 'PartnerGuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRCOMM' ).
    lo_primitive_property->set_edm_name( 'Addrcomm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TD_SWITCH' ).
    lo_primitive_property->set_edm_name( 'TdSwitch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_ORG_CENTRE' ).
    lo_primitive_property->set_edm_name( 'IsOrgCentre' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DB_KEY' ).
    lo_primitive_property->set_edm_name( 'DbKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALID_FROM' ).
    lo_primitive_property->set_edm_name( 'ValidFrom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALID_TO' ).
    lo_primitive_property->set_edm_name( 'ValidTo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XPCPT' ).
    lo_primitive_property->set_edm_name( 'Xpcpt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANK_AREA' ).
    lo_primitive_property->set_edm_name( 'BankArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NATPERS' ).
    lo_primitive_property->set_edm_name( 'Natpers' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MILVE' ).
    lo_primitive_property->set_edm_name( 'Milve' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NUC_SEC' ).
    lo_primitive_property->set_edm_name( 'NucSec' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAR_REL' ).
    lo_primitive_property->set_edm_name( 'ParRel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BP_SORT' ).
    lo_primitive_property->set_edm_name( 'BpSort' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KBANKS' ).
    lo_primitive_property->set_edm_name( 'Kbanks' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KBANKL' ).
    lo_primitive_property->set_edm_name( 'Kbankl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_ekbetype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_EKBETYPE'
                                    is_structure              = VALUE tys_z_i_ekbetype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_EKBEType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_EKBE' ).
    lo_entity_set->set_edm_name( 'Z_I_EKBE' ) ##NO_TEXT.


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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZEKKN' ).
    lo_primitive_property->set_edm_name( 'Zekkn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGABE' ).
    lo_primitive_property->set_edm_name( 'Vgabe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GJAHR' ).
    lo_primitive_property->set_edm_name( 'Gjahr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BELNR' ).
    lo_primitive_property->set_edm_name( 'Belnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUZEI' ).
    lo_primitive_property->set_edm_name( 'Buzei' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BEWTP' ).
    lo_primitive_property->set_edm_name( 'Bewtp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BWART' ).
    lo_primitive_property->set_edm_name( 'Bwart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDAT' ).
    lo_primitive_property->set_edm_name( 'Budat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MENGE' ).
    lo_primitive_property->set_edm_name( 'Menge' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BPMNG' ).
    lo_primitive_property->set_edm_name( 'Bpmng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DMBTR' ).
    lo_primitive_property->set_edm_name( 'Dmbtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WRBTR' ).
    lo_primitive_property->set_edm_name( 'Wrbtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAERS' ).
    lo_primitive_property->set_edm_name( 'Waers' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AREWR' ).
    lo_primitive_property->set_edm_name( 'Arewr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WESBS' ).
    lo_primitive_property->set_edm_name( 'Wesbs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BPWES' ).
    lo_primitive_property->set_edm_name( 'Bpwes' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHKZG' ).
    lo_primitive_property->set_edm_name( 'Shkzg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BWTAR' ).
    lo_primitive_property->set_edm_name( 'Bwtar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELIKZ' ).
    lo_primitive_property->set_edm_name( 'Elikz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBLNR' ).
    lo_primitive_property->set_edm_name( 'Xblnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFGJA' ).
    lo_primitive_property->set_edm_name( 'Lfgja' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFBNR' ).
    lo_primitive_property->set_edm_name( 'Lfbnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFPOS' ).
    lo_primitive_property->set_edm_name( 'Lfpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRUND' ).
    lo_primitive_property->set_edm_name( 'Grund' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CPUDT' ).
    lo_primitive_property->set_edm_name( 'Cpudt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CPUTM' ).
    lo_primitive_property->set_edm_name( 'Cputm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REEWR' ).
    lo_primitive_property->set_edm_name( 'Reewr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EVERE' ).
    lo_primitive_property->set_edm_name( 'Evere' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFWR' ).
    lo_primitive_property->set_edm_name( 'Refwr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATNR' ).
    lo_primitive_property->set_edm_name( 'Matnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WERKS' ).
    lo_primitive_property->set_edm_name( 'Werks' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XWSBR' ).
    lo_primitive_property->set_edm_name( 'Xwsbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETENS' ).
    lo_primitive_property->set_edm_name( 'Etens' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNUMV' ).
    lo_primitive_property->set_edm_name( 'Knumv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MWSKZ' ).
    lo_primitive_property->set_edm_name( 'Mwskz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LSMEH' ).
    lo_primitive_property->set_edm_name( 'Lsmeh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMATN' ).
    lo_primitive_property->set_edm_name( 'Ematn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HSWAE' ).
    lo_primitive_property->set_edm_name( 'Hswae' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHARG' ).
    lo_primitive_property->set_edm_name( 'Charg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLDAT' ).
    lo_primitive_property->set_edm_name( 'Bldat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XWOFF' ).
    lo_primitive_property->set_edm_name( 'Xwoff' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XUNPL' ).
    lo_primitive_property->set_edm_name( 'Xunpl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERNAM' ).
    lo_primitive_property->set_edm_name( 'Ernam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SRVPOS' ).
    lo_primitive_property->set_edm_name( 'Srvpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PACKNO' ).
    lo_primitive_property->set_edm_name( 'Packno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTROW' ).
    lo_primitive_property->set_edm_name( 'Introw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BEKKN' ).
    lo_primitive_property->set_edm_name( 'Bekkn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LEMIN' ).
    lo_primitive_property->set_edm_name( 'Lemin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAPRL' ).
    lo_primitive_property->set_edm_name( 'Saprl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEORA' ).
    lo_primitive_property->set_edm_name( 'Weora' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XMACC' ).
    lo_primitive_property->set_edm_name( 'Xmacc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WKURS' ).
    lo_primitive_property->set_edm_name( 'Wkurs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INV_ITEM_ORIGIN' ).
    lo_primitive_property->set_edm_name( 'InvItemOrigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELN_ST' ).
    lo_primitive_property->set_edm_name( 'VbelnSt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELP_ST' ).
    lo_primitive_property->set_edm_name( 'VbelpSt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SGT_SCAT' ).
    lo_primitive_property->set_edm_name( 'SgtScat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATAAGING' ).
    lo_primitive_property->set_edm_name( 'Dataaging' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SESUOM' ).
    lo_primitive_property->set_edm_name( 'Sesuom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOGSY' ).
    lo_primitive_property->set_edm_name( 'Logsy' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ET_UPD' ).
    lo_primitive_property->set_edm_name( 'EtUpd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCWMXTY_2_TQ' ).
    lo_primitive_property->set_edm_name( 'xcwmxty2tq' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JSC_DIE_COMP_F' ).
    lo_primitive_property->set_edm_name( 'JScDieCompF' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
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

  ENDMETHOD.


  METHOD def_z_i_ekbztype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_EKBZTYPE'
                                    is_structure              = VALUE tys_z_i_ekbztype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'z_i_EKBZType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_EKBZ' ).
    lo_entity_set->set_edm_name( 'z_i_EKBZ' ) ##NO_TEXT.


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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STUNR' ).
    lo_primitive_property->set_edm_name( 'Stunr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZAEHK' ).
    lo_primitive_property->set_edm_name( 'Zaehk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGABE' ).
    lo_primitive_property->set_edm_name( 'Vgabe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GJAHR' ).
    lo_primitive_property->set_edm_name( 'Gjahr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BELNR' ).
    lo_primitive_property->set_edm_name( 'Belnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUZEI' ).
    lo_primitive_property->set_edm_name( 'Buzei' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BEWTP' ).
    lo_primitive_property->set_edm_name( 'Bewtp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDAT' ).
    lo_primitive_property->set_edm_name( 'Budat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MENGE' ).
    lo_primitive_property->set_edm_name( 'Menge' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DMBTR' ).
    lo_primitive_property->set_edm_name( 'Dmbtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WRBTR' ).
    lo_primitive_property->set_edm_name( 'Wrbtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAERS' ).
    lo_primitive_property->set_edm_name( 'Waers' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AREWR' ).
    lo_primitive_property->set_edm_name( 'Arewr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHKZG' ).
    lo_primitive_property->set_edm_name( 'Shkzg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBLNR' ).
    lo_primitive_property->set_edm_name( 'Xblnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRBNR' ).
    lo_primitive_property->set_edm_name( 'Frbnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFNR' ).
    lo_primitive_property->set_edm_name( 'Lifnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CPUDT' ).
    lo_primitive_property->set_edm_name( 'Cpudt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CPUTM' ).
    lo_primitive_property->set_edm_name( 'Cputm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REEWR' ).
    lo_primitive_property->set_edm_name( 'Reewr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFWR' ).
    lo_primitive_property->set_edm_name( 'Refwr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BWTAR' ).
    lo_primitive_property->set_edm_name( 'Bwtar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KSCHL' ).
    lo_primitive_property->set_edm_name( 'Kschl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BPMNG' ).
    lo_primitive_property->set_edm_name( 'Bpmng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AREWW' ).
    lo_primitive_property->set_edm_name( 'Areww' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HSWAE' ).
    lo_primitive_property->set_edm_name( 'Hswae' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VNETW' ).
    lo_primitive_property->set_edm_name( 'Vnetw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERNAM' ).
    lo_primitive_property->set_edm_name( 'Ernam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHKKO' ).
    lo_primitive_property->set_edm_name( 'Shkko' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AREWB' ).
    lo_primitive_property->set_edm_name( 'Arewb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REWRB' ).
    lo_primitive_property->set_edm_name( 'Rewrb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAPRL' ).
    lo_primitive_property->set_edm_name( 'Saprl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MENGE_POP' ).
    lo_primitive_property->set_edm_name( 'MengePop' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DMBTR_POP' ).
    lo_primitive_property->set_edm_name( 'DmbtrPop' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WRBTR_POP' ).
    lo_primitive_property->set_edm_name( 'WrbtrPop' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BPMNG_POP' ).
    lo_primitive_property->set_edm_name( 'BpmngPop' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AREWR_POP' ).
    lo_primitive_property->set_edm_name( 'ArewrPop' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUDIF' ).
    lo_primitive_property->set_edm_name( 'Kudif' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XMACC' ).
    lo_primitive_property->set_edm_name( 'Xmacc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WKURS' ).
    lo_primitive_property->set_edm_name( 'Wkurs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATAAGING' ).
    lo_primitive_property->set_edm_name( 'Dataaging' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCWMXBAMNG' ).
    lo_primitive_property->set_edm_name( 'xcwmxbamng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCWMXWESBS' ).
    lo_primitive_property->set_edm_name( 'xcwmxwesbs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCWMXTY_2_TQ' ).
    lo_primitive_property->set_edm_name( 'xcwmxty2tq' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_ekkntype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_EKKNTYPE'
                                    is_structure              = VALUE tys_z_i_ekkntype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_EKKNType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_EKKN' ).
    lo_entity_set->set_edm_name( 'Z_I_EKKN' ) ##NO_TEXT.


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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZEKKN' ).
    lo_primitive_property->set_edm_name( 'Zekkn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOEKZ' ).
    lo_primitive_property->set_edm_name( 'Loekz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AEDAT' ).
    lo_primitive_property->set_edm_name( 'Aedat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KFLAG' ).
    lo_primitive_property->set_edm_name( 'Kflag' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MENGE' ).
    lo_primitive_property->set_edm_name( 'Menge' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VPROZ' ).
    lo_primitive_property->set_edm_name( 'Vproz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETWR' ).
    lo_primitive_property->set_edm_name( 'Netwr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAKTO' ).
    lo_primitive_property->set_edm_name( 'Sakto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GSBER' ).
    lo_primitive_property->set_edm_name( 'Gsber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOSTL' ).
    lo_primitive_property->set_edm_name( 'Kostl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROJN' ).
    lo_primitive_property->set_edm_name( 'Projn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELN' ).
    lo_primitive_property->set_edm_name( 'Vbeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELP' ).
    lo_primitive_property->set_edm_name( 'Vbelp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VETEN' ).
    lo_primitive_property->set_edm_name( 'Veten' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZBRB' ).
    lo_primitive_property->set_edm_name( 'Kzbrb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANLN_1' ).
    lo_primitive_property->set_edm_name( 'Anln1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANLN_2' ).
    lo_primitive_property->set_edm_name( 'Anln2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUFNR' ).
    lo_primitive_property->set_edm_name( 'Aufnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEMPF' ).
    lo_primitive_property->set_edm_name( 'Wempf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABLAD' ).
    lo_primitive_property->set_edm_name( 'Ablad' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOKRS' ).
    lo_primitive_property->set_edm_name( 'Kokrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBKST' ).
    lo_primitive_property->set_edm_name( 'Xbkst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBAUF' ).
    lo_primitive_property->set_edm_name( 'Xbauf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBPRO' ).
    lo_primitive_property->set_edm_name( 'Xbpro' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EREKZ' ).
    lo_primitive_property->set_edm_name( 'Erekz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KSTRG' ).
    lo_primitive_property->set_edm_name( 'Kstrg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PS_PSP_PNR' ).
    lo_primitive_property->set_edm_name( 'PsPspPnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NPLNR' ).
    lo_primitive_property->set_edm_name( 'Nplnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUFPL' ).
    lo_primitive_property->set_edm_name( 'Aufpl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IMKEY' ).
    lo_primitive_property->set_edm_name( 'Imkey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'APLZL' ).
    lo_primitive_property->set_edm_name( 'Aplzl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VPTNR' ).
    lo_primitive_property->set_edm_name( 'Vptnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIPOS' ).
    lo_primitive_property->set_edm_name( 'Fipos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RECID' ).
    lo_primitive_property->set_edm_name( 'Recid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUMMY_INCL_EEW_COBL' ).
    lo_primitive_property->set_edm_name( 'DummyInclEewCobl' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKBER' ).
    lo_primitive_property->set_edm_name( 'Fkber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DABRZ' ).
    lo_primitive_property->set_edm_name( 'Dabrz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUFPL_ORD' ).
    lo_primitive_property->set_edm_name( 'AufplOrd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'APLZL_ORD' ).
    lo_primitive_property->set_edm_name( 'AplzlOrd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAVNW' ).
    lo_primitive_property->set_edm_name( 'Navnw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LSTAR' ).
    lo_primitive_property->set_edm_name( 'Lstar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRZNR' ).
    lo_primitive_property->set_edm_name( 'Prznr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRANT_NBR' ).
    lo_primitive_property->set_edm_name( 'GrantNbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDGET_PD' ).
    lo_primitive_property->set_edm_name( 'BudgetPd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FM_SPLIT_BATCH' ).
    lo_primitive_property->set_edm_name( 'FmSplitBatch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FM_SPLIT_BEGRU' ).
    lo_primitive_property->set_edm_name( 'FmSplitBegru' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AA_FINAL_IND' ).
    lo_primitive_property->set_edm_name( 'AaFinalInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AA_FINAL_REASON' ).
    lo_primitive_property->set_edm_name( 'AaFinalReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AA_FINAL_QTY' ).
    lo_primitive_property->set_edm_name( 'AaFinalQty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AA_FINAL_QTY_F' ).
    lo_primitive_property->set_edm_name( 'AaFinalQtyF' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MENGE_F' ).
    lo_primitive_property->set_edm_name( 'MengeF' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FMFGUS_KEY' ).
    lo_primitive_property->set_edm_name( 'FmfgusKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATAAGING' ).
    lo_primitive_property->set_edm_name( 'Dataaging' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EGRUP' ).
    lo_primitive_property->set_edm_name( 'Egrup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VNAME' ).
    lo_primitive_property->set_edm_name( 'Vname' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KBLNR_CAB' ).
    lo_primitive_property->set_edm_name( 'KblnrCab' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KBLPOS_CAB' ).
    lo_primitive_property->set_edm_name( 'KblposCab' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TCOBJNR' ).
    lo_primitive_property->set_edm_name( 'Tcobjnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 22 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATEOFSERVICE' ).
    lo_primitive_property->set_edm_name( 'Dateofservice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NOTAXCORR' ).
    lo_primitive_property->set_edm_name( 'Notaxcorr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DIFFOPTRATE' ).
    lo_primitive_property->set_edm_name( 'Diffoptrate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HASDIFFOPTRATE' ).
    lo_primitive_property->set_edm_name( 'Hasdiffoptrate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
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
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
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


  METHOD def_z_i_eskntype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_ESKNTYPE'
                                    is_structure              = VALUE tys_z_i_eskntype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_ESKNType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_ESKN' ).
    lo_entity_set->set_edm_name( 'Z_I_ESKN' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PACKNO' ).
    lo_primitive_property->set_edm_name( 'Packno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZEKKN' ).
    lo_primitive_property->set_edm_name( 'Zekkn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BEKKN' ).
    lo_primitive_property->set_edm_name( 'Bekkn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOEKZ' ).
    lo_primitive_property->set_edm_name( 'Loekz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AEDAT' ).
    lo_primitive_property->set_edm_name( 'Aedat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KFLAG' ).
    lo_primitive_property->set_edm_name( 'Kflag' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WPROZ' ).
    lo_primitive_property->set_edm_name( 'Wproz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETWR' ).
    lo_primitive_property->set_edm_name( 'Netwr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAKTO' ).
    lo_primitive_property->set_edm_name( 'Sakto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GSBER' ).
    lo_primitive_property->set_edm_name( 'Gsber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOSTL' ).
    lo_primitive_property->set_edm_name( 'Kostl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELN' ).
    lo_primitive_property->set_edm_name( 'Vbeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELP' ).
    lo_primitive_property->set_edm_name( 'Vbelp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VETEN' ).
    lo_primitive_property->set_edm_name( 'Veten' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANLN_1' ).
    lo_primitive_property->set_edm_name( 'Anln1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANLN_2' ).
    lo_primitive_property->set_edm_name( 'Anln2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUFNR' ).
    lo_primitive_property->set_edm_name( 'Aufnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOKRS' ).
    lo_primitive_property->set_edm_name( 'Kokrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBKST' ).
    lo_primitive_property->set_edm_name( 'Xbkst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBAUF' ).
    lo_primitive_property->set_edm_name( 'Xbauf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBPRO' ).
    lo_primitive_property->set_edm_name( 'Xbpro' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EREKZ' ).
    lo_primitive_property->set_edm_name( 'Erekz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KSTRG' ).
    lo_primitive_property->set_edm_name( 'Kstrg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PS_PSP_PNR' ).
    lo_primitive_property->set_edm_name( 'PsPspPnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NPLNR' ).
    lo_primitive_property->set_edm_name( 'Nplnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUFPL' ).
    lo_primitive_property->set_edm_name( 'Aufpl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IMKEY' ).
    lo_primitive_property->set_edm_name( 'Imkey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'APLZL' ).
    lo_primitive_property->set_edm_name( 'Aplzl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VPTNR' ).
    lo_primitive_property->set_edm_name( 'Vptnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIPOS' ).
    lo_primitive_property->set_edm_name( 'Fipos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RECID' ).
    lo_primitive_property->set_edm_name( 'Recid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUMMY_INCL_EEW_COBL' ).
    lo_primitive_property->set_edm_name( 'DummyInclEewCobl' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKBER' ).
    lo_primitive_property->set_edm_name( 'Fkber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAVNW' ).
    lo_primitive_property->set_edm_name( 'Navnw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DABRZ' ).
    lo_primitive_property->set_edm_name( 'Dabrz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LSTAR' ).
    lo_primitive_property->set_edm_name( 'Lstar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRZNR' ).
    lo_primitive_property->set_edm_name( 'Prznr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRANT_NBR' ).
    lo_primitive_property->set_edm_name( 'GrantNbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FM_SPLIT_BATCH' ).
    lo_primitive_property->set_edm_name( 'FmSplitBatch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FM_SPLIT_BEGRU' ).
    lo_primitive_property->set_edm_name( 'FmSplitBegru' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDGET_PD' ).
    lo_primitive_property->set_edm_name( 'BudgetPd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FMFGUS_KEY' ).
    lo_primitive_property->set_edm_name( 'FmfgusKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATAAGING' ).
    lo_primitive_property->set_edm_name( 'Dataaging' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TCOBJNR' ).
    lo_primitive_property->set_edm_name( 'Tcobjnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 22 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATEOFSERVICE' ).
    lo_primitive_property->set_edm_name( 'Dateofservice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NOTAXCORR' ).
    lo_primitive_property->set_edm_name( 'Notaxcorr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DIFFOPTRATE' ).
    lo_primitive_property->set_edm_name( 'Diffoptrate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HASDIFFOPTRATE' ).
    lo_primitive_property->set_edm_name( 'Hasdiffoptrate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
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
    lo_primitive_property->set_is_nullable( ).

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


  METHOD def_z_i_lfa_1_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_LFA_1_TYPE'
                                    is_structure              = VALUE tys_z_i_lfa_1_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_LFA1Type' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_LFA_1' ).
    lo_entity_set->set_edm_name( 'Z_I_LFA1' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFNR' ).
    lo_primitive_property->set_edm_name( 'Lifnr' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORT_01' ).
    lo_primitive_property->set_edm_name( 'Ort01' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ESRNR' ).
    lo_primitive_property->set_edm_name( 'Esrnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KONZS' ).
    lo_primitive_property->set_edm_name( 'Konzs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KTOKK' ).
    lo_primitive_property->set_edm_name( 'Ktokk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUNNR' ).
    lo_primitive_property->set_edm_name( 'Kunnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LNRZA' ).
    lo_primitive_property->set_edm_name( 'Lnrza' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOEVM' ).
    lo_primitive_property->set_edm_name( 'Loevm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPERR' ).
    lo_primitive_property->set_edm_name( 'Sperr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPERM' ).
    lo_primitive_property->set_edm_name( 'Sperm' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TELF_1' ).
    lo_primitive_property->set_edm_name( 'Telf1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TELF_2' ).
    lo_primitive_property->set_edm_name( 'Telf2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TELFX' ).
    lo_primitive_property->set_edm_name( 'Telfx' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 31 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCPDK' ).
    lo_primitive_property->set_edm_name( 'Xcpdk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISKN' ).
    lo_primitive_property->set_edm_name( 'Fiskn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STCEG' ).
    lo_primitive_property->set_edm_name( 'Stceg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STKZN' ).
    lo_primitive_property->set_edm_name( 'Stkzn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPERQ' ).
    lo_primitive_property->set_edm_name( 'Sperq' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GBORT' ).
    lo_primitive_property->set_edm_name( 'Gbort' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GBDAT' ).
    lo_primitive_property->set_edm_name( 'Gbdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SEXKZ' ).
    lo_primitive_property->set_edm_name( 'Sexkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KRAUS' ).
    lo_primitive_property->set_edm_name( 'Kraus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REVDB' ).
    lo_primitive_property->set_edm_name( 'Revdb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QSSYS' ).
    lo_primitive_property->set_edm_name( 'Qssys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KTOCK' ).
    lo_primitive_property->set_edm_name( 'Ktock' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LTSNA' ).
    lo_primitive_property->set_edm_name( 'Ltsna' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WERKR' ).
    lo_primitive_property->set_edm_name( 'Werkr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLKAL' ).
    lo_primitive_property->set_edm_name( 'Plkal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUEFL' ).
    lo_primitive_property->set_edm_name( 'Duefl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXJCD' ).
    lo_primitive_property->set_edm_name( 'Txjcd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPERZ' ).
    lo_primitive_property->set_edm_name( 'Sperz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCACD' ).
    lo_primitive_property->set_edm_name( 'Scacd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SFRGR' ).
    lo_primitive_property->set_edm_name( 'Sfrgr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LZONE' ).
    lo_primitive_property->set_edm_name( 'Lzone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XLFZA' ).
    lo_primitive_property->set_edm_name( 'Xlfza' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DLGRP' ).
    lo_primitive_property->set_edm_name( 'Dlgrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REGSS' ).
    lo_primitive_property->set_edm_name( 'Regss' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACTSS' ).
    lo_primitive_property->set_edm_name( 'Actss' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IPISP' ).
    lo_primitive_property->set_edm_name( 'Ipisp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXBS' ).
    lo_primitive_property->set_edm_name( 'Taxbs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROFS' ).
    lo_primitive_property->set_edm_name( 'Profs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STGDL' ).
    lo_primitive_property->set_edm_name( 'Stgdl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMNFR' ).
    lo_primitive_property->set_edm_name( 'Emnfr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFURL' ).
    lo_primitive_property->set_edm_name( 'Lfurl' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QSSYSDAT' ).
    lo_primitive_property->set_edm_name( 'Qssysdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PODKZB' ).
    lo_primitive_property->set_edm_name( 'Podkzb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISKU' ).
    lo_primitive_property->set_edm_name( 'Fisku' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STENR' ).
    lo_primitive_property->set_edm_name( 'Stenr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CARRIER_CONF' ).
    lo_primitive_property->set_edm_name( 'CarrierConf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MIN_COMP' ).
    lo_primitive_property->set_edm_name( 'MinComp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TERM_LI' ).
    lo_primitive_property->set_edm_name( 'TermLi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CRC_NUM' ).
    lo_primitive_property->set_edm_name( 'CrcNum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CVP_XBLCK' ).
    lo_primitive_property->set_edm_name( 'CvpXblck' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEORA' ).
    lo_primitive_property->set_edm_name( 'Weora' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALLOWANCE_TYPE' ).
    lo_primitive_property->set_edm_name( 'AllowanceType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYTRSN' ).
    lo_primitive_property->set_edm_name( 'Paytrsn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFA_1_EEW_SUPP' ).
    lo_primitive_property->set_edm_name( 'Lfa1EewSupp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JSC_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'JScCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PPA_RELEVANT' ).
    lo_primitive_property->set_edm_name( 'PpaRelevant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BORGR_DATUN' ).
    lo_primitive_property->set_edm_name( 'BorgrDatun' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BORGR_YEAUN' ).
    lo_primitive_property->set_edm_name( 'BorgrYeaun' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AU_CARRYING_ENT' ).
    lo_primitive_property->set_edm_name( 'AuCarryingEnt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AU_IND_UNDER_18' ).
    lo_primitive_property->set_edm_name( 'AuIndUnder18' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AU_PAYMENT_NOT_EXCEED_75' ).
    lo_primitive_property->set_edm_name( 'AuPaymentNotExceed75' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AU_WHOLLY_INP_TAXED' ).
    lo_primitive_property->set_edm_name( 'AuWhollyInpTaxed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AU_PARTNER_WITHOUT_GAIN' ).
    lo_primitive_property->set_edm_name( 'AuPartnerWithoutGain' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AU_NOT_ENTITLED_ABN' ).
    lo_primitive_property->set_edm_name( 'AuNotEntitledAbn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AU_PAYMENT_EXEMPT' ).
    lo_primitive_property->set_edm_name( 'AuPaymentExempt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AU_PRIVATE_HOBBY' ).
    lo_primitive_property->set_edm_name( 'AuPrivateHobby' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AU_DOMESTIC_NATURE' ).
    lo_primitive_property->set_edm_name( 'AuDomesticNature' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDR_2_STREET' ).
    lo_primitive_property->set_edm_name( 'Addr2Street' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDR_2_HOUSE_NUM' ).
    lo_primitive_property->set_edm_name( 'Addr2HouseNum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDR_2_POST' ).
    lo_primitive_property->set_edm_name( 'Addr2Post' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDR_2_CITY' ).
    lo_primitive_property->set_edm_name( 'Addr2City' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDR_2_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'Addr2Country' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CATEG' ).
    lo_primitive_property->set_edm_name( 'Categ' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_NAME' ).
    lo_primitive_property->set_edm_name( 'PartnerName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_UTR' ).
    lo_primitive_property->set_edm_name( 'PartnerUtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STATUS' ).
    lo_primitive_property->set_edm_name( 'Status' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VFNUM' ).
    lo_primitive_property->set_edm_name( 'Vfnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VFNID' ).
    lo_primitive_property->set_edm_name( 'Vfnid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CRN' ).
    lo_primitive_property->set_edm_name( 'Crn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FR_OCCUPATION' ).
    lo_primitive_property->set_edm_name( 'FrOccupation' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_IEXCIVE' ).
    lo_primitive_property->set_edm_name( 'J1iexcive' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_ISSIST' ).
    lo_primitive_property->set_edm_name( 'J1issist' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_IVTYP' ).
    lo_primitive_property->set_edm_name( 'J1ivtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_IVENCRE' ).
    lo_primitive_property->set_edm_name( 'J1ivencre' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_IPANVALDT' ).
    lo_primitive_property->set_edm_name( 'J1ipanvaldt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_I_CUSTOMS' ).
    lo_primitive_property->set_edm_name( 'J1iCustoms' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_IDEDREF' ).
    lo_primitive_property->set_edm_name( 'J1idedref' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VEN_CLASS' ).
    lo_primitive_property->set_edm_name( 'VenClass' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENTPUB' ).
    lo_primitive_property->set_edm_name( 'Entpub' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ESCRIT' ).
    lo_primitive_property->set_edm_name( 'Escrit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DVALSS' ).
    lo_primitive_property->set_edm_name( 'Dvalss' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRMCSS' ).
    lo_primitive_property->set_edm_name( 'Frmcss' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CODCAE' ).
    lo_primitive_property->set_edm_name( 'Codcae' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUSDIV' ).
    lo_primitive_property->set_edm_name( 'Ausdiv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SC_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'ScCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANSPORT_CHAIN' ).
    lo_primitive_property->set_edm_name( 'TransportChain' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STAGING_TIME' ).
    lo_primitive_property->set_edm_name( 'StagingTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCHEDULING_TYPE' ).
    lo_primitive_property->set_edm_name( 'SchedulingType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBMI_RELEVANT' ).
    lo_primitive_property->set_edm_name( 'SubmiRelevant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_lfbwtype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_LFBWTYPE'
                                    is_structure              = VALUE tys_z_i_lfbwtype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_LFBWType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_LFBW' ).
    lo_entity_set->set_edm_name( 'Z_I_LFBW' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELETE_MC' ).
    lo_primitive_property->set_edm_name( 'Delete_mc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPDATE_MC' ).
    lo_primitive_property->set_edm_name( 'Update_mc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFNR' ).
    lo_primitive_property->set_edm_name( 'Lifnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUKRS' ).
    lo_primitive_property->set_edm_name( 'Bukrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WITHT' ).
    lo_primitive_property->set_edm_name( 'Witht' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WT_SUBJCT' ).
    lo_primitive_property->set_edm_name( 'WtSubjct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QSREC' ).
    lo_primitive_property->set_edm_name( 'Qsrec' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WT_WTSTCD' ).
    lo_primitive_property->set_edm_name( 'WtWtstcd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WT_WITHCD' ).
    lo_primitive_property->set_edm_name( 'WtWithcd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WT_EXNR' ).
    lo_primitive_property->set_edm_name( 'WtExnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WT_EXRT' ).
    lo_primitive_property->set_edm_name( 'WtExrt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WT_EXDF' ).
    lo_primitive_property->set_edm_name( 'WtExdf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WT_EXDT' ).
    lo_primitive_property->set_edm_name( 'WtExdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WT_WTEXRS' ).
    lo_primitive_property->set_edm_name( 'WtWtexrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_rbkptype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_RBKPTYPE'
                                    is_structure              = VALUE tys_z_i_rbkptype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_RBKPType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_RBKP' ).
    lo_entity_set->set_edm_name( 'Z_I_RBKP' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELETE_MC' ).
    lo_primitive_property->set_edm_name( 'Delete_mc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPDATE_MC' ).
    lo_primitive_property->set_edm_name( 'Update_mc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BELNR' ).
    lo_primitive_property->set_edm_name( 'Belnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GJAHR' ).
    lo_primitive_property->set_edm_name( 'Gjahr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLART' ).
    lo_primitive_property->set_edm_name( 'Blart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLDAT' ).
    lo_primitive_property->set_edm_name( 'Bldat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDAT' ).
    lo_primitive_property->set_edm_name( 'Budat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'USNAM' ).
    lo_primitive_property->set_edm_name( 'Usnam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TCODE' ).
    lo_primitive_property->set_edm_name( 'Tcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CPUDT' ).
    lo_primitive_property->set_edm_name( 'Cpudt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CPUTM' ).
    lo_primitive_property->set_edm_name( 'Cputm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGART' ).
    lo_primitive_property->set_edm_name( 'Vgart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBLNR' ).
    lo_primitive_property->set_edm_name( 'Xblnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUKRS' ).
    lo_primitive_property->set_edm_name( 'Bukrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFNR' ).
    lo_primitive_property->set_edm_name( 'Lifnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAERS' ).
    lo_primitive_property->set_edm_name( 'Waers' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KURSF' ).
    lo_primitive_property->set_edm_name( 'Kursf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXDAT' ).
    lo_primitive_property->set_edm_name( 'Txdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXDAT_FROM' ).
    lo_primitive_property->set_edm_name( 'TxdatFrom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MWSKZ_1' ).
    lo_primitive_property->set_edm_name( 'Mwskz1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MWSKZ_2' ).
    lo_primitive_property->set_edm_name( 'Mwskz2' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZBD_1_P' ).
    lo_primitive_property->set_edm_name( 'Zbd1p' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZBD_2_T' ).
    lo_primitive_property->set_edm_name( 'Zbd2t' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZBD_2_P' ).
    lo_primitive_property->set_edm_name( 'Zbd2p' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZBD_3_T' ).
    lo_primitive_property->set_edm_name( 'Zbd3t' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XRECH' ).
    lo_primitive_property->set_edm_name( 'Xrech' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BKTXT' ).
    lo_primitive_property->set_edm_name( 'Bktxt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAPRL' ).
    lo_primitive_property->set_edm_name( 'Saprl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOGSYS' ).
    lo_primitive_property->set_edm_name( 'Logsys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XMWST' ).
    lo_primitive_property->set_edm_name( 'Xmwst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STBLG' ).
    lo_primitive_property->set_edm_name( 'Stblg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STJAH' ).
    lo_primitive_property->set_edm_name( 'Stjah' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MWSKZ_BNK' ).
    lo_primitive_property->set_edm_name( 'MwskzBnk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXJCD_BNK' ).
    lo_primitive_property->set_edm_name( 'TxjcdBnk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IVTYP' ).
    lo_primitive_property->set_edm_name( 'Ivtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XRBTX' ).
    lo_primitive_property->set_edm_name( 'Xrbtx' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REPART' ).
    lo_primitive_property->set_edm_name( 'Repart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RBSTAT' ).
    lo_primitive_property->set_edm_name( 'Rbstat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNUMVE' ).
    lo_primitive_property->set_edm_name( 'Knumve' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNUMVL' ).
    lo_primitive_property->set_edm_name( 'Knumvl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XAUTAKZ' ).
    lo_primitive_property->set_edm_name( 'Xautakz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ESRNR' ).
    lo_primitive_property->set_edm_name( 'Esrnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ESRPZ' ).
    lo_primitive_property->set_edm_name( 'Esrpz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ESRRE' ).
    lo_primitive_property->set_edm_name( 'Esrre' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 27 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QSSKZ' ).
    lo_primitive_property->set_edm_name( 'Qsskz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DIEKZ' ).
    lo_primitive_property->set_edm_name( 'Diekz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANDL' ).
    lo_primitive_property->set_edm_name( 'Landl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LZBKZ' ).
    lo_primitive_property->set_edm_name( 'Lzbkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXKRS' ).
    lo_primitive_property->set_edm_name( 'Txkrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CTXKRS' ).
    lo_primitive_property->set_edm_name( 'Ctxkrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMPFB' ).
    lo_primitive_property->set_edm_name( 'Empfb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BVTYP' ).
    lo_primitive_property->set_edm_name( 'Bvtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HBKID' ).
    lo_primitive_property->set_edm_name( 'Hbkid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HKTID' ).
    lo_primitive_property->set_edm_name( 'Hktid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZUONR' ).
    lo_primitive_property->set_edm_name( 'Zuonr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZLSPR' ).
    lo_primitive_property->set_edm_name( 'Zlspr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZLSCH' ).
    lo_primitive_property->set_edm_name( 'Zlsch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZFBDT' ).
    lo_primitive_property->set_edm_name( 'Zfbdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KIDNO' ).
    lo_primitive_property->set_edm_name( 'Kidno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REBZG' ).
    lo_primitive_property->set_edm_name( 'Rebzg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REBZJ' ).
    lo_primitive_property->set_edm_name( 'Rebzj' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XINVE' ).
    lo_primitive_property->set_edm_name( 'Xinve' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EGMLD' ).
    lo_primitive_property->set_edm_name( 'Egmld' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XEGDR' ).
    lo_primitive_property->set_edm_name( 'Xegdr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VATDATE' ).
    lo_primitive_property->set_edm_name( 'Vatdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HKONT' ).
    lo_primitive_property->set_edm_name( 'Hkont' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MONAT' ).
    lo_primitive_property->set_edm_name( 'Monat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_BNFTYPE' ).
    lo_primitive_property->set_edm_name( 'J1bnftype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRNCH' ).
    lo_primitive_property->set_edm_name( 'Brnch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERFPR' ).
    lo_primitive_property->set_edm_name( 'Erfpr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SECCO' ).
    lo_primitive_property->set_edm_name( 'Secco' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSTLZ' ).
    lo_primitive_property->set_edm_name( 'Pstlz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORT_01' ).
    lo_primitive_property->set_edm_name( 'Ort01' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAND_1' ).
    lo_primitive_property->set_edm_name( 'Land1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STRAS' ).
    lo_primitive_property->set_edm_name( 'Stras' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSKTO' ).
    lo_primitive_property->set_edm_name( 'Pskto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANKN' ).
    lo_primitive_property->set_edm_name( 'Bankn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANKL' ).
    lo_primitive_property->set_edm_name( 'Bankl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANKS' ).
    lo_primitive_property->set_edm_name( 'Banks' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STKZU' ).
    lo_primitive_property->set_edm_name( 'Stkzu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STKZA' ).
    lo_primitive_property->set_edm_name( 'Stkza' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REGIO' ).
    lo_primitive_property->set_edm_name( 'Regio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BKONT' ).
    lo_primitive_property->set_edm_name( 'Bkont' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DTAWS' ).
    lo_primitive_property->set_edm_name( 'Dtaws' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DTAMS' ).
    lo_primitive_property->set_edm_name( 'Dtams' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPRAS' ).
    lo_primitive_property->set_edm_name( 'Spras' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCPDK' ).
    lo_primitive_property->set_edm_name( 'Xcpdk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMPFG' ).
    lo_primitive_property->set_edm_name( 'Empfg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STKZN' ).
    lo_primitive_property->set_edm_name( 'Stkzn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BKREF' ).
    lo_primitive_property->set_edm_name( 'Bkref' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANRED' ).
    lo_primitive_property->set_edm_name( 'Anred' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STCEG' ).
    lo_primitive_property->set_edm_name( 'Stceg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STCD_5' ).
    lo_primitive_property->set_edm_name( 'Stcd5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTAD' ).
    lo_primitive_property->set_edm_name( 'Intad' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 130 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_RE_1_OT' ).
    lo_primitive_property->set_edm_name( 'GloRe1Ot' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 140 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERNAME' ).
    lo_primitive_property->set_edm_name( 'Ername' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REINDAT' ).
    lo_primitive_property->set_edm_name( 'Reindat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UZAWE' ).
    lo_primitive_property->set_edm_name( 'Uzawe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FDLEV' ).
    lo_primitive_property->set_edm_name( 'Fdlev' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FDTAG' ).
    lo_primitive_property->set_edm_name( 'Fdtag' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZBFIX' ).
    lo_primitive_property->set_edm_name( 'Zbfix' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRGKZ' ).
    lo_primitive_property->set_edm_name( 'Frgkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERFNAM' ).
    lo_primitive_property->set_edm_name( 'Erfnam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUPLA' ).
    lo_primitive_property->set_edm_name( 'Bupla' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FILKD' ).
    lo_primitive_property->set_edm_name( 'Filkd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GSBER' ).
    lo_primitive_property->set_edm_name( 'Gsber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOTKZ' ).
    lo_primitive_property->set_edm_name( 'Lotkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SGTXT' ).
    lo_primitive_property->set_edm_name( 'Sgtxt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INV_TRAN' ).
    lo_primitive_property->set_edm_name( 'InvTran' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PREPAY_STATUS' ).
    lo_primitive_property->set_edm_name( 'PrepayStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PREPAY_AWKEY' ).
    lo_primitive_property->set_edm_name( 'PrepayAwkey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ASSIGN_STATUS' ).
    lo_primitive_property->set_edm_name( 'AssignStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ASSIGN_NEXT_DATE' ).
    lo_primitive_property->set_edm_name( 'AssignNextDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ASSIGN_END_DATE' ).
    lo_primitive_property->set_edm_name( 'AssignEndDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COPY_BY_BELNR' ).
    lo_primitive_property->set_edm_name( 'CopyByBelnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COPY_BY_YEAR' ).
    lo_primitive_property->set_edm_name( 'CopyByYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COPY_TO_BELNR' ).
    lo_primitive_property->set_edm_name( 'CopyToBelnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COPY_TO_YEAR' ).
    lo_primitive_property->set_edm_name( 'CopyToYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COPY_USER' ).
    lo_primitive_property->set_edm_name( 'CopyUser' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KURSX' ).
    lo_primitive_property->set_edm_name( 'Kursx' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 28 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WWERT' ).
    lo_primitive_property->set_edm_name( 'Wwert' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XREF_3' ).
    lo_primitive_property->set_edm_name( 'Xref3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUMMY_MMIV_SI_SHEADER_EEW' ).
    lo_primitive_property->set_edm_name( 'DummyMmivSiSHeaderEewPs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_NETWORK_ORIGIN' ).
    lo_primitive_property->set_edm_name( 'BusinessNetworkOrigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ISEOPBLOCKED' ).
    lo_primitive_property->set_edm_name( 'Iseopblocked' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LASTCHANGEDATETIME' ).
    lo_primitive_property->set_edm_name( 'Lastchangedatetime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 21 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_1_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef1Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_1_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat1Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_2_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef2Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_2_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat2Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_3_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef3Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_3_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat3Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_4_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef4Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_4_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat4Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_REF_5_HD' ).
    lo_primitive_property->set_edm_name( 'GloRef5Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLO_DAT_5_HD' ).
    lo_primitive_property->set_edm_name( 'GloDat5Hd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CIM_REPLICATIONTIMESTAMP' ).
    lo_primitive_property->set_edm_name( 'CimReplicationtimestamp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 21 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TMTYPE' ).
    lo_primitive_property->set_edm_name( 'Tmtype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY_BNK' ).
    lo_primitive_property->set_edm_name( 'TaxCountryBnk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FULFILLDATE' ).
    lo_primitive_property->set_edm_name( 'Fulfilldate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESSOBJECTID_VCM' ).
    lo_primitive_property->set_edm_name( 'BusinessobjectidVcm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPECIALTAXHANDLINGISREQUIR' ).
    lo_primitive_property->set_edm_name( 'Specialtaxhandlingisrequired' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NODE_KEY' ).
    lo_primitive_property->set_edm_name( 'NodeKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARENT_KEY' ).
    lo_primitive_property->set_edm_name( 'ParentKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROOT_KEY' ).
    lo_primitive_property->set_edm_name( 'RootKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_TPBUPL' ).
    lo_primitive_property->set_edm_name( 'J1tpbupl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOGMX_UUID' ).
    lo_primitive_property->set_edm_name( 'LogmxUuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 36 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANXTYPE' ).
    lo_primitive_property->set_edm_name( 'Anxtype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANXPERC' ).
    lo_primitive_property->set_edm_name( 'Anxperc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZVAT_INDC' ).
    lo_primitive_property->set_edm_name( 'ZvatIndc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XILEXPARK' ).
    lo_primitive_property->set_edm_name( 'xilexpark' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XILEXHOLD' ).
    lo_primitive_property->set_edm_name( 'xilexhold' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XILEXBAPI_SAVE' ).
    lo_primitive_property->set_edm_name( 'xilexbapiSave' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GST_PART' ).
    lo_primitive_property->set_edm_name( 'GstPart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLC_SUP' ).
    lo_primitive_property->set_edm_name( 'PlcSup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IRN' ).
    lo_primitive_property->set_edm_name( 'Irn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 64 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYBASTYP' ).
    lo_primitive_property->set_edm_name( 'Pybastyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYBASNO' ).
    lo_primitive_property->set_edm_name( 'Pybasno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYBASDAT' ).
    lo_primitive_property->set_edm_name( 'Pybasdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PYIBAN' ).
    lo_primitive_property->set_edm_name( 'Pyiban' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 34 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INWARDNO_HD' ).
    lo_primitive_property->set_edm_name( 'InwardnoHd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INWARDDT_HD' ).
    lo_primitive_property->set_edm_name( 'InwarddtHd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_z_i_t_006_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_T_006_TYPE'
                                    is_structure              = VALUE tys_z_i_t_006_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_T006Type' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_T_006' ).
    lo_entity_set->set_edm_name( 'Z_I_T006' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSEHI' ).
    lo_primitive_property->set_edm_name( 'Msehi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZEX_3' ).
    lo_primitive_property->set_edm_name( 'Kzex3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZEX_6' ).
    lo_primitive_property->set_edm_name( 'Kzex6' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANDEC' ).
    lo_primitive_property->set_edm_name( 'Andec' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int16' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZKEH' ).
    lo_primitive_property->set_edm_name( 'Kzkeh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZWOB' ).
    lo_primitive_property->set_edm_name( 'Kzwob' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZ_1_EH' ).
    lo_primitive_property->set_edm_name( 'Kz1eh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZ_2_EH' ).
    lo_primitive_property->set_edm_name( 'Kz2eh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DIMID' ).
    lo_primitive_property->set_edm_name( 'Dimid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZAEHL' ).
    lo_primitive_property->set_edm_name( 'Zaehl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NENNR' ).
    lo_primitive_property->set_edm_name( 'Nennr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXP_10' ).
    lo_primitive_property->set_edm_name( 'Exp10' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int16' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDKO' ).
    lo_primitive_property->set_edm_name( 'Addko' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXPON' ).
    lo_primitive_property->set_edm_name( 'Expon' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int16' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DECAN' ).
    lo_primitive_property->set_edm_name( 'Decan' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int16' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ISOCODE' ).
    lo_primitive_property->set_edm_name( 'Isocode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRIMARY_1' ).
    lo_primitive_property->set_edm_name( 'Primary1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEMP_VALUE' ).
    lo_primitive_property->set_edm_name( 'TempValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEMP_UNIT' ).
    lo_primitive_property->set_edm_name( 'TempUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAMUNIT' ).
    lo_primitive_property->set_edm_name( 'Famunit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRESS_VAL' ).
    lo_primitive_property->set_edm_name( 'PressVal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRESS_UNIT' ).
    lo_primitive_property->set_edm_name( 'PressUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_vfkptype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_VFKPTYPE'
                                    is_structure              = VALUE tys_z_i_vfkptype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_VFKPType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_VFKP' ).
    lo_entity_set->set_edm_name( 'Z_I_VFKP' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKNUM' ).
    lo_primitive_property->set_edm_name( 'Fknum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKPOS' ).
    lo_primitive_property->set_edm_name( 'Fkpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKPTY' ).
    lo_primitive_property->set_edm_name( 'Fkpty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUKRS' ).
    lo_primitive_property->set_edm_name( 'Bukrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETWR' ).
    lo_primitive_property->set_edm_name( 'Netwr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MWSBP' ).
    lo_primitive_property->set_edm_name( 'Mwsbp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAERS' ).
    lo_primitive_property->set_edm_name( 'Waers' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MWSKZ' ).
    lo_primitive_property->set_edm_name( 'Mwskz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRSDT' ).
    lo_primitive_property->set_edm_name( 'Prsdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDAT' ).
    lo_primitive_property->set_edm_name( 'Budat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTI_1' ).
    lo_primitive_property->set_edm_name( 'Exti1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTI_2' ).
    lo_primitive_property->set_edm_name( 'Exti2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TPLST' ).
    lo_primitive_property->set_edm_name( 'Tplst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSART' ).
    lo_primitive_property->set_edm_name( 'Vsart' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WERKS' ).
    lo_primitive_property->set_edm_name( 'Werks' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EBELN' ).
    lo_primitive_property->set_edm_name( 'Ebeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EBELP' ).
    lo_primitive_property->set_edm_name( 'Ebelp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LBLNI' ).
    lo_primitive_property->set_edm_name( 'Lblni' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARVW' ).
    lo_primitive_property->set_edm_name( 'Parvw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TDLNR' ).
    lo_primitive_property->set_edm_name( 'Tdlnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RECHS' ).
    lo_primitive_property->set_edm_name( 'Rechs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KURST' ).
    lo_primitive_property->set_edm_name( 'Kurst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOSTY' ).
    lo_primitive_property->set_edm_name( 'Kosty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFTY' ).
    lo_primitive_property->set_edm_name( 'Refty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REBEL' ).
    lo_primitive_property->set_edm_name( 'Rebel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REPOS' ).
    lo_primitive_property->set_edm_name( 'Repos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSTX' ).
    lo_primitive_property->set_edm_name( 'Postx' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNTTP' ).
    lo_primitive_property->set_edm_name( 'Knttp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BKLAS' ).
    lo_primitive_property->set_edm_name( 'Bklas' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STBER' ).
    lo_primitive_property->set_edm_name( 'Stber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DTBER' ).
    lo_primitive_property->set_edm_name( 'Dtber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UZBER' ).
    lo_primitive_property->set_edm_name( 'Uzber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STFRE' ).
    lo_primitive_property->set_edm_name( 'Stfre' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DTFRE' ).
    lo_primitive_property->set_edm_name( 'Dtfre' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UZFRE' ).
    lo_primitive_property->set_edm_name( 'Uzfre' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STABR' ).
    lo_primitive_property->set_edm_name( 'Stabr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DTABR' ).
    lo_primitive_property->set_edm_name( 'Dtabr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UZABR' ).
    lo_primitive_property->set_edm_name( 'Uzabr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AEZET' ).
    lo_primitive_property->set_edm_name( 'Aezet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOGSYS' ).
    lo_primitive_property->set_edm_name( 'Logsys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KSTAU' ).
    lo_primitive_property->set_edm_name( 'Kstau' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRFZNA' ).
    lo_primitive_property->set_edm_name( 'Trfzna' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRFZNZ' ).
    lo_primitive_property->set_edm_name( 'Trfznz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TXJCD' ).
    lo_primitive_property->set_edm_name( 'Txjcd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BASWR' ).
    lo_primitive_property->set_edm_name( 'Baswr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SLAND_1_A' ).
    lo_primitive_property->set_edm_name( 'Sland1A' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SLAND_1_Z' ).
    lo_primitive_property->set_edm_name( 'Sland1Z' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKSTO' ).
    lo_primitive_property->set_edm_name( 'Fksto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
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

  ENDMETHOD.


  METHOD def_z_i_vttktype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_VTTKTYPE'
                                    is_structure              = VALUE tys_z_i_vttktype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_VTTKType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_VTTK' ).
    lo_entity_set->set_edm_name( 'Z_I_VTTK' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'TKNUM' ).
    lo_primitive_property->set_edm_name( 'Tknum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBTYP' ).
    lo_primitive_property->set_edm_name( 'Vbtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHTYP' ).
    lo_primitive_property->set_edm_name( 'Shtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TPLST' ).
    lo_primitive_property->set_edm_name( 'Tplst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AEZET' ).
    lo_primitive_property->set_edm_name( 'Aezet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STERM' ).
    lo_primitive_property->set_edm_name( 'Sterm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABFER' ).
    lo_primitive_property->set_edm_name( 'Abfer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABWST' ).
    lo_primitive_property->set_edm_name( 'Abwst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BFART' ).
    lo_primitive_property->set_edm_name( 'Bfart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSART' ).
    lo_primitive_property->set_edm_name( 'Vsart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSAVL' ).
    lo_primitive_property->set_edm_name( 'Vsavl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSANL' ).
    lo_primitive_property->set_edm_name( 'Vsanl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAUFK' ).
    lo_primitive_property->set_edm_name( 'Laufk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSBED' ).
    lo_primitive_property->set_edm_name( 'Vsbed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROUTE' ).
    lo_primitive_property->set_edm_name( 'Route' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SIGNI' ).
    lo_primitive_property->set_edm_name( 'Signi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTI_1' ).
    lo_primitive_property->set_edm_name( 'Exti1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTI_2' ).
    lo_primitive_property->set_edm_name( 'Exti2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TPBEZ' ).
    lo_primitive_property->set_edm_name( 'Tpbez' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STDIS' ).
    lo_primitive_property->set_edm_name( 'Stdis' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DTDIS' ).
    lo_primitive_property->set_edm_name( 'Dtdis' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UZDIS' ).
    lo_primitive_property->set_edm_name( 'Uzdis' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREG' ).
    lo_primitive_property->set_edm_name( 'Streg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DPREG' ).
    lo_primitive_property->set_edm_name( 'Dpreg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPREG' ).
    lo_primitive_property->set_edm_name( 'Upreg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DAREG' ).
    lo_primitive_property->set_edm_name( 'Dareg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UAREG' ).
    lo_primitive_property->set_edm_name( 'Uareg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STLBG' ).
    lo_primitive_property->set_edm_name( 'Stlbg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DPLBG' ).
    lo_primitive_property->set_edm_name( 'Dplbg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPLBG' ).
    lo_primitive_property->set_edm_name( 'Uplbg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DALBG' ).
    lo_primitive_property->set_edm_name( 'Dalbg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UALBG' ).
    lo_primitive_property->set_edm_name( 'Ualbg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STLAD' ).
    lo_primitive_property->set_edm_name( 'Stlad' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DPLEN' ).
    lo_primitive_property->set_edm_name( 'Dplen' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPLEN' ).
    lo_primitive_property->set_edm_name( 'Uplen' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DALEN' ).
    lo_primitive_property->set_edm_name( 'Dalen' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UALEN' ).
    lo_primitive_property->set_edm_name( 'Ualen' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STABF' ).
    lo_primitive_property->set_edm_name( 'Stabf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DPABF' ).
    lo_primitive_property->set_edm_name( 'Dpabf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPABF' ).
    lo_primitive_property->set_edm_name( 'Upabf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DTABF' ).
    lo_primitive_property->set_edm_name( 'Dtabf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UZABF' ).
    lo_primitive_property->set_edm_name( 'Uzabf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STTBG' ).
    lo_primitive_property->set_edm_name( 'Sttbg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DPTBG' ).
    lo_primitive_property->set_edm_name( 'Dptbg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPTBG' ).
    lo_primitive_property->set_edm_name( 'Uptbg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATBG' ).
    lo_primitive_property->set_edm_name( 'Datbg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UATBG' ).
    lo_primitive_property->set_edm_name( 'Uatbg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STTEN' ).
    lo_primitive_property->set_edm_name( 'Stten' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DPTEN' ).
    lo_primitive_property->set_edm_name( 'Dpten' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPTEN' ).
    lo_primitive_property->set_edm_name( 'Upten' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATEN' ).
    lo_primitive_property->set_edm_name( 'Daten' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UATEN' ).
    lo_primitive_property->set_edm_name( 'Uaten' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STTRG' ).
    lo_primitive_property->set_edm_name( 'Sttrg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TDLNR' ).
    lo_primitive_property->set_edm_name( 'Tdlnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TERNR' ).
    lo_primitive_property->set_edm_name( 'Ternr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PKSTK' ).
    lo_primitive_property->set_edm_name( 'Pkstk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DTMEG' ).
    lo_primitive_property->set_edm_name( 'Dtmeg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DTMEV' ).
    lo_primitive_property->set_edm_name( 'Dtmev' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEDST' ).
    lo_primitive_property->set_edm_name( 'Medst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEIZT' ).
    lo_primitive_property->set_edm_name( 'Meizt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STAFO' ).
    lo_primitive_property->set_edm_name( 'Stafo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FBSTA' ).
    lo_primitive_property->set_edm_name( 'Fbsta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FBGST' ).
    lo_primitive_property->set_edm_name( 'Fbgst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARSTA' ).
    lo_primitive_property->set_edm_name( 'Arsta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARGST' ).
    lo_primitive_property->set_edm_name( 'Argst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STERM_DONE' ).
    lo_primitive_property->set_edm_name( 'StermDone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSE_FRK' ).
    lo_primitive_property->set_edm_name( 'VseFrk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KKALSM' ).
    lo_primitive_property->set_edm_name( 'Kkalsm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDABW' ).
    lo_primitive_property->set_edm_name( 'Sdabw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRKRL' ).
    lo_primitive_property->set_edm_name( 'Frkrl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GESZTD' ).
    lo_primitive_property->set_edm_name( 'Gesztd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAHZTD' ).
    lo_primitive_property->set_edm_name( 'Fahztd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GESZTDA' ).
    lo_primitive_property->set_edm_name( 'Gesztda' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAHZTDA' ).
    lo_primitive_property->set_edm_name( 'Fahztda' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROCPY_DONE' ).
    lo_primitive_property->set_edm_name( 'RocpyDone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HANDLE' ).
    lo_primitive_property->set_edm_name( 'Handle' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TSEGFL' ).
    lo_primitive_property->set_edm_name( 'Tsegfl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TSEGTP' ).
    lo_primitive_property->set_edm_name( 'Tsegtp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADD_01' ).
    lo_primitive_property->set_edm_name( 'Add01' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADD_02' ).
    lo_primitive_property->set_edm_name( 'Add02' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADD_03' ).
    lo_primitive_property->set_edm_name( 'Add03' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADD_04' ).
    lo_primitive_property->set_edm_name( 'Add04' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEXT_1' ).
    lo_primitive_property->set_edm_name( 'Text1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEXT_2' ).
    lo_primitive_property->set_edm_name( 'Text2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEXT_3' ).
    lo_primitive_property->set_edm_name( 'Text3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEXT_4' ).
    lo_primitive_property->set_edm_name( 'Text4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROLI' ).
    lo_primitive_property->set_edm_name( 'Proli' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DGTLOCK' ).
    lo_primitive_property->set_edm_name( 'Dgtlock' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DGMDDAT' ).
    lo_primitive_property->set_edm_name( 'Dgmddat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONT_DG' ).
    lo_primitive_property->set_edm_name( 'ContDg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WARZTD' ).
    lo_primitive_property->set_edm_name( 'Warztd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WARZTDA' ).
    lo_primitive_property->set_edm_name( 'Warztda' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AULWE' ).
    lo_primitive_property->set_edm_name( 'Aulwe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDRST' ).
    lo_primitive_property->set_edm_name( 'Tndrst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDRRC' ).
    lo_primitive_property->set_edm_name( 'Tndrrc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDR_TEXT' ).
    lo_primitive_property->set_edm_name( 'TndrText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDRDAT' ).
    lo_primitive_property->set_edm_name( 'Tndrdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDRZET' ).
    lo_primitive_property->set_edm_name( 'Tndrzet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDR_MAXC' ).
    lo_primitive_property->set_edm_name( 'TndrMaxc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDR_ACTC' ).
    lo_primitive_property->set_edm_name( 'TndrActc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDR_CARR' ).
    lo_primitive_property->set_edm_name( 'TndrCarr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDR_CRNM' ).
    lo_primitive_property->set_edm_name( 'TndrCrnm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDR_TRKID' ).
    lo_primitive_property->set_edm_name( 'TndrTrkid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDR_EXPD' ).
    lo_primitive_property->set_edm_name( 'TndrExpd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDR_EXPT' ).
    lo_primitive_property->set_edm_name( 'TndrExpt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDR_ERPD' ).
    lo_primitive_property->set_edm_name( 'TndrErpd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDR_ERPT' ).
    lo_primitive_property->set_edm_name( 'TndrErpt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDR_LTPD' ).
    lo_primitive_property->set_edm_name( 'TndrLtpd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDR_LTPT' ).
    lo_primitive_property->set_edm_name( 'TndrLtpt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDR_ERDD' ).
    lo_primitive_property->set_edm_name( 'TndrErdd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDR_ERDT' ).
    lo_primitive_property->set_edm_name( 'TndrErdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDR_LTDD' ).
    lo_primitive_property->set_edm_name( 'TndrLtdd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDR_LTDT' ).
    lo_primitive_property->set_edm_name( 'TndrLtdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNDR_LDLU' ).
    lo_primitive_property->set_edm_name( 'TndrLdlu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZHULFR' ).
    lo_primitive_property->set_edm_name( 'Kzhulfr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VLSTK' ).
    lo_primitive_property->set_edm_name( 'Vlstk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VERURSYS' ).
    lo_primitive_property->set_edm_name( 'Verursys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CM_IDENT' ).
    lo_primitive_property->set_edm_name( 'CmIdent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CM_SEQUENCE' ).
    lo_primitive_property->set_edm_name( 'CmSequence' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_FREIGHT_ORD' ).
    lo_primitive_property->set_edm_name( 'ExtFreightOrd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_TM_SYS' ).
    lo_primitive_property->set_edm_name( 'ExtTmSys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBEV_1_XRPFAR_1' ).
    lo_primitive_property->set_edm_name( 'xbev1xrpfar1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBEV_1_XRPFAR_2' ).
    lo_primitive_property->set_edm_name( 'xbev1xrpfar2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBEV_1_XRPMOWA' ).
    lo_primitive_property->set_edm_name( 'xbev1xrpmowa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBEV_1_XRPANHAE' ).
    lo_primitive_property->set_edm_name( 'xbev1xrpanhae' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XBEV_1_XRPFLGNR' ).
    lo_primitive_property->set_edm_name( 'xbev1xrpflgnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XVSOXR_STATUS' ).
    lo_primitive_property->set_edm_name( 'xvsoxrStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_vttstype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_VTTSTYPE'
                                    is_structure              = VALUE tys_z_i_vttstype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_VTTSType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_VTTS' ).
    lo_entity_set->set_edm_name( 'Z_I_VTTS' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'TKNUM' ).
    lo_primitive_property->set_edm_name( 'Tknum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TSNUM' ).
    lo_primitive_property->set_edm_name( 'Tsnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TSTYP' ).
    lo_primitive_property->set_edm_name( 'Tstyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TSRFO' ).
    lo_primitive_property->set_edm_name( 'Tsrfo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ELUPD' ).
    lo_primitive_property->set_edm_name( 'Elupd' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AEZET' ).
    lo_primitive_property->set_edm_name( 'Aezet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROUTE' ).
    lo_primitive_property->set_edm_name( 'Route' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSART' ).
    lo_primitive_property->set_edm_name( 'Vsart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_1' ).
    lo_primitive_property->set_edm_name( 'Inco1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAUFK' ).
    lo_primitive_property->set_edm_name( 'Laufk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADRNA' ).
    lo_primitive_property->set_edm_name( 'Adrna' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNOTA' ).
    lo_primitive_property->set_edm_name( 'Knota' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSTEL' ).
    lo_primitive_property->set_edm_name( 'Vstel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LSTEL' ).
    lo_primitive_property->set_edm_name( 'Lstel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WERKA' ).
    lo_primitive_property->set_edm_name( 'Werka' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGORTA' ).
    lo_primitive_property->set_edm_name( 'Lgorta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUNNA' ).
    lo_primitive_property->set_edm_name( 'Kunna' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFNA' ).
    lo_primitive_property->set_edm_name( 'Lifna' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BELAD' ).
    lo_primitive_property->set_edm_name( 'Belad' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADRNZ' ).
    lo_primitive_property->set_edm_name( 'Adrnz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNOTZ' ).
    lo_primitive_property->set_edm_name( 'Knotz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSTEZ' ).
    lo_primitive_property->set_edm_name( 'Vstez' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LSTEZ' ).
    lo_primitive_property->set_edm_name( 'Lstez' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WERKZ' ).
    lo_primitive_property->set_edm_name( 'Werkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGORTZ' ).
    lo_primitive_property->set_edm_name( 'Lgortz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUNNZ' ).
    lo_primitive_property->set_edm_name( 'Kunnz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFNZ' ).
    lo_primitive_property->set_edm_name( 'Lifnz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABLAD' ).
    lo_primitive_property->set_edm_name( 'Ablad' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DPTBG' ).
    lo_primitive_property->set_edm_name( 'Dptbg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPTBG' ).
    lo_primitive_property->set_edm_name( 'Uptbg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATBG' ).
    lo_primitive_property->set_edm_name( 'Datbg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UATBG' ).
    lo_primitive_property->set_edm_name( 'Uatbg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DPTEN' ).
    lo_primitive_property->set_edm_name( 'Dpten' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPTEN' ).
    lo_primitive_property->set_edm_name( 'Upten' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATEN' ).
    lo_primitive_property->set_edm_name( 'Daten' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UATEN' ).
    lo_primitive_property->set_edm_name( 'Uaten' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TDLNR' ).
    lo_primitive_property->set_edm_name( 'Tdlnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISTZ' ).
    lo_primitive_property->set_edm_name( 'Distz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEDST' ).
    lo_primitive_property->set_edm_name( 'Medst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAHZT' ).
    lo_primitive_property->set_edm_name( 'Fahzt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GESZT' ).
    lo_primitive_property->set_edm_name( 'Geszt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEIZT' ).
    lo_primitive_property->set_edm_name( 'Meizt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGNUMA' ).
    lo_primitive_property->set_edm_name( 'Lgnuma' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TORA' ).
    lo_primitive_property->set_edm_name( 'Tora' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADRKNZA' ).
    lo_primitive_property->set_edm_name( 'Adrknza' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUNABLA' ).
    lo_primitive_property->set_edm_name( 'Kunabla' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGNUMZ' ).
    lo_primitive_property->set_edm_name( 'Lgnumz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TORZ' ).
    lo_primitive_property->set_edm_name( 'Torz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADRKNZZ' ).
    lo_primitive_property->set_edm_name( 'Adrknzz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUNABLZ' ).
    lo_primitive_property->set_edm_name( 'Kunablz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GESZTD' ).
    lo_primitive_property->set_edm_name( 'Gesztd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAHZTD' ).
    lo_primitive_property->set_edm_name( 'Fahztd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GESZTDA' ).
    lo_primitive_property->set_edm_name( 'Gesztda' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAHZTDA' ).
    lo_primitive_property->set_edm_name( 'Fahztda' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDABW' ).
    lo_primitive_property->set_edm_name( 'Sdabw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FRKRL' ).
    lo_primitive_property->set_edm_name( 'Frkrl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SKALSM' ).
    lo_primitive_property->set_edm_name( 'Skalsm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FBSTA' ).
    lo_primitive_property->set_edm_name( 'Fbsta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARSTA' ).
    lo_primitive_property->set_edm_name( 'Arsta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STAFO' ).
    lo_primitive_property->set_edm_name( 'Stafo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONT_DG' ).
    lo_primitive_property->set_edm_name( 'ContDg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WARZTD' ).
    lo_primitive_property->set_edm_name( 'Warztd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WARZTDA' ).
    lo_primitive_property->set_edm_name( 'Warztda' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABLAND_1' ).
    lo_primitive_property->set_edm_name( 'Abland1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABPSTLZ' ).
    lo_primitive_property->set_edm_name( 'Abpstlz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABORT_01' ).
    lo_primitive_property->set_edm_name( 'Abort01' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EDLAND_1' ).
    lo_primitive_property->set_edm_name( 'Edland1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EDPSTLZ' ).
    lo_primitive_property->set_edm_name( 'Edpstlz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EDORT_01' ).
    lo_primitive_property->set_edm_name( 'Edort01' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_z_i_zinv_spooltype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'Z_I_ZINV_SPOOLTYPE'
                                    is_structure              = VALUE tys_z_i_zinv_spooltype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Z_I_ZINV_SPOOLType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'Z_I_ZINV_SPOOL' ).
    lo_entity_set->set_edm_name( 'Z_I_ZINV_SPOOL' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'NOFACT' ).
    lo_primitive_property->set_edm_name( 'Nofact' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCTYP' ).
    lo_primitive_property->set_edm_name( 'Doctyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EBELN' ).
    lo_primitive_property->set_edm_name( 'Ebeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFNR' ).
    lo_primitive_property->set_edm_name( 'Lifnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FOLIO' ).
    lo_primitive_property->set_edm_name( 'Folio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FECHA' ).
    lo_primitive_property->set_edm_name( 'Fecha' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HORA' ).
    lo_primitive_property->set_edm_name( 'Hora' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFC_EMISOR' ).
    lo_primitive_property->set_edm_name( 'RfcEmisor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COCODE' ).
    lo_primitive_property->set_edm_name( 'Cocode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FEFACT' ).
    lo_primitive_property->set_edm_name( 'Fefact' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAERS' ).
    lo_primitive_property->set_edm_name( 'Waers' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXCODE' ).
    lo_primitive_property->set_edm_name( 'Taxcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IMPBRT' ).
    lo_primitive_property->set_edm_name( 'Impbrt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IMPIVA' ).
    lo_primitive_property->set_edm_name( 'Impiva' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IMPNET' ).
    lo_primitive_property->set_edm_name( 'Impnet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZUSER' ).
    lo_primitive_property->set_edm_name( 'Zuser' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICE_MM' ).
    lo_primitive_property->set_edm_name( 'InvoiceMm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'YEAR_MM' ).
    lo_primitive_property->set_edm_name( 'YearMm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICE_FI' ).
    lo_primitive_property->set_edm_name( 'InvoiceFi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'YEAR_FI' ).
    lo_primitive_property->set_edm_name( 'YearFi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERROR_FLAG' ).
    lo_primitive_property->set_edm_name( 'ErrorFlag' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MESSAGE' ).
    lo_primitive_property->set_edm_name( 'Message' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 220 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.
ENDCLASS.
