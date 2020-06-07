 
 
-- ----------------------------------------------------------------------------- 
------ 
sql 
--  Author        : aws-senior.com 
-- Description  : Displays a list of all the non-default parameters. 
--  Requirements  : Access to the v$ views. 
-- Call Syntax  : @parameters_non_default 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 150 
 
COLUMN name FORMAT A50 
COLUMN value FORMAT A50 
 
  SELECT   name, 
       value 
FROM   v$parameter 
  WHERE    isdefault = 'FALSE'; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
