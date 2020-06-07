 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays temp space usage for each datafile. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @temp_free_space 
--                13-OCT-2012 - Amended to include auto-extend and maxsize. 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 255 
 
COLUMN   tablespace  _name FORMAT A20 
COLUMN file_name FORMAT A40 
 
  SELECT   tf.  tablespace  _name, 
       tf.file_name, 
       tf.size_mb, 
       f.free_mb, 
       tf.max_size_mb, 
       f.free_mb + (tf.max_size_mb - tf.size_mb) AS max_free_mb, 
       RPAD(' '|| RPAD('X',ROUND((tf.max_size_mb-(f.free_mb + (tf.max_size_mb - 
tf.size_mb)))/max_size_mb*10,0), 'X'),11,'-') AS used_pct 
FROM   (  SELECT   file_id, 
               file_name, 
                 tablespace  _name, 
               TRUNC(bytes/1024/1024) AS size_mb, 
               TRUNC(GREATEST(bytes,maxbytes)/1024/1024) AS max_size_mb 
        FROM     dba  _temp_files) tf, 
       (  SELECT   TRUNC(SUM(bytes)/1024/1024) AS free_mb, 
               file_id 
        FROM   dba  _free_space 
          GROUP BY   file_id) f 
  WHERE    tf.file_id = f.file_id (+) 
ORDER BY tf.  tablespace  _name, 
         tf.file_name; 
 
SET PAGESIZE 14 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
