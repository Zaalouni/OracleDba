
--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -Displays information about recent PDB plugin violations..
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET PAGESIZE 60
SET LINESIZE 200

COLUMN time FORMAT A30
COLUMN name FORMAT A30
COLUMN cause FORMAT A30
COLUMN message FORMAT A30

SELECT time, name, cause, message    FROM   pdb_plug_in_violations   WHERE  time > TRUNC(SYSTIMESTAMP)
ORDER BY time;



--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -Displays information about recent PDB plugin violations.
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------