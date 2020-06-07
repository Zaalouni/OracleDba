 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays system privileges granted to a specified user. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @user_system_privs (user-name) 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 VERIFY OFF 
 
  SELECT   grantee, 
       privilege, 
       admin_option 
FROM     dba  _sys_privs 
  WHERE    grantee = UPPER('&1') 
ORDER BY grantee, privilege; 
 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
