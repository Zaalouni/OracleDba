#!/bin/ksh
#
#--------------------------------------------------------------------------------------
#-- File Name    : https://github.com/Zaalouni/OracleDba
#-- Author       : Zaalouni
#-- Description  : Oracle DB -    Full RMAN Incremental Backup to Tape 
##-- website      : http://www.aws-senior.com
#-- Github       : https://github.com/Zaalouni/OracleDba
#-- -----------------------------------------------------------------------------------


export ORACLE_SID=SID
export ORACLE_HOME=/u01/app/oracle/product/12.2.0
export PATH=$PATH:$ORACLE_HOME/bin
export NLS_DATE_FORMAT="DD-MON-YYYY:HH24:MI:SS"
export NLS_LANG=AMERICAN_AMERICA.WE8ISO8859P1
export ORA_NLS33=$ORACLE_HOME/ocommon/nls/admin/data
export DATE=`date '+%d%m%y_%H%M%S'`
export LOG=/home/oracle
export LOGFILE=${LOG}/rman_${ORACLE_SID}_tape_backup_${DATE}.log
$ORACLE_HOME/bin/rman log=$LOGFILE <<eof

connect target /;

run {
allocate channel ch1 type  'sbt_tape'  parms="ENV=(NB_ORA_CLASS=wfd-oracle-djsol_1)" ;
allocate channel ch2 type  'sbt_tape'  parms="ENV=(NB_ORA_CLASS=wfd-oracle-djsol_1)" ;
allocate channel ch3 type  'sbt_tape'  parms="ENV=(NB_ORA_CLASS=wfd-oracle-djsol_1)" ;
allocate channel ch4 type  'sbt_tape'  parms="ENV=(NB_ORA_CLASS=wfd-oracle-djsol_1)" ;
backup incremental level 0 filesperset 5 database format 'rman_${ORACLE_SID}_${DATE}_%U_%t' plus archivelog;
backup current controlfile format 'rman_${ORACLE_SID}_cntlfile_${DATE}.cf' ;
release channel ch1;
release channel ch2;
release channel ch3;
release channel ch4;
}

eof
exit

#--------------------------------------------------------------------------------------
#-- File Name    : https://github.com/Zaalouni/OracleDba
#-- Author       : Zaalouni
#-- Description  : Oracle DB -    Full RMAN Incremental Backup to Tape 
#-- website      : http://www.aws-senior.com
#-- Github       : https://github.com/Zaalouni/OracleDba
#-- -----------------------------------------------------------------------------------
