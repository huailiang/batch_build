# ==============================================
# This tool is for Create iOS test ipa
# ----------------------------------------------
# Auth:   Huailiang.Peng
# Data:   2019.08.26
# ==============================================
#!/bin/sh -ilex


echo -e "打包参数: \n - uid:  "${uid}" \n - 分支: "${branch}" \n - 编译宏: "${macro}" \n - 登录服: "${loginserver}"\n"

#游戏工程目录#
PROJPATH=/Users/penghuailiang/Documents/projects/op_and

TARGET_PRE=cfgame.apk

TARGET=android_${uid}_${branch}.apk

cd `dirname $0`

sh clean_bundle.sh ${PROJPATH}/OPProject

sh git.sh ${PROJPATH} 

sh build_android_ecs.sh ${PROJPATH}/OPProject

# sh zip_filter.sh ${PROJPATH}/OPProject

cd ${PROJPATH}/OPProject/Android/

rm -rf *.apk

echo ${branch}"-"${uid}>${PROJPATH}/OPProject/Assets/Resources/packinfo.txt

echo $macro>${PROJPATH}/OPProject/Shell/macro.txt

echo $loginserver>${PROJPATH}/OPProject/Assets/Resources/loginserver.txt

$UNITY2019 -quit -batchmode -projectPath $PROJPATH/OPProject -logFile /tmp/android_debug_${uid}.log -executeMethod JenkinsBuild.BuildAndroid 

if [ $? -ne 0 ]; then
	echo "打包失败"
	cd `dirname $0`
    sh build_log.sh android_debug_${uid}.log ${PROJPATH}/OPProject
    exit 1
fi

cd ${PROJPATH}/OPProject/Android/

mv ${TARGET_PRE} ${TARGET} || { echo "not found build apk, Sorry!"; cd `dirname $0`; sh build_log.sh android_debug_${uid}.log ${PROJPATH}/OPProject; exit 1; }

cd `dirname $0`

sh upload.sh ${PROJPATH}/OPProject ${TARGET}

sh qrcode.sh ${TARGET}

sh build_log.sh android_debug_${uid}.log ${PROJPATH}/OPProject

