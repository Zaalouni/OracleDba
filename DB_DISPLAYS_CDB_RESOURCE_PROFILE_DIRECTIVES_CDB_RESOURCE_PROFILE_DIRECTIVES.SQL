 
 
-- ----------------------------------------------------------------------------- 
------ 
s.sql 
--  Author        : aws-senior.com 
-- Description  : Displays CDB resource profile directives. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @cdb_resource_profile_directives.sql (plan-name or all) 
-- ----------------------------------------------------------------------------- 
------ 
 
COLUMN plan FORMAT A30 
COLUMN pluggable_database FORMAT A25 
COLUMN profile FORMAT A25 
SET LINESIZE 150 VERIFY OFF 
 
  SELECT   plan, 
       pluggable_database, 
       profile, 
       shares, 
       utilization_limit AS util, 
       parallel_server_limit AS parallel 
FROM     dba  _cdb_rsrc_plan_directives 
  WHERE    plan = DECODE(UPPER('&1'), 'ALL', plan, UPPER('&1')) 
ORDER BY plan, pluggable_database, profile; 
 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
