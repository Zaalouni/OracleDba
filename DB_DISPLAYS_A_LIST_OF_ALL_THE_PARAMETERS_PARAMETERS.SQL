 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays a list of all the parameters. 
--  Requirements  : Access to the v$ views. 
-- Call Syntax  : @parameters 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 500 
 
COLUMN name  FORMAT A30 
COLUMN value FORMAT A60 
 
  SELECT   p.name, 
       p.type, 
       p.value, 
       p.isses_modifiable, 
       p.issys_modifiable, 
       p.isinstance_modifiable 
FROM   v$parameter p 
ORDER BY p.name; 
 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
