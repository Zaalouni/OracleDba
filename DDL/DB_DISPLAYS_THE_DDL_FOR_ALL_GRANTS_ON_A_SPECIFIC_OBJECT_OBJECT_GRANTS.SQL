 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the DDL for all grants on a specific object. 
-- Call Syntax  : @object_grants (owner) (object_name) 
-- ----------------------------------------------------------------------------- 
------ 
 
set long 1000000 linesize 1000 pagesize 0 fee  dba  ck off trimspool on verify off 
column ddl format a1000 
 
begin 
   dbms_metadata.set_transform_param (dbms_metadata.session_transform, 'SQLTERMI 
NATOR', true); 
   dbms_metadata.set_transform_param (dbms_metadata.session_transform, 'PRETTY', 
 true); 
end; 
/ 
 
  select   dbms_metadata.get_dependent_ddl('OBJECT_GRANT', UPPER('&2'), UPPER('&1')) 
 AS ddl 
from   dual; 
 
set linesize 80 pagesize 14 fee  dba  ck on trimspool on verify on 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
