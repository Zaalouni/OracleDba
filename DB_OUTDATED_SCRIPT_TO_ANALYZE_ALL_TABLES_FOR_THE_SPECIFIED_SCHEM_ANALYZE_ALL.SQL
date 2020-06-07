 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Outdated script to analyze all tables for the specified schema 
. 
-- Comment      : Use   DBMS  _UTILITY.ANALYZE_SCHEMA or   DBMS  _STATS.GATHER_SCHEMA_ST 
ATS if your server allows it. 
-- Call Syntax  : @ananlyze_all (schema-name) 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 0 
SET FEEDBACK OFF 
SET VERIFY OFF 
 
SPOOL temp.sql 
 
  SELECT   'ANALYZE TABLE "' || table_name || '" COMPUTE STATISTICS;' 
FROM   all_tables 
  WHERE    owner = Upper('&1') 
ORDER BY 1; 
 
SPOOL OFF 
 
-- Comment out following line to pvent immediate run 
@temp.sql 
 
SET PAGESIZE 14 
SET FEEDBACK ON 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
