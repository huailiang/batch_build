# ==============================================
# This tool is for Create iOS & OSX c++ library
# ----------------------------------------------
# Auth:   Huailiang.Peng
# Data:   2019.12.11
# ==============================================
#!/bin/sh


ECSPATH=/Users/penghuailiang/Documents/projects/XEcs

echo -e "\n打包参数:\n uid:"${uid}" \n Git at:"${sha}" \n"

PACKAGE=ecs_${uid}.zip


function todo_make_log(){

	mv ecs_osx_${uid}.log /Library/WebServer/Documents/ecs

	mv ecs_ios_${uid}.log /Library/WebServer/Documents/ecs

	echo "osx编译日志： http://10.253.48.151/ecs/ecs_osx_${uid}.log"

	echo "ios编译日志： http://10.253.48.151/ecs/ecs_ios_${uid}.log"
}

function todo_exec_git(){

	git prune

	git remote prune origin

	git fetch -p

	git clean -dfq

	git checkout -q .

	git checkout ${sha}

	git log -1
}

cd ${ECSPATH}

todo_exec_git

rm -rf Plugins/

echo -e "\nNative Compile OSX..."

sh generate_osx.sh > ecs_osx_${uid}.log

echo -e "\nNative Compile IOS..."

sh generate_ios.sh > ecs_ios_${uid}.log


if [ ! -f "Plugins/iOS/libXuthus.a" ];then

	echo "native build failed"

	todo_make_log

	exit 2 # 打包失败 退出标记为2

else
	echo -e "\nNative Compile Success\n"

	zip -qr ${PACKAGE} Plugins

	mv ${PACKAGE} /Library/WebServer/Documents/ecs

	echo "点击链接下载：http://10.253.48.151/ecs/${PACKAGE}"

	todo_make_log

fi


