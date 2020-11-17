#!/bin/bash


# ==============================================
# 用来上传包到web服务器
# Author: Huailiang.Peng
# ----------------------------------------------
# arg1: Unity工程的路径
# arg2: 包名
# ==============================================

# echo "project path: "$1" package: "${2}

#如果传过来的参数不对 向上抛出异常
if [ $# != 2 ] ; then 
echo "参数不对" 
exit 1; 
fi 

echo "打包完成，开始上传web服务器..."

cd $1

EXT=`echo ${2: -3}`

# echo ${EXT}

if [ ${EXT} = "apk" ];then
	cd Android
elif [[ ${EXT} = "ipa" ]]; then
	#statements
	cd IOS/cfgame/ipa
fi

mv ${2} /Library/WebServer/Documents/pac/${2}

echo "上传完毕，点击链接下载：http://10.253.48.151/pac/"${2}
