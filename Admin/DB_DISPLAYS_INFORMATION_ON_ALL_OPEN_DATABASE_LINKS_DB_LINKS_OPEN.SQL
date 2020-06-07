 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information on all open database links. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @db_links_open 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
 
COLUMN db_link FORMAT A30 
 
  SELECT   db_link, 
       owner_id, 
       logged_on, 
       heterogeneous, 
       protocol, 
       open_cursors, 
       in_transaction, 
       update_sent, 
       commit_point_strength 
FROM   v$dblink 
ORDER BY db_link; 
 
SET LINESIZE 80 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
