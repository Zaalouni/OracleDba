 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays scheduler information about job chains. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @job_chains 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
COLUMN owner FORMAT A10 
COLUMN chain_name FORMAT A15 
COLUMN rule_set_owner FORMAT A10 
COLUMN rule_set_name FORMAT A15 
COLUMN comments FORMAT A15 
 
  SELECT   owner, 
       chain_name, 
       rule_set_owner, 
       rule_set_name, 
       number_of_rules, 
       number_of_steps, 
       enabled, 
       comments 
FROM     dba  _scheduler_chains; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
