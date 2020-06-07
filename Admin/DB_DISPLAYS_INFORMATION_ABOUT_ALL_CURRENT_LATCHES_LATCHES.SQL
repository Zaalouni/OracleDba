 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about all current latches. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @latches 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
 
  SELECT   l.latch#, 
       l.name, 
       l.gets, 
       l.misses, 
       l.sleeps, 
       l.immediate_gets, 
       l.immediate_misses, 
       l.spin_gets 
FROM   v$latch l 
ORDER BY l.name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
