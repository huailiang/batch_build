# ==============================================
# This tool is for Create android apk
# ----------------------------------------------
# Author: Huailiang.Peng
# Data:   2016.05.25
# ==============================================
#!/bin/bash

echo "打包参数 uid is:"${uid}" branch is:"${branch}" build:"${BUILD_NUMBER}" email:"${email}" macro:"${macro}

#游戏工程目录#
PROJPATH=/Users/penghuailiang/Documents/projects/CFDemoRes_and/

TARGET_PRE=cfgame.apk

TARGET=android_${uid}_${branch}.apk

cd `dirname $0`

sh git.sh ${PROJPATH} 

cd ${PROJPATH}/CFDemoProject/Android/

rm -rf *.apk

echo $macro>${PROJPATH}/CFDemoProject/Shell/macro.txt

$UNITY -quit -batchmode -projectPath $PROJPATH/CFDemoProject -logFile /tmp/android_debug_${uid}.log -executeMethod JenkinsBuild.BuildAndroid 

if [ $? -ne 0 ]; then
	echo "打包失败"
    cat /tmp/android_debug_${uid}.log
    exit 1
fi

cd ${PROJPATH}/CFDemoProject/Android/

mv ${TARGET_PRE} ${TARGET} || { echo "not found build apk, Sorry!"; exit 1; }

cd `dirname $0`

sh upload.sh ${PROJPATH}/CFDemoProject ${TARGET}

sh sendmail.sh ${TARGET} 

sh qrcode.sh ${TARGET}
