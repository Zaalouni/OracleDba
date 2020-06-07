 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about credentials. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @credentials 
-- ----------------------------------------------------------------------------- 
------ 
COLUMN credential_name FORMAT A25 
COLUMN username FORMAT A20 
COLUMN windows_domain FORMAT A20 
 
  SELECT   credential_name, 
       username, 
       windows_domain 
FROM     dba  _credentials 
ORDER BY credential_name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
