 
 
-- ----------------------------------------------------------------------------- 
------ 
s.sql 
--  Author        : aws-senior.com 
-- Description  : Displays tables with locked stats. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @tables_with_locked_stats.sql 
-- ----------------------------------------------------------------------------- 
------ 
 
  SELECT   owner, 
       table_name, 
       stattype_locked 
FROM     dba  _tab_statistics 
  WHERE    stattype_locked IS NOT NULL 
ORDER BY owner, table_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
