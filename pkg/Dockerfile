FROM alpine:3.13
LABEL MAINTAINER "Stoney Kang <sikang99@gmail.com>"
##==========================================================================
RUN apk update && apk add ca-certificates
##--------------------------------------------------------------------------
RUN apk add --no-cache \
    nginx nginx-mod-rtmp ffmpeg bash
#   nginx-mod-stream nginx-mod-http-echo
RUN rm -rf /var/cache/apk/*
##--------------------------------------------------------------------------
RUN mkdir -p /var/run/nginx
RUN mkdir -p /var/www/record
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY conf/stat.xsl /etc/nginx/stat.xsl
##--------------------------------------------------------------------------
#COPY cert/ /etc/ssl/cert/
#RUN mkdir -p /etc/nginx/sites-enabled/
#COPY conf/sites-enabled.default /etc/nginx/sites-enabled/default
##--------------------------------------------------------------------------
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
##--------------------------------------------------------------------------
ENTRYPOINT ["/entrypoint.sh"]
##--------------------------------------------------------------------------
