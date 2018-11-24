#!/bin/sh


XBUILD_PATH=/Applications/Unity/MonoDevelop.app/Contents/Frameworks/Mono.framework/Versions/Current/bin/xbuild

CLIENT_PATH=/Users/penghuailiang/Documents/projects/CFDemoSrc/client/CFClient

TARGET_DLL_PATH=${1}

rm -rf ${CLIENT_PATH}/CFClient/bin
rm -rf ${CLIENT_PATH}/CFUtilPoolLib/bin

rm -rf ${CLIENT_PATH}/CFClient/obj
rm -rf ${CLIENT_PATH}/CFUtilPoolLib/obj


${XBUILD_PATH} ${CLIENT_PATH}/CFClient.sln /p:Configuration=Release /p:TreatWarningsAsErrors=false /p:TargetFrameworkProfile="" /p:PostBuildEvent="" > /tmp/build_log.log

cp ${CLIENT_PATH}/CFUtilPoolLib/bin/Release/*.dll  ${CLIENT_PATH}/CFClient/bin/Release/

${XBUILD_PATH} ${CLIENT_PATH}/CFClient.sln /p:Configuration=Release /p:TreatWarningsAsErrors=false /p:TargetFrameworkProfile="" /p:PostBuildEvent="" > /tmp/build_log.log

#最终没有文件生成，说明编译失败
if [ ! -f "${CLIENT_PATH}/CFClient/bin/Release/CFClient.dll" ];then
	echo "error xbuild compile. Please Check ${CLIENT_PATH}"
	exit 1;
fi

cp -f ${CLIENT_PATH}/CFClient/bin/Release/CFClient.dll ${TARGET_DLL_PATH}/

cp -f ${CLIENT_PATH}/CFUtilPoolLib/bin/Release/CFUtilPoolLib.dll ${TARGET_DLL_PATH}/


