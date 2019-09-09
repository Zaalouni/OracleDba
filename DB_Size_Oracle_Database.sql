--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  Size of Oracle Database
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------




SET LINESIZE 150

select
( select sum(bytes)/1024/1024/1024 data_size from dba_data_files ) +
( select nvl(sum(bytes),0)/1024/1024/1024 temp_size from dba_temp_files ) +
( select sum(bytes)/1024/1024/1024 redo_size from sys.v_$log ) +
( select sum(BLOCK_SIZE*FILE_SIZE_BLKS)/1024/1024/1024 controlfile_size from v$controlfile) from dual;


--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  Size of Oracle Database
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
