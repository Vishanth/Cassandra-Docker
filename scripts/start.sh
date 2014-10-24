#!/bin/bash

/opt/cassandra/bin/cassandra -f >> /tmp/cassandra_start.log 2>&1 

#export JAVA_HOME=/opt/java
#export CASSANDRA_HOME=/opt/cassandra
#export PATH=$PATH:/opt/cassandra/bin:/opt/java/bin
#export CASSANDRA_CONF=/opt/cassandra/conf
#export CLASSPATH=/opt/cassandra/lib/*.jar


#echo "Cassandra node configuration:"
#echo "CASS_SEED " $CASS_SEEDS
#echo "CASS_TOKEN " $CASS_TOKEN
#echo "CASS_LOCAL_IP " $CASS_LOCAL_IP

#HOST=`localhost`
#echo "127.0.0.1 localhost.localdomain localhost instance-00000001" >> /etc/hosts

#echo "127.0.0.1 localhost" >> /etc/hosts


#HOST='hostname'
#echo "127.0.0.1 $HOST" >> /etc/hosts


#HOST=$(hostname)

#echo "127.0.0.1 localhost.localdomain $HOST" >> /etc/hosts


#echo "hostname - $HOST"

#hn = 'hostname'
#echo $HOST >> /tmp/hostname.log
#ping -c 20 $hn >> /tmp/hostname.log



#while ! ping -c1 $(hostname) &>>/tmp/hostname.log; do echo "IP is not UP" >> /tmp/hostname.log  ; sleep 5  ; done


#ping $(hostname) >> /tmp/hostname.log 2>&1 

#echo "127.0.0.1 localhost.localdomain localhost " >> /etc/hosts

#echo "HOSTS"
#cat /etc/hosts >> /tmp/cassandra_start.log

#echo "JAVA HOME - " $JAVA_HOME >> /tmp/cassandra_start.log
#echo "PATH - " $PATH >> /tmp/cassandra_start.log
#echo "CASS HOME - " $CASSANDRA_HOME >> /tmp/cassandra_start.log
#echo "CASS CONF - " $CASSANDRA_CONF >> /tmp/cassandra_start.log
#echo "CLASSPATH - " $CLASSPATH >> /tmp/cassandra_start.log
#echo "USER - " $USER >> /tmp/cassandra_start.log



#echo "127.0.0.1 localhost.localdomain localhost instance-00000001" >> /etc/hosts

#cat /etc/hosts >> /tmp/cassandra_start.log

#echo "START SH ok" >> /tmp/cassandra_start.log 

