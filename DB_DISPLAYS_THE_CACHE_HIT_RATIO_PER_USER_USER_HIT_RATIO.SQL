 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the Cache Hit Ratio per user. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @user_hit_ratio 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 500 
COLUMN "Hit Ratio %" FORMAT 999.99 
 
  SELECT   a.username "Username", 
       b.consistent_gets "Consistent Gets", 
       b.block_gets "DB Block Gets", 
       b.physical_reads "Physical Reads", 
       Round(100* (b.consistent_gets + b.block_gets - b.physical_reads) / 
       (b.consistent_gets + b.block_gets),2) "Hit Ratio %" 
FROM   v$session a, 
       v$sess_io b 
  WHERE    a.sid = b.sid 
AND    (b.consistent_gets + b.block_gets) > 0 
AND    a.username IS NOT NULL; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
