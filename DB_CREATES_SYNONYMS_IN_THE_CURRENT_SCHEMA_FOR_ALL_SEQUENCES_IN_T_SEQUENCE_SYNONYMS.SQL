 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Creates synonyms in the current schema for all sequences in th 
e specified schema. 
-- Call Syntax  : @sequence_synonyms (schema-name) 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 0 
SET FEEDBACK OFF 
SET VERIFY OFF 
 
SPOOL temp.sql 
 
  SELECT   'CREATE SYNONYM "' || a.object_name || '" FOR "' || a.owner || '"."' || a 
.object_name || '";' 
FROM   all_objects a 
  WHERE    a.object_type = 'SEQUENCE' 
AND    a.owner       = UPPER('&1') 
AND    NOT EXISTS (  SELECT   '1' 
                   FROM   user_synonyms a1 
                     WHERE    a1.synonym_name = a.object_name 
                   AND    a1.table_owner  = UPPER('&1')); 
 
 
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
  
