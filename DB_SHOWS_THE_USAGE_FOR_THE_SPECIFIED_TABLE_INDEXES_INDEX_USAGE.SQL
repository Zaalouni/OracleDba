 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Shows the usage for the specified table indexes. 
-- Call Syntax  : @index_usage (table-name) (index-name or all) 
-- ----------------------------------------------------------------------------- 
------ 
SET VERIFY OFF 
SET LINESIZE 200 
 
  SELECT   table_name, 
       index_name, 
       used, 
       start_monitoring, 
       end_monitoring 
FROM   v$object_usage 
  WHERE    table_name = UPPER('&1') 
AND    index_name = DECODE(UPPER('&2'), 'ALL', index_name, UPPER('&2')); 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
