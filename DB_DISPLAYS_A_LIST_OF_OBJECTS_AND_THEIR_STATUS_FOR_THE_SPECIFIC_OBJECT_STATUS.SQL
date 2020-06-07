 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays a list of objects and their status for the specific s 
chema. 
--  Requirements  : Access to the ALL views. 
-- Call Syntax  : @object_status (schema-name) 
-- ----------------------------------------------------------------------------- 
------ 
SET SERVEROUTPUT ON 
SET PAGESIZE 1000 
SET LINESIZE 255 
SET FEEDBACK OFF 
SET VERIFY OFF 
 
  SELECT   Substr(object_name,1,30) object_name, 
       object_type, 
       status 
FROM   all_objects 
  WHERE    owner = Upper('&&1'); 
 
PROMPT 
SET FEEDBACK ON 
SET PAGESIZE 18 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
