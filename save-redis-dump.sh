#!/bin/bash

source config.sh

echo save | redis-cli

mkdir -p /home/$user/redis-bkp
tar czvf /home/$user/redis-bkp/dump.tgz -C /var/lib/redis dump.rdb
