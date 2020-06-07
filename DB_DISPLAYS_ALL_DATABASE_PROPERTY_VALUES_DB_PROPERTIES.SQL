 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays all database property values. 
-- Call Syntax  : @db_properties 
-- ----------------------------------------------------------------------------- 
------ 
COLUMN property_value FORMAT A50 
 
  SELECT   property_name, 
       property_value 
FROM   database_properties 
ORDER BY property_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
