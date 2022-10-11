FROM debian:buster

EXPOSE 443
RUN apt-get update -y && apt-get install nginx -y
# RUN ssl_protocols TLSv1.2 TLSv1.3 && systemctl reload nginx.service
RUN mkdir /run/nginx

COPY ["./conf/start.sh", "./start.sh"]
RUN chmod +x start.sh
CMD ["./start.sh"]
