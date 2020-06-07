 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays a list of all roles and privileges granted to the spe 
cified user. 
--  Requirements  : Access to the USER views. 
-- Call Syntax  : @user_roles 
-- ----------------------------------------------------------------------------- 
------ 
SET SERVEROUTPUT ON 
SET VERIFY OFF 
 
  SELECT   a.granted_role, 
       a.admin_option 
FROM   user_role_privs a 
ORDER BY a.granted_role; 
 
  SELECT   a.privilege, 
       a.admin_option 
FROM   user_sys_privs a 
ORDER BY a.privilege; 
 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
