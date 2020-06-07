 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays a list of all roles and privileges granted to the spe 
cified user. 
--  Requirements  : Access to the USER views. 
-- Call Syntax  : @roles 
-- ----------------------------------------------------------------------------- 
------ 
SET SERVEROUTPUT ON 
SET VERIFY OFF 
 
COLUMN role FORMAT A30 
 
  SELECT   a.role, 
       a.password_required, 
       a.authentication_type 
FROM     dba  _roles a 
ORDER BY a.role; 
 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
