--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -    Displays Last Analyzed Details for a Given Schema 
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
SET PAGESIZE 60
SET LINESIZE 300
 
SELECT t.owner,
       t.table_name AS "Table Name", 
       t.num_rows AS "Rows", 
       t.avg_row_len AS "Avg Row Len", 
       Trunc((t.blocks * p.value)/1024) AS "Size KB", 
       to_char(t.last_analyzed,'DD/MM/YYYY HH24:MM:SS') AS "Last Analyzed"
FROM   dba_tables t,        v$parameter p
WHERE t.owner = Decode(Upper('&&Table_Owner'), 'ALL', t.owner, Upper('&&Table_Owner'))
AND   p.name = 'db_block_size'
ORDER by t.owner,t.last_analyzed,t.table_name
/

--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -    Displays Last Analyzed Details for a Given Schema 
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
