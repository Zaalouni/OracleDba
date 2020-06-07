 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about the contents of the SYSAUX tablespa 
ce. 
--  Requirements  : Access to the v$ views. 
-- Call Syntax  : @sysaux_occupants 
-- ----------------------------------------------------------------------------- 
------ 
COLUMN occupant_name FORMAT A30 
COLUMN schema_name FORMAT A20 
 
  SELECT   occupant_name, 
       schema_name, 
       space_usage_kbytes 
FROM   v$sysaux_occupants 
ORDER BY occupant_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
