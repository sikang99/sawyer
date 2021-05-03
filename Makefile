#
# Makefile for gortmp (RTMP, HLS)
#
ORG=cojam
NAME=sawyer
BASE=$(ORG)/$(NAME)
VERSION=1.0.0
BUILD=$(VERSION).1
DIST=alpine-3.13
IMAGE=$(BASE):$(BUILD)-$(DIST)
PORT=1935
#----------------------------------------------------------------------------------
usage:
	@echo "usage: make [local|remote|docker|compose|git] for $(NAME)"
#----------------------------------------------------------------------------------
local l:
	@echo "> make (local) [build|run|kill|cast|play]"

local-build lb:
	go build -o $(NAME)

local-run lr:
	./$(NAME) &
local-kill lk:
	pkill ffmpeg ffplay $(NAME)

local-clean:
	rm -f $(NAME)

local-cast lc:
	ffmpeg -re -stream_loop -1 -i data/iceage3-tlrd_h480p.mov -c copy -f flv rtmp://localhost/iceage
local-play lp:
	ffplay rtmp://localhost/iceage

lc2:
	ffmpeg -re -i data/Jellyfish_720_10s_30MB.webm -c:a aac -c:v h264 -f flv rtmp://localhost:$(PORT)/jellyfish
lp2:
	ffplay rtmp://localhost:$(PORT)/jellyfish -fflags nobuffer

#---------------------------------------------------------------------------------
remote r:
	@echo "> make (remote) [cast|play]"

remote-cast rc:
	ffmpeg -re -stream_loop -1 -i data/iceage3-tlrd_h480p.mov -c copy -f flv rtmp://cobot.center/iceage
remote-play rp:
	ffplay rtmp://cobot.center/iceage

rcf2:
	ffmpeg -re -i data/demo.flv -c:a aac -c:v h264 -f flv rtmp://cobot.center:$(PORT)/japan
rpf2:
	ffplay rtmp://cobot.center:$(PORT)/japan
rpv2:
	vlc rtmp://cobot.center:$(PORT)/japan

#---------------------------------------------------------------------------------
xr:
	docker run -d -p 1935:1935 -p 8080:8080 --name xxx polinux/rtmp-hls
xk:
	docker stop xxx && docker rm xxx
xc:
	ffmpeg -re -stream_loop -1 -i data/iceage3-tlrd_h480p.mov -c copy -f flv rtmp://localhost/live/iceage
xp:
	ffplay rtmp://localhost:1935/live/iceage
xv:
	vlc rtmp://localhost:1935/live/iceage
xh:
	http://localhost:8080/player/?iceage
#---------------------------------------------------------------------------------
build-run br:
	-@make lk
	-@make lb
	-@make lr

all-kill ak:
	-@make lk
	-@make dk
	-@make ck

#---------------------------------------------------------------------------------
docker d:
	@echo "> make (docker) [build|run|kill|ps] for $(IMAGE)"

docker-build db:
	docker build -t $(IMAGE) .

docker-run dr:
	docker run -d \
   		-p 1935:1935 \
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
#---------------------------------------------------------------------------------
compose c:
	@echo "> make (compose) [run|kill|ps] with $(COMPOSE)"

compose-run cr:
	docker-compose up -d

compose-kill ck:
	docker-compose down

compose-exec ce:
	docker-compose exec spider spider -rtype=monitor

compose-ps cp:
	docker-compose ps

compose-logs cl:
	docker-compose logs -f
#---------------------------------------------------------------------------------
git g:
	@echo "> make (git:g) [update|store]"

git-pdate gu:
	git add .
	git commit -a -m "$(BUILD),$(USER)"
	git push

git-store gs:
	git config credential.helper store
#---------------------------------------------------------------------------------

