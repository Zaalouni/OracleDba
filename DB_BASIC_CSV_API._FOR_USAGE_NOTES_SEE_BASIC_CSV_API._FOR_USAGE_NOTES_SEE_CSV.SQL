 
 
CREATE OR REPLACE PACKAGE csv AS 
-- -------------------------------------------------------------------------- 
--  Author        : aws-senior.com 
-- Description  : Basic CSV API. For usage notes see: 
-- 
--                  CREATE OR REPLACE DIRECTORY   dba  _dir AS '/u01/app/oracle/  dba  / 
'; 
--                  ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY HH24:MI:SS'; 
-- 
--                  EXEC csv.generate('DBA_DIR', 'generate.csv', p_query => 'SEL 
ECT * FROM emp'); 
-- 
--  Requirements  : UTL_FILE,   DBMS  _SQL 
-- Ammedments   : 
--   When         Who       What 
--   ===========  ========  ================================================= 
--   14-MAY-2005  aws-senior.com  Initial Creation 
--   19-MAY-2016  aws-senior.com  Add REF CURSOR support. 
--   15-JAN-2019  aws-senior.com  Add   DBMS  _OUTPUT support. 
--   31-JAN-2019  aws-senior.com  Add set_quotes procedure. 
-- -------------------------------------------------------------------------- 
 
  PROCEDURE   generate (p_dir        IN  VARCHAR2, 
                    p_file       IN  VARCHAR2, 
                    p_query      IN  VARCHAR2); 
 
  PROCEDURE   generate_rc (p_dir        IN  VARCHAR2, 
                       p_file       IN  VARCHAR2, 
                       p_refcursor  IN OUT SYS_REFCURSOR); 
 
  PROCEDURE   output (p_query  IN  VARCHAR2); 
 
  PROCEDURE   output_rc (p_refcursor  IN OUT SYS_REFCURSOR); 
 
  PROCEDURE   set_separator (p_sep  IN  VARCHAR2); 
 
  PROCEDURE   set_quotes (p_add_quotes  IN  BOOLEAN := TRUE, 
                      p_quote_char  IN  VARCHAR2 := '"'); 
 
END csv; 
/ 
SHOW ERRORS 
 
CREATE OR REPLACE PACKAGE BODY csv AS 
-- -------------------------------------------------------------------------- 
--  Author        : aws-senior.com 
-- Description  : Basic CSV API. For usage notes see: 
-- 
--                  CREATE OR REPLACE DIRECTORY   dba  _dir AS '/u01/app/oracle/  dba  / 
'; 
--                  ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY HH24:MI:SS'; 
-- 
--                  -- Query 
--                  EXEC csv.generate('DBA_DIR', 'generate.csv', p_query => 'SEL 
ECT * FROM emp'); 
-- 
--                  -- Ref Cursor 
--                    DECLARE   
--                    l_refcursor  SYS_REFCURSOR; 
--                  BEGIN 
--                    OPEN l_refcursor FOR 
--                        SELECT   * FROM emp; 
-- 
--                    csv.generate_rc('DBA_DIR','generate.csv', l_refcursor); 
--                  END; 
--                  / 
-- 
-- 
--  Requirements  : UTL_FILE,   DBMS  _SQL 
-- Ammedments   : 
--   When         Who       What 
--   ===========  ========  ================================================= 
--   14-MAY-2005  aws-senior.com  Initial Creation 
--   19-MAY-2016  aws-senior.com  Add REF CURSOR support. 
--   15-JAN-2019  aws-senior.com  Add   DBMS  _OUTPUT support. 
--   31-JAN-2019  aws-senior.com  Add quotes to strings. Code suggested by Moose T. 
-- -------------------------------------------------------------------------- 
 
g_out_type    VARCHAR2(1) := 'F'; 
g_sep         VARCHAR2(5) := ','; 
g_add_quotes  BOOLEAN     := TRUE; 
g_quote_char  VARCHAR2(1) := '"'; 
 
-- Prototype for hidden procedures. 
  PROCEDURE   generate_all (p_dir        IN  VARCHAR2, 
                        p_file       IN  VARCHAR2, 
                        p_query      IN  VARCHAR2, 
                        p_refcursor  IN OUT SYS_REFCURSOR); 
 
  PROCEDURE   put (p_file  IN  UTL_FILE.file_type, 
               p_text  IN  VARCHAR2); 
 
  PROCEDURE   new_line (p_file  IN  UTL_FILE.file_type); 
 
 
 
-- Stub to generate a CSV from a query. 
  PROCEDURE   generate (p_dir        IN  VARCHAR2, 
                    p_file       IN  VARCHAR2, 
                    p_query      IN  VARCHAR2) AS 
  l_cursor  SYS_REFCURSOR; 
BEGIN 
  g_out_type := 'F'; 
 
  generate_all (p_dir        => p_dir, 
                p_file       => p_file, 
                p_query      => p_query, 
                p_refcursor  => l_cursor); 
END generate; 
 
 
-- Stub to generate a CVS from a REF CURSOR. 
  PROCEDURE   generate_rc (p_dir        IN  VARCHAR2, 
                       p_file       IN  VARCHAR2, 
                       p_refcursor  IN OUT SYS_REFCURSOR) AS 
BEGIN 
  g_out_type := 'F'; 
 
  generate_all (p_dir        => p_dir, 
                p_file       => p_file, 
                p_query      => NULL, 
                p_refcursor  => p_refcursor); 
END generate_rc; 
 
 
-- Stub to output a CSV from a query. 
  PROCEDURE   output (p_query  IN  VARCHAR2) AS 
  l_cursor  SYS_REFCURSOR; 
BEGIN 
  g_out_type := 'D'; 
 
  generate_all (p_dir        => NULL, 
                p_file       => NULL, 
                p_query      => p_query, 
                p_refcursor  => l_cursor); 
END output; 
 
 
-- Stub to output a CVS from a REF CURSOR. 
  PROCEDURE   output_rc (p_refcursor  IN OUT SYS_REFCURSOR) AS 
BEGIN 
  g_out_type := 'D'; 
 
  generate_all (p_dir        => NULL, 
                p_file       => NULL, 
                p_query      => NULL, 
                p_refcursor  => p_refcursor); 
END output_rc; 
 
 
-- Do the actual work. 
  PROCEDURE   generate_all (p_dir        IN  VARCHAR2, 
                        p_file       IN  VARCHAR2, 
                        p_query      IN  VARCHAR2, 
                        p_refcursor  IN OUT  SYS_REFCURSOR) AS 
  l_cursor    PLS_INTEGER; 
  l_rows      PLS_INTEGER; 
  l_col_cnt   PLS_INTEGER; 
  l_desc_tab    DBMS  _SQL.desc_tab2; 
  l_buffer    VARCHAR2(32767); 
  l_is_str    BOOLEAN; 
 
  l_file      UTL_FILE.file_type; 
BEGIN 
  IF p_query IS NOT NULL THEN 
    l_cursor :=   DBMS  _SQL.open_cursor; 
      DBMS  _SQL.parse(l_cursor, p_query,   DBMS  _SQL.native); 
  ELSIF p_refcursor%ISOPEN THEN 
     l_cursor :=   DBMS  _SQL.to_cursor_number(p_refcursor); 
  ELSE 
    RAISE_APPLICATION_ERROR(-20000, 'You must specify a query or a REF CURSOR.') 
; 
  END IF; 
 
    DBMS  _SQL.describe_columns2 (l_cursor, l_col_cnt, l_desc_tab); 
 
  FOR i IN 1 .. l_col_cnt LOOP 
      DBMS  _SQL.define_column(l_cursor, i, l_buffer, 32767 ); 
  END LOOP; 
 
  IF p_query IS NOT NULL THEN 
    l_rows :=   DBMS  _SQL.execute(l_cursor); 
  END IF; 
 
  IF g_out_type = 'F' THEN 
    l_file := UTL_FILE.fopen(p_dir, p_file, 'w', 32767); 
  END IF; 
 
  -- Output the column names. 
  FOR i IN 1 .. l_col_cnt LOOP 
    IF i > 1 THEN 
      put(l_file, g_sep); 
    END IF; 
    put(l_file, l_desc_tab(i).col_name); 
  END LOOP; 
  new_line(l_file); 
 
  -- Output the data. 
  LOOP 
    EXIT WHEN   DBMS  _SQL.fetch_rows(l_cursor) = 0; 
 
    FOR i IN 1 .. l_col_cnt LOOP 
      IF i > 1 THEN 
        put(l_file, g_sep); 
      END IF; 
 
      -- Check if this is a string column. 
      l_is_str := FALSE; 
      IF l_desc_tab(i).col_type IN (  DBMS  _TYPES.typecode_varchar, 
                                      DBMS  _TYPES.typecode_varchar2, 
                                      DBMS  _TYPES.typecode_char, 
                                      DBMS  _TYPES.typecode_clob, 
                                      DBMS  _TYPES.typecode_nvarchar2, 
                                      DBMS  _TYPES.typecode_nchar, 
                                      DBMS  _TYPES.typecode_nclob) THEN 
        l_is_str := TRUE; 
      END IF; 
 
        DBMS  _SQL.COLUMN_VALUE(l_cursor, i, l_buffer); 
      -- Optionally add quotes for strings. 
      IF g_add_quotes AND l_is_str  THEN 
        put(l_file, g_quote_char); 
        put(l_file, l_buffer); 
        put(l_file, g_quote_char); 
      ELSE 
        put(l_file, l_buffer); 
      END IF; 
    END LOOP; 
    new_line(l_file); 
  END LOOP; 
 
  IF UTL_FILE.is_open(l_file) THEN 
    UTL_FILE.fclose(l_file); 
  END IF; 
    DBMS  _SQL.close_cursor(l_cursor); 
EXCEPTION 
  WHEN OTHERS THEN 
    IF UTL_FILE.is_open(l_file) THEN 
      UTL_FILE.fclose(l_file); 
    END IF; 
    IF   DBMS  _SQL.is_open(l_cursor) THEN 
        DBMS  _SQL.close_cursor(l_cursor); 
    END IF; 
      DBMS  _OUTPUT.put_line('ERROR: ' ||   DBMS  _UTILITY.format_error_backtrace); 
    RAISE; 
END generate_all; 
 
 
-- Alter separator from default. 
  PROCEDURE   set_separator (p_sep  IN  VARCHAR2) AS 
BEGIN 
  g_sep := p_sep; 
END set_separator; 
 
 
-- Alter separator from default. 
  PROCEDURE   set_quotes (p_add_quotes  IN  BOOLEAN := TRUE, 
                      p_quote_char  IN  VARCHAR2 := '"') AS 
BEGIN 
  g_add_quotes := NVL(p_add_quotes, TRUE); 
  g_quote_char := NVL(SUBSTR(p_quote_char,1,1), '"'); 
END set_quotes; 
 
 
-- Handle put to file or screen. 
  PROCEDURE   put (p_file  IN  UTL_FILE.file_type, 
               p_text  IN  VARCHAR2) AS 
BEGIN 
  IF g_out_type = 'F' THEN 
    UTL_FILE.put(p_file, p_text); 
  ELSE 
      DBMS  _OUTPUT.put(p_text); 
  END IF; 
END put; 
 
 
-- Handle newline to file or screen. 
  PROCEDURE   new_line (p_file  IN  UTL_FILE.file_type) AS 
BEGIN 
  IF g_out_type = 'F' THEN 
    UTL_FILE.new_line(p_file); 
  ELSE 
      DBMS  _OUTPUT.new_line; 
  END IF; 
END new_line; 
 
END csv; 
/ 
SHOW ERRORS 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
