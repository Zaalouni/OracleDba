 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Shows the monitoring status for the specified tables. 
-- Call Syntax  : @monitoring_status (schema) (table-name or all) 
-- ----------------------------------------------------------------------------- 
------ 
SET VERIFY OFF 
 
  SELECT   table_name, monitoring 
FROM     dba  _tables 
  WHERE    owner = UPPER('&1') 
AND    table_name = DECODE(UPPER('&2'), 'ALL', table_name, UPPER('&2')); 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
