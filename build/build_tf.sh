
# ==============================================
# Make testflight's configution on ios 
# ----------------------------------------------
# Author: Huailiang.Peng
# Data:   2020.03.13
# ==============================================
#!/bin/bash

PROJPATH=/Users/penghuailiang/Documents/projects/op_ios

PACK_PATH=/Users/penghuailiang/Documents/projects/op_ios/OPProject/IOS/cfgame

PLIST_PATH=/Users/penghuailiang/Documents/shells/ExportOptions-tf.plist

PBX=${PACK_PATH}/Unity-iPhone.xcodeproj/project.pbxproj 

PLIST=${PACK_PATH}/Info.plist

echo $PBX

CODE_SIGN_IDENTITY="iPhone Distribution: Beijing Perfect World Software Technology Development Co., Ltd. (RPQM55T9QE)"

PROVISIONING_PROFILE_NAME="luoqiDis"

TARGET=ios__${version}__${build}.ipa


if [[ ! -f ${PBX} ]]; then
	#statements
	echo "not found xcodeproj"
	exit 101
fi

echo "打包参数 version is:"${version}" build is:"${build}

# -p 后面跟的是密码，各机器可能不一样，要修改
security unlock-keychain -p 111111 ~/Library/Keychains/login.keychain

security set-keychain-setting -t 14400 -l ~/Library/Keychains/login.keychain

sed -i "" "s/com.ningyunet.cfgame/com.pwrd.luoqi/g" ${PBX}

sed -i "" "s/CURRENT_PROJECT_VERSION = 0.0.0/CURRENT_PROJECT_VERSION = ${build}/g" ${PBX}

sed -i "" "s/MARKETING_VERSION = 0.0.0/MARKETING_VERSION = ${version}/g" ${PBX}

/usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier com.pwrd.luoqi" ${PLIST}

/usr/libexec/PlistBuddy -c "Set :CFBundleVersion ${build}" ${PLIST}

/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString ${version}" ${PLIST}

/usr/libexec/PlistBuddy -c "Set :objects:29B97313FDCFA39411CA2CEA:attributes:TargetAttributes:1D6058900D05DD3D006BFB54:SystemCapabilities:com.apple.Push:enabled 1" ${PBX}

cd $PACK_PATH 

rm -rf *.ipa

rm -rf *.xcarchive

echo "xcodebuild clean"

xcodebuild clean -quiet
rm -rf ~/Library/Developer/Xcode/DerivedData/*

echo "xcodebuild archive"

xcodebuild archive -quiet -project Unity-iPhone.xcodeproj \
		-scheme Unity-iPhone \
		-archivePath Unity-iPhone.xcarchive  \
		DWARF_DSYM_FOLDER_PATH=$(PWD) \
		CODE_SIGN_STYLE="Manual" \
		CODE_SIGN_IDENTITY="$CODE_SIGN_IDENTITY" \
		PROVISIONING_PROFILE_SPECIFIER="$PROVISIONING_PROFILE_NAME"

echo "++++++++++++++ xcodebuild export +++++++++++++++++++"

#xcode9 and later
xcodebuild -quiet -exportArchive -archivePath Unity-iPhone.xcarchive -exportPath ${PACK_PATH}/ipa  -exportOptionsPlist ${PLIST_PATH}

OUTPUT=${PACK_PATH}/ipa

if [ ! -d "$OUTPUT" ]; then  
	echo "not found build folfer, sorry"
	sh build_log.sh ios_${version}_${build}.log ${PROJPATH}/OPProject
	exit 1
fi

cd ipa

if [ ! -f Unity-iPhone.ipa ]; then
	#statements
	echo "not found ipa builded"
	exit 2
fi

mv Unity-iPhone.ipa ${TARGET}

cd `dirname $0`

sh upload.sh ${PROJPATH}/OPProject ${TARGET} 
