 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Lists the volume of archived redo by day for the specified num 
ber of days. 
-- Call Syntax  : @redo_by_day (days) 
--  Requirements  : Access to the v$views. 
-- ----------------------------------------------------------------------------- 
------ 
 
SET VERIFY OFF 
 
  SELECT   TRUNC(first_time) AS day, 
       ROUND(SUM(blocks * block_size)/1024/1024/1024,2) size_gb 
FROM   v$archived_log 
  WHERE    TRUNC(first_time) >= TRUNC(SYSDATE) - &1 
  GROUP BY   TRUNC(first_time) 
ORDER BY TRUNC(first_time); 
 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
