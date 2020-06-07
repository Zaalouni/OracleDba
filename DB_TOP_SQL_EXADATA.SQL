--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  Top Sql in Exadata
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------


SET LINESIZE 150


	
SELECT * FROM (
    SELECT 
        sql_id, executions, physical_read_bytes
    FROM 
        v$sqlstats
    WHERE io_cell_offload_eligible_bytes = 0
    ORDER BY physical_read_bytes DESC
) 
WHERE 
    ROWNUM <= 10
/


--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  Top Sql in Exadata
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
