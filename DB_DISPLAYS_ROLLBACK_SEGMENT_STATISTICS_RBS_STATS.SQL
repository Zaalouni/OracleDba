 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays rollback segment statistics. 
--  Requirements  : Access to the v$ & DBA views. 
-- Call Syntax  : @rbs_stats 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 500 
SET PAGESIZE 1000 
SET VERIFY OFF 
 
  SELECT   b.name "Segment Name", 
       Trunc(c.bytes/1024) "Size (Kb)", 
       a.optsize "Optimal", 
       a.shrinks "Shrinks", 
       a.aveshrink "Avg Shrink", 
       a.wraps "Wraps", 
       a.extends "Extends" 
FROM   v$rollstat a, 
       v$rollname b, 
         dba  _segments c 
  WHERE    a.usn  = b.usn 
AND    b.name = c.segment_name 
ORDER BY b.name; 
 
SET PAGESIZE 14 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
