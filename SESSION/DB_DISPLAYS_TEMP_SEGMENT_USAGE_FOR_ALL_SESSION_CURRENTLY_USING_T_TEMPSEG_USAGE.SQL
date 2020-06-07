 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays temp segment usage for all session currently using te 
mp space. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @tempseg_usage 
-- ----------------------------------------------------------------------------- 
------ 
 
SET LINESIZE 200 
COLUMN username FORMAT A20 
 
  SELECT   username, 
       session_addr, 
       session_num, 
       sqladdr, 
       sqlhash, 
       sql_id, 
       contents, 
       segtype, 
       extents, 
       blocks 
FROM   v$tempseg_usage 
ORDER BY username; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
