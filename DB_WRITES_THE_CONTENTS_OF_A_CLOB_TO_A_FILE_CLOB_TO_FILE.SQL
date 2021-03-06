 
 
CREATE OR REPLACE   PROCEDURE   clob_to_file (p_clob      IN  CLOB, 
                                          p_dir       IN  VARCHAR2, 
                                          p_filename  IN  VARCHAR2) 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Writes the contents of a CLOB to a file. 
--                22/05/2020 - BLOB parameter switched from IN OUT NOCOPY to IN. 
-- ----------------------------------------------------------------------------- 
------ 
AS 
  l_file    UTL_FILE.FILE_TYPE; 
  l_buffer  VARCHAR2(32767); 
  l_amount  BINARY_INTEGER := 32767; 
  l_pos     INTEGER := 1; 
BEGIN 
  l_file := UTL_FILE.fopen(p_dir, p_filename, 'w', 32767); 
 
  LOOP 
      DBMS  _LOB.read (p_clob, l_amount, l_pos, l_buffer); 
    UTL_FILE.put(l_file, l_buffer); 
    l_pos := l_pos + l_amount; 
  END LOOP; 
EXCEPTION 
  WHEN NO_DATA_FOUND THEN 
    -- Expected end. 
    IF UTL_FILE.is_open(l_file) THEN 
      UTL_FILE.fclose(l_file); 
    END IF; 
  WHEN OTHERS THEN 
    IF UTL_FILE.is_open(l_file) THEN 
      UTL_FILE.fclose(l_file); 
    END IF; 
    RAISE; 
END clob_to_file; 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
