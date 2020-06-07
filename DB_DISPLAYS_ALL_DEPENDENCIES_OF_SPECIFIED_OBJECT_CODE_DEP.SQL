 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays all dependencies of specified object. 
-- Call Syntax  : @code_dep (schema-name or all) (object-name) 
-- ----------------------------------------------------------------------------- 
------ 
SET VERIFY OFF 
SET LINESIZE 255 
SET PAGESIZE 1000 
BREAK ON referenced_type SKIP 1 
 
COLUMN referenced_type FORMAT A20 
COLUMN referenced_owner FORMAT A20 
COLUMN referenced_name FORMAT A40 
COLUMN referenced_link_name FORMAT A20 
 
  SELECT   a.referenced_type, 
       a.referenced_owner, 
       a.referenced_name, 
       a.referenced_link_name 
FROM   all_dependencies a 
  WHERE    a.owner = DECODE(UPPER('&1'), 'ALL', a.referenced_owner, UPPER('&1')) 
AND    a.name  = UPPER('&2') 
ORDER BY 1,2,3; 
 
SET VERIFY ON 
SET PAGESIZE 22 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
