 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about network ACLs. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @network_acls 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 150 
 
COLUMN host FORMAT A40 
COLUMN acl FORMAT A50 
 
  SELECT   host, lower_port, upper_port, acl 
FROM     dba  _network_acls 
ORDER BY host; 
 
SET LINESIZE 80 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
