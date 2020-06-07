 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays cache hit ratio for the database. 
-- Comments     : The minimum figure of 89% is often quoted, but depending on th 
e type of system this may not be possible. 
--  Requirements  : Access to the v$ views. 
-- Call Syntax  : @cache_hit_ratio 
-- ----------------------------------------------------------------------------- 
------ 
PROMPT 
PROMPT Hit ratio should exceed 89% 
 
  SELECT   Sum(Decode(a.name, 'consistent gets', a.value, 0)) "Consistent Gets", 
       Sum(Decode(a.name, 'db block gets', a.value, 0)) "DB Block Gets", 
       Sum(Decode(a.name, 'physical reads', a.value, 0)) "Physical Reads", 
       Round(((Sum(Decode(a.name, 'consistent gets', a.value, 0)) + 
         Sum(Decode(a.name, 'db block gets', a.value, 0)) - 
         Sum(Decode(a.name, 'physical reads', a.value, 0))  )/ 
           (Sum(Decode(a.name, 'consistent gets', a.value, 0)) + 
             Sum(Decode(a.name, 'db block gets', a.value, 0)))) 
             *100,2) "Hit Ratio %" 
FROM   v$sysstat a; 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
