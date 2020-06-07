 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about all directories. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @directories 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 150 
 
COLUMN owner FORMAT A20 
COLUMN directory_name FORMAT A25 
COLUMN directory_path FORMAT A80 
 
  SELECT   * 
FROM     dba  _directories 
ORDER BY owner, directory_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
