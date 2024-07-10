#!/bin/sh

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then

wp config create --allow-root \
  --dbname=${MYSQL_DATABASE} \
  --dbuser=${MYSQL_USER} \
  --dbpass=${MYSQL_PASSWORD} \
  --dbhost=mariadb \
  --path='.'

wp core install --allow-root \
  --url="pschemit.42.fr" \
  --title="ma page web" \
  --admin_user=${admin_user} \
  --admin_password=${admin_password} \
  --admin_email=${admin_email} \
  --path='.'

wp user create --allow-root \
  --role=author \
  ${user1} \
  ${email_user1} \
  --user_pass=${user_pass} \
  --path='.'


fi

/usr/sbin/php-fpm7.3 -F