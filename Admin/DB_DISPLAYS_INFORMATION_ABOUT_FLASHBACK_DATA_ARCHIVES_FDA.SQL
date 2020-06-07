 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about flashback data archives. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @fda 
-- ----------------------------------------------------------------------------- 
------ 
 
SET LINESIZE 150 
 
COLUMN owner_name FORMAT A20 
COLUMN flashback_archive_name FORMAT A22 
COLUMN create_time FORMAT A20 
COLUMN last_purge_time FORMAT A20 
 
  SELECT   owner_name, 
       flashback_archive_name, 
       flashback_archive#, 
       retention_in_days, 
       TO_CHAR(create_time, 'DD-MON-YYYY HH24:MI:SS') AS create_time, 
       TO_CHAR(last_purge_time, 'DD-MON-YYYY HH24:MI:SS') AS last_purge_time, 
       status 
FROM     dba  _flashback_archive 
ORDER BY owner_name, flashback_archive_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
