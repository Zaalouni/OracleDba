 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays memory allocations for the current database sessions. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @monitor_memory 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
 
COLUMN username FORMAT A20 
COLUMN module FORMAT A20 
 
  SELECT   NVL(a.username,'(oracle)') AS username, 
       a.module, 
       a.program, 
       Trunc(b.value/1024) AS memory_kb 
FROM   v$session a, 
       v$sesstat b, 
       v$statname c 
  WHERE    a.sid = b.sid 
AND    b.statistic# = c.statistic# 
AND    c.name = 'session pga memory' 
AND    a.program IS NOT NULL 
ORDER BY b.value DESC; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
