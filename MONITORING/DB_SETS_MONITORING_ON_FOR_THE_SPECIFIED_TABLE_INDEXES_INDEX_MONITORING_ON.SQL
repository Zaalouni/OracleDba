 
 
-- ----------------------------------------------------------------------------- 
------ 
n.sql 
--  Author        : aws-senior.com 
-- Description  : Sets monitoring on for the specified table indexes. 
-- Call Syntax  : @index_monitoring_on (schema) (table-name or all) 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 0 
SET FEEDBACK OFF 
SET VERIFY OFF 
SPOOL temp.sql 
 
  SELECT   'ALTER INDEX "' || i.owner || '"."' || i.index_name || '" MONITORING USAG 
E;' 
FROM     dba  _indexes i 
  WHERE    owner      = UPPER('&1') 
AND    table_name = DECODE(UPPER('&2'), 'ALL', table_name, UPPER('&2')); 
 
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
  
