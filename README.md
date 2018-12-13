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
> 这是一个配置的简单例子，注意对数据库的白名单和黑名单的配置。没有使用mysql GTID 模式
```properties
#################################################
## mysql serverId , v1.0.26+ will autoGen 
# canal.instance.mysql.slaveId=0

# enable gtid use true/false
canal.instance.gtidon=false

# position info
canal.instance.master.address=db-master:3306
canal.instance.master.journal.name=
canal.instance.master.position=
canal.instance.master.timestamp=
canal.instance.master.gtid=

# rds oss binlog
canal.instance.rds.accesskey=
canal.instance.rds.secretkey=
canal.instance.rds.instanceId=

# table meta tsdb info
canal.instance.tsdb.enable=true
#canal.instance.tsdb.url=jdbc:mysql://127.0.0.1:3306/canal_tsdb
#canal.instance.tsdb.dbUsername=canal
#canal.instance.tsdb.dbPassword=canal

#canal.instance.standby.address =
#canal.instance.standby.journal.name =
#canal.instance.standby.position = 
#canal.instance.standby.timestamp =
#canal.instance.standby.gtid=

# username/password
canal.instance.dbUsername=root
canal.instance.dbPassword=123456
canal.instance.connectionCharset=UTF-8

# table regex
canal.instance.filter.regex=.*\\..*

# 黑名单
canal.instance.filter.black.regex=order_db\\..*,.*\\.dp_common_event

#################################################

```
