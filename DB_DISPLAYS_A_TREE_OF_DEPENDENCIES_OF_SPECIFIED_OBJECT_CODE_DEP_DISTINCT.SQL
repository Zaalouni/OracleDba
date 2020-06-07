 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays a tree of dependencies of specified object. 
-- Call Syntax  : @code_dep_distinct (schema-name) (object-name) (object_type or 
 all) 
-- ----------------------------------------------------------------------------- 
------ 
SET VERIFY OFF 
SET LINESIZE 255 
SET PAGESIZE 1000 
 
COLUMN referenced_object FORMAT A50 
COLUMN referenced_type FORMAT A20 
COLUMN referenced_link_name FORMAT A20 
 
  SELECT   DISTINCT a.referenced_owner || '.' || a.referenced_name AS referenced_obj 
ect, 
       a.referenced_type, 
       a.referenced_link_name 
FROM   all_dependencies a 
  WHERE    a.owner NOT IN ('SYS','SYSTEM','PUBLIC') 
AND    a.referenced_owner NOT IN ('SYS','SYSTEM','PUBLIC') 
AND    a.referenced_type != 'NON-EXISTENT' 
AND    a.referenced_type = DECODE(UPPER('&3'), 'ALL', a.referenced_type, UPPER(' 
&3')) 
START WITH a.owner = UPPER('&1') 
AND        a.name  = UPPER('&2') 
CONNECT BY a.owner = PRIOR a.referenced_owner 
AND        a.name  = PRIOR a.referenced_name 
AND        a.type  = PRIOR a.referenced_type; 
 
SET VERIFY ON 
SET PAGESIZE 22 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
