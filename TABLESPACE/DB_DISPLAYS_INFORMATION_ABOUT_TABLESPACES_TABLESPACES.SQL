 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about   tablespace  s. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @  tablespace  s 
-- ----------------------------------------------------------------------------- 
------ 
 
SET LINESIZE 200 
 
  SELECT     tablespace  _name, 
       block_size, 
       extent_management, 
       allocation_type, 
       segment_space_management, 
       status 
FROM     dba  _  tablespace  s 
ORDER BY   tablespace  _name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
