#!/bin/bash


# ==============================================
# git operation
# 切到某个节点 传过来的是commit的sha值
# ----------------------------------------------
# arg1: workspace
# arg2: commit-id
# ==============================================


if [ $# != 2 ] ; then 
echo "git -- 参数个数不对" 
exit 1; 
fi 

echo "git 开始清理本地环境..."

cd ${1}

git prune

git fetch -p

git clean -dfq

git checkout -q .

git checkout ${2}

git log -1

