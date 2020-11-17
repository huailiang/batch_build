# ==============================================
# 用来生成 dll
# Author: Huailiang.Peng
# ----------------------------------------------
#!/bin/sh -ilex

echo "编译参数 uid is:"${uid}" branch is:"${branch}" Configuration:"${Configuration}

#mono steup dir#
XBUILD_PATH=/Applications/Unity/MonoDevelop.app/Contents/Frameworks/Mono.framework/Versions/Current/bin/xbuild

#游戏代码目录#
SRC_PATH=/Users/penghuailiang/Documents/projects/LQClientSrc

TARGET=dll_${uid}_${branch}.zip

cd `dirname $0`

sh git.sh ${SRC_PATH}


TARGET_DLL_PATH=/Library/WebServer/Documents/dll/

MSBuild=/Library/Frameworks/Mono.framework/Versions/Current/Commands/MSBuild

CONFIG="Debug"

if [ "$Configuration"x = "Release"x ]; then

CONFIG="Release"

fi

echo ${CONFIG}

cd ${SRC_PATH}/client/CFClient

$MSBuild CFClient.sln /t:Rebuild /p:TargetFrameworkVersion=v4.0 /p:Configuration=${CONFIG} /p:PostBuildEvent="" /p:TargetFrameworkProfile="Client"


# #最终没有文件生成，说明编译失败
if [ ! -f "${SRC_PATH}/client/CFClient/CFClient/bin/${CONFIG}/CFClient.dll" ];then
	echo "error xbuild compile. Please Check ${SRC_PATH}"
	exit 1;
fi

echo "生成dll成功"

cd ${SRC_PATH}/client/CFClient/CFClient/bin/

cd ${CONFIG}

rm -rf UnityEngine.dll | rm -rf UnityEngine.Timeline.dll | rm -rf enum2int.dll | rm -rf protobuf-lib.dll | rm -rf *.pdb

cd ../

zip  -qr  ${TARGET} ${CONFIG}/ || { echo "not found build package, Sorry!"; exit 1; }

mv ${TARGET} /Library/WebServer/Documents/dll/${TARGET}

echo "上传完毕，点击链接下载：http://10.253.48.151/dll/"${TARGET}