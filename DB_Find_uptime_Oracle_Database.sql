--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -   Find the uptime of Oracle Database
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET LINE 60
COLUMN HOSTNAME FOR A60
COLUMN INSTANCE_NAME FOR A60
COLUMN STIME FOR A60
COLUMN UPTIME FOR A60
SELECT
'HOSTNAME : ' || HOST_NAME
,'INSTANCE NAME : ' || INSTANCE_NAME
,'STARTED AT : ' || TO_CHAR(STARTUP_TIME,'DD-MON-YYYY HH24:MI:SS') STIME
,'UPTIME : ' || FLOOR(SYSDATE - STARTUP_TIME) || ' DAYS(S) ' ||
TRUNC( 24*((SYSDATE-STARTUP_TIME) -
TRUNC(SYSDATE-STARTUP_TIME))) || ' HOUR(S) ' ||
MOD(TRUNC(1440*((SYSDATE-STARTUP_TIME) -
TRUNC(SYSDATE-STARTUP_TIME))), 60) ||' MINUTE(S) ' ||
MOD(TRUNC(86400*((SYSDATE-STARTUP_TIME) -
TRUNC(SYSDATE-STARTUP_TIME))), 60) ||' SECONDS' UPTIME
FROM
SYS.V_$INSTANCE;
  

--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -   Find the uptime of Oracle Database
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------