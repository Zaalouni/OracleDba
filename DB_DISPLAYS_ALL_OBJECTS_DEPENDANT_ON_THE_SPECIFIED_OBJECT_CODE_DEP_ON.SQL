 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays all objects dependant on the specified object. 
-- Call Syntax  : @code_dep_on (schema-name or all) (object-name) 
-- ----------------------------------------------------------------------------- 
------ 
SET VERIFY OFF 
SET LINESIZE 255 
SET PAGESIZE 1000 
BREAK ON type SKIP 1 
 
COLUMN owner FORMAT A20 
 
  SELECT   a.type, 
       a.owner, 
       a.name 
FROM   all_dependencies a 
  WHERE    a.referenced_owner = DECODE(UPPER('&1'), 'ALL', a.referenced_owner, UPPER 
('&1')) 
AND    a.referenced_name  = UPPER('&2') 
ORDER BY 1,2,3; 
 
SET PAGESIZE 22 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
