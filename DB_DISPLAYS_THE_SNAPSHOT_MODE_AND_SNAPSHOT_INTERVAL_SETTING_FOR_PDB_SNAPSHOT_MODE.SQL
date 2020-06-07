 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the SNAPSHOT_MODE and SNAPSHOT_INTERVAL setting for e 
ach container. 
--  Requirements  : Access to the CDB views. 
-- Call Syntax  : @pdb_snapshot_mode 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 150 TAB OFF 
 
COLUMN pdb_name FORMAT A10 
COLUMN snapshot_mode FORMAT A15 
 
  SELECT   p.con_id, 
       p.pdb_name, 
       p.snapshot_mode, 
       p.snapshot_interval 
FROM   cdb_pdbs p 
ORDER BY 1; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
