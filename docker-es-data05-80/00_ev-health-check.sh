#/bin/bash
# please put this shell script to the root of each node folder.
echo '权限修改755，如：' *.sh
pwd && chmod 777 -R data05-* && echo '权限修改777，如：' data05-*

