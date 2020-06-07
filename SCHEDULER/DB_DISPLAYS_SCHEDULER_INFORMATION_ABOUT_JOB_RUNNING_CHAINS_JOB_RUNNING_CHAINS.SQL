 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays scheduler information about job running chains. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @job_running_chains.sql 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
COLUMN owner FORMAT A10 
COLUMN job_name FORMAT A20 
COLUMN chain_owner FORMAT A10 
COLUMN chain_name FORMAT A15 
COLUMN step_name FORMAT A25 
 
  SELECT   owner, 
       job_name, 
       chain_owner, 
       chain_name, 
       step_name, 
       state 
FROM     dba  _scheduler_running_chains 
ORDER BY owner, job_name, chain_name, step_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
