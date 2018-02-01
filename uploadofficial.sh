#!/bin/sh


UNITY_PATH=/Applications/Unity/Unity5.app/Contents/MacOS/Unity

PROJECT_Android=/Users/dn/Documents/patch_android/XProject

PROJECT_Ios=/Users/dn/Documents/patch_ios/XProject

Shelll_Path=/Library/WebServer/Documents/dn

sh ${Shelll_Path}/upload.sh "android" 2 

echo "开始提升版本号"

$UNITY_PATH -quit -batchmode -projectPath ${PROJECT_Android} -logFile /tmp/dn_and_patch.log -executeMethod XBundlePresent.JenkinsPush

if [ -f "${PROJECT_Android}/Shell/Error.Log" ];then
    echo "error occur, as list:"
    cat ${PROJECT_Android}/Shell/Error.Log
    exit 1
fi


echo "Android 操作结束\n\n"

######################### ios ###########################

sh ${Shelll_Path}/upload.sh "ios" 2 

echo "开始提升版本号"

cd {PROJECT_Ios}

cd ../

git pull

$UNITY_PATH -quit -batchmode -projectPath ${PROJECT_Ios} -logFile /tmp/dn_ios_patch.log -executeMethod XBundlePresent.JenkinsPush

if [ -f "${PROJECT_Ios}/Shell/Error.Log" ];then
    echo "error occur, as list:"
    cat ${PROJECT_Ios}/Shell/Error.Log
    exit 1
fi

echo "ios 操作结束"

echo "\n\n*********************************"