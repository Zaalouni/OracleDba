 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about all current latch holders. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @latch_holders 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
 
  SELECT   l.name "Latch Name", 
       lh.pid "PID", 
       lh.sid "SID", 
       l.gets "Gets (Wait)", 
       l.misses "Misses (Wait)", 
       l.sleeps "Sleeps (Wait)", 
       l.immediate_gets "Gets (No Wait)", 
       l.immediate_misses "Misses (Wait)" 
FROM   v$latch l, 
       v$latchholder lh 
  WHERE    l.addr = lh.laddr 
ORDER BY l.name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
