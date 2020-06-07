 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : A function to return the specified statistic value. 
--  Requirements  : Select on V_$MYSTAT and V_$STATNAME. 
-- Call Syntax  : Example of checking the amount of PGA memory allocated. 
-- 
--   DECLARE   
--   l_start NUMBER; 
-- BEGIN 
--   l_start := get_stat('session pga memory'); 
-- 
--   -- Do something. 
-- 
--     DBMS  _OUTPUT.put_line('PGA Memory Allocated : ' || (get_stat('session pga me 
mory') - g_start) || ' bytes'); 
-- END; 
-- / 
-- 
-- ----------------------------------------------------------------------------- 
------ 
CREATE OR REPLACE   FUNCTION   get_stat (p_stat IN VARCHAR2) RETURN NUMBER AS 
  l_return  NUMBER; 
BEGIN 
    SELECT   ms.value 
  INTO   l_return 
  FROM   v$mystat ms, 
         v$statname sn 
    WHERE    ms.statistic# = sn.statistic# 
  AND    sn.name = p_stat; 
  RETURN l_return; 
END get_stat; 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
