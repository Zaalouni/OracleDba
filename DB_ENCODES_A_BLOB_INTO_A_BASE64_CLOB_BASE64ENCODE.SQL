 
 
CREATE OR REPLACE   FUNCTION   base64encode(p_blob IN BLOB) 
  RETURN CLOB 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Encodes a BLOB into a Base64 CLOB. 
-- ----------------------------------------------------------------------------- 
------ 
IS 
  l_clob CLOB; 
  l_step PLS_INTEGER := 12000; -- make sure you set a multiple of 3 not higher t 
han 24573 
BEGIN 
  FOR i IN 0 .. TRUNC((  DBMS  _LOB.getlength(p_blob) - 1 )/l_step) LOOP 
    l_clob := l_clob || UTL_RAW.cast_to_varchar2(UTL_ENCODE.base64_encode(  DBMS  _L 
OB.substr(p_blob, l_step, i * l_step + 1))); 
  END LOOP; 
  RETURN l_clob; 
END; 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
