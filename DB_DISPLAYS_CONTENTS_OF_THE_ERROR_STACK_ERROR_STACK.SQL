 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays contents of the error stack. 
-- Call Syntax  : @error_stack 
-- ----------------------------------------------------------------------------- 
------ 
SET SERVEROUTPUT ON 
  DECLARE   
  v_stack  VARCHAR2(2000); 
BEGIN 
  v_stack := Dbms_Utility.Format_Error_Stack; 
  Dbms_Output.Put_Line(v_stack); 
END; 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
