 
 
-- ----------------------------------------------------------------------------- 
------ 
.sql 
--  Author        : aws-senior.com 
-- Description  : Shows the monitoring status for the specified table indexes. 
-- Call Syntax  : @index_monitoring_status (table-name) (index-name or all) 
-- ----------------------------------------------------------------------------- 
------ 
SET VERIFY OFF 
 
  SELECT   table_name, 
       index_name, 
       monitoring 
FROM   v$object_usage 
  WHERE    table_name = UPPER('&1') 
AND    index_name = DECODE(UPPER('&2'), 'ALL', index_name, UPPER('&2')); 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
