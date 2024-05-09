
all:
	if ! grep -q "arybushk.42.fr" /etc/hosts; then \
		echo "127.0.0.1 arybushk.42.fr" >> /etc/hosts; \
	fi
	if ! grep -q "www.arybushk.42.fr" /etc/hosts; then \
		echo "127.0.0.1 www.arybushk.42.fr" >> /etc/hosts; \
	fi
	mkdir -p /home/arybushk/data/mariadb-data
	mkdir -p /home/arybushk/data/wordpress-data
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up -d
	
clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all -v

fclean: clean
	rm -rf /home/arybushk/data/mariadb-data
	rm -rf /home/arybushk/data/wordpress-data
	docker system prune -f

re: fclean all

up:
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

.PHONY: all clean fclean re up down