 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays comments associate with specific tables. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @dict_comments (table-name or partial match) 
-- ----------------------------------------------------------------------------- 
------ 
PROMPT 
SET VERIFY OFF 
SET FEEDBACK OFF 
SET LINESIZE 255 
SET PAGESIZE 1000 
 
  SELECT   a.table_name "Table", 
       Substr(a.comments,1,200) "Comments" 
FROM   dictionary a 
  WHERE    a.table_name LIKE Upper('%&1%'); 
 
SET VERIFY ON 
SET FEEDBACK ON 
SET PAGESIZE 14 
PROMPT 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
