 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the contents of the v$diag_info view. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @diag_info 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
COLUMN name FORMAT A30 
COLUMN value FORMAT A110 
 
  SELECT   * 
FROM   v$diag_info; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
