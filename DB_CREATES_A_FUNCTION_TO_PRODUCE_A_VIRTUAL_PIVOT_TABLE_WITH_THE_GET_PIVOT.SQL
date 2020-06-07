 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Creates a function to produce a virtual pivot table with the s 
pecific values. 
--  Requirements  : CREATE TYPE, CREATE   PROCEDURE   
-- Call Syntax  : @get_pivot.sql 
-- ----------------------------------------------------------------------------- 
------ 
 
CREATE OR REPLACE TYPE t_pivot AS TABLE OF NUMBER; 
/ 
 
CREATE OR REPLACE   FUNCTION   get_pivot(p_max   IN  NUMBER, 
                                     p_step  IN  NUMBER DEFAULT 1) 
  RETURN t_pivot AS 
  l_pivot t_pivot := t_pivot(); 
BEGIN 
  FOR i IN 0 .. TRUNC(p_max/p_step) LOOP 
    l_pivot.extend; 
    l_pivot(l_pivot.last) := 1 + (i * p_step); 
  END LOOP; 
  RETURN l_pivot; 
END; 
/ 
SHOW ERRORS 
 
  SELECT   column_value 
FROM   TABLE(get_pivot(17,2)); 
 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
