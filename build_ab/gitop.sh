# ============================================
#This tool is for git opration inactive with php
# ----------------------------------------------
# Author: Huailiang.Peng
# Data:   2018.01.23
# ==============================================
#!/bin/sh -x


PROJECT_RES=/Users/dn/Documents/patch_res

PROJECT_SRC=/Users/dn/Documents/src

UNITY_PATH=/Applications/Unity/Unity5.app/Contents/MacOS/Unity

################ res ###################

echo "开始清理本地环境，拉取最新，合线"

#全局配置
git config --global credential.helper store
git config --global merge.ours.driver true

function gitoption() { 
	git clean -dfq
	git reset --hard HEAD^ 
	echo "** switch branch ob **"
	git checkout OB
	git pull -q
	echo "** switch branch release **"
	git checkout $1
	git pull -q
	git log -1
	git merge OB -m "dn-version shell merge from OB"
	if [ $? -ne 0 ];then
	    echo "error merge src"
	  	exit 1
	fi
	git push
	echo "\n"
}

#下面两行是正式版本用 先注释掉
#cd ${PROJECT_RES} && echo "********** res *********" && gitoption release-res
#cd ${PROJECT_SRC} && echo "********** src *********" && gitoption release-src

#测试代码
cd ${PROJECT_RES} && git clean -dfq && git reset --hard && git checkout release_jenkins && git pull -q && git log -1

echo "git 操作结束\n"

echo "开始统计文件变更列表，请耐心等待..."

#call unity interface 
$UNITY_PATH -quit -batchmode -projectPath ${PROJECT_RES}"/XProject" -logFile /tmp/dn_patch_patch.log -executeMethod XBundlePresent.JenkinsFetchList

if [ -f "${PROJECT_RES}/XProject/Shell/Error.Log" ];then
	echo "error occur, as list:"
	cat ${PROJECT_RES}/XProject/Shell/Error.Log
	exit 1
fi

echo "文件更改列表："

cat ${PROJECT_RES}/XProject/Shell/UpdateList.Log

echo "\n\n****************************"












