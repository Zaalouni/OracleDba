--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -    display the execution plan with explain plan
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET LINESIZE 300
SET PAGESIZE 60 

set lines 140 pages 2000

explain plan for
  select sql_fulltext 
  from v$session a, v$sqlarea b 
  where a.sql_address=b.address(+) and status = 'ACTIVE';

@?/rdbms/admin/utlxpls

explain plan for
  select sysdate from dual;

@?/rdbms/admin/utlxpls


--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  display the execution plan with explain plan
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------