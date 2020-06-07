 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the current call stack. 
--  Requirements  : Access to   DBMS  _UTILITY. 
-- Call Syntax  : @call_stack 
-- ----------------------------------------------------------------------------- 
------ 
SET SERVEROUTPUT ON 
  DECLARE   
  v_stack  VARCHAR2(2000); 
BEGIN 
  v_stack := Dbms_Utility.Format_Call_Stack; 
  Dbms_Output.Put_Line(v_stack); 
END; 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
