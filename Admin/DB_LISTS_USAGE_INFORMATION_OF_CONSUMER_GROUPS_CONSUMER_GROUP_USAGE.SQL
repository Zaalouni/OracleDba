 
 
-- ----------------------------------------------------------------------------- 
------ 
age.sql 
--  Author        : aws-senior.com 
-- Description  : Lists usage information of consumer groups. 
-- Call Syntax  : @consumer_group_usage 
--  Requirements  : Access to the v$ views. 
-- ----------------------------------------------------------------------------- 
------ 
  SELECT   name, 
       consumed_cpu_time 
FROM   v$rsrc_consumer_group 
ORDER BY name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
