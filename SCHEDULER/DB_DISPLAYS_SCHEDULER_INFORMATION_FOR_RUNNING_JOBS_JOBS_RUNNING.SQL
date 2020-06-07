 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays scheduler information for running jobs. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @jobs_running 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
 
COLUMN owner FORMAT A20 
COLUMN elapsed_time FORMAT A30 
 
  SELECT   owner, 
       job_name, 
       running_instance, 
       elapsed_time, 
       session_id 
FROM     dba  _scheduler_running_jobs 
ORDER BY owner, job_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
