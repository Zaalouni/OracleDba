 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays general information about the database. 
--  Requirements  : Access to the v$ views. 
-- Call Syntax  : @db_info 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 1000 
SET LINESIZE 100 
SET FEEDBACK OFF 
 
  SELECT   * 
FROM   v$database; 
 
  SELECT   * 
FROM   v$instance; 
 
  SELECT   * 
FROM   v$version; 
 
  SELECT   a.name, 
       a.value 
FROM   v$sga a; 
 
  SELECT   Substr(c.name,1,60) "Controlfile", 
       NVL(c.status,'UNKNOWN') "Status" 
FROM   v$controlfile c 
ORDER BY 1; 
 
  SELECT   Substr(d.name,1,60) "Datafile", 
       NVL(d.status,'UNKNOWN') "Status", 
       d.enabled "Enabled", 
       LPad(To_Char(Round(d.bytes/1024000,2),'9999990.00'),10,' ') "Size (M)" 
FROM   v$datafile d 
ORDER BY 1; 
 
  SELECT   l.group# "Group", 
       Substr(l.member,1,60) "Logfile", 
       NVL(l.status,'UNKNOWN') "Status" 
FROM   v$logfile l 
ORDER BY 1,2; 
 
PROMPT 
SET PAGESIZE 14 
SET FEEDBACK ON 
 
 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
