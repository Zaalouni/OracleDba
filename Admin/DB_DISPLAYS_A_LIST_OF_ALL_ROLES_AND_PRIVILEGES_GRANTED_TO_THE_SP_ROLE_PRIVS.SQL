 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays a list of all roles and privileges granted to the spe 
cified role. 
--  Requirements  : Access to the USER views. 
-- Call Syntax  : @role_privs (role-name, ALL) 
-- ----------------------------------------------------------------------------- 
------ 
SET SERVEROUTPUT ON 
SET VERIFY OFF 
 
  SELECT   a.role, 
       a.granted_role, 
       a.admin_option 
FROM   role_role_privs a 
  WHERE    a.role = DECODE(UPPER('&1'), 'ALL', a.role, UPPER('&1')) 
ORDER BY a.role, a.granted_role; 
 
  SELECT   a.grantee, 
       a.granted_role, 
       a.admin_option, 
       a.default_role 
FROM     dba  _role_privs a 
  WHERE    a.grantee = DECODE(UPPER('&1'), 'ALL', a.grantee, UPPER('&1')) 
ORDER BY a.grantee, a.granted_role; 
 
  SELECT   a.role, 
       a.privilege, 
       a.admin_option 
FROM   role_sys_privs a 
  WHERE    a.role = DECODE(UPPER('&1'), 'ALL', a.role, UPPER('&1')) 
ORDER BY a.role, a.privilege; 
 
  SELECT   a.role, 
       a.owner, 
       a.table_name, 
       a.column_name, 
       a.privilege, 
       a.grantable 
FROM   role_tab_privs a 
  WHERE    a.role = DECODE(UPPER('&1'), 'ALL', a.role, UPPER('&1')) 
ORDER BY a.role, a.owner, a.table_name; 
 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
