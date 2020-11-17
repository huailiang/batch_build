# ==============================================
# This tool is for Create iOS test ipa
# ----------------------------------------------
# Auth:   Huailiang.Peng
# Data:   2019.08.26
# ==============================================
#!/bin/sh

#游戏工程目录#
PROJPATH=/Users/penghuailiang/Documents/projects/op_ios

PACK_PATH=/Users/penghuailiang/Documents/projects/op_ios/OPProject/IOS/cfgame

PLIST_PATH=/Users/penghuailiang/Documents/shells/ExportOptions.plist

CODE_SIGN_IDENTITY="iPhone Developer: xutao rong (DK7RY25K26)"

PROVISIONING_PROFILE_NAME="cfgame"

TARGET=ios_${uid}_${branch}.ipa

#-----------Config-----------#

echo -e "打包参数: \n - uid:  "${uid}" \n - 分支: "${branch}" \n - 编译宏: "${macro}" \n - 登录服: "${loginserver}" \n"

cd `dirname $0`

sh clean_bundle.sh ${PROJPATH}/OPProject

sh -e git.sh ${PROJPATH} 

sh -e build_ios_ecs.sh ${PROJPATH}/OPProject

cd ${PROJPATH}/OPProject

# -p 后面跟的是密码，各机器可能不一样，要修改
security unlock-keychain -p 111111 ~/Library/Keychains/login.keychain

security set-keychain-setting -t 14400 -l ~/Library/Keychains/login.keychain


### build xcode proj ###

rm -rf $PACK_PATH

echo ${branch}"-"${uid}>${PROJPATH}/OPProject/Assets/Resources/packinfo.txt

echo $macro>${PROJPATH}/OPProject/Shell/macro.txt

echo $loginserver>${PROJPATH}/OPProject/Assets/Resources/loginserver.txt

echo "Unity开始导出资源"

$UNITY2019 -projectPath $PROJPATH/OPProject  -logFile /tmp/ios_debug_${uid}.log -executeMethod JenkinsBuild.BuildIOS -quit -batchmode -nographics

cd $PACK_PATH || { echo "build xcode proj failed, error log:"; cd `dirname $0`; sh build_log.sh ios_debug_${uid}.log ${PROJPATH}/OPProject; exit 1; }

rm -rf *.ipa

rm -rf *.xcarchive

# xcodebuild clean -quiet
rm -rf ~/Library/Developer/Xcode/DerivedData/*

echo "xcodebuild archive"

xcodebuild archive -quiet -project Unity-iPhone.xcodeproj \
		-scheme Unity-iPhone \
		-archivePath Unity-iPhone.xcarchive  \
		DWARF_DSYM_FOLDER_PATH=$(PWD) \
		CODE_SIGN_STYLE="Manual" \
		CODE_SIGN_IDENTITY="$CODE_SIGN_IDENTITY" \
		# PROVISIONING_PROFILE_SPECIFIER="$PROVISIONING_PROFILE_NAME"

#xcode8 or xcode8 earlier
#xcodebuild -exportArchive -archivePath Unity-iPhone.xcarchive -exportPath ${PACK_PATH}/longzhigu_ios_${uid}_${branch}.ipa -exportFormat ipa CODE_SIGN_IDENTITY=$CODE_SIGN_IDENTITY -exportProvisioningProfile "$PROVISIONING_PROFILE_NAME"

#xcode9 and later
xcodebuild -quiet -exportArchive -archivePath Unity-iPhone.xcarchive -exportPath ${PACK_PATH}/ipa  -exportOptionsPlist ${PLIST_PATH}

OUTPUT=${PACK_PATH}/ipa

if [ ! -d "$OUTPUT" ]; then  
	echo "not found build folfer, sorry"
	sh build_log.sh ios_debug_${uid}.log ${PROJPATH}/OPProject
	exit 1
fi

cd ipa

mv Unity-iPhone.ipa ${TARGET}

cd `dirname $0`

sh symbol.sh ${PROJPATH}/OPProject

sh upload.sh ${PROJPATH}/OPProject ${TARGET}

sh build_log.sh ios_debug_${uid}.log ${PROJPATH}/OPProject
