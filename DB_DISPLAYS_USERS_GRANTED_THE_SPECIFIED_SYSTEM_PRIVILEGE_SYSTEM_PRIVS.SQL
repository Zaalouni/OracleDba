 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays users granted the specified system privilege. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @system_privs ("sys-priv") 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 VERIFY OFF 
 
  SELECT   privilege, 
       grantee, 
       admin_option 
FROM     dba  _sys_privs 
  WHERE    privilege LIKE UPPER('%&1%') 
ORDER BY privilege, grantee; 
 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
