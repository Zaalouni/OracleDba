 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the job history for the automatic maintenance tasks. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @autotask_job_history.sql 
-- ----------------------------------------------------------------------------- 
------ 
 
COLUMN client_name FORMAT A40 
COLUMN window_name FORMAT A20 
COLUMN job_start_time FORMAT A40 
COLUMN job_duration FORMAT A20 
COLUMN job_status FORMAT A10 
 
  SELECT   client_name, 
       window_name, 
       job_start_time, 
       job_duration, 
       job_status, 
       job_error 
FROM     dba  _autotask_job_history 
ORDER BY job_start_time; 
 
COLUMN FORMAT DEFAULT 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
