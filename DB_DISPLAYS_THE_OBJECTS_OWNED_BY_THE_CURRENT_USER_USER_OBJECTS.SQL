 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the objects owned by the current user. 
--  Requirements  : 
-- Call Syntax  : @user_objects 
-- ----------------------------------------------------------------------------- 
------ 
 
COLUMN object_name FORMAT A30 
 
  SELECT   object_name, object_type 
FROM   user_objects 
ORDER BY 1, 2; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
