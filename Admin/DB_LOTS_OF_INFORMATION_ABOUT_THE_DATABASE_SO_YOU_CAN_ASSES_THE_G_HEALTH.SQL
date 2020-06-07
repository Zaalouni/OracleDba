 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Lots of information about the database so you can asses the ge 
neral health of the system. 
--  Requirements  : Access to the V$ & DBA views and several other monitoring scri 
pts. 
-- Call Syntax  : @health (username/password@service) 
-- ----------------------------------------------------------------------------- 
------ 
SPOOL Health_Checks.txt 
 
conn &1 
@db_info 
@sessions 
@ts_full 
@max_extents 
 
SPOOL OFF 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
