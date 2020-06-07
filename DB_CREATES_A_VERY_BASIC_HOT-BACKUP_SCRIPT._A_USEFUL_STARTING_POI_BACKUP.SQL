 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Creates a very basic hot-backup script. A useful starting poin 
t. 
-- Call Syntax  : @backup 
-- ----------------------------------------------------------------------------- 
------ 
SET SERVEROUTPUT ON 
SET LINESIZE 1000 
SET TRIMOUT ON 
SET FEEDBACK OFF 
SPOOL Backup.txt 
 
  DECLARE   
 
    CURSOR c_  tablespace   IS 
          SELECT   a.  tablespace  _name 
        FROM     dba  _  tablespace  s a 
        ORDER BY 1; 
 
    CURSOR c_datafiles (in_ts_name  IN  VARCHAR2) IS 
          SELECT   a.file_name 
        FROM     dba  _data_files a 
          WHERE    a.  tablespace  _name = in_ts_name 
        ORDER BY 1; 
 
    CURSOR c_archive_redo IS 
          SELECT   a.value 
        FROM   v$parameter a 
          WHERE    a.name = \'log_archive_dest\'; 
 
    v_sid            VARCHAR2(100) := \'ORCL\'; 
    v_backup_com     VARCHAR2(100) := \'!ocopy \'; 
    v_remove_com     VARCHAR2(100) := \'!rm\'; 
    v_dest_loc       VARCHAR2(100) := \'/opt/oracleddds/dbs1/oradata/ddds/\'; 
 
BEGIN 
 
      DBMS  _Output.Disable; 
      DBMS  _Output.Enable(1000000); 
 
      DBMS  _Output.Put_Line(\'svrmgrl\'); 
      DBMS  _Output.Put_Line(\'connect internal\'); 
 
      DBMS  _Output.Put_Line(\'     \'); 
      DBMS  _Output.Put_Line(\'-- ----------------------\'); 
      DBMS  _Output.Put_Line(\'-- Backup all   tablespace  s\'); 
      DBMS  _Output.Put_Line(\'-- ----------------------\'); 
    FOR cur_ts IN c_  tablespace   LOOP 
          DBMS  _Output.Put_Line(\' \'); 
          DBMS  _Output.Put_Line(\'ALTER TABLESPACE \' || cur_ts.  tablespace  _name || 
\' BEGIN BACKUP;\'); 
        FOR cur_df IN c_datafiles (in_ts_name => cur_ts.  tablespace  _name) LOOP 
              DBMS  _Output.Put_Line(v_backup_com || \' \' || cur_df.file_name || \' 
 \' || 
                                 v_dest_loc || SUBSTR(cur_df.file_name, INSTR(cu 
r_df.file_name, \'/\', -1)+1)); 
        END LOOP; 
          DBMS  _Output.Put_Line(\'ALTER TABLESPACE \' || cur_ts.  tablespace  _name || 
\' END BACKUP;\'); 
    END LOOP; 
 
      DBMS  _Output.Put_Line(\'     \'); 
      DBMS  _Output.Put_Line(\'-- -----------------------------\'); 
      DBMS  _Output.Put_Line(\'-- Backup the archived redo logs\'); 
      DBMS  _Output.Put_Line(\'-- -----------------------------\'); 
    FOR cur_ar IN c_archive_redo LOOP 
          DBMS  _Output.Put_Line(v_backup_com || \' \' || cur_ar.value || \'/* \' || 
                             v_dest_loc); 
    END LOOP; 
 
 
      DBMS  _Output.Put_Line(\'     \'); 
      DBMS  _Output.Put_Line(\'-- ----------------------\'); 
      DBMS  _Output.Put_Line(\'-- Backup the controlfile\'); 
      DBMS  _Output.Put_Line(\'-- ----------------------\'); 
      DBMS  _Output.Put_Line(\'ALTER DATABASE BACKUP CONTROLFILE TO \'\'\' || v_dest 
_loc || v_sid || \'Controlfile.backup\'\';\'); 
      DBMS  _Output.Put_Line(v_backup_com || \' \' || v_dest_loc || v_sid || \'Contr 
olfile.backup\'); 
      DBMS  _Output.Put_Line(v_remove_com || \' \' || v_dest_loc || v_sid || \'Contr 
olfile.backup\'); 
 
      DBMS  _Output.Put_Line(\'     \'); 
      DBMS  _Output.Put_Line(\'EXIT\'); 
 
END; 
/ 
 
PROMPT 
SPOOL OFF 
SET LINESIZE 80 
SET FEEDBACK ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
