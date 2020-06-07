 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the users who currently have admin privileges. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @min_datafile_size 
-- ----------------------------------------------------------------------------- 
------ 
 
  SELECT   * 
FROM   v$pwfile_users 
ORDER BY username; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
