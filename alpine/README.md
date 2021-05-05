## cojam/nginx-rtmp Docker


### Information
- Alpine Linux: nginx, nginx-mod-rtmp : 1.18.0-r13
    - [nginx-mod-rtmp](https://pkgs.alpinelinux.org/packages?name=nginx-mod-rtmp&branch=v3.13)
    - [nginx-mod-stream](https://pkgs.alpinelinux.org/packages?name=nginx-mod-stream&branch=v3.13)
    - [nginx-mod-http-echo](https://pkgs.alpinelinux.org/packages?name=nginx-mod-http-echo&branch=v3.13)
- [PingOS](https://pingos.io/)
    - [config](https://pingos.io/docs/en/config-common)
    - [pingostack](https://github.com/pingostack) - open source software for streaming media


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



