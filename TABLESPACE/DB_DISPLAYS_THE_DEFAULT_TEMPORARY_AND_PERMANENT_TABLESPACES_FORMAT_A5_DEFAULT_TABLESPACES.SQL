 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the default temporary and permanent   tablespace  s. 
--  Requirements  : Access to the DATABASE_PROPERTIES views. 
-- Call Syntax  : @default_  tablespace  s 
-- ----------------------------------------------------------------------------- 
------ 
COLUMN property_name FORMAT A30 
COLUMN property_value FORMAT A30 
COLUMN description FORMAT A50 
SET LINESIZE 200 
 
  SELECT   * 
FROM   database_properties 
  WHERE    property_name like '%TABLESPACE'; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
