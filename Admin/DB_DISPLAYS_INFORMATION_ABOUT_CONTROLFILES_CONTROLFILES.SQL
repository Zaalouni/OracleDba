 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about controlfiles. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @controlfiles 
-- ----------------------------------------------------------------------------- 
------ 
 
SET LINESIZE 100 
COLUMN name FORMAT A80 
 
  SELECT   name, 
       status 
FROM   v$controlfile 
ORDER BY name; 
 
SET LINESIZE 80 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
