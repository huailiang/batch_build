#!/bin/bash

# ==============================================
# 定时触发任务 timer
# 	https://my.oschina.net/shede333/blog/470377
# 
#  plist 放置： ~/Library/LaunchAgents 由用户自己定义的任务项
#  查看进程是否开启： launchctl list | grep com.pwrd
# ==============================================

echo "参数 branch: "${branch}" loginserver: "${loginserver}


cd `dirname $0`

# 强制关闭服务
launchctl unload timer.plist

/usr/libexec/PlistBuddy -c "Set :ProgramArguments:1 ${branch}" timer.plist

/usr/libexec/PlistBuddy -c "Set :ProgramArguments:2 ${loginserver}" timer.plist

# 开启服务
launchctl load timer.plist

launchctl list | grep com.pwrd

