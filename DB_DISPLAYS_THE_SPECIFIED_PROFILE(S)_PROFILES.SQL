 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the specified profile(s). 
-- Call Syntax  : @profiles (profile | part of profile | all) 
-- ----------------------------------------------------------------------------- 
------ 
 
SET LINESIZE 150 PAGESIZE 20 VERIFY OFF 
 
BREAK ON profile SKIP 1 
 
COLUMN profile FORMAT A35 
COLUMN resource_name FORMAT A40 
COLUMN limit FORMAT A15 
 
  SELECT   profile, 
       resource_type, 
       resource_name, 
       limit 
FROM     dba  _profiles 
  WHERE    profile LIKE (DECODE(UPPER('&1'), 'ALL', '%', UPPER('%&1%'))) 
ORDER BY profile, resource_type, resource_name; 
 
CLEAR BREAKS 
SET LINESIZE 80 PAGESIZE 14 VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
