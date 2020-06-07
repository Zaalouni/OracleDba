 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays scheduler information about job schedules. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @job_schedules 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 250 
 
COLUMN owner FORMAT A20 
COLUMN schedule_name FORMAT A30 
COLUMN start_date FORMAT A35 
COLUMN repeat_interval FORMAT A50 
COLUMN end_date FORMAT A35 
COLUMN comments FORMAT A40 
 
  SELECT   owner, 
       schedule_name, 
       start_date, 
       repeat_interval, 
       end_date, 
       comments 
FROM     dba  _scheduler_schedules 
ORDER BY owner, schedule_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
