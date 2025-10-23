#!/bin/bash

if [ -f /entrypoint-initdb.d/init.sql ]; then
  envsubst < /entrypoint-initdb.d/init.sql > /etc/mysql/init.sql
  rm /entrypoint-initdb.d/init.sql
fi

exec mysqld
