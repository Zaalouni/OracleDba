 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Lists the currently active resource plan if one is set. 
-- Call Syntax  : @active_plan 
--  Requirements  : Access to the v$ views. 
-- ----------------------------------------------------------------------------- 
------ 
  SELECT   name, 
       is_top_plan 
FROM   v$rsrc_plan 
ORDER BY name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
