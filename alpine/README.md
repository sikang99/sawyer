## cojam/sawyer Docker server


### Articles
- [Ubuntu使用Nginx和Nginx-http-flv-module来实现简单的直播服务](https://zhuanlan.zhihu.com/p/337903070)
- 2020/09/07 [How to make an RTMP Streaming Server and Player with a Raspberry Pi](https://aaronparecki.com/2020/09/07/7/raspberry-pi-streaming-server)
- 2020/05/07 [10,000 HLS/RTMP Live Video Streaming Servers With Docker + Nginx](https://devilslane.com/10000-hls-rtmp-live-video-streaming-servers-with-docker-nginx/)
- 2019/01/08 [Create your own video streaming server with Linux](https://opensource.com/article/19/1/basic-live-video-streaming-server)


### Information
- Alpine Linux: nginx, nginx-mod-rtmp : 1.18.0-r13
    - [nginx-mod-rtmp](https://pkgs.alpinelinux.org/packages?name=nginx-mod-rtmp&branch=v3.13)
    - [nginx-mod-stream](https://pkgs.alpinelinux.org/packages?name=nginx-mod-stream&branch=v3.13)
    - [nginx-mod-http-echo](https://pkgs.alpinelinux.org/packages?name=nginx-mod-http-echo&branch=v3.13)
- [PingOS](https://pingos.io/)
    - [config](https://pingos.io/docs/en/config-common)
    - [pingostack](https://github.com/pingostack) - open source software for streaming media
- [The Top 10 Nginx Rtmp Open Source Projects](https://awesomeopensource.com/projects/nginx-rtmp)
- [**170 Open Source Rtmp Software Projects**](https://opensourcelibs.com/libs/rtmp)


### Open Source
- [woonizzooni/nginx-media-server](https://github.com/woonizzooni/nginx-media-server)
- [MonaSolutions/MonaServer](https://github.com/MonaSolutions/MonaServer) - A lightweight RTMFP, RTMP, WebSocket and HTTP server!
- [jprjr/multistreamer](https://github.com/jprjr/multistreamer) - [discontinued] A webapp for publishing video to multiple streaming services at once.


### Slides
- 2016 [NGINX for Commercial Quality Streaming Services](https://www.nginx.com/wp-content/uploads/2018/12/NGINX-Conf-2018-slides_Choi-streaming.pdf)

### Books
- 2019 [NGINX Cookbook, 2019 Edition](https://www.nginx.com/resources/library/nginx-cookbook-2019-edition/)


### History
- 2021/05/05: Children's Day
    - enable HLS streaming in nginx.conf
    - not use sites-enabled directory in nginx(1.18) of alpine
    - start to build cojam/nginx-rtmp based on alpine 3.13
    - [RTMP Streaming Server](https://www.scaleway.com/en/docs/setup-rtmp-streaming-server/)



