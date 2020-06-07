 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the SQL statement held for a specific SID. 
-- Comments     : The SID can be found by running session.sql or top_session.sql 
. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @open_cursors_by_sid (sid) 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 500 
SET PAGESIZE 1000 
SET VERIFY OFF 
 
  SELECT   oc.sql_text, cursor_type 
FROM   v$open_cursor oc 
  WHERE    oc.sid = &1 
ORDER BY cursor_type; 
 
PROMPT 
SET PAGESIZE 14 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
