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

SELECT  ksppinm name , ksppstvl value from x$ksppi a, x$ksppsv b where a.indx=b.indx and substr(ksppinm,1,1) = '_';


SELECT a.ksppinm AS parameter,
       a.ksppdesc AS description,
       b.ksppstvl AS session_value,
       c.ksppstvl AS instance_value
FROM   x$ksppi a,        x$ksppcv b,        x$ksppsv c 
WHERE  a.indx = b.indx
AND    a.indx = c.indx   AND    a.ksppinm LIKE '/_%' ESCAPE '/'
ORDER BY a.ksppinm;

--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  How to check hidden parameter in Oracle
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
