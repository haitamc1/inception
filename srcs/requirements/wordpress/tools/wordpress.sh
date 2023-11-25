#!/bin/bash

sed -i		    's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf; 
# listen on a network socket instead of a Unix socket

service         php7.4-fpm start;

if [ ! -f "/var/www/html/wp-config.php" ];	then
    chmod -R	775 /var/www/html;
    chown -R	www-data /var/www/html;
    cd			/var/www/html
    wp			core download --allow-root
    cat			wp-config-sample.php > wp-config.php
    wp			config set DB_HOST mariadb --type=constant --allow-root
    wp          config set DB_NAME $DATABASE --path=/var/www/html --allow-root
    wp          config set DB_USER $USER --path=/var/www/html --allow-root
    wp          config set DB_PASSWORD $USER_PASS --path=/var/www/html --allow-root
    wp          core install --url=localhost --title="WP_TITLE" --admin_user=$ADMIN --admin_password=$ADMIN_PASS --admin_email="inceptions@42.com" --skip-email --allow-root
    wp			user create ${USER} inception@42.com --role=author --user_pass=${USER_PASS} --allow-root


fi

service php7.4-fpm stop;

php-fpm7.4 -F