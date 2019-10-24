# ==============================================
# 用来将符号表上传到bugly服务器
# Author: Huailiang.Peng
#
# arg1 参数需要将对应的unity项目地址传进
# ----------------------------------------------
#!/bin/sh

if [ $# != 1 ] ; then 
echo "git -- 参数个数不对" 
exit 1; 
fi 

echo "开始处理符号表"


VERSION=${branch}"-"${uid}

cd ${1}/Mods/buglySymboliOS/

rm -rf *.zip

dSYM=${1}/IOS/cfgame/cfgame.app.dSYM

if [ -d "${dSYM}" ]; then

cp -rf ${dSYM} ./

java -jar buglySymboliOS.jar -i cfgame.app.dSYM -u -id 95e714f5db -key eafbe557-8de5-4451-af90-a8070b70ddc0 -package com.ningyunet.cfgame -version ${VERSION}

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

echo "********	buglySymboliOS upload success  ***********"

else

echo "********  not found buglySymboliOS export  **********"

fi