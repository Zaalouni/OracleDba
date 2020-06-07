 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays redaction policy information. 
--  Requirements  : Access to the REDACTION_POLICIES view. 
-- Call Syntax  : @redaction_policies 
-- ----------------------------------------------------------------------------- 
------ 
 
SET LINESIZE 200 
 
COLUMN object_owner FORMAT A20 
COLUMN object_name FORMAT A30 
COLUMN policy_name FORMAT A30 
COLUMN expssion FORMAT A30 
COLUMN policy_description FORMAT A20 
 
  SELECT   object_owner, 
       object_name, 
       policy_name, 
       expssion, 
       enable, 
       policy_description 
FROM   redaction_policies 
ORDER BY 1, 2, 3; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
