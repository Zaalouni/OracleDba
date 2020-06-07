 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays comments associate with specific tables. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @column_comments (schema) (table-name) 
-- ----------------------------------------------------------------------------- 
------ 
SET VERIFY OFF 
SET PAGESIZE 100 
COLUMN column_name FORMAT A20 
COLUMN comments    FORMAT A50 
 
  SELECT   column_name, 
       comments 
FROM     dba  _col_comments 
  WHERE    owner      = UPPER('&1') 
AND    table_name = UPPER('&2') 
ORDER BY column_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
