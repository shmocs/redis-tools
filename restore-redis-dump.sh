#!/bin/bash

source config.sh

sudo service redis stop
sudo cp /home/$user/redis-bkp/dump.rdb /var/lib/redis/
sudo chown redis.redis /var/lib/redis/dump.rdb
sudo chmod 644 /var/lib/redis/dump.rdb
sudo service redis start
