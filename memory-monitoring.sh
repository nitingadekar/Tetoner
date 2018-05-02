
#!/bin/bash

sudo yum install perl-Switch perl-DateTime perl-Sys-Syslog perl-LWP-Protocol-https -y
mkdir -p /home/ec2-user/aws-scripts-mon
cd /home/ec2-user/aws-scripts-mon
curl http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip -O
unzip CloudWatchMonitoringScripts-1.2.1.zip
rm CloudWatchMonitoringScripts-1.2.1.zip
cd aws-scripts-mon
echo "*/5 * * * * /home/ec2-user/aws-scripts-mon/aws-scripts-mon/mon-put-instance-data.pl --mem-util --mem-used --mem-avail --disk-space-util --disk-path=/ --from-cron" >> /var/spool/cron/root
crontab -l
echo "Wailt for 3 minutes...... "
sleep 180
./mon-get-instance-stats.pl --recent-hours=12
sleep 10
./mon-put-instance-data.pl --mem-util --mem-used --mem-avail --aggregated=only
