 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about flashback data archives. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @fda_ts 
-- ----------------------------------------------------------------------------- 
------ 
 
SET LINESIZE 150 
 
COLUMN flashback_archive_name FORMAT A22 
COLUMN   tablespace  _name FORMAT A20 
COLUMN quota_in_mb FORMAT A11 
 
  SELECT   flashback_archive_name, 
       flashback_archive#, 
         tablespace  _name, 
       quota_in_mb 
FROM     dba  _flashback_archive_ts 
ORDER BY flashback_archive_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
