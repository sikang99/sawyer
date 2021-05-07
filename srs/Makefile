#
# Makefile for srs
#
NAME=srs
#IMAGE=ossrs/srs:3
IMAGE=ossrs/srs:v4.0.99
#----------------------------------------------------------------------------------
usage:
	@echo "usage: make [docker] for $(NAME)"
#----------------------------------------------------------------------------------
docker d:
	@echo "> make (docker) [build|run|kill|ps] for $(IMAGE)"

docker-build db:
	docker build -t $(IMAGE) .

docker-run dr:
	docker run -d \
   		-p 1935:1935 \
   		-p 1985:1985 \
   		-p 8080:8080 \
   		--name $(NAME) $(IMAGE)

docker-kill dk:
	docker stop $(NAME) && docker rm $(NAME)

docker-exec dx:
	docker exec -it $(NAME) /bin/bash

docker-test dt:
	docker inspect --format "{{json .State.Health }}" $(IMAGE) | jq

docker-logs dl:
	docker logs $(NAME) -f

docker-ps dp:
	docker ps -a

docker-image di:
	docker images $(BASE)

docker-security ds:
	docker scan $(IMAGE)

docker-download dd:
	docker push $(IMAGE)

docker-upload du:
	docker push $(IMAGE)

docker-build-push dbu:
	docker build -t $(IMAGE) .
	docker push $(IMAGE)

docker-clean dc:
	docker system prune -f
	docker network prune -f
	docker volume prune -f
	docker images
#---------------------------------------------------------------------------------
git-update gu:
	cd ..; make gu
#---------------------------------------------------------------------------------
