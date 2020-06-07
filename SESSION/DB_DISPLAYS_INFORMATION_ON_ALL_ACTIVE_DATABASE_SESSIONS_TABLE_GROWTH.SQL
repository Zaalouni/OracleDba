 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information on all active database sessions. 
--  Requirements  : Access to the DBA_HIST views. Diagnostics and Tuning license. 
-- Call Syntax  : @table_growth (schema-name) (table_name) 
-- ----------------------------------------------------------------------------- 
------ 
COLUMN object_name FORMAT A30 
 
  SELECT   TO_CHAR(sn.begin_interval_time,'DD-MON-YYYY HH24:MM') AS begin_interval_t 
ime, 
       sso.object_name, 
       ss.space_used_total 
FROM     dba  _hist_seg_stat ss, 
         dba  _hist_seg_stat_obj sso, 
         dba  _hist_snapshot sn 
  WHERE    sso.owner = UPPER('&1') 
AND    sso.obj# = ss.obj# 
AND    sn.snap_id = ss.snap_id 
AND    sso.object_name LIKE UPPER('&2') || '%' 
ORDER BY sn.begin_interval_time; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
