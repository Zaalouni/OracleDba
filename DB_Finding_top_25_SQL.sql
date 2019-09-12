--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB - Finding the top 25 SQL
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET LINESIZE 200
SET PAGESIZE 1000
SET FEEDBACK OFF
SET VERIFY OFF
declare
 top25 number;
 text1 varchar2(4000);
 x number;
 len1 number;
cursor c1 is
  select buffer_gets, substr(sql_text,1,4000)
  from v$sqlarea
  order by buffer_gets desc;
begin
 dbms_output.put_line('Gets'||'    '||'Text');
 dbms_output.put_line('----------'||
 ' '||'----------------------');
 open c1;
 for i in 1..25 loop
  fetch c1 into top25, text1;
  dbms_output.put_line(rpad(to_char(top25),9)||
   ' '||substr(text1,1,66));
len1:=length(text1);
x:=66;
  while len1 > x-1 loop
   dbms_output.put_line('"         '||substr(text1,x,66));
  x:=x+66;
  end loop;
 end loop;
end;
/

 
--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB - Finding the top 25 SQL
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
