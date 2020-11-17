#!/bin/bash

# ==============================================
# 用来上传日志到web服务器
# Author: Huailiang.Peng
# ----------------------------------------------
# arg1: Unity日志名
# arg2: 工程路径
# arg3: 
# ==============================================


#如果传过来的参数不对 向上抛出异常
if [ $# != 2 ] ; then 
echo "参数不对" 
exit 1; 
fi 

cd /tmp

cp ${1} /Library/WebServer/Documents/buildlog/${1}

echo "Unity 日志：http://10.253.48.151/buildlog/"${1}

cd ${2}/Assets

cp BuildLog.txt /Library/WebServer/Documents/buildlog/buildlog_${uid}.txt

echo "Bundle 日志: http://10.253.48.151/buildlog/buildlog_"${uid}.txt

