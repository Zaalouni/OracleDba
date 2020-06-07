 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays National Language Suppport (NLS) information. 
--  Requirements  : 
-- Call Syntax  : @nls_params 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 100 
COLUMN parameter FORMAT A45 
COLUMN value FORMAT A45 
 
PROMPT *** Database parameters *** 
  SELECT   * FROM nls_database_parameters ORDER BY 1; 
 
PROMPT *** Instance parameters *** 
  SELECT   * FROM nls_instance_parameters ORDER BY 1; 
 
PROMPT *** Session parameters *** 
  SELECT   * FROM nls_session_parameters ORDER BY 1; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
