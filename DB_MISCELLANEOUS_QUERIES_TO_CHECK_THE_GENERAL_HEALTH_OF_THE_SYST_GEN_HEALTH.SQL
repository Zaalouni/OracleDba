 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Miscellaneous queries to check the general health of the syste 
m. 
-- Call Syntax  : @gen_health 
-- ----------------------------------------------------------------------------- 
------ 
  SELECT   file_id, 
         tablespace  _name, 
       file_name, 
       status 
FROM   sys.  dba  _data_files; 
 
  SELECT   file#, 
       name, 
       status, 
       enabled 
FROM   v$datafile; 
 
  SELECT   * 
FROM   v$backup; 
 
  SELECT   * 
FROM   v$recovery_status; 
 
  SELECT   * 
FROM   v$recover_file; 
 
  SELECT   * 
FROM   v$recovery_file_status; 
 
  SELECT   * 
FROM   v$recovery_log; 
 
  SELECT   username, 
       command, 
       status, 
       module 
FROM   v$session; 
 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
