# ==============================================
# This tool is for Create iOS test ipa
# ----------------------------------------------
# Author: Huailiang.Peng
# Data:   2016.05.25
# ==============================================
#!/bin/sh


export branch=OB
export uid=10000001
export email=""
export macro="FMOD_LIVEUPDATE"

export PROJPATH=/Users/penghuailiang/Documents/projects/CFDemoRes

export PACK_PATH=/Users/penghuailiang/Documents/projects/CFDemoRes/CFDemoProject/IOS/cfgame

export PLIST_PATH=/Users/penghuailiang/Documents/shells/ExportOptions.plist

export CODE_SIGN_IDENTITY="iPhone Distribution: Shanghai Jiang You Information Technology Company Limited"

export PROVISIONING_PROFILE_NAME="JoyYouUniversal"


# uid获取当前时间
uid=$(date +"%Y%m%d%H%M%S")

read -p "请输入分支名:" branch

echo ${uid}" branch"${branch}

sh build_ios.sh