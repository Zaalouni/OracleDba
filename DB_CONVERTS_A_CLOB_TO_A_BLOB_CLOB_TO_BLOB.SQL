 
 
CREATE OR REPLACE   FUNCTION   clob_to_blob (p_data  IN  CLOB) 
  RETURN BLOB 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Converts a CLOB to a BLOB. 
-- ----------------------------------------------------------------------------- 
------ 
AS 
  l_blob         BLOB; 
  l_dest_offset  PLS_INTEGER := 1; 
  l_src_offset   PLS_INTEGER := 1; 
  l_lang_context PLS_INTEGER :=   DBMS  _LOB.default_lang_ctx; 
  l_warning      PLS_INTEGER :=   DBMS  _LOB.warn_inconvertible_char; 
BEGIN 
 
    DBMS  _LOB.createtemporary( 
    lob_loc => l_blob, 
    cache   => TRUE); 
 
    DBMS  _LOB.converttoblob( 
   dest_lob      => l_blob, 
   src_clob      => p_data, 
   amount        =>   DBMS  _LOB.lobmaxsize, 
   dest_offset   => l_dest_offset, 
   src_offset    => l_src_offset, 
   blob_csid     =>   DBMS  _LOB.default_csid, 
   lang_context  => l_lang_context, 
   warning       => l_warning); 
 
   RETURN l_blob; 
END; 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
