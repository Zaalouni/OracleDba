 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Creates the DDL for DB links for the specific schema, or all s 
chemas. 
-- Call Syntax  : @db_link_ddl (schema or all) 
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
 
  SELECT     DBMS  _METADATA.get_ddl ('DB_LINK', db_link, owner) 
FROM     dba  _db_links 
  WHERE    owner = DECODE(UPPER('&1'), 'ALL', owner, UPPER('&1')); 
 
SET PAGESIZE 14 LINESIZE 1000 FEEDBACK ON VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
