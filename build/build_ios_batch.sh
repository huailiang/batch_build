# ==============================================
# This tool is for Create iOS test ipa
# ----------------------------------------------
# Author: Huailiang.Peng
# Data:   2018.05.28
# Func:   批量自动打包 
# 从commits文件按行读取提交sha值 在每个节点出包
# ==============================================

#!/bin/sh

export PROJPATH=/Users/penghuailiang/Documents/projects/CFDemoRes

export PACK_PATH=/Users/penghuailiang/Documents/projects/CFDemoRes/CFDemoProject/IOS/cfgame

export PLIST_PATH=/Users/penghuailiang/Documents/shells/ExportOptions.plist

export CODE_SIGN_IDENTITY="iPhone Distribution: Shanghai Jiang You Information Technology Company Limited"

export PROVISIONING_PROFILE_NAME="JoyYouUniversal"

export macro="FMOD_LIVEUPDATE"


cat commits | while read line
do
    sh build_ios_sha.sh ${line}
    echo "*********************"
done
