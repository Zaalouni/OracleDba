 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays scheduler information about job chain steps. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @job_chain_steps 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
COLUMN owner FORMAT A10 
COLUMN chain_name FORMAT A15 
COLUMN step_name FORMAT A15 
COLUMN program_owner FORMAT A10 
COLUMN program_name FORMAT A15 
 
  SELECT   owner, 
       chain_name, 
       step_name, 
       program_owner, 
       program_name, 
       step_type 
FROM     dba  _scheduler_chain_steps 
ORDER BY owner, chain_name, step_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
