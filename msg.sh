#!/bin/sh
$key=`cat ./key`
$txt=`cat ./msg.txt`
curl 'https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=$key' \
   -H 'Content-Type: application/json' \
   -d '
   {
     "msgtype": "text",
     "text": {
         "content": "$txt"
     }
   }'
