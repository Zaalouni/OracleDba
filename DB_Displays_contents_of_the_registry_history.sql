--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  Displays contents of the registry history
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------


SET LINESIZE 150

SELECT TO_CHAR(action_time, 'DD-MON-YYYY') AS TIME,
action,
namespace,
version,
id,
comments,
bundle_series
FROM   sys.registry$history    ORDER by 1;


/




--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  Displays contents of the registry history
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
