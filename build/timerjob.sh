#!/bin/bash

# ==============================================
# 定时触发任务 timer
# 	https://my.oschina.net/shede333/blog/470377
# 
#  plist 放置： ~/Library/LaunchAgents 由用户自己定义的任务项
#  生成日志目录 /tmp/run-out.log
#  plist里的参数 arg1: branch  arg2: loginserver
# ==============================================

echo "参数个数: "$#

time=$(date "+%H%M%S")

branch=${1}

loginserver=${2}

echo "timer job branch:"${1}"loginserver: "${2}"current time: "${time}

CRUMB=$(curl -s 'http://admin:dd77a8398f73b706a001855afa7cb581@127.0.0.1:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')

function ontriger()
{
	echo "triger: "${1}" crumb:"${CRUMB}
	curl -v -X POST -H ${CRUMB} -H 'Content-Type: application/json' --user admin:admin http://127.0.0.1:8080/job/${1}/buildWithParameters?branch=${branch}\&clean=true\&token=abc123\&loginserver=${loginserver}
}

if [[ ${time} > 030000 ]]; then
	if [[ ${time} < 040000 ]]; then
		ontriger "航海王-IOS"
	elif [[ ${time} < 050000 ]]; then
		ontriger "航海王-Android"
	elif [[ ${time} < 060000 ]]; then
		ontriger "航海王-Win"
	fi
fi
