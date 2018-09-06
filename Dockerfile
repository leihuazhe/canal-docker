#FROM docker.today36524.com.cn:5000/base/openjdk:server-jre8
#FROM docker.io/openjdk:8-jdk
FROM java:8

MAINTAINER maple leihuazhe@gmail.com

RUN mkdir /canal-server
COPY  ./canal-server  /canal-server

WORKDIR /canal-server

CMD ["sh",  "-c", "/canal-server/bin/startup.sh && tail -F /canal-server/bin/startup.sh"]


