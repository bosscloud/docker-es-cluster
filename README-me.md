http://10.0.0.78:9200/_cat/nodes


http://10.0.0.78:9100/

http://10.0.0.78:9000/


一次性删除docker images中name为none的镜像
有时候由于调试代码产生很多的none的image，挨个清理会有些麻烦，于是就写了以下脚本：

docker ps -a | grep "Exited" | awk '{print $1 }'|xargs docker stop
docker ps -a | grep "Exited" | awk '{print $1 }'|xargs docker rm
docker images|grep none|awk '{print $3 }'|xargs docker rmi



memory locking requested for elasticsearch process but memory is not locked
解决方法二（开启bootstrap.memory_lock:）：
1. 修改文件/etc/elasticsearch/elasticsearch.yml，上面那个报错就是开启后产生的，如果开启还要修改其它系统配置文件 
bootstrap.memory_lock: true
2. 修改文件/etc/security/limits.conf，最后添加以下内容。      
* soft nofile 65536
* hard nofile 65536
* soft nproc 32000
* hard nproc 32000
* hard memlock unlimited
* soft memlock unlimited
3. 修改文件 /etc/systemd/system.conf ，分别修改以下内容。
DefaultLimitNOFILE=65536
DefaultLimitNPROC=32000
DefaultLimitMEMLOCK=infinity
改好后重启下系统。再启动elasticsearch就没报错了 。
————————————————
版权声明：本文为CSDN博主「璐程风」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/cbuy888/article/details/103166008


在执行shell脚本的时候，会出现‘$’\r’: 未找到命令’错误。多半是因为在window系统中写的shell脚本，然后上传到服务器执行。
解决办法如下：
1、安装dos2unix。
#yum install dos2unix
2、使用dos2unix对脚本转换。

#dos2unix xxx.sh
3、执行需要执行的脚本，此时不再报错。
————————————————
版权声明：本文为CSDN博主「MyNameIsJerry」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_25925973/article/details/78018142

# http://es-head:9100
# http://es-cerebro:9000 admin/admin

10.0.0.78  es-head
10.0.0.78  es-cerebro
10.0.0.78  es-head
10.0.0.78  es-master
10.0.0.78  es-tribe
10.0.0.78  es-data01
10.0.0.78  es-data02
10.0.0.78  es-data03
10.0.0.78  es-data04
10.0.0.78  es-kafka



172.16.0.2 zk1
172.16.0.3 zk2
172.16.0.4 zk3

#172.16.0.5 kafka1
#172.16.0.6 kafka2
#172.16.0.7 kafka3
