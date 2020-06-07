 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the DDL for a specific role. 
-- Call Syntax  : @role_ddl (role) 
-- ----------------------------------------------------------------------------- 
------ 
 
set long 20000 longchunksize 20000 pagesize 0 linesize 1000 fee  dba  ck off verify 
off trimspool on 
column ddl format a1000 
 
begin 
   dbms_metadata.set_transform_param (dbms_metadata.session_transform, 'SQLTERMI 
NATOR', true); 
   dbms_metadata.set_transform_param (dbms_metadata.session_transform, 'PRETTY', 
 true); 
end; 
/ 
 
variable v_role VARCHAR2(30); 
 
exec :v_role := upper('&1'); 
 
  select   dbms_metadata.get_ddl('ROLE', r.role) AS ddl 
from     dba  _roles r 
where  r.role = :v_role 
union all 
  select   dbms_metadata.get_granted_ddl('ROLE_GRANT', rp.grantee) AS ddl 
from     dba  _role_privs rp 
where  rp.grantee = :v_role 
and    rownum = 1 
union all 
  select   dbms_metadata.get_granted_ddl('SYSTEM_GRANT', sp.grantee) AS ddl 
from     dba  _sys_privs sp 
where  sp.grantee = :v_role 
and    rownum = 1 
union all 
  select   dbms_metadata.get_granted_ddl('OBJECT_GRANT', tp.grantee) AS ddl 
from     dba  _tab_privs tp 
where  tp.grantee = :v_role 
and    rownum = 1 
/ 
 
set linesize 80 pagesize 14 fee  dba  ck on verify on 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
