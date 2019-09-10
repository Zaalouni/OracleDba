--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -   Displays National Language Suppport (NLS)
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET LINESIZE 200
SET PAGESIZE 1000
SET FEEDBACK OFF
SET VERIFY OFF

COLUMN parameter FORMAT A45
COLUMN value FORMAT A45

-- Display Database parameters 
SELECT * FROM nls_database_parameters ORDER BY 1;

-- Display Instance parameters 
SELECT * FROM nls_instance_parameters ORDER BY 1;

-- Display Session parameters 
SELECT * FROM nls_session_parameters ORDER BY 1;


--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -   Displays National Language Suppport (NLS)
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
