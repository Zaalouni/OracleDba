 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays a list of all temporary segments. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @temp_segments 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 500 
 
  SELECT   owner, 
       Trunc(Sum(bytes)/1024) Kb 
FROM     dba  _segments 
  WHERE    segment_type = 'TEMPORARY' 
  GROUP BY   owner; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
