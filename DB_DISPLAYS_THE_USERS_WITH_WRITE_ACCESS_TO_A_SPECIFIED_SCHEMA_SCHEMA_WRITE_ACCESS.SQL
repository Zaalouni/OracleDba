 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the users with write access to a specified schema. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @schema_write_access.sql (schema-name) 
-- ----------------------------------------------------------------------------- 
------ 
 
set verify off 
 
-- Direct grants 
  select   distinct grantee 
from     dba  _tab_privs 
where  privilege in ('INSERT', 'UPDATE', 'DELETE') 
and    owner = upper('&1') 
union 
-- Grants via a role 
  select   distinct grantee 
from     dba  _role_privs 
       join   dba  _users on grantee = username 
where  granted_role IN (  select   distinct role 
                        from   role_tab_privs 
                        where  privilege in ('INSERT', 'UPDATE', 'DELETE') 
                        and    owner = upper('&1') 
                        union 
                          select   distinct role 
                        from   role_sys_privs 
                        where  privilege in ('INSERT ANY TABLE', 'UPDATE ANY TAB 
LE', 'DELETE ANY TABLE')) 
union 
-- Access via ANY sys privileges 
  select   distinct grantee 
from     dba  _sys_privs 
join     dba  _users on grantee = username 
where  privilege in ('INSERT ANY TABLE', 'UPDATE ANY TABLE', 'DELETE ANY TABLE') 
; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
