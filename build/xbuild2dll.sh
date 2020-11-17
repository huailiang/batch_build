# ==============================================
# 用来生成 dll
# Author: Huailiang.Peng
# ----------------------------------------------
#!/bin/sh


if [ $# != 1 ] ; then 
echo "zip -- 参数个数不对， 需要传入Unity工程路径" 
exit 1; 
fi 

XBUILD_PATH=/Applications/Unity/MonoDevelop.app/Contents/Frameworks/Mono.framework/Versions/Current/bin/xbuild

SRC_PATH=/Users/penghuailiang/Documents/projects/OPSrc

MSBuild=/Library/Frameworks/Mono.framework/Versions/Current/Commands/MSBuild

sh git.sh ${SRC_PATH}

TARGET_DLL_PATH=${1}/Assets/Lib

cd ${SRC_PATH}/client/CFClient

$MSBuild CFClient.sln /t:Clean

echo "clean success"

$MSBuild CFClient.sln /t:Rebuild /p:TargetFrameworkVersion=v4.6 /p:Configuration=${Configuration} /p:PostBuildEvent="" 

echo "compile dll success"

#最终没有文件生成，说明编译失败
if [ ! -f "${SRC_PATH}/client/CFClient/CFClient/bin/${Configuration}/CFClient.dll" ];then
	echo "error xbuild compile. Please Check ${SRC_PATH}"
	exit 1;
fi

cp -f ${SRC_PATH}/client/CFClient/CFClient/bin/${Configuration}/CFClient.dll ${TARGET_DLL_PATH}/

cp -f ${SRC_PATH}/client/CFClient/CFClient/bin/${Configuration}/CFUtilPoolLib.dll ${TARGET_DLL_PATH}/

echo "生成Release dll成功"
