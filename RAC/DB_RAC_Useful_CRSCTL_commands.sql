--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -   Display Useful CRSCTL commands
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
CRSCTL Utility is used to managed oracle clusterware resources and components.

1. STOP & START CRS: ( run from root user)
 
$GRID_HOME/bin/crsctl stop crs
 
$GRID_HOME/bin/crsctl start crs
 

2. Enable/Disable auto restart of CRS.

 
$GRID_HOME/bin/crsctl disable crs
 
$GRID_HOME/bin/crsctl enable crs
 

3. Find the cluster name
 
$GRID_HOME/bin/cemutlo -n
 
or 
 
$GRID_HOME/bin/olsnodes -c


4. Find grid version:

SYNATX – $GRID_HOME/bin/crsctl query crs softwareversion <hostname)
 
$GRID_HOME/bin/crsctl query crs softwareversion host-dbaclass1
 

5. check cluster component status
 
 
$GRID_HOME/bin/crsctl stat res -t
 
$GRID_HOME/bin/crsctl check crs
 
$GRID_HOME/bin/crsctl check cssd
 
$GRID_HOME/bin/crsctl check crsd
 
$GRID_HOME/bin/crsctl check evmd
 

6. Find voting disk location

 
$GRID_HOME/bin/crsctl query css votedisk
 

7. Find OCR location:
 
$GRID_HOME/bin/ocrcheck
 

8. Find cluster interconnect details

 
$GRID_HOME/bin/oifcfg getif
 
app-ipmp0 172.21.39.128 global public
loypredbib0 172.16.3.192 global cluster_interconnect
loypredbib1 172.16.4.0 global cluster_interconnect
 
 
 
select NAME,IP_ADDRESS from v$cluster_interconnects;
 
NAME IP_ADDRESS
--------------- ----------------
loypredbib0 172.16.3.193
loypredbib1 172.16.4.1
 
 
 9. Check CRS status of local node 

 
crsctl check crs
 
CRS-4638: Oracle High Availability Services is online
CRS-4537: Cluster Ready Services is online
CRS-4529: Cluster Synchronization Services is online
CRS-4533: Event Manager is online
 

10. Check status of all crs resourcs
 
$GRID_HOME/bin/crsctl stat res -t
$GRID_HOME/bin/crsctl stat res -t -init
 

10. Check active version of cluster
crsctl query crs activeversion
Oracle Clusterware active version on the cluster is [12.1.0.2.0]


11. Stop and start high availability service ( HAS)
 
crsctl stop has
 
crsctl start has
 

12. Check CRS status of remote nodes
 
crsctl check cluster
 

13. Disk timeout from node to voting disk(disktimeout)

crsctl get css disktimeout
CRS-4678: Successful get disktimeout 200 for Cluster Synchronization Services.
 

14. Network latency in the node interconnect (Misscount)
crsctl get css misscount
CRS-4678: Successful get misscount 30 for Cluster Synchronization Services.
 
15. Move voting disk to another diskgroup:
 
crsctl replace votedisk +OCRVD
Successful addition of voting disk 2e4ded6cee504fc8bf078b080fb7be6f.
Successful addition of voting disk 8e87826024e24fffbf5add65c011fc66.
Successful addition of voting disk e1ba56dedff84fa8bf5605e0302fc81e.
Successful deletion of voting disk 2b7ce864c44d4fecbf60885a188290af.
Successfully replaced voting disk group with +OCRVD.
CRS-4266: Voting file(s) successfully replaced
 

16. Add another voting disk:
 
crsctl add css votedisk 
 

17. Delete voting disk:
crsctl delete css votedisk 

18 . Get ocr disk backup details
 ocrconfig -showbackup
 

19 . Check whether standard or flex ASM
crsctl get cluster mode status

Cluster is running in "standard" mode
 
 
 
 20 . Check CRS configuation
 
crsctl config crs 
 

21. crsctl has commands for standalone grid infrastrcuture 

crsctl check has
crsctl config has
crsctl disable has
crsctl enable has
crsctl query has releaseversion
crsctl query has softwareversion
crsctl start has
crsctl stop has

--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB - Display Useful CRSCTL commands
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------