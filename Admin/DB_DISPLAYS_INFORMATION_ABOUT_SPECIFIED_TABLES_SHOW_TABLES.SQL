 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : www.aws-senior.com 
-- Description  : Displays information about specified tables. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @show_tables (schema) 
-- ----------------------------------------------------------------------------- 
------ 
SET VERIFY OFF 
SET LINESIZE 200 
 
COLUMN owner FORMAT A20 
COLUMN table_name FORMAT A30 
 
  SELECT   t.table_name, 
       t.  tablespace  _name, 
       t.num_rows, 
       t.avg_row_len, 
       t.blocks, 
       t.empty_blocks, 
       ROUND(t.blocks * ts.block_size/1024/1024,2) AS size_mb 
FROM     dba  _tables t 
       JOIN   dba  _  tablespace  s ts ON t.  tablespace  _name = ts.  tablespace  _name 
  WHERE    t.owner = UPPER('&1') 
ORDER BY t.table_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
