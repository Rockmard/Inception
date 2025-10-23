#!/bin/bash

service mariadb start

if ! mysql -u root -p${DB_ROOTPWD} -e "SHOW DATABASES LIKE '${DB_NAME}'" | grep -q "${DB_NAME}"; then
    mysql -u root -p${DB_ROOTPWD} -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
    mysql -u root -p${DB_ROOTPWD} -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_UPWD}';"
    mysql -u root -p${DB_ROOTPWD} -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';"
    mysql -u root -p${DB_ROOTPWD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOTPWD}';"
    mysql -u root -p${DB_ROOTPWD} -e "FLUSH PRIVILEGES;"
fi

mysqladmin -u root -p${DB_ROOTPWD} shutdown

exec "$@"
