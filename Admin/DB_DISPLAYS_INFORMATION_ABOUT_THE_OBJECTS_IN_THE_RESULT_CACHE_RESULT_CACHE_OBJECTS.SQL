 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about the objects in the result cache. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @result_cache_objects 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 1000 
 
  SELECT   * 
FROM v$result_cache_objects; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
