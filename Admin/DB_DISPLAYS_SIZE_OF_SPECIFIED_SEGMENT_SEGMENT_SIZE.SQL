 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays size of specified segment. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @segment_size (owner) (segment_name) 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 500 VERIFY OFF 
COLUMN segment_name FORMAT A30 
 
  SELECT   owner, 
       segment_name, 
       segment_type, 
         tablespace  _name, 
       ROUND(bytes/1024/1024,2) size_mb 
FROM     dba  _segments 
  WHERE    owner = UPPER('&1') 
AND    segment_name LIKE '%' || UPPER('&2') || '%' 
ORDER BY 1, 2; 
 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
