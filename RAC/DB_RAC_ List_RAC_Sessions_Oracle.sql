--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -    List RAC Sessions 
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET LINESIZE 200
SET PAGESIZE 1000
SET FEEDBACK OFF
SET VERIFY OFF
 

COLUMN inst_id FORMAT 9
COLUMN username FORMAT A10
COLUMN lockwait FORMAT A8
COLUMN program FORMAT A26
COLUMN sid FORMAT 9999

COLUMN serial# FORMAT 99999
COLUMN spid FORMAT A5
COLUMN logon_time FORMAT A20
COLUMN status FORMAT A10
COLUMN module FORMAT A24
COLUMN machine FORMAT A23
 
SELECT NVL(s.username, '(oracle)') AS username,
       s.inst_id,
       s.sid,
       s.serial#,
       p.spid,
       s.lockwait,
       s.status,
       s.module,
       s.machine,
       s.program,
       TO_CHAR(s.logon_Time,'DD-MON-YYYY HH24:MI:SS') AS logon_time
FROM   gv$session s,        gv$process p
WHERE  s.paddr   = p.addr
AND    s.inst_id = p.inst_id
ORDER BY s.username, s.osuser
/

--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -     List RAC Sessions 
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
