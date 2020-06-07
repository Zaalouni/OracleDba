 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays a list of   tablespace  s that are nearly full. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @ts_full 
-                 13-OCT-2012 - Included support for auto-extend and maxsize. 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 100 
 
PROMPT Tablespaces nearing 0% free 
PROMPT *************************** 
  SELECT     tablespace  _name, 
       size_mb, 
       free_mb, 
       max_size_mb, 
       max_free_mb, 
       TRUNC((max_free_mb/max_size_mb) * 100) AS free_pct 
FROM   ( 
          SELECT   a.  tablespace  _name, 
               b.size_mb, 
               a.free_mb, 
               b.max_size_mb, 
               a.free_mb + (b.max_size_mb - b.size_mb) AS max_free_mb 
        FROM   (  SELECT     tablespace  _name, 
                       TRUNC(SUM(bytes)/1024/1024) AS free_mb 
                FROM     dba  _free_space 
                  GROUP BY     tablespace  _name) a, 
               (  SELECT     tablespace  _name, 
                       TRUNC(SUM(bytes)/1024/1024) AS size_mb, 
                       TRUNC(SUM(GREATEST(bytes,maxbytes))/1024/1024) AS max_siz 
e_mb 
                FROM     dba  _data_files 
                  GROUP BY     tablespace  _name) b 
          WHERE    a.  tablespace  _name = b.  tablespace  _name 
       ) 
  WHERE    ROUND((max_free_mb/max_size_mb) * 100,2) < 10; 
 
SET PAGESIZE 14 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
