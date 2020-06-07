 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the auto-index configuration for each container. 
--  Requirements  : Access to the CDB views. 
-- Call Syntax  : @auto_index_config 
-- ----------------------------------------------------------------------------- 
------ 
COLUMN parameter_name FORMAT A40 
COLUMN parameter_value FORMAT A40 
 
  SELECT   con_id, parameter_name, parameter_value 
FROM   cdb_auto_index_config 
ORDER BY 1, 2; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
