# ==============================================
# This tool is obtain the lastest xcode proj for debug
# ----------------------------------------------
# Auth:   Huailiang.Peng
# Data:   2019.01.08
# ==============================================
#!/bin/bash 


#游戏工程目录#
PROJPATH=/Users/penghuailiang/Documents/projects/op_ios/OPProject/IOS

TARGET=xcode_proj.zip

cd /Library/WebServer/Documents/xcode/

rm *.zip

cd ${PROJPATH}

cd cfgame

echo "正在预处理，删除build生成的信息"

rm -rf *.dSYM

rm -rf build/

rm -rf ipa/

cd ../

echo "预处理完毕，正在生成zip包 稍后"

zip -qr ${TARGET} cfgame/ || { echo "not found xcode_proj, Sorry!"; exit 1; }

mv ${TARGET} /Library/WebServer/Documents/xcode/

echo "上传完毕，点击链接下载：http://10.253.48.151/xcode/"${TARGET}

