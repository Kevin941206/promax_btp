FUNCTION zvts_po_deliv_address.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(PO_NUMBER) TYPE  EBELN
*"     VALUE(PO_ITEM) TYPE  EBELP
*"     VALUE(VENDOR) TYPE  LIFNR
*"     VALUE(LANGU) TYPE  SY-LANGU
*"  EXPORTING
*"     VALUE(MATERIAL) TYPE  MATNR
*"     VALUE(DESCRIPTION) TYPE  TXZ01
*"     VALUE(PURCHASER) TYPE  EKGRP
*"     VALUE(PUR_NAME) TYPE  CHAR18
*"     VALUE(D_NAME1) TYPE  ZNAME1
*"     VALUE(D_NAME2) TYPE  NAME2
*"     VALUE(D_STREET) TYPE  TEXT60
*"     VALUE(D_POST_CODE1) TYPE  PSTLZ
*"     VALUE(D_CITY1) TYPE  ZORT01
*"     VALUE(D_COUNTRY) TYPE  LAND1
*"     VALUE(D_REGION) TYPE  REGIO
*"     VALUE(D_TEL_NUMBER) TYPE  ZST_ADRC-TEL_NUMBER
*"     VALUE(D_FAX_NUMBER) TYPE  ZST_ADRC-FAX_NUMBER
*"     VALUE(DELIVERY_TO) TYPE  TEXT25
*"     VALUE(I_NAME1) TYPE  ZST_ADRC-NAME1
*"     VALUE(I_CITY) TYPE  ZST_ADRC-CITY1
*"     VALUE(I_STREET) TYPE  ZST_ADRC-STREET
*"     VALUE(I_DISTRICT) TYPE  ZST_ADRC-CITY2
*"     VALUE(I_TEL_NUMBER) TYPE  ZST_ADRC-TEL_NUMBER
*"     VALUE(I_POST_CODE) TYPE  ZST_ADRC-POST_CODE1
*"     VALUE(I_NAME2) TYPE  ZST_ADRC-NAME2
*"     VALUE(MAIL) TYPE  TEXT255
*"----------------------------------------------------------------------
  "t024-smtp_addr.
  DATA: prov(10), provc(10) TYPE n, dest(10), count TYPE sy-index.
*- remitir a
  DATA: w_NAME1      LIKE zst_adrc-name1,
        w_NAME2      LIKE zst_adrc-name1,
        w_STREET     LIKE zst_adrc-street,
        w_CITY1      LIKE zst_adrc-city1,
        w_POST_CODE1 LIKE zst_adrc-post_code1,
        w_STR_SUPPL1 LIKE zst_adrc-str_suppl1,
        w_COUNTRY    LIKE zst_adrc-country,
        w_REGION     LIKE zst_adrc-region,
        w_TEL1_NUMBR LIKE zst_adrc-tel_number.


  IF vendor CA 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
    prov = vendor.
  ELSE.
    provc = vendor.
    prov = provc.
  ENDIF.

*clear ekko.
*SELECT single statu bukrs ekgrp INTO (ekko-statu, ekko-bukrs, ekko-ekgrp)
*FROM  ekko
*WHERE ebeln EQ PO_NUMBER.
  zcl_qry_po_deliv_address=>ekko( EXPORTING i_operacion = 'READ'
                                            i_ebeln = po_number
                                  IMPORTING es_ekko = DATA(ls_ekko) ).

*clear ekpo.
*select single * from ekpo
*where ebeln eq PO_NUMBER
*and   ebelp eq PO_ITEM.
  zcl_qry_po_deliv_address=>ekpo( EXPORTING i_operacion = 'READ'
                                            i_ebeln = po_number
                                            i_ebelp = po_item
                                  IMPORTING es_ekpo = DATA(ls_ekpo) ).
  material    = ls_ekpo-matnr.
  description = ls_ekpo-txz01.

*clear EKKN.
*select single ABLAD into DELIVERY_TO from EKKN
*where ebeln eq ekpo-ebeln
*and   ebelp eq ekpo-ebelp.
  zcl_qry_po_list=>ekkn( EXPORTING i_operacion = 'READ'
                                         i_ebeln = ls_ekpo-ebeln
                                         i_ebelp = ls_ekpo-ebelp
                               IMPORTING e_ablad = delivery_to ).

  IF ls_ekpo-adrn2 IS NOT INITIAL.  "emlif
*   SELECT * FROM t001w
*   WHERE werks EQ ekpo-werks.
*   ENDSELECT.

*- dirección de entrega
*    select single * from adrc where addrnumber eq ekpo-adrn2.
    zcl_qry_po_deliv_address=>adrc( EXPORTING i_operacion = 'READ'
                                     i_adrn2 = ls_ekpo-adrn2
                           IMPORTING es_adrc = DATA(ls_adrc) ).
    IF sy-subrc EQ 0.
      d_name1      = ls_adrc-name1.
      d_name2      = ls_adrc-name2.
      CONCATENATE ls_adrc-street '/' ls_adrc-house_num1 INTO d_street.
      d_post_code1 = ls_adrc-post_code1.
      d_city1      = ls_adrc-city1.
      d_country    = ls_adrc-country.
      d_region     = ls_adrc-region.
      d_tel_number = ls_adrc-tel_number.
      d_fax_number = ls_adrc-fax_number.
    ENDIF.

  ELSE.

*   SELECT SINGLE * FROM lfa1 WHERE lifnr EQ prov.
    zcl_qry_po_deliv_address=>lfa1( EXPORTING i_operacion = 'READ'
                                      i_lifnr = prov
                            IMPORTING es_lfa1 = DATA(ls_lfa1) ).
    CHECK sy-subrc EQ 0.
    d_name1      = ls_lfa1-name1.
    d_name2      = ls_lfa1-name2.
    d_street     = ls_lfa1-stras.
    d_post_code1 = ls_lfa1-pstlz.
    d_city1      = ls_lfa1-ort01.
    d_country    = ls_lfa1-land1.
    d_region     = ls_lfa1-regio.
    d_tel_number = ls_lfa1-telf1.
    d_fax_number = ls_lfa1-telfx.

  ENDIF.


*-Facturar a:
  CLEAR: i_name1, i_name2, i_City, i_District, i_street, i_tel_number, i_post_code.

*  SELECT adrnr INTO T001-adrnr FROM t001 WHERE bukrs EQ ekko-bukrs.
*  ENDSELECT.
  zcl_qry_po_deliv_address=>t001( EXPORTING i_operacion = 'READ'
                                      i_bukrs = ls_ekko-bukrs
                            IMPORTING e_adrnr = DATA(lv_adrnr) ).
  CHECK sy-subrc EQ 0.

*  SELECT * FROM adrc WHERE addrnumber EQ T001-adrnr.
*  ENDSELECT.
  zcl_qry_po_deliv_address=>adrc( EXPORTING i_operacion = 'READ'
                                     i_adrn2 = lv_adrnr
                           IMPORTING es_adrc = DATA(ls_adrc2) ).
  CHECK sy-subrc EQ 0.
  i_name1      = ls_adrc2-name1.
  i_name2      = ls_adrc2-name2.
  i_city       = ls_adrc2-city1.
  i_district   = ls_adrc2-city2.
  i_street     = ls_adrc2-street.
  i_tel_number = ls_adrc2-tel_number.
  i_post_code  = ls_adrc2-post_code1.


*- Datos del comprador
*  SELECT * FROM t024
*    WHERE ekgrp EQ ekko-ekgrp.
*  ENDSELECT.
  zcl_qry_po_deliv_address=>t024( EXPORTING i_operacion = 'READ'
                                     i_ekgrp = ls_ekko-ekgrp
                           IMPORTING es_t024 = DATA(ls_t024) ).
  CHECK sy-subrc EQ 0.

  purchaser = ls_ekko-ekgrp.
  pur_name = ls_t024-eknam.
  mail = ls_t024-smtp_addr.

ENDFUNCTION.
