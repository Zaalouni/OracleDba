--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  Displays number of extents for all indexes
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

 

SELECT d.index_name,
       Count(e.segment_name) extents,
       d.max_extents,
       t.num_rows "ROWS",
       Trunc(d.initial_extent/1024) "INITIAL K",
       Trunc(d.next_extent/1024) "NEXT K",
       t.table_name
FROM   all_tables t,       all_indexes d,        dba_extents e
WHERE  d.table_name   = t.table_name
AND    d.owner        = t.owner
AND    e.segment_name = d.index_name
AND    e.owner        = d.owner
AND    d.table_name   = Decode(Upper('&&1'),'ALL',d.table_name,Upper('&&1'))
AND    d.owner        = Upper('&&2')
GROUP BY t.table_name,          d.index_name,          d.max_extents,          t.num_rows,         d.initial_extent,
         d.next_extent
HAVING   Count(e.segment_name) > 5
ORDER BY Count(e.segment_name) DESC;

SET PAGESIZE 18
SET VERIFY ON


--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  Displays number of extents for all indexes
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------