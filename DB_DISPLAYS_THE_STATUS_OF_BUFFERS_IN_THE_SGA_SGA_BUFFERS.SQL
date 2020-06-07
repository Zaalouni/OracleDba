 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : www.aws-senior.com 
-- Description  : Displays the status of buffers in the SGA. 
--  Requirements  : Access to the v$ and DBA views. 
-- Call Syntax  : @sga_buffers 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
COLUMN object_name FORMAT A30 
 
  SELECT   t.name AS   tablespace  _name, 
       o.object_name, 
       SUM(DECODE(bh.status, 'free', 1, 0)) AS free, 
       SUM(DECODE(bh.status, 'xcur', 1, 0)) AS xcur, 
       SUM(DECODE(bh.status, 'scur', 1, 0)) AS scur, 
       SUM(DECODE(bh.status, 'cr', 1, 0)) AS cr, 
       SUM(DECODE(bh.status, 'read', 1, 0)) AS read, 
       SUM(DECODE(bh.status, 'mrec', 1, 0)) AS mrec, 
       SUM(DECODE(bh.status, 'irec', 1, 0)) AS irec 
FROM   v$bh bh 
       JOIN   dba  _objects o ON o.object_id = bh.objd 
       JOIN v$  tablespace   t ON t.ts# = bh.ts# 
  GROUP BY   t.name, o.object_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
