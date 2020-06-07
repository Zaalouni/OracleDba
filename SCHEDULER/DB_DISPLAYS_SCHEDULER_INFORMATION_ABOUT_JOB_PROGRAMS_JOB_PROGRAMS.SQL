 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays scheduler information about job programs. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @job_programs 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 250 
 
COLUMN owner FORMAT A20 
COLUMN program_name FORMAT A30 
COLUMN program_action FORMAT A50 
COLUMN comments FORMAT A40 
 
  SELECT   owner, 
       program_name, 
       program_type, 
       program_action, 
       number_of_arguments, 
       enabled, 
       comments 
FROM     dba  _scheduler_programs 
ORDER BY owner, program_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
