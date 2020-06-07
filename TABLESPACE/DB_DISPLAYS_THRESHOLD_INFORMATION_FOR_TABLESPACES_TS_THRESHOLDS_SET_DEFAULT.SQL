 
 
-- ----------------------------------------------------------------------------- 
------ 
lt.sql 
--  Author        : aws-senior.com 
-- Description  : Displays threshold information for   tablespace  s. 
-- Call Syntax  : @ts_thresholds_set_default (warning) (critical) 
-- ----------------------------------------------------------------------------- 
------ 
SET VERIFY OFF 
 
  DECLARE   
  l_warning  VARCHAR2(2) := '&1'; 
  l_critical VARCHAR2(2) := '&2'; 
BEGIN 
      DBMS  _SERVER_ALERT.SET_THRESHOLD( 
      metrics_id              =>   DBMS  _SERVER_ALERT.TABLESPACE_PCT_FULL, 
      warning_operator        =>   DBMS  _SERVER_ALERT.OPERATOR_GE, 
      warning_value           => l_warning, 
      critical_operator       =>   DBMS  _SERVER_ALERT.OPERATOR_GE, 
      critical_value          => l_critical, 
      observation_period      => 1, 
      consecutive_occurrences => 1, 
      instance_name           => NULL, 
      object_type             =>   DBMS  _SERVER_ALERT.OBJECT_TYPE_TABLESPACE, 
      object_name             => NULL); 
END; 
/ 
 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
