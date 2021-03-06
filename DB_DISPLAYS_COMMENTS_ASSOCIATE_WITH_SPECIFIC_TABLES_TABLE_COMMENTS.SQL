 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays comments associate with specific tables. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @table_comments (schema or all) (table-name or partial match) 
-- ----------------------------------------------------------------------------- 
------ 
SET VERIFY OFF 
COLUMN table_name FORMAT A30 
COLUMN comments   FORMAT A40 
 
  SELECT   table_name, 
       comments 
FROM     dba  _tab_comments 
  WHERE    owner = DECODE(UPPER('&1'), 'ALL', owner, UPPER('&1')) 
AND    table_name LIKE UPPER('%&2%') 
ORDER BY table_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
