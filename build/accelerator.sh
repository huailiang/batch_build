#!/bin/bash


# ==============================================
# git operation
# Author: Huailiang.Peng
# ==============================================


cd /Applications/Unity2019/accelerator

echo -e "\n开始清理accelerator环境"

launchctl unload unity-accelerator.plist 

echo "accelerator 启动中..."

launchctl load unity-accelerator.plist


echo "accelerator 启动完毕, 链接: http://10.253.48.151:8090/dashboard"

echo -e "\n当前Unity相关进程:"

launchctl list | grep com.unity