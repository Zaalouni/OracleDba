 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays a list of locked objects. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @obj_lock 
-- ----------------------------------------------------------------------------- 
------ 
  SELECT   a.type, 
       Substr(a.owner,1,30) owner, 
       a.sid, 
       Substr(a.object,1,30) object 
FROM   v$access a 
  WHERE    a.owner NOT IN ('SYS','PUBLIC') 
ORDER BY 1,2,3,4 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
