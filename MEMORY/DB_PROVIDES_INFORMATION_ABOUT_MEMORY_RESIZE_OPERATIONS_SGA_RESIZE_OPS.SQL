 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Provides information about memory resize operations. 
--  Requirements  : Access to the v$ views. 
-- Call Syntax  : @sga_resize_ops 
-- ----------------------------------------------------------------------------- 
------ 
 
SET LINESIZE 200 
 
COLUMN parameter FORMAT A25 
 
  SELECT   start_time, 
       end_time, 
       component, 
       oper_type, 
       oper_mode, 
       parameter, 
       ROUND(initial_size/1024/1024) AS initial_size_mb, 
       ROUND(target_size/1024/1024) AS target_size_mb, 
       ROUND(final_size/1024/1024) AS final_size_mb, 
       status 
FROM   v$sga_resize_ops 
ORDER BY start_time; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
