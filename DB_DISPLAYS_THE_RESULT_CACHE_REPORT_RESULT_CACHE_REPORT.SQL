 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the result cache report. 
--  Requirements  : Access to the   DBMS  _RESULT_CACHE package. 
-- Call Syntax  : @result_cache_report 
-- ----------------------------------------------------------------------------- 
------ 
 
SET SERVEROUTPUT ON 
EXEC   DBMS  _RESULT_CACHE.memory_report(detailed => true); 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
