 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Creates the DDL for specified segment, or all segments. 
-- Call Syntax  : @rbs_structure (segment-name or all) 
-- ----------------------------------------------------------------------------- 
------ 
SET SERVEROUTPUT ON 
SET LINESIZE 100 
SET VERIFY OFF 
SET FEEDBACK OFF 
PROMPT 
 
  DECLARE   
 
    CURSOR cu_rs IS 
          SELECT   a.segment_name, 
               a.  tablespace  _name, 
               a.initial_extent, 
               a.next_extent, 
               a.min_extents, 
               a.max_extents, 
               a.pct_increase, 
               b.bytes 
        FROM     dba  _rollback_segs a, 
                 dba  _segments      b 
          WHERE    a.segment_name = b.segment_name 
        AND    a.segment_name  = Decode(Upper('&&1'), 'ALL',a.segment_name, Uppe 
r('&&1')) 
        ORDER BY a.segment_name; 
 
BEGIN 
 
      DBMS  _Output.Disable; 
      DBMS  _Output.Enable(1000000); 
 
    FOR cur_rs IN cu_rs LOOP 
          DBMS  _Output.Put_Line('PROMPT'); 
          DBMS  _Output.Put_Line('PROMPT Creating Rollback Segment ' || cur_rs.segme 
nt_name); 
          DBMS  _Output.Put_Line('CREATE ROLLBACK SEGMENT ' || Lower(cur_rs.segment_ 
name)); 
          DBMS  _Output.Put_Line('TABLESPACE ' || Lower(cur_rs.  tablespace  _name)); 
 
          DBMS  _Output.Put_Line('STORAGE   ('); 
          DBMS  _Output.Put_Line('          INITIAL     ' || Trunc(cur_rs.initial_ex 
tent/1024) || 'K'); 
          DBMS  _Output.Put_Line('          NEXT        ' || Trunc(cur_rs.next_exten 
t/1024) || 'K'); 
          DBMS  _Output.Put_Line('          MINEXTENTS  ' || cur_rs.min_extents); 
          DBMS  _Output.Put_Line('          MAXEXTENTS  ' || cur_rs.max_extents); 
          DBMS  _Output.Put_Line('          PCTINCREASE ' || cur_rs.pct_increase); 
          DBMS  _Output.Put_Line('  )'); 
          DBMS  _Output.Put_Line('/'); 
          DBMS  _Output.Put_Line('  '); 
    END LOOP; 
 
      DBMS  _Output.Put_Line('      '); 
 
END; 
/ 
 
SET VERIFY ON 
SET FEEDBACK ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
