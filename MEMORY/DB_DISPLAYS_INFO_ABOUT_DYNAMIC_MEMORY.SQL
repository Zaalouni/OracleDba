--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB - Displays  information about dynamic memory components.
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
SET PAGESIZE 60
SET LINESIZE 300

COLUMN component FORMAT A30

SELECT  component,
        ROUND(current_size/1024/1024) AS current_size_mb,
        ROUND(min_size/1024/1024) AS min_size_mb,
        ROUND(max_size/1024/1024) AS max_size_mb
FROM    v$memory_dynamic_components
WHERE   current_size != 0
ORDER BY component;

--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB - Displays  information about dynamic memory components.
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
