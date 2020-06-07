 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays current statistics pferences. 
--  Requirements  : Access to the   DBMS  _STATS package. 
-- Call Syntax  : @statistics_pfs 
-- ----------------------------------------------------------------------------- 
------ 
 
SET LINESIZE 250 
 
COLUMN autostats_target FORMAT A20 
COLUMN cascade FORMAT A25 
COLUMN degree FORMAT A10 
COLUMN estimate_percent FORMAT A30 
COLUMN method_opt FORMAT A25 
COLUMN no_invalidate FORMAT A30 
COLUMN granularity FORMAT A15 
COLUMN publish FORMAT A10 
COLUMN incremental FORMAT A15 
COLUMN stale_percent FORMAT A15 
 
  SELECT     DBMS  _STATS.GET_PREFS('AUTOSTATS_TARGET') AS autostats_target, 
         DBMS  _STATS.GET_PREFS('CASCADE') AS cascade, 
         DBMS  _STATS.GET_PREFS('DEGREE') AS degree, 
         DBMS  _STATS.GET_PREFS('ESTIMATE_PERCENT') AS estimate_percent, 
         DBMS  _STATS.GET_PREFS('METHOD_OPT') AS method_opt, 
         DBMS  _STATS.GET_PREFS('NO_INVALIDATE') AS no_invalidate, 
         DBMS  _STATS.GET_PREFS('GRANULARITY') AS granularity, 
         DBMS  _STATS.GET_PREFS('PUBLISH') AS publish, 
         DBMS  _STATS.GET_PREFS('INCREMENTAL') AS incremental, 
         DBMS  _STATS.GET_PREFS('STALE_PERCENT') AS stale_percent 
FROM   dual; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
