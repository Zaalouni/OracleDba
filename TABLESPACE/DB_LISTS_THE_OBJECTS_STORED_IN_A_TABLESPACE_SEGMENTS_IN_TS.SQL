 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Lists the objects stored in a   tablespace  . 
-- Call Syntax  : @objects_in_ts (  tablespace  -name) 
-- ----------------------------------------------------------------------------- 
------ 
 
SET PAGESIZE 20 
BREAK ON segment_type SKIP 1 
 
COLUMN segment_name FORMAT A30 
COLUMN partition_name FORMAT A30 
 
  SELECT   segment_type, 
       segment_name, 
       partition_name, 
       ROUND(bytes/2014/1024,2) AS size_mb 
FROM     dba  _segments 
  WHERE      tablespace  _name = UPPER('&1') 
ORDER BY 1, 2; 
 
CLEAR BREAKS 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
