 
 
CREATE OR REPLACE   FUNCTION   part_hv_to_date (p_table_owner    IN  VARCHAR2, 
                                            p_table_name     IN VARCHAR2, 
                                            p_partition_name IN VARCHAR2) 
  RETURN DATE 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Create a function to turn partition HIGH_VALUE column to a dat 
e. 
-- Call Syntax  : @part_hv_to_date 
-- Notes        : Has to re-  select   the value from the view as LONG cannot be pas 
sed as a parameter. 
--                Example call: 
-- 
--   SELECT   a.partition_name, 
--        part_hv_to_date(a.table_owner, a.table_name, a.partition_name) as high 
_value 
-- FROM   all_tab_partitions a; 
-- 
-- Does no error handling. 
-- ----------------------------------------------------------------------------- 
------ 
AS 
  l_high_value VARCHAR2(32767); 
  l_date DATE; 
BEGIN 
    SELECT   high_value 
  INTO   l_high_value 
  FROM   all_tab_partitions 
    WHERE    table_owner    = p_table_owner 
  AND    table_name     = p_table_name 
  AND    partition_name = p_partition_name; 
 
  EXECUTE IMMEDIATE '  SELECT   ' || l_high_value || ' FROM dual' INTO l_date; 
  RETURN l_date; 
END; 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
