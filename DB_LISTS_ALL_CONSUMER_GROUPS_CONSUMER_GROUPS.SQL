 
 
-- ----------------------------------------------------------------------------- 
------ 
ql 
--  Author        : aws-senior.com 
-- Description  : Lists all consumer groups. 
-- Call Syntax  : @consumer_groups 
--  Requirements  : Access to the DBA views. 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
SET VERIFY OFF 
 
COLUMN status FORMAT A10 
COLUMN comments FORMAT A50 
 
  SELECT   consumer_group, 
       status, 
       comments 
FROM     dba  _rsrc_consumer_groups 
ORDER BY consumer_group; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
