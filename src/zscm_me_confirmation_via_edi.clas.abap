"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>ZFM_ME_CONFIRMATION_VIA_EDI_SRV</em>
CLASS zscm_me_confirmation_via_edi DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">header</p>
      BEGIN OF tys_header,
        "! <em>Key property</em> DateTime
        date_time TYPE string,
      END OF tys_header,
      "! <p class="shorttext synchronized">List of header</p>
      tyt_header TYPE STANDARD TABLE OF tys_header WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">item</p>
      BEGIN OF tys_item,
        "! <em>Key property</em> DateTime
        date_time                  TYPE string,
        "! Rfbel
        rfbel                      TYPE c LENGTH 10,
        "! Rfpos
        rfpos                      TYPE c LENGTH 6,
        "! Mandt
        mandt                      TYPE c LENGTH 3,
        "! Vstel
        vstel                      TYPE c LENGTH 4,
        "! Vkorg
        vkorg                      TYPE c LENGTH 4,
        "! Vtweg
        vtweg                      TYPE c LENGTH 2,
        "! Spart
        spart                      TYPE c LENGTH 2,
        "! Lfart
        lfart                      TYPE c LENGTH 4,
        "! Dlvtp
        dlvtp                      TYPE c LENGTH 2,
        "! Auart
        auart                      TYPE c LENGTH 4,
        "! Kunwe
        kunwe                      TYPE c LENGTH 10,
        "! Matnr
        matnr                      TYPE c LENGTH 40,
        "! Werks
        werks                      TYPE c LENGTH 4,
        "! Berid
        berid                      TYPE c LENGTH 10,
        "! Datum
        datum                      TYPE timestampl,
        "! Uzeit
        uzeit                      TYPE timn,
        "! Datvw
        datvw                      TYPE c LENGTH 1,
        "! Mbdat
        mbdat                      TYPE timestampl,
        "! Mbuhr
        mbuhr                      TYPE timn,
        "! Tddat
        tddat                      TYPE timestampl,
        "! Tduhr
        tduhr                      TYPE timn,
        "! Lddat
        lddat                      TYPE timestampl,
        "! Lduhr
        lduhr                      TYPE timn,
        "! Wadat
        wadat                      TYPE timestampl,
        "! Wauhr
        wauhr                      TYPE timn,
        "! Lfdat
        lfdat                      TYPE timestampl,
        "! Lfuhr
        lfuhr                      TYPE timn,
        "! Lfimg
        lfimg                      TYPE p LENGTH 7 DECIMALS 3,
        "! Lgmng
        lgmng                      TYPE p LENGTH 7 DECIMALS 3,
        "! LfimgFlo
        lfimg_flo                  TYPE /iwbep/v4_float,
        "! LgmngFlo
        lgmng_flo                  TYPE /iwbep/v4_float,
        "! Umvkz
        umvkz                      TYPE p LENGTH 3 DECIMALS 0,
        "! Umvkn
        umvkn                      TYPE p LENGTH 3 DECIMALS 0,
        "! Umrev
        umrev                      TYPE /iwbep/v4_float,
        "! Akmng
        akmng                      TYPE c LENGTH 1,
        "! Vrkme
        vrkme                      TYPE c LENGTH 3,
        "! Meins
        meins                      TYPE c LENGTH 3,
        "! Kzfme
        kzfme                      TYPE c LENGTH 1,
        "! Kztlf
        kztlf                      TYPE c LENGTH 1,
        "! Vgsys
        vgsys                      TYPE c LENGTH 10,
        "! Vgbel
        vgbel                      TYPE c LENGTH 10,
        "! Vgpos
        vgpos                      TYPE c LENGTH 6,
        "! Vgtyp
        vgtyp                      TYPE c LENGTH 4,
        "! Rfvgtyp
        rfvgtyp                    TYPE c LENGTH 4,
        "! Anred
        anred                      TYPE c LENGTH 15,
        "! Name1
        name_1                     TYPE c LENGTH 35,
        "! Name2
        name_2                     TYPE c LENGTH 35,
        "! Name3
        name_3                     TYPE c LENGTH 35,
        "! Name4
        name_4                     TYPE c LENGTH 35,
        "! Stras
        stras                      TYPE c LENGTH 30,
        "! Land1
        land_1                     TYPE c LENGTH 3,
        "! Pstlz
        pstlz                      TYPE c LENGTH 10,
        "! Pstl2
        pstl_2                     TYPE c LENGTH 10,
        "! Ort01
        ort_01                     TYPE c LENGTH 35,
        "! Ort02
        ort_02                     TYPE c LENGTH 35,
        "! Regio
        regio                      TYPE c LENGTH 3,
        "! Pfach
        pfach                      TYPE c LENGTH 10,
        "! Telf1
        telf_1                     TYPE c LENGTH 16,
        "! Spras
        spras                      TYPE c LENGTH 2,
        "! Lzone
        lzone                      TYPE c LENGTH 10,
        "! Commn
        commn                      TYPE c LENGTH 5,
        "! Verursys
        verursys                   TYPE c LENGTH 10,
        "! Verur
        verur                      TYPE c LENGTH 35,
        "! Vupos
        vupos                      TYPE c LENGTH 6,
        "! Spdnr
        spdnr                      TYPE c LENGTH 10,
        "! Kunag
        kunag                      TYPE c LENGTH 10,
        "! Autlf
        autlf                      TYPE abap_bool,
        "! Ablad
        ablad                      TYPE c LENGTH 25,
        "! Kzazu
        kzazu                      TYPE abap_bool,
        "! Inco1
        inco_1                     TYPE c LENGTH 3,
        "! Inco2
        inco_2                     TYPE c LENGTH 28,
        "! Route
        route                      TYPE c LENGTH 6,
        "! Lprio
        lprio                      TYPE c LENGTH 2,
        "! Vsbed
        vsbed                      TYPE c LENGTH 2,
        "! Lgort
        lgort                      TYPE c LENGTH 4,
        "! Charg
        charg                      TYPE c LENGTH 10,
        "! Bwtar
        bwtar                      TYPE c LENGTH 10,
        "! Lichn
        lichn                      TYPE c LENGTH 15,
        "! Aktnr
        aktnr                      TYPE c LENGTH 10,
        "! Kdmat
        kdmat                      TYPE c LENGTH 35,
        "! Arktx
        arktx                      TYPE c LENGTH 40,
        "! Aeskd
        aeskd                      TYPE c LENGTH 17,
        "! Posar
        posar                      TYPE c LENGTH 1,
        "! Uebtk
        uebtk                      TYPE abap_bool,
        "! Uebto
        uebto                      TYPE p LENGTH 2 DECIMALS 1,
        "! Untto
        untto                      TYPE p LENGTH 2 DECIMALS 1,
        "! Antlf
        antlf                      TYPE p LENGTH 1 DECIMALS 0,
        "! Chspl
        chspl                      TYPE abap_bool,
        "! Faksp
        faksp                      TYPE c LENGTH 2,
        "! Uepos
        uepos                      TYPE c LENGTH 6,
        "! Vkbur
        vkbur                      TYPE c LENGTH 4,
        "! Vkgrp
        vkgrp                      TYPE c LENGTH 3,
        "! Sobkz
        sobkz                      TYPE c LENGTH 1,
        "! Gsber
        gsber                      TYPE c LENGTH 4,
        "! Pargb
        pargb                      TYPE c LENGTH 4,
        "! Kostl
        kostl                      TYPE c LENGTH 10,
        "! Kokrs
        kokrs                      TYPE c LENGTH 4,
        "! Prctr
        prctr                      TYPE c LENGTH 10,
        "! Pprctr
        pprctr                     TYPE c LENGTH 10,
        "! Paobjnr
        paobjnr                    TYPE c LENGTH 10,
        "! Fipos
        fipos                      TYPE c LENGTH 24,
        "! Fistl
        fistl                      TYPE c LENGTH 16,
        "! Geber
        geber                      TYPE c LENGTH 10,
        "! GrantNbr
        grant_nbr                  TYPE c LENGTH 20,
        "! Fkber
        fkber                      TYPE c LENGTH 16,
        "! Aufnr
        aufnr                      TYPE c LENGTH 12,
        "! Aufpl
        aufpl                      TYPE c LENGTH 10,
        "! Aplzl
        aplzl                      TYPE c LENGTH 8,
        "! PosnrPp
        posnr_pp                   TYPE c LENGTH 4,
        "! Kdauf
        kdauf                      TYPE c LENGTH 10,
        "! Kdpos
        kdpos                      TYPE c LENGTH 6,
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
        "! Exnum
        exnum                      TYPE c LENGTH 10,
        "! Lifnr
        lifnr                      TYPE c LENGTH 10,
        "! Bolnr
        bolnr                      TYPE c LENGTH 35,
        "! Traty
        traty                      TYPE c LENGTH 4,
        "! Traid
        traid                      TYPE c LENGTH 20,
        "! Ean11
        ean_11                     TYPE c LENGTH 18,
        "! BukrsBest
        bukrs_best                 TYPE c LENGTH 4,
        "! Empst
        empst                      TYPE c LENGTH 25,
        "! Ltssf
        ltssf                      TYPE c LENGTH 5,
        "! Vbeln
        vbeln                      TYPE c LENGTH 10,
        "! Posnr
        posnr                      TYPE c LENGTH 6,
        "! Abeln
        abeln                      TYPE c LENGTH 10,
        "! Abelp
        abelp                      TYPE c LENGTH 5,
        "! Lfnum
        lfnum                      TYPE c LENGTH 6,
        "! Lifex
        lifex                      TYPE c LENGTH 35,
        "! Lifexpos
        lifexpos                   TYPE c LENGTH 6,
        "! Mfrgr
        mfrgr                      TYPE c LENGTH 8,
        "! Aurel
        aurel                      TYPE c LENGTH 1,
        "! Matkl
        matkl                      TYPE c LENGTH 9,
        "! Idnlf
        idnlf                      TYPE c LENGTH 35,
        "! Grkor
        grkor                      TYPE c LENGTH 3,
        "! Kmpmg
        kmpmg                      TYPE p LENGTH 7 DECIMALS 3,
        "! Uml1s
        uml_1_s                    TYPE abap_bool,
        "! Ewerk
        ewerk                      TYPE c LENGTH 4,
        "! Kzbew
        kzbew                      TYPE c LENGTH 1,
        "! Lifsk
        lifsk                      TYPE c LENGTH 2,
        "! Rsart
        rsart                      TYPE c LENGTH 1,
        "! Rsnum
        rsnum                      TYPE c LENGTH 10,
        "! Rspos
        rspos                      TYPE c LENGTH 4,
        "! Situa
        situa                      TYPE c LENGTH 2,
        "! AdrnrWe
        adrnr_we                   TYPE c LENGTH 10,
        "! AdrdaWe
        adrda_we                   TYPE c LENGTH 1,
        "! Ettyp
        ettyp                      TYPE c LENGTH 2,
        "! Bwart
        bwart                      TYPE c LENGTH 3,
        "! Pspnr
        pspnr                      TYPE c LENGTH 24,
        "! Mprof
        mprof                      TYPE c LENGTH 4,
        "! Ematn
        ematn                      TYPE c LENGTH 40,
        "! Mfrnr
        mfrnr                      TYPE c LENGTH 10,
        "! Mfrpn
        mfrpn                      TYPE c LENGTH 40,
        "! Emnfr
        emnfr                      TYPE c LENGTH 10,
        "! Kzvbr
        kzvbr                      TYPE c LENGTH 1,
        "! Knttp
        knttp                      TYPE c LENGTH 1,
        "! PsPspPnr
        ps_psp_pnr                 TYPE c LENGTH 24,
        "! Vbelv
        vbelv                      TYPE c LENGTH 10,
        "! Posnv
        posnv                      TYPE c LENGTH 6,
        "! Cuobj
        cuobj                      TYPE c LENGTH 18,
        "! Vbtyv
        vbtyv                      TYPE c LENGTH 4,
        "! Noatp
        noatp                      TYPE c LENGTH 1,
        "! Nopck
        nopck                      TYPE abap_bool,
        "! Aulwe
        aulwe                      TYPE c LENGTH 10,
        "! Lgnum
        lgnum                      TYPE c LENGTH 3,
        "! Lgtyp
        lgtyp                      TYPE c LENGTH 3,
        "! Lgpla
        lgpla                      TYPE c LENGTH 10,
        "! Kzdlg
        kzdlg                      TYPE abap_bool,
        "! Flgwm
        flgwm                      TYPE c LENGTH 1,
        "! Bwlvs
        bwlvs                      TYPE c LENGTH 3,
        "! Nowab
        nowab                      TYPE c LENGTH 1,
        "! Prvbe
        prvbe                      TYPE c LENGTH 10,
        "! Berkz
        berkz                      TYPE c LENGTH 1,
        "! Kzech
        kzech                      TYPE c LENGTH 1,
        "! Rblvs
        rblvs                      TYPE c LENGTH 3,
        "! Bestq
        bestq                      TYPE c LENGTH 1,
        "! Umbsq
        umbsq                      TYPE c LENGTH 1,
        "! ShkzgUm
        shkzg_um                   TYPE c LENGTH 1,
        "! Ummat
        ummat                      TYPE c LENGTH 40,
        "! Umwrk
        umwrk                      TYPE c LENGTH 4,
        "! Umlgo
        umlgo                      TYPE c LENGTH 4,
        "! Umbar
        umbar                      TYPE c LENGTH 10,
        "! Umcha
        umcha                      TYPE c LENGTH 10,
        "! Umsok
        umsok                      TYPE c LENGTH 1,
        "! Sonum
        sonum                      TYPE c LENGTH 16,
        "! Usonu
        usonu                      TYPE c LENGTH 16,
        "! Shkzg
        shkzg                      TYPE c LENGTH 1,
        "! ResourceId
        resource_id                TYPE c LENGTH 40,
        "! UmresourceId
        umresource_id              TYPE c LENGTH 40,
        "! Xchar
        xchar                      TYPE abap_bool,
        "! Xchpf
        xchpf                      TYPE abap_bool,
        "! Uecha
        uecha                      TYPE c LENGTH 6,
        "! Dirta
        dirta                      TYPE abap_bool,
        "! Kcmeng
        kcmeng                     TYPE p LENGTH 8 DECIMALS 3,
        "! KcmengFlo
        kcmeng_flo                 TYPE /iwbep/v4_float,
        "! Kcbrgew
        kcbrgew                    TYPE p LENGTH 8 DECIMALS 3,
        "! Kcntgew
        kcntgew                    TYPE p LENGTH 8 DECIMALS 3,
        "! Kcvolum
        kcvolum                    TYPE p LENGTH 8 DECIMALS 3,
        "! Kcgewei
        kcgewei                    TYPE c LENGTH 3,
        "! Kcvoleh
        kcvoleh                    TYPE c LENGTH 3,
        "! Kcmengvme
        kcmengvme                  TYPE p LENGTH 8 DECIMALS 3,
        "! Kcmengvmef
        kcmengvmef                 TYPE /iwbep/v4_float,
        "! Kzwab
        kzwab                      TYPE c LENGTH 1,
        "! Kzerz
        kzerz                      TYPE c LENGTH 1,
        "! Chhpv
        chhpv                      TYPE abap_bool,
        "! Insmk
        insmk                      TYPE c LENGTH 1,
        "! Kannr
        kannr                      TYPE c LENGTH 35,
        "! WadatIst
        wadat_ist                  TYPE timestampl,
        "! Mtart
        mtart                      TYPE c LENGTH 4,
        "! Magrv
        magrv                      TYPE c LENGTH 4,
        "! Prodh
        prodh                      TYPE c LENGTH 18,
        "! Tragr
        tragr                      TYPE c LENGTH 4,
        "! Ladgr
        ladgr                      TYPE c LENGTH 4,
        "! Lfgja
        lfgja                      TYPE c LENGTH 4,
        "! Lfbnr
        lfbnr                      TYPE c LENGTH 10,
        "! Lfpos
        lfpos                      TYPE c LENGTH 4,
        "! Grund
        grund                      TYPE c LENGTH 4,
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
        "! Konto
        konto                      TYPE c LENGTH 10,
        "! Kzear
        kzear                      TYPE abap_bool,
        "! Vfdat
        vfdat                      TYPE timestampl,
        "! Hsdat
        hsdat                      TYPE timestampl,
        "! Xabln
        xabln                      TYPE c LENGTH 10,
        "! Bldat
        bldat                      TYPE timestampl,
        "! Folar
        folar                      TYPE c LENGTH 4,
        "! Qplos
        qplos                      TYPE c LENGTH 12,
        "! Fobwa
        fobwa                      TYPE c LENGTH 3,
        "! FoDlvtp
        fo_dlvtp                   TYPE c LENGTH 2,
        "! Kzuml
        kzuml                      TYPE abap_bool,
        "! Exbwr
        exbwr                      TYPE p LENGTH 8 DECIMALS 3,
        "! Bpmng
        bpmng                      TYPE p LENGTH 7 DECIMALS 3,
        "! Exvkw
        exvkw                      TYPE p LENGTH 8 DECIMALS 3,
        "! Vwpos
        vwpos                      TYPE c LENGTH 4,
        "! Uepvw
        uepvw                      TYPE c LENGTH 1,
        "! WmsVsmngFlo
        wms_vsmng_flo              TYPE /iwbep/v4_float,
        "! WmsLsmengFlo
        wms_lsmeng_flo             TYPE /iwbep/v4_float,
        "! Panum
        panum                      TYPE int4,
        "! QuanNoCheck
        quan_no_check              TYPE c LENGTH 1,
        "! CombCrit
        comb_crit                  TYPE c LENGTH 10,
        "! Podrel
        podrel                     TYPE c LENGTH 1,
        "! Id
        id                         TYPE int4,
        "! Vbobj
        vbobj                      TYPE c LENGTH 1,
        "! Tarag
        tarag                      TYPE p LENGTH 8 DECIMALS 3,
        "! Tavol
        tavol                      TYPE p LENGTH 8 DECIMALS 3,
        "! Pstyv
        pstyv                      TYPE c LENGTH 4,
        "! Bdart
        bdart                      TYPE c LENGTH 2,
        "! NorndLp
        nornd_lp                   TYPE c LENGTH 1,
        "! Plart
        plart                      TYPE c LENGTH 1,
        "! PostabTabix
        postab_tabix               TYPE int4,
        "! Sernr
        sernr                      TYPE c LENGTH 8,
        "! Kdgrp
        kdgrp                      TYPE c LENGTH 2,
        "! Abtnr
        abtnr                      TYPE c LENGTH 4,
        "! Bkgrp
        bkgrp                      TYPE c LENGTH 3,
        "! NoMoreDeliveries
        no_more_deliveries         TYPE abap_bool,
        "! Trmtyp
        trmtyp                     TYPE c LENGTH 40,
        "! AnzPosGrkor
        anz_pos_grkor              TYPE int4,
        "! Bzirk
        bzirk                      TYPE c LENGTH 6,
        "! Etens
        etens                      TYPE c LENGTH 4,
        "! Kzbws
        kzbws                      TYPE c LENGTH 1,
        "! Lstel
        lstel                      TYPE c LENGTH 2,
        "! Berot
        berot                      TYPE c LENGTH 20,
        "! Kodat
        kodat                      TYPE timestampl,
        "! Kouhr
        kouhr                      TYPE timn,
        "! Matwa
        matwa                      TYPE c LENGTH 40,
        "! Gmcontrol
        gmcontrol                  TYPE c LENGTH 1,
        "! PostingChange
        posting_change             TYPE c LENGTH 1,
        "! UmPsPspPnr
        um_ps_psp_pnr              TYPE c LENGTH 24,
        "! Anzpk
        anzpk                      TYPE c LENGTH 5,
        "! NoBilling
        no_billing                 TYPE abap_bool,
        "! PreVlEtens
        pre_vl_etens               TYPE c LENGTH 4,
        "! AdrnrLi
        adrnr_li                   TYPE c LENGTH 10,
        "! SpeLeScenario
        spe_le_scenario            TYPE c LENGTH 1,
        "! SpeErnam
        spe_ernam                  TYPE c LENGTH 12,
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
        "! SpeAtpTmstmp
        spe_atp_tmstmp             TYPE timestamp,
        "! SpeRelTmstmp
        spe_rel_tmstmp             TYPE timestamp,
        "! SpeTtype
        spe_ttype                  TYPE c LENGTH 10,
        "! SpeInitiatorProcess
        spe_initiator_process      TYPE c LENGTH 3,
        "! SpeUnitSystem
        spe_unit_system            TYPE c LENGTH 10,
        "! SpeCurrency
        spe_currency               TYPE c LENGTH 5,
        "! SpeInvBfrGi
        spe_inv_bfr_gi             TYPE c LENGTH 1,
        "! SpeOrigSys
        spe_orig_sys               TYPE c LENGTH 1,
        "! SpeOrigSysPos
        spe_orig_sys_pos           TYPE c LENGTH 1,
        "! SpeLieffz
        spe_lieffz                 TYPE p LENGTH 8 DECIMALS 3,
        "! SpeExceptCode
        spe_except_code            TYPE c LENGTH 4,
        "! SpeChngSys
        spe_chng_sys               TYPE c LENGTH 1,
        "! SpeLifexpos2
        spe_lifexpos_2             TYPE c LENGTH 35,
        "! SpePosnr
        spe_posnr                  TYPE c LENGTH 6,
        "! SpeLocSeq
        spe_loc_seq                TYPE c LENGTH 3,
        "! SpeAccAppSts
        spe_acc_app_sts            TYPE c LENGTH 1,
        "! SpeShpInfSts
        spe_shp_inf_sts            TYPE c LENGTH 1,
        "! SpeAuthNumber
        spe_auth_number            TYPE c LENGTH 20,
        "! SpeFollowUp
        spe_follow_up              TYPE c LENGTH 4,
        "! SpeExpDateExtB
        spe_exp_date_ext_b         TYPE timestamp,
        "! SpeExpDateExt
        spe_exp_date_ext           TYPE timestamp,
        "! SpeExpDateInt
        spe_exp_date_int           TYPE timestamp,
        "! SpeInspoutGuid
        spe_inspout_guid           TYPE c LENGTH 32,
        "! SpeScrapInd
        spe_scrap_ind              TYPE c LENGTH 1,
        "! SpeKeepQty
        spe_keep_qty               TYPE p LENGTH 7 DECIMALS 3,
        "! Lgpbe
        lgpbe                      TYPE c LENGTH 10,
        "! BorgrLgtor
        borgr_lgtor                TYPE c LENGTH 3,
        "! BorgrLgbzo
        borgr_lgbzo                TYPE c LENGTH 10,
        "! Imwrk
        imwrk                      TYPE abap_bool,
        "! ImwrkItm
        imwrk_itm                  TYPE abap_bool,
        "! Abrvw
        abrvw                      TYPE c LENGTH 3,
        "! RVbeln
        rvbeln                     TYPE c LENGTH 10,
        "! RVbelp
        rvbelp                     TYPE c LENGTH 6,
        "! Kbnkz
        kbnkz                      TYPE c LENGTH 1,
        "! Fkrel
        fkrel                      TYPE c LENGTH 1,
        "! ProcessHoldItem
        process_hold_item          TYPE c LENGTH 1,
        "! SpeAlternate
        spe_alternate              TYPE c LENGTH 40,
        "! SpeCdProcess
        spe_cd_process             TYPE c LENGTH 10,
        "! SpeCdPlant
        spe_cd_plant               TYPE c LENGTH 4,
        "! SpeMatSubst
        spe_mat_subst              TYPE c LENGTH 1,
        "! SpeLifexType
        spe_lifex_type             TYPE c LENGTH 1,
        "! SpeAnzPosStruc
        spe_anz_pos_struc          TYPE int4,
        "! SpeStruc
        spe_struc                  TYPE c LENGTH 3,
        "! SpeApoQntyfac
        spe_apo_qntyfac            TYPE p LENGTH 3 DECIMALS 0,
        "! SpeApoQntydiv
        spe_apo_qntydiv            TYPE p LENGTH 3 DECIMALS 0,
        "! SpeProNumber
        spe_pro_number             TYPE c LENGTH 35,
        "! SpeRedInd
        spe_red_ind                TYPE c LENGTH 1,
        "! Vornu
        vornu                      TYPE c LENGTH 25,
        "! Vorpa
        vorpa                      TYPE c LENGTH 10,
        "! Expvz
        expvz                      TYPE c LENGTH 1,
        "! SpeHerkl
        spe_herkl                  TYPE c LENGTH 3,
        "! SpeHerkr
        spe_herkr                  TYPE c LENGTH 3,
        "! Wempf
        wempf                      TYPE c LENGTH 12,
        "! Vornr
        vornr                      TYPE c LENGTH 4,
        "! RecipientLocationCode
        recipient_location_code    TYPE c LENGTH 15,
        "! Bstnr
        bstnr                      TYPE c LENGTH 35,
        "! Bstdt
        bstdt                      TYPE timestampl,
        "! BstdkE
        bstdk_e                    TYPE timestampl,
        "! BstkdE
        bstkd_e                    TYPE c LENGTH 35,
        "! SpeShipComp
        spe_ship_comp              TYPE abap_bool,
        "! SnFromTab
        sn_from_tab                TYPE abap_bool,
        "! ItemHandle
        item_handle                TYPE sysuuid_x16,
        "! Trspg
        trspg                      TYPE c LENGTH 2,
        "! LocGuid
        loc_guid                   TYPE sysuuid_x16,
        "! Statu
        statu                      TYPE c LENGTH 1,
        "! CopyWeivolHdr
        copy_weivol_hdr            TYPE abap_bool,
        "! CopyWeivolItm
        copy_weivol_itm            TYPE abap_bool,
        "! NtgewHdr
        ntgew_hdr                  TYPE p LENGTH 8 DECIMALS 3,
        "! BrgewHdr
        brgew_hdr                  TYPE p LENGTH 8 DECIMALS 3,
        "! GeweiHdr
        gewei_hdr                  TYPE c LENGTH 3,
        "! VolumHdr
        volum_hdr                  TYPE p LENGTH 8 DECIMALS 3,
        "! VolehHdr
        voleh_hdr                  TYPE c LENGTH 3,
        "! MsrActive
        msr_active                 TYPE c LENGTH 1,
        "! UcKunnr
        uc_kunnr                   TYPE c LENGTH 10,
        "! BudgetPd
        budget_pd                  TYPE c LENGTH 10,
        "! Prtnr
        prtnr                      TYPE c LENGTH 10,
        "! TmCtrlKey
        tm_ctrl_key                TYPE c LENGTH 4,
        "! ExtTransportId
        ext_transport_id           TYPE c LENGTH 5,
        "! MsrValuation
        msr_valuation              TYPE abap_bool,
        "! Upflu
        upflu                      TYPE c LENGTH 1,
        "! AdrdaLi
        adrda_li                   TYPE c LENGTH 1,
        "! Handoverloc
        handoverloc                TYPE c LENGTH 10,
        "! Handoverdate
        handoverdate               TYPE timestampl,
        "! Handovertime
        handovertime               TYPE timn,
        "! Handovertzone
        handovertzone              TYPE c LENGTH 6,
        "! J1bcfop
        j_1_bcfop                  TYPE c LENGTH 10,
        "! J1btaxlw1
        j_1_btaxlw_1               TYPE c LENGTH 3,
        "! J1btaxlw2
        j_1_btaxlw_2               TYPE c LENGTH 3,
        "! J1btaxlw3
        j_1_btaxlw_3               TYPE c LENGTH 3,
        "! J1btaxlw4
        j_1_btaxlw_4               TYPE c LENGTH 3,
        "! J1btaxlw5
        j_1_btaxlw_5               TYPE c LENGTH 3,
        "! SgtScat
        sgt_scat                   TYPE c LENGTH 40,
        "! SgtRcat
        sgt_rcat                   TYPE c LENGTH 40,
        "! LoadingPoint
        loading_point              TYPE c LENGTH 20,
        "! TmWhseExec
        tm_whse_exec               TYPE c LENGTH 1,
        "! Inco2Key
        inco_2_key                 TYPE sysuuid_x16,
        "! Inco3Key
        inco_3_key                 TYPE sysuuid_x16,
        "! Inco4Key
        inco_4_key                 TYPE sysuuid_x16,
        "! Incov
        incov                      TYPE c LENGTH 4,
        "! Inco2L
        inco_2_l                   TYPE c LENGTH 70,
        "! Inco3L
        inco_3_l                   TYPE c LENGTH 70,
        "! Vsart
        vsart                      TYPE c LENGTH 2,
        "! ExtRetdlvVbeln
        ext_retdlv_vbeln           TYPE c LENGTH 10,
        "! ExtRetdlvPosnr
        ext_retdlv_posnr           TYPE c LENGTH 6,
        "! DummyDeliveryInclEewPs
        dummy_delivery_incl_eew_ps TYPE c LENGTH 1,
        "! DummyDeliveryInclEewTr
        dummy_delivery_incl_eew_tr TYPE c LENGTH 1,
        "! DummyDelitmInclEewPs
        dummy_delitm_incl_eew_ps   TYPE c LENGTH 1,
        "! DummyDeliveryitemInclEewTr
        dummy_deliveryitem_incl_ee TYPE c LENGTH 1,
        "! ExtensionFieldsMerged
        extension_fields_merged    TYPE abap_bool,
        "! Pcsta
        pcsta                      TYPE c LENGTH 1,
        "! Dgsta
        dgsta                      TYPE c LENGTH 1,
        "! Sdssta
        sdssta                     TYPE c LENGTH 1,
        "! VcmChainUuid
        vcm_chain_uuid             TYPE sysuuid_x16,
        "! VcmChainCategory
        vcm_chain_category         TYPE c LENGTH 4,
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
        "! Trsta
        trsta                      TYPE c LENGTH 1,
        "! KzItmEmcst
        kz_itm_emcst               TYPE abap_bool,
        "! ItmEmcst
        itm_emcst                  TYPE c LENGTH 1,
        "! KzItmSlcst
        kz_itm_slcst               TYPE abap_bool,
        "! ItmSlcst
        itm_slcst                  TYPE c LENGTH 1,
        "! KzItmLccst
        kz_itm_lccst               TYPE abap_bool,
        "! ItmLccst
        itm_lccst                  TYPE c LENGTH 1,
        "! LglcLicInd
        lglc_lic_ind               TYPE c LENGTH 1,
        "! CorrInd
        corr_ind                   TYPE c LENGTH 1,
        "! Zgtyp
        zgtyp                      TYPE c LENGTH 4,
        "! cwmLfimg
        cwm_lfimg                  TYPE p LENGTH 7 DECIMALS 3,
        "! cwmLfime
        cwm_lfime                  TYPE c LENGTH 3,
        "! cwmLfimeIso
        cwm_lfime_iso              TYPE c LENGTH 3,
        "! cwmPikmg
        cwm_pikmg                  TYPE p LENGTH 7 DECIMALS 3,
        "! cwmPikme
        cwm_pikme                  TYPE c LENGTH 3,
        "! cwmPpikmeIso
        cwm_ppikme_iso             TYPE c LENGTH 3,
        "! cwmXenter
        cwm_xenter                 TYPE abap_bool,
        "! cwmXtaenter
        cwm_xtaenter               TYPE abap_bool,
        "! cwmKcmeng
        cwm_kcmeng                 TYPE p LENGTH 8 DECIMALS 3,
        "! BorgrGrp
        borgr_grp                  TYPE c LENGTH 35,
        "! BorgrPstyv
        borgr_pstyv                TYPE c LENGTH 4,
        "! FshSeasonYear
        fsh_season_year            TYPE c LENGTH 4,
        "! FshSeason
        fsh_season                 TYPE c LENGTH 10,
        "! FshCollection
        fsh_collection             TYPE c LENGTH 10,
        "! FshTheme
        fsh_theme                  TYPE c LENGTH 10,
        "! FshVasCg
        fsh_vas_cg                 TYPE c LENGTH 3,
        "! FshVasRel
        fsh_vas_rel                TYPE c LENGTH 1,
        "! FshVasPrntId
        fsh_vas_prnt_id            TYPE c LENGTH 6,
        "! FshTransaction
        fsh_transaction            TYPE c LENGTH 10,
        "! FshItemGroup
        fsh_item_group             TYPE c LENGTH 5,
        "! FshItem
        fsh_item                   TYPE c LENGTH 5,
        "! FshRsnum
        fsh_rsnum                  TYPE c LENGTH 10,
        "! FshRspos
        fsh_rspos                  TYPE c LENGTH 4,
        "! FshPsmPfmSplit
        fsh_psm_pfm_split          TYPE c LENGTH 15,
        "! RfmPsstGroup
        rfm_psst_group             TYPE c LENGTH 10,
        "! Llief
        llief                      TYPE c LENGTH 10,
        "! ConsOrder
        cons_order                 TYPE c LENGTH 1,
      END OF tys_item,
      "! <p class="shorttext synchronized">List of item</p>
      tyt_item TYPE STANDARD TABLE OF tys_item WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">return</p>
      BEGIN OF tys_return,
        "! <em>Key property</em> Ebeln
        ebeln  TYPE c LENGTH 10,
        "! <em>Key property</em> Ebelp
        ebelp  TYPE c LENGTH 5,
        "! <em>Key property</em> Msgid
        msgid  TYPE c LENGTH 20,
        "! <em>Key property</em> Msgno
        msgno  TYPE c LENGTH 3,
        "! <em>Key property</em> Msgty
        msgty  TYPE c LENGTH 1,
        "! Msgv1
        msgv_1 TYPE c LENGTH 50,
        "! Msgv2
        msgv_2 TYPE c LENGTH 50,
        "! Msgv3
        msgv_3 TYPE c LENGTH 50,
        "! Msgv4
        msgv_4 TYPE c LENGTH 50,
      END OF tys_return,
      "! <p class="shorttext synchronized">List of return</p>
      tyt_return TYPE STANDARD TABLE OF tys_return WITH DEFAULT KEY.

    TYPES: BEGIN OF ty_deep,
             date_time      TYPE string,
             headertoitem   TYPE TABLE OF tys_item WITH DEFAULT KEY,
             headertoreturn TYPE TABLE OF tys_return WITH DEFAULT KEY,
           END OF ty_deep.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! headerSet
        "! <br/> Collection of type 'header'
        header_set TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'HEADER_SET',
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
            "! HEADERTOITEM
            headertoitem   TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOITEM',
            "! HEADERTORETURN
            headertoreturn TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTORETURN',
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

    "! <p class="shorttext synchronized">Define return</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_return RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSCM_ME_CONFIRMATION_VIA_EDI IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'ZFM_ME_CONFIRMATION_VIA_EDI_SRV' ) ##NO_TEXT.

    def_header( ).
    def_item( ).
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


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOITEM' ).
    lo_navigation_property->set_edm_name( 'HEADERTOITEM' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'ITEM' ).
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


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFBEL' ).
    lo_primitive_property->set_edm_name( 'Rfbel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFPOS' ).
    lo_primitive_property->set_edm_name( 'Rfpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MANDT' ).
    lo_primitive_property->set_edm_name( 'Mandt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSTEL' ).
    lo_primitive_property->set_edm_name( 'Vstel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VKORG' ).
    lo_primitive_property->set_edm_name( 'Vkorg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VTWEG' ).
    lo_primitive_property->set_edm_name( 'Vtweg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPART' ).
    lo_primitive_property->set_edm_name( 'Spart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFART' ).
    lo_primitive_property->set_edm_name( 'Lfart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DLVTP' ).
    lo_primitive_property->set_edm_name( 'Dlvtp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUART' ).
    lo_primitive_property->set_edm_name( 'Auart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUNWE' ).
    lo_primitive_property->set_edm_name( 'Kunwe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATNR' ).
    lo_primitive_property->set_edm_name( 'Matnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WERKS' ).
    lo_primitive_property->set_edm_name( 'Werks' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BERID' ).
    lo_primitive_property->set_edm_name( 'Berid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATUM' ).
    lo_primitive_property->set_edm_name( 'Datum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UZEIT' ).
    lo_primitive_property->set_edm_name( 'Uzeit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATVW' ).
    lo_primitive_property->set_edm_name( 'Datvw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MBDAT' ).
    lo_primitive_property->set_edm_name( 'Mbdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MBUHR' ).
    lo_primitive_property->set_edm_name( 'Mbuhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TDDAT' ).
    lo_primitive_property->set_edm_name( 'Tddat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TDUHR' ).
    lo_primitive_property->set_edm_name( 'Tduhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LDDAT' ).
    lo_primitive_property->set_edm_name( 'Lddat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LDUHR' ).
    lo_primitive_property->set_edm_name( 'Lduhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WADAT' ).
    lo_primitive_property->set_edm_name( 'Wadat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WAUHR' ).
    lo_primitive_property->set_edm_name( 'Wauhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFDAT' ).
    lo_primitive_property->set_edm_name( 'Lfdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFUHR' ).
    lo_primitive_property->set_edm_name( 'Lfuhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFIMG' ).
    lo_primitive_property->set_edm_name( 'Lfimg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGMNG' ).
    lo_primitive_property->set_edm_name( 'Lgmng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFIMG_FLO' ).
    lo_primitive_property->set_edm_name( 'LfimgFlo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGMNG_FLO' ).
    lo_primitive_property->set_edm_name( 'LgmngFlo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMVKZ' ).
    lo_primitive_property->set_edm_name( 'Umvkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMVKN' ).
    lo_primitive_property->set_edm_name( 'Umvkn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMREV' ).
    lo_primitive_property->set_edm_name( 'Umrev' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AKMNG' ).
    lo_primitive_property->set_edm_name( 'Akmng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VRKME' ).
    lo_primitive_property->set_edm_name( 'Vrkme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MEINS' ).
    lo_primitive_property->set_edm_name( 'Meins' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZFME' ).
    lo_primitive_property->set_edm_name( 'Kzfme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZTLF' ).
    lo_primitive_property->set_edm_name( 'Kztlf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGSYS' ).
    lo_primitive_property->set_edm_name( 'Vgsys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGBEL' ).
    lo_primitive_property->set_edm_name( 'Vgbel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGPOS' ).
    lo_primitive_property->set_edm_name( 'Vgpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VGTYP' ).
    lo_primitive_property->set_edm_name( 'Vgtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFVGTYP' ).
    lo_primitive_property->set_edm_name( 'Rfvgtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANRED' ).
    lo_primitive_property->set_edm_name( 'Anred' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_1' ).
    lo_primitive_property->set_edm_name( 'Name1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_2' ).
    lo_primitive_property->set_edm_name( 'Name2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_3' ).
    lo_primitive_property->set_edm_name( 'Name3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAME_4' ).
    lo_primitive_property->set_edm_name( 'Name4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STRAS' ).
    lo_primitive_property->set_edm_name( 'Stras' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAND_1' ).
    lo_primitive_property->set_edm_name( 'Land1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSTLZ' ).
    lo_primitive_property->set_edm_name( 'Pstlz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSTL_2' ).
    lo_primitive_property->set_edm_name( 'Pstl2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORT_01' ).
    lo_primitive_property->set_edm_name( 'Ort01' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORT_02' ).
    lo_primitive_property->set_edm_name( 'Ort02' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REGIO' ).
    lo_primitive_property->set_edm_name( 'Regio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PFACH' ).
    lo_primitive_property->set_edm_name( 'Pfach' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TELF_1' ).
    lo_primitive_property->set_edm_name( 'Telf1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPRAS' ).
    lo_primitive_property->set_edm_name( 'Spras' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LZONE' ).
    lo_primitive_property->set_edm_name( 'Lzone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMMN' ).
    lo_primitive_property->set_edm_name( 'Commn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VERURSYS' ).
    lo_primitive_property->set_edm_name( 'Verursys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VERUR' ).
    lo_primitive_property->set_edm_name( 'Verur' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VUPOS' ).
    lo_primitive_property->set_edm_name( 'Vupos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPDNR' ).
    lo_primitive_property->set_edm_name( 'Spdnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KUNAG' ).
    lo_primitive_property->set_edm_name( 'Kunag' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUTLF' ).
    lo_primitive_property->set_edm_name( 'Autlf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABLAD' ).
    lo_primitive_property->set_edm_name( 'Ablad' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZAZU' ).
    lo_primitive_property->set_edm_name( 'Kzazu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_1' ).
    lo_primitive_property->set_edm_name( 'Inco1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_2' ).
    lo_primitive_property->set_edm_name( 'Inco2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 28 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROUTE' ).
    lo_primitive_property->set_edm_name( 'Route' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LPRIO' ).
    lo_primitive_property->set_edm_name( 'Lprio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSBED' ).
    lo_primitive_property->set_edm_name( 'Vsbed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGORT' ).
    lo_primitive_property->set_edm_name( 'Lgort' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHARG' ).
    lo_primitive_property->set_edm_name( 'Charg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BWTAR' ).
    lo_primitive_property->set_edm_name( 'Bwtar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LICHN' ).
    lo_primitive_property->set_edm_name( 'Lichn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AKTNR' ).
    lo_primitive_property->set_edm_name( 'Aktnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KDMAT' ).
    lo_primitive_property->set_edm_name( 'Kdmat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARKTX' ).
    lo_primitive_property->set_edm_name( 'Arktx' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AESKD' ).
    lo_primitive_property->set_edm_name( 'Aeskd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 17 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSAR' ).
    lo_primitive_property->set_edm_name( 'Posar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UEBTK' ).
    lo_primitive_property->set_edm_name( 'Uebtk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UEBTO' ).
    lo_primitive_property->set_edm_name( 'Uebto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNTTO' ).
    lo_primitive_property->set_edm_name( 'Untto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANTLF' ).
    lo_primitive_property->set_edm_name( 'Antlf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHSPL' ).
    lo_primitive_property->set_edm_name( 'Chspl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAKSP' ).
    lo_primitive_property->set_edm_name( 'Faksp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UEPOS' ).
    lo_primitive_property->set_edm_name( 'Uepos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VKBUR' ).
    lo_primitive_property->set_edm_name( 'Vkbur' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VKGRP' ).
    lo_primitive_property->set_edm_name( 'Vkgrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SOBKZ' ).
    lo_primitive_property->set_edm_name( 'Sobkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GSBER' ).
    lo_primitive_property->set_edm_name( 'Gsber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARGB' ).
    lo_primitive_property->set_edm_name( 'Pargb' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOSTL' ).
    lo_primitive_property->set_edm_name( 'Kostl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOKRS' ).
    lo_primitive_property->set_edm_name( 'Kokrs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRCTR' ).
    lo_primitive_property->set_edm_name( 'Prctr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PPRCTR' ).
    lo_primitive_property->set_edm_name( 'Pprctr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAOBJNR' ).
    lo_primitive_property->set_edm_name( 'Paobjnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIPOS' ).
    lo_primitive_property->set_edm_name( 'Fipos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISTL' ).
    lo_primitive_property->set_edm_name( 'Fistl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GEBER' ).
    lo_primitive_property->set_edm_name( 'Geber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRANT_NBR' ).
    lo_primitive_property->set_edm_name( 'GrantNbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKBER' ).
    lo_primitive_property->set_edm_name( 'Fkber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUFNR' ).
    lo_primitive_property->set_edm_name( 'Aufnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUFPL' ).
    lo_primitive_property->set_edm_name( 'Aufpl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'APLZL' ).
    lo_primitive_property->set_edm_name( 'Aplzl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSNR_PP' ).
    lo_primitive_property->set_edm_name( 'PosnrPp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KDAUF' ).
    lo_primitive_property->set_edm_name( 'Kdauf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KDPOS' ).
    lo_primitive_property->set_edm_name( 'Kdpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NTGEW' ).
    lo_primitive_property->set_edm_name( 'Ntgew' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRGEW' ).
    lo_primitive_property->set_edm_name( 'Brgew' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GEWEI' ).
    lo_primitive_property->set_edm_name( 'Gewei' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLUM' ).
    lo_primitive_property->set_edm_name( 'Volum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLEH' ).
    lo_primitive_property->set_edm_name( 'Voleh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXNUM' ).
    lo_primitive_property->set_edm_name( 'Exnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFNR' ).
    lo_primitive_property->set_edm_name( 'Lifnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BOLNR' ).
    lo_primitive_property->set_edm_name( 'Bolnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRATY' ).
    lo_primitive_property->set_edm_name( 'Traty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRAID' ).
    lo_primitive_property->set_edm_name( 'Traid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EAN_11' ).
    lo_primitive_property->set_edm_name( 'Ean11' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUKRS_BEST' ).
    lo_primitive_property->set_edm_name( 'BukrsBest' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMPST' ).
    lo_primitive_property->set_edm_name( 'Empst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LTSSF' ).
    lo_primitive_property->set_edm_name( 'Ltssf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELN' ).
    lo_primitive_property->set_edm_name( 'Vbeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSNR' ).
    lo_primitive_property->set_edm_name( 'Posnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABELN' ).
    lo_primitive_property->set_edm_name( 'Abeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABELP' ).
    lo_primitive_property->set_edm_name( 'Abelp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFNUM' ).
    lo_primitive_property->set_edm_name( 'Lfnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFEX' ).
    lo_primitive_property->set_edm_name( 'Lifex' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFEXPOS' ).
    lo_primitive_property->set_edm_name( 'Lifexpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MFRGR' ).
    lo_primitive_property->set_edm_name( 'Mfrgr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUREL' ).
    lo_primitive_property->set_edm_name( 'Aurel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATKL' ).
    lo_primitive_property->set_edm_name( 'Matkl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 9 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDNLF' ).
    lo_primitive_property->set_edm_name( 'Idnlf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRKOR' ).
    lo_primitive_property->set_edm_name( 'Grkor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KMPMG' ).
    lo_primitive_property->set_edm_name( 'Kmpmg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UML_1_S' ).
    lo_primitive_property->set_edm_name( 'Uml1s' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EWERK' ).
    lo_primitive_property->set_edm_name( 'Ewerk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZBEW' ).
    lo_primitive_property->set_edm_name( 'Kzbew' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIFSK' ).
    lo_primitive_property->set_edm_name( 'Lifsk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RSART' ).
    lo_primitive_property->set_edm_name( 'Rsart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RSNUM' ).
    lo_primitive_property->set_edm_name( 'Rsnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RSPOS' ).
    lo_primitive_property->set_edm_name( 'Rspos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SITUA' ).
    lo_primitive_property->set_edm_name( 'Situa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADRNR_WE' ).
    lo_primitive_property->set_edm_name( 'AdrnrWe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADRDA_WE' ).
    lo_primitive_property->set_edm_name( 'AdrdaWe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETTYP' ).
    lo_primitive_property->set_edm_name( 'Ettyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BWART' ).
    lo_primitive_property->set_edm_name( 'Bwart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSPNR' ).
    lo_primitive_property->set_edm_name( 'Pspnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MPROF' ).
    lo_primitive_property->set_edm_name( 'Mprof' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMATN' ).
    lo_primitive_property->set_edm_name( 'Ematn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MFRNR' ).
    lo_primitive_property->set_edm_name( 'Mfrnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MFRPN' ).
    lo_primitive_property->set_edm_name( 'Mfrpn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMNFR' ).
    lo_primitive_property->set_edm_name( 'Emnfr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZVBR' ).
    lo_primitive_property->set_edm_name( 'Kzvbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KNTTP' ).
    lo_primitive_property->set_edm_name( 'Knttp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PS_PSP_PNR' ).
    lo_primitive_property->set_edm_name( 'PsPspPnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBELV' ).
    lo_primitive_property->set_edm_name( 'Vbelv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSNV' ).
    lo_primitive_property->set_edm_name( 'Posnv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUOBJ' ).
    lo_primitive_property->set_edm_name( 'Cuobj' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBTYV' ).
    lo_primitive_property->set_edm_name( 'Vbtyv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NOATP' ).
    lo_primitive_property->set_edm_name( 'Noatp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NOPCK' ).
    lo_primitive_property->set_edm_name( 'Nopck' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AULWE' ).
    lo_primitive_property->set_edm_name( 'Aulwe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGNUM' ).
    lo_primitive_property->set_edm_name( 'Lgnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGTYP' ).
    lo_primitive_property->set_edm_name( 'Lgtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGPLA' ).
    lo_primitive_property->set_edm_name( 'Lgpla' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZDLG' ).
    lo_primitive_property->set_edm_name( 'Kzdlg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLGWM' ).
    lo_primitive_property->set_edm_name( 'Flgwm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BWLVS' ).
    lo_primitive_property->set_edm_name( 'Bwlvs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NOWAB' ).
    lo_primitive_property->set_edm_name( 'Nowab' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRVBE' ).
    lo_primitive_property->set_edm_name( 'Prvbe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BERKZ' ).
    lo_primitive_property->set_edm_name( 'Berkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZECH' ).
    lo_primitive_property->set_edm_name( 'Kzech' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RBLVS' ).
    lo_primitive_property->set_edm_name( 'Rblvs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BESTQ' ).
    lo_primitive_property->set_edm_name( 'Bestq' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMBSQ' ).
    lo_primitive_property->set_edm_name( 'Umbsq' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHKZG_UM' ).
    lo_primitive_property->set_edm_name( 'ShkzgUm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMMAT' ).
    lo_primitive_property->set_edm_name( 'Ummat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMWRK' ).
    lo_primitive_property->set_edm_name( 'Umwrk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMLGO' ).
    lo_primitive_property->set_edm_name( 'Umlgo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMBAR' ).
    lo_primitive_property->set_edm_name( 'Umbar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMCHA' ).
    lo_primitive_property->set_edm_name( 'Umcha' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMSOK' ).
    lo_primitive_property->set_edm_name( 'Umsok' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SONUM' ).
    lo_primitive_property->set_edm_name( 'Sonum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'USONU' ).
    lo_primitive_property->set_edm_name( 'Usonu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHKZG' ).
    lo_primitive_property->set_edm_name( 'Shkzg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RESOURCE_ID' ).
    lo_primitive_property->set_edm_name( 'ResourceId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UMRESOURCE_ID' ).
    lo_primitive_property->set_edm_name( 'UmresourceId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCHAR' ).
    lo_primitive_property->set_edm_name( 'Xchar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XCHPF' ).
    lo_primitive_property->set_edm_name( 'Xchpf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UECHA' ).
    lo_primitive_property->set_edm_name( 'Uecha' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DIRTA' ).
    lo_primitive_property->set_edm_name( 'Dirta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KCMENG' ).
    lo_primitive_property->set_edm_name( 'Kcmeng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KCMENG_FLO' ).
    lo_primitive_property->set_edm_name( 'KcmengFlo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KCBRGEW' ).
    lo_primitive_property->set_edm_name( 'Kcbrgew' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KCNTGEW' ).
    lo_primitive_property->set_edm_name( 'Kcntgew' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KCVOLUM' ).
    lo_primitive_property->set_edm_name( 'Kcvolum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KCGEWEI' ).
    lo_primitive_property->set_edm_name( 'Kcgewei' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KCVOLEH' ).
    lo_primitive_property->set_edm_name( 'Kcvoleh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KCMENGVME' ).
    lo_primitive_property->set_edm_name( 'Kcmengvme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KCMENGVMEF' ).
    lo_primitive_property->set_edm_name( 'Kcmengvmef' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZWAB' ).
    lo_primitive_property->set_edm_name( 'Kzwab' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZERZ' ).
    lo_primitive_property->set_edm_name( 'Kzerz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHHPV' ).
    lo_primitive_property->set_edm_name( 'Chhpv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INSMK' ).
    lo_primitive_property->set_edm_name( 'Insmk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KANNR' ).
    lo_primitive_property->set_edm_name( 'Kannr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WADAT_IST' ).
    lo_primitive_property->set_edm_name( 'WadatIst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MTART' ).
    lo_primitive_property->set_edm_name( 'Mtart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAGRV' ).
    lo_primitive_property->set_edm_name( 'Magrv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODH' ).
    lo_primitive_property->set_edm_name( 'Prodh' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRAGR' ).
    lo_primitive_property->set_edm_name( 'Tragr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LADGR' ).
    lo_primitive_property->set_edm_name( 'Ladgr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFGJA' ).
    lo_primitive_property->set_edm_name( 'Lfgja' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFBNR' ).
    lo_primitive_property->set_edm_name( 'Lfbnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LFPOS' ).
    lo_primitive_property->set_edm_name( 'Lfpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRUND' ).
    lo_primitive_property->set_edm_name( 'Grund' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_1' ).
    lo_primitive_property->set_edm_name( 'Mvgr1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_2' ).
    lo_primitive_property->set_edm_name( 'Mvgr2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_3' ).
    lo_primitive_property->set_edm_name( 'Mvgr3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_4' ).
    lo_primitive_property->set_edm_name( 'Mvgr4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MVGR_5' ).
    lo_primitive_property->set_edm_name( 'Mvgr5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KVGR_1' ).
    lo_primitive_property->set_edm_name( 'Kvgr1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KVGR_2' ).
    lo_primitive_property->set_edm_name( 'Kvgr2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KVGR_3' ).
    lo_primitive_property->set_edm_name( 'Kvgr3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KVGR_4' ).
    lo_primitive_property->set_edm_name( 'Kvgr4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KVGR_5' ).
    lo_primitive_property->set_edm_name( 'Kvgr5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KONTO' ).
    lo_primitive_property->set_edm_name( 'Konto' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZEAR' ).
    lo_primitive_property->set_edm_name( 'Kzear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VFDAT' ).
    lo_primitive_property->set_edm_name( 'Vfdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HSDAT' ).
    lo_primitive_property->set_edm_name( 'Hsdat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'XABLN' ).
    lo_primitive_property->set_edm_name( 'Xabln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BLDAT' ).
    lo_primitive_property->set_edm_name( 'Bldat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FOLAR' ).
    lo_primitive_property->set_edm_name( 'Folar' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QPLOS' ).
    lo_primitive_property->set_edm_name( 'Qplos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FOBWA' ).
    lo_primitive_property->set_edm_name( 'Fobwa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FO_DLVTP' ).
    lo_primitive_property->set_edm_name( 'FoDlvtp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZUML' ).
    lo_primitive_property->set_edm_name( 'Kzuml' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXBWR' ).
    lo_primitive_property->set_edm_name( 'Exbwr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BPMNG' ).
    lo_primitive_property->set_edm_name( 'Bpmng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXVKW' ).
    lo_primitive_property->set_edm_name( 'Exvkw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VWPOS' ).
    lo_primitive_property->set_edm_name( 'Vwpos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UEPVW' ).
    lo_primitive_property->set_edm_name( 'Uepvw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WMS_VSMNG_FLO' ).
    lo_primitive_property->set_edm_name( 'WmsVsmngFlo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WMS_LSMENG_FLO' ).
    lo_primitive_property->set_edm_name( 'WmsLsmengFlo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Double' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PANUM' ).
    lo_primitive_property->set_edm_name( 'Panum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUAN_NO_CHECK' ).
    lo_primitive_property->set_edm_name( 'QuanNoCheck' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMB_CRIT' ).
    lo_primitive_property->set_edm_name( 'CombCrit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PODREL' ).
    lo_primitive_property->set_edm_name( 'Podrel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'Id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VBOBJ' ).
    lo_primitive_property->set_edm_name( 'Vbobj' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TARAG' ).
    lo_primitive_property->set_edm_name( 'Tarag' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAVOL' ).
    lo_primitive_property->set_edm_name( 'Tavol' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PSTYV' ).
    lo_primitive_property->set_edm_name( 'Pstyv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BDART' ).
    lo_primitive_property->set_edm_name( 'Bdart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NORND_LP' ).
    lo_primitive_property->set_edm_name( 'NorndLp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLART' ).
    lo_primitive_property->set_edm_name( 'Plart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSTAB_TABIX' ).
    lo_primitive_property->set_edm_name( 'PostabTabix' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERNR' ).
    lo_primitive_property->set_edm_name( 'Sernr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KDGRP' ).
    lo_primitive_property->set_edm_name( 'Kdgrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABTNR' ).
    lo_primitive_property->set_edm_name( 'Abtnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BKGRP' ).
    lo_primitive_property->set_edm_name( 'Bkgrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NO_MORE_DELIVERIES' ).
    lo_primitive_property->set_edm_name( 'NoMoreDeliveries' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRMTYP' ).
    lo_primitive_property->set_edm_name( 'Trmtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANZ_POS_GRKOR' ).
    lo_primitive_property->set_edm_name( 'AnzPosGrkor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BZIRK' ).
    lo_primitive_property->set_edm_name( 'Bzirk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETENS' ).
    lo_primitive_property->set_edm_name( 'Etens' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZBWS' ).
    lo_primitive_property->set_edm_name( 'Kzbws' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LSTEL' ).
    lo_primitive_property->set_edm_name( 'Lstel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BEROT' ).
    lo_primitive_property->set_edm_name( 'Berot' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KODAT' ).
    lo_primitive_property->set_edm_name( 'Kodat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KOUHR' ).
    lo_primitive_property->set_edm_name( 'Kouhr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATWA' ).
    lo_primitive_property->set_edm_name( 'Matwa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GMCONTROL' ).
    lo_primitive_property->set_edm_name( 'Gmcontrol' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSTING_CHANGE' ).
    lo_primitive_property->set_edm_name( 'PostingChange' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UM_PS_PSP_PNR' ).
    lo_primitive_property->set_edm_name( 'UmPsPspPnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ANZPK' ).
    lo_primitive_property->set_edm_name( 'Anzpk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NO_BILLING' ).
    lo_primitive_property->set_edm_name( 'NoBilling' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRE_VL_ETENS' ).
    lo_primitive_property->set_edm_name( 'PreVlEtens' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADRNR_LI' ).
    lo_primitive_property->set_edm_name( 'AdrnrLi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_LE_SCENARIO' ).
    lo_primitive_property->set_edm_name( 'SpeLeScenario' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_ERNAM' ).
    lo_primitive_property->set_edm_name( 'SpeErnam' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_GEOROUTE' ).
    lo_primitive_property->set_edm_name( 'SpeGeoroute' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_GEOROUTEIND' ).
    lo_primitive_property->set_edm_name( 'SpeGeorouteind' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_CARRIER_IND' ).
    lo_primitive_property->set_edm_name( 'SpeCarrierInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_GTS_REL' ).
    lo_primitive_property->set_edm_name( 'SpeGtsRel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_GTS_RT_CDE' ).
    lo_primitive_property->set_edm_name( 'SpeGtsRtCde' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_ATP_TMSTMP' ).
    lo_primitive_property->set_edm_name( 'SpeAtpTmstmp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_REL_TMSTMP' ).
    lo_primitive_property->set_edm_name( 'SpeRelTmstmp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_TTYPE' ).
    lo_primitive_property->set_edm_name( 'SpeTtype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_INITIATOR_PROCESS' ).
    lo_primitive_property->set_edm_name( 'SpeInitiatorProcess' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_UNIT_SYSTEM' ).
    lo_primitive_property->set_edm_name( 'SpeUnitSystem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'SpeCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_INV_BFR_GI' ).
    lo_primitive_property->set_edm_name( 'SpeInvBfrGi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_ORIG_SYS' ).
    lo_primitive_property->set_edm_name( 'SpeOrigSys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_ORIG_SYS_POS' ).
    lo_primitive_property->set_edm_name( 'SpeOrigSysPos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_LIEFFZ' ).
    lo_primitive_property->set_edm_name( 'SpeLieffz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_EXCEPT_CODE' ).
    lo_primitive_property->set_edm_name( 'SpeExceptCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_CHNG_SYS' ).
    lo_primitive_property->set_edm_name( 'SpeChngSys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_LIFEXPOS_2' ).
    lo_primitive_property->set_edm_name( 'SpeLifexpos2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_POSNR' ).
    lo_primitive_property->set_edm_name( 'SpePosnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_LOC_SEQ' ).
    lo_primitive_property->set_edm_name( 'SpeLocSeq' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_ACC_APP_STS' ).
    lo_primitive_property->set_edm_name( 'SpeAccAppSts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_SHP_INF_STS' ).
    lo_primitive_property->set_edm_name( 'SpeShpInfSts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_AUTH_NUMBER' ).
    lo_primitive_property->set_edm_name( 'SpeAuthNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_FOLLOW_UP' ).
    lo_primitive_property->set_edm_name( 'SpeFollowUp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_EXP_DATE_EXT_B' ).
    lo_primitive_property->set_edm_name( 'SpeExpDateExtB' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_EXP_DATE_EXT' ).
    lo_primitive_property->set_edm_name( 'SpeExpDateExt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_EXP_DATE_INT' ).
    lo_primitive_property->set_edm_name( 'SpeExpDateInt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_INSPOUT_GUID' ).
    lo_primitive_property->set_edm_name( 'SpeInspoutGuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 32 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_SCRAP_IND' ).
    lo_primitive_property->set_edm_name( 'SpeScrapInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_KEEP_QTY' ).
    lo_primitive_property->set_edm_name( 'SpeKeepQty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGPBE' ).
    lo_primitive_property->set_edm_name( 'Lgpbe' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BORGR_LGTOR' ).
    lo_primitive_property->set_edm_name( 'BorgrLgtor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BORGR_LGBZO' ).
    lo_primitive_property->set_edm_name( 'BorgrLgbzo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IMWRK' ).
    lo_primitive_property->set_edm_name( 'Imwrk' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IMWRK_ITM' ).
    lo_primitive_property->set_edm_name( 'ImwrkItm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ABRVW' ).
    lo_primitive_property->set_edm_name( 'Abrvw' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RVBELN' ).
    lo_primitive_property->set_edm_name( 'RVbeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RVBELP' ).
    lo_primitive_property->set_edm_name( 'RVbelp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KBNKZ' ).
    lo_primitive_property->set_edm_name( 'Kbnkz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FKREL' ).
    lo_primitive_property->set_edm_name( 'Fkrel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROCESS_HOLD_ITEM' ).
    lo_primitive_property->set_edm_name( 'ProcessHoldItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_ALTERNATE' ).
    lo_primitive_property->set_edm_name( 'SpeAlternate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_CD_PROCESS' ).
    lo_primitive_property->set_edm_name( 'SpeCdProcess' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_CD_PLANT' ).
    lo_primitive_property->set_edm_name( 'SpeCdPlant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_MAT_SUBST' ).
    lo_primitive_property->set_edm_name( 'SpeMatSubst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_LIFEX_TYPE' ).
    lo_primitive_property->set_edm_name( 'SpeLifexType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_ANZ_POS_STRUC' ).
    lo_primitive_property->set_edm_name( 'SpeAnzPosStruc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_STRUC' ).
    lo_primitive_property->set_edm_name( 'SpeStruc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_APO_QNTYFAC' ).
    lo_primitive_property->set_edm_name( 'SpeApoQntyfac' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_APO_QNTYDIV' ).
    lo_primitive_property->set_edm_name( 'SpeApoQntydiv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_PRO_NUMBER' ).
    lo_primitive_property->set_edm_name( 'SpeProNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_RED_IND' ).
    lo_primitive_property->set_edm_name( 'SpeRedInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VORNU' ).
    lo_primitive_property->set_edm_name( 'Vornu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VORPA' ).
    lo_primitive_property->set_edm_name( 'Vorpa' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXPVZ' ).
    lo_primitive_property->set_edm_name( 'Expvz' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_HERKL' ).
    lo_primitive_property->set_edm_name( 'SpeHerkl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_HERKR' ).
    lo_primitive_property->set_edm_name( 'SpeHerkr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WEMPF' ).
    lo_primitive_property->set_edm_name( 'Wempf' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VORNR' ).
    lo_primitive_property->set_edm_name( 'Vornr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RECIPIENT_LOCATION_CODE' ).
    lo_primitive_property->set_edm_name( 'RecipientLocationCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BSTNR' ).
    lo_primitive_property->set_edm_name( 'Bstnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BSTDT' ).
    lo_primitive_property->set_edm_name( 'Bstdt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BSTDK_E' ).
    lo_primitive_property->set_edm_name( 'BstdkE' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BSTKD_E' ).
    lo_primitive_property->set_edm_name( 'BstkdE' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SPE_SHIP_COMP' ).
    lo_primitive_property->set_edm_name( 'SpeShipComp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SN_FROM_TAB' ).
    lo_primitive_property->set_edm_name( 'SnFromTab' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_HANDLE' ).
    lo_primitive_property->set_edm_name( 'ItemHandle' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRSPG' ).
    lo_primitive_property->set_edm_name( 'Trspg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOC_GUID' ).
    lo_primitive_property->set_edm_name( 'LocGuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STATU' ).
    lo_primitive_property->set_edm_name( 'Statu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COPY_WEIVOL_HDR' ).
    lo_primitive_property->set_edm_name( 'CopyWeivolHdr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COPY_WEIVOL_ITM' ).
    lo_primitive_property->set_edm_name( 'CopyWeivolItm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NTGEW_HDR' ).
    lo_primitive_property->set_edm_name( 'NtgewHdr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRGEW_HDR' ).
    lo_primitive_property->set_edm_name( 'BrgewHdr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GEWEI_HDR' ).
    lo_primitive_property->set_edm_name( 'GeweiHdr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLUM_HDR' ).
    lo_primitive_property->set_edm_name( 'VolumHdr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLEH_HDR' ).
    lo_primitive_property->set_edm_name( 'VolehHdr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSR_ACTIVE' ).
    lo_primitive_property->set_edm_name( 'MsrActive' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UC_KUNNR' ).
    lo_primitive_property->set_edm_name( 'UcKunnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDGET_PD' ).
    lo_primitive_property->set_edm_name( 'BudgetPd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRTNR' ).
    lo_primitive_property->set_edm_name( 'Prtnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TM_CTRL_KEY' ).
    lo_primitive_property->set_edm_name( 'TmCtrlKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_TRANSPORT_ID' ).
    lo_primitive_property->set_edm_name( 'ExtTransportId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSR_VALUATION' ).
    lo_primitive_property->set_edm_name( 'MsrValuation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UPFLU' ).
    lo_primitive_property->set_edm_name( 'Upflu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADRDA_LI' ).
    lo_primitive_property->set_edm_name( 'AdrdaLi' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HANDOVERLOC' ).
    lo_primitive_property->set_edm_name( 'Handoverloc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HANDOVERDATE' ).
    lo_primitive_property->set_edm_name( 'Handoverdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HANDOVERTIME' ).
    lo_primitive_property->set_edm_name( 'Handovertime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HANDOVERTZONE' ).
    lo_primitive_property->set_edm_name( 'Handovertzone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_BCFOP' ).
    lo_primitive_property->set_edm_name( 'J1bcfop' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_BTAXLW_1' ).
    lo_primitive_property->set_edm_name( 'J1btaxlw1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_BTAXLW_2' ).
    lo_primitive_property->set_edm_name( 'J1btaxlw2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_BTAXLW_3' ).
    lo_primitive_property->set_edm_name( 'J1btaxlw3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_BTAXLW_4' ).
    lo_primitive_property->set_edm_name( 'J1btaxlw4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'J_1_BTAXLW_5' ).
    lo_primitive_property->set_edm_name( 'J1btaxlw5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SGT_SCAT' ).
    lo_primitive_property->set_edm_name( 'SgtScat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SGT_RCAT' ).
    lo_primitive_property->set_edm_name( 'SgtRcat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOADING_POINT' ).
    lo_primitive_property->set_edm_name( 'LoadingPoint' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TM_WHSE_EXEC' ).
    lo_primitive_property->set_edm_name( 'TmWhseExec' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_2_KEY' ).
    lo_primitive_property->set_edm_name( 'Inco2Key' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_3_KEY' ).
    lo_primitive_property->set_edm_name( 'Inco3Key' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_4_KEY' ).
    lo_primitive_property->set_edm_name( 'Inco4Key' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOV' ).
    lo_primitive_property->set_edm_name( 'Incov' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_2_L' ).
    lo_primitive_property->set_edm_name( 'Inco2L' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCO_3_L' ).
    lo_primitive_property->set_edm_name( 'Inco3L' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VSART' ).
    lo_primitive_property->set_edm_name( 'Vsart' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_RETDLV_VBELN' ).
    lo_primitive_property->set_edm_name( 'ExtRetdlvVbeln' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_RETDLV_POSNR' ).
    lo_primitive_property->set_edm_name( 'ExtRetdlvPosnr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUMMY_DELIVERY_INCL_EEW_PS' ).
    lo_primitive_property->set_edm_name( 'DummyDeliveryInclEewPs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUMMY_DELIVERY_INCL_EEW_TR' ).
    lo_primitive_property->set_edm_name( 'DummyDeliveryInclEewTr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUMMY_DELITM_INCL_EEW_PS' ).
    lo_primitive_property->set_edm_name( 'DummyDelitmInclEewPs' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUMMY_DELIVERYITEM_INCL_EE' ).
    lo_primitive_property->set_edm_name( 'DummyDeliveryitemInclEewTr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTENSION_FIELDS_MERGED' ).
    lo_primitive_property->set_edm_name( 'ExtensionFieldsMerged' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PCSTA' ).
    lo_primitive_property->set_edm_name( 'Pcsta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DGSTA' ).
    lo_primitive_property->set_edm_name( 'Dgsta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDSSTA' ).
    lo_primitive_property->set_edm_name( 'Sdssta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VCM_CHAIN_UUID' ).
    lo_primitive_property->set_edm_name( 'VcmChainUuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VCM_CHAIN_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'VcmChainCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_ACT_DATE_TOCD' ).
    lo_primitive_property->set_edm_name( 'ExtActDateTocd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_PLAN_DATE_TOCD' ).
    lo_primitive_property->set_edm_name( 'ExtPlanDateTocd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXT_TZONE_TOCD' ).
    lo_primitive_property->set_edm_name( 'ExtTzoneTocd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INT_ACT_DATE_TOCD' ).
    lo_primitive_property->set_edm_name( 'IntActDateTocd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INT_PLAN_DATE_TOCD' ).
    lo_primitive_property->set_edm_name( 'IntPlanDateTocd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INT_TZONE_TOCD' ).
    lo_primitive_property->set_edm_name( 'IntTzoneTocd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRSTA' ).
    lo_primitive_property->set_edm_name( 'Trsta' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZ_ITM_EMCST' ).
    lo_primitive_property->set_edm_name( 'KzItmEmcst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITM_EMCST' ).
    lo_primitive_property->set_edm_name( 'ItmEmcst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZ_ITM_SLCST' ).
    lo_primitive_property->set_edm_name( 'KzItmSlcst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITM_SLCST' ).
    lo_primitive_property->set_edm_name( 'ItmSlcst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'KZ_ITM_LCCST' ).
    lo_primitive_property->set_edm_name( 'KzItmLccst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITM_LCCST' ).
    lo_primitive_property->set_edm_name( 'ItmLccst' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LGLC_LIC_IND' ).
    lo_primitive_property->set_edm_name( 'LglcLicInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORR_IND' ).
    lo_primitive_property->set_edm_name( 'CorrInd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ZGTYP' ).
    lo_primitive_property->set_edm_name( 'Zgtyp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CWM_LFIMG' ).
    lo_primitive_property->set_edm_name( 'cwmLfimg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CWM_LFIME' ).
    lo_primitive_property->set_edm_name( 'cwmLfime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CWM_LFIME_ISO' ).
    lo_primitive_property->set_edm_name( 'cwmLfimeIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CWM_PIKMG' ).
    lo_primitive_property->set_edm_name( 'cwmPikmg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CWM_PIKME' ).
    lo_primitive_property->set_edm_name( 'cwmPikme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CWM_PPIKME_ISO' ).
    lo_primitive_property->set_edm_name( 'cwmPpikmeIso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CWM_XENTER' ).
    lo_primitive_property->set_edm_name( 'cwmXenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CWM_XTAENTER' ).
    lo_primitive_property->set_edm_name( 'cwmXtaenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CWM_KCMENG' ).
    lo_primitive_property->set_edm_name( 'cwmKcmeng' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BORGR_GRP' ).
    lo_primitive_property->set_edm_name( 'BorgrGrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BORGR_PSTYV' ).
    lo_primitive_property->set_edm_name( 'BorgrPstyv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_SEASON_YEAR' ).
    lo_primitive_property->set_edm_name( 'FshSeasonYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_SEASON' ).
    lo_primitive_property->set_edm_name( 'FshSeason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_COLLECTION' ).
    lo_primitive_property->set_edm_name( 'FshCollection' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_THEME' ).
    lo_primitive_property->set_edm_name( 'FshTheme' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_VAS_CG' ).
    lo_primitive_property->set_edm_name( 'FshVasCg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_VAS_REL' ).
    lo_primitive_property->set_edm_name( 'FshVasRel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_VAS_PRNT_ID' ).
    lo_primitive_property->set_edm_name( 'FshVasPrntId' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_TRANSACTION' ).
    lo_primitive_property->set_edm_name( 'FshTransaction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_ITEM_GROUP' ).
    lo_primitive_property->set_edm_name( 'FshItemGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_ITEM' ).
    lo_primitive_property->set_edm_name( 'FshItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_RSNUM' ).
    lo_primitive_property->set_edm_name( 'FshRsnum' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_RSPOS' ).
    lo_primitive_property->set_edm_name( 'FshRspos' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FSH_PSM_PFM_SPLIT' ).
    lo_primitive_property->set_edm_name( 'FshPsmPfmSplit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RFM_PSST_GROUP' ).
    lo_primitive_property->set_edm_name( 'RfmPsstGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LLIEF' ).
    lo_primitive_property->set_edm_name( 'Llief' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONS_ORDER' ).
    lo_primitive_property->set_edm_name( 'ConsOrder' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSGID' ).
    lo_primitive_property->set_edm_name( 'Msgid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSGNO' ).
    lo_primitive_property->set_edm_name( 'Msgno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSGTY' ).
    lo_primitive_property->set_edm_name( 'Msgty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSGV_1' ).
    lo_primitive_property->set_edm_name( 'Msgv1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSGV_2' ).
    lo_primitive_property->set_edm_name( 'Msgv2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSGV_3' ).
    lo_primitive_property->set_edm_name( 'Msgv3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MSGV_4' ).
    lo_primitive_property->set_edm_name( 'Msgv4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.

  ENDMETHOD.
ENDCLASS.
