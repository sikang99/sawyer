#
# Makefile for Sawyer (node)
#
ORG=cojam
NAME=sawyer-node
VERSION=2.1.4
BASE=$(ORG)/$(NAME)
DIST=alpine-3.13
BUILD=$(VERSION).2
IMAGE=$(BASE):$(BUILD)-$(DIST)
.PHONY: usage build bak
#-----------------------------------------------------------------------
usage:
	@echo "usage: make (docker) for $(IMAGE)"

edit e:
	vi config.json

bak:
	cp Dockerfile bak/Dockerfile.$(BUILD)-$(DIST)

clean:
	rm -f log/*
#-----------------------------------------------------------------------
obscast-ffplay of:
	ffplay rtmp://localhost/live/obscast
obscast-vlc ov:
	vlc rtmp://localhost/live/obscast\?pwd=teamgrit8266
obscast-hls oh:
	open http://localhost:8080/live/obscast/index.m3u8
obscast-dash od:
	open http://localhost:8080/live/obscast/index.mpd

local l:
	@echo "> make (local) [cast|play|vlc|hls|stat]"

local-cast lc:
	ffmpeg -re -stream_loop -1 -i ../data/japan.flv -c copy -f flv rtmp://localhost/live/japan
local-play lp:
	ffplay rtmp://localhost/live/japan
local-vlc lv:
	vlc rtmp://localhost/live/japan
local-hls lh:
	open http://localhost:8080/live/japan/index.m3u8
local-stat ls:
	open http://localhost:8080/admin

remote r:
	@echo "> make (remote) [cast|play|vlc|hls|stat]"
remote-cast rc:
	ffmpeg -re -stream_loop -1 -i ../data/japan.flv -c copy -f flv rtmp://cobot.center/live/japan
remote-play rp:
	ffplay rtmp://cobot.center/live/japan
remote-vlc rv:
	vlc rtmp://cobot.center/live/japan
remote-hls rh:
	open http://cobot.center:8080/live/japan/index.m3u8
remote-stat rs:
	open http://cobot.center:8080/admin
#-----------------------------------------------------------------------
docker d:
	@echo "> make (docker) [run|kill|exec|ps|upload|download for $(IMAGE)"

docker-build db:
	docker build -t $(IMAGE) .

docker-run dr:
	docker run -d \
		-p 8080:8080 -p 1935:1935 \
		-v $(PWD)/config.json:/usr/src/app/config.json \
		-v $(PWD)/media:/usr/src/app/media \
		--name $(NAME) $(IMAGE)

docker-run-base drb:
	docker run -d \
		-p 8080:8080 -p 1935:1935 \
		--name $(NAME) $(IMAGE)

docker-restart-exec drx:
	-make docker-kill
	-make docker-clean
	-make docker-run
	-make docker-exec

docker-exec dx:
	docker exec -it $(NAME) /bin/sh

docker-kill dk:
	docker stop $(NAME) && docker rm $(NAME)

docker-logs dl:
	docker logs -f $(NAME)

docker-clean dc:
	docker system prune -f
	docker images

docker-ps dp:
	docker ps -a

docker-images di:
	docker images $(BASE)

docker-upload du:
	docker push $(IMAGE)

docker-download dd:
	docker pull $(IMAGE)
# -----------------------------------------------------------------------
compose c:
	@echo "> make (compose) [up|down|ps]"

compose-up cu cr:
	docker-compose up -d
	docker-compose ps

compose-down cd ck:
	docker-compose down
	docker-compose ps

compose-logs cl:
	docker-compose logs -f

compose-ps cp:
	docker-compose ps
#-----------------------------------------------------------------------
cert-install:
	sudo apt-get install -y certbot

cert-gen:
	sudo certbot certonly --standalone

cert-copy cc:
	@echo "> make (cert-copy) [local|public]"

cert-copy-local ccl:
	mkcert -install
	mkcert localhost 127.0.0.1
	mv localhost+1.pem cert/cert.pem
	mv localhost+1-key.pem cert/key.pem

cert-copy-public ccp:
	sudo cp /etc/letsencrypt/live/janus.cojam.shop/cert.pem cert/cert.pem
	sudo cp /etc/letsencrypt/live/janus.cojam.shop/privkey.pem cert/key.pem
#----------------------------------------------------------------------
git-update gu:
	cd ..; make gu
#----------------------------------------------------------------------

