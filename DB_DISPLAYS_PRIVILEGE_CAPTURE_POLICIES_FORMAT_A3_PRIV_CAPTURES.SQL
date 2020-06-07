 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays privilege capture policies. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @priv_captures.sql 
-- ----------------------------------------------------------------------------- 
------ 
 
COLUMN name FORMAT A15 
COLUMN description FORMAT A30 
COLUMN roles FORMAT A20 
COLUMN context FORMAT A30 
SET LINESIZE 200 
 
  SELECT   name, 
       description, 
       type, 
       enabled, 
       roles, 
       context 
FROM     dba  _priv_captures 
ORDER BY name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
