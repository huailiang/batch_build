#!/bin/sh
#用法
echo "Usage: $0 <Git_Root_Path> <Git_Release_Branch> <Git_Merge_Branch>"

#全局配置
git config --global credential.helper store
git config --global merge.ours.driver true

#接收参数
GIT_PATH="$1"
RELEASE_BRANCH="$2"
MERGE_BRANCH="$3"

echo 切目录到$GIT_PATH
cd $GIT_PATH

echo 合并分支${MERGE_BRANCH}
git merge origin/${MERGE_BRANCH} -m "Merge branch ${MERGE_BRANCH} into ${RELEASE_BRANCH}"

if [ $? -ne 0 ];then
    echo "error merge ${MERGE_BRANCH} to ${RELEASE_BRANCH}"
    exit 1
fi

#echo 提交分支${RELEASE_BRANCH}
#git push origin ${RELEASE_BRANCH}

if [ $? -ne 0 ];then
    echo "error push ${RELEASE_BRANCH}"
    exit 1
fi
