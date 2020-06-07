 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about all PDBs in the current CDB. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @pdbs 
-- ----------------------------------------------------------------------------- 
------ 
 
COLUMN pdb_name FORMAT A20 
 
  SELECT   pdb_name, status 
FROM     dba  _pdbs 
ORDER BY pdb_name; 
 
COLUMN name FORMAT A20 
 
  SELECT   name, open_mode 
FROM   v$pdbs 
ORDER BY name; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
