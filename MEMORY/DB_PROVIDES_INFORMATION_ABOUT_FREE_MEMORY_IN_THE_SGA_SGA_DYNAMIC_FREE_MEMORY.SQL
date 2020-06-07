 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Provides information about free memory in the SGA. 
--  Requirements  : Access to the v$ views. 
-- Call Syntax  : @sga_dynamic_free_memory 
-- ----------------------------------------------------------------------------- 
------ 
 
  SELECT   * 
FROM   v$sga_dynamic_free_memory; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
