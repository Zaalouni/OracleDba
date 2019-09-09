--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  How to add Datafile in Oracle
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------




SET LINESIZE 150


ALTER TABLESPACE USERS ADD DATAFILE '/ora01/oracle/oradata/users_02.dbf' SIZE 2560M AUTOEXTEND ON NEXT 10M MAXSIZE 5000M;

ALTER TABLESPACE USERS ADD DATAFILE '/ora01/oracle/oradata/users_03.dbf' SIZE 2560M AUTOEXTEND ON NEXT 10M MAXSIZE 5000M;

ALTER TABLESPACE USERS ADD DATAFILE '/ora01/oracle/oradata/users_04.dbf' SIZE 2560M AUTOEXTEND ON NEXT 10M MAXSIZE 5000M;











--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  How to add Datafile in Oracle
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
