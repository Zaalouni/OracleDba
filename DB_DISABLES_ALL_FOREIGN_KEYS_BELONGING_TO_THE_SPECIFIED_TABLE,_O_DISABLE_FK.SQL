 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Disables all Foreign Keys belonging to the specified table, or 
 all tables. 
-- Call Syntax  : @disable_fk (table-name or all) (schema-name) 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 0 
SET FEEDBACK OFF 
SET VERIFY OFF 
 
SPOOL temp.sql 
 
  SELECT   'ALTER TABLE "' || a.table_name || '" DISABLE CONSTRAINT "' || a.constrai 
nt_name || '";' 
FROM   all_constraints a 
  WHERE    a.constraint_type = 'R' 
AND    a.table_name      = DECODE(Upper('&1'),'ALL',a.table_name,Upper('&1')) 
AND    a.owner           = Upper('&2'); 
 
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
  
