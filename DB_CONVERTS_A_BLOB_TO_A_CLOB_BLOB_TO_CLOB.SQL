 
 
CREATE OR REPLACE   FUNCTION   blob_to_clob (p_data  IN  BLOB) 
  RETURN CLOB 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Converts a BLOB to a CLOB. 
-- ----------------------------------------------------------------------------- 
------ 
AS 
  l_clob         CLOB; 
  l_dest_offset  PLS_INTEGER := 1; 
  l_src_offset   PLS_INTEGER := 1; 
  l_lang_context PLS_INTEGER :=   DBMS  _LOB.default_lang_ctx; 
  l_warning      PLS_INTEGER; 
BEGIN 
 
    DBMS  _LOB.createTemporary( 
    lob_loc => l_clob, 
    cache   => TRUE); 
 
    DBMS  _LOB.converttoclob( 
   dest_lob      => l_clob, 
   src_blob      => p_data, 
   amount        =>   DBMS  _LOB.lobmaxsize, 
   dest_offset   => l_dest_offset, 
   src_offset    => l_src_offset, 
   blob_csid     =>   DBMS  _LOB.default_csid, 
   lang_context  => l_lang_context, 
   warning       => l_warning); 
 
   RETURN l_clob; 
END; 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
