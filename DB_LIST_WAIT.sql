--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -   Display importants waits events in our Oracle databases 
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET LINESIZE 300
SET PAGESIZE 60
Column "Average wait cs" format 9999990.00 heading "Attente moyenne|en cent-secondes"
column "Time waited seconds" format 999,999,999,990.00 heading "Temps attendu|en secondes"
colum event format a35 heading "Evenement" truncate
select
  substr(e.event, 1, 40)  event,
  e.time_waited/100 "Time waited seconds",
  e.time_waited / decode(
    e.event,
    'latch free', e.total_waits,
    decode(
      e.total_waits - e.total_timeouts,
      0, 1,
      e.total_waits - e.total_timeouts
    )
  ) "Average wait cs"
from
  sys.v_$system_event  e,
  sys.v_$instance  i
where
  e.event = 'buffer busy waits' or
  e.event = 'enqueue' or
  e.event = 'free buffer waits' or
  e.event = 'global cache freelist wait' or
  e.event = 'latch free' or
  e.event = 'log buffer space' or
  e.event = 'parallel query qref latch' or
  e.event = 'pipe put' or
  e.event = 'write complete waits' or
  e.event like 'library cache%' or
  e.event like 'log file switch%' or
  e.event = 'log file sync' or
  ( e.event = 'row cache lock' and
    i.parallel = 'NO'
  )
order by "Time waited seconds" desc
/


--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -     Display importants waits events in our Oracle databases 
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------