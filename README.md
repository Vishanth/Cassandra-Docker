Cassandra-Docker
================

Docker Cassandra Cartridge

What is Apache Cassandra?
Apache Cassandra is a massively scalable open source NoSQL database. Cassandra is perfect for managing large amounts of structured, semi-structured, and unstructured data across multiple data centers and the cloud. Cassandra delivers continuous availability, linear scalability, and operational simplicity across many commodity servers with no single point of failure, along with a powerful dynamic data model designed for maximum flexibility and fast response times. [1]

Cassandra's data model offers the convenience of column indexes with the performance of log-structured updates, strong support for denormalization and materialized views, and powerful built-in caching [2]. 


Why Cassandra?
Opensource
Fully distributed, No Single Point of Failure (SPOF)
Linearly scalable
Larger-than-memory dataset
Best-in-class performance
Fully durable
Tunable consistency


How does Cassandra work?
Cassandra sports a “masterless” architecture meaning all nodes are the same. Cassandra provides automatic data distribution across all nodes that participate in a “ring” or database cluster. There is nothing programmatic that a developer or administrator needs to do or code to distribute data across a cluster because data is transparently partitioned across all nodes in a cluster.
Cassandra also provides built-in and customizable replication, which stores redundant copies of data across nodes that participate in a Cassandra ring. This means that if any node in a cluster goes down, one or more copies of that node’s data is available on other machines in the cluster. Replication can be configured to work across one data center, many data centers, and multiple cloud availability zones. [1]



Source

[1] Datastax Getting Started Cassandra - http://www.datastax.com/documentation/getting_started/doc/getting_started/gettingStartedCassandraIntro.html 

[2] Apache Cassandra - http://cassandra.apache.org
