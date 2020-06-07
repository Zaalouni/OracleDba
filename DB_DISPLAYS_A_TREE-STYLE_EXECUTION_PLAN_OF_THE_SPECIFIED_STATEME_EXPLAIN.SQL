 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays a tree-style execution plan of the specified statemen 
t after it has been explained. 
--  Requirements  : Access to the plan table. 
-- Call Syntax  : @explain (statement-id) 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 100 
SET LINESIZE 200 
SET VERIFY OFF 
 
COLUMN plan             FORMAT A50 
COLUMN object_name      FORMAT A30 
COLUMN object_type      FORMAT A15 
COLUMN bytes            FORMAT 9999999999 
COLUMN cost             FORMAT 9999999 
COLUMN partition_start  FORMAT A20 
COLUMN partition_stop   FORMAT A20 
 
  SELECT   LPAD(' ', 2 * (level - 1)) || 
       DECODE (level,1,NULL,level-1 || '.' || pt.position || ' ') || 
       INITCAP(pt.operation) || 
       DECODE(pt.options,NULL,'',' (' || INITCAP(pt.options) || ')') plan, 
       pt.object_name, 
       pt.object_type, 
       pt.bytes, 
       pt.cost, 
       pt.partition_start, 
       pt.partition_stop 
FROM   plan_table pt 
START WITH pt.id = 0 
  AND pt.statement_id = '&1' 
CONNECT BY PRIOR pt.id = pt.parent_id 
  AND pt.statement_id = '&1'; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
