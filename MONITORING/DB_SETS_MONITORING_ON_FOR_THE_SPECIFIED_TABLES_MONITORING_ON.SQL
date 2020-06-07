 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Sets monitoring on for the specified tables. 
-- Call Syntax  : @monitoring_on (schema) (table-name or all) 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 0 
SET FEEDBACK OFF 
SET VERIFY OFF 
SPOOL temp.sql 
 
  SELECT   'ALTER TABLE "' || owner || '"."' || table_name || '" MONITORING;' 
FROM     dba  _tables 
  WHERE    owner       = UPPER('&1') 
AND    table_name  = DECODE(UPPER('&2'), 'ALL', table_name, UPPER('&2')) 
AND    monitoring != 'YES'; 
 
SPOOL OFF 
 
SET PAGESIZE 18 
SET FEEDBACK ON 
 
@temp.sql 
 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
