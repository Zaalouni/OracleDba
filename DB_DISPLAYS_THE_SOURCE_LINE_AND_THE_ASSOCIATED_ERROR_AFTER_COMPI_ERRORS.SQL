 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the source line and the associated error after compil 
ation failure. 
-- Comments     : Essentially the same as SHOW ERRORS. 
-- Call Syntax  : @errors (source-name) 
-- ----------------------------------------------------------------------------- 
------ 
  SELECT   To_Char(a.line) || ' - ' || a.text error 
FROM   user_source a, 
       user_errors b 
  WHERE    a.name = Upper('&&1') 
AND    a.name = b.name 
AND    a.type = b.type 
AND    a.line = b.line 
ORDER BY a.name, a.line; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
