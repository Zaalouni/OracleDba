 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about all Data Pump jobs. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @datapump_jobs 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 150 
 
COLUMN owner_name FORMAT A20 
COLUMN job_name FORMAT A30 
COLUMN operation FORMAT A10 
COLUMN job_mode FORMAT A10 
COLUMN state FORMAT A12 
 
  SELECT   owner_name, 
       job_name, 
       TRIM(operation) AS operation, 
       TRIM(job_mode) AS job_mode, 
       state, 
       degree, 
       attached_sessions, 
       datapump_sessions 
FROM     dba  _datapump_jobs 
ORDER BY 1, 2; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
