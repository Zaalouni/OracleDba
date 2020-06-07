 
 
-- ----------------------------------------------------------------------------- 
------ 
ql 
--  Author        : aws-senior.com 
-- Description  : Displays permission information about all directories. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @directory_permissions (directory_name) 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
 
COLUMN grantee   FORMAT A20 
COLUMN owner     FORMAT A10 
COLUMN grantor   FORMAT A20 
COLUMN privilege FORMAT A20 
 
COLUMN 
  SELECT   * 
FROM     dba  _tab_privs 
  WHERE    table_name = UPPER('&1'); 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
