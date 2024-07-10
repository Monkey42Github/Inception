all:
	@cp scrs/.env scrs/requirements/mariadb/
	@docker compose -f ./scrs/docker-compose.yml up -d --build
	@rm scrs/requirements/mariadb/.env
	@if ! grep -q "^127.0.0.1[[:space:]]pschemit\.42\.fr" /etc/hosts; then \
        echo "127.0.0.1	pschemit.42.fr" | sudo tee -a /etc/hosts; \
	fi

re:
	@make down
	@make clean
	@make

down:
	@docker compose -f ./scrs/docker-compose.yml down

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\

fclean:
	rm -rf /home/pschemit/data/wordpress/*
	rm -rf /home/pschemit/data/mariadb/*

.PHONY: all re down clean fclean