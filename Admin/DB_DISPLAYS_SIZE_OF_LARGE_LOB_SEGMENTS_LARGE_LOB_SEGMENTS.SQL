 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays size of large LOB segments. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @large_lob_segments (rows) 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 500 VERIFY OFF 
COLUMN owner FORMAT A30 
COLUMN table_name FORMAT A30 
COLUMN column_name FORMAT A30 
COLUMN segment_name FORMAT A30 
COLUMN   tablespace  _name FORMAT A30 
COLUMN size_mb FORMAT 99999999.00 
 
  SELECT   * 
FROM   (  SELECT   l.owner, 
               l.table_name, 
               l.column_name, 
               l.segment_name, 
               l.  tablespace  _name, 
               ROUND(s.bytes/1024/1024,2) size_mb 
        FROM     dba  _lobs l 
               JOIN   dba  _segments s ON s.owner = l.owner AND s.segment_name = l.s 
egment_name 
        ORDER BY 6 DESC) 
  WHERE    ROWNUM <= &1; 
 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
