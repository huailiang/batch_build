# ==============================================
# 用来将符号表上传到bugly服务器
# Author: Huailiang.Peng
#
# arg1 参数需要将对应的unity项目地址传进
# ----------------------------------------------
#!/bin/sh

if [ $# != 1 ] ; then 
echo "symbol -- 参数个数不对" 
exit 1; 
fi 

echo "开始处理符号表"


VERSION=${branch}"-"${uid}

cd ${1}/Mods/buglySymboliOS/

rm -rf *.zip

# unity2019.2 or older
# TARGET=cfgame.app.dSYM

# unity2019.3 later
TARGET=UnityFramework.framework.dSYM

BUGLY_KEY=eafbe557-8de5-4451-af90-a8070b70ddc0

BUGLY_ID=95e714f5db

dSYM=${1}/IOS/cfgame/${TARGET}

echo ${dSYM}

if [ -d "${dSYM}" ]; then

cp -rf ${dSYM} ./

java -jar buglySymboliOS.jar -i ${TARGET} -u -id ${BUGLY_ID} -key ${BUGLY_KEY} -package com.ningyunet.cfgame -version ${VERSION}

sh zip_dsym.sh

# 主要是用来备份（手动上传），因为有时候上传失败
cp *.zip /Library/WebServer/Documents/symbol/

# 自动生成一个配置文件和相关链接
files=`ls *.zip`
for item in $files
do
	filename=${item%.*}
	echo ${VERSION}>${filename}.txt
	cp ${filename}.txt /Library/WebServer/Documents/symbol/
	echo "符号表文件：http://10.253.48.151/symbol/"${filename}.zip
done

else

echo "********  not found buglySymboliOS export  **********"

fi