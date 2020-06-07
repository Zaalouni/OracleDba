 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays parameter values that differ between the current valu 
e and the spfile. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @parameter_diffs 
-- ----------------------------------------------------------------------------- 
------ 
 
SET LINESIZE 120 
COLUMN name          FORMAT A30 
COLUMN current_value FORMAT A30 
COLUMN sid           FORMAT A8 
COLUMN spfile_value  FORMAT A30 
 
  SELECT   p.name, 
       i.instance_name AS sid, 
       p.value AS current_value, 
       sp.sid, 
       sp.value AS spfile_value 
FROM   v$spparameter sp, 
       v$parameter p, 
       v$instance i 
  WHERE    sp.name   = p.name 
AND    sp.value != p.value; 
 
COLUMN FORMAT DEFAULT 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
