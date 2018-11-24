# ==============================================
# This tool is for Create iOS test ipa
# ----------------------------------------------
# Author: Huailiang.Peng
# Data:   2018.05.28
# Func:   批量自动打包 
# ==============================================
#!/bin/sh


SHA=${1}

TARGET=ios_${SHA}.ipa

#-----------Config-----------#

echo "打包参数 tag is:"${SHA}" macro:"${macro}

cd `dirname $0`

sh git_tag.sh ${PROJPATH} ${SHA}

cd ${PROJPATH}/CFDemoProject

security unlock-keychain -p 111111 ~/Library/Keychains/login.keychain

security set-keychain-setting -t 10800 -l ~/Library/Keychains/login.keychain


### build xcode proj ###

echo "将Unity导出成Xcode工程"

rm -rf $PACK_PATH

echo "ProjectPath:"/$PROJPATH

echo $macro>${PROJPATH}/CFDemoProject/Shell/macro.txt

$UNITY -projectPath $PROJPATH/CFDemoProject  -logFile /tmp/ios_${SHA}.log -executeMethod JenkinsBuild.BuildIOS -quit -batchmode

cd $PACK_PATH || { echo "build xcode proj failed, error log:"; tail -n 400 /tmp/ios_${SHA}.log; exit 1; }

echo "Xcode工程生成完毕"

rm -rf *.ipa

rm -rf *.xcarchive

echo "xcodebuild clean"

xcodebuild clean -quiet

echo "xcodebuild archive"

xcodebuild archive -quiet -project Unity-iPhone.xcodeproj -scheme Unity-iPhone -archivePath Unity-iPhone.xcarchive  CODE_SIGN_STYLE="Manual" CODE_SIGN_IDENTITY="$CODE_SIGN_IDENTITY" PROVISIONING_PROFILE_SPECIFIER="$PROVISIONING_PROFILE_NAME"

#xcode8 or xcode8 earlier
#xcodebuild -exportArchive -archivePath Unity-iPhone.xcarchive -exportPath ${PACK_PATH}/longzhigu_ios_${uid}_${branch}.ipa -exportFormat ipa CODE_SIGN_IDENTITY=$CODE_SIGN_IDENTITY -exportProvisioningProfile "$PROVISIONING_PROFILE_NAME"

echo "++++++++++++++ xcodebuild export +++++++++++++++++++"

#xcode9 and later
xcodebuild -quiet -exportArchive -archivePath Unity-iPhone.xcarchive -exportPath ${PACK_PATH}/ipa  -exportOptionsPlist ${PLIST_PATH}

OUTPUT=${PACK_PATH}/ipa

if [ ! -d "$OUTPUT" ]; then  
	echo "not found build folfer, sorry"
	exit 1
fi

cd ipa

mv Unity-iPhone.ipa ~/Desktop/${TARGET}

