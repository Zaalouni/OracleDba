 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays users with default passwords. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @default_passwords 
-- ----------------------------------------------------------------------------- 
------ 
 
  SELECT   a.username, b.account_status 
FROM     dba  _users_with_defpwd a 
       JOIN   dba  _users b ON a.username = b.username 
ORDER BY 1; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
