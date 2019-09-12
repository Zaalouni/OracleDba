--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  Identify the SQL responsible for the most BUFFER HITS and/or DISK READS.
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET LINESIZE 200
SET PAGESIZE 1000
SET FEEDBACK OFF
SET VERIFY OFF

SELECT SUBSTR(sql_text,1,80) Text, disk_reads, buffer_gets, executions
   FROM v$sqlarea
   WHERE executions  > 0
    AND buffer_gets > 100000
    and DISK_READS > 100000
   ORDER BY (DISK_READS * 100) + BUFFER_GETS desc;


--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  Identify the SQL responsible for the most BUFFER HITS and/or DISK READ
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
