 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the number of sessions for each client machine. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @sessions_by_machine 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 1000 
 
  SELECT   machine, 
       NVL(active_count, 0) AS active, 
       NVL(inactive_count, 0) AS inactive, 
       NVL(killed_count, 0) AS killed 
FROM   (  SELECT   machine, status, count(*) AS quantity 
        FROM   v$session 
          GROUP BY   machine, status) 
PIVOT  (SUM(quantity) AS count FOR (status) IN ('ACTIVE' AS active, 'INACTIVE' A 
S inactive, 'KILLED' AS killed)) 
ORDER BY machine; 
 
SET PAGESIZE 14 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
