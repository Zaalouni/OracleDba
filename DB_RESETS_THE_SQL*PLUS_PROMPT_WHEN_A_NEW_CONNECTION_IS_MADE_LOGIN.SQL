 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Resets the SQL*Plus prompt when a new connection is made. 
-- Call Syntax  : @login 
-- ----------------------------------------------------------------------------- 
------ 
SET FEEDBACK OFF 
SET TERMOUT OFF 
 
COLUMN X NEW_VALUE Y 
  SELECT   LOWER(USER || '@' || SYS_CONTEXT('userenv', 'instance_name')) X FROM dual 
; 
SET SQLPROMPT '&Y> ' 
 
ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY HH24:MI:SS'; 
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='DD-MON-YYYY HH24:MI:SS.FF'; 
 
SET TERMOUT ON 
SET FEEDBACK ON 
SET LINESIZE 100 
SET TAB OFF 
SET TRIM ON 
SET TRIMSPOOL ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
