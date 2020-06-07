 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the undo space currently in use by users. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @user_undo_space 
-- ----------------------------------------------------------------------------- 
------ 
 
COLUMN sid_serial FORMAT A20 
COLUMN username FORMAT A20 
COLUMN program FORMAT A30 
COLUMN undoseg FORMAT A25 
COLUMN undo FORMAT A20 
SET LINESIZE 120 
 
  SELECT   TO_CHAR(s.sid)||','||TO_CHAR(s.serial#) AS sid_serial, 
       NVL(s.username, '(oracle)') AS username, 
       s.program, 
       r.name undoseg, 
       t.used_ublk * TO_NUMBER(x.value)/1024||'K' AS undo 
FROM   v$rollname    r, 
       v$session     s, 
       v$transaction t, 
       v$parameter   x 
  WHERE    s.taddr = t.addr 
AND    r.usn   = t.xidusn(+) 
AND    x.name  = 'db_block_size'; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
