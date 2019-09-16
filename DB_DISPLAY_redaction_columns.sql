--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -Displays information about columns related to redaction policies.
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET PAGESIZE 60


SET LINESIZE 300 VERIFY OFF

COLUMN object_owner FORMAT A20
COLUMN object_name FORMAT A30
COLUMN column_name FORMAT A30
COLUMN function_parameters FORMAT A30
COLUMN regexp_pattern FORMAT A30
COLUMN regexp_replace_string FORMAT A30
COLUMN column_description FORMAT A20

SELECT object_owner,    object_name,    column_name,       function_type,       function_parameters,       regexp_pattern,       regexp_replace_string,       regexp_position,       regexp_occurrence,       regexp_match_parameter,       column_description 
FROM   redaction_columns
WHERE  object_owner = DECODE(UPPER('&1'), 'ALL', object_owner, UPPER('&1'))
AND    object_name  = DECODE(UPPER('&2'), 'ALL', object_name, UPPER('&2'))
ORDER BY 1, 2, 3;

SET VERIFY ON


--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -Displays information about columns related to redaction policies.
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------