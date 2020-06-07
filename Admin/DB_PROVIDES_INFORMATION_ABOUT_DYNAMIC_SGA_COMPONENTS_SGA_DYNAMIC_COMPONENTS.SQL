 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Provides information about dynamic SGA components. 
--  Requirements  : Access to the v$ views. 
-- Call Syntax  : @sga_dynamic_components 
-- ----------------------------------------------------------------------------- 
------ 
COLUMN component FORMAT A30 
 
  SELECT    component, 
        ROUND(current_size/1024/1024) AS current_size_mb, 
        ROUND(min_size/1024/1024) AS min_size_mb, 
        ROUND(max_size/1024/1024) AS max_size_mb 
FROM    v$sga_dynamic_components 
  WHERE     current_size != 0 
ORDER BY component; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
