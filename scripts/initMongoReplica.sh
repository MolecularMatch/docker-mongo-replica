#!/bin/bash

echo SETUP.sh time now: `date +"%T" `
mongo --host localhost:27017 <<EOF
   var cfg = {
        "_id": "mongoSet",
        "version": 1,
        "members": [
            {
                "_id": 0,
"arbiterOnly" : false,
                "host": "localhost:27017",
                "priority": 2
            },
            {
                "_id": 1,
"arbiterOnly" : false,
                "host": "localhost:27018",
                "priority": 0
            },
            {
                "_id": 2,
"arbiterOnly" : false,
                "host": "localhost:27019",
                "priority": 0
            }
        ]
    };
    rs.initiate(cfg);
    rs.reconfig(cfg);
    db.getMongo().setReadPref('primary');
    rs.status();
EOF
