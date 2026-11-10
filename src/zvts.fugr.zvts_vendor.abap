FUNCTION ZVTS_VENDOR.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     REFERENCE(LOAD_VENDOR) TYPE  ZTT_LOAD_VENDOR OPTIONAL
*"  EXPORTING
*"     VALUE(MESSAGE) TYPE  CHAR256
*"     VALUE(VENDOR) TYPE  LIFNR
*"----------------------------------------------------------------------
  DATA: l_PARTNERGROUP      TYPE zbapibus1006_head-partn_grp,
        l_role              TYPE zbapibus1006_head-partnerrole,
        l_centraldata       TYPE zbapibus1006_central,
        c_centraldata       TYPE zbapibus1006002_central,
        l_CENTRALDATAPERSON TYPE zbapibus1006_central_person,
        l_organization      TYPE zbapibus1006_central_organ,
        l_addressdata       TYPE zbapibus1006_address,
        l_partner           TYPE zbapibus1006_head-bpartner,
        l_tax_common        TYPE zbapibus1006tax_common,
        c_partner           TYPE zbapibus1006_head-bpartner,
        l_ID                TYPE zbapibus1006_head-bankdetailid,
        l_bankdetaildata    TYPE zbapibus1006_bankdetail,
        l_tel               TYPE ztt_bapiadtel,  "OCCURS 0 WITH HEADER LINE,
        ls_tel              LIKE LINE OF l_tel,
        l_fax               TYPE ztt_bapiadfax,  "OCCURS 0 WITH HEADER LINE,
        ls_fax              LIKE LINE OF l_fax,
        l_mail              TYPE ztt_bapiadsmtp, "OCCURS 0 WITH HEADER LINE,
        ls_mail             LIKE LINE OF l_mail,
        l_return            TYPE ztt_bapiret2,   "OCCURS 0 WITH HEADER LINE.
        ls_return           LIKE LINE OF l_return.

  DATA: ls_master_data           TYPE zvmds_ei_main,
        ls_master_data_correct   TYPE zvmds_ei_main,
        ls_message_correct       TYPE zcvis_message,
        ls_master_data_defective TYPE zvmds_ei_main,
        ls_message_defective     TYPE zcvis_message.

  DATA: lt_vendor        TYPE zvmds_ei_extern_t,
        ls_vendor        TYPE zvmds_ei_extern,
        ls_purchase_data TYPE zvmds_ei_vmd_purchasing,
        lt_purchase      TYPE zvmds_ei_purchasing_t,
        ls_purchase      TYPE zvmds_ei_purchasing,
        ls_company       TYPE zvmds_ei_company,
        lt_functions     TYPE STANDARD TABLE OF zvmds_ei_functions,
        ls_function      TYPE zvmds_ei_functions.

*  CLEAR:   arch_dat, bdcdata, l_mess.
*  REFRESH: arch_dat, bdcdata.

  LOOP AT load_vendor INTO DATA(ls_load_vendor).

    l_organization-name1 = ls_load_vendor-name1.
    l_centraldata-searchterm1 = ls_load_vendor-stcd1.

    l_addressdata-standardaddress = 'X'.
    l_addressdata-street = ls_load_vendor-street.
    l_addressdata-house_no = ls_load_vendor-house_num1.
    l_addressdata-district = ls_load_vendor-city2.
    l_addressdata-postl_cod1 = ls_load_vendor-post_code1.
    l_addressdata-city = ls_load_vendor-city1.
    l_addressdata-country = ls_load_vendor-country.
    l_addressdata-region = ls_load_vendor-region.
    l_addressdata-langu = ls_load_vendor-langu.

    CLEAR: l_tel, ls_tel.

    IF NOT ls_load_vendor-tel_number IS INITIAL OR NOT ls_load_vendor-tel_extens IS INITIAL.
      ls_tel-telephone = ls_load_vendor-tel_number.
      ls_tel-extension = ls_load_vendor-tel_extens.
      APPEND ls_tel TO l_tel.
    ENDIF.

    CLEAR ls_tel.
    IF NOT ls_load_vendor-tel_cellul IS INITIAL.
      ls_tel-telephone = ls_load_vendor-tel_cellul.
      ls_tel-r_3_user = '2'.
      APPEND ls_tel TO l_tel.
    ENDIF.

    CLEAR: l_fax, ls_fax.

    IF NOT ls_load_vendor-fax_number IS INITIAL OR NOT ls_load_vendor-fax_extens IS INITIAL.
      ls_fax-fax = ls_load_vendor-fax_number.
      ls_fax-extension = ls_load_vendor-fax_extens.
      APPEND ls_fax TO l_fax.
    ENDIF.

    IF NOT ls_load_vendor-smtp_addr IS INITIAL.
      ls_mail-std_no = 'X'.
      ls_mail-e_mail = ls_load_vendor-smtp_addr.
      APPEND ls_mail TO l_mail.
    ENDIF.

    l_PARTNERGROUP = ls_load_vendor-ktokk.

* Genera Business Partner

*    CALL FUNCTION 'BAPI_BUPA_CREATE_FROM_DATA'
*      EXPORTING
**       BUSINESSPARTNEREXTERN   =
*        partnercategory         = '2'
*        partnergroup            = l_PARTNERGROUP
*        centraldata             = l_centraldata
*        centraldataorganization = l_organization
*        addressdata             = l_addressdata
*      IMPORTING
*        businesspartner         = l_partner
*      TABLES
*        telefondata             = l_tel
*        faxdata                 = l_fax
*        e_maildata              = l_mail
*        return                  = l_return.
*
*    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
*      EXPORTING
*        wait = 'X'.

    zcl_bapi_bupa_create_from_data=>bapi_bupa_create_from_data( EXPORTING i_partnercat = '2'
                                                                          i_partnergroup = l_partnergroup
                                                                          i_centraldata = l_centraldata
                                                                          i_centraldataorg = l_organization
                                                                          i_addressdata = l_addressdata
                                                                          it_tel = l_tel
                                                                          it_fax = l_fax
                                                                          it_mail = l_mail
                                                                IMPORTING e_partner = l_partner
                                                                          et_return = l_return ).

    vendor = l_partner.

    IF NOT l_return[] IS INITIAL.
      READ TABLE l_return INTO ls_return WITH KEY type = 'E'.
      IF sy-subrc EQ 0.
        message = ls_return-message.
        CLEAR: vendor.
        EXIT.
      ENDIF.
    ENDIF.

    CLEAR: l_return, ls_return.

    l_ID = '0001'.                                            "ID
    l_bankdetaildata-bank_ctry = ls_load_vendor-banks.           "P/R
    l_bankdetaildata-bank_key = ls_load_vendor-bankl.            "Clave de banco
    l_bankdetaildata-bank_acct = ls_load_vendor-bkref.           "Cuenta bancaria
    l_bankdetaildata-ctrl_key = ls_load_vendor-bkont.            "Cve Ctrl
    l_bankdetaildata-bank_ref = ls_load_vendor-bankn.            "Referencia
    l_bankdetaildata-accountholder = ls_load_vendor-koinh.       "Titular
    l_bankdetaildata-bankdetailvalidfrom = sy-datum. "Valido desde
    l_bankdetaildata-bankdetailvalidto = '99991231'.   "Valido hasta

* Agrega Info de Bancos

*    CALL FUNCTION 'BAPI_BUPA_BANKDETAIL_ADD'
*      EXPORTING
*        businesspartner = l_partner
*        bankdetailID    = l_ID
*        bankdetaildata  = l_bankdetaildata
*      TABLES
*        return          = l_return.
    zcl_bapi_bupa_create_from_data=>bapi_bupa_bankdetail_add( EXPORTING i_partner = l_partner
                                                                        i_id = l_id
                                                                        i_bankdetail = l_bankdetaildata
                                                              IMPORTING et_return = l_return ).

    IF NOT l_return[] IS INITIAL.
      READ TABLE l_return INTO ls_return WITH KEY type = 'E'.
      IF sy-subrc EQ 0.
        message = ls_return-message.
        PERFORM delete_bp USING l_partner.   "Borra el BP creado en caso de error.
        CLEAR: vendor.
        EXIT.
      ENDIF.
    ENDIF.

    IF ls_load_vendor-stkzn = 'X'. " Si es persona física
      CLEAR: l_return, ls_return.
      l_tax_common-naturalperson = 'X'.

*      CALL FUNCTION 'BAPI_BUPA_TAX_COMMON_CHANGE'
*        EXPORTING
*          businesspartner = l_partner
*          taxcommon       = l_tax_common
*        TABLES
*          return          = l_return.
      zcl_bapi_bupa_create_from_data=>bapi_bupa_tax_common_change( EXPORTING i_partner = l_partner
                                                                             i_tax_common = l_tax_common
                                                                   IMPORTING et_return = l_return ).

    ENDIF.

* Asigna RFC
    CLEAR: l_return, ls_return.
    DATA: l_tax_number TYPE c LENGTH 20.
    l_tax_number = ls_load_vendor-stcd1.

*    CALL FUNCTION 'BAPI_BUPA_TAX_ADD'
*      EXPORTING
*        businesspartner = l_partner
*        taxtype         = 'MX1'
*        taxnumber       = l_tax_number
*      TABLES
*        return          = l_return.
*
*    CALL FUNCTION 'BUPA_TAX_SAVE_COMMIT'.
    zcl_bapi_bupa_create_from_data=>bapi_bupa_tax_add( EXPORTING i_partner = l_partner
                                                                 i_taxtype = 'MX1'
                                                                 i_taxnumber = l_tax_number
                                                       IMPORTING et_return = l_return ).
    IF NOT l_return[] IS INITIAL.
      READ TABLE l_return INTO ls_return WITH KEY type = 'E'.
      IF sy-subrc EQ 0.
        message = ls_return-message.
        PERFORM delete_bp USING l_partner.   "Borra el BP creado en caso de error.
        CLEAR: vendor.
        EXIT.
      ENDIF.
    ENDIF.

* Agrega persona de contacto 1

    l_CENTRALDATAPERSON-firstname = ls_load_vendor-namevp.
    l_CENTRALDATAPERSON-lastname = '.'.
    l_CENTRALDATAPERSON-birthname = ls_load_vendor-name1p.

    CLEAR: l_centraldata, l_return, ls_return.

*    CALL FUNCTION 'BAPI_BUPA_CREATE_FROM_DATA'
*      EXPORTING
**       BUSINESSPARTNEREXTERN              =
*        partnercategory   = '1'
**       PARTNERGROUP      = '0001'
*        centraldata       = l_centraldata
*        centraldataperson = l_CENTRALDATAPERSON
*      IMPORTING
*        businesspartner   = c_partner
*      TABLES
*        return            = l_return.
*
*    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
*      EXPORTING
*        wait = 'X'.
    zcl_bapi_bupa_create_from_data=>bapi_bupa_create_from_data( EXPORTING i_partnercat = '1'
                                                                          i_partnergroup = l_partnergroup
                                                                          i_centraldata = l_centraldata
                                                                          i_centraldataperson = l_centraldataperson
                                                                IMPORTING e_partner = c_partner
                                                                          et_return = l_return ).

    IF NOT l_return[] IS INITIAL.
      READ TABLE l_return INTO ls_return WITH KEY type = 'E'.
      IF sy-subrc EQ 0.
        message = ls_return-message.
        PERFORM delete_bp USING c_partner.   "Borra el BP creado en caso de error.
        PERFORM delete_bp USING l_partner.   "Borra el BP creado en caso de error.
        CLEAR: vendor.
        EXIT.
      ENDIF.
    ENDIF.

    IF NOT c_partner IS INITIAL.
      CLEAR: l_return, ls_return.

*   Crea relación de persona de contacto
      c_centraldata-function   = ls_load_vendor-pafktp.
      c_centraldata-department = ls_load_vendor-bukrs.
      c_centraldata-e_mail     = ls_load_vendor-smtpadrp.

*      CALL FUNCTION 'BAPI_BUPR_CONTP_CREATE'
*        EXPORTING
*          businesspartner     = l_partner
*          contactperson       = c_partner
*          validfromdate       = sy-datum
*          validuntildate      = '99991231'
*          defaultrelationship = 'X'
*          centraldata         = c_centraldata
**         ADDRESSDATA         =
**         DUPLICATE_MESSAGE_TYPE   =
*        TABLES
*          return              = l_return.
      zcl_bapi_bupa_create_from_data=>bapi_bupr_contp_create( EXPORTING i_partner = l_partner
                                                                        i_contactperson = c_partner
                                                                        i_validfrom = sy-datum
                                                                        i_validto = '99991231'
                                                                        i_default = 'X'
                                                                        i_centraldata = c_centraldata
                                                              IMPORTING et_return = l_return ).
      IF NOT l_return[] IS INITIAL.
        READ TABLE l_return INTO ls_return WITH KEY type = 'E'.
        IF sy-subrc EQ 0.
          message = ls_return-message.
          PERFORM delete_bp USING c_partner.   "Borra el BP creado en caso de error.
          PERFORM delete_bp USING l_partner.   "Borra el BP creado en caso de error.
          CLEAR: vendor.
          EXIT.
        ENDIF.
      ENDIF.

*      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
*        EXPORTING
*          wait = 'X'.
    ENDIF.

* Agrega persona de contacto 2

    l_CENTRALDATAPERSON-firstname = ls_load_vendor-namevv.
    l_CENTRALDATAPERSON-lastname = '.'.
    l_CENTRALDATAPERSON-birthname = ls_load_vendor-name1v.

    CLEAR: l_centraldata, l_return, ls_return.

*    CALL FUNCTION 'BAPI_BUPA_CREATE_FROM_DATA'
*      EXPORTING
**       BUSINESSPARTNEREXTERN              =
*        partnercategory   = '1'
**       PARTNERGROUP      = '0001'
*        centraldata       = l_centraldata
*        centraldataperson = l_CENTRALDATAPERSON
*      IMPORTING
*        businesspartner   = c_partner
*      TABLES
*        return            = l_return.
*
*    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
*      EXPORTING
*        wait = 'X'.
    zcl_bapi_bupa_create_from_data=>bapi_bupa_create_from_data( EXPORTING i_partnercat = '1'
                                                                          i_partnergroup = l_partnergroup
                                                                          i_centraldata = l_centraldata
                                                                          i_centraldataperson = l_centraldataperson
                                                                IMPORTING e_partner = c_partner
                                                                          et_return = l_return ).
    IF NOT l_return[] IS INITIAL.
      READ TABLE l_return INTO ls_return WITH KEY type = 'E'.
      IF sy-subrc EQ 0.
        message = ls_return-message.
        PERFORM delete_bp USING c_partner.   "Borra el BP creado en caso de error.
        PERFORM delete_bp USING l_partner.   "Borra el BP creado en caso de error.
        CLEAR: vendor.
        EXIT.
      ENDIF.
    ENDIF.

    IF NOT c_partner IS INITIAL.
      CLEAR: l_return, ls_return.

*   Crea relación de persona de contacto
      c_centraldata-function   = ls_load_vendor-pafktv.
      c_centraldata-department = ls_load_vendor-bukrs.
      c_centraldata-e_mail     = ls_load_vendor-smtpadrv.

*      CALL FUNCTION 'BAPI_BUPR_CONTP_CREATE'
*        EXPORTING
*          businesspartner     = l_partner
*          contactperson       = c_partner
*          validfromdate       = sy-datum
*          validuntildate      = '99991231'
*          defaultrelationship = 'X'
*          centraldata         = c_centraldata
**         ADDRESSDATA         =
**         DUPLICATE_MESSAGE_TYPE   =
*        TABLES
*          return              = l_return.
      zcl_bapi_bupa_create_from_data=>bapi_bupr_contp_create( EXPORTING i_partner = l_partner
                                                                        i_contactperson = c_partner
                                                                        i_validfrom = sy-datum
                                                                        i_validto = '99991231'
                                                                        i_default = 'X'
                                                                        i_centraldata = c_centraldata
                                                              IMPORTING et_return = l_return ).
      IF NOT l_return[] IS INITIAL.
        READ TABLE l_return INTO ls_return WITH KEY type = 'E'.
        IF sy-subrc EQ 0.
          message = ls_return-message.
          PERFORM delete_bp USING c_partner.   "Borra el BP creado en caso de error.
          PERFORM delete_bp USING l_partner.   "Borra el BP creado en caso de error.
          CLEAR: vendor.
          EXIT.
        ENDIF.
      ENDIF.

*      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
*        EXPORTING
*          wait = 'X'.
    ENDIF.

* Agrega persona de contacto 3

    l_CENTRALDATAPERSON-firstname = ls_load_vendor-namev3.
    l_CENTRALDATAPERSON-lastname = '.'.
    l_CENTRALDATAPERSON-birthname = ls_load_vendor-name13.

    CLEAR: l_centraldata, l_return, ls_return.

*    CALL FUNCTION 'BAPI_BUPA_CREATE_FROM_DATA'
*      EXPORTING
**       BUSINESSPARTNEREXTERN              =
*        partnercategory   = '1'
**       PARTNERGROUP      = '0001'
*        centraldata       = l_centraldata
*        centraldataperson = l_CENTRALDATAPERSON
*      IMPORTING
*        businesspartner   = c_partner
*      TABLES
*        return            = l_return.
*
*    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
*      EXPORTING
*        wait = 'X'.
    zcl_bapi_bupa_create_from_data=>bapi_bupa_create_from_data( EXPORTING i_partnercat = '1'
                                                                          i_partnergroup = l_partnergroup
                                                                          i_centraldata = l_centraldata
                                                                          i_centraldataperson = l_centraldataperson
                                                                IMPORTING e_partner = c_partner
                                                                          et_return = l_return ).

    IF NOT l_return[] IS INITIAL.
      READ TABLE l_return INTO ls_return WITH KEY type = 'E'.
      IF sy-subrc EQ 0.
        message = ls_return-message.
        PERFORM delete_bp USING c_partner.   "Borra el BP creado en caso de error.
        PERFORM delete_bp USING l_partner.   "Borra el BP creado en caso de error.
        CLEAR: vendor.
        EXIT.
      ENDIF.
    ENDIF.

    IF NOT c_partner IS INITIAL.
      CLEAR: l_return, ls_return.

*   Crea relación de persona de contacto
      c_centraldata-function   = ls_load_vendor-pafkt3.
      c_centraldata-department = ls_load_vendor-bukrs.
      c_centraldata-e_mail     = ls_load_vendor-smtpadr3.

*      CALL FUNCTION 'BAPI_BUPR_CONTP_CREATE'
*        EXPORTING
*          businesspartner     = l_partner
*          contactperson       = c_partner
*          validfromdate       = sy-datum
*          validuntildate      = '99991231'
*          defaultrelationship = 'X'
*          centraldata         = c_centraldata
**         ADDRESSDATA         =
**         DUPLICATE_MESSAGE_TYPE   =
*        TABLES
*          return              = l_return.
      zcl_bapi_bupa_create_from_data=>bapi_bupr_contp_create( EXPORTING i_partner = l_partner
                                                                        i_contactperson = c_partner
                                                                        i_validfrom = sy-datum
                                                                        i_validto = '99991231'
                                                                        i_default = 'X'
                                                                        i_centraldata = c_centraldata
                                                              IMPORTING et_return = l_return ).
      IF NOT l_return[] IS INITIAL.
        READ TABLE l_return INTO ls_return WITH KEY type = 'E'.
        IF sy-subrc EQ 0.
          message = ls_return-message.
          PERFORM delete_bp USING c_partner.   "Borra el BP creado en caso de error.
          PERFORM delete_bp USING l_partner.   "Borra el BP creado en caso de error.
          CLEAR: vendor.
          EXIT.
        ENDIF.
      ENDIF.

*      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
*        EXPORTING
*          wait = 'X'.
    ENDIF.

    CLEAR: l_return, ls_return.
*   Agrega Roles
    l_role = 'FLVN00'. "proveedor (contabilidad financiera)

*    CALL FUNCTION 'BAPI_BUPA_ROLE_ADD'
*      EXPORTING
*        businesspartner     = l_partner
*        businesspartnerrole = l_role
**       DIFFERENTIATIONTYPEVALUE      =
*      TABLES
*        return              = l_return.
*
*    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
*      EXPORTING
*        wait = 'X'.
    zcl_bapi_bupa_create_from_data=>bapi_bupa_role_add( EXPORTING i_partner = l_partner
                                                                  i_role = l_role
                                                        IMPORTING et_return = l_return ).

    l_role = 'FLVN01'. " vista de compras del proveedor

*    CALL FUNCTION 'BAPI_BUPA_ROLE_ADD'
*      EXPORTING
*        businesspartner     = l_partner
*        businesspartnerrole = l_role
**       DIFFERENTIATIONTYPEVALUE      =
*      TABLES
*        return              = l_return.
*
*    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
*      EXPORTING
*        wait = 'X'.
    zcl_bapi_bupa_create_from_data=>bapi_bupa_role_add( EXPORTING i_partner = l_partner
                                                                  i_role = l_role
                                                        IMPORTING et_return = l_return ).


*    CLEAR: l_return, ls_vendor, ls_purchase_data, ls_return, lt_functions, lt_vendor.
*
*    ls_vendor-header-object_instance-lifnr = l_partner.
*    ls_vendor-header-object_task  = 'U'. " I Crear/U Modif/D
*    ls_purchase_data-current_state = space.
*    ls_vendor-central_data-central-data-ktokk =  ls_load_vendor-ktokk.
*    ls_vendor-central_data-central-datax-ktokk = 'X'.
*
*    IF NOT ls_load_vendor-comsize IS INITIAL.
*      ls_vendor-central_data-central-datax-comsize = 'X'.
*      ls_vendor-central_data-central-data-comsize = ls_load_vendor-comsize.
*    ENDIF.
*
*    ls_company-task           = 'I'.
*    ls_company-data_key-bukrs = ls_load_vendor-bukrs.
*
*    IF NOT ls_load_vendor-akont IS INITIAL.  ls_company-data-akont  = ls_load_vendor-akont.  ls_company-datax-akont  =  'X'.  ENDIF.
*    IF NOT ls_load_vendor-zuawa IS INITIAL.  ls_company-data-zuawa  = ls_load_vendor-zuawa.  ls_company-datax-zuawa  =  'X'.  ENDIF.
*    IF NOT ls_load_vendor-zwels IS INITIAL.  ls_company-data-zwels  = ls_load_vendor-zwels.  ls_company-datax-zwels  =  'X'.  ENDIF.
*    IF NOT ls_load_vendor-zterm IS INITIAL.  ls_company-data-zterm  = ls_load_vendor-zterm.  ls_company-datax-zterm  =  'X'.  ENDIF.
*    IF NOT ls_load_vendor-fdgrv IS INITIAL.  ls_company-data-fdgrv  = ls_load_vendor-fdgrv.  ls_company-datax-fdgrv  =  'X'.  ENDIF.
*    IF NOT ls_load_vendor-altkn IS INITIAL.  ls_company-data-altkn  = ls_load_vendor-altkn.  ls_company-datax-altkn  =  'X'.  ENDIF.
*    IF NOT ls_load_vendor-hbkid IS INITIAL.  ls_company-data-hbkid  = ls_load_vendor-hbkid.  ls_company-datax-hbkid  =  'X'.  ENDIF.
*    IF NOT ls_load_vendor-webtr IS INITIAL.  ls_company-data-webtr  = ls_load_vendor-webtr.  ls_company-datax-webtr  =  'X'.  ENDIF.
*    IF NOT ls_load_vendor-reprf IS INITIAL.  ls_company-data-reprf  = ls_load_vendor-reprf.  ls_company-datax-reprf  =  'X'.  ENDIF.
*    IF NOT ls_load_vendor-qland IS INITIAL.  ls_company-data-qland  = ls_load_vendor-qland.  ls_company-datax-qland  =  'X'.  ENDIF.
*
*    APPEND ls_company TO ls_vendor-company_data-company.
*
*    ls_purchase-task = 'I' .
*    ls_purchase-data_key-ekorg = ls_load_vendor-ekorg.
*    ls_purchase-functions-current_state = space.
*
*    IF NOT ls_load_vendor-waers  IS INITIAL. ls_purchase-data-waers = ls_load_vendor-waers.  ls_purchase-datax-waers = 'X'.   ENDIF.
*    IF NOT ls_load_vendor-verkf  IS INITIAL. ls_purchase-data-verkf = ls_load_vendor-verkf.  ls_purchase-datax-verkf = 'X'.   ENDIF.
*    IF NOT ls_load_vendor-telf1  IS INITIAL. ls_purchase-data-telf1 = ls_load_vendor-telf1.  ls_purchase-datax-telf1 = 'X'.   ENDIF.
*    IF NOT ls_load_vendor-zterm2 IS INITIAL. ls_purchase-data-zterm = ls_load_vendor-zterm2. ls_purchase-datax-zterm = 'X'.   ENDIF.
*    IF NOT ls_load_vendor-inco1  IS INITIAL. ls_purchase-data-inco1 = ls_load_vendor-inco1.  ls_purchase-datax-inco1 = 'X'.   ENDIF.
*    IF NOT ls_load_vendor-inco2  IS INITIAL. ls_purchase-data-inco2 = ls_load_vendor-inco2.  ls_purchase-datax-inco2 = 'X'.   ENDIF.
*    IF NOT ls_load_vendor-webre  IS INITIAL. ls_purchase-data-webre = ls_load_vendor-webre.  ls_purchase-datax-webre = 'X'.   ENDIF.
*    IF NOT ls_load_vendor-lebre  IS INITIAL. ls_purchase-data-lebre = ls_load_vendor-lebre.  ls_purchase-datax-lebre = 'X'.   ENDIF.
*    IF NOT ls_load_vendor-kzaut  IS INITIAL. ls_purchase-data-kzaut = ls_load_vendor-kzaut.  ls_purchase-datax-kzaut = 'X'.   ENDIF.
*
*    CLEAR ls_function.
*    ls_function-task  = 'I'.
*    ls_function-data_key-parvw = 'LF'.
*    ls_function-data-partner   = l_partner.
**   ls_function-datax-partner  = 'X'.
*    APPEND ls_function TO lt_functions.
*
*    ls_function-task  = 'I'.
*    ls_function-data_key-parvw = 'RS'.
*    ls_function-data-partner   = l_partner.
*    APPEND ls_function TO lt_functions.
*
*    ls_purchase-functions-functions = lt_functions[].
*    APPEND ls_purchase TO lt_purchase.
*
*    ls_purchase_data-purchasing[]  = lt_purchase[].
*    ls_vendor-purchasing_data = ls_purchase_data.
*    APPEND ls_vendor TO lt_vendor.
*
*
*    ls_master_data-vendors = lt_vendor[].

*    vmd_ei_api=>initialize( ).
*    vmd_ei_api=>lock( iv_lifnr = ls_vendor-header-object_instance-lifnr ).
*
*   Agrega la info de compras
*    CALL METHOD vmd_ei_api=>maintain_bapi
*      EXPORTING
*        iv_test_run              = space
**       IV_COLLECT_MESSAGES      = SPACE
*        is_master_data           = ls_master_data
*      IMPORTING
*        es_master_data_correct   = ls_master_data_correct
*        es_message_correct       = ls_message_correct
*        es_master_data_defective = ls_master_data_defective
*        es_message_defective     = ls_message_defective.
*
**    IF LS_MESSAGE_DEFECTIVE IS INITIAL.
*    COMMIT WORK.
**    ENDIF.
*
*    LOOP AT ls_message_defective-messages INTO DATA(wa).
*      IF wa-type EQ 'E'.
*        PERFORM delete_bp USING l_partner.   "Borra el BP creado en caso de error.
*        CLEAR: vendor.
*      ENDIF.
*      message  = wa-message.
*    ENDLOOP.
*
*    IF NOT vendor IS INITIAL.
*      vmd_ei_api=>unlock( iv_lifnr = ls_vendor-header-object_instance-lifnr ).
*    ENDIF.

    zcl_maintain_cbapi=>maintain_bapi( EXPORTING i_load_vendor = ls_load_vendor
                                                 i_partner = l_partner
                                       IMPORTING e_vendor = vendor
                                                 e_message = message ).

  ENDLOOP.


**loop at LOAD_VENDOR.
**    move-corresponding LOAD_VENDOR to arch_dat.
**
***- Asigna numero de proveedor
**   PERFORM get_vendor.
**
***- Crea datos generales del proveedor
**   PERFORM datos_generales.
***- Crea datos de sociedad
**   PERFORM datos_sociedad.
***- Crea datos de compras
**   PERFORM datos_compras.
***-
**   if l_mess is initial.
**   PERFORM bdc_transaction USING 'XK01'.
**   else.
**     l_subrc = 4.
**   endif.
**
**   message = l_mess.
**
**   check l_subrc eq 0.
**   VENDOR = arch_dat-lifnr.
**endloop.

ENDFUNCTION.
