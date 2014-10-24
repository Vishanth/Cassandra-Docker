#!/bin/bash

hn=$(hostname)


echo "hostname - $hn"

#hn = 'hostname'
#echo $hn >> /tmp/hostname.log
#ping -c 20 $hn >> /tmp/hostname.log
#ping -c 20 hhhhhhh >> /tmp/hostname.log

while ! ping -c1 hhhhh &>>/tmp/looptest.log; do echo "IP is not UP" >> /tmp/loopset.log  ; sleep 10  ; done
