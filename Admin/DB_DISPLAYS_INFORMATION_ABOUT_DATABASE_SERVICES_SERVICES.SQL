 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about database services. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @services 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
COLUMN name FORMAT A30 
COLUMN network_name FORMAT A50 
COLUMN pdb FORMAT A20 
 
  SELECT   name, 
       network_name, 
       pdb 
FROM     dba  _services 
ORDER BY name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
