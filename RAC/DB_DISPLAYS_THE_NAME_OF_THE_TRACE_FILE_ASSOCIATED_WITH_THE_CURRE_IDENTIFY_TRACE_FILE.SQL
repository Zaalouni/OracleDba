 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the name of the trace file associated with the curren 
t session. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @identify_trace_file 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 100 
COLUMN value FORMAT A60 
 
  SELECT   value 
FROM   v$diag_info 
  WHERE    name = 'Default Trace File'; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
