 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays space usage for each datafile. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @free_space 
--                12-OCT-2012 - Amended to include auto-extend and maxsize. 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 100 
SET LINESIZE 265 
 
COLUMN   tablespace  _name FORMAT A20 
COLUMN file_name FORMAT A50 
 
  SELECT   df.  tablespace  _name, 
       df.file_name, 
       df.size_mb, 
       f.free_mb, 
       df.max_size_mb, 
       f.free_mb + (df.max_size_mb - df.size_mb) AS max_free_mb, 
       RPAD(' '|| RPAD('X',ROUND((df.max_size_mb-(f.free_mb + (df.max_size_mb - 
df.size_mb)))/max_size_mb*10,0), 'X'),11,'-') AS used_pct 
FROM   (  SELECT   file_id, 
               file_name, 
                 tablespace  _name, 
               TRUNC(bytes/1024/1024) AS size_mb, 
               TRUNC(GREATEST(bytes,maxbytes)/1024/1024) AS max_size_mb 
        FROM     dba  _data_files) df, 
       (  SELECT   TRUNC(SUM(bytes)/1024/1024) AS free_mb, 
               file_id 
        FROM   dba  _free_space 
          GROUP BY   file_id) f 
  WHERE    df.file_id = f.file_id (+) 
ORDER BY df.  tablespace  _name, 
         df.file_name; 
 
PROMPT 
SET PAGESIZE 14 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
