#!/bin/sh
t=`sensors |grep Package|awk '{print $4}'| cut -b 2,3`

if [ "$t" -gt "90" ];then
  echo 'temperature warning...'
  ./msg.sh
fi
