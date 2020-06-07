 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays CDB resource plans. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @cdb_resource_plans.sql 
-- ----------------------------------------------------------------------------- 
------ 
 
COLUMN plan FORMAT A30 
COLUMN comments FORMAT A30 
COLUMN status FORMAT A10 
SET LINESIZE 100 
 
  SELECT   plan_id, 
       plan, 
       comments, 
       status, 
       mandatory 
FROM     dba  _cdb_rsrc_plans 
ORDER BY plan; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
