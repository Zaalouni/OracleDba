
--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -Displays Access to the DBA views
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET PAGESIZE 60
SET LINESIZE 300
SET LINESIZE 200
COLUMN name FORMAT A30
COLUMN network_name FORMAT A50
COLUMN pdb FORMAT A20
SELECT name,        network_name,        pdb   FROM   dba_services
ORDER BY name;


--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -Displays Access to the DBA views
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------