FUNCTION zvts_rfq_attach.
*"----------------------------------------------------------------------
*"*"Interfase local
*"  IMPORTING
*"     VALUE(QUOTATION) TYPE  EBELN
*"  EXPORTING
*"     VALUE(ATTACH) TYPE  ZVTT_ATTACH
*"----------------------------------------------------------------------
  TYPES: BEGIN OF ty_srgbtbrel,
          instid_b LIKE zst_srgbtbrel-instid_b.
  TYPES END OF ty_srgbtbrel.

  DATA: l_doc         LIKE zst_srgbtbrel-instid_a,
        l_objid(33),
        loio_id_32(32),
        v_soodk       TYPE zst_soodk,
        Filename      TYPE zst_soli-line,
        Format(3),
        t_objhead     TYPE STANDARD TABLE OF zst_soli,
        s_objhead     LIKE LINE OF t_objhead,
        t_objcont     TYPE STANDARD TABLE OF zst_soli,
        s_objcont     LIKE LINE OF t_objcont,
        t_objpara     TYPE STANDARD TABLE OF zst_selc,
        s_objpara     LIKE LINE OF t_objpara,
        t_objparb     TYPE STANDARD TABLE OF zst_soop1,
        s_objparb     LIKE LINE OF t_objparb,
        content_255   TYPE STANDARD TABLE OF zst_w3mime,
        s_content_255 LIKE LINE OF content_255,
        l_content     TYPE STANDARD TABLE OF zst_sdokcntbin,
        s_content     LIKE LINE OF l_content,
        component     TYPE STANDARD TABLE OF zst_sdokcomaci,
        s_component   LIKE LINE OF component.

  DATA: wa_attach TYPE zvts_attach,
        wa_soli   TYPE zst_soli,
        wa_mime   TYPE zst_w3mime.

  DATA: ld_buffer       TYPE xstring,
        ld_input_length TYPE i,
        it_binary_tab   TYPE STANDARD TABLE OF string,
        wa_binary_tab   LIKE LINE OF it_binary_tab,
        ld_first_line   TYPE i,
        ld_last_line    TYPE i.

  DATA: t_srgbtbrel  TYPE STANDARD TABLE OF ty_srgbtbrel,
        wa_srgbtbrel LIKE LINE OF t_srgbtbrel.

  DATA: it_srgbtbrel_select TYPE ztt_srgbtbrel,
        wa_srgbtbrel_select LIKE LINE OF it_srgbtbrel_select.

  DATA: it_soffphio TYPE ztt_soffphio,
        wa_soffphio LIKE LINE OF it_soffphio.

  CLEAR t_srgbtbrel.

**-
  l_doc = quotation.
*
**- Lee los nombres de los archivos
*  SELECT instid_b INTO t_srgbtbrel-instid_b
*  FROM srgbtbrel
*  WHERE reltype EQ 'ATTA'
*  AND   instid_a EQ l_doc.
**and   TYPEID_A eq 'BUS2011'.
*    APPEND t_srgbtbrel.
*  ENDSELECT.

  CLEAR: wa_srgbtbrel_select, it_srgbtbrel_select.
  zcl_srgbtbrel=>srgbtbrel_get( EXPORTING i_operacion = 'READ' i_reltype = 'ATTA' i_instid_a = l_doc IMPORTING et_srgbtbrel = it_srgbtbrel_select ).
  IF it_srgbtbrel_select IS NOT INITIAL.

    LOOP AT it_srgbtbrel_select INTO wa_srgbtbrel_select.
      CLEAR: wa_srgbtbrel.
      MOVE-CORRESPONDING wa_srgbtbrel_select TO wa_srgbtbrel.
      APPEND wa_srgbtbrel TO t_srgbtbrel.
    ENDLOOP.

  ENDIF.


  LOOP AT t_srgbtbrel INTO wa_srgbtbrel.

    CLEAR: v_soodk, t_objhead, t_objcont, t_objpara, t_objparb, l_content, component.
    CLEAR: t_objhead, t_objcont, t_objpara, t_objparb, l_content, component.

    v_soodk-objtp = wa_srgbtbrel+17(3). "EXT
    v_soodk-objyr = wa_srgbtbrel+20(2).
    v_soodk-objno = wa_srgbtbrel+22(12).

*    CALL FUNCTION 'SO_OBJECT_GET_CONTENT'
*      EXPORTING
*        object_id        = v_soodk
**       ARCHIVE          =
*      TABLES
*        objhead          = t_objhead
*        objcont          = t_objcont
*        objpara          = t_objpara
*        objparb          = t_objparb
*      EXCEPTIONS
*        archive_error    = 1
*        object_not_exist = 2
*        OTHERS           = 3.
    zcl_so_object_get_content=>get_content( EXPORTING i_soodk = v_soodk
                                            IMPORTING et_objhead = t_objhead
                                                      et_objcont = t_objcont
                                                      et_objpara = t_objpara
                                                      et_objparb = t_objparb ).

    READ TABLE t_objhead INDEX 1 INTO s_objhead.
    SPLIT s_objhead-line AT '=' INTO s_objhead-line Filename. "Nombre del Archivo
    READ TABLE t_objhead INDEX 2 INTO s_objhead.
    SPLIT s_objhead-line AT '=' INTO s_objhead-line Format.   "Tipo de Archivo

    CLEAR: wa_attach, wa_attach-type_asc[], wa_attach-other_type.

    wa_attach-name = Filename.
    wa_attach-type = Format.

    IF format EQ 'ASC'.
**-  Pasa el contenido de un archivo de tipo texto

      LOOP AT t_objcont INTO s_objcont.
        wa_soli-line = s_objcont-line.
        APPEND wa_soli TO wa_attach-type_asc.
      ENDLOOP.

    ELSE.
**- Obtiene el contenido del archivo de cualquier otro formato (png, word, pdf..)
      DATA: phio TYPE zskwf_io.

      READ TABLE t_objcont INDEX 1 INTO s_objcont.
      SPLIT s_objcont-line AT space INTO s_objcont-line l_objid.
      CONDENSE l_objid.

*      SELECT SINGLE ph_class phio_id INTO (soffphio-ph_class, soffphio-phio_id)
*      FROM soffphio
*      WHERE ph_class EQ 'SOFFPHIO'
*      AND   loio_id  EQ l_objid.

      CLEAR: loio_id_32, it_soffphio.
      loio_id_32 = l_objid.
      zcl_soffphio=>soffphio_get( EXPORTING i_operacion = 'READ' i_ph_class = 'SOFFPHIO' i_loio_id = loio_id_32 IMPORTING et_soffphio = it_soffphio ).

      IF it_soffphio IS NOT INITIAL.
        READ TABLE it_soffphio INDEX 1 INTO wa_soffphio.

        phio-objtype = 'S'.
        phio-class   = wa_soffphio-ph_class.
        phio-objid   = wa_soffphio-phio_id.

*        CALL FUNCTION 'SKWF_PHIO_CONTENT_ACCESS_GET'
*          EXPORTING
*            phio                = phio
*          TABLES
*            component_access    = component
*            file_content_binary = l_content.
        zcl_skwf_phio_content_access=>get_content( EXPORTING i_phio = phio
                                                   IMPORTING et_component = component
                                                             et_content = l_content
                                                             e_text64 = wa_attach-other_type ).

*        DATA: z       TYPE string, i_part TYPE string, i_part1 TYPE string, x_part TYPE xstring.
*        CLEAR: i_part, i_part1, x_part.
*
*        LOOP AT l_content INTO s_content.
*          z = s_content-line.
*          CONCATENATE i_part  z INTO i_part.
*        ENDLOOP.

**   Convierte a Hexadecimal=>
*        CALL FUNCTION 'SCMS_STRING_TO_XSTRING'
*          EXPORTING
*            text   = i_part
*          IMPORTING
*            buffer = x_part
*          EXCEPTIONS
*            failed = 1
*            OTHERS = 2.

**     Convierte a Base 64
*        CALL FUNCTION 'SCMS_BASE64_ENCODE_STR'
*          EXPORTING
*            input  = x_part
*          IMPORTING
*            output = i_part1.

*        zcl_convert_string=>string_to_base64( EXPORTING i_text = i_part
*                                              IMPORTING e_text64 = i_part1 ).

*        wa_attach-other_type = i_part1.

      ENDIF.
    ENDIF.

    APPEND wa_attach TO attach.

  ENDLOOP.

ENDFUNCTION.
