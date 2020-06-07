 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Lists all valid values for the specified parameter. 
-- Call Syntax  : @param_valid_values (parameter-name) 
--  Requirements  : Access to the v$views. 
-- ----------------------------------------------------------------------------- 
------ 
SET VERIFY OFF 
 
COLUMN value FORMAT A50 
COLUMN isdefault FORMAT A10 
 
  SELECT   value, 
       isdefault 
FROM   v$parameter_valid_values 
  WHERE    name = '&1'; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
