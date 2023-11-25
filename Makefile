all: up

up:
	@mkdir -p /Users/hchahid/Desktop/data/vol_wordpress  \
		/Users/hchahid/Desktop/data/vol_mariadb
	@docker-compose -f ./srcs/docker-compose.yml up -d
down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean: down
	@docker-compose -f ./srcs/docker-compose.yml down -v
	@docker system prune -af


fclean:	clean
	@rm -rf /Users/hchahid/Desktop/data

.PHONY: all clean fclean re up down