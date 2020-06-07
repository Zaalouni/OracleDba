 
 
-- ----------------------------------------------------------------------------- 
------ 
l 
--  Author        : aws-senior.com 
-- Description  : Lists all resource plans. 
-- Call Syntax  : @resource_plans 
--  Requirements  : Access to the DBA views. 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
SET VERIFY OFF 
 
COLUMN status FORMAT A10 
COLUMN comments FORMAT A50 
 
  SELECT   plan, 
       status, 
       comments 
FROM     dba  _rsrc_plans 
ORDER BY plan; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
