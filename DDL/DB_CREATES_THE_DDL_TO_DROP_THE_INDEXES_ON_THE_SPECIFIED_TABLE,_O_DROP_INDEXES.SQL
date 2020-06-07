 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Creates the DDL to drop the indexes on the specified table, or 
 all tables. 
-- Call Syntax  : @drop_indexes (table-name or all) (schema) 
-- ----------------------------------------------------------------------------- 
------ 
SET SERVEROUTPUT ON 
SET LINESIZE 100 
SET VERIFY OFF 
SET FEEDBACK OFF 
PROMPT 
 
  DECLARE   
 
    CURSOR cu_idx IS 
          SELECT   * 
        FROM   all_indexes a 
          WHERE    a.table_name = Decode(Upper('&&1'),'ALL',a.table_name,Upper('&&1' 
)) 
        AND    a.owner      = Upper('&&2'); 
 
BEGIN 
 
      DBMS  _Output.Disable; 
      DBMS  _Output.Enable(1000000); 
      DBMS  _Output.Put_Line('PROMPT'); 
      DBMS  _Output.Put_Line('PROMPT Droping Indexes on ' || Upper('&&1')); 
    FOR cur_rec IN cu_idx LOOP 
          DBMS  _Output.Put_Line('DROP INDEX ' || Lower(cur_rec.index_name) || ';'); 
    END LOOP; 
 
END; 
/ 
 
PROMPT 
SET VERIFY ON 
SET FEEDBACK ON 
 
 
 
 
 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
