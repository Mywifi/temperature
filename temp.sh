#!/bin/sh

key=`cat ./key`
machine=`hostname`

while sleep 60
do
  date
  t=`sensors |grep Package|awk '{print $4}'| cut -b 2,3`
  echo 'current temperature is: '$t'°C'
  if [ "$t" -gt "96" ];then
    echo 'temperature warning...'
    txt="$machine temperature too high $t"
    curl "https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=$key" \
     -H 'Content-Type: application/json' \
     -d "
     {
       \"msgtype\": \"text\",
       \"text\": {
           \"content\": \"$txt\"
       }
     }"
     sleep 3600
  else
    echo 'cool'
  fi
done
