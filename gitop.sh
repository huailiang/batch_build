# ============================================
#This tool is for git opration inactive with php
# ----------------------------------------------
# Author: Huailiang.Peng
# Data:   2018.01.23
# ==============================================
#!/bin/sh -x


PROJECT_RES=/Users/dn/Documents/patch_res

PROJECT_SRC=/Users/dn/Documents/patch_src

UNITY_PATH=/Applications/Unity/Unity5.app/Contents/MacOS/Unity

################ res ###################

echo "正在准备开始。。。"

#全局配置
git config --global credential.helper store
git config --global merge.ours.driver true

cd ${PROJECT_RES}

git reset --hard | git clean -df

#echo "checkout res ob"

# git checkout OB

git pull

if [ $? -ne 0 ];then
     echo "error git pull"
fi

git log -1

# ehco "checkout res release"

# git checkout release-res

# git pull

# git merge origin/OB -m "shell merge from OB"

# if [ $? -ne 0 ];then
#     echo "error merge src"
#     exit 1
# fi

# #git push

# echo "merge res finish\n\n"


# ################ src ###################

# echo ${PROJECT_SRC}

# cd $PROJECT_SRC/

# git add -A .

# git reset --hard HEAD^

# echo "checkout res ob"

# git checkout OB

# git pull

# ehco "checkout res release"

# git checkout release-src

# git pull

# git merge origin/OB -m "shell merge from OB"

# if [ $? -ne 0 ];then
#     echo "error merge src"
#     exit 1
# fi

# #git push

# echo "merge src finish"


echo "开始统计文件变更列表，请耐心等待..."

macro="Publish"

echo $nmacro>${PROJECT_RES}"/XProject/Assets/Build.txt"

#$UNITY_PATH -projectPath ${PROJECT_RES}"/XProject"  -logFile /tmp/dn_patch_setmacro.log -executeMethod SelectPlatformEditor.SetMacrow -quit -batchmode

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












