FROM debian:buster

EXPOSE 80
RUN mkdir /var/www

RUN apt-get update -y && apt-get install -y php-cli php-mysql php-curl php-gd php-intl && \
	apt-get install -y php-fpm wget
RUN cd /var/www && wget http://fr.wordpress.org/latest-fr_FR.tar.gz && \
	tar -xzvf latest-fr_FR.tar.gz && rm latest-fr_FR.tar.gz
COPY conf/default.conf /etc/nginx/conf.d/default.conf

COPY ["./conf/start.sh", "./start.sh"]
RUN chmod +x start.sh
CMD ["./start.sh"]
