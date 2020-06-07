 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information on all trace runs. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @trace_runs.sql 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
SET TRIMOUT ON 
 
COLUMN runid FORMAT 99999 
 
  SELECT   runid, 
       run_date, 
       run_owner 
FROM   plsql_trace_runs 
ORDER BY runid; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
