#!/bin/bash
# run using #sh sciptname &
mkdir /home/ec2-user/script-log -p
cd /home/ec2-user/script-log

while true;
do
date >> cachelogs
free -m >> cachelogs
sync; echo 1 > /proc/sys/vm/drop_caches
echo "cache cleared at `date`" >>  cachelogs
echo "current status at `date`"   >>  cachelogs
free -m >> cachelogs
echo "" >>  cachelogs
echo "" >>  cachelogs
echo "" >>  cachelogs
sleep 3600


done