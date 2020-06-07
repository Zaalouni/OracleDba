 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Provides information about extended statistics. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @extended_stats 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
COLUMN owner FORMAT A20 
COLUMN extension_name FORMAT A15 
COLUMN extension FORMAT A50 
 
  SELECT   owner, table_name, extension_name, extension 
FROM     dba  _stat_extensions 
ORDER by owner, table_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
