 
 
-- ----------------------------------------------------------------------------- 
------ 
es.sql 
--  Author        : aws-senior.com 
-- Description  : Use this script to alter the autotask window schedules. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @autotask_change_window_schedules.sql 
-- ----------------------------------------------------------------------------- 
------ 
 
  DECLARE   
  TYPE t_window_tab IS TABLE OF VARCHAR2(30) 
    INDEX BY BINARY_INTEGER; 
 
  l_tab              t_window_tab; 
  l_repeat_interval  VARCHAR2(100); 
  l_duration         NUMBER; 
BEGIN 
 
  -- Windows of interest. 
  l_tab(1) := 'SYS.MONDAY_WINDOW'; 
  l_tab(2) := 'SYS.TUESDAY_WINDOW'; 
  l_tab(3) := 'SYS.WEDNESDAY_WINDOW'; 
  l_tab(4) := 'SYS.THURSDAY_WINDOW'; 
  l_tab(5) := 'SYS.FRIDAY_WINDOW'; 
  --l_tab(6) := 'SYS.SATURDAY_WINDOW'; 
  --l_tab(7) := 'SYS.SUNDAY_WINDOW'; 
 
  -- Adjust as required. 
  l_repeat_interval := 'freq=weekly; byday=mon; byhour=12; byminute=0; bysecond= 
0;'; 
  l_duration        := 120; -- minutes 
 
  FOR i IN l_tab.FIRST .. l_tab.LAST LOOP 
      DBMS  _SCHEDULER.disable(name => l_tab(i), force => TRUE); 
 
      DBMS  _SCHEDULER.set_attribute( 
      name      => l_tab(i), 
      attribute => 'REPEAT_INTERVAL', 
      value     => l_repeat_interval); 
 
      DBMS  _SCHEDULER.set_attribute( 
      name      => l_tab(i), 
      attribute => 'DURATION', 
      value     => numtodsinterval(l_duration, 'minute')); 
 
      DBMS  _SCHEDULER.enable(name => l_tab(i)); 
  END LOOP; 
END; 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
