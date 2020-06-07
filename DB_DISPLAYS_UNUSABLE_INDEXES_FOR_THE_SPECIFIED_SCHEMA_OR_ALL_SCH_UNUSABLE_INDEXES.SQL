 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays unusable indexes for the specified schema or all sche 
mas. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @unusable_indexes (schema-name or all) 
-- ----------------------------------------------------------------------------- 
------ 
SET VERIFY OFF LINESIZE 200 
 
COLUMN owner FORMAT A30 
COLUMN index_name FORMAT A30 
COLUMN table_owner FORMAT A30 
COLUMN table_name FORMAT A30 
 
  SELECT   owner, 
       index_name, 
       index_type, 
       table_owner, 
       table_name 
       table_type 
FROM     dba  _indexes 
  WHERE    owner = DECODE(UPPER('&1'), 'ALL', owner, UPPER('&1')) 
AND    status NOT IN ('VALID', 'N/A') 
ORDER BY owner, index_name; 
 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
