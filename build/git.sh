#!/bin/bash

# ==============================================
# git operation
# 1.清理本地环境 
# 2.切到指定分支 
# 3.拉分支最新 
# 4.显示最新一条log
# ----------------------------------------------
# arg1: workspace
# ==============================================


if [ $# != 1 ] ; then 
echo "git -- 参数个数不对" 
exit 1; 
fi 

echo "git 开始清理本地环境..."

cd ${1}

git prune

git fetch -p

git clean -dfq

git checkout -q .

git checkout ${branch}

git pull -q

git log -1

