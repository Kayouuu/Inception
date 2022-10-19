FROM debian:buster
# Container will listen from port 3306
EXPOSE 3306

RUN apt-get update -y && apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld 

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/start.sh ./start.sh
RUN	 chmod +x start.sh

# RUN echo "CREATE DATABASE IF NOT EXISTS wordpress; \
# CREATE USER psaulnie@'%' IDENTIFIED BY 'inception'; \
# GRANT ALL ON wordpress.* TO psaulnie@'%'; \
# FLUSH PRIVILEGES; \
# ALTER USER 'root'@'localhost' IDENTIFIED BY 'inception';" > db.sql
ENTRYPOINT [ "./start.sh"]
# RUN service mysql start && mysql < db.sql

# CMD [ "/usr/bin/mysqld_safe" ]