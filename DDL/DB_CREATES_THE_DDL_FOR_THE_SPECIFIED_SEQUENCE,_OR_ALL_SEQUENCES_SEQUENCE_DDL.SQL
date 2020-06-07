 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Creates the DDL for the specified sequence, or all sequences. 
-- Call Syntax  : @sequence_ddl (schema-name) (sequence-name or all) 
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
 
  SELECT     DBMS  _METADATA.get_ddl ('SEQUENCE', sequence_name, sequence_owner) 
FROM   all_sequences 
  WHERE    sequence_owner = UPPER('&1') 
AND    sequence_name  = DECODE(UPPER('&2'), 'ALL', sequence_name, UPPER('&2')); 
 
SET PAGESIZE 14 LINESIZE 100 FEEDBACK ON VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
