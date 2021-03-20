server:
	npx nodos server

test:
	npm -s test

up:
	docker-compose up -d

ps:
	docker-compose ps 

build:
	docker-compose build

logs:
	docker-compose logs -f

down:
	docker-compose down || true

stop:
	docker-compose stop || true

restart:
	docker-compose restart

setup: compose-down compose-build
