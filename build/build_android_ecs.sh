# ==============================================
# This tool is for Create android ecs .so
# ----------------------------------------------
# Auth:   Huailiang.Peng
# Data:   2019.12.25
# ==============================================
#!/bin/bash -ilex



# 外部需要传 主工程的路径+Unity Project Name
if [ $# != 1 ] ; then 
echo "git -- 参数个数不对" 
exit 1; 
fi 

NDKBUILD=/Users/penghuailiang/Documents/software/eclipse/android-ndk-r20b/ndk-build

ECSPATH=/Users/penghuailiang/Documents/projects/jni


cd ${ECSPATH}


git prune

git remote prune origin

git fetch -p

git clean -dfq

git checkout -q .

SHA=`cat ${1}/Shell/EcsGitSHA.txt`

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

echo  " "   # blank line 
echo  "当前编译ecs节点: "

git log -1

cp ~/Documents/shells/Android.mk .

cp ~/Documents/shells/Application.mk .

rm -rf XEcs/XClientEcs/swigwin-4.0.0

$NDKBUILD clean

$NDKBUILD > ecs_{uid}.txt

echo ${1}

cp ../libs/armeabi-v7a/libXuthus.so ${1}/Assets/Plugins/Android/libs/armeabi-v7a/

cp ../libs/x86/libXuthus.so ${1}/Assets/Plugins/Android/libs/x86/

echo "编译ecs结束"
echo  " "   # blank line 
