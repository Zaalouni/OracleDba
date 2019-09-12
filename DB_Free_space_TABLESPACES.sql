--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB - Free space on TABLESPACES
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET LINESIZE 200
SET PAGESIZE 1000
SET FEEDBACK OFF
SET VERIFY OFF


select substr(a.tablespace_name,1,10) tablespace,
       round(sum(a.total1)/1024/1024, 1) Total,
       round(sum(a.total1)/1024/1024, 1)-
       round(sum(a.sum1)/1024/1024, 1) used,
       round(sum(a.sum1)/1024/1024, 1) Free,
       round(sum(a.sum1)/1024/1024,1)*100/round(sum(a.total1)/1024/1024,1) porciento_fr,
       round(sum(a.maxb)/1024/1024, 1) Largest,
       max(a.cnt) Fragment
from (select tablespace_name, 0 total1, sum(bytes) sum1,
             max(bytes) MAXB,count(bytes) cnt
       from dba_free_space
       group by tablespace_name
      union
       select tablespace_name, sum(bytes) total1, 0, 0, 0
        from dba_data_files
        group by tablespace_name) a
 group by a.tablespace_name;
 
 

--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB - Free space on TABLESPACES
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
