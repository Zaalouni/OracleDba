--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB - Ultimate Database Health Check (DBMS_HM)
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET PAGESIZE 60
SET LINESIZE 300
 
-- run a health check on the Oracle database.

BEGIN
   DBMS_HM.run_check ('Dictionary Integrity Check', 'report_dictionary_integrity');
END;
/

or

BEGIN
   DBMS_HM.RUN_CHECK (check_name     => 'Transaction Integrity Check',
                      run_name       => 'my_transaction_run',
                      input_params   => 'TXN_ID=22.87.1');
END;


----  Viewing the first report in text format with DBMS_HM (HTML & XML format are also available):

SET LONG 100000
SET LONGCHUNKSIZE 1000
SET PAGESIZE 1000
SET LINESIZE 512
SELECT DBMS_HM.get_run_report ('report_dictionary_integrity') FROM DUAL;

--- Listing all the Health Check executed (Health Monitor View):

SELECT run_id,       name,        check_name,        run_mode,        status,        src_incident,        num_incident,        error_number
FROM v$hm_run;


--- Viewing the list of checks that can be done on your database

SELECT name     FROM v$hm_check      WHERE internal_check = 'N';


--- Displaying parameter information for all health checks

SELECT c.name check_name,          p.name parameter_name,          p.TYPE,          p.DEFAULT_VALUE,          p.description
  FROM v$hm_check_param p, v$hm_check c
  WHERE p.check_id = c.id AND c.internal_check = 'N'
  ORDER BY c.name;
  

--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB - Ultimate Database Health Check (DBMS_HM)
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
