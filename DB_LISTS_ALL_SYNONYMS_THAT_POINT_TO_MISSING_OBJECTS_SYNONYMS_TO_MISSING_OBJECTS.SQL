 
 
-- ----------------------------------------------------------------------------- 
------ 
ects.sql 
--  Author        : aws-senior.com 
-- Description  : Lists all synonyms that point to missing objects. 
-- Call Syntax  : @synonyms_to_missing_objects(object-schema-name or all) 
--  Requirements  : Access to the DBA views. 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 1000 VERIFY OFF 
 
  SELECT   s.owner, 
       s.synonym_name, 
       s.table_owner, 
       s.table_name 
FROM     dba  _synonyms s 
  WHERE    s.db_link IS NULL 
AND    s.table_owner NOT IN ('SYS','SYSTEM') 
AND    NOT EXISTS (  SELECT   1 
                   FROM     dba  _objects o 
                     WHERE    o.owner       = s.table_owner 
                   AND    o.object_name = s.table_name 
                   AND    o.object_type != 'SYNONYM') 
AND    s.table_owner = DECODE(UPPER('&1'), 'ALL', s.table_owner, UPPER('&1')) 
ORDER BY s.owner, s.synonym_name; 
 
SET LINESIZE 80 VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
