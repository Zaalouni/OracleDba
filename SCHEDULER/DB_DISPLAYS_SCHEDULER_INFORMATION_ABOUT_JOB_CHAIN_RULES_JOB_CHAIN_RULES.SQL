 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays scheduler information about job chain rules. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @job_chain_rules 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
COLUMN owner FORMAT A10 
COLUMN chain_name FORMAT A15 
COLUMN rule_owner FORMAT A10 
COLUMN rule_name FORMAT A15 
COLUMN condition FORMAT A25 
COLUMN action FORMAT A20 
COLUMN comments FORMAT A25 
 
  SELECT   owner, 
       chain_name, 
       rule_owner, 
       rule_name, 
       condition, 
       action, 
       comments 
FROM     dba  _scheduler_chain_rules 
ORDER BY owner, chain_name, rule_owner, rule_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
