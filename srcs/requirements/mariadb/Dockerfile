FROM	debian:bookworm

RUN	apt update -y && apt upgrade -y && apt install -y mariadb-server gettext-base

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN 	mkdir ./entrypoint-initdb.d
COPY 	./tools/init.sql /entrypoint-initdb.d
RUN 	mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY 	./tools/entrypoint.sh ./
RUN 	chmod +x entrypoint.sh

EXPOSE	3306

ENTRYPOINT ["./entrypoint.sh"]
CMD ["mysqld"]
