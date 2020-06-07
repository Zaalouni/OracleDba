 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays dispatcher statistics. 
--  Requirements  : Access to the v$ views. 
-- Call Syntax  : @dispatchers 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 500 
SET PAGESIZE 1000 
SET VERIFY OFF 
 
  SELECT   a.name "Name", 
       a.status "Status", 
       a.accept "Accept", 
       a.messages "Total Mesgs", 
       a.bytes "Total Bytes", 
       a.owned "Circs Owned", 
       a.idle "Total Idle Time", 
       a.busy "Total Busy Time", 
       Round(a.busy/(a.busy + a.idle),2) "Load" 
FROM   v$dispatcher a 
ORDER BY 1; 
 
SET PAGESIZE 14 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
