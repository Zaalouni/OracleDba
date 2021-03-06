--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -   Displays the SQL statement held at the specified address.
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET LINESIZE 500
SET PAGESIZE 1000
SET FEEDBACK OFF
SET VERIFY OFF

SELECT a.sql_text  FROM   v$sqltext_with_newlines a
WHERE  a.address = UPPER('&&1')
ORDER BY a.piece;



-- Displays the SQL statement held by SID

SELECT a.sql_text
FROM   v$sqltext a,       v$session b
WHERE  a.address = b.sql_address
AND    a.hash_value = b.sql_hash_value
AND    b.sid = &1




--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -   Displays the SQL statement held at the specified address.
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
