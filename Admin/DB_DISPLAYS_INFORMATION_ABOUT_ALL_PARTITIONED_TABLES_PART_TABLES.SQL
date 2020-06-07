 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about all partitioned tables. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @part_tables 
-- ----------------------------------------------------------------------------- 
------ 
 
  SELECT   owner, table_name, partitioning_type, partition_count 
FROM     dba  _part_tables 
  WHERE    owner NOT IN ('SYS', 'SYSTEM') 
ORDER BY owner, table_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
