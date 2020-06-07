 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays partition information for the specified index, or all 
 indexes. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @index_patitions (index_name or all) (schema-name) 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 500 
SET PAGESIZE 1000 
SET FEEDBACK OFF 
SET VERIFY OFF 
 
  SELECT   a.index_name, 
       a.partition_name, 
       a.  tablespace  _name, 
       a.initial_extent, 
       a.next_extent, 
       a.pct_increase, 
       a.num_rows 
FROM     dba  _ind_partitions a 
  WHERE    a.index_name  = Decode(Upper('&&1'),'ALL',a.index_name,Upper('&&1')) 
AND    a.index_owner = Upper('&&2') 
ORDER BY a.index_name, a.partition_name 
/ 
 
PROMPT 
SET PAGESIZE 14 
SET FEEDBACK ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
