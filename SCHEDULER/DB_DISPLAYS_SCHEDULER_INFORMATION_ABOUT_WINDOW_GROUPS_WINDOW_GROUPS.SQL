 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays scheduler information about window groups. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @window_groups 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 250 
 
COLUMN comments FORMAT A40 
 
  SELECT   window_group_name, 
       enabled, 
       number_of_windows, 
       comments 
FROM     dba  _scheduler_window_groups 
ORDER BY window_group_name; 
 
  SELECT   window_group_name, 
       window_name 
FROM     dba  _scheduler_wingroup_members 
ORDER BY window_group_name, window_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
