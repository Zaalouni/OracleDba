 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays a list of users granted the specified role. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @users_with_sys_priv "UNLIMITED TABLESPACE" 
-- ----------------------------------------------------------------------------- 
------ 
 
SET VERIFY OFF 
COLUMN username FORMAT A30 
 
  SELECT   username, 
       lock_date, 
       expiry_date 
FROM     dba  _users 
  WHERE    username IN (  SELECT   grantee 
                    FROM     dba  _sys_privs 
                      WHERE    privilege = UPPER('&1')) 
ORDER BY username; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
