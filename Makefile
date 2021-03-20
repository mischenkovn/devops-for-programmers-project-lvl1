DOCKER_IMAGES_TAG?=latest
DOCKER_REGISTRY_URL?=mischenkovn/devops-for-programmers-project-lvl1

build-prod:
	docker build -t ${DOCKER_REGISTRY_URL}:${DOCKER_IMAGES_TAG} -f Dockerfile.production .

test-prod:
	docker rm -f test-prod  \
		&& docker run -e NODOS_HOST=0.0.0.0 --rm --detach --name test-prod ${DOCKER_REGISTRY_URL}:${DOCKER_IMAGES_TAG} \
		&& docker exec test-prod bash -c "for i in {1..9}; do sleep 1; curl localhost:8080 && exit 0; done; exit 1" \
		&& docker rm -f test-prod

push-prod:
	docker push ${DOCKER_REGISTRY_URL}:${DOCKER_IMAGES_TAG} 

prod: build-prod test-prod push-prod

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
