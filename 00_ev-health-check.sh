#/bin/bash
# please put this shell script to the root of each node folder.
chmod 755 *.sh
echo '权限修改755，如：' *.sh
cd    docker-es-master && pwd && chmod 777 -R master-* && echo '权限修改777，如：' master-* && \
cd ../docker-es-data01 && pwd && chmod 777 -R data01*  && echo '权限修改777，如：' data01*  && \
cd ../docker-es-data02 && pwd && chmod 777 -R data02*  && echo '权限修改777，如：' data02*  && \
cd ../docker-es-data03 && pwd && chmod 777 -R data03*  && echo '权限修改777，如：' data03*  && \
cd ../docker-es-tribe  && pwd && chmod 777 -R tribe-*  && echo '权限修改777，如：' tribe-*  && \
cd ..

