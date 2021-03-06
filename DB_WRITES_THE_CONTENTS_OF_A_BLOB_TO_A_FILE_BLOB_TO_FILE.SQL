 
 
CREATE OR REPLACE   PROCEDURE   blob_to_file (p_blob      IN  BLOB, 
                                          p_dir       IN  VARCHAR2, 
                                          p_filename  IN  VARCHAR2) 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Writes the contents of a BLOB to a file. 
--                22/05/2020 - BLOB parameter switched from IN OUT NOCOPY to IN. 
-- ----------------------------------------------------------------------------- 
------ 
AS 
  l_file      UTL_FILE.FILE_TYPE; 
  l_buffer    RAW(32767); 
  l_amount    BINARY_INTEGER := 32767; 
  l_pos       INTEGER := 1; 
  l_blob_len  INTEGER; 
BEGIN 
  l_blob_len :=   DBMS  _LOB.getlength(p_blob); 
 
  -- Open the destination file. 
  l_file := UTL_FILE.fopen(p_dir, p_filename,'wb', 32767); 
 
  -- Read chunks of the BLOB and write them to the file until complete. 
  WHILE l_pos <= l_blob_len LOOP 
      DBMS  _LOB.read(p_blob, l_amount, l_pos, l_buffer); 
    UTL_FILE.put_raw(l_file, l_buffer, TRUE); 
    l_pos := l_pos + l_amount; 
  END LOOP; 
 
  -- Close the file. 
  UTL_FILE.fclose(l_file); 
 
EXCEPTION 
  WHEN OTHERS THEN 
    -- Close the file if something goes wrong. 
    IF UTL_FILE.is_open(l_file) THEN 
      UTL_FILE.fclose(l_file); 
    END IF; 
    RAISE; 
END blob_to_file; 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
