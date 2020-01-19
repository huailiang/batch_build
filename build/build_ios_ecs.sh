# ==============================================
# This tool is for Create iOS & OSX c++ library
# ----------------------------------------------
# Auth:   Huailiang.Peng
# Data:   2019.12.11
# ==============================================
#!/bin/sh


# 外部需要传 主工程的路径+Unity Project Name
if [ $# != 1 ] ; then 
echo "git -- 参数个数不对" 
exit 1; 
fi 

ECSPATH=/Users/penghuailiang/Documents/projects/XEcs

echo "\n开始编译ecs..."

cd ${ECSPATH}

git prune

git remote prune origin

git fetch -p

git clean -dfq

git checkout -q .

SHA=`cat ${1}/Shell/EcsGitSHA.txt`

echo "ecs: "${SHA}

git checkout ${SHA}

# if [[ ${SHA} = "master" ]]; then
# 	#statements
# 	git pull
# fi

# SHA可能是分支名 也可能是git节点， 
# 如果名字长度<16， 就代表是分支名, 这时候使用Gitpull去merge到最新节点
# Git 的节点长度是40 
if [[ ${#SHA} -lt 16 ]]; then
	git pull
fi

git log -1

echo "开始编译 ios上的library "

sh generate_ios.sh > ecs_${uid}.txt

rm -f ${1}/Assets/Plugins/iOS/libXuthus.a

if [ ! -d "${1}/Assets/Plugins/iOS/" ];then

mkdir ${1}/Assets/Plugins/iOS/

fi

mv Plugins/iOS/libXuthus.a ${1}/Assets/Plugins/iOS/

mv ecs_${uid}.txt /Library/WebServer/Documents/ecs

echo "编译ecs结束, 日志：http://10.253.48.151/ecs/ecs_${uid}.txt"
