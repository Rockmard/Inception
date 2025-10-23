FROM	debian:bookworm

RUN	apt update -y && apt upgrade -y && apt install -y nginx openssl
RUN	mkdir -p /etc/nginx/ssl
RUN	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=NA/L=Angouleme/0=42/OU=42/CN=tpipi.42.fr/UID=tpipi"

RUN	mkdir -p /var/run/nginx

COPY	./conf/nginx.conf /etc/nginx/conf.d

EXPOSE	443

CMD	["nginx", "-g", "daemon off;"]

