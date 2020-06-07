 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Lists all invalid objects in the database. 
-- Call Syntax  : @invalid_objects 
--  Requirements  : Access to the DBA views. 
-- ----------------------------------------------------------------------------- 
------ 
COLUMN owner FORMAT A30 
COLUMN object_name FORMAT A30 
 
  SELECT   owner, 
       object_type, 
       object_name, 
       status 
FROM     dba  _objects 
  WHERE    status = 'INVALID' 
ORDER BY owner, object_type, object_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
