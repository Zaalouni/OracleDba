 
 
CREATE OR REPLACE   PROCEDURE   file_to_blob (p_blob      IN OUT NOCOPY BLOB, 
                                          p_dir       IN  VARCHAR2, 
                                          p_filename  IN  VARCHAR2) 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Loads the contents of a file into a BLOB. 
-- ----------------------------------------------------------------------------- 
------ 
AS 
  l_bfile  BFILE; 
 
  l_dest_offset INTEGER := 1; 
  l_src_offset  INTEGER := 1; 
BEGIN 
  l_bfile := BFILENAME(p_dir, p_filename); 
    DBMS  _LOB.fileopen(l_bfile,   DBMS  _LOB.file_readonly); 
    DBMS  _LOB.trim(p_blob, 0); 
  IF   DBMS  _LOB.getlength(l_bfile) > 0 THEN 
      DBMS  _LOB.loadblobfromfile ( 
      dest_lob    => p_blob, 
      src_bfile   => l_bfile, 
      amount      =>   DBMS  _LOB.lobmaxsize, 
      dest_offset => l_dest_offset, 
      src_offset  => l_src_offset); 
  END IF; 
    DBMS  _LOB.fileclose(l_bfile); 
END file_to_blob; 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
