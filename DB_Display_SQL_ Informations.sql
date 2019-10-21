--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -   Display SQL Informations
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET LINESIZE 300
SET PAGESIZE 60 
SELECT    'USERNAME : ' || s.username  || CHR (10)   
		|| 'SCHEMA : '  || s.schemaname || CHR (10) 
		|| 'OSUSER : '  || s.osuser    || CHR (10)  
		|| 'PROGRAM : ' || s.program   || CHR (10)  
		|| 'MACHINE : ' || s.machine   || CHR (10)  
		|| 'TERMINAL : ' || s.terminal  || CHR (10)  
		|| 'SPID : '    || p.spid      || CHR (10)  
		|| 'SID : '     || s.sid       || CHR (10)  
		|| 'SERIAL# : ' || s.serial#   || CHR (10)  
		|| 'TYPE : '    || s.TYPE      || CHR (10)  
		|| 'SQL ID : '  || q.sql_id    || CHR (10)  
		|| 'CHILD_NUMBER : '  || q.child_number    || CHR (10)  
		|| 'SQL TEXT : ' || q.sql_text 
          RESULT
  FROM v$session s, v$process p, v$sql q
 WHERE s.paddr = p.addr AND s.sql_id = q.sql_id(+) AND p.spid = '&&MY_PID';
 


--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB - Display SQL Informations
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------