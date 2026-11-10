*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZBOVEDA_CONFIG..................................*
*DATA:  BEGIN OF STATUS_ZBOVEDA_CONFIG                .   "state vector
*         INCLUDE STRUCTURE VIMSTATUS.
*DATA:  END OF STATUS_ZBOVEDA_CONFIG                .
*CONTROLS: TCTRL_ZBOVEDA_CONFIG
*            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
*TABLES: *ZBOVEDA_CONFIG                .
*TABLES: ZBOVEDA_CONFIG                 .

* general table data declarations..............
*  INCLUDE LSVIMTDT
