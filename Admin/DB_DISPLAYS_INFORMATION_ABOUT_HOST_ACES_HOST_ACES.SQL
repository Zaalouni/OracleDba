 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about host ACEs. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @host_aces 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
 
COLUMN host FORMAT A20 
COLUMN principal FORMAT A30 
COLUMN privilege FORMAT A30 
COLUMN start_date FORMAT A11 
COLUMN end_date FORMAT A11 
 
  SELECT   host, 
       lower_port, 
       upper_port, 
       ace_order, 
       TO_CHAR(start_date, 'DD-MON-YYYY') AS start_date, 
       TO_CHAR(end_date, 'DD-MON-YYYY') AS end_date, 
       grant_type, 
       inverted_principal, 
       principal, 
       principal_type, 
       privilege 
FROM     dba  _host_aces 
ORDER BY host, ace_order; 
 
SET LINESIZE 80 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
