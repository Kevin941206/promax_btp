FUNCTION zall_extractor_bkpf.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(BUKRS) TYPE  BUKRS
*"     VALUE(BLART) TYPE  BLART
*"     VALUE(FECH_INI) TYPE  DATUM
*"     VALUE(FECH_FIN) TYPE  DATUM OPTIONAL
*"     VALUE(USNAM) TYPE  USNAM OPTIONAL
*"  EXPORTING
*"     REFERENCE(TAB_RESULT) TYPE  ZFI_TT_ALLX_BKPF
*"----------------------------------------------------------------------
  zcl_ext_bkpf=>get_ext_bkpf( EXPORTING
                                i_bukrs = bukrs
                                i_blart = blart
                                i_fech_ini = fech_ini
                                i_fech_fin = fech_fin
                                i_usnam = usnam
                              IMPORTING
                                et_result = tab_result ).


*data: begin of TAB_BSEG occurs 0,
*         bukrs like bseg-bukrs,
*         belnr like bseg-belnr,
*         gjahr like bseg-gjahr,
*         zuonr like bseg-zuonr,
*         SGTXT like bseg-SGTXT,
*      end of TAB_BSEG.
*
*clear TAB_RESULT. refresh TAB_RESULT.
*
*  if fech_fin is initial.
*   move FECH_INI to fech_fin.
*  endif.
*
*  select BUKRS BELNR GJAHR BLART BLDAT BUDAT MONAT CPUDT CPUTM
*         XBLNR BKTXT WAERS
*  from bkpf
*  into corresponding fields of table TAB_RESULT
*  where bukrs = bukrs
*  and   blart = blart
*  and ( ( CPUDT between fech_ini and fech_fin ) or
*        ( AEDAT between fech_ini and fech_fin ) )
*  and usnam = usnam.
*
**- Verificar
*  check not TAB_RESULT[] is initial.
*
*  select bukrs belnr gjahr zuonr SGTXT
*  from bseg
*  into corresponding fields of table TAB_BSEG
*  for all entries in TAB_RESULT
*  where bukrs = TAB_RESULT-bukrs
*  and   belnr = TAB_RESULT-belnr
*  and   gjahr = TAB_RESULT-gjahr
*  and   buzei = '001'.
**  and   buzid = space.
*
*  Loop at TAB_RESULT.
*     read table TAB_BSEG with key bukrs = TAB_RESULT-bukrs
*                                  belnr = TAB_RESULT-belnr
*                                  gjahr = TAB_RESULT-gjahr.
*     check sy-subrc eq 0.
*     TAB_RESULT-zuonr = TAB_BSEG-zuonr.
*     TAB_RESULT-sgtxt = TAB_BSEG-sgtxt.
*
**-   Importe
*     select lifnr wrbtr into (TAB_RESULT-lifnr, TAB_RESULT-wrbtr)
*     from BSAK
*     where bukrs eq TAB_RESULT-bukrs
*     and   gjahr eq TAB_RESULT-gjahr
*     and   belnr eq TAB_RESULT-belnr.
*     endselect.
*
*     if TAB_RESULT-lifnr is initial.
*       select lifnr wrbtr into (TAB_RESULT-lifnr, TAB_RESULT-wrbtr)
*       from BSIK
*       where bukrs eq TAB_RESULT-bukrs
*       and   gjahr eq TAB_RESULT-gjahr
*       and   belnr eq TAB_RESULT-belnr.
*       endselect.
*     endif.
*
*     if not TAB_RESULT-lifnr is initial.
*       select single STCD1 into TAB_RESULT-STCD1
*       from  LFA1 where lifnr eq TAB_RESULT-lifnr.
*     endif.
*
*     modify TAB_RESULT.
*  Endloop.
**-

ENDFUNCTION.
