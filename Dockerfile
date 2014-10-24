# sshd
#
# VERSION               0.0.3

FROM	ubuntu:12.04
MAINTAINER Vishanth Balasubramaniam "vishantb@wso2.com"

ENV DEBIAN_FRONTEND noninteractive

###########################################################
### updating the package with missing archives
###########################################################
RUN apt-get -y update --fix-missing

###########################################################
### ssh server and utils
###########################################################
RUN apt-get install -y openssh-server
RUN echo 'root:password' |chpasswd
RUN mkdir -p /var/run/sshd

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get install -y apt-utils g++ 
RUN apt-get install -y git curl build-essential make gcc wget

###########################################################
### Install Cassandra
### Download the latest apache mirror and Run
###########################################################

##### Mirror for Cassandra Binary 2.1.0
RUN cd /opt && wget http://supergsego.com/apache/cassandra/2.1.0/apache-cassandra-2.1.0-bin.tar.gz

RUN cd /opt && tar zxf apache-cassandra-*.tar.gz
RUN rm /opt/*.tar.gz
RUN mv /opt/apache-cassandra-* /opt/cassandra

##### To help in diagnosis
RUN apt-get install -y lsof

#####
ADD cassandra-configs/cassandra.yaml /opt/cassandra/conf/cassandra.yaml
ADD scripts/start.sh /opt/cassandra/bin/start.sh

RUN chmod +x /opt/cassandra/bin/start.sh
RUN chmod +x /opt/cassandra/bin/cassandra.in.sh

RUN mkdir /data
RUN mkdir /logs
RUN mkdir /init

VOLUME [ "/init" ]
VOLUME [ "/logs" ]
VOLUME [ "/data" ]

###########################################################
### Installing the prerequisite
###########################################################
RUN apt-get install -y apache2
RUN apt-get install -q -y zip unzip
RUN apt-get install -q -y telnet iputils-ping curl
RUN apt-get install -q -y curl facter nano vim


###########################################################
### Installing JDK and Apache Stratos Cartridge Agent
###########################################################
ADD packs/java/jdk1.7.0_60.tar.gz /opt/
RUN ln -s /opt/jdk1.7.0_60 /opt/java
ADD packs/agent/apache-stratos-cartridge-agent-4.0.0.tgz /mnt/

RUN echo "export JAVA_HOME=/opt/java" >> /root/.bashrc

RUN echo "export CASSANDRA_HOME=/opt/cassandra" >> /root/.bashrc
RUN echo "export PATH=$PATH:/opt/cassandra/bin:/opt/java/bin" >> /root/.bashrc

RUN echo "export CASSANDRA_CONF=/opt/cassandra/conf" >> /root/.bashrc
RUN echo "export CLASSPATH=/opt/cassandra/lib/*.jar" >> /root/.bashrc


###########################################################
### ActiveMQ
###########################################################
ADD packs/activemq/activemq-broker-5.10.0.jar /mnt/apache-stratos-cartridge-agent-4.0.0/lib/activemq-broker-5.10.0.jar
ADD packs/activemq/activemq-client-5.10.0.jar /mnt/apache-stratos-cartridge-agent-4.0.0/lib/activemq-client-5.10.0.jar
ADD packs/activemq/geronimo-j2ee-management_1.1_spec-1.0.1.jar /mnt/apache-stratos-cartridge-agent-4.0.0/lib/geronimo-j2ee-management_1.1_spec-1.0.1.jar
ADD packs/activemq/geronimo-jms_1.1_spec-1.1.1.jar /mnt/apache-stratos-cartridge-agent-4.0.0/lib/geronimo-jms_1.1_spec-1.1.1.jar
ADD packs/activemq/hawtbuf-1.10.jar /mnt/apache-stratos-cartridge-agent-4.0.0/lib/hawtbuf-1.10.jar

###########################################################
### Scripts
###########################################################
RUN mkdir /root/bin
ADD scripts/init.sh /root/bin/
RUN chmod +x /root/bin/init.sh
ADD scripts/stratos_sendinfo.rb /usr/lib/ruby/1.8/facter/
ADD scripts/metadata_svc_bugfix.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/metadata_svc_bugfix.sh
ADD scripts/run_scripts.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/run_scripts.sh
RUN chmod +x /opt/cassandra/bin/cassandra.in.sh

###########################################################
### Opening ports
###########################################################
EXPOSE 22
EXPOSE 80

##### Internode communication (not used if TLS enabled)
EXPOSE 7000
		
##### TLS Internode communication (used if TLS enabled)
EXPOSE 7001
	
##### JMX (was 8080 pre Cassandra 0.8.xx)
EXPOSE 7199
	
##### Thift client API
EXPOSE 9160	
	
##### CQL native transport port
EXPOSE 9042	

###########################################################
### Run 
###########################################################
ENTRYPOINT /usr/local/bin/run_scripts.sh | /usr/sbin/sshd -D
