 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the window schedule the automatic maintenance tasks. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @autotask_schedule.sql 
-- ----------------------------------------------------------------------------- 
------ 
 
COLUMN window_name FORMAT A20 
COLUMN start_time FORMAT A40 
COLUMN duration FORMAT A20 
 
  SELECT   * 
FROM     dba  _autotask_schedule 
ORDER BY start_time; 
 
 
COLUMN FORMAT DEFAULT 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
