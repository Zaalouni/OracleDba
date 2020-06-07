 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays object privileges on a specified object. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @object_privs (owner) (object-name) 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 VERIFY OFF 
 
COLUMN owner FORMAT A30 
COLUMN object_name FORMAT A30 
COLUMN grantor FORMAT A30 
COLUMN grantee FORMAT A30 
 
  SELECT   owner, 
       table_name AS object_name, 
       grantor, 
       grantee, 
       privilege, 
       grantable, 
       hierarchy 
FROM     dba  _tab_privs 
  WHERE    owner      = UPPER('&1') 
AND    table_name = UPPER('&2') 
ORDER BY 1,2,3,4; 
 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
