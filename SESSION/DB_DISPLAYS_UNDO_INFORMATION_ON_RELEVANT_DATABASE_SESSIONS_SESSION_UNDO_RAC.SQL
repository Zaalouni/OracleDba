 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays undo information on relevant database sessions. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @session_undo_rac 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
 
COLUMN username FORMAT A15 
 
  SELECT   s.inst_id, 
       s.username, 
       s.sid, 
       s.serial#, 
       t.used_ublk, 
       t.used_urec, 
       rs.segment_name, 
       r.rssize, 
       r.status 
FROM   gv$transaction t, 
       gv$session s, 
       gv$rollstat r, 
         dba  _rollback_segs rs 
  WHERE    s.saddr = t.ses_addr 
AND    s.inst_id = t.inst_id 
AND    t.xidusn = r.usn 
AND    t.inst_id = r.inst_id 
AND    rs.segment_id = t.xidusn 
ORDER BY t.used_ublk DESC; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
