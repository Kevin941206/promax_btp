FUNCTION zvts_search_vendor.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  EXPORTING
*"     REFERENCE(VTT_VENDOR) TYPE  ZTT_ZVTS_VENDOR
*"  CHANGING
*"     VALUE(VENDOR) TYPE  ZST_LFA1-LIFNR OPTIONAL
*"     VALUE(NAME) TYPE  ZST_LFB1-INTAD OPTIONAL
*"----------------------------------------------------------------------

  DATA: lfa1       TYPE zst_lfa1,
        knvk       TYPE zst_knvk,
        lfa1_t     TYPE ztt_lfa1,
        vts_vendor TYPE zst_zvts_vendor.


  CLEAR vts_vendor.
*
  IF NOT vendor IS INITIAL.
    IF vendor CA 'ABCDEFGHIJKLMNOPQRSTVWXYZ'.
      prov  = vendor.
    ELSE.
      provc = vendor.
      prov  = provc.
    ENDIF.

    zcl_qry_zvts_search_vendor=>search_vendor_lfa1( EXPORTING i_operacion = 'READ' prov = prov IMPORTING lfa1 = lfa1  ).

*  select single name1 name2 name3 name4 stcd1 adrnr
*  into  (lfa1-name1, lfa1-name2, lfa1-name3, lfa1-name4, lfa1-stcd1, lfa1-adrnr)
*  from lfa1 where lifnr eq prov.
    IF lfa1-name1 IS NOT INITIAL OR lfa1-name2 IS NOT INITIAL OR lfa1-name3 IS NOT INITIAL
    OR lfa1-name4 IS NOT INITIAL OR lfa1-stcd1 IS NOT INITIAL OR lfa1-adrnr IS NOT INITIAL.
      CONCATENATE  lfa1-name1 lfa1-name2 lfa1-name3 lfa1-name4 INTO name SEPARATED BY space.
    ENDIF.
*  check sy-subrc eq 0.
*  concatenate  lfa1-name1 lfa1-name2 lfa1-name3 lfa1-name4 into NAME separated by space.

    vts_vendor-lifnr = prov.
    vts_vendor-name  = name.
    vts_vendor-stcd1 = lfa1-stcd1.
*
*  move: prov to VTS_VENDOR-LIFNR,
*        NAME to VTS_VENDOR-NAME,
*        lfa1-stcd1 to VTS_VENDOR-STCD1.
*
    CLEAR vts_vendor-smtp_addr.
*-Obtiene correo de ventas de la Vista: Persona de contacto
    zcl_qry_zvts_search_vendor=>search_vendor_knvk( EXPORTING i_operacion = 'READ' prov = prov IMPORTING knvk = knvk  ).
*  select single prsnr into knvk-prsnr
*  from knvk where lifnr eq prov.
    IF knvk-prsnr IS NOT INITIAL.
      zcl_qry_zvts_search_vendor=>search_vendor_adr6( EXPORTING i_operacion = 'READ' knvk = knvk lfa1 = lfa1 IMPORTING smtp_addr = vts_vendor-smtp_addr  ).
    ENDIF.
*
*  if sy-subrc eq 0.
*     select single SMTP_ADDR into VTS_VENDOR-SMTP_ADDR
*     from adr6
*     where addrnumber eq lfa1-adrnr
*     and   persnumber eq knvk-prsnr
*     and   flgdefault ne space.
*  endif.
*
    IF vts_vendor IS NOT INITIAL.
      APPEND vts_vendor TO vtt_vendor.
    ENDIF.
*
  ELSEIF  NOT name IS INITIAL.
    CONCATENATE '*' name '*' INTO name.
*  select lifnr name1 name2 name3 name4 stcd1 adrnr
*  into  (lfa1-lifnr, lfa1-name1, lfa1-name2, lfa1-name3, lfa1-name4, lfa1-stcd1, lfa1-adrnr)
*  from lfa1 where name1 like NAME or name2 like NAME.
    zcl_qry_zvts_search_vendor=>search_vendor_lfa1V2( EXPORTING i_operacion = 'READ' name = name IMPORTING lfa1 = lfa1_t  ).
    CLEAR vts_vendor.
*    move: lfa1-lifnr to VTS_VENDOR-LIFNR, lfa1-stcd1 to VTS_VENDOR-STCD1.
    LOOP AT lfa1_t INTO lfa1.
      vts_vendor-lifnr = lfa1-lifnr.
      vts_vendor-stcd1 = lfa1-stcd1.
      CONCATENATE  lfa1-name1 lfa1-name2 lfa1-name3 lfa1-name4 INTO vts_vendor-name SEPARATED BY space.
*-  Obtiene correo de ventas de la Vista: Persona de contacto
*    select single prsnr into knvk-prsnr
*    from knvk where lifnr eq lfa1-lifnr.
      zcl_qry_zvts_search_vendor=>search_vendor_knvkv2( EXPORTING i_operacion = 'READ' lfa1 = lfa1  IMPORTING knvk = knvk  ).
*    select single SMTP_ADDR into VTS_VENDOR-SMTP_ADDR
*    from adr6 where ADDRNUMBER eq lfa1-adrnr
*    and   persnumber eq knvk-prsnr
*    and   flgdefault ne space.
      zcl_qry_zvts_search_vendor=>search_vendor_adr6( EXPORTING i_operacion = 'READ' knvk = knvk lfa1 = lfa1 IMPORTING smtp_addr = vts_vendor-smtp_addr  ).
      IF vts_vendor IS NOT INITIAL.
        APPEND vts_vendor TO vtt_vendor.
      ENDIF.
*  endselect.
    ENDLOOP.
  ENDIF.
ENDFUNCTION.
