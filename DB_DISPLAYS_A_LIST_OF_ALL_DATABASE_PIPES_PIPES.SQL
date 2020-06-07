 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays a list of all database pipes. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @pipes 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 100 
 
COLUMN name FORMAT A40 
 
  SELECT   ownerid, 
       name, 
       type, 
       pipe_size 
FROM   v$db_pipes 
ORDER BY 1,2; 
 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
