#!/bin/bash
 
export $(cat /.env | xargs)

service mysql start >> /sql.log 2>&1
sleep 1
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;" >> /sql.log  2>&1
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';" >> /sql.log  2>&1
sleep 2
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" >> /sql.log 2>&1
sleep 2
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" >> /sql.log 2>&1
sleep 2
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;" >> /sql.log 2>&1

rm /.env