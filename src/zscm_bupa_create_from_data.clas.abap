"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>ZFM_BAPI_BUPA_CREATE_FROM_DATA_SRV</em>
CLASS zscm_bupa_create_from_data DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">addressData</p>
      BEGIN OF tys_address_data,
        "! <em>Key property</em> DateTime
        date_time        TYPE string,
        "! Standardaddress
        standardaddress  TYPE abap_bool,
        "! COName
        coname           TYPE c LENGTH 40,
        "! City
        city             TYPE c LENGTH 40,
        "! District
        district         TYPE c LENGTH 40,
        "! Regiogroup
        regiogroup       TYPE c LENGTH 8,
        "! PostlCod1
        postl_cod_1      TYPE c LENGTH 10,
        "! PostlCod2
        postl_cod_2      TYPE c LENGTH 10,
        "! PostlCod3
        postl_cod_3      TYPE c LENGTH 10,
        "! Pcode1Ext
        pcode_1_ext      TYPE c LENGTH 10,
        "! Pcode2Ext
        pcode_2_ext      TYPE c LENGTH 10,
        "! Pcode3Ext
        pcode_3_ext      TYPE c LENGTH 10,
        "! PoBox
        po_box           TYPE c LENGTH 10,
        "! PoWONo
        po_wono          TYPE abap_bool,
        "! PoBoxCit
        po_box_cit       TYPE c LENGTH 40,
        "! PoBoxReg
        po_box_reg       TYPE c LENGTH 3,
        "! PoboxCtry
        pobox_ctry       TYPE c LENGTH 3,
        "! PoCtryiso
        po_ctryiso       TYPE c LENGTH 2,
        "! Street
        street           TYPE c LENGTH 60,
        "! StrAbbr
        str_abbr         TYPE c LENGTH 2,
        "! HouseNo
        house_no         TYPE c LENGTH 10,
        "! HouseNo2
        house_no_2       TYPE c LENGTH 10,
        "! HouseNo3
        house_no_3       TYPE c LENGTH 10,
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
        "! RoomNo
        room_no          TYPE c LENGTH 10,
        "! Country
        country          TYPE c LENGTH 3,
        "! Countryiso
        countryiso       TYPE c LENGTH 2,
        "! Region
        region           TYPE c LENGTH 3,
        "! TimeZone
        time_zone        TYPE c LENGTH 6,
        "! Taxjurcode
        taxjurcode       TYPE c LENGTH 15,
        "! HomeCity
        home_city        TYPE c LENGTH 40,
        "! Transpzone
        transpzone       TYPE c LENGTH 10,
        "! Langu
        langu            TYPE c LENGTH 2,
        "! Languiso
        languiso         TYPE c LENGTH 2,
        "! CommType
        comm_type        TYPE c LENGTH 3,
        "! Extaddressnumber
        extaddressnumber TYPE c LENGTH 20,
        "! DontUseP
        dont_use_p       TYPE c LENGTH 4,
        "! DontUseS
        dont_use_s       TYPE c LENGTH 4,
        "! MoveDate
        move_date        TYPE timestampl,
        "! MoveAddress
        move_address     TYPE c LENGTH 10,
        "! Validfromdate
        validfromdate    TYPE timestampl,
        "! Validtodate
        validtodate      TYPE timestampl,
        "! MoveAddrGuid
        move_addr_guid   TYPE sysuuid_x16,
        "! CityNo
        city_no          TYPE c LENGTH 12,
        "! DistrctNo
        distrct_no       TYPE c LENGTH 8,
        "! Chckstatus
        chckstatus       TYPE c LENGTH 1,
        "! PboxcitNo
        pboxcit_no       TYPE c LENGTH 12,
        "! StreetNo
        street_no        TYPE c LENGTH 12,
        "! Homecityno
        homecityno       TYPE c LENGTH 12,
        "! PoBoxLobby
        po_box_lobby     TYPE c LENGTH 40,
        "! DeliServType
        deli_serv_type   TYPE c LENGTH 4,
        "! DeliServNumber
        deli_serv_number TYPE c LENGTH 10,
        "! County
        county           TYPE c LENGTH 40,
        "! CountyNo
        county_no        TYPE c LENGTH 8,
        "! Township
        township         TYPE c LENGTH 40,
        "! TownshipNo
        township_no      TYPE c LENGTH 8,
      END OF tys_address_data,
      "! <p class="shorttext synchronized">List of addressData</p>
      tyt_address_data TYPE STANDARD TABLE OF tys_address_data WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">centralData</p>
      BEGIN OF tys_central_data,
        "! <em>Key property</em> DateTime
        date_time            TYPE string,
        "! Searchterm1
        searchterm_1         TYPE c LENGTH 20,
        "! Searchterm2
        searchterm_2         TYPE c LENGTH 20,
        "! Partnertype
        partnertype          TYPE c LENGTH 4,
        "! Authorizationgroup
        authorizationgroup   TYPE c LENGTH 4,
        "! Partnerlanguage
        partnerlanguage      TYPE c LENGTH 2,
        "! Partnerlanguageiso
        partnerlanguageiso   TYPE c LENGTH 2,
        "! Dataorigintype
        dataorigintype       TYPE c LENGTH 4,
        "! Centralarchivingflag
        centralarchivingflag TYPE abap_bool,
        "! Centralblock
        centralblock         TYPE abap_bool,
        "! TitleKey
        title_key            TYPE c LENGTH 4,
        "! Contactallowance
        contactallowance     TYPE c LENGTH 1,
        "! Partnerexternal
        partnerexternal      TYPE c LENGTH 20,
        "! Titleletter
        titleletter          TYPE c LENGTH 50,
        "! Notreleased
        notreleased          TYPE abap_bool,
        "! CommType
        comm_type            TYPE c LENGTH 3,
        "! PrintMode
        print_mode           TYPE c LENGTH 1,
      END OF tys_central_data,
      "! <p class="shorttext synchronized">List of centralData</p>
      tyt_central_data TYPE STANDARD TABLE OF tys_central_data WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">centralDataOrganization</p>
      BEGIN OF tys_central_data_organizatio_2,
        "! <em>Key property</em> DateTime
        date_time       TYPE string,
        "! Name1
        name_1          TYPE c LENGTH 40,
        "! Name2
        name_2          TYPE c LENGTH 40,
        "! Name3
        name_3          TYPE c LENGTH 40,
        "! Name4
        name_4          TYPE c LENGTH 40,
        "! Legalform
        legalform       TYPE c LENGTH 2,
        "! Industrysector
        industrysector  TYPE c LENGTH 10,
        "! Foundationdate
        foundationdate  TYPE timestampl,
        "! Liquidationdate
        liquidationdate TYPE timestampl,
        "! LocNo1
        loc_no_1        TYPE c LENGTH 7,
        "! LocNo2
        loc_no_2        TYPE c LENGTH 5,
        "! ChkDigit
        chk_digit       TYPE c LENGTH 1,
        "! Legalorg
        legalorg        TYPE c LENGTH 2,
      END OF tys_central_data_organizatio_2,
      "! <p class="shorttext synchronized">List of centralDataOrganization</p>
      tyt_central_data_organizatio_2 TYPE STANDARD TABLE OF tys_central_data_organizatio_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">centralDataPerson</p>
      BEGIN OF tys_central_data_person,
        "! <em>Key property</em> DateTime
        date_time             TYPE string,
        "! Firstname
        firstname             TYPE c LENGTH 40,
        "! Lastname
        lastname              TYPE c LENGTH 40,
        "! Birthname
        birthname             TYPE c LENGTH 40,
        "! Middlename
        middlename            TYPE c LENGTH 40,
        "! Secondname
        secondname            TYPE c LENGTH 40,
        "! TitleAca1
        title_aca_1           TYPE c LENGTH 4,
        "! TitleAca2
        title_aca_2           TYPE c LENGTH 4,
        "! TitleSppl
        title_sppl            TYPE c LENGTH 4,
        "! Prefix1
        prefix_1              TYPE c LENGTH 4,
        "! Prefix2
        prefix_2              TYPE c LENGTH 4,
        "! Nickname
        nickname              TYPE c LENGTH 40,
        "! Initials
        initials              TYPE c LENGTH 10,
        "! Nameformat
        nameformat            TYPE c LENGTH 2,
        "! Namcountry
        namcountry            TYPE c LENGTH 3,
        "! Namcountryiso
        namcountryiso         TYPE c LENGTH 2,
        "! Sex
        sex                   TYPE c LENGTH 1,
        "! Birthplace
        birthplace            TYPE c LENGTH 40,
        "! Birthdate
        birthdate             TYPE timestampl,
        "! Deathdate
        deathdate             TYPE timestampl,
        "! Maritalstatus
        maritalstatus         TYPE c LENGTH 1,
        "! Correspondlanguage
        correspondlanguage    TYPE c LENGTH 2,
        "! Correspondlanguageiso
        correspondlanguageiso TYPE c LENGTH 2,
        "! Fullname
        fullname              TYPE c LENGTH 80,
        "! Employer
        employer              TYPE c LENGTH 35,
        "! Occupation
        occupation            TYPE c LENGTH 4,
        "! Nationality
        nationality           TYPE c LENGTH 3,
        "! Nationalityiso
        nationalityiso        TYPE c LENGTH 2,
        "! Countryorigin
        countryorigin         TYPE c LENGTH 3,
        "! BirthdtStatus
        birthdt_status        TYPE c LENGTH 1,
        "! Gender
        gender                TYPE c LENGTH 1,
      END OF tys_central_data_person,
      "! <p class="shorttext synchronized">List of centralDataPerson</p>
      tyt_central_data_person TYPE STANDARD TABLE OF tys_central_data_person WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">emailData</p>
      BEGIN OF tys_email_data,
        "! <em>Key property</em> DateTime
        date_time  TYPE string,
        "! StdNo
        std_no     TYPE abap_bool,
        "! EMail
        email      TYPE c LENGTH 241,
        "! EmailSrch
        email_srch TYPE c LENGTH 20,
        "! StdRecip
        std_recip  TYPE abap_bool,
        "! R3User
        r_3_user   TYPE abap_bool,
        "! Encode
        encode     TYPE c LENGTH 1,
        "! Tnef
        tnef       TYPE abap_bool,
        "! HomeFlag
        home_flag  TYPE abap_bool,
        "! Consnumber
        consnumber TYPE c LENGTH 3,
        "! Errorflag
        errorflag  TYPE abap_bool,
        "! FlgNouse
        flg_nouse  TYPE abap_bool,
        "! ValidFrom
        valid_from TYPE c LENGTH 14,
        "! ValidTo
        valid_to   TYPE c LENGTH 14,
      END OF tys_email_data,
      "! <p class="shorttext synchronized">List of emailData</p>
      tyt_email_data TYPE STANDARD TABLE OF tys_email_data WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">faxData</p>
      BEGIN OF tys_fax_data,
        "! <em>Key property</em> DateTime
        date_time  TYPE string,
        "! Country
        country    TYPE c LENGTH 3,
        "! Countryiso
        countryiso TYPE c LENGTH 2,
        "! StdNo
        std_no     TYPE abap_bool,
        "! Fax
        fax        TYPE c LENGTH 30,
        "! Extension
        extension  TYPE c LENGTH 10,
        "! FaxNo
        fax_no     TYPE c LENGTH 30,
        "! SenderNo
        sender_no  TYPE c LENGTH 30,
        "! FaxGroup
        fax_group  TYPE c LENGTH 1,
        "! StdRecip
        std_recip  TYPE abap_bool,
        "! R3User
        r_3_user   TYPE abap_bool,
        "! HomeFlag
        home_flag  TYPE abap_bool,
        "! Consnumber
        consnumber TYPE c LENGTH 3,
        "! Errorflag
        errorflag  TYPE abap_bool,
        "! FlgNouse
        flg_nouse  TYPE abap_bool,
        "! ValidFrom
        valid_from TYPE c LENGTH 14,
        "! ValidTo
        valid_to   TYPE c LENGTH 14,
      END OF tys_fax_data,
      "! <p class="shorttext synchronized">List of faxData</p>
      tyt_fax_data TYPE STANDARD TABLE OF tys_fax_data WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">header</p>
      BEGIN OF tys_header,
        "! <em>Key property</em> DateTime
        date_time TYPE string,
        "! Bpartner
        bpartner  TYPE c LENGTH 10,
        "! PartnCat
        partn_cat TYPE c LENGTH 1,
        "! PartnGrp
        partn_grp TYPE c LENGTH 4,
      END OF tys_header,
      "! <p class="shorttext synchronized">List of header</p>
      tyt_header TYPE STANDARD TABLE OF tys_header WITH DEFAULT KEY.

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
      "! <p class="shorttext synchronized">telefonData</p>
      BEGIN OF tys_telefon_data,
        "! <em>Key property</em> DateTime
        date_time  TYPE string,
        "! Country
        country    TYPE c LENGTH 3,
        "! Countryiso
        countryiso TYPE c LENGTH 2,
        "! StdNo
        std_no     TYPE abap_bool,
        "! Telephone
        telephone  TYPE c LENGTH 30,
        "! Extension
        extension  TYPE c LENGTH 10,
        "! TelNo
        tel_no     TYPE c LENGTH 30,
        "! CallerNo
        caller_no  TYPE c LENGTH 30,
        "! StdRecip
        std_recip  TYPE c LENGTH 1,
        "! R3User
        r_3_user   TYPE c LENGTH 1,
        "! HomeFlag
        home_flag  TYPE abap_bool,
        "! Consnumber
        consnumber TYPE c LENGTH 3,
        "! Errorflag
        errorflag  TYPE abap_bool,
        "! FlgNouse
        flg_nouse  TYPE abap_bool,
        "! ValidFrom
        valid_from TYPE c LENGTH 14,
        "! ValidTo
        valid_to   TYPE c LENGTH 14,
      END OF tys_telefon_data,
      "! <p class="shorttext synchronized">List of telefonData</p>
      tyt_telefon_data TYPE STANDARD TABLE OF tys_telefon_data WITH DEFAULT KEY.

    TYPES: BEGIN OF ty_deep,
             date_time                 TYPE string,
             "! Bpartner
             bpartner                  TYPE c LENGTH 10,
             "! PartnCat
             partn_cat                 TYPE c LENGTH 1,
             "! PartnGrp
             partn_grp                 TYPE c LENGTH 4,
             headertocentraldata       TYPE TABLE OF tys_central_data WITH DEFAULT KEY,
             headertocentraldataperson TYPE TABLE OF tys_central_data_person WITH DEFAULT KEY,
             headertocentraldataorg    TYPE TABLE OF tys_central_data_organizatio_2 WITH DEFAULT KEY,
             headertoaddressdata       TYPE TABLE OF tys_address_data WITH DEFAULT KEY,
             headertotelefondata       TYPE TABLE OF tys_telefon_data WITH DEFAULT KEY,
             headertofaxdata           TYPE TABLE OF tys_fax_data WITH DEFAULT KEY,
             headertoemaildata         TYPE TABLE OF tys_email_data WITH DEFAULT KEY,
             headertoreturn            TYPE TABLE OF tys_return WITH DEFAULT KEY,
           END OF ty_deep.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! addressDataSet
        "! <br/> Collection of type 'addressData'
        address_data_set          TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'ADDRESS_DATA_SET',
        "! centralDataOrganizationSet
        "! <br/> Collection of type 'centralDataOrganization'
        central_data_organization TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'CENTRAL_DATA_ORGANIZATION',
        "! centralDataPersonSet
        "! <br/> Collection of type 'centralDataPerson'
        central_data_person_set   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'CENTRAL_DATA_PERSON_SET',
        "! centralDataSet
        "! <br/> Collection of type 'centralData'
        central_data_set          TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'CENTRAL_DATA_SET',
        "! emailDataSet
        "! <br/> Collection of type 'emailData'
        email_data_set            TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'EMAIL_DATA_SET',
        "! faxDataSet
        "! <br/> Collection of type 'faxData'
        fax_data_set              TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'FAX_DATA_SET',
        "! headerSet
        "! <br/> Collection of type 'header'
        header_set                TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'HEADER_SET',
        "! returnSet
        "! <br/> Collection of type 'return'
        return_set                TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'RETURN_SET',
        "! telefonDataSet
        "! <br/> Collection of type 'telefonData'
        telefon_data_set          TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'TELEFON_DATA_SET',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for addressData</p>
        "! See also structure type {@link ..tys_address_data}
        BEGIN OF address_data,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF address_data,
        "! <p class="shorttext synchronized">Internal names for centralData</p>
        "! See also structure type {@link ..tys_central_data}
        BEGIN OF central_data,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF central_data,
        "! <p class="shorttext synchronized">Internal names for centralDataOrganization</p>
        "! See also structure type {@link ..tys_central_data_organizatio_2}
        BEGIN OF central_data_organizatio_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF central_data_organizatio_2,
        "! <p class="shorttext synchronized">Internal names for centralDataPerson</p>
        "! See also structure type {@link ..tys_central_data_person}
        BEGIN OF central_data_person,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF central_data_person,
        "! <p class="shorttext synchronized">Internal names for emailData</p>
        "! See also structure type {@link ..tys_email_data}
        BEGIN OF email_data,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF email_data,
        "! <p class="shorttext synchronized">Internal names for faxData</p>
        "! See also structure type {@link ..tys_fax_data}
        BEGIN OF fax_data,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF fax_data,
        "! <p class="shorttext synchronized">Internal names for header</p>
        "! See also structure type {@link ..tys_header}
        BEGIN OF header,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! HEADERTOADDRESSDATA
            headertoaddressdata       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOADDRESSDATA',
            "! HEADERTOCENTRALDATA
            headertocentraldata       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOCENTRALDATA',
            "! HEADERTOCENTRALDATAORG
            headertocentraldataorg    TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOCENTRALDATAORG',
            "! HEADERTOCENTRALDATAPERSON
            headertocentraldataperson TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOCENTRALDATAPERSON',
            "! HEADERTOEMAILDATA
            headertoemaildata         TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOEMAILDATA',
            "! HEADERTOFAXDATA
            headertofaxdata           TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOFAXDATA',
            "! HEADERTORETURN
            headertoreturn            TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTORETURN',
            "! HEADERTOTELEFONDATA
            headertotelefondata       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'HEADERTOTELEFONDATA',
          END OF navigation,
        END OF header,
        "! <p class="shorttext synchronized">Internal names for return</p>
        "! See also structure type {@link ..tys_return}
        BEGIN OF return,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF return,
        "! <p class="shorttext synchronized">Internal names for telefonData</p>
        "! See also structure type {@link ..tys_telefon_data}
        BEGIN OF telefon_data,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF telefon_data,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define addressData</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_address_data RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define centralData</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_central_data RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define centralDataOrganization</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_central_data_organizatio_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define centralDataPerson</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_central_data_person RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define emailData</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_email_data RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define faxData</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_fax_data RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define header</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_header RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define return</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_return RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define telefonData</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_telefon_data RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSCM_BUPA_CREATE_FROM_DATA IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'ZFM_BAPI_BUPA_CREATE_FROM_DATA_SRV' ) ##NO_TEXT.

    def_address_data( ).
    def_central_data( ).
    def_central_data_organizatio_2( ).
    def_central_data_person( ).
    def_email_data( ).
    def_fax_data( ).
    def_header( ).
    def_return( ).
    def_telefon_data( ).

  ENDMETHOD.


  METHOD def_address_data.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'ADDRESS_DATA'
                                    is_structure              = VALUE tys_address_data( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'addressData' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'ADDRESS_DATA_SET' ).
    lo_entity_set->set_edm_name( 'addressDataSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STANDARDADDRESS' ).
    lo_primitive_property->set_edm_name( 'Standardaddress' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONAME' ).
    lo_primitive_property->set_edm_name( 'COName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CITY' ).
    lo_primitive_property->set_edm_name( 'City' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISTRICT' ).
    lo_primitive_property->set_edm_name( 'District' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REGIOGROUP' ).
    lo_primitive_property->set_edm_name( 'Regiogroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSTL_COD_1' ).
    lo_primitive_property->set_edm_name( 'PostlCod1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSTL_COD_2' ).
    lo_primitive_property->set_edm_name( 'PostlCod2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSTL_COD_3' ).
    lo_primitive_property->set_edm_name( 'PostlCod3' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_WONO' ).
    lo_primitive_property->set_edm_name( 'PoWONo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_BOX_CIT' ).
    lo_primitive_property->set_edm_name( 'PoBoxCit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_BOX_REG' ).
    lo_primitive_property->set_edm_name( 'PoBoxReg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX_CTRY' ).
    lo_primitive_property->set_edm_name( 'PoboxCtry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PO_CTRYISO' ).
    lo_primitive_property->set_edm_name( 'PoCtryiso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET' ).
    lo_primitive_property->set_edm_name( 'Street' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STR_ABBR' ).
    lo_primitive_property->set_edm_name( 'StrAbbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSE_NO' ).
    lo_primitive_property->set_edm_name( 'HouseNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSE_NO_2' ).
    lo_primitive_property->set_edm_name( 'HouseNo2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSE_NO_3' ).
    lo_primitive_property->set_edm_name( 'HouseNo3' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROOM_NO' ).
    lo_primitive_property->set_edm_name( 'RoomNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTRY' ).
    lo_primitive_property->set_edm_name( 'Country' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTRYISO' ).
    lo_primitive_property->set_edm_name( 'Countryiso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REGION' ).
    lo_primitive_property->set_edm_name( 'Region' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TIME_ZONE' ).
    lo_primitive_property->set_edm_name( 'TimeZone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAXJURCODE' ).
    lo_primitive_property->set_edm_name( 'Taxjurcode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOME_CITY' ).
    lo_primitive_property->set_edm_name( 'HomeCity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANSPZONE' ).
    lo_primitive_property->set_edm_name( 'Transpzone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANGU' ).
    lo_primitive_property->set_edm_name( 'Langu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANGUISO' ).
    lo_primitive_property->set_edm_name( 'Languiso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMM_TYPE' ).
    lo_primitive_property->set_edm_name( 'CommType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTADDRESSNUMBER' ).
    lo_primitive_property->set_edm_name( 'Extaddressnumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DONT_USE_P' ).
    lo_primitive_property->set_edm_name( 'DontUseP' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DONT_USE_S' ).
    lo_primitive_property->set_edm_name( 'DontUseS' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MOVE_DATE' ).
    lo_primitive_property->set_edm_name( 'MoveDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MOVE_ADDRESS' ).
    lo_primitive_property->set_edm_name( 'MoveAddress' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALIDFROMDATE' ).
    lo_primitive_property->set_edm_name( 'Validfromdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALIDTODATE' ).
    lo_primitive_property->set_edm_name( 'Validtodate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MOVE_ADDR_GUID' ).
    lo_primitive_property->set_edm_name( 'MoveAddrGuid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CITY_NO' ).
    lo_primitive_property->set_edm_name( 'CityNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISTRCT_NO' ).
    lo_primitive_property->set_edm_name( 'DistrctNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHCKSTATUS' ).
    lo_primitive_property->set_edm_name( 'Chckstatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PBOXCIT_NO' ).
    lo_primitive_property->set_edm_name( 'PboxcitNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_NO' ).
    lo_primitive_property->set_edm_name( 'StreetNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOMECITYNO' ).
    lo_primitive_property->set_edm_name( 'Homecityno' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTY' ).
    lo_primitive_property->set_edm_name( 'County' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTY_NO' ).
    lo_primitive_property->set_edm_name( 'CountyNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOWNSHIP' ).
    lo_primitive_property->set_edm_name( 'Township' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOWNSHIP_NO' ).
    lo_primitive_property->set_edm_name( 'TownshipNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_central_data.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'CENTRAL_DATA'
                                    is_structure              = VALUE tys_central_data( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'centralData' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'CENTRAL_DATA_SET' ).
    lo_entity_set->set_edm_name( 'centralDataSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SEARCHTERM_1' ).
    lo_primitive_property->set_edm_name( 'Searchterm1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SEARCHTERM_2' ).
    lo_primitive_property->set_edm_name( 'Searchterm2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNERTYPE' ).
    lo_primitive_property->set_edm_name( 'Partnertype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUTHORIZATIONGROUP' ).
    lo_primitive_property->set_edm_name( 'Authorizationgroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNERLANGUAGE' ).
    lo_primitive_property->set_edm_name( 'Partnerlanguage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNERLANGUAGEISO' ).
    lo_primitive_property->set_edm_name( 'Partnerlanguageiso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATAORIGINTYPE' ).
    lo_primitive_property->set_edm_name( 'Dataorigintype' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CENTRALARCHIVINGFLAG' ).
    lo_primitive_property->set_edm_name( 'Centralarchivingflag' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CENTRALBLOCK' ).
    lo_primitive_property->set_edm_name( 'Centralblock' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TITLE_KEY' ).
    lo_primitive_property->set_edm_name( 'TitleKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTACTALLOWANCE' ).
    lo_primitive_property->set_edm_name( 'Contactallowance' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNEREXTERNAL' ).
    lo_primitive_property->set_edm_name( 'Partnerexternal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TITLELETTER' ).
    lo_primitive_property->set_edm_name( 'Titleletter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NOTRELEASED' ).
    lo_primitive_property->set_edm_name( 'Notreleased' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMM_TYPE' ).
    lo_primitive_property->set_edm_name( 'CommType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRINT_MODE' ).
    lo_primitive_property->set_edm_name( 'PrintMode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_central_data_organizatio_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'CENTRAL_DATA_ORGANIZATIO_2'
                                    is_structure              = VALUE tys_central_data_organizatio_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'centralDataOrganization' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'CENTRAL_DATA_ORGANIZATION' ).
    lo_entity_set->set_edm_name( 'centralDataOrganizationSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LEGALFORM' ).
    lo_primitive_property->set_edm_name( 'Legalform' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INDUSTRYSECTOR' ).
    lo_primitive_property->set_edm_name( 'Industrysector' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FOUNDATIONDATE' ).
    lo_primitive_property->set_edm_name( 'Foundationdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LIQUIDATIONDATE' ).
    lo_primitive_property->set_edm_name( 'Liquidationdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOC_NO_1' ).
    lo_primitive_property->set_edm_name( 'LocNo1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOC_NO_2' ).
    lo_primitive_property->set_edm_name( 'LocNo2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHK_DIGIT' ).
    lo_primitive_property->set_edm_name( 'ChkDigit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LEGALORG' ).
    lo_primitive_property->set_edm_name( 'Legalorg' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_central_data_person.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'CENTRAL_DATA_PERSON'
                                    is_structure              = VALUE tys_central_data_person( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'centralDataPerson' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'CENTRAL_DATA_PERSON_SET' ).
    lo_entity_set->set_edm_name( 'centralDataPersonSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIRSTNAME' ).
    lo_primitive_property->set_edm_name( 'Firstname' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LASTNAME' ).
    lo_primitive_property->set_edm_name( 'Lastname' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BIRTHNAME' ).
    lo_primitive_property->set_edm_name( 'Birthname' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MIDDLENAME' ).
    lo_primitive_property->set_edm_name( 'Middlename' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SECONDNAME' ).
    lo_primitive_property->set_edm_name( 'Secondname' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TITLE_SPPL' ).
    lo_primitive_property->set_edm_name( 'TitleSppl' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NAMCOUNTRYISO' ).
    lo_primitive_property->set_edm_name( 'Namcountryiso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SEX' ).
    lo_primitive_property->set_edm_name( 'Sex' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BIRTHPLACE' ).
    lo_primitive_property->set_edm_name( 'Birthplace' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BIRTHDATE' ).
    lo_primitive_property->set_edm_name( 'Birthdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEATHDATE' ).
    lo_primitive_property->set_edm_name( 'Deathdate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MARITALSTATUS' ).
    lo_primitive_property->set_edm_name( 'Maritalstatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORRESPONDLANGUAGE' ).
    lo_primitive_property->set_edm_name( 'Correspondlanguage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORRESPONDLANGUAGEISO' ).
    lo_primitive_property->set_edm_name( 'Correspondlanguageiso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FULLNAME' ).
    lo_primitive_property->set_edm_name( 'Fullname' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMPLOYER' ).
    lo_primitive_property->set_edm_name( 'Employer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OCCUPATION' ).
    lo_primitive_property->set_edm_name( 'Occupation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NATIONALITY' ).
    lo_primitive_property->set_edm_name( 'Nationality' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NATIONALITYISO' ).
    lo_primitive_property->set_edm_name( 'Nationalityiso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTRYORIGIN' ).
    lo_primitive_property->set_edm_name( 'Countryorigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BIRTHDT_STATUS' ).
    lo_primitive_property->set_edm_name( 'BirthdtStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GENDER' ).
    lo_primitive_property->set_edm_name( 'Gender' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_email_data.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'EMAIL_DATA'
                                    is_structure              = VALUE tys_email_data( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'emailData' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'EMAIL_DATA_SET' ).
    lo_entity_set->set_edm_name( 'emailDataSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STD_NO' ).
    lo_primitive_property->set_edm_name( 'StdNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMAIL' ).
    lo_primitive_property->set_edm_name( 'EMail' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 241 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMAIL_SRCH' ).
    lo_primitive_property->set_edm_name( 'EmailSrch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STD_RECIP' ).
    lo_primitive_property->set_edm_name( 'StdRecip' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'R_3_USER' ).
    lo_primitive_property->set_edm_name( 'R3User' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENCODE' ).
    lo_primitive_property->set_edm_name( 'Encode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TNEF' ).
    lo_primitive_property->set_edm_name( 'Tnef' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOME_FLAG' ).
    lo_primitive_property->set_edm_name( 'HomeFlag' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONSNUMBER' ).
    lo_primitive_property->set_edm_name( 'Consnumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERRORFLAG' ).
    lo_primitive_property->set_edm_name( 'Errorflag' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLG_NOUSE' ).
    lo_primitive_property->set_edm_name( 'FlgNouse' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALID_FROM' ).
    lo_primitive_property->set_edm_name( 'ValidFrom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALID_TO' ).
    lo_primitive_property->set_edm_name( 'ValidTo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_fax_data.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'FAX_DATA'
                                    is_structure              = VALUE tys_fax_data( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'faxData' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'FAX_DATA_SET' ).
    lo_entity_set->set_edm_name( 'faxDataSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTRY' ).
    lo_primitive_property->set_edm_name( 'Country' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTRYISO' ).
    lo_primitive_property->set_edm_name( 'Countryiso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STD_NO' ).
    lo_primitive_property->set_edm_name( 'StdNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAX' ).
    lo_primitive_property->set_edm_name( 'Fax' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTENSION' ).
    lo_primitive_property->set_edm_name( 'Extension' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAX_NO' ).
    lo_primitive_property->set_edm_name( 'FaxNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SENDER_NO' ).
    lo_primitive_property->set_edm_name( 'SenderNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAX_GROUP' ).
    lo_primitive_property->set_edm_name( 'FaxGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STD_RECIP' ).
    lo_primitive_property->set_edm_name( 'StdRecip' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'R_3_USER' ).
    lo_primitive_property->set_edm_name( 'R3User' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOME_FLAG' ).
    lo_primitive_property->set_edm_name( 'HomeFlag' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONSNUMBER' ).
    lo_primitive_property->set_edm_name( 'Consnumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERRORFLAG' ).
    lo_primitive_property->set_edm_name( 'Errorflag' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLG_NOUSE' ).
    lo_primitive_property->set_edm_name( 'FlgNouse' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALID_FROM' ).
    lo_primitive_property->set_edm_name( 'ValidFrom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALID_TO' ).
    lo_primitive_property->set_edm_name( 'ValidTo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BPARTNER' ).
    lo_primitive_property->set_edm_name( 'Bpartner' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTN_CAT' ).
    lo_primitive_property->set_edm_name( 'PartnCat' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTN_GRP' ).
    lo_primitive_property->set_edm_name( 'PartnGrp' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOADDRESSDATA' ).
    lo_navigation_property->set_edm_name( 'HEADERTOADDRESSDATA' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'ADDRESS_DATA' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOCENTRALDATA' ).
    lo_navigation_property->set_edm_name( 'HEADERTOCENTRALDATA' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'CENTRAL_DATA' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOCENTRALDATAORG' ).
    lo_navigation_property->set_edm_name( 'HEADERTOCENTRALDATAORG' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'CENTRAL_DATA_ORGANIZATIO_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOCENTRALDATAPERSON' ).
    lo_navigation_property->set_edm_name( 'HEADERTOCENTRALDATAPERSON' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'CENTRAL_DATA_PERSON' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOEMAILDATA' ).
    lo_navigation_property->set_edm_name( 'HEADERTOEMAILDATA' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'EMAIL_DATA' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOFAXDATA' ).
    lo_navigation_property->set_edm_name( 'HEADERTOFAXDATA' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'FAX_DATA' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTORETURN' ).
    lo_navigation_property->set_edm_name( 'HEADERTORETURN' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'RETURN' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'HEADERTOTELEFONDATA' ).
    lo_navigation_property->set_edm_name( 'HEADERTOTELEFONDATA' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'TELEFON_DATA' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

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


  METHOD def_telefon_data.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'TELEFON_DATA'
                                    is_structure              = VALUE tys_telefon_data( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'telefonData' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'TELEFON_DATA_SET' ).
    lo_entity_set->set_edm_name( 'telefonDataSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'DateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTRY' ).
    lo_primitive_property->set_edm_name( 'Country' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTRYISO' ).
    lo_primitive_property->set_edm_name( 'Countryiso' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STD_NO' ).
    lo_primitive_property->set_edm_name( 'StdNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TELEPHONE' ).
    lo_primitive_property->set_edm_name( 'Telephone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXTENSION' ).
    lo_primitive_property->set_edm_name( 'Extension' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEL_NO' ).
    lo_primitive_property->set_edm_name( 'TelNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CALLER_NO' ).
    lo_primitive_property->set_edm_name( 'CallerNo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STD_RECIP' ).
    lo_primitive_property->set_edm_name( 'StdRecip' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'R_3_USER' ).
    lo_primitive_property->set_edm_name( 'R3User' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOME_FLAG' ).
    lo_primitive_property->set_edm_name( 'HomeFlag' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONSNUMBER' ).
    lo_primitive_property->set_edm_name( 'Consnumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ERRORFLAG' ).
    lo_primitive_property->set_edm_name( 'Errorflag' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLG_NOUSE' ).
    lo_primitive_property->set_edm_name( 'FlgNouse' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALID_FROM' ).
    lo_primitive_property->set_edm_name( 'ValidFrom' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALID_TO' ).
    lo_primitive_property->set_edm_name( 'ValidTo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.
ENDCLASS.
