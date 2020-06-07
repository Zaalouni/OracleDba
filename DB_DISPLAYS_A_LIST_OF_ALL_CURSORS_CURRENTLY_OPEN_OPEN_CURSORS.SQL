 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays a list of all cursors currently open. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @open_cursors 
-- ----------------------------------------------------------------------------- 
------ 
  SELECT   a.user_name, 
       a.sid, 
       a.sql_text 
FROM   v$open_cursor a 
ORDER BY 1,2 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
