 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Rebuilds the specified index, or all indexes. 
-- Call Syntax  : @rebuild_index (index-name or all) (schema-name) 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 0 
SET FEEDBACK OFF 
SET VERIFY OFF 
 
SPOOL temp.sql 
 
  SELECT   'ALTER INDEX ' || a.index_name || ' REBUILD;' 
FROM   all_indexes a 
  WHERE    index_name  = DECODE(Upper('&1'),'ALL',a.index_name,Upper('&1')) 
AND    table_owner = Upper('&2') 
ORDER BY 1 
/ 
 
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
  
