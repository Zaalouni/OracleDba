--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  List Job Schedules 
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET LINESIZE 200
SET PAGESIZE 1000
SET FEEDBACK OFF
SET VERIFY OFF

 
SET HEADING ON
SET LINESIZE 300
SET PAGESIZE 60
COLUMN owner FORMAT A20
COLUMN schedule_name FORMAT A30
COLUMN start_date FORMAT A20
COLUMN repeat_interval FORMAT A20
COLUMN end_date FORMAT A20
COLUMN comments FORMAT A20
 
SELECT owner, schedule_name,  start_date, repeat_interval, end_date, comments FROM   dba_scheduler_schedules
ORDER BY owner, schedule_name
/


--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -   List Job Schedules 
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
