#!/bin/bash


# ==============================================
# git operation
# Author: Huailiang.Peng
# ----------------------------------------------
# arg1: workspace
# ==============================================


if [ $# != 1 ] ; then 
echo "git -- 参数个数不对" 
exit 1; 
fi 

cd ${1}

git prune

git remote prune origin

git fetch -p

git clean -dfq

git checkout -q .

git checkout -q ${branch}

git pull -q

echo  " "   # blank line 
echo "当前打包git节点:"

git log -1

echo  " "   # blank line 
