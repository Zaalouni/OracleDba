 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about all database options. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @options 
-- ----------------------------------------------------------------------------- 
------ 
 
COLUMN value FORMAT A20 
 
  SELECT   * 
FROM   v$option 
ORDER BY parameter; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
