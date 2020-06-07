 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the SQL statement held for a specific SID. 
-- Comments     : The SID can be found by running session.sql or top_session.sql 
. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @sql_text_by_sid (sid) 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 500 
SET PAGESIZE 1000 
SET VERIFY OFF 
 
  SELECT   a.sql_text 
FROM   v$sqltext a, 
       v$session b 
  WHERE    a.address = b.sql_address 
AND    a.hash_value = b.sql_hash_value 
AND    b.sid = &1 
ORDER BY a.piece; 
 
PROMPT 
SET PAGESIZE 14 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
