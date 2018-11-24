# ==============================================
# This tool is for Create windows zip
# ----------------------------------------------
# Author: Huailiang.Peng
# Data:   2016.05.25
# ==============================================
#!/bin/bash 

echo "打包参数 channel is:"${channel}" uid is:"${uid}" branch is:"${branch}" build:"${BUILD_NUMBER}" macro:"${macro}

#游戏工程目录#
PROJPATH=/Users/penghuailiang/Documents/projects/CFDemoRes_win

TARGET=win32_${uid}_${branch}.zip

cd `dirname $0`

sh git.sh ${PROJPATH} 

cd ${PROJPATH}/CFDemoProject/Win32/

rm -rf *.exe

rm -rf *_Data

echo $macro>${PROJPATH}/CFDemoProject/Shell/macro.txt

$UNITY -quit -batchmode -projectPath ${PROJPATH}/CFDemoProject -logFile /tmp/win_debug_${uid}.log -executeMethod JenkinsBuild.BuildWin32 

if [ $? -ne 0 ]; then
	echo "打包失败"
    cat /tmp/win_debug_${uid}.log
    exit 1
fi

cd ${PROJPATH}/CFDemoProject

rm -rf *.zip

zip  -qr  ${TARGET} Win32/ || { echo "not found build package, Sorry!"; exit 1; }

echo -e "zip finish\n"

cd `dirname $0`

sh upload.sh ${PROJPATH}/CFDemoProject ${TARGET}

sh sendmail.sh ${TARGET}

sh qrcode.sh ${TARGET}
