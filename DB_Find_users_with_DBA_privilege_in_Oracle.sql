--------------------------------------------------------------------------------------
-- Thank you for giving your valuable time to read the above information.
-- If you want to be updated with all our articles send us the Invitation or Follow us:
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  Find users with DBA privilege in Oracle
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------



select * from dba_role_privs where granted_role='DBA';

GRANTEE                   GRANTED_ROLE        ADMIN_OPTION        DEFAULT_ROLE
------------------------- --------- ------------------------------------------- --------- -
SYS                        DBA                     YES             YES
SYSTEM                     DBA                     YES             YES
 


--------------------------------------------------------------------------------------
-- Thank you for giving your valuable time to read the above information.
-- If you want to be updated with all our articles send us the Invitation or Follow us:
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  Find users with DBA privilege in Oracle
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
