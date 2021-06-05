#!/bin/bash
#这里可替换为你自己的执行程序，其他代码无需更改

#======================================================================
# 项目启动shell脚本
# boot目录: spring boot jar包
# logs/bigdata-eureka.log: 记录启动日志
# logs/back目录: 项目运行日志备份目录
# nohup后台运行
#
# author: lucky
# date: 2019-03-06
#======================================================================

# 项目名称
APPLICATION="ep-es-1.0-SNAPSHOT"
SKYWALKING=" "

# 项目启动jar包名称
APPLICATION_JAR="${APPLICATION}.jar"

# bin目录绝对路径
BIN_PATH=$(cd `dirname $0`; pwd)
# 进入bin目录
cd `dirname $0`
# 返回到上一级项目根目录路径
cd ..
# 打印项目根目录绝对路径
# `pwd` 执行系统命令并获得结果
BASE_PATH=`pwd`

# 外部配置文件绝对目录,如果是目录需要/结尾，也可以直接指定文件
# 如果指定的是目录,spring则会读取目录中的所有配置文件


# 项目日志输出绝对路径
LOG_DIR=${BASE_PATH}"/es-boot/logs"
LOG_FILE="${APPLICATION}.log"
LOG_PATH="${LOG_DIR}/${LOG_FILE}"


GOT_PATH=${BASE_PATH}
APP_NAME=${APPLICATION_JAR}
LOG_NAME=${LOG_PATH}

APP_NAME=${BASE_PATH}"/es-boot/"${APPLICATION_JAR}


cd ${GOT_PATH}
#使用说明，用来提示输入参数
usage() {
    echo "Usage: sh 执行脚本.sh [start|stop|restart|status|logs|proc]"
    exit 1
}
 
#检查程序是否在运行
is_exist(){
  pid=`ps -ef|grep $APP_NAME|grep -v grep|awk '{print $2}' `
  #如果不存在返回1，存在返回0     
  if [ -z "${pid}" ]; then
   return 1
  else
    return 0
  fi
}
 
#启动方法
start(){
  is_exist
  if [ $? -eq "0" ]; then
    echo "${APP_NAME} is already running. pid=${pid} ."
  else
    nohup java ${SKYWALKING} -Djava.security.egd=file:/dev/./urandom -jar ${APP_NAME} > ${LOG_PATH} 2>&1 &
    #tail -f $LOG_NAME	
  fi
}
 
#停止方法
stop(){
  is_exist
  if [ $? -eq "0" ]; then
    echo kill  $pid
    kill -9 $pid
    echo "${APP_NAME} killed"
  else
    echo "${APP_NAME} is already stopped"
  fi
}
 
#输出运行状态
status(){
  is_exist
  if [ $? -eq "0" ]; then
    echo "${APP_NAME} is running. Pid is ${pid}"
  else
    echo "${APP_NAME} is not running."
  fi
}
 
#重启
restart(){
  stop
  start
}

#重启
logs(){
  tail -f $LOG_NAME
}

#查看进程
proc(){
  pid=`ps -ef|grep $APP_NAME | grep -v grep|awk '{print $2}' `
  #如果不存在返回1，存在返回0
  if [ -z "${pid}" ]; then
    echo "${APP_NAME} Process number ${pid}."
  else
    echo "${APP_NAME} Process number ${pid}."
  fi
}
#根据输入参数，选择执行对应方法，不输入则执行使用说明
case "$1" in
  "start")
    start
    ;;
  "stop")
    stop
    ;;
  "status")
    status
    ;;
  "restart")
    restart
    ;;
  "logs")
    logs
    ;;
  "proc")
    proc
    ;;
  *)
    usage
    ;;
esac

