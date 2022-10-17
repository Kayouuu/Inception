FROM debian:buster

EXPOSE 9000

RUN mkdir /var/www/
RUN mkdir -p /var/run/ && mkdir /run/php

RUN apt-get update -y && apt-get install -y php7.3 php-mysqli php-fpm wget

RUN cd /var/www/ && wget http://fr.wordpress.org/latest-fr_FR.tar.gz && \
	tar -xzvf latest-fr_FR.tar.gz && rm latest-fr_FR.tar.gz
RUN mv /var/www/wordpress/ /var/www/html

# Need to understand www.conf (Solve socker error)
COPY ./conf/wp-config.php /var/www/html/wp-config.php
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/start.sh ./start.sh
RUN chmod +x ./start.sh

CMD ["/usr/sbin/php-fpm7.3", "-F"]
