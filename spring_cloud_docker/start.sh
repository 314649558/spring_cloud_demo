#!/bin/bash


#docker build -t eureka .

if [ $# -ne 1 ];then
  echo "Usage $0 <eureka|hello|fegin|ribbon|configserver|configclient|zuul|zipkin|trace1|trace2>" 
  exit 100;
fi

task=$1

if [ "x$task" != "xeureka" -a "x$task" != "xhello" -a "x$task" != "xfegin" -a "x$task" != "xribbon" -a "x$task" != "xconfigserver" -a "x$task" != "xconfigclient" -a "x$task" != "xzuul" -a "x$task" != "xzipkin" -a "x$task" != "xtrace1" -a "x$task" != "xtrace2" ];then

   echo "Usage $0 <eureka|hello|fegin|ribbon|configserver|configclient|zuul|zipkin|trace1|trace2>"

   exit 100;
fi


if [ "x$task" == "xeureka" ];then
 #docker run --name eureka -d -p 1111:1111 -p 1112:1112 -e servername=eureka springcloud
 docker run --name $task"server" -d -p 1111:1111 -e servername=$task --expose 1111 springcloud

elif [ "x$task" == "xhello" ];then
 # Note:--link servername:alias  这里的alias 最好不要使用- _ 等特殊字符  否则可能会出现异常情况
 docker run --name $task"server1" -d -p 8081:8081 --link eurekaserver:eurekaserver -e servername=$task --expose 8081  springcloud
 docker run --name $task"server2" -d -p 8082:8082 --link eurekaserver:eurekaserver -e servername=$task --expose 8082  springcloud
elif [ "x$task" == "xfegin" ];then
  echo ''
elif [ "x$task" == "xribbon" ];then
  #将helloserver也要 链接进来，否则服务注册中心找到服务反馈给该客户端的时候  去找helloserver服务会找不到主机名 从而导致调用出现问题
  docker run --name $task"server" -d -p 9000:9000 --link eurekaserver:eurekaserver --link helloserver1:helloserver1 --link helloserver2:helloserver2 -e servername=$task --expose 9000  springcloud
elif [ "x$task" == "xconfigserver" ];then
  echo ''
elif [ "x$task" == "xconfigclient" ];then

  echo ''
elif [ "x$task" == "xzuul" ];then

  echo ''
elif [ "x$task" == "xzipkin" ];then
  echo ''

fi

[ $? -eq 0 ] && echo "$task server start successful " || echo "$task server start failure "
