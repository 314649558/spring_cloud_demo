jars 
  存放spring cloud 微服务相关jar包
      spring_clould_eureka-0.0.1-SNAPSHOT.jar   服务注册中心
      spring_cloud_zuul-0.0.1-SNAPSHOT.jar      服务网关
      spring_cloud_zipkin_server-0.0.1-SNAPSHOT.jar    zipkin 分布式服务跟踪后台服务
      spring_cloud_ribbon_consumer-0.0.1-SNAPSHOT.jar   ribbon 客户端消费程序，实现了服务降级和负载均衡等功能
      spring_cloud_helloservice-0.0.1-SNAPSHOT.jar     一个简单的微服务程序
      spring_cloud_fegin-0.0.1-SNAPSHOT.jar            ribbon和服务降级功能的组合
      spring_cloud_configserver-0.0.1-SNAPSHOT.jar   配置服务中心他会动态刷新git上配置文件的变化
      spring_cloud_configclient-0.0.1-SNAPSHOT.jar   配置服务客户端（其实就是一个普通的微服务），指定配置服务中心

hosts 
  linxu 下的hosts文件  覆盖docker容器内的/etc/hosts

run.sh
  启动微服务脚本

start.sh
  启动容器脚本




创建镜像
docker build -t springcloud .

