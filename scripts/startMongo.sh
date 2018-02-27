#!/bin/bash

echo Starting mongo servers

mongod --config /etc/mongo-replica.conf --bind_ip 0.0.0.0 --dbpath /data/db1 &
P1=$!
mongod --config /etc/mongo-replica.conf --bind_ip 0.0.0.0 --dbpath /data/db2 --port 27018 &
P2=$!
mongod --config /etc/mongo-replica.conf --bind_ip 0.0.0.0 --dbpath /data/db3 --port 27019 &
P3=$!

sleep 1
/usr/local/bin/initMongoReplica.sh

wait $P1 $P2 $P3

