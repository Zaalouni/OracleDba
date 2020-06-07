 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays a list of SQL statements that are using the most reso 
urces. 
-- Comments     : The address column can be use as a parameter with SQL_Text.sql 
 to display the full statement. 
--  Requirements  : Access to the V$ views. 
-- Call Syntax  : @top_sql (number) 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 500 
SET PAGESIZE 1000 
SET VERIFY OFF 
 
  SELECT   * 
FROM   (  SELECT   Substr(a.sql_text,1,50) sql_text, 
               Trunc(a.disk_reads/Decode(a.executions,0,1,a.executions)) reads_p 
er_execution, 
               a.buffer_gets, 
               a.disk_reads, 
               a.executions, 
               a.sorts, 
               a.address 
        FROM   v$sqlarea a 
        ORDER BY 2 DESC) 
  WHERE    rownum <= &&1; 
 
SET PAGESIZE 14 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
