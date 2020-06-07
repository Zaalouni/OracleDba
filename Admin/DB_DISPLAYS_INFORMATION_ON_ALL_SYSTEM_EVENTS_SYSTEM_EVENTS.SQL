 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information on all system events. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @system_events 
-- ----------------------------------------------------------------------------- 
------ 
  SELECT   event, 
       total_waits, 
       total_timeouts, 
       time_waited, 
       average_wait, 
       time_waited_micro 
FROM v$system_event 
ORDER BY event; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
