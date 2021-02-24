FROM debian:buster
RUN apt-get update 
RUN apt-get install -y nginx 
RUN apt-get install -y mariadb-server 
RUN apt-get install -y php7.3-fpm 
RUN apt-get install -y php-mysql
RUN apt-get install openssl 
RUN apt-get install -y wget
COPY ./src/mystart.sh ./src/mystart.sh
COPY ./src/default_on ./src/default_on
COPY ./src/default_off ./src/default_off
COPY ./src/wp-config.php ./src/wp-config.php
COPY ./src/autoindex_off.sh ./src/autoindex_off.sh
COPY ./src/autoindex_on.sh ./src/autoindex_on.sh
COPY ./src/init.sql ./src/init.sql
CMD chmod 755 ./src/mystart.sh
CMD bash /src/mystart.sh && tail -f /dev/null