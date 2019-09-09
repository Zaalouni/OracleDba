--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -   Install NMON - CentOS 7 64bit 
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------



# Get Root
sudo su

 
# Download NMON archive

cd /tmp

wget http://sourceforge.net/projects/nmon/files/nmon16e_mpginc.tar.gz

# Untar archive
tar -xzvf nmon16e_mpginc.tar.gz
 
# Copy nmon file
cp nmon_x86_64_centos7 /usr/local/bin/
chmod a+x /usr/local/bin/nmon_x86_64_centos7 
 
# Create symbolic link
ln -s /usr/local/bin/nmon_x86_64_centos7 /usr/local/bin/nmon

# tidy up tmp
rm -f nmon_*







--------------------------------------------------------------------------------------
-- File Name    : https://github.com/Zaalouni/OracleDba
-- Author       : Zaalouni
-- Description  : Oracle DB -   Install NMON - CentOS 7 64bit 
-- website      : http://www.aws-senior.com
-- Github       : https://github.com/Zaalouni/OracleDba
-- -----------------------------------------------------------------------------------
