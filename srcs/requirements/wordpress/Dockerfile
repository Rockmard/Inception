FROM	debian:bookworm

EXPOSE	9000

RUN	apt update -y && apt upgrade -y && apt install -y wget php-fpm php-mysqli
RUN	mkdir -p /run/php && chown www-data:www-data /run/php

COPY	./conf/www.conf /etc/php/8.2/fpm/pool.d

RUN 	mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html
WORKDIR	/var/www/html
COPY	./tools/autoconf.sh .
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN	chmod +x wp-cli.phar autoconf.sh && chown www-data:www-data autoconf.sh wp-cli.phar

ENTRYPOINT ["./autoconf.sh"]

CMD ["php-fpm8.2", "-F"]
