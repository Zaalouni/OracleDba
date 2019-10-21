--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -    Display unshared queries
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET LINESIZE 300
SET PAGESIZE 60 
set lines120 pages2000
spool non_shared.log
SELECT sysdate, a.hash_value, a.version_count , a.users_opening , a.users_executing, a.sharable_mem, a.sql_text, c.*
FROM v$sqlarea a, v$sql_shared_cursor c
WHERE a.address=c.address
and a.version_count > 5
order by a.version_count desc;
spool off

--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  Display unshared queries 
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------