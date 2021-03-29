DOCKER_IMAGES_TAG?=latest
DOCKER_REGISTRY_URL?=mischenkovn/devops-for-programmers-project-lvl1

test-web:
	docker-compose exec app bash -c 'for i in {1..9}; do sleep 1; curl localhost:8080 && exit 0; done; exit 1' | grep Framework 

push-release:
	docker tag ${DOCKER_REGISTRY_URL}:cashed ${DOCKER_REGISTRY_URL}:${DOCKER_IMAGES_TAG}

push-prod:
	docker push ${DOCKER_REGISTRY_URL}:${DOCKER_IMAGES_TAG} 

prod: build up test-web push-prod

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
