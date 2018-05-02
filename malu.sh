#!/bin/bash
while :
do

var=`curl -Is https://palava.in/ | head -n 1 | cut -d' ' -f2 `
var2=`curl -Is https://casabylodha.com/ | head -n 1 | cut -d' ' -f2`

if [ $var -eq 503 ] || [ $var -eq 500 ] ; then

#cp /home/ec2-user/clean/cleanup /var/www/html/casabylodha.com/index.php
echo "It's working annnaa...!!"
elif [ $var2 -eq 503 ] || [ $var2 -eq 500 ] ; then
#cp /home/ec2-user/clean/cleanup /var/www/html/casabylodha.com/index.php
echo "It's working annnaa...!!"
 
fi

done 
