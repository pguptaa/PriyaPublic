#mount device and setup postgresSQL
#make drive as root user
mkdir /data

chmod a+rwx /data

#setting up environment
wget https://s3.amazonaws.com/ucbdatasciencew205/setup_ucb_complete_plus_postgres.sh

chmod +x ./setup_ucb_complete_plus_postgres.sh

./setup_ucb_complete_plus_postgres.sh <the device path from step 2>

hdfs dfs -ls /user

hdfs dfs -put derby.log /user/w205

#mounting disk
fdisk -l

mount -t ext4 <device path>

/root/start-hadoop

/data/start_postgres.sh
