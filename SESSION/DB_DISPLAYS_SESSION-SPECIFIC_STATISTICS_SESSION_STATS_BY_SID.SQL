 
 
-- ----------------------------------------------------------------------------- 
------ 
.sql 
--  Author        : www.aws-senior.com 
-- Description  : Displays session-specific statistics. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @session_stats_by_sid (sid) (statistic-name or all) 
-- ----------------------------------------------------------------------------- 
------ 
SET VERIFY OFF 
 
  SELECT   sn.name, ss.value 
FROM   v$sesstat ss, 
       v$statname sn 
  WHERE    ss.statistic# = sn.statistic# 
AND    ss.sid = &1 
AND    sn.name LIKE '%' || DECODE(LOWER('&2'), 'all', '', LOWER('&2')) || '%'; 
 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
