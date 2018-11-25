#!/bin/bash

source config.sh

#sudo ln -s /home/$user/redis-tools/redis-cli-auth.sh /usr/bin/redis-cli-auth
#now from anywhere you can use `redis-cli-auth`

redis-cli -a $pass
