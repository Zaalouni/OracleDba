 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays a list of all the system parameters. 
--                Comment out isinstance_modifiable for use prior to 10g. 
--  Requirements  : Access to the v$ views. 
-- Call Syntax  : @system_parameters 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 500 
 
COLUMN name  FORMAT A30 
COLUMN value FORMAT A60 
 
  SELECT   sp.name, 
       sp.type, 
       sp.value, 
       sp.isses_modifiable, 
       sp.issys_modifiable, 
       sp.isinstance_modifiable 
FROM   v$system_parameter sp 
ORDER BY sp.name; 
 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
