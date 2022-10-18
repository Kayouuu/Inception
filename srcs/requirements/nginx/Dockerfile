FROM debian:buster

# Remove debconf error
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y nginx openssl

# Need to understand certificate creation + certificate creation in nginx.conf
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 \
	-nodes -out /etc/nginx/ssl/psaulnie.crt \
	-keyout /etc/nginx/ssl/psaulnie.key \
	-subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=psaulnie/CN=psaulnie.42.fr"

# COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf
COPY ./conf/default /etc/nginx/sites-enabled/default
# Need to make it working (psaulnie.42.fr.conf.)
# COPY ./conf/nginx.conf /etc/nginx/sites-available/psaulnie.42.fr.conf
# RUN ln -s /etc/nginx/sites-available/psaulnie.42.fr.conf /etc/nginx/sites-enabled/psaulnie.42.fr.conf

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
