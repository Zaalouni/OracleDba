 
 
-- ----------------------------------------------------------------------------- 
------ 
--  Author        : www.aws-senior.com 
-- Description  : Displays scheduler job information for pvious runs. 
--  Requirements  : Access to the DBA views. 
-- Call Syntax  : @job_output_file (job-name) (credential-name) 
-- ----------------------------------------------------------------------------- 
------ 
 
SET VERIFY OFF 
 
SET SERVEROUTPUT ON 
  DECLARE   
  l_clob             CLOB; 
  l_additional_info  VARCHAR2(4000); 
  l_external_log_id  VARCHAR2(50); 
BEGIN 
    SELECT   additional_info, external_log_id 
  INTO   l_additional_info, l_external_log_id 
  FROM   (  SELECT   log_id, 
                 additional_info, 
                 REGEXP_SUBSTR(additional_info,'job[_0-9]*') AS external_log_id 
          FROM     dba  _scheduler_job_run_details 
            WHERE    job_name = UPPER('&1') 
          ORDER BY log_id DESC) 
    WHERE    ROWNUM = 1; 
 
    DBMS  _OUTPUT.put_line('ADDITIONAL_INFO: ' || l_additional_info); 
    DBMS  _OUTPUT.put_line('EXTERNAL_LOG_ID: ' || l_external_log_id); 
 
    DBMS  _LOB.createtemporary(l_clob, FALSE); 
 
    DBMS  _SCHEDULER.get_file( 
    source_file     => l_external_log_id ||'_stdout', 
    credential_name => UPPER('&2'), 
    file_contents   => l_clob, 
    source_host     => NULL); 
 
    DBMS  _OUTPUT.put_line('stdout:'); 
    DBMS  _OUTPUT.put_line(l_clob); 
END; 
/ 
 
 
-------------------------------------------------------------------------------------- 
--  File Name     : https://github.com/Zaalouni/OracleDba  
--  Author        : Zaalouni 
--  website       : www.aws-senior.com 
-- Github       : https://github.com/Zaalouni/OracleDba 
-------------------------------------------------------------------------------------- 
  
