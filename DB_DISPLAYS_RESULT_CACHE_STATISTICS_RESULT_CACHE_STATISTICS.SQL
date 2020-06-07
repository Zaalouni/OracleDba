 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays result cache statistics. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @result_cache_statistics 
-- ----------------------------------------------------------------------------- 
------ 
 
COLUMN name FORMAT A30 
COLUMN value FORMAT A30 
 
  SELECT   id, 
       name, 
       value 
FROM   v$result_cache_statistics 
ORDER BY id; 
 
CLEAR COLUMNS 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
