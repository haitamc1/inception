FROM debian:bullseye

RUN apt update && apt install -y php-common php-mysql php-cli libapache2-mod-php

COPY ./tools/adminer.php /var/www/html

CMD ["php", "-S","0.0.0.0:8080","-t","/var/www/html/","/var/www/html/adminer.php"]