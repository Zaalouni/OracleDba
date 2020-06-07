 
 
-- ----------------------------------------------------------------------------- 
------ 
.sql 
--  Author        : aws-senior.com 
-- Description  : Creates the DDL for all triggers on the specified table. 
-- Call Syntax  : @table_triggers_ddl (schema) (table_name) 
-- ----------------------------------------------------------------------------- 
------ 
SET LONG 20000 LONGCHUNKSIZE 20000 PAGESIZE 0 LINESIZE 1000 FEEDBACK OFF VERIFY 
OFF TRIMSPOOL ON 
 
BEGIN 
     DBMS  _METADATA.set_transform_param (  DBMS  _METADATA.session_transform, 'SQLTERMI 
NATOR', true); 
     DBMS  _METADATA.set_transform_param (  DBMS  _METADATA.session_transform, 'PRETTY', 
 true); 
END; 
/ 
 
  SELECT     DBMS  _METADATA.get_ddl ('TRIGGER', trigger_name, owner) 
FROM   all_triggers 
  WHERE    table_owner = UPPER('&1') 
AND    table_name  = UPPER('&2'); 
 
SET PAGESIZE 14 LINESIZE 100 FEEDBACK ON VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
