 
 
CREATE OR REPLACE   PROCEDURE   file_to_clob (p_clob      IN OUT NOCOPY CLOB, 
                                          p_dir       IN  VARCHAR2, 
                                          p_filename  IN  VARCHAR2) 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Loads the contents of a file into a CLOB. 
-- ----------------------------------------------------------------------------- 
------ 
AS 
  l_bfile  BFILE; 
 
  l_dest_offset   INTEGER := 1; 
  l_src_offset    INTEGER := 1; 
  l_bfile_csid    NUMBER  := 0; 
  l_lang_context  INTEGER := 0; 
  l_warning       INTEGER := 0; 
BEGIN 
  l_bfile := BFILENAME(p_dir, p_filename); 
    DBMS  _LOB.fileopen(l_bfile,   DBMS  _LOB.file_readonly); 
    DBMS  _LOB.trim(p_clob, 0); 
    DBMS  _LOB.loadclobfromfile ( 
    dest_lob      => p_clob, 
    src_bfile     => l_bfile, 
    amount        =>   DBMS  _LOB.lobmaxsize, 
    dest_offset   => l_dest_offset, 
    src_offset    => l_src_offset, 
    bfile_csid    => l_bfile_csid , 
    lang_context  => l_lang_context, 
    warning       => l_warning); 
    DBMS  _LOB.fileclose(l_bfile); 
END file_to_clob; 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
