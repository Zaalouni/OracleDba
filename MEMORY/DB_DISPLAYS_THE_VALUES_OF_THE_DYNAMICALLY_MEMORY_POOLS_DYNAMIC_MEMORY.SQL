 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the values of the dynamically memory pools. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @dynamic_memory 
-- ----------------------------------------------------------------------------- 
------ 
 
COLUMN name  FORMAT A40 
COLUMN value FORMAT A40 
 
  SELECT   name, 
       value 
FROM   v$parameter 
  WHERE    SUBSTR(name, 1, 1) = '_' 
ORDER BY name; 
 
COLUMN FORMAT DEFAULT 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
