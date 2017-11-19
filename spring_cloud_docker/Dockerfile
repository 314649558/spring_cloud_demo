FROM centos:ssh

MAINTAINER yuanhailong 314649558@qq.com


WORKDIR /root


RUN mkdir -p /root/jars


# 添加外部文件
ADD jars/* /root/jars/

ADD hosts /etc/hosts

ADD run.sh /root/

RUN chmod 755  -R /root/*



ENV servername=eureka

# 暴露对外对口号
#EXPOSE 1111 1112 5555 8080 8081 8082 9000 9001 9002 9003 9004 9012 9011 9411 7001 7002


CMD /root/run.sh $servername






