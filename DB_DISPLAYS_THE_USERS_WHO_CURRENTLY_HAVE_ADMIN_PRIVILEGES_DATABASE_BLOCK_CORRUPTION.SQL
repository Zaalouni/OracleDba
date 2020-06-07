 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the users who currently have admin privileges. 
--  Requirements  : Access to the V$ and DBA views. 
--                Assumes a RMAN VALIDATE has been run against a datafile, table 
space 
--                or the whole database before this query is run. 
-- Call Syntax  : @database_block_corruption 
-- ----------------------------------------------------------------------------- 
------ 
 
COLUMN owner FORMAT A30 
COLUMN segment_name FORMAT A30 
 
  SELECT   DISTINCT owner, segment_name 
FROM   v$database_block_corruption dbc 
       JOIN   dba  _extents e ON dbc.file# = e.file_id AND dbc.block# BETWEEN e.bloc 
k_id and e.block_id+e.blocks-1 
ORDER BY 1,2; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
