 
 
-- ----------------------------------------------------------------------------- 
------ 
ql 
--  Author        : aws-senior.com 
-- Description  : Lists all plan directives. 
-- Call Syntax  : @plan_directives (plan-name or all) 
--  Requirements  : Access to the DBA views. 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 
SET VERIFY OFF 
 
  SELECT   plan, 
       group_or_subplan, 
       cpu_p1, 
       cpu_p2, 
       cpu_p3, 
       cpu_p4 
FROM     dba  _rsrc_plan_directives 
  WHERE    plan = DECODE(UPPER('&1'), 'ALL', plan, UPPER('&1')) 
ORDER BY plan, cpu_p1 DESC, cpu_p2 DESC, cpu_p3 DESC; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
