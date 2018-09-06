# canal-docker
> 自定义 `canal` 的 `docker` 镜像

## 版本
支持`canal`最新`release`版本`v1.1.0`

## 使用方法
`clone`本工程到本地，并执行`sh build.sh`即可打出镜像.用户可以根据自身私服环境修改docker镜像名称.

## Dockerfile
```
#FROM docker.today36524.com.cn:5000/base/openjdk:server-jre8
#FROM docker.io/openjdk:8-jdk
FROM java:8

MAINTAINER maple leihuazhe@gmail.com

RUN mkdir /canal-server
COPY  ./canal-server  /canal-server

WORKDIR /canal-server

CMD ["sh",  "-c", "/canal-server/bin/startup.sh && tail -F /canal-server/bin/startup.sh"]
```
## 实例配置(instance)
```properties


```
