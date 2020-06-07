 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the snapshots for all PDBs. 
--  Requirements  : Access to the CDB views. 
-- Call Syntax  : @pdb_snapshots 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 150 TAB OFF 
 
COLUMN con_name FORMAT A10 
COLUMN snapshot_name FORMAT A30 
COLUMN snapshot_scn FORMAT 9999999 
COLUMN full_snapshot_path FORMAT A50 
 
  SELECT   con_id, 
       con_name, 
       snapshot_name, 
       snapshot_scn, 
       full_snapshot_path 
FROM   cdb_pdb_snapshots 
ORDER BY con_id, snapshot_scn; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
