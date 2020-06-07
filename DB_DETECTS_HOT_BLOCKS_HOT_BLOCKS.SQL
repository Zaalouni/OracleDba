 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Detects hot blocks. 
-- Call Syntax  : @hot_blocks 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
SET VERIFY OFF 
 
  SELECT   * 
FROM   (  SELECT   name, 
               addr, 
               gets, 
               misses, 
               sleeps 
        FROM   v$latch_children 
          WHERE    name = 'cache buffers chains' 
        AND    misses > 0 
        ORDER BY misses DESC) 
  WHERE    rownum < 11; 
 
ACCEPT address PROMPT "Enter ADDR: " 
 
COLUMN owner FORMAT A15 
COLUMN object_name FORMAT A30 
COLUMN subobject_name FORMAT A20 
 
  SELECT   * 
FROM   (  SELECT   o.owner, 
               o.object_name, 
               o.subobject_name, 
               bh.tch, 
               bh.obj, 
               bh.file#, 
               bh.  dba  blk, 
               bh.class, 
               bh.state 
        FROM   x$bh bh, 
                 dba  _objects o 
          WHERE    o.data_object_id = bh.obj 
        AND    hladdr = '&address' 
        ORDER BY tch DESC) 
  WHERE    rownum < 11; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
