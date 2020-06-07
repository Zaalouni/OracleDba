 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : aws-senior.com 
-- Description  : Displays the amount of IO for each datafile. 
--  Requirements  : Access to the v$ views. 
-- Call Syntax  : @file_io 
-- ----------------------------------------------------------------------------- 
------ 
SET PAGESIZE 1000 
 
       f.phyblkrd "Blocks Read", 
       f.phyblkwrt "Blocks Writen", 
       f.phyblkrd + f.phyblkwrt "Total I/O" 
FROM   v$filestat f, 
       v$datafile d 
  WHERE    d.file# = f.file# 
ORDER BY f.phyblkrd + f.phyblkwrt DESC; 
 
SET PAGESIZE 18 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
