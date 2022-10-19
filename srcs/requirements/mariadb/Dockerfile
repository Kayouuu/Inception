FROM debian:buster

EXPOSE 3306

RUN apt-get update -y && apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld 

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/start.sh ./start.sh
RUN	 chmod +x start.sh

ENTRYPOINT [ "./start.sh"]