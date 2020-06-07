 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Disables the Primary Key for the specified table, or all table 
s. 
-- Call Syntax  : @disable_pk (table-name or all) (schema-name) 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 0 
SET FEEDBACK OFF 
SET VERIFY OFF 
 
SPOOL temp.sql 
 
  SELECT   'ALTER TABLE "' || a.table_name || '" DISABLE PRIMARY KEY;' 
FROM   all_constraints a 
  WHERE    a.constraint_type = 'P' 
AND    a.owner           = Upper('&2') 
AND    a.table_name      = DECODE(Upper('&1'),'ALL',a.table_name,Upper('&1')); 
 
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
  
