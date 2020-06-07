 
 
CREATE OR REPLACE   FUNCTION   base64decode(p_clob CLOB) 
  RETURN BLOB 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Decodes a Base64 CLOB into a BLOB 
-- ----------------------------------------------------------------------------- 
------ 
IS 
  l_blob    BLOB; 
  l_raw     RAW(32767); 
  l_amt     NUMBER := 7700; 
  l_offset  NUMBER := 1; 
  l_temp    VARCHAR2(32767); 
BEGIN 
  BEGIN 
      DBMS  _LOB.createtemporary (l_blob, FALSE,   DBMS  _LOB.CALL); 
    LOOP 
        DBMS  _LOB.read(p_clob, l_amt, l_offset, l_temp); 
      l_offset := l_offset + l_amt; 
      l_raw    := UTL_ENCODE.base64_decode(UTL_RAW.cast_to_raw(l_temp)); 
        DBMS  _LOB.append (l_blob, TO_BLOB(l_raw)); 
    END LOOP; 
  EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
      NULL; 
  END; 
  RETURN l_blob; 
END; 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
