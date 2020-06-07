 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Lists the triggers for the specified table. 
-- Call Syntax  : @table_triggers (schema) (table_name) 
-- ----------------------------------------------------------------------------- 
------ 
  SELECT   owner, 
       trigger_name, 
       status 
FROM     dba  _triggers 
  WHERE    table_owner = UPPER('&1') 
AND    table_name = UPPER('&2'); 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
