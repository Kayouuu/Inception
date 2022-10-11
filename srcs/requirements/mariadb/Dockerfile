FROM debian:buster
# Container will listen from port 3306
EXPOSE 3306

RUN apt-get update -y && apt-get install -y mariadb-server

RUN sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN mkdir /mysql_scripts
COPY conf/db_config.sql /mysql_scripts/
# RUN /etc/init.d/mariadb start && mysql -uroot --password="" -e "source /mysql_scripts/db_config.sql"
# CMD /etc/init.d/mariadb start && tail -f /dev/null
RUN service mysql start
CMD ["mysqld"]