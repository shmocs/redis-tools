1. Install pre-requisities

  `sudo apt-get install build-essential tcl`

2. Install Redis

  ```
  cd /tmp
  curl -O http://download.redis.io/redis-stable.tar.gz
  tar xzvf redis-stable.tar.gz
  cd redis-stable
  make
  make test
  sudo make install
  ```
  
3. Configure Redis

  ```
  sudo mkdir /etc/redis
  sudo cp /tmp/redis-stable/redis.conf /etc/redis
  sudo nano /etc/redis/redis.conf
  ```
  
  In the file, change the `supervised` directive's value to `systemd`.
  
  ```
  ...
  supervised systemd
  ...
  ```
  
  Next, specify the working directory for Redis. This  is the directory that Redis will use to dump persistent data. We can use `/var/lib/redis`
  
  ```
  ...
  dir /var/lib/redis
  ...
  ```
  
  Save and close the file.
  
4. Configure systemd to start Redis on boot

  `sudo vi /etc/systemd/system/redis.service`
  ```
  [Unit]	
	Description=Redis In-Memory Data Store
	After=network.target
	
	[Service]
	User=redis
	Group=redis
	ExecStart=/usr/local/bin/redis-server /etc/redis/redis.conf
	ExecStop=/usr/local/bin/redis-cli shutdown
	Restart=always
	
	[Install]
	WantedBy=multi-user.target
  ```
5. Create Redis user, group and directories

  ```
  sudo adduser --system --group --no-create-home redis
  sudo mkdir /var/lib/redis
  sudo chown redis:redis /var/lib/redis
  sudo chmod 770 /var/lib/redis
  ```

6. Start the Redis service and set Redis to start on boot

  ```
  sudo systemctl start redis
  sudo systemctl enable redis
  ```
 
