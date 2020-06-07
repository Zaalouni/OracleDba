 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays index-column information for the specified table. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @table_indexes (schema-name) (table-name) 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 500 PAGESIZE 1000 VERIFY OFF 
 
COLUMN index_name      FORMAT A30 
COLUMN column_name     FORMAT A30 
COLUMN column_position FORMAT 99999 
 
  SELECT   a.index_name, 
       a.column_name, 
       a.column_position 
FROM   all_ind_columns a, 
       all_indexes b 
  WHERE    b.owner      = UPPER('&1') 
AND    b.table_name = UPPER('&2') 
AND    b.index_name = a.index_name 
AND    b.owner      = a.index_owner 
ORDER BY 1,3; 
 
SET PAGESIZE 18 VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
