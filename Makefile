.PHONY: up-back up-for up-rebuild down stop start status images rmi rmc

up-back:
	@docker-compose -f ./srcs/docker-compose.yml up -d

up-for:
	@docker-compose -f ./srcs/docker-compose.yml up

up-rebuild:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

start:
	@docker-compose -f ./srcs/docker-compose.yml start

status:
	@docker ps

images:
	@docker images

rmi:
	@docker rmi -f $$(docker images -q)

rmc:
	@docker system prune -a
