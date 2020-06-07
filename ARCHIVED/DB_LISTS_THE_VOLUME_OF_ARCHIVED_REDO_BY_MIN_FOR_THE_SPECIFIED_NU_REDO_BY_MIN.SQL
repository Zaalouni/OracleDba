 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Lists the volume of archived redo by min for the specified num 
ber of hours. 
-- Call Syntax  : @redo_by_min (N number of minutes from now) 
--  Requirements  : Access to the v$views. 
-- ----------------------------------------------------------------------------- 
------ 
 
SET VERIFY OFF PAGESIZE 100 
 
WITH mins AS ( 
    SELECT   TRUNC(SYSDATE, 'MI') - (&1/(24*60)) + ((level-1)/(24*60)) AS mins 
  FROM   dual 
  CONNECT BY level <= &1 
) 
  SELECT   m.mins AS date_min, 
       ROUND(SUM(blocks * block_size)/1024/1024,2) size_mb 
FROM   mins m 
       LEFT OUTER JOIN v$archived_log al ON m.mins = TRUNC(al.first_time, 'MI') 
  GROUP BY   m.mins 
ORDER BY m.mins; 
 
SET VERIFY ON PAGESIZE 14 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
