--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  HIT RATIO BY SESSION
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET LINESIZE 200
SET PAGESIZE 1000
SET FEEDBACK OFF
SET VERIFY OFF
column HitRatio format 999.99
select substr(Username,1,15) username, Consistent_Gets,
              Block_Gets, Physical_Reads, 100*(Consistent_Gets+Block_Gets-Physical_Reads)/(Consistent_Gets+Block_Gets) HitRatio
from V$SESSION, V$SESS_IO
where V$SESSION.SID = V$SESS_IO.SID
   and (Consistent_Gets+Block_Gets)>0
   and Username is not null;

--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB - HIT RATIO BY SESSION
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
