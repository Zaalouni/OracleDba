--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -     List RMAN Jobs 
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET LINESIZE 200
SET PAGESIZE 1000
SET FEEDBACK OFF
SET VERIFY OFF
 
COL compression_ratio for 99999 head Cmprsn|Ratio
COL elapsed for 9999.99 head Elapsed|Mins
COL end_time for a18 head "End Time"
COL hrs for 999,999
COL input_type head "Input Type"
COL session_key for 9999999 head Session|Key
COL start_time for a18 Head "Start Time"
COL status for a23 head "Job Status"
 
select session_key,input_type,status,
        to_char(start_time,'dd/mm/yy hh24:mi:ss') start_time,
        to_char(end_time,'dd/mm/yy hh24:mi:ss') end_time,
        (elapsed_seconds/60) elapsed,COMPRESSION_RATIO
from v$rman_backup_job_details
order by session_key
/



--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -      List RMAN Jobs  
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
