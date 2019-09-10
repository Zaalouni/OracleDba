--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -    List Database Session Waits 
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET LINESIZE 300
SET PAGESIZE 60
COLUMN username FORMAT A20
COLUMN event FORMAT A25
COLUMN wait_class FORMAT A20
 
SELECT NVL(s.username, '(oracle)') AS username,
s.sid,
s.serial#,
sw.event,
sw.wait_class,
sw.wait_time,
sw.seconds_in_wait,
sw.state
FROM   v$session_wait sw, v$session s
WHERE  s.sid = sw.sid
ORDER BY sw.seconds_in_wait DESC
/


--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -     List Database Session Waits  
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
