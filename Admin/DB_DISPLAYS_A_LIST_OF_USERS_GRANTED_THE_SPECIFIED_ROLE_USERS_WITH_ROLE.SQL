 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays a list of users granted the specified role. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @user_with_role DBA 
-- ----------------------------------------------------------------------------- 
------ 
 
SET VERIFY OFF 
COLUMN username FORMAT A30 
 
  SELECT   username, 
       lock_date, 
       expiry_date 
FROM     dba  _users 
  WHERE    username IN (  SELECT   grantee 
                    FROM     dba  _role_privs 
                      WHERE    granted_role = UPPER('&1')) 
ORDER BY username; 
 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
