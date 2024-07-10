FROM debian:buster

EXPOSE 3306

RUN apt update
RUN apt upgrade -y
RUN apt-get install mariadb-server -y
RUN apt install vim -y 
RUN apt install curl -y 

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf


COPY conf/conf_mysql.sh	/etc/mysql/conf_mysql.sh
COPY .env /

RUN sh /etc/mysql/conf_mysql.sh

CMD /usr/bin/mysqld_safe

