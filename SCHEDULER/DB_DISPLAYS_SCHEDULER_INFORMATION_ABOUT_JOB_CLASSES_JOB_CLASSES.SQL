 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays scheduler information about job classes. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @job_classes 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
 
COLUMN service FORMAT A20 
COLUMN comments FORMAT A40 
 
  SELECT   job_class_name, 
       resource_consumer_group, 
       service, 
       logging_level, 
       log_history, 
       comments 
FROM     dba  _scheduler_job_classes 
ORDER BY job_class_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
