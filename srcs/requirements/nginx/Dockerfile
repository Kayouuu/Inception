FROM debian:buster

RUN apt-get update && apt-get install nginx 
RUN ssl_protocols TLSv1.2 TLSv1.3 && systemctl reload nginx.service
RUN mkdir /run/nginx

RUN nginx
