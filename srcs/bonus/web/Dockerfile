FROM debian:bullseye

RUN apt-get update && apt-get -y install python3

RUN mkdir -p /var/www/html/assets/

COPY ./src/index.html /var/www/html/

COPY ./tools/script.sh /

EXPOSE 8081

CMD ["/bin/bash", "script.sh"]