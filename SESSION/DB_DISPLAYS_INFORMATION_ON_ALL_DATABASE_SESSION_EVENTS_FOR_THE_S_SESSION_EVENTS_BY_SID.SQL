 
 
-- ----------------------------------------------------------------------------- 
------ 
ql 
--  Author        : aws-senior.com 
-- Description  : Displays information on all database session events for the sp 
ecified sid. 
--                This is a rename of session_events. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @session_events_by_sid (sid) 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
SET PAGESIZE 1000 
SET VERIFY OFF 
 
COLUMN username FORMAT A20 
COLUMN event FORMAT A40 
 
  SELECT   NVL(s.username, '(oracle)') AS username, 
       s.sid, 
       s.serial#, 
       se.event, 
       se.total_waits, 
       se.total_timeouts, 
       se.time_waited, 
       se.average_wait, 
       se.max_wait, 
       se.time_waited_micro 
FROM   v$session_event se, 
       v$session s 
  WHERE    s.sid = se.sid 
AND    s.sid = &1 
ORDER BY se.time_waited DESC; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
