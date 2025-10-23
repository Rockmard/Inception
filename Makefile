LOGIN = tpipi

all: up

up:
        @mkdir -p /home/$(LOGIN)/data
        @mkdir -p /home/$(LOGIN)/data/mariadb
        @mkdir -p /home/$(LOGIN)/data/wordpress
        @docker compose -f ./srcs/docker-compose.yml up -d

down:
        @docker compose -f ./srcs/docker-compose.yml down

clean: down
	@docker system prune -af

fclean: clean
        @rm -rf /home/$(LOGIN)/data

re: fclean all

.PHONY:
        all up down clean fclean re
