 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the top-level global statistics pferences. 
--  Requirements  : Access to the   DBMS  _STATS package. 
-- Call Syntax  : @statistics_global_pfs 
-- ----------------------------------------------------------------------------- 
------ 
 
SET SERVEROUTPUT ON 
  DECLARE   
    PROCEDURE   display(p_param IN VARCHAR2) AS 
    l_result VARCHAR2(50); 
  BEGIN 
    l_result :=   DBMS  _STATS.get_pfs (pname => p_param); 
      DBMS  _OUTPUT.put_line(RPAD(p_param, 30, ' ') || ' : ' || l_result); 
  END; 
BEGIN 
  display('AUTOSTATS_TARGET'); 
  display('CASCADE'); 
  display('DEGREE'); 
  display('ESTIMATE_PERCENT'); 
  display('METHOD_OPT'); 
  display('NO_INVALIDATE'); 
  display('GRANULARITY'); 
  display('PUBLISH'); 
  display('INCREMENTAL'); 
  display('STALE_PERCENT'); 
END; 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
