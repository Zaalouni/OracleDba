 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays a list of all code-objects that contain the specified 
 word. 
--  Requirements  : Access to the ALL views. 
-- Call Syntax  : @search_source (text) (schema-name) 
-- ----------------------------------------------------------------------------- 
------ 
BREAK ON Name Skip 2 
SET PAGESIZE 0 
SET LINESIZE 500 
SET VERIFY OFF 
 
SPOOL Search_Source.txt 
 
  SELECT   a.name "Name", 
       a.line "Line", 
       Substr(a.text,1,200) "Text" 
FROM   all_source a 
  WHERE    Instr(Upper(a.text),Upper('&&1')) != 0 
AND    a.owner = Upper('&&2') 
ORDER BY 1,2; 
 
SPOOL OFF 
SET PAGESIZE 14 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
