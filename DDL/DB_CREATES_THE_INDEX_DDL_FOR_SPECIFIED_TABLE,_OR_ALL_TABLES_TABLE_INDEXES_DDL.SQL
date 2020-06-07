 
 
-- ----------------------------------------------------------------------------- 
------ 
sql 
--  Author        : aws-senior.com 
-- Description  : Creates the index DDL for specified table, or all tables. 
-- Call Syntax  : @table_indexes_ddl (schema-name) (table-name or all) 
-- ----------------------------------------------------------------------------- 
------ 
SET LONG 20000 LONGCHUNKSIZE 20000 PAGESIZE 0 LINESIZE 1000 FEEDBACK OFF VERIFY 
OFF TRIMSPOOL ON 
 
BEGIN 
     DBMS  _METADATA.set_transform_param (  DBMS  _METADATA.session_transform, 'SQLTERMI 
NATOR', true); 
     DBMS  _METADATA.set_transform_param (  DBMS  _METADATA.session_transform, 'PRETTY', 
 true); 
   -- Uncomment the following lines if you need them. 
   --  DBMS  _METADATA.set_transform_param (  DBMS  _METADATA.session_transform, 'SEGMEN 
T_ATTRIBUTES', false); 
   --  DBMS  _METADATA.set_transform_param (  DBMS  _METADATA.session_transform, 'STORAG 
E', false); 
END; 
/ 
 
  SELECT     DBMS  _METADATA.get_ddl ('INDEX', index_name, owner) 
FROM   all_indexes 
  WHERE    owner      = UPPER('&1') 
AND    table_name = DECODE(UPPER('&2'), 'ALL', table_name, UPPER('&2')); 
 
SET PAGESIZE 14 LINESIZE 100 FEEDBACK ON VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
