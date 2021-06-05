mkdir -p /c/Users/64178/Desktop/docker-es-cluster/es-kafka/zookeeper/zk1/conf &&
mkdir -p /c/Users/64178/Desktop/docker-es-cluster/es-kafka/zookeeper/zk1/data &&
mkdir -p /c/Users/64178/Desktop/docker-es-cluster/es-kafka/zookeeper/zk1/log &&
mkdir -p /c/Users/64178/Desktop/docker-es-cluster/es-kafka/zookeeper/zk2/conf &&
mkdir -p /c/Users/64178/Desktop/docker-es-cluster/es-kafka/zookeeper/zk2/data &&
mkdir -p /c/Users/64178/Desktop/docker-es-cluster/es-kafka/zookeeper/zk2/log &&
mkdir -p /c/Users/64178/Desktop/docker-es-cluster/es-kafka/zookeeper/zk3/conf &&
mkdir -p /c/Users/64178/Desktop/docker-es-cluster/es-kafka/zookeeper/zk3/data &&
mkdir -p /c/Users/64178/Desktop/docker-es-cluster/es-kafka/zookeeper/zk3/log &&
mkdir -p /c/Users/64178/Desktop/docker-es-cluster/es-kafka/kafka/kafka1/conf &&
mkdir -p /c/Users/64178/Desktop/docker-es-cluster/es-kafka/kafka/kafka1/log &&
mkdir -p /c/Users/64178/Desktop/docker-es-cluster/es-kafka/kafka/kafka2/conf &&
mkdir -p /c/Users/64178/Desktop/docker-es-cluster/es-kafka/kafka/kafka2/log &&
mkdir -p /c/Users/64178/Desktop/docker-es-cluster/es-kafka/kafka/kafka3/conf &&
mkdir -p /c/Users/64178/Desktop/docker-es-cluster/es-kafka/kafka/kafka3/log;



docker network create --driver bridge --subnet 172.16.0.0/25 --gateway 172.16.0.1 zookeeper_kafka

docker-compose -f docker-compose.yml up -d

docker cp /root/es-kafka/zookeeper/zk1/conf/zoo.cfg zk1:/opt/zookeeper-3.4.13/conf/zoo.cfg && \
docker cp /root/es-kafka/zookeeper/zk2/conf/zoo.cfg zk2:/opt/zookeeper-3.4.13/conf/zoo.cfg && \
docker cp /root/es-kafka/zookeeper/zk2/conf/zoo.cfg zk3:/opt/zookeeper-3.4.13/conf/zoo.cfg


docker cp /root/es-kafka/zookeeper/zk1/data/myid zk1:/opt/zookeeper-3.4.13/data/ && \
docker cp /root/es-kafka/zookeeper/zk2/data/myid zk2:/opt/zookeeper-3.4.13/data/ && \
docker cp /root/es-kafka/zookeeper/zk3/data/myid zk3:/opt/zookeeper-3.4.13/data/
