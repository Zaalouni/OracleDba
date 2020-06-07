 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Lists all objects with a similar name to that specified. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @find_object (object-name) 
-- ----------------------------------------------------------------------------- 
------ 
 
SET VERIFY OFF LINESIZE 200 
 
COLUMN object_name FORMAT A30 
COLUMN owner FORMAT A20 
 
  SELECT   object_name, owner, object_type, status 
FROM     dba  _objects 
  WHERE    LOWER(object_name) LIKE '%' || LOWER('&1') || '%' 
ORDER BY 1, 2, 3; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
