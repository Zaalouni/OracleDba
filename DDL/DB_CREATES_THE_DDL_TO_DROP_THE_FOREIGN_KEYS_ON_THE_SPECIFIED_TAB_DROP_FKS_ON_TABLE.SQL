 
 
-- ----------------------------------------------------------------------------- 
------ 
sql 
--  Author        : aws-senior.com 
-- Description  : Creates the DDL to drop the foreign keys on the specified tabl 
e. 
-- Call Syntax  : @drop_fks_on_table (table-name) (schema) 
-- ----------------------------------------------------------------------------- 
------ 
SET SERVEROUTPUT ON 
SET LINESIZE 100 
SET VERIFY OFF 
SET FEEDBACK OFF 
PROMPT 
 
  DECLARE   
 
    CURSOR cu_fks IS 
          SELECT   * 
        FROM   all_constraints a 
          WHERE    a.constraint_type = 'R' 
        AND    a.table_name = Decode(Upper('&&1'),'ALL',a.table_name,Upper('&&1' 
)) 
        AND    a.owner      = Upper('&&2'); 
 
BEGIN 
 
      DBMS  _Output.Disable; 
      DBMS  _Output.Enable(1000000); 
      DBMS  _Output.Put_Line('PROMPT'); 
      DBMS  _Output.Put_Line('PROMPT Droping Foreign Keys on ' || Upper('&&1')); 
    FOR cur_rec IN cu_fks LOOP 
          DBMS  _Output.Put_Line('ALTER TABLE ' || Lower(cur_rec.table_name) || ' DR 
OP CONSTRAINT ' || Lower(cur_rec.constraint_name) || ';'); 
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
  
