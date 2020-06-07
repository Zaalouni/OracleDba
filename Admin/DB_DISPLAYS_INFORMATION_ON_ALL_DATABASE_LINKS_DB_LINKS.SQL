 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information on all database links. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @db_links 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 150 
 
COLUMN owner FORMAT A30 
COLUMN db_link FORMAT A30 
COLUMN username FORMAT A30 
COLUMN host FORMAT A30 
 
  SELECT   owner, 
       db_link, 
       username, 
       host 
FROM     dba  _db_links 
ORDER BY owner, db_link; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
