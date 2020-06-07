 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays scheduler information about windows. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @windows 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 250 
 
COLUMN comments FORMAT A40 
 
  SELECT   window_name, 
       resource_plan, 
       enabled, 
       active, 
       comments 
FROM     dba  _scheduler_windows 
ORDER BY window_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
