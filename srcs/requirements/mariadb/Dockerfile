FROM	debian:bookworm

RUN	apt update -y && apt upgrade -y && apt install -y mariadb-server

COPY	./tools/init.sql /etc/mysql/init.sql
RUN	chown mysql:mysql /etc/mysql/init.sql && chmod 644 /etc/mysql/init.sql
RUN	mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY	./tools/entrypoint.sh ./
RUN	chmod +x ./entrypoint.sh

EXPOSE	3306

ENTRYPOINT ["./entrypoint.sh"]
CMD ["mysqld", "--user=mysql"]
