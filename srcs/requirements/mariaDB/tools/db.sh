#!/bin/bash

service mariadb start

mysql -e "CREATE DATABASE IF NOT EXISTS ${DATABASE}; \
          CREATE USER IF NOT EXISTS '${USER}'@'%' IDENTIFIED BY '${USER_PASS}'; \
          GRANT ALL PRIVILEGES ON ${DATABASE}.* TO '${USER}'@'%'; \
          FLUSH PRIVILEGES;"

sleep 5
service mariadb stop

mysqld
