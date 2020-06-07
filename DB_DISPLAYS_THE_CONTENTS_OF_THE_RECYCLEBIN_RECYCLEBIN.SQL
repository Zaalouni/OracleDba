 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the contents of the recyclebin. 
--  Requirements  : Access to the DBA views. Depending on DB version, different co 
lumns 
--                are available. 
-- Call Syntax  : @recyclebin (owner | all) 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 500 VERIFY OFF 
 
  SELECT   owner, 
       original_name, 
       object_name, 
       operation, 
       type, 
       space AS space_blks, 
       ROUND((space*8)/1024,2) space_mb 
FROM     dba  _recyclebin 
  WHERE    owner = DECODE(UPPER('&1'), 'ALL', owner, UPPER('&1')) 
ORDER BY 1, 2; 
 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
