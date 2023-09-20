# docker-sing-box

基于[sing-box](https://github.com/SagerNet/sing-box)的releases发布的docker镜像

Dockerfile请查看 https://raw.githubusercontent.com/Jiraiya8/docker-sing-box/main/Dockerfile

## 使用方法
Docker
```shell
docker run -d -p 2080:2080 -v /etc/sing-box/config.json:/etc/sing-box/config.json liyuanbiao/sing-box:latest run -c /etc/sing-box/config.json
```

Docker Compose (推荐)
```shell
mkdir sing-box && cd sing-box
# 编写配置文件
mkdir /etc/sing-box/ && vim /etc/sing-box/config.json
# 编写docker-compose.yml，内容如下面所示
vim docker-compose.yml 
# 启动
docker-compose up -d
# 检查是否存在错误
docker-compose logs
````
docker-compose.yml
```yaml
version: '3.3'
services:
  sing-box:
    image: liyuanbiao/sing-box:latest
    container_name: sing-box
    restart: unless-stopped
    network_mode: host
    volumes:
      - '/etc/sing-box/config.json:/etc/sing-box/config.json'
```
