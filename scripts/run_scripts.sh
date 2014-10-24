#!/bin/bash

source /root/.bashrc 

/usr/local/bin/metadata_svc_bugfix.sh 
#echo "metadata_svc_bugfix completed" >> /tmp/test.log 2>&1 

#/etc/init.d/apache2 start > /tmp/apache_start.log 2>&1 
#echo "apache2 completed" >> /tmp/test.log

/root/bin/init.sh > /tmp/init.log &
#echo "init log completed" >> /tmp/test.log


/opt/cassandra/bin/start.sh > /tmp/cassandra_start.log &




