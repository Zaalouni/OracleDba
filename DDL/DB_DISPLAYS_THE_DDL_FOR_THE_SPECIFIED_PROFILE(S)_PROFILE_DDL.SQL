 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the DDL for the specified profile(s). 
-- Call Syntax  : @profile_ddl (profile | part of profile) 
-- ----------------------------------------------------------------------------- 
------ 
 
set long 20000 longchunksize 20000 pagesize 0 linesize 1000 fee  dba  ck off verify 
off trimspool on 
column ddl format a1000 
 
begin 
   dbms_metadata.set_transform_param (dbms_metadata.session_transform, 'SQLTERMI 
NATOR', true); 
   dbms_metadata.set_transform_param (dbms_metadata.session_transform, 'PRETTY', 
 true); 
end; 
/ 
 
  select   dbms_metadata.get_ddl('PROFILE', profile) as profile_ddl 
from   (  select   distinct profile 
        from     dba  _profiles) 
where  profile like upper('%&1%'); 
 
set linesize 80 pagesize 14 fee  dba  ck on verify on 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
