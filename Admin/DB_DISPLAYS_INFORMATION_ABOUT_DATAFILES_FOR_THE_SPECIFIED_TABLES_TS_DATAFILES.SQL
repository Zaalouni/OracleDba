 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about datafiles for the specified tablesp 
ace. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @ts_datafiles (  tablespace  -name) 
-- ----------------------------------------------------------------------------- 
------ 
 
SET LINESIZE 200 
COLUMN file_name FORMAT A70 
 
  SELECT   file_id, 
       file_name, 
       ROUND(bytes/1024/1024/1024) AS size_gb, 
       ROUND(maxbytes/1024/1024/1024) AS max_size_gb, 
       autoextensible, 
       increment_by, 
       status 
FROM     dba  _data_files 
  WHERE      tablespace  _name = UPPER('&1') 
ORDER BY file_id; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
