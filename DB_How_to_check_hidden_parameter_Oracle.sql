--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  How to check hidden parameter in Oracle
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET LINESIZE 150
SET lines 200
col name for a50
col value for a40

select ksppinm name , ksppstvl value from x$ksppi a, x$ksppsv b where a.indx=b.indx and substr(ksppinm,1,1) = '_';



--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  How to check hidden parameter in Oracle
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
