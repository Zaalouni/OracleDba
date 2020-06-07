 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : www.aws-senior.com 
-- Description  : Displays information about specified indexes. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @show_indexes (schema) (table-name or all) 
-- ----------------------------------------------------------------------------- 
------ 
SET VERIFY OFF 
SET LINESIZE 200 
 
COLUMN table_owner FORMAT A20 
COLUMN index_owner FORMAT A20 
COLUMN index_type FORMAT A12 
COLUMN   tablespace  _name FORMAT A20 
 
  SELECT   table_owner, 
       table_name, 
       owner AS index_owner, 
       index_name, 
         tablespace  _name, 
       num_rows, 
       status, 
       index_type 
FROM     dba  _indexes 
  WHERE    table_owner = UPPER('&1') 
AND    table_name = DECODE(UPPER('&2'), 'ALL', table_name, UPPER('&2')) 
ORDER BY table_owner, table_name, index_owner, index_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
