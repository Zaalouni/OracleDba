 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Creates synonyms in the current schema for all views in the sp 
ecified schema. 
-- Call Syntax  : @view_synonyms (schema-name) 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 0 
SET FEEDBACK OFF 
SET VERIFY OFF 
 
SPOOL temp.sql 
 
  SELECT   'CREATE SYNONYM "' || a.view_name || '" FOR "' || a.owner || '"."' || a.v 
iew_name || '";' 
FROM   all_views a 
  WHERE    a.owner = UPPER('&1') 
AND    NOT EXISTS (  SELECT   '1' 
                   FROM   user_synonyms u 
                     WHERE    u.synonym_name = a.view_name 
                   AND    u.table_owner  = UPPER('&1')); 
 
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
  
