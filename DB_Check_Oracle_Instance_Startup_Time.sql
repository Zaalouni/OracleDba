--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -   Check the Oracle Instance Startup Time
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

 
SET FEEDBACK OFF
SET VERIFY OFF

SET LINES 200
SET PAGES 999
COLUMN INSTANCE_NAME FOR A20
SELECT INSTANCE_NAME,TO_CHAR(STARTUP_TIME, 'HH24:MI DD-MON-YY') "STARTUP TIME"
FROM V$INSTANCE;
  

--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -   Check the Oracle Instance Startup Time
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------