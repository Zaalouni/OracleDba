 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about flashback data archives. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @fda_tables 
-- ----------------------------------------------------------------------------- 
------ 
 
SET LINESIZE 150 
 
COLUMN owner_name FORMAT A20 
COLUMN table_name FORMAT A20 
COLUMN flashback_archive_name FORMAT A22 
COLUMN archive_table_name FORMAT A20 
 
  SELECT   owner_name, 
       table_name, 
       flashback_archive_name, 
       archive_table_name, 
       status 
FROM     dba  _flashback_archive_tables 
ORDER BY owner_name, table_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
