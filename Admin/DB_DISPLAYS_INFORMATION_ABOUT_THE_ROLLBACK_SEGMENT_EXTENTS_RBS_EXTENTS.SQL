 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about the rollback segment extents. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @rbs_extents 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 500 
SET PAGESIZE 1000 
SET VERIFY OFF 
 
  SELECT   Substr(a.segment_name,1,30) "Segment Name", 
       b.status "Status", 
       Count(*) "Extents", 
       b.max_extents "Max Extents", 
       Trunc(b.initial_extent/1024) "Initial Extent (Kb)", 
       Trunc(b.next_extent/1024) "Next Extent (Kb)", 
       Trunc(c.bytes/1024) "Size (Kb)" 
FROM     dba  _extents a, 
         dba  _rollback_segs b, 
         dba  _segments c 
  WHERE    a.segment_type = 'ROLLBACK' 
AND    b.segment_name = a.segment_name 
AND    b.segment_name = c.segment_name 
GROUP  BY a.segment_name, 
          b.status, 
          b.max_extents, 
          b.initial_extent, 
          b.next_extent, 
          c.bytes 
ORDER  BY a.segment_name; 
 
SET PAGESIZE 14 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
