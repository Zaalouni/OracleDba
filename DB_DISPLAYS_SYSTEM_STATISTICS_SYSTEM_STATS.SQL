 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays system statistics. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @system_stats (statistic-name or all) 
-- ----------------------------------------------------------------------------- 
------ 
SET VERIFY OFF 
 
COLUMN name FORMAT A50 
COLUMN value FORMAT 99999999999999999999 
 
  SELECT   sn.name, ss.value 
FROM   v$sysstat ss, 
       v$statname sn 
  WHERE    ss.statistic# = sn.statistic# 
AND    sn.name LIKE '%' || DECODE(LOWER('&1'), 'all', '', LOWER('&1')) || '%'; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
