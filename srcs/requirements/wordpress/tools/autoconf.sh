#!/bin/bash

./wp-cli.phar core download --path=/var/www/html --allow-root

./wp-cli.phar config create \
--dbname="$DB_NAME" \
--dbuser="$DB_USER" \
--dbpass="$DB_UPWD" \
--dbhost="mariadb:3306" \
--allow-root

./wp-cli.phar core install \
--url="https://${DOMAIN_NAME}" \
--title="Inception" \
--admin_user="$WP_USER2" \
--admin_password="$WP_U2PWD" \
--admin_email="$WP_U2MAIL" \
--allow-root

./wp-cli.phar user create \
"$WP_USER1" \
"$WP_U1MAIL" \
--user_pass="$WP_U1PWD" \
--role=author \
--allow-root

exec "$@"
