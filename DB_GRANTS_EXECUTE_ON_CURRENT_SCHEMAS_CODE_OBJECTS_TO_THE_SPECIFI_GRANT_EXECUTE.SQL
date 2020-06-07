 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Grants execute on current schemas code objects to the specifie 
d user/role. 
-- Call Syntax  : @grant_execute (schema-name) 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 0 
SET FEEDBACK OFF 
SET VERIFY OFF 
 
SPOOL temp.sql 
 
  SELECT   'GRANT EXECUTE ON "' || u.object_name || '" TO &1;' 
FROM   user_objects u 
  WHERE    u.object_type IN ('PACKAGE','  PROCEDURE  ','  FUNCTION  ') 
AND    NOT EXISTS (  SELECT   '1' 
                   FROM   all_tab_privs a 
                     WHERE    a.grantee    = UPPER('&1') 
                   AND    a.privilege  = 'EXECUTE' 
                   AND    a.table_name = u.object_name); 
 
SPOOL OFF 
 
-- Comment out following line to pvent immediate run 
@temp.sql 
 
SET PAGESIZE 14 
SET FEEDBACK ON 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
