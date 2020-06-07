 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays histogram of the event waits times. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @event_histogram "(event-name)" 
-- ----------------------------------------------------------------------------- 
------ 
 
SET VERIFY OFF 
COLUMN event FORMAT A30 
 
  SELECT   event#, 
       event, 
       wait_time_milli, 
       wait_count 
FROM   v$event_histogram 
  WHERE    event LIKE '%&1%' 
ORDER BY event, wait_time_milli; 
 
COLUMN FORMAT DEFAULT 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
