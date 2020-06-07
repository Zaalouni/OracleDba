 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information on all database session waits. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @session_waits 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
SET PAGESIZE 1000 
 
COLUMN username FORMAT A20 
COLUMN event FORMAT A30 
COLUMN wait_class FORMAT A15 
 
  SELECT   NVL(s.username, '(oracle)') AS username, 
       s.sid, 
       s.serial#, 
       sw.event, 
       sw.wait_class, 
       sw.wait_time, 
       sw.seconds_in_wait, 
       sw.state 
FROM   v$session_wait sw, 
       v$session s 
  WHERE    s.sid = sw.sid 
ORDER BY sw.seconds_in_wait DESC; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
