 
 
-- ----------------------------------------------------------------------------- 
------ 
l 
--  Author        : aws-senior.com 
-- Description  : Compiles all invalid views for specified schema, or all schema 
. 
-- Call Syntax  : @compile_all_views (schema-name or all) 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 0 
SET FEEDBACK OFF 
SET VERIFY OFF 
 
SPOOL temp.sql 
 
  SELECT   'ALTER VIEW ' || a.owner || '.' || a.object_name || ' COMPILE;' 
FROM    all_objects a 
  WHERE     a.object_type = 'VIEW' 
AND     a.status      = 'INVALID' 
AND     a.owner       = Decode(Upper('&&1'), 'ALL',a.owner, Upper('&&1')); 
 
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
  
