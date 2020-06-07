 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays threshold information for   tablespace  s. 
-- Call Syntax  : @ts_thresholds 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
 
COLUMN metrics_name FORMAT A30 
COLUMN warning_value FORMAT A30 
COLUMN critical_value FORMAT A15 
 
  SELECT     tablespace  _name, 
       contents, 
       extent_management, 
       threshold_type, 
       metrics_name, 
       warning_operator, 
       warning_value, 
       critical_operator, 
       critical_value 
FROM     dba  _  tablespace  _thresholds 
ORDER BY   tablespace  _name, metrics_name; 
 
SET LINESIZE 80 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
