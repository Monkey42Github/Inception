FROM debian:buster

RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    gnupg \
    apt-transport-https \
    lsb-release \
    ca-certificates

RUN apt-get install -y php7.3\
						php-fpm\
						php-mysql\
						mariadb-client

#wordpress
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN        chown -R root:root /var/www/wordpress

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY conf/auto_config.sh /var/www/wordpress/auto_config.sh

EXPOSE 9000

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN ls /var/www/wordpress/
WORKDIR /var/www/wordpress/
RUN chmod +x /var/www/wordpress/auto_config.sh

RUN mkdir /run/php

ENTRYPOINT ["/var/www/wordpress/auto_config.sh"]