 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays privileges for the network ACLs. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @network_acl_privileges 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 150 
 
COLUMN acl FORMAT A50 
COLUMN principal FORMAT A20 
COLUMN privilege FORMAT A10 
 
  SELECT   acl, 
       principal, 
       privilege, 
       is_grant, 
       TO_CHAR(start_date, 'DD-MON-YYYY') AS start_date, 
       TO_CHAR(end_date, 'DD-MON-YYYY') AS end_date 
FROM     dba  _network_acl_privileges 
ORDER BY acl, principal, privilege; 
 
SET LINESIZE 80 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
