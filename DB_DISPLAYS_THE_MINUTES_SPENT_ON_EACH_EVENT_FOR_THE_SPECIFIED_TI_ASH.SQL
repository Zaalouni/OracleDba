 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the minutes spent on each event for the specified tim 
e. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @active_session_waits (mins) 
-- ----------------------------------------------------------------------------- 
------ 
 
SET VERIFY OFF 
 
  SELECT   NVL(a.event, 'ON CPU') AS event, 
       COUNT(*) AS total_wait_time 
FROM   v$active_session_history a 
  WHERE    a.sample_time > SYSDATE - &1/(24*60) 
  GROUP BY   a.event 
ORDER BY total_wait_time DESC; 
 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
