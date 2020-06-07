 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Generates a basic API package for the specific table. 
--                Update of build_api to use ROWTYPEs as parameters. 
--  Requirements  : USER_% and ALL_% views. 
-- Call Syntax  : @build_api2 (table-name) (schema) 
-- ----------------------------------------------------------------------------- 
------ 
SET SERVEROUTPUT ON 
SET VERIFY OFF 
SET ECHO OFF 
SET TERMOUT OFF 
SET TRIMSPOOL ON 
SET FEEDBACK OFF 
 
SPOOL Package.pkh 
 
  DECLARE   
 
  v_table_name VARCHAR2(30)  := Upper('&&1'); 
  v_owner      VARCHAR2(30)  := Upper('&&2'); 
 
  CURSOR c_pk_columns IS 
      SELECT   a.position, 
           a.column_name 
    FROM   all_cons_columns a, 
           all_constraints b 
      WHERE    a.owner           = v_owner 
    AND    a.table_name      = v_table_name 
    AND    a.constraint_name = b.constraint_name 
    AND    b.constraint_type = 'P' 
    AND    b.owner           = a.owner 
    AND    b.table_name      = a.table_name 
    ORDER BY position; 
 
  CURSOR c_columns IS 
      SELECT   atc.column_name 
    FROM   all_tab_columns atc 
      WHERE    atc.owner      = v_owner 
    AND    atc.table_name = v_table_name; 
 
  CURSOR c_non_pk_columns (p_nullable  IN  VARCHAR2) IS 
      SELECT   atc.column_name 
    FROM   all_tab_columns atc 
      WHERE    atc.owner      = v_owner 
    AND    atc.table_name = v_table_name 
    AND    atc.nullable   = p_nullable 
    AND    atc.column_name NOT IN (  SELECT   a.column_name 
                                   FROM   all_cons_columns a, 
                                          all_constraints b 
                                     WHERE    a. owner          = v_owner 
                                   AND    a.table_name      = v_table_name 
                                   AND    a.constraint_name = b.constraint_name 
                                   AND    b.constraint_type = 'P' 
                                   AND    b.owner           = a.owner 
                                   AND    b.table_name      = a.table_name); 
 
    PROCEDURE   GetPKParameterList(p_commit  IN  BOOLEAN  DEFAULT TRUE) IS 
  BEGIN 
    FOR cur_col IN c_pk_columns LOOP 
        DBMS  _Output.Put_Line(Chr(9) || 'p_' || RPad(Lower(cur_col.column_name), 30 
, ' ') || '  IN  ' || Lower(v_table_name) || '.' || Lower(cur_col.column_name) | 
| '%TYPE,'); 
    END LOOP; 
    IF p_commit THEN 
        DBMS  _Output.Put(Chr(9) || 'p_' || RPad('commit', 30, ' ') || '  IN  VARCHA 
R2 DEFAULT ''Y'''); 
    END IF; 
  END; 
 
    PROCEDURE   GetInsertColumnList IS 
  BEGIN 
    FOR cur_col IN c_columns LOOP 
      IF c_columns%ROWCOUNT != 1 THEN 
          DBMS  _Output.Put_Line(','); 
      END IF; 
        DBMS  _Output.Put(Chr(9) || Chr(9) || Lower(cur_col.column_name)); 
    END LOOP; 
      DBMS  _Output.New_Line; 
  END; 
 
    PROCEDURE   GetInsertValueList IS 
  BEGIN 
    FOR cur_col IN c_columns LOOP 
      IF c_columns%ROWCOUNT != 1 THEN 
          DBMS  _Output.Put_Line(','); 
      END IF; 
        DBMS  _Output.Put(Chr(9) || Chr(9) || 'p_' || Lower(v_table_name) || '.' || 
Lower(cur_col.column_name)); 
    END LOOP; 
      DBMS  _Output.New_Line; 
  END; 
 
    PROCEDURE   GetUpdateSetList IS 
  BEGIN 
    FOR cur_col IN c_columns LOOP 
      IF c_columns%ROWCOUNT != 1 THEN 
          DBMS  _Output.Put_Line(','); 
          DBMS  _Output.Put(Chr(9) || Chr(9) || Chr(9) || Chr(9)); 
      ELSE 
          DBMS  _Output.Put(Chr(9) || 'SET    '); 
      END IF; 
        DBMS  _Output.Put(RPad(Lower(cur_col.column_name), 30, ' ') || ' = p_' || Lo 
wer(v_table_name) || '.' || Lower(cur_col.column_name)); 
    END LOOP; 
      DBMS  _Output.New_Line; 
  END; 
 
    PROCEDURE   GetPKWhere (p_record      IN  VARCHAR2 DEFAULT NULL, 
                        p_for_update  IN  VARCHAR2 DEFAULT NULL) IS 
  BEGIN 
    FOR cur_col IN c_pk_columns LOOP 
      IF c_pk_columns%ROWCOUNT = 1 THEN 
          DBMS  _Output.Put(Chr(9) || '  WHERE    '); 
      ELSE 
          DBMS  _Output.New_Line; 
          DBMS  _Output.Put(Chr(9) || 'AND    '); 
      END IF; 
      IF p_record = 'Y' THEN 
          DBMS  _Output.Put(RPad(Lower(cur_col.column_name), 30, ' ') || ' = p_' || 
Lower(v_table_name) || '.' || Lower(cur_col.column_name)); 
      ELSE 
          DBMS  _Output.Put(RPad(Lower(cur_col.column_name), 30, ' ') || ' = p_' || 
Lower(cur_col.column_name)); 
      END IF; 
    END LOOP; 
 
    IF p_for_update = 'Y' THEN 
        DBMS  _Output.New_Line; 
        DBMS  _Output.Put(Chr(9) || 'FOR UPDATE'); 
    END IF; 
      DBMS  _Output.Put_Line(';'); 
  END; 
 
    PROCEDURE   GetCommit IS 
  BEGIN 
      DBMS  _Output.Put_Line(Chr(9) || 'IF p_commit = ''Y'' THEN'); 
      DBMS  _Output.Put_Line(Chr(9) || Chr(9) || 'COMMIT;'); 
      DBMS  _Output.Put_Line(Chr(9) || 'END IF;'); 
      DBMS  _Output.New_Line; 
  END; 
 
    PROCEDURE   GetSeparator IS 
  BEGIN 
      DBMS  _Output.Put_Line('-- --------------------------------------------------- 
--------------------'); 
  END; 
 
BEGIN 
 
    DBMS  _Output.Enable(1000000); 
 
  -- --------------------- 
  -- Package Specification 
  -- --------------------- 
    DBMS  _Output.Put_Line('-- ----------------------------------------------------- 
------------------'); 
    DBMS  _Output.Put_Line('-- Name        : ' || Lower(v_table_name) || '_api.pkh') 
; 
    DBMS  _Output.Put_Line('-- Created By  : aws-senior.com'); 
    DBMS  _Output.Put_Line('-- Created Date: ' || To_Char(Sysdate, 'DD-Mon-YYYY')); 
    DBMS  _Output.Put_Line('-- Description : API procedures for the ' || v_table_nam 
e || ' table.'); 
    DBMS  _Output.Put_Line('-- Ammendments :'); 
    DBMS  _Output.Put_Line('--   ' || To_Char(Sysdate, 'DD-Mon-YYYY') || '  TSH  Ini 
tial Creation'); 
    DBMS  _Output.Put_Line('-- ----------------------------------------------------- 
------------------'); 
    DBMS  _Output.Put_Line('CREATE OR REPLACE PACKAGE ' || Lower(v_table_name) || '_ 
api AS'); 
    DBMS  _Output.Put_Line(Chr(9)); 
    DBMS  _Output.Put_Line('TYPE cursor_type IS REF CURSOR;'); 
    DBMS  _Output.Put_Line(Chr(9)); 
 
    DBMS  _Output.Put_Line('  PROCEDURE   Sel ('); 
  GetPKParameterList(FALSE); 
    DBMS  _Output.New_Line; 
    DBMS  _Output.Put_Line(Chr(9) || RPad('p_recordset', 32, ' ') || '  OUT cursor_t 
ype'); 
    DBMS  _Output.Put_Line(');'); 
    DBMS  _Output.Put_Line(Chr(9)); 
 
    DBMS  _Output.Put_Line('  PROCEDURE   Ins ('); 
    DBMS  _Output.Put_Line(Chr(9) || 'p_' || RPad(Lower(v_table_name), 30, ' ') || ' 
  IN  ' || Lower(v_table_name) || '%ROWTYPE,'); 
    DBMS  _Output.Put_Line(Chr(9) || 'p_' || RPad('commit', 30, ' ') || '  IN  VARCH 
AR2 DEFAULT ''Y'''); 
    DBMS  _Output.Put_Line(');'); 
    DBMS  _Output.Put_Line(Chr(9)); 
 
    DBMS  _Output.Put_Line('  PROCEDURE   Upd ('); 
    DBMS  _Output.Put_Line(Chr(9) || 'p_' || RPad(Lower(v_table_name), 30, ' ') || ' 
  IN  ' || Lower(v_table_name) || '%ROWTYPE,'); 
    DBMS  _Output.Put_Line(Chr(9) || 'p_' || RPad('commit', 30, ' ') || '  IN  VARCH 
AR2 DEFAULT ''Y'''); 
    DBMS  _Output.Put_Line(');'); 
    DBMS  _Output.Put_Line(Chr(9)); 
 
    DBMS  _Output.Put_Line('  PROCEDURE   Del ('); 
  GetPKParameterList; 
    DBMS  _Output.Put_Line(');'); 
    DBMS  _Output.Put_Line(Chr(9)); 
 
    DBMS  _Output.Put_Line('END ' || Lower(v_table_name) || '_api;'); 
    DBMS  _Output.Put_Line('/'); 
 
  -- ------------ 
  -- Package Body 
  -- ------------ 
    DBMS  _Output.Put_Line('-- ----------------------------------------------------- 
------------------'); 
    DBMS  _Output.Put_Line('-- Name        : ' || Lower(v_table_name) || '_api.pkg') 
; 
    DBMS  _Output.Put_Line('-- Created By  : aws-senior.com'); 
    DBMS  _Output.Put_Line('-- Created Date: ' || To_Char(Sysdate, 'DD-Mon-YYYY')); 
    DBMS  _Output.Put_Line('-- Description : API procedures for the ' || v_table_nam 
e || ' table.'); 
    DBMS  _Output.Put_Line('-- Ammendments :'); 
    DBMS  _Output.Put_Line('--   ' || To_Char(Sysdate, 'DD-Mon-YYYY') || '  TSH  Ini 
tial Creation'); 
    DBMS  _Output.Put_Line('-- ----------------------------------------------------- 
------------------'); 
    DBMS  _Output.Put_Line('CREATE OR REPLACE PACKAGE BODY ' || Lower(v_table_name) 
|| '_api AS'); 
    DBMS  _Output.Put_Line(Chr(9)); 
 
  -- Select 
  GetSeparator; 
    DBMS  _Output.Put_Line('  PROCEDURE   Sel ('); 
  GetPKParameterList(FALSE); 
    DBMS  _Output.New_Line; 
    DBMS  _Output.Put_Line(Chr(9) || RPad('p_recordset', 32, ' ') || '  OUT cursor_t 
ype'); 
    DBMS  _Output.Put_Line(') IS'); 
  GetSeparator; 
 
    DBMS  _Output.Put_Line('BEGIN'); 
    DBMS  _Output.Put_Line(Chr(9)); 
 
    DBMS  _Output.Put_Line(Chr(9) || 'OPEN p_recordset FOR'); 
    DBMS  _Output.Put_Line(Chr(9) || '  SELECT  '); 
  GetInsertColumnList; 
    DBMS  _Output.Put_Line(Chr(9) || 'FROM ' || Lower(v_table_name)); 
  GetPKWhere; 
 
    DBMS  _Output.Put_Line(Chr(9)); 
    DBMS  _Output.Put_Line('END Sel;'); 
  GetSeparator; 
    DBMS  _Output.Put_Line(Chr(9)); 
 
 
  -- Insert 
  GetSeparator; 
    DBMS  _Output.Put_Line('  PROCEDURE   Ins ('); 
    DBMS  _Output.Put_Line(Chr(9) || 'p_' || RPad(Lower(v_table_name), 30, ' ') || ' 
  IN  ' || Lower(v_table_name) || '%ROWTYPE,'); 
    DBMS  _Output.Put_Line(Chr(9) || 'p_' || RPad('commit', 30, ' ') || '  IN  VARCH 
AR2 DEFAULT ''Y'''); 
    DBMS  _Output.Put_Line(') IS'); 
  GetSeparator; 
 
    DBMS  _Output.Put_Line('BEGIN'); 
    DBMS  _Output.Put_Line(Chr(9)); 
 
    DBMS  _Output.Put_Line(Chr(9) || 'INSERT INTO ' || Lower(v_table_name)); 
    DBMS  _Output.Put_Line(Chr(9) || '('); 
  GetInsertColumnList; 
    DBMS  _Output.Put_Line(Chr(9) || ')'); 
    DBMS  _Output.Put_Line(Chr(9) || 'VALUES'); 
    DBMS  _Output.Put_Line(Chr(9) || '('); 
  GetInsertValueList; 
    DBMS  _Output.Put_Line(Chr(9) || ');'); 
    DBMS  _Output.Put_Line(Chr(9)); 
 
  GetCommit; 
    DBMS  _Output.Put_Line('END Ins;'); 
  GetSeparator; 
    DBMS  _Output.Put_Line(Chr(9)); 
 
  -- Update 
  GetSeparator; 
    DBMS  _Output.Put_Line('  PROCEDURE   Upd ('); 
    DBMS  _Output.Put_Line(Chr(9) || 'p_' || RPad(Lower(v_table_name), 30, ' ') || ' 
  IN  ' || Lower(v_table_name) || '%ROWTYPE,'); 
    DBMS  _Output.Put_Line(Chr(9) || 'p_' || RPad('commit', 30, ' ') || '  IN  VARCH 
AR2 DEFAULT ''Y'''); 
    DBMS  _Output.Put_Line(') IS'); 
  GetSeparator; 
 
    DBMS  _Output.Put_Line('BEGIN'); 
    DBMS  _Output.Put_Line(Chr(9)); 
    DBMS  _Output.Put_Line(Chr(9) || 'UPDATE ' || Lower(v_table_name)); 
  GetUpdateSetList; 
  GetPKWhere('Y'); 
    DBMS  _Output.Put_Line(Chr(9)); 
 
  GetCommit; 
    DBMS  _Output.Put_Line('END Upd;'); 
  GetSeparator; 
    DBMS  _Output.Put_Line(Chr(9)); 
 
  -- Delete 
  GetSeparator; 
    DBMS  _Output.Put_Line('  PROCEDURE   Del ('); 
  GetPKParameterList; 
    DBMS  _Output.Put_Line(') IS'); 
  GetSeparator; 
 
    DBMS  _Output.Put_Line('BEGIN'); 
    DBMS  _Output.Put_Line(Chr(9)); 
    DBMS  _Output.Put_Line(Chr(9) || 'DELETE FROM ' || Lower(v_table_name)); 
  GetPKWhere; 
    DBMS  _Output.Put_Line(Chr(9)); 
 
  GetCommit; 
    DBMS  _Output.Put_Line('END Del;'); 
  GetSeparator; 
    DBMS  _Output.Put_Line(Chr(9)); 
 
    DBMS  _Output.Put_Line('END ' || Lower(v_table_name) || '_api;'); 
    DBMS  _Output.Put_Line('/'); 
 
END; 
/ 
 
SPOOL OFF 
 
SET ECHO ON 
SET TERMOUT ON 
SET FEEDBACK ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
