 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays size of large segments. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @large_segments (rows) 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 500 VERIFY OFF 
COLUMN owner FORMAT A30 
COLUMN segment_name FORMAT A30 
COLUMN   tablespace  _name FORMAT A30 
COLUMN size_mb FORMAT 99999999.00 
 
  SELECT   * 
FROM   (  SELECT   owner, 
               segment_name, 
               segment_type, 
                 tablespace  _name, 
               ROUND(bytes/1024/1024,2) size_mb 
        FROM     dba  _segments 
        ORDER BY 5 DESC) 
  WHERE    ROWNUM <= &1; 
 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
