--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -    Display cursor
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------

SET LINESIZE 300
SET PAGESIZE 60 

--      INPUTS (v$sql_area): 
--	&1 = SQL_ID (in lowercase)
--	&2 = child_number


-- Informations about the last SQL Statement:
SELECT * FROM TABLE(dbms_xplan.display_cursor(null, null, 'ALLSTATS LAST'));


-- Informations about another statement identified with sql_id and child_number:
SELECT * FROM TABLE(dbms_xplan.display_cursor('&1', &2, 'ALLSTATS LAST'));


-- To display the values of bind variables
select * from table(dbms_xplan.display_cursor('&1', &2, 'SERIAL PEEKED_BINDS IOSTATS LAST'));


-- To read the result:
--   "E-Rows" is the number of estimated rows that Oracle expects that step in the plan to return
--   "A-Rows" is the actual number. 
--   "Starts" column is the number of times that that step in the plan is "executed"
--    Note: "A-Rows" column is the cumulative count over all executions, 
--          "E-Rows" is the estimate for each execution of the step. 


Output example:


-----------------------------------------------------------------------------------------------
| Id  | Operation                    | Name | Starts | E-Rows | A-Rows |   A-Time   | Buffers |
-----------------------------------------------------------------------------------------------
|   1 |  SORT AGGREGATE              |      |      1 |      1 |      1 |00:00:00.02 |     196 |
|   2 |   TABLE ACCESS BY INDEX ROWID| T1   |      1 |     40 |    225 |00:00:00.02 |     196 |
|   3 |    NESTED LOOPS              |      |      1 |    225 |    241 |00:00:00.03 |     196 |
|*  4 |     TABLE ACCESS FULL        | T2   |      1 |     40 |     40 |00:00:00.01 |      45 |
|*  5 |     INDEX RANGE SCAN         | T_I1 |     10 |     40 |    400 |00:00:00.01 |       8 |
-----------------------------------------------------------------------------------------------        

In this example, in line 5:  E-rows = 40 and A-rows = 400, because line 5 starts 10 times: 
so 400 actual rows = (10 starts) * (40 estimated rows per start).




--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -  Display cursor
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------