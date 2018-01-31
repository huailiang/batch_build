#!/bin/sh

#android or ios
CHANNEL="$1"
#测试服=1 正式服=2
TYPE="$2"

echo "channel:"${CHANNEL}" type:"${TYPE}

SUB="Android"

PROJECT_PATH=/Users/dn/Documents/patch_android/XProject

if [ ${CHANNEL} == "ios" ];then
SUB="IOS"
PROJECT_PATH=/Users/dn/Documents/patch_ios/XProject
fi

VERSION=`cat ${PROJECT_PATH}/Shell/next-version.txt`

if [ "${VERSION}" = "" ];then
	echo "error, not find version.bytes"
    exit 4
fi


echo "上传开始,version:"${VERSION}

cd ${PROJECT_PATH}/Assets/Bundle/${SUB}

# upload the manifest at first

/usr/local/bin/lftp -u dn,up.dn.123u 42.62.51.126 << EOF

echo hotfix/${SUB}

cd hotfix/${SUB}

echo "正在上传: "${SUB}" manifest..."

put manifest.${VERSION}.assetbundle

put manifest.${VERSION}.assetbundle || { echo "upload manifest failed!"; exit 1; }

bye

EOF

# then upload directory 
if [ -d ${VERSION} ];then

cd ${VERSION}
	
/usr/local/bin/lftp -u dn,up.dn.123u 42.62.51.126 << EOF

cd hotfix/${SUB}

echo "开始上传对应的资源文件夹"

mkdir ${VERSION}

mirror -R ./ ${VERSION}  || { echo "upload failed!"; exit 1; }

bye

EOF

else

echo "没有检测到图片等非文本资源相关的更新"

fi

echo "上传成功"


