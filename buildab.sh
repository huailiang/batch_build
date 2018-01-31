#!/bin/sh

UNITY_PATH=/Applications/Unity/Unity5.app/Contents/MacOS/Unity

PROJECT_Android=/Users/dn/Documents/patch_android

PROJECT_Ios=/Users/dn/Documents/patch_ios

Shelll_Path=/Library/WebServer/Documents/dn

nmacro="APOLLO;GAMESIR;BROADCAST"

target_branch=release_jenkins #release-res


function gitopt() {
    git clean -dfq
    git checkout .
    git fetch -p
    git checkout ${target_branch}
    git pull
    git log -1
}

######################### androids ###########################

echo "******************* android ***********************"

echo "android git-release拉到最新"

cd ${PROJECT_Android}

gitopt

echo "开始生成Android 补丁，请耐心等待..."

$UNITY_PATH -quit -batchmode -projectPath ${PROJECT_Android}"/XProject" -logFile /tmp/patch_and_abbuild.log -executeMethod XBundlePresent.JenkinsPatch

if [ $? -ne 0 ];then
    echo "error Build android ab " | cat /tmp/patch_and_abbuild.log
    exit 2
fi

if [ -f "${PROJECT_Android}/XProject/Shell/Error.Log" ];then
    echo "error occur, as list:"
    cat ${PROJECT_Android}/XProject/Shell/Error.Log
    exit 1
fi

echo "Android 补丁生成完毕, android 测试服上传开始..."

sh ${Shelll_Path}/upload.sh "android" 1

echo "\n\n"



######################### ios ###########################

echo "******************* ios ***********************"

echo "iOS git-release拉到最新"

cd ${PROJECT_Ios}

gitopt

echo "开始生成iOS补丁，请耐心等待..."

$UNITY_PATH -quit -batchmode -projectPath ${PROJECT_Ios}"/XProject" -logFile /tmp/patch_ios_abbuild.log -executeMethod XBundlePresent.JenkinsPatch

if [ $? -ne 0 ];then
    echo "error Build android ab " | cat /tmp/patch_ios_prebuild.log
    exit 2
fi

if [ -f "${PROJECT_Ios}/XProject/Shell/Error.Log" ];then
    echo "error occur, as list:"
    cat ${PROJECT_Ios}/XProject/Shell/Error.Log
    exit 1
fi

echo "iOS 补丁生成完毕, ios 测试服上传开始..."

sh ${Shelll_Path}/upload.sh "ios" 1

echo "上传全部完成，请 QA 验收-- 如果中间有回退操作，请等待 cdn同步"

echo "\n\n******************************************"

