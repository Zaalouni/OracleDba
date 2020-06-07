 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays a list of all the spfile parameters. 
--  Requirements  : Access to the v$ views. 
-- Call Syntax  : @spfile_parameters 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 500 
 
COLUMN name  FORMAT A30 
COLUMN value FORMAT A60 
COLUMN displayvalue FORMAT A60 
 
  SELECT   sp.sid, 
       sp.name, 
       sp.value, 
       sp.display_value 
FROM   v$spparameter sp 
ORDER BY sp.name, sp.sid; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
