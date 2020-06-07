 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Provides information about system fixes per version. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @system_fix_count 
-- ----------------------------------------------------------------------------- 
------ 
  SELECT   optimizer_feature_enable, 
       COUNT(*) 
FROM   v$system_fix_control 
  GROUP BY   optimizer_feature_enable 
ORDER BY optimizer_feature_enable; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
