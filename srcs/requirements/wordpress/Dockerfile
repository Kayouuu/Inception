FROM debian:buster

EXPOSE 80

RUN apt-get update && apt-get php-fm
COPY conf/default.conf /etc/nginx/conf.d/default.conf