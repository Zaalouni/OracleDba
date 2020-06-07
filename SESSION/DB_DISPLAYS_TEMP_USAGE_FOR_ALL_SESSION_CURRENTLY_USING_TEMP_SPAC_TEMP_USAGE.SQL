 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays temp usage for all session currently using temp space 
. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @temp_usage 
-- ----------------------------------------------------------------------------- 
------ 
 
 
COLUMN temp_used FORMAT 9999999999 
 
  SELECT   NVL(s.username, '(background)') AS username, 
       s.sid, 
       s.serial#, 
       ROUND(ss.value/1024/1024, 2) AS temp_used_mb 
FROM   v$session s 
       JOIN v$sesstat ss ON s.sid = ss.sid 
       JOIN v$statname sn ON ss.statistic# = sn.statistic# 
  WHERE    sn.name = 'temp space allocated (bytes)' 
AND    ss.value > 0 
ORDER BY 1; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
