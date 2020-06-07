 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Predicts how changes to the PGA_AGGREGATE_TARGET will affect P 
GA usage. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @pga_target_advice 
-- ----------------------------------------------------------------------------- 
------ 
 
  SELECT   ROUND(pga_target_for_estimate/1024/1024) target_mb, 
       estd_pga_cache_hit_percentage cache_hit_perc, 
       estd_overalloc_count 
FROM   v$pga_target_advice; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
