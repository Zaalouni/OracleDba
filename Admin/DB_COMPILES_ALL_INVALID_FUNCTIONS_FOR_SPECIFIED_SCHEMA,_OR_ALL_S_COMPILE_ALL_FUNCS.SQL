 
 
-- ----------------------------------------------------------------------------- 
------ 
l 
--  Author        : aws-senior.com 
-- Description  : Compiles all invalid functions for specified schema, or all sc 
hema. 
-- Call Syntax  : @compile_all_funcs (schema-name or all) 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 0 
SET FEEDBACK OFF 
SET VERIFY OFF 
 
SPOOL temp.sql 
 
  SELECT   'ALTER   FUNCTION   ' || a.owner || '.' || a.object_name || ' COMPILE;' 
FROM    all_objects a 
  WHERE     a.object_type = '  FUNCTION  ' 
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
  
