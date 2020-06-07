 
 
-- ----------------------------------------------------------------------------- 
------ 
ote_ddl.sql 
--  Author        : aws-senior.com 
-- Description  : Creates the DDL for public synonyms to remote objects. 
-- Call Syntax  : @synonym_remote_ddl 
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
 
  SELECT     DBMS  _METADATA.get_ddl ('SYNONYM', synonym_name, owner) 
FROM     dba  _synonyms 
  WHERE    owner = 'PUBLIC' 
AND    db_link IS NOT NULL; 
 
SET PAGESIZE 14 FEEDBACK ON VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
