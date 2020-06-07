 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the default values where psent for the specified ta 
ble. 
-- Call Syntax  : @column_defaults (table-name) 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 100 
SET VERIFY OFF 
 
  SELECT   a.column_name "Column", 
       a.data_default "Default" 
FROM   all_tab_columns a 
  WHERE    a.table_name = Upper('&1') 
AND    a.data_default IS NOT NULL 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
