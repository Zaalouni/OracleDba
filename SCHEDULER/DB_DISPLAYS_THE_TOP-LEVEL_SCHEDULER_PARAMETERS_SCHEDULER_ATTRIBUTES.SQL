 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the top-level scheduler parameters. 
--  Requirements  : Access to the   DBMS  _SCHEDULER package and the MANAGE SCHEDULER 
privilege. 
-- Call Syntax  : @scheduler_attributes 
-- ----------------------------------------------------------------------------- 
------ 
 
SET SERVEROUTPUT ON 
  DECLARE   
    PROCEDURE   display(p_param IN VARCHAR2) AS 
    l_result VARCHAR2(50); 
  BEGIN 
      DBMS  _SCHEDULER.get_scheduler_attribute( 
      attribute => p_param, 
      value     => l_result); 
      DBMS  _OUTPUT.put_line(RPAD(p_param, 30, ' ') || ' : ' || l_result); 
  END; 
BEGIN 
  display('current_open_window'); 
  display('default_timezone'); 
  display('email_sender'); 
  display('email_server'); 
  display('event_expiry_time'); 
  display('log_history'); 
  display('max_job_slave_processes'); 
END; 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
