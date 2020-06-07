 
 
-- ----------------------------------------------------------------------------- 
------ 
.sql 
--  Author        : aws-senior.com 
-- Description  : Displays the DDL for a specific user. 
--                Better approaches included here. 
through 
-- Call Syntax  : @logon_as_user_orig (username) 
-- ----------------------------------------------------------------------------- 
------ 
 
set serveroutput on verify off 
declare 
  l_username VARCHAR2(30) :=  upper('&1'); 
  l_orig_pwd VARCHAR2(32767); 
begin 
    select   password 
  into   l_orig_pwd 
  from     dba  _users 
  where  username = l_username; 
 
  dbms_output.put_line('--'); 
  dbms_output.put_line('alter user ' || l_username || ' identified by DummyPassw 
ord1;'); 
  dbms_output.put_line('conn ' || l_username || '/DummyPassword1'); 
 
  dbms_output.put_line('--'); 
  dbms_output.put_line('-- Do something here.'); 
  dbms_output.put_line('--'); 
 
  dbms_output.put_line('conn / as sys  dba  '); 
  dbms_output.put_line('alter user ' || l_username || ' identified by values ''' 
||l_orig_pwd||''';'); 
end; 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
