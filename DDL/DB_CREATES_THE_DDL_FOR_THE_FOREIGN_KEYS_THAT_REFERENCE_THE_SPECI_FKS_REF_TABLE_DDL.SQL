 
 
-- ----------------------------------------------------------------------------- 
------ 
sql 
--  Author        : aws-senior.com 
-- Description  : Creates the DDL for the foreign keys that reference the specif 
ied table. 
-- Call Syntax  : @fks_ref_table_ddl (schema) (table-name) 
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
 
  SELECT     DBMS  _METADATA.get_ddl ('REF_CONSTRAINT', ac1.constraint_name, ac1.owner) 
FROM   all_constraints ac1 
       JOIN all_constraints ac2 ON ac1.r_owner = ac2.owner AND ac1.r_constraint_ 
name = ac2.constraint_name 
  WHERE    ac2.owner      = UPPER('&1') 
AND    ac2.table_name = UPPER('&2') 
AND    ac2.constraint_type IN ('P','U') 
AND    ac1.constraint_type = 'R'; 
 
SET PAGESIZE 14 LINESIZE 100 FEEDBACK ON VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
