 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Disables all check constraints for a specified table, or all t 
ables. 
-- Call Syntax  : @disable_chk (table-name or all) (schema-name) 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 0 
SET FEEDBACK OFF 
SET VERIFY OFF 
 
SPOOL temp.sql 
 
  SELECT   'ALTER TABLE "' || a.table_name || '" DISABLE CONSTRAINT "' || a.constrai 
nt_name || '";' 
FROM   all_constraints a 
  WHERE    a.constraint_type = 'C' 
AND    a.owner           = UPPER('&2'); 
AND    a.table_name      = DECODE(UPPER('&1'),'ALL',a.table_name,UPPER('&1')); 
 
SPOOL OFF 
 
-- Comment out following line to pvent immediate run 
@temp.sql 
 
SET PAGESIZE 14 
SET FEEDBACK ON 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
