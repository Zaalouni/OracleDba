 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays information about all database users. 
--  Requirements  : Access to the   dba  _users view. 
-- Call Syntax  : @users [ username | % (for all)] 
-- ----------------------------------------------------------------------------- 
------ 
SET LINESIZE 200 VERIFY OFF 
 
COLUMN username FORMAT A20 
COLUMN account_status FORMAT A16 
COLUMN default_  tablespace   FORMAT A15 
COLUMN temporary_  tablespace   FORMAT A15 
COLUMN profile FORMAT A15 
 
  SELECT   username, 
       account_status, 
       TO_CHAR(lock_date, 'DD-MON-YYYY') AS lock_date, 
       TO_CHAR(expiry_date, 'DD-MON-YYYY') AS expiry_date, 
       default_  tablespace  , 
       temporary_  tablespace  , 
       TO_CHAR(created, 'DD-MON-YYYY') AS created, 
       profile, 
       initial_rsrc_consumer_group, 
       editions_enabled, 
       authentication_type 
FROM     dba  _users 
  WHERE    username LIKE UPPER('%&1%') 
ORDER BY username; 
 
SET VERIFY ON 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
