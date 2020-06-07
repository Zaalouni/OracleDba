 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about lockdown rules applis in the curren 
t container. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @lockdown_rules 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
 
COLUMN rule_type FORMAT A20 
COLUMN rule FORMAT A20 
COLUMN clause FORMAT A20 
COLUMN clause_option FORMAT A20 
COLUMN pdb_name FORMAT A30 
 
  SELECT   lr.rule_type, 
       lr.rule, 
       lr.status, 
       lr.clause, 
       lr.clause_option, 
       lr.users, 
       lr.con_id, 
       p.pdb_name 
FROM   v$lockdown_rules lr 
       LEFT OUTER JOIN cdb_pdbs p ON lr.con_id = p.con_id 
ORDER BY 1, 2; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
