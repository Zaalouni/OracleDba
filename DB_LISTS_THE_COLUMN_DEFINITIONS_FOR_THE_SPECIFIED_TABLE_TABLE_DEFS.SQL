 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Lists the column definitions for the specified table. 
-- Call Syntax  : @table_defs (tablee-name or all) 
-- ----------------------------------------------------------------------------- 
------ 
COLUMN column_id FORMAT 99 
COLUMN data_type FORMAT A10 
COLUMN nullable FORMAT A8 
COLUMN size FORMAT A6 
BREAK ON table_name SKIP 2 
SET PAGESIZE 0 
SET LINESIZE 200 
SET TRIMOUT ON 
SET TRIMSPOOL ON 
SET VERIFY OFF 
 
  SELECT   table_name, 
       column_id, 
       column_name, 
       data_type, 
       (CASE 
         WHEN data_type IN ('VARCHAR2','CHAR') THEN TO_CHAR(data_length) 
         WHEN data_scale IS NULL OR data_scale = 0 THEN TO_CHAR(data_pcision) 
         ELSE TO_CHAR(data_pcision) || ',' || TO_CHAR(data_scale) 
       END) "SIZE", 
       DECODE(nullable, 'Y', '', 'NOT NULL') nullable 
FROM   user_tab_columns 
  WHERE    table_name = DECODE(UPPER('&1'), 'ALL', table_name, UPPER('&1')) 
ORDER BY table_name, column_id; 
 
SET PAGESIZE 14 
SET LINESIZE 80 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
