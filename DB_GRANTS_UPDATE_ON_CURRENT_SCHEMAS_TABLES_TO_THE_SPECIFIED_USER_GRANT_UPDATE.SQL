 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Grants update on current schemas tables to the specified user/ 
role. 
-- Call Syntax  : @grant_update (schema-name) 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 0 
SET FEEDBACK OFF 
SET VERIFY OFF 
 
SPOOL temp.sql 
 
  SELECT   'GRANT UPDATE ON "' || u.table_name || '" TO &1;' 
FROM   user_tables u 
  WHERE    NOT EXISTS (  SELECT   '1' 
                   FROM   all_tab_privs a 
                     WHERE    a.grantee    = UPPER('&1') 
                   AND    a.privilege  = 'UPDATE' 
                   AND    a.table_name = u.table_name); 
 
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
  
