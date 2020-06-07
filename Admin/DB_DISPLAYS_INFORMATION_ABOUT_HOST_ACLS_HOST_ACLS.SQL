 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about host ACLs. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @host_acls 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 150 
 
COLUMN acl FORMAT A50 
COLUMN host FORMAT A20 
COLUMN acl_owner FORMAT A10 
 
  SELECT   HOST, 
       LOWER_PORT, 
       UPPER_PORT, 
       ACL, 
       ACLID, 
       ACL_OWNER 
FROM     dba  _host_acls 
ORDER BY host; 
 
SET LINESIZE 80 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
