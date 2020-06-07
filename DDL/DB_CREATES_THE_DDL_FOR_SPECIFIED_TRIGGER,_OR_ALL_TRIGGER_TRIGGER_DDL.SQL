 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Creates the DDL for specified trigger, or all trigger. 
-- Call Syntax  : @trigger_ddl (schema) (trigger-name or all) 
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
  WHERE    owner        = UPPER('&1') 
AND    trigger_name = DECODE(UPPER('&2'), 'ALL', trigger_name, UPPER('&2')); 
 
SET PAGESIZE 14 LINESIZE 100 FEEDBACK ON VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
