 
 
-- ----------------------------------------------------------------------------- 
------ 
l 
--  Author        : aws-senior.com 
-- Description  : Compiles all invalid procedures for specified schema, or all s 
chema. 
-- Call Syntax  : @compile_all_procs (schema-name or all) 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 0 
SET FEEDBACK OFF 
SET VERIFY OFF 
 
SPOOL temp.sql 
 
  SELECT   'ALTER   PROCEDURE   ' || a.owner || '.' || a.object_name || ' COMPILE;' 
FROM    all_objects a 
  WHERE     a.object_type = '  PROCEDURE  ' 
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
  
