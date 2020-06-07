 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Provides information to help tune the MEMORY_TARGET parameter. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @memory_target_advice 
-- ----------------------------------------------------------------------------- 
------ 
  SELECT   * 
FROM   v$memory_target_advice 
ORDER BY memory_size; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
