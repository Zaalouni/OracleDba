 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays session-specific statistics. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @session_stats (statistic-name or all) 
-- ----------------------------------------------------------------------------- 
------ 
SET VERIFY OFF 
 
  SELECT   sn.name, ss.value 
FROM   v$sesstat ss, 
       v$statname sn, 
       v$session s 
  WHERE    ss.statistic# = sn.statistic# 
AND    s.sid = ss.sid 
AND    s.audsid = SYS_CONTEXT('USERENV','SESSIONID') 
AND    sn.name LIKE '%' || DECODE(LOWER('&1'), 'all', '', LOWER('&1')) || '%'; 
 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
