#!/bin/bash

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
  nohup java -jar jars/spring_clould_eureka-0.0.1-SNAPSHOT.jar --spring.profiles.active=peerl >/dev/null 2>&1 &
  #java -jar jars/spring_clould_eureka-0.0.1-SNAPSHOT.jar --spring.profiles.active=peer2
elif [ "x$task" == "xhello" ];then
  nohup java -jar /root/jars/spring_cloud_helloservice-0.0.1-SNAPSHOT.jar --server.port=8081  >/dev/null 2>&1
#  nohup java -jar /root/jars/spring_cloud_helloservice-0.0.1-SNAPSHOT.jar --server.port=8082  >/dev/null 2>&1

elif [ "x$task" == "xfegin" ];then
  nohup java -jar /root/jars/spring_cloud_fegin-0.0.1-SNAPSHOT.jar --server.port=9001  >/dev/null 2>&1

elif [ "x$task" == "xribbon" ];then
  nohup java -jar /root/jars/spring_cloud_ribbon_consumer-0.0.1-SNAPSHOT.jar --server.port=9000  >/dev/null 2>&1

elif [ "x$task" == "xconfigserver" ];then
  nohup java -jar /root/jars/spring_cloud_configserver-0.0.1-SNAPSHOT.jar --server.port=7001  >/dev/null 2>&1

elif [ "x$task" == "xconfigclient" ];then
  nohup java -jar /root/jars/spring_cloud_configclient-0.0.1-SNAPSHOT.jar --server.port=7002  >/dev/null 2>&1

elif [ "x$task" == "xzuul" ];then
  nohup java -jar /root/jars/spring_cloud_zuul-0.0.1-SNAPSHOT.jar --server.port=5555  >/dev/null 2>&1

elif [ "x$task" == "xzipkin" ];then
  nohup java -jar /root/jars/spring_cloud_zipkin_server-0.0.1-SNAPSHOT.jar --server.port=9411  >/dev/null 2>&1
fi

while true
do
 sleep 1
done

