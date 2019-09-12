--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -   Displays Memory Values.
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET LINESIZE 200
SET PAGESIZE 1000
SET FEEDBACK OFF
SET VERIFY OFF

select substr(name,1,35) name, substr(value,1,25) value   from v$parameter
where name in ('db_cache_size','db_block_size','shared_pool_size','sort_area_size');  

--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -   Displays Memory Values.
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
