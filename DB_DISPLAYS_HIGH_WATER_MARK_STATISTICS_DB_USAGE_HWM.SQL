 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays high water mark statistics. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @db_usage_hwm 
-- ----------------------------------------------------------------------------- 
------ 
 
COLUMN name  FORMAT A40 
COLUMN highwater FORMAT 999999999999 
COLUMN last_value FORMAT 999999999999 
SET PAGESIZE 24 
 
  SELECT   hwm1.name, 
       hwm1.highwater, 
       hwm1.last_value 
FROM     dba  _high_water_mark_statistics hwm1 
  WHERE    hwm1.version = (  SELECT   MAX(hwm2.version) 
                       FROM     dba  _high_water_mark_statistics hwm2 
                         WHERE    hwm2.name = hwm1.name) 
ORDER BY hwm1.name; 
 
COLUMN FORMAT DEFAULT 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
